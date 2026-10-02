Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BD6CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:57:02 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15695.1790956272214175437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=HiT9Qh67;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: bst@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4546520007B;
	Fri, 02 Oct 2026 17:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790956270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1wlltyFol3UD7STzUVi69oMwUCAsXv+2M/lws0Xn9lU=;
	b=HiT9Qh67ZiJ1TM9ZBrW5B1dUlbQNzC4ExQBT33mh4Qnr4q3UZfCCVWmOEGv13KEa+xORVq
	Ty4+Rtt0xVKXnfpWcka7V/Dt8XrYYSDe51oQQyvsJlAX1m71nCcbgnO7IqywIXKjTUXHdH
	Y/DnpKu17pdSMWUX/cWsofk6mCr0QHXKo2uLBPxd9g+qHOykM/WFyhdsr4QwV/wZDRxqpg
	977uYGobBN6N9PYuJgBM5qNDvI1SAZUxhqqkoI8GTJ1uPJD/iytP/115JV+fPExF1yOtFo
	c+9zppXWnAIEIvXFMbS2VL0E6vCab9AdSzK2zHw+4w3uB76S+vC+I25cWj/d7Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790956270; a=rsa-sha256;
	cv=none;
	b=E3WbQNYCMbYvnUP8fJ0nzzEzOIdvOivjDydbYFJZG5scVbiZ7bAWDHno39SIb6iZ9VgGOw
	NLbIbhIAMajt7t1GbTj5IUsri+glg83NXQcqtsl2K1mZ39XVQ/iPn5lYcgf1WoXlC3+STB
	Nri/d16nb+YWAlSO9grSdEOWPEm6MmbSFJJXIzcm0dm9Y36gIx/Bj1bU3pYias67UzUUpY
	U2/nff3KJJilQD/WkMZvftj8nJ4gAJB0BkVP/u8lQU0LirPdZG1Kn5oSFe4wXAYVQ8rvhL
	7TofZHsvxLFttMx3t6Lm3WWvPdD7dZMNhNcSGaJnUtZbyw04znm8v8hejkBDdg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=bst@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790956270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1wlltyFol3UD7STzUVi69oMwUCAsXv+2M/lws0Xn9lU=;
	b=cprC0wXpYuWRFg/QqxhyC5DWQXUqn0xtbM5sL83x2wvBxaD3bl6tWPZ4V+P2Bv1Ya1FCF5
	V3XZ1XJDa6Tu4WY4PIBnN8TjZi/biky2uU1y5O/ADpu1k7L54DYls0r9GiDEfJWPPeD0IL
	b+LVQ4v9you482uLYNwwgOyiw5ZnOOwCvfwIwGj86aJY43EGyzzedikrnWmKe/rcgKyPgR
	1Q0LS0uht5cY+zRaFHchYgfIi0BxrFVzVjTbkDyuPNBSa9uHR9f4FwMTxky/0uGHJzR7w5
	kIY8t5IwK6n4rbncjqVj6VjzpwFAihX4yrvoBBjjbKMAA/weYQNTwKOy8NBIww==
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <bst@pengutronix.de>)
	id 1xCfXS-003uoM-0e;
	Fri, 02 Oct 2026 17:51:10 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][PATCH v2 1/2] fitimage.bbclass: document provider-based PKCS#11 signing
Date: Fri,  2 Oct 2026 17:49:02 +0200
Message-ID: <20261002155105.1184924-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 15:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130605

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
Changes since (implicit) v1:
- drop no longer supported pkcs#11 URI from FITIMAGE_SIGN_KEYDIR[doc]
---
 meta-oe/classes/fitimage.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
index 109b3b421b..8a59388008 100644
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
@@ -81,7 +83,7 @@ DEPENDS =3D "u-boot-mkimage-native dtc-native"
 FITIMAGE_SIGN ?=3D "0"
 FITIMAGE_SIGN[doc] =3D "Enable FIT image signing"
 FITIMAGE_SIGN_KEYDIR ?=3D ""
-FITIMAGE_SIGN_KEYDIR[doc] =3D "Key directory or pkcs#11 URI to use for s=
igning configuration"
+FITIMAGE_SIGN_KEYDIR[doc] =3D "Key directory to use for signing configur=
ation"
 FITIMAGE_MKIMAGE_EXTRA_ARGS[doc] =3D "Extra arguemnts to pass to uboot-m=
kimage call"
 FITIMAGE_HASH_ALGO ?=3D "sha256"
 FITIMAGE_HASH_ALGO[doc] =3D "Hash algorithm to use"
--=20
2.47.3


