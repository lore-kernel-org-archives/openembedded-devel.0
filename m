Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0FE7792B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:09:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8PD9LQ0019689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Sep 2018 06:09:32 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 06:09:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Sep 2018 21:19:07 +0800
Message-ID: <1537881550-13954-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] mailx: support openssl 1.1.x
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
X-List-Received-Date: Tue, 25 Sep 2018 13:09:56 -0000
Content-Type: text/plain

Long time no maintain from upstream since 2013-06-04,
backport a fix from openSUSE

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../mailx/files/0001-support-openssl-1.1.x.patch   | 72 ++++++++++++++++++++++
 meta-oe/recipes-extended/mailx/mailx_12.5-5.bb     |  3 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.1.x.patch

diff --git a/meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.1.x.patch b/meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.1.x.patch
new file mode 100644
index 0000000..6a8911d
--- /dev/null
+++ b/meta-oe/recipes-extended/mailx/files/0001-support-openssl-1.1.x.patch
@@ -0,0 +1,72 @@
+From 7db6d8a657d13bb562a27c6181accaf3e53c0efd Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 25 Sep 2018 14:03:10 +0800
+Subject: [PATCH] support openssl 1.1.x
+
+Long time no maintain from upstream since 2013-06-04
+(https://sourceforge.net/projects/nail/), backport a
+fix from openSUSE
+
+Upstream-Status: Backport [openSUSE]
+https://build.opensuse.org/package/view_file/openSUSE:Leap:15.0/mailx/mailx-12.5-openssl-1.1.0f.patch?expand=1
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ openssl.c | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/openssl.c b/openssl.c
+index 44fe4e5..0ccc517 100644
+--- a/openssl.c
++++ b/openssl.c
+@@ -137,7 +137,12 @@ ssl_rand_init(void)
+ 
+ 	if ((cp = value("ssl-rand-egd")) != NULL) {
+ 		cp = expand(cp);
+-		if (RAND_egd(cp) == -1) {
++#ifndef OPENSSL_NO_EGD
++		if (RAND_egd(cp) == -1)
++#else
++		if (1)
++#endif
++		{
+ 			fprintf(stderr, catgets(catd, CATSET, 245,
+ 				"entropy daemon at \"%s\" not available\n"),
+ 					cp);
+@@ -216,6 +221,7 @@ ssl_select_method(const char *uhp)
+ 
+ 	cp = ssl_method_string(uhp);
+ 	if (cp != NULL) {
++#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x1010006fL
+ 		if (equal(cp, "ssl3"))
+ 			method = SSLv3_client_method();
+ 		else if (equal(cp, "tls1"))
+@@ -225,8 +231,25 @@ ssl_select_method(const char *uhp)
+ 					"Invalid SSL method \"%s\"\n"), cp);
+ 			method = SSLv23_client_method();
+ 		}
++#else
++		method = NULL;
++		if (equal(cp, "tls"))
++			method = TLS_client_method();
++		else if (equal(cp, "dtls"))
++			method = DTLS_client_method();
++
++		if (!method) {
++			fprintf(stderr, catgets(catd, CATSET, 244,
++					"Invalid SSL method \"%s\"\n"), cp);
++			method = TLS_client_method();
++		}
++#endif
+ 	} else
++#if defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x1010006fL
+ 		method = SSLv23_client_method();
++#else
++		method = TLS_client_method();
++#endif
+ 	return method;
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb b/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
index 0a191a0..4161ea6 100644
--- a/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta-oe/recipes-extended/mailx/mailx_12.5-5.bb
@@ -9,7 +9,7 @@ SECTION = "console/network"
 LICENSE = "BSD & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
-DEPENDS = "openssl10"
+DEPENDS = "openssl"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.gz;name=archive \
            file://0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch \
@@ -21,6 +21,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/
            file://0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch \
            file://0015-usr-sbin-sendmail.patch \
            file://explicitly.disable.krb5.support.patch \
+           file://0001-support-openssl-1.1.x.patch \
           "
 
 SRC_URI[archive.md5sum] = "29a6033ef1412824d02eb9d9213cb1f2"
-- 
2.7.4


