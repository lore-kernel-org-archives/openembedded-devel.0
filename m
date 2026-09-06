Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74F2C79FAB
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11200.1788687443439600220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=FK0vOddt;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id 8E2531C454
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJo0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/15] gegl: depend on gexiv2-0.14
Date: Sun,  6 Sep 2026 11:37:07 +0200
Message-ID: <20260906093713.797648-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-477FD956-F677B67D/0/0 CLEAN NORMAL
X-TOI-MSGID: fb115746-50a7-4d90-b8f1-29104efec546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=zIxv7XbsMTI2x9xDNh2tgRbKzT2Lw6B5GfQa4oiM7UU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FK0vOddtfcIxxgvYWZriMsPFcXF1KwSLMvgwW83egt5TCOg6jUGd/b7ZkZ/nAu8CD
	 RjomDjh+bX/PlcaqlAGS/oss6IsJzSCWt4A2X/Ad/iWAhgKfpHY7+Vd+7IcxnKHdrx
	 vPjo5ZymNCORS/4Heg/tp1TNhrkRwSoluOHSTRMx86oZYkSpE31NFUooLpCvGOxM+P
	 BPtXm2gYPIrmd3GrZDRdFV62ubJbI8JUnkAPSCPTlwPzMZ0sFQfHU5D1i1YEeyyJi8
	 xKSmp8Ijklprwjrlnfl/sdr8sroTeUY/pQomX41IE1GvbgwqI/Uvneo5fdSSUjfVP2
	 +KQWcvYP8aA2g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129780

gegl looks for the unversioned gexiv2 pkg-config module, which only the
0.14 series provides.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb b/meta-gnome/rec=
ipes-gimp/gegl/gegl_0.4.70.bb
index 64ff475dc4..c089589685 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.70.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG ??=3D "gexiv2 libraw librsvg pango popple=
r sdl2"
 PACKAGECONFIG:class-native =3D "librsvg"
=20
 PACKAGECONFIG[jasper] =3D "-Djasper=3Denabled,-Djasper=3Ddisabled,jasper=
"
-PACKAGECONFIG[gexiv2] =3D "-Dgexiv2=3Denabled,-Dgexiv2=3Ddisabled,gexiv2=
"
+PACKAGECONFIG[gexiv2] =3D "-Dgexiv2=3Denabled,-Dgexiv2=3Ddisabled,gexiv2=
-0.14"
 PACKAGECONFIG[graphviz] =3D "-Dgraphviz=3Denabled,-Dgraphviz=3Ddisabled,=
graphviz"
 PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
 PACKAGECONFIG[libav] =3D "-Dlibav=3Denabled,-Dlibav=3Ddisabled,libav"
--=20
2.55.0


