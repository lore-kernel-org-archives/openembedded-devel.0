Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3999CA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:57:02 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15452.1790955722722223794
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=SQ5bsNQj;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: bst@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 72D4B201991;
	Fri, 02 Oct 2026 17:42:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790955720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuAMlK/m4XSwNemVqsBnuwn4ZxKp8C/uAZ3aXiQLqAQ=;
	b=SQ5bsNQj/saVCV94gMR3TrAXjyF+NNVSA+jg3cb3aSLurSoiI7oDhGevCKXBJo+qU85YUz
	VLkPTbvWBHePqaPEko2w0wMlhujK5Y1WFUtYlfcCo5MfrdpU53lzkhqUMEicwJZpgnhsF6
	jELNkSWEeSabO7AwM9Rzw3N6PI5rxSeyNeA8Ayp1SXnURkWGcAzBCcnreAcmSPF7OHGWBM
	6RoIL6d7zAOSIZvajsL1d8hniijhOuXZ75LBcBWCXmnE6dFyHHsXf1AJkfUJg6c4ueuHdG
	cV7fnWTN/hIwfC52lhb16hTEVlJwI9yzLlxBilHO6AlLxasWk/fTYYILAPgZsQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790955720; a=rsa-sha256;
	cv=none;
	b=OnCCuVwBicQLwGttOXLL3shWZ4MWxQGZlTznto27esNGB+M9NeelgaloxzX1pqHX4wmlaj
	wpE/RAN09R/CYVAOX4ygKxD3uH7BEI6vnJDiTmr0V9fdU3QY2wZCSWdb/AD5nw3h4/W/uk
	AOpHmRDikaO3d0VwTlNIkBHuP397fBywaYIwXpT3lnBdYCcVFIzgB63+vsJcxMRZYxgaAs
	pET5gEsODmmOmat9qXvA9he+Ey+wkK0lyzmx4kB7O4TGS/M8xAdUe9Wd2BYse8532AtxHE
	j3RtR9aPM6EEIcYZTdq5rEj1SE3osyEPq4DpvEqBFv6mRugkv61kr4SjMlcOuQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=bst@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790955720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wuAMlK/m4XSwNemVqsBnuwn4ZxKp8C/uAZ3aXiQLqAQ=;
	b=J7lRay24EySIL39Ki0OwPv2aR7pC779dzubC5NCWnJmjzuvvA4fY7Vj+Fv1jaaRDXvGOnE
	29SXEXkyKG4Rq443IK28F4rCJx3JPii20zTLRVM2tP0aVXsG0QgIQqMyNRKN97Y5Fcm5oq
	xGWTlTKgC+DvGJ9MiGfuN1FXg1aZEkHLstVPxUVEPQHbTQXUXFNufGt0XXVKKdBTLF/Ud7
	bcOlG7fTmOlhJFTANdGlB0lJWjCj730ATV86ceC/YzSOUDCKkUMkhyPQZUmZrFqE62YQfZ
	hH/OdT8zqi+77O8qlB6ocg1syXsut2eakg/5gEsNEjMsqvxQerOlR3rwEkSxNQ==
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <bst@pengutronix.de>)
	id 1xCfOa-003una-1G;
	Fri, 02 Oct 2026 17:42:00 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][PATCH 2/2] fitimage.bbclass: make engine parameters in FITIMAGE_MKIMAGE_EXTRA_ARGS fail early
Date: Fri,  2 Oct 2026 17:41:48 +0200
Message-ID: <20261002154148.1181457-2-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002154148.1181457-1-bst@pengutronix.de>
References: <20261002154148.1181457-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 15:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130603

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

A previous patch documented how provider-based PKCS#11 signing works.
Now make an engine option in FITIMAGE_MKIMAGE_EXTRA_ARGS a fatal error. I=
t
has no effect anymore, so a recipe still setting it has not been
migrated; failing with a clear message beats mkimage's generic error
messages above.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta-oe/classes/fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
index 69e1c5c7b2..4bacdbdb9e 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -519,6 +519,11 @@ do_configure[postfuncs] +=3D "write_manifest"
=20
 do_fitimage () {
     if [ "${FITIMAGE_SIGN}" =3D "1" ]; then
+        case " ${FITIMAGE_MKIMAGE_EXTRA_ARGS} " in
+        *" --engine "*|*" --engine=3D"*|*" -N "*)
+            bbfatal "OpenSSL engines are no longer supported, see update=
d usage in fitimage.bbclass."
+            ;;
+        esac
         uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \
             -k "${FITIMAGE_SIGN_KEYDIR}" -r \
             -f "${B}/manifest.its" \
--=20
2.47.3


