Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 480 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 Dec 2016 11:54:48 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 484D1719F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 11:54:48 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id uBCBkmOX000790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2016 12:46:48 +0100
Received: from dev.sbt.siemens.com ([163.242.50.172])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id uBCBkmMH014623;
	Mon, 12 Dec 2016 12:46:48 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 878B210876E;
	Mon, 12 Dec 2016 12:46:48 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:46:21 +0100
Message-Id: <1481543181-14178-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-multimedia][PATCH] libupnp: Fix out-of-bound access in create_url_list() (CVE-2016-8863)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2016 11:54:49 -0000

If there is an invalid URL in URLS->buf after a valid one, uri_parse is
called with out pointing after the allocated memory. As uri_parse writes
to *out before returning an error the loop in create_url_list must be
stopped early to prevent an out-of-bound access

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../libupnp/libupnp/CVE-2016-8863.patch            | 57 ++++++++++++++++++++++
 .../recipes-connectivity/libupnp/libupnp_1.6.19.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch
new file mode 100644
index 0000000..abb4a72
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp/CVE-2016-8863.patch
@@ -0,0 +1,57 @@
+libupnp-1.6.19: Fix CVE-2016-8863
+
+[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=1388771
+
+gena_device: Fix out-of-bound access in create_url_list()
+
+If there is an invalid URL in URLS->buf after a valid one, uri_parse is
+called with out pointing after the allocated memory. As uri_parse writes
+to *out before returning an error the loop in create_url_list must be
+stopped early to prevent an out-of-bound access
+
+Upstream-Status: Backported [https://sourceforge.net/p/pupnp/code/ci/9c099c2923ab4d98530ab5204af1738be5bddba7]
+CVE: CVE-2016-8863
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/upnp/src/gena/gena_device.c b/upnp/src/gena/gena_device.c
+index 39edc0b..0fd60ad 100644
+--- a/upnp/src/gena/gena_device.c
++++ b/upnp/src/gena/gena_device.c
+@@ -1133,7 +1133,7 @@ static int create_url_list(
+ 	/*! [out] . */
+ 	URL_list *out)
+ {
+-    size_t URLcount = 0;
++    size_t URLcount = 0, URLcount2 = 0;
+     size_t i;
+     int return_code = 0;
+     uri_type temp;
+@@ -1175,16 +1175,23 @@ static int create_url_list(
+         }
+         memcpy( out->URLs, URLS->buff, URLS->size );
+         out->URLs[URLS->size] = 0;
+-        URLcount = 0;
+         for( i = 0; i < URLS->size; i++ ) {
+             if( ( URLS->buff[i] == '<' ) && ( i + 1 < URLS->size ) ) {
+                 if( ( ( return_code =
+                         parse_uri( &out->URLs[i + 1], URLS->size - i + 1,
+-                                   &out->parsedURLs[URLcount] ) ) ==
++                                   &out->parsedURLs[URLcount2] ) ) ==
+                       HTTP_SUCCESS )
+-                    && ( out->parsedURLs[URLcount].hostport.text.size !=
++                    && ( out->parsedURLs[URLcount2].hostport.text.size !=
+                          0 ) ) {
+-                    URLcount++;
++                    URLcount2++;
++                    if (URLcount2 >= URLcount)
++                        /*
++                         * break early here in case there is a bogus URL that
++                         * was skipped above. This prevents to access
++                         * out->parsedURLs[URLcount] which is beyond the
++                         * allocation.
++                         */
++                        break;
+                 } else {
+                     if( return_code == UPNP_E_OUTOF_MEMORY ) {
+                         free( out->URLs );
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
index 133a8eb..71fc70d 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.6.19.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/${BP}.tar.bz2 \
            file://avoid-redefining-strnlen-and-strndup.patch \
            file://sepbuildfix.patch \
+           file://CVE-2016-8863.patch \
 "
 
 SRC_URI[md5sum] = "ee16e5d33a3ea7506f38d71facc057dd"
-- 
2.1.4


