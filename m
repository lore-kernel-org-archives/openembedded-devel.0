Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D504CA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:57:12 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15665.1790956272316758162
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=SODWUOjp;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: bst@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BFF40201991;
	Fri, 02 Oct 2026 17:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790956270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejXtoey8Nt1DVCpkVFQHFYIAKquP0KReoRENSXQjCQk=;
	b=SODWUOjpaKEXKC8+xt3iIsD4O0TifX5vjEfjyNfQeaeEdQuI1Tq/r8j1SuM/yhqfI2gh8q
	Lb2Um9u0RNWGcsTGPg7DFtUstbOtYF2BraTMiMX7zfGSLKN1KjHsmNdDw/RGNNo2ftxvxm
	GRe7iI1dg7kgCZ7oS2+CfkyCgnan3ie5VDZar345RKaUDhUIr/bsJJ4Ab4avL12oo3SPnh
	wg1y14Nx1ekgVWf0AsNAWaVLbA6vOZsRFCaNGleOYTtQcza8Uu2rFshuX9VBXtmn8NZ892
	iNkRx9fJzVFofjgA7/RcMOfRZ1qFumZP8SjVVdqJLA4ogP+gfXNGHP5b1mwXjw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790956270; a=rsa-sha256;
	cv=none;
	b=YsajxUnBFOk0coMgZ/nUePe2tCYJ26HsJ2H/djyNwqAmeCyIJYLCnI+05rpOZJj+5AS+nL
	/UDEwJp9maHGegb6RcJXCW+9XixM3oyBNHDtu+RQ2baxSCD673erZ2ZkNnMCOafu39x/UT
	n+SQsxR2Ro6RObz2joouCXxfa1lE/sFDYumaCM3xZ0Qn6M6a4CXqOujg08/fm3TVj6nZfE
	tni1QRlfCIxXJVANufxPukouYvCisTzUCPlKARnVGlSBc/gL3g1dkYI39JqeiGZUX4eZAD
	lJSbKx1n+9GtqoacoulEczVo4Y3M1Ze25S6Sus0UlhowCJxZhZ/jdZLczmIdZg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=bst@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790956270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejXtoey8Nt1DVCpkVFQHFYIAKquP0KReoRENSXQjCQk=;
	b=AzfGQKh2ZxYfbJuRiOFWFrtkoeOr5fJenJsTSI8u9RyEFXz+1CXxJf1mLd51GZu+kczmtO
	Hu4TRxt/cEJMn54XfRvu/i2IFNBGJZoX+q8yxeQ8b6u/8OLnxCiyl7RqURXDPoaU5ltoax
	cY/uBiGvdbxAjt8fmSrIp5LXxfuNOebnniFx+KOrnzv/ZCOQLcXMF1M+3x2gdngwrtpSKn
	x6lBIbU4yb5NMp3fqKaSmFkEcSo5OsqXv0bBmDgP2QkKEtfl68LXUia/vCwLv2kFpEaMk9
	GOXZf6Uq2UJj21VgFqz6PJdM+1YJe5Wav6pnxe2iDuf4kCxn1EkwuFLARmbGJg==
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <bst@pengutronix.de>)
	id 1xCfXS-003uoM-2H;
	Fri, 02 Oct 2026 17:51:10 +0200
From: "Bastian Krause" <bst@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bastian Krause <bst@pengutronix.de>
Subject: [meta-oe][PATCH v2 2/2] fitimage.bbclass: make engine parameters in FITIMAGE_MKIMAGE_EXTRA_ARGS fail early
Date: Fri,  2 Oct 2026 17:49:03 +0200
Message-ID: <20261002155105.1184924-2-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002155105.1184924-1-bst@pengutronix.de>
References: <20261002155105.1184924-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 15:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130606

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
Changes since (implicit) v1:
- mention FITIMAGE_MKIMAGE_EXTRA_ARGS in bbfatal message, so the user
  knows where to look for the engine argument
---
 meta-oe/classes/fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.=
bbclass
index 8a59388008..99b74939aa 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -519,6 +519,11 @@ do_configure[postfuncs] +=3D "write_manifest"
=20
 do_fitimage () {
     if [ "${FITIMAGE_SIGN}" =3D "1" ]; then
+        case " ${FITIMAGE_MKIMAGE_EXTRA_ARGS} " in
+        *" --engine "*|*" --engine=3D"*|*" -N "*)
+            bbfatal "FITIMAGE_MKIMAGE_EXTRA_ARGS: OpenSSL engines are no=
 longer supported, see updated usage in fitimage.bbclass."
+            ;;
+        esac
         uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \
             -k "${FITIMAGE_SIGN_KEYDIR}" -r \
             -f "${B}/manifest.its" \
--=20
2.47.3


