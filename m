Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56C4C982CC
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 17:30:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20653.1789579826116337485
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 10:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=O4Izaw4f;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id BC859E663
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 19:30:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6tSh-0d2wa10; Wed, 16 Sep 2026 19:30:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libjxl: drop the sizeless-vectors PACKAGECONFIG
Date: Wed, 16 Sep 2026 19:30:11 +0200
Message-ID: <20260916173011.2907064-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916173011.2907064-1-f_l_k@t-online.de>
References: <20260916173011.2907064-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789579823-38FF69EF-30ADB1B5/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f12437c-103d-49cf-bcc9-a46fe8c94689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789579823; i=f_l_k@t-online.de;
	bh=f/4DBlVYshivyMOccSugOb6qgQf5LLhOR+VaRi2EJiA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=O4Izaw4f/7WVn+goHGhbqnBtONJ17Ot22AY3WZSc/y24v75E2nhUStiu32Wb2fBmf
	 ftjtuLPAZyKSmQeQnXzGTUCyHBzYFcg7Kzr4QFTd6rLO7ZY3hS9v9xYFFpzjq9QgMR
	 eyWLpsAQBaWvWAoXpo+TkVktI7hcOgPId6wPtb+t5SO8/jVoEFBUb4F/LJ6vnkKc5Q
	 7wAvJuw3AUrf8Ct/FC0ksXUvxBQCqcuu3BoPaeA7HJETiHnC9sQx3SyePkq8m2Z/mH
	 unUR9C+S6t4RnFKreVtIQoHthGQMVoAbP5AYF7SH54ckPZBn6CFiNk3zjjAWIAyD2a
	 lnd0U7GemLJGg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 17:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130089

JPEGXL_ENABLE_SIZELESS_VECTORS no longer exists: 0.11 read it, 0.12 does
not, so cmake reports it as an unused command line variable. Per target
JPEGXL_ENABLE_HWY_* switches took its place.

The riscv removal it carried is gone with it, and nothing is lost. In 0.1=
1
the option defaulted to off and disabled SVE and RVV; enabling it, as the
recipe did, is what pulled RVV in and broke riscv in the first place. In
0.12 RVV is listed in JPEGXL_HWY_TARGETS_OFF_BY_DEFAULT, so it is not bui=
lt
on any architecture -- an aarch64 build passes HWY_RVV in HWY_DISABLED_TA=
RGETS
without any help from the recipe.

Built libjxl for raspberrypi4-64 from a clean state and checked that the
x86-64 configuration no longer carries the dead define.

AI-Generated: Uses Claude Code (Claude Opus 5)
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb b/meta-oe=
/recipes-multimedia/libjxl/libjxl_0.12.0.bb
index 1207fef856..2ca52147be 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
@@ -40,17 +40,10 @@ EXTRA_OECMAKE =3D " \
 EXTRA_OECMAKE:append:aarch64 =3D " ${@bb.utils.contains('TUNE_FEATURES',=
 'sve', '', '-DJPEGXL_ENABLE_HWY_SVE=3DOFF -DJPEGXL_ENABLE_HWY_SVE_256=3D=
OFF', d)}"
 EXTRA_OECMAKE:append:aarch64 =3D " ${@bb.utils.contains('TUNE_FEATURES',=
 'sve2', '', '-DJPEGXL_ENABLE_HWY_SVE2=3DOFF -DJPEGXL_ENABLE_HWY_SVE2_128=
=3DOFF', d)}"
=20
-PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader sizeless-vectors"
-# libjxl/0.10.2/recipe-sysroot/usr/include/hwy/ops/rvv-inl.h:591:17: err=
or: use
-# of undeclared identifier '__riscv_vsetvlmax_e8mf8'
-#  591 | HWY_RVV_FOREACH(HWY_RVV_LANES, Lanes, setvlmax_e, _ALL)
-#      |                 ^
-PACKAGECONFIG:remove:riscv64 =3D "sizeless-vectors"
-PACKAGECONFIG:remove:riscv32 =3D "sizeless-vectors"
+PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
 PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3D=
ON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf"
 PACKAGECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_EN=
ABLE_PLUGIN_GIMP210=3DOFF,gimp"
 PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_ENABL=
E_PLUGIN_MIME=3DOFF"
-PACKAGECONFIG[sizeless-vectors] =3D "-DJPEGXL_ENABLE_SIZELESS_VECTORS=3D=
ON,-DJPEGXL_ENABLE_SIZELESS_VECTORS=3DOFF"
=20
 # lcms/src/cmsps2.c
 # error: out of range pc-relative fixup value
--=20
2.55.0


