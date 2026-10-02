Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7520CA5FE2
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:57:02 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15489.1790955722722243404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=SdJvU3+U;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: bst@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C638020007B;
	Fri, 02 Oct 2026 17:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790955719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u3gyGmXhrrE7V3t7DPo6MYY52OHltUJ8IOTyiDpVzTM=;
	b=SdJvU3+UyMDKAp9CCc2JFSq65ZWQG7oNpM+u8KuTgCSG7gspGld9qt1VIuvNSwcGt1Gif1
	64mDFbz+U+Fux6TuXglbwgeMboajGDDw5tSH++x17Vzd+C/dgcqC8RHrycqhW1WyP+kwcR
	Hc3PZ2aF0Cza+7+X3hc3Mo3vyieBGrbJod0rh1e0jNCPBS5IRzU26Z90ntM1DCKcezdCU7
	XQZ403YBGIsV2ak+r+U6X8t9tyQtL9UAo2w6FF7gJvDd/K8w5f2K1H1KwHWVW5K4/mnvqr
	gH3/SkmIh7pOstJsMthlwpV2pMMEDRTqSiA+ujQCfgW8dQyoHBQEPP7Si51yhQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790955719; a=rsa-sha256;
	cv=none;
	b=D+Gn0KFgMTfRjVKTE5cDZ85+SjEGMSpSN+utA249CdSuSU2esaXkaLnzsF6uPVFbwtzf5X
	k+5MAR1k+AbrcZxeubqsz0cLlNZVOHbuxrhdJyRveRIzWhw9/lYWV0Bbjy88KbzSN5+wK1
	aJFIDlUeeV5eA7Z2m7850ZbXTCvOQ0aZ3TZoDaeZ6BeRv4TEeRHvn9n7YFYl53AFXb+id8
	X2dhDnKD72G8HnluTJKFtiuhX1SaV8G67wGwdBYsFL7tWZb9Y9s85TtGx6HfkeRFnybwZ2
	ZgWb5UjgztO2grWTmfIPDenVprzx+41t7pS6HeoQ8V2aVjM1pnBvc6S+Or/9wA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=bst@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790955719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u3gyGmXhrrE7V3t7DPo6MYY52OHltUJ8IOTyiDpVzTM=;
	b=BPdYY/6NQg2uwtNdOpE2oF8m95vohivwTfre6DQgsSYUP+LyVtwEadl0EJVko3gDV0vQaY
	3wy9O+igowjNpGjaz85qKJXTNLCk7UjTpQeoIhdcIbKI8wKDKfqzMKG1js3ZfSrqXYN+b7
	4wKAUaO6cwXORQkQ7IWSSeNl9Ir/9TGLP4hrzEh5nJQgJTCILNVybu5WqOoGTHur6mT8Rs
	L6WIVBNc/BLwDybmf6OErKu7p66O66FJ5G1ZGFdApva0TgvtIKVbXwKlOfEytd2ozTBhWV
	0+ThjrZeSZPDIdMUmPNv6iISOBNUjtwD9/+wiJ8HUaXJvIMoTuUVQNQ0vVEY+Q==
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <bst@pengutronix.de>)
	id 1xCfOZ-003una-2M;
	Fri, 02 Oct 2026 17:41:59 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][PATCH 1/2] fitimage.bbclass: document provider-based PKCS#11 signing
Date: Fri,  2 Oct 2026 17:41:47 +0200
Message-ID: <20261002154148.1181457-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 15:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130604

Now that oe-core moved to OpenSSL 4.0, the engine API is gone.
As a result uboot-mkimage's -N/--engine no longer work:

  Failed to sign 'signature-1' signature node in 'conf-imx6dl-riotboard.d=
tb' conf node
  uboot-mkimage Can't add hashes to FIT blob: -1
  Error: Bad parameters for FIT image type
  Usage: uboot-mkimage [-T type] -l image
            -l =3D=3D> list image header information
            -T =3D=3D> parse image file as 'type'
            -q =3D=3D> quiet

Document the provider-based setup instead: signing_create_uri_pem() wraps
the role's PKCS#11 URI in a PEM file that OpenSSL loads like a key file a=
nd
resolves through the PKCS#11 provider configured by signing_prepare().

mkimage looks for a key in
${FITIMAGE_SIGN_KEYDIR}/${FITIMAGE_SIGN_KEYNAME}.key, so store it there.
This way the existing mkimage invocations do not need to be touched.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta-oe/classes/fitimage.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
index 109b3b421b..69e1c5c7b2 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -58,11 +58,13 @@
 #    do_fitimage:prepend() {
 #        signing_prepare
 #        signing_use_role "${FITIMAGE_SIGNING_KEY_ROLE}"
+#        mkdir -p "${FITIMAGE_SIGN_KEYDIR}"
+#        signing_create_uri_pem "${FITIMAGE_SIGNING_KEY_ROLE}" "${FITIMA=
GE_SIGN_KEYDIR}/${FITIMAGE_SIGN_KEYNAME}.key"
 #    }
 #
 #    FITIMAGE_SIGN =3D "1"
-#    FITIMAGE_MKIMAGE_EXTRA_ARGS =3D "--engine pkcs11"
-#    FITIMAGE_SIGN_KEYDIR =3D "${PKCS11_URI#pkcs11:}"
+#    FITIMAGE_SIGN_KEYDIR =3D "${B}/keys"
+#    FITIMAGE_SIGN_KEYNAME =3D "fit"
=20
=20
 LICENSE ?=3D "MIT"
--=20
2.47.3


