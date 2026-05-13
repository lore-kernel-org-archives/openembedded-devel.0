Return-Path: <f.pflug@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA24CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 14:46:15 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9352.1778683573403280732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 07:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=too many SPF records (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: f.pflug@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1wNAqh-0007kb-9g; Wed, 13 May 2026 16:46:11 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Fabian Pflug <f.pflug@pengutronix.de>
Subject: [meta-oe][PATCH] pkcs11-provider: fix build error on 32 bit systems
Date: Wed, 13 May 2026 16:44:31 +0200
Message-ID: <20260513144559.219437-1-f.pflug@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 14:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126974

PKCS11 Provider did not build on 32 bit systems. Fixed Upstream with
https://github.com/openssl-projects/pkcs11-provider/pull/689

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 ...-Fix-i686-build-failures-in-cipher.c.patch | 62 +++++++++++++++++++
 .../pkcs11-provider/pkcs11-provider_1.2.bb    |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch

diff --git a/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch b/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch
new file mode 100644
index 0000000000..479608b8f3
--- /dev/null
+++ b/meta-oe/recipes-support/pkcs11-provider/files/0001-Fix-i686-build-failures-in-cipher.c.patch
@@ -0,0 +1,62 @@
+From aec4fe7e3c4d18cd5d0f98168df5884a141c6b69 Mon Sep 17 00:00:00 2001
+From: Simo Sorce <simo@redhat.com>
+Date: Thu, 19 Feb 2026 16:08:56 -0500
+Subject: [PATCH] Fix i686 build failures in cipher.c
+
+Update AEAD functions to use CK_ULONG pointers for lengths and
+introduce a temporary size_t variable for OSSL_PARAM calls. This
+corrects pointer type mismatches that caused build failures in
+Fedora Rawhide i686 scratch builds.
+
+Upstream-Status: Backport [aec4fe7e3c4d18cd5d0f98168df5884a141c6b69]
+
+Signed-off-by: Simo Sorce <simo@redhat.com>
+---
+ src/cipher.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/cipher.c b/src/cipher.c
+index faaa51b..4ccd3ad 100644
+--- a/src/cipher.c
++++ b/src/cipher.c
+@@ -867,7 +867,7 @@ static CK_RV tls_aead_get_data(CK_MECHANISM_PTR mech, data_buffer *explicitiv,
+ 
+ static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *cctx,
+                           const unsigned char **in, size_t *inl,
+-                          unsigned char **out, size_t *outl)
++                          unsigned char **out, CK_ULONG *outl)
+ {
+     data_buffer iv = { 0 };
+     data_buffer tag = { 0 };
+@@ -906,7 +906,7 @@ static CK_RV tls_pre_aead(struct p11prov_cipher_ctx *cctx,
+ }
+ 
+ static CK_RV tls_post_aead(struct p11prov_cipher_ctx *cctx, unsigned char *out,
+-                           size_t *outl)
++                           CK_ULONG *outl)
+ {
+     data_buffer explicitiv = { 0 };
+     data_buffer tag = { 0 };
+@@ -1475,15 +1475,16 @@ static int p11prov_common_set_ctx_params(void *vctx, const OSSL_PARAM params[])
+                 return RET_OSSL_ERR;
+             }
+ 
+-            int ret = OSSL_PARAM_get_octet_string(
+-                p, (void **)&gcm->pIv, gcm->ulIvLen, &gcm->ulIvFixedBits);
++            size_t iv_size;
++            int ret = OSSL_PARAM_get_octet_string(p, (void **)&gcm->pIv,
++                                                  gcm->ulIvLen, &iv_size);
+             if (ret != RET_OSSL_OK || gcm->pIv == NULL) {
+                 P11PROV_raise(ctx->provctx, CKR_HOST_MEMORY,
+                               "Memory allocation failed");
+                 return RET_OSSL_ERR;
+             }
+ 
+-            gcm->ulIvFixedBits = BYTES_TO_BITS(gcm->ulIvFixedBits);
++            gcm->ulIvFixedBits = BYTES_TO_BITS(iv_size);
+             gcm->ivGenerator = CKG_GENERATE_COUNTER;
+         } else {
+             P11PROV_raise(ctx->provctx, CKR_MECHANISM_PARAM_INVALID,
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
index 1bdb4445e5..d95706d9e3 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.2.bb
@@ -19,6 +19,7 @@ SRCREV = "c7a5c8b62a0ff012b16574f01651254ef7e664ee"
 
 SRC_URI = "git://github.com/latchset/${BPN}.git;branch=main;protocol=https"
 
+SRC_URI += "file://0001-Fix-i686-build-failures-in-cipher.c.patch"
 
 inherit meson pkgconfig
 
-- 
2.47.3


