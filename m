Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9416010B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 13:41:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4BDfdBN016876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 06:41:39 -0700
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 11 May 2016 06:41:38 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 May 2016 16:45:33 +0300
Message-ID: <1462974333-13201-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] proftpd: fix mod_tls build issue
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
X-List-Received-Date: Wed, 11 May 2016 13:41:39 -0000
Content-Type: text/plain

Backported upstream commit:
https://github.com/proftpd/proftpd/commit/253e6ef6a4fde5545111f7c439a9692afecc597b

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../proftpd/files/Fix-build-errors.patch           | 64 ++++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch b/meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch
new file mode 100644
index 0000000..3b98560
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch
@@ -0,0 +1,64 @@
+From 253e6ef6a4fde5545111f7c439a9692afecc597b Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Thu, 10 Mar 2016 15:17:50 -0800
+Subject: [PATCH] Fix build errors; used wrong variable name, and pushed
+ without building.  Shame.
+
+Upstream-Status: Backport
+
+Author: TJ Saunders <tj@castaglia.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ contrib/mod_tls.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/contrib/mod_tls.c b/contrib/mod_tls.c
+index c557454..ecd9f56 100644
+--- a/contrib/mod_tls.c
++++ b/contrib/mod_tls.c
+@@ -2423,7 +2423,7 @@ static int tls_ctrl_renegotiate_cb(CALLBACK_FRAME) {
+ }
+ #endif
+ 
+-static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
++static DH *tls_dh_cb(SSL *ssl, int is_export, int keylen) {
+   DH *dh = NULL;
+   EVP_PKEY *pkey;
+   int pkeylen = 0, use_pkeylen = FALSE;
+@@ -2597,7 +2597,7 @@ static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
+ }
+ 
+ #ifdef PR_USE_OPENSSL_ECC
+-static EC_KEY *tls_ecdh_cb(SSL *ssl, int is_export, int keylength) {
++static EC_KEY *tls_ecdh_cb(SSL *ssl, int is_export, int keylen) {
+   static EC_KEY *ecdh = NULL;
+   static int init = 0;
+ 
+@@ -5064,7 +5064,7 @@ static ssize_t tls_read(SSL *ssl, void *buf, size_t len) {
+   return count;
+ }
+ 
+-static RSA *tls_rsa_cb(SSL *ssl, int is_export, int keylength) {
++static RSA *tls_rsa_cb(SSL *ssl, int is_export, int keylen) {
+   BIGNUM *e = NULL;
+ 
+   if (tls_tmp_rsa) {
+@@ -5082,13 +5082,13 @@ static RSA *tls_rsa_cb(SSL *ssl, int is_export, int keylength) {
+     return NULL;
+   }
+ 
+-  if (RSA_generate_key_ex(tls_tmp_rsa, keylength, e, NULL) != 1) {
++  if (RSA_generate_key_ex(tls_tmp_rsa, keylen, e, NULL) != 1) {
+     BN_free(e);
+     return NULL;
+   }
+ 
+ #else
+-  tls_tmp_rsa = RSA_generate_key(keylength, RSA_F4, NULL, NULL);
++  tls_tmp_rsa = RSA_generate_key(keylen, RSA_F4, NULL, NULL);
+ #endif /* OpenSSL version 0.9.8 and later */
+ 
+   if (e != NULL) {
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
index cdf71e7..7b8a102 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            file://CVE-2016-3125.patch \
+           file://Fix-build-errors.patch \
            "
 
 SRC_URI[md5sum] = "b9d3092411478415b31d435f8e26d173"
-- 
2.7.4


