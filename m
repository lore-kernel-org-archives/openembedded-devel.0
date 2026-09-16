Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67BCC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 17:30:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20652.1789579826065947475
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 10:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=jZ8idYJI;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id AA78DE658
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 19:30:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6tSh-0d2wa00; Wed, 16 Sep 2026 19:30:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libjxl: do not build the SVE targets on tunes without SVE
Date: Wed, 16 Sep 2026 19:30:10 +0200
Message-ID: <20260916173011.2907064-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789579823-1A7FB9EF-F069ABED/0/0 CLEAN NORMAL
X-TOI-MSGID: 709f9b39-4499-4ccb-a3f4-11b9ee84ac9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789579823; i=f_l_k@t-online.de;
	bh=DY3cnOziojDNtMPD7p9V2FYFyamVVk6rfPlUUT2m5yQ=;
	h=From:To:Subject:Date;
	b=jZ8idYJIQJeFYF+PP8Jy0/+UL7BVFYUARzS4obnCBXtxMdUjc4wAyRP5xP2iiwfO+
	 wvigglU5eAMWBHesGZmEIdAVpsrjG7j0k5jXq1lLmdSGj70GzY2D96raqAisyXFxS3
	 eNKnNd9atUwy6nyWYK7mBZWR1H+71o16k9mPxS2ZXaaOIj7HOX5EKdYJmizdHQUwXH
	 cOBUnd+DkUn7gqH5I9dMj1lvbPbQ0jnvKyORlaVeox1QzIsipOKiaJbOyIdJQCpbvq
	 a6OQZFaexv3jrKAG9+CvUcXEBb3Fg3ibcbYCdnBoyebsdvSPfnE6N82TLi/bVBu430
	 bxmXXTZmzjkdQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 17:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130088

Whether Highway's SVE targets are built is decided by a compiler capabili=
ty
probe that compiles a function marked __attribute__((target("+sve"))). Th=
e
attribute enables SVE for that function itself, so the probe succeeds on =
any
aarch64 compiler no matter what the tune supports, and the guard meant to
disable the targets never fires.

On a tune without SVE this compiles code that can never run, and gcc 16
crashes while doing so:

    lib/jxl/enc_transforms-inl.h:799:1: internal compiler error:
    in simplify_gen_subreg_concatn, at lower-subreg.cc:744

Tie the targets to TUNE_FEATURES instead, which describes the machine rat=
her
than the compiler. 32 bit arm needs nothing: Highway gates the SVE target=
s on
HWY_ARCH_ARM_A64, and the probe fails there anyway because arm_sve.h does=
 not
exist.

Built for raspberrypi4-64 (cortexa72, no SVE) from a clean state, and che=
cked
that the x86-64 configuration is unchanged.

AI-Generated: Uses Claude Code (Claude Opus 5)
---
 meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb b/meta-oe=
/recipes-multimedia/libjxl/libjxl_0.12.0.bb
index 7422282e4c..1207fef856 100644
--- a/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
+++ b/meta-oe/recipes-multimedia/libjxl/libjxl_0.12.0.bb
@@ -30,6 +30,16 @@ EXTRA_OECMAKE =3D " \
 	-DJPEGXL_ENABLE_TOOLS=3DOFF \
 "
=20
+# Whether to build the SVE targets is decided by a compiler capability p=
robe
+# using __attribute__((target("+sve"))), which succeeds on any aarch64 c=
ompiler
+# no matter what the tune supports. On a tune without SVE that compiles =
code
+# which can never run, and gcc crashes on the SVE2_128 target:
+#   enc_transforms-inl.h:799:1: internal compiler error:
+#   in simplify_gen_subreg_concatn, at lower-subreg.cc:744
+# Tie the targets to the tune instead.
+EXTRA_OECMAKE:append:aarch64 =3D " ${@bb.utils.contains('TUNE_FEATURES',=
 'sve', '', '-DJPEGXL_ENABLE_HWY_SVE=3DOFF -DJPEGXL_ENABLE_HWY_SVE_256=3D=
OFF', d)}"
+EXTRA_OECMAKE:append:aarch64 =3D " ${@bb.utils.contains('TUNE_FEATURES',=
 'sve2', '', '-DJPEGXL_ENABLE_HWY_SVE2=3DOFF -DJPEGXL_ENABLE_HWY_SVE2_128=
=3DOFF', d)}"
+
 PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader sizeless-vectors"
 # libjxl/0.10.2/recipe-sysroot/usr/include/hwy/ops/rvv-inl.h:591:17: err=
or: use
 # of undeclared identifier '__riscv_vsetvlmax_e8mf8'
--=20
2.55.0


