Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 47A9B605D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:40:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98914294"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 11:44:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R3d2R6026297
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 11:39:02 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 11:40:52 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jul 2015 11:40:44 +0800
Message-ID: <1437968444-2094-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] openldap: upgrade 2.4.40 -> 2.4.41
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jul 2015 03:41:02 -0000
Content-Type: text/plain

1) Dropped backported patches(commit-id):
-0001-ITS-8027-require-non-empty-AttributeList.patch(c32e747)
-0001-ITS-8046-fix-vrFilter_free.patch(2f1a2dd)

2) Update the checksum of COPYRIGHT,since the date in it has been changed,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...-ITS-8027-require-non-empty-AttributeList.patch | 30 -----------------
 .../0001-ITS-8046-fix-vrFilter_free.patch          | 38 ----------------------
 .../{openldap-2.4.40 => openldap}/initscript       |  0
 .../install-strip.patch                            |  0
 .../{openldap-2.4.40 => openldap}/kill-icu.patch   |  0
 .../openldap-2.4.28-gnutls-gcrypt.patch            |  0
 .../openldap-m4-pthread.patch                      |  0
 .../{openldap-2.4.40 => openldap}/slapd.service    |  0
 .../thread_stub.patch                              |  0
 .../use-urandom.patch                              |  0
 .../{openldap_2.4.40.bb => openldap_2.4.41.bb}     |  8 ++---
 11 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/initscript (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/install-strip.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/kill-icu.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/openldap-2.4.28-gnutls-gcrypt.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/openldap-m4-pthread.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/slapd.service (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/thread_stub.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.40 => openldap}/use-urandom.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.40.bb => openldap_2.4.41.bb} (96%)

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch
deleted file mode 100644
index 91c2178..0000000
--- a/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c32e74763f77675b9e144126e375977ed6dc562c Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Mon, 19 Jan 2015 22:25:53 +0000
-Subject: [PATCH] ITS#8027 require non-empty AttributeList
-
-Upstream-Status: Backup
-
-Fix the CVE: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1545
-
----
- servers/slapd/overlays/deref.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/servers/slapd/overlays/deref.c b/servers/slapd/overlays/deref.c
-index 9420e3e..05aa890 100644
---- a/servers/slapd/overlays/deref.c
-+++ b/servers/slapd/overlays/deref.c
-@@ -183,7 +183,8 @@ deref_parseCtrl (
- 		ber_len_t cnt = sizeof(struct berval);
- 		ber_len_t off = 0;
- 
--		if ( ber_scanf( ber, "{m{M}}", &derefAttr, &attributes, &cnt, off ) == LBER_ERROR )
-+		if ( ber_scanf( ber, "{m{M}}", &derefAttr, &attributes, &cnt, off ) == LBER_ERROR
-+			|| !cnt )
- 		{
- 			rs->sr_text = "Dereference control: derefSpec decoding error";
- 			rs->sr_err = LDAP_PROTOCOL_ERROR;
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch
deleted file mode 100644
index 8a5c95f..0000000
--- a/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2f1a2dd329b91afe561cd06b872d09630d4edb6a Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Wed, 4 Feb 2015 02:03:55 +0000
-Subject: [PATCH] ITS#8046 fix vrFilter_free
-
-Upstream-Statue: Backup
-
-Fix CVE: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1546
-
----
- servers/slapd/filter.c | 10 +++-------
- 1 file changed, 3 insertions(+), 7 deletions(-)
-
-diff --git a/servers/slapd/filter.c b/servers/slapd/filter.c
-index b859f73..22c81c8 100644
---- a/servers/slapd/filter.c
-+++ b/servers/slapd/filter.c
-@@ -1158,14 +1158,10 @@ get_vrFilter( Operation *op, BerElement *ber,
- void
- vrFilter_free( Operation *op, ValuesReturnFilter *vrf )
- {
--	ValuesReturnFilter	*p, *next;
-+	ValuesReturnFilter	*next;
- 
--	if ( vrf == NULL ) {
--		return;
--	}
--
--	for ( p = vrf; p != NULL; p = next ) {
--		next = p->vrf_next;
-+	for ( ; vrf != NULL; vrf = next ) {
-+		next = vrf->vrf_next;
- 
- 		switch ( vrf->vrf_choice & SLAPD_FILTER_MASK ) {
- 		case LDAP_FILTER_PRESENT:
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/initscript b/meta-oe/recipes-support/openldap/openldap/initscript
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/initscript
rename to meta-oe/recipes-support/openldap/openldap/initscript
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/install-strip.patch b/meta-oe/recipes-support/openldap/openldap/install-strip.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/install-strip.patch
rename to meta-oe/recipes-support/openldap/openldap/install-strip.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/kill-icu.patch b/meta-oe/recipes-support/openldap/openldap/kill-icu.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/kill-icu.patch
rename to meta-oe/recipes-support/openldap/openldap/kill-icu.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-2.4.28-gnutls-gcrypt.patch
rename to meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-m4-pthread.patch
rename to meta-oe/recipes-support/openldap/openldap/openldap-m4-pthread.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/slapd.service b/meta-oe/recipes-support/openldap/openldap/slapd.service
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/slapd.service
rename to meta-oe/recipes-support/openldap/openldap/slapd.service
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/thread_stub.patch b/meta-oe/recipes-support/openldap/openldap/thread_stub.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/thread_stub.patch
rename to meta-oe/recipes-support/openldap/openldap/thread_stub.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap/use-urandom.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.40/use-urandom.patch
rename to meta-oe/recipes-support/openldap/openldap/use-urandom.patch
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.40.bb b/meta-oe/recipes-support/openldap/openldap_2.4.41.bb
similarity index 96%
rename from meta-oe/recipes-support/openldap/openldap_2.4.40.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.41.bb
index 5afcb6a..e4a928f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.40.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.41.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f2bdbaa4f50199a00b6de2ca7ec1db05 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9d845a25aef97da753144f1dacbf680c \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
 "
 SECTION = "libs"
@@ -24,11 +24,9 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://initscript \
     file://slapd.service \
     file://thread_stub.patch \
-    file://0001-ITS-8027-require-non-empty-AttributeList.patch \
-    file://0001-ITS-8046-fix-vrFilter_free.patch \
 "
-SRC_URI[md5sum] = "423c1f23d2a0cb96b3e9baf7e9d7dda7"
-SRC_URI[sha256sum] = "d12611a5c25b6499293c2bb7b435dc2b174db73e83f5a8cb7e34f2ce5fa6dadb"
+SRC_URI[md5sum] = "3f1a4cea52827e18feaedfdc1634b5d0"
+SRC_URI[sha256sum] = "27856bb4a8b44feca2b326c309000e16a9dadd52362c8ab6eec6c67a43737f6e"
 
 DEPENDS = "util-linux groff-native"
 
-- 
1.8.4.2


