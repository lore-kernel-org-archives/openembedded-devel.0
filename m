Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FA0CDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 13:31:07 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7175.1782307858886566932
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 06:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ixzx/ziZ;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 2D08FE42A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 15:30:56 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.171.242]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcNgn-3u4XMf0; Wed, 24 Jun 2026 15:30:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] librtmp: add a patch to fix build with nettle-4
Date: Wed, 24 Jun 2026 15:30:43 +0200
Message-ID: <20260624133044.1093352-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782307849-027FBA3F-61D59BCA/0/0 CLEAN NORMAL
X-TOI-MSGID: ec533a9e-cf42-44f4-9918-f42e46c0bcc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782307856; i=f_l_k@t-online.de;
	bh=JPXyiIy+fUgnekQ6XLdmbiwd8lD0ksMPGncPLRsE/6Q=;
	h=From:To:Subject:Date;
	b=ixzx/ziZ/CrDeor0g6ja/VCI9L2jkquBojIG95sEiy34OPYjk0K5Q6lcyCvR0XCrG
	 DPsFCGg5ir3IzScfW7nPDlz8PORGA+wcJrBkLsG/w63zfPhs4dhMGipfk5hMVI9lO5
	 ROHZVaCyrNA6ml0DEE5UupQxGNFzWbSgmTP89jcCOMAFmr4b3qgSsBw089Hf21nXh6
	 afM1ejGu5PjXXpxL1pF6a2cplJff0cBVl8Y3hJUI9RMlexG57e24ENCWxjaUOXxhjh
	 DrOCiRryQC/avV9eUcmVaBor3uhNFrt5CIDTHgbtDmD+I+aBHtcZlyPVNdSdxxhMW+
	 Nze9EEUuA8uew==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 13:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127714

This was taken from Archlinux:
https://gitlab.archlinux.org/archlinux/packaging/packages/rtmpdump/-/blob=
/main/nettle-4.patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../rtmpdump/rtmpdump/nettle-4.patch          | 78 +++++++++++++++++++
 .../rtmpdump/rtmpdump_2.6.bb                  |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/=
nettle-4.patch

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/nettle-=
4.patch b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/nettle-4.p=
atch
new file mode 100644
index 0000000000..8850b35d5c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/nettle-4.patch
@@ -0,0 +1,78 @@
+This patch was taken from Archlinux
+
+Upstream-Status: Inappropriate [https://gitlab.archlinux.org/archlinux/p=
ackaging/packages/rtmpdump/-/blob/main/nettle-4.patch]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+diff --git a/librtmp/handshake.h b/librtmp/handshake.h
+index ac38c88..53301c7 100644
+--- a/librtmp/handshake.h
++++ b/librtmp/handshake.h
+@@ -45,6 +45,7 @@ typedef arc4_context *	RC4_handle;
+ #elif defined(USE_GNUTLS)
+ #include <nettle/hmac.h>
+ #include <nettle/arcfour.h>
++#include <nettle/version.h>
+ #ifndef SHA256_DIGEST_LENGTH
+ #define SHA256_DIGEST_LENGTH	32
+ #endif
+@@ -52,7 +53,11 @@ typedef arc4_context *	RC4_handle;
+ #define HMAC_CTX	struct hmac_sha256_ctx
+ #define HMAC_setup(ctx, key, len)	hmac_sha256_set_key(&ctx, len, key)
+ #define HMAC_crunch(ctx, buf, len)	hmac_sha256_update(&ctx, len, buf)
++#if NETTLE_VERSION_MAJOR > 3
++#define HMAC_finish(ctx, dig, dlen)	dlen =3D SHA256_DIGEST_LENGTH; hmac=
_sha256_digest(&ctx, dig)
++#else
+ #define HMAC_finish(ctx, dig, dlen)	dlen =3D SHA256_DIGEST_LENGTH; hmac=
_sha256_digest(&ctx, SHA256_DIGEST_LENGTH, dig)
++#endif
+ #define HMAC_close(ctx)
+=20
+ typedef struct arcfour_ctx*	RC4_handle;
+diff --git a/librtmp/hashswf.c b/librtmp/hashswf.c
+index fc5f824..3ab1d3f 100644
+--- a/librtmp/hashswf.c
++++ b/librtmp/hashswf.c
+@@ -44,6 +44,7 @@
+ #define HMAC_close(ctx)
+ #elif defined(USE_GNUTLS)
+ #include <nettle/hmac.h>
++#include <nettle/version.h>
+ #ifndef SHA256_DIGEST_LENGTH
+ #define SHA256_DIGEST_LENGTH	32
+ #endif
+@@ -51,7 +52,11 @@
+ #define HMAC_CTX	struct hmac_sha256_ctx
+ #define HMAC_setup(ctx, key, len)	hmac_sha256_set_key(&ctx, len, key)
+ #define HMAC_crunch(ctx, buf, len)	hmac_sha256_update(&ctx, len, buf)
++#if NETTLE_VERSION_MAJOR > 3
++#define HMAC_finish(ctx, dig, dlen)	dlen =3D SHA256_DIGEST_LENGTH; hmac=
_sha256_digest(&ctx, dig)
++#else
+ #define HMAC_finish(ctx, dig, dlen)	dlen =3D SHA256_DIGEST_LENGTH; hmac=
_sha256_digest(&ctx, SHA256_DIGEST_LENGTH, dig)
++#endif
+ #define HMAC_close(ctx)
+ #else	/* USE_OPENSSL */
+ #include <openssl/ssl.h>
+diff --git a/librtmp/rtmp.c b/librtmp/rtmp.c
+index cf1de70..a53ed9f 100644
+--- a/librtmp/rtmp.c
++++ b/librtmp/rtmp.c
+@@ -57,6 +57,7 @@ static const char *my_dhm_G =3D "4";
+ #define MD5_DIGEST_LENGTH 16
+ #include <nettle/base64.h>
+ #include <nettle/md5.h>
++#include <nettle/version.h>
+ #else	/* USE_OPENSSL */
+ #include <openssl/ssl.h>
+ #include <openssl/rc4.h>
+@@ -2492,7 +2493,11 @@ b64enc(const unsigned char *input, int length, ch=
ar *output, int maxsize)
+ typedef struct md5_ctx	MD5_CTX;
+ #define MD5_Init(ctx)	md5_init(ctx)
+ #define MD5_Update(ctx,data,len)	md5_update(ctx,len,data)
++#if NETTLE_VERSION_MAJOR > 3
++#define MD5_Final(dig,ctx)	md5_digest(ctx,dig)
++#else
+ #define MD5_Final(dig,ctx)	md5_digest(ctx,MD5_DIGEST_LENGTH,dig)
++#endif
+ #else
+ #endif
+=20
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb =
b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
index c02b45054f..d6c5886b95 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.6.bb
@@ -11,6 +11,7 @@ PV .=3D "+git"
 SRCREV =3D "6f6bb1353fc84f4cc37138baa99f586750028a01"
 SRC_URI =3D " \
     git://git.ffmpeg.org/rtmpdump;branch=3Dmaster \
+    file://nettle-4.patch \
 "
=20
=20
--=20
2.54.0


