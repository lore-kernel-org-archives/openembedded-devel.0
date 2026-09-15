Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08720C88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18120.1789458274064927260
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Zi4YaTi9;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 460361C46E
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds5z0; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 20/31] gtksourceview5: upgrade 5.19.0 -> 5.21.0
Date: Tue, 15 Sep 2026 09:43:36 +0200
Message-ID: <20260915074347.6003-20-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-E8FF69B9-DC232916/0/0 CLEAN NORMAL
X-TOI-MSGID: e35e2afe-ef41-4ac5-ac1c-86a80b723098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=qqGSkU3VG1QYX+GSwi/eouKrf4SnoDxS2AlH2Rs3XzQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Zi4YaTi9M8/BlXTM+bNTXkb9DNKRDsJFm/FEYkOadaU4rMVnotZ5p1CGBpabcbg3Y
	 T4T7wUKSeo0ObTE2Lv9Qyp9lZIh1cbsa8CwzRG5XutaiZoFx/a3vCqE61q5cH9EmEV
	 YH0CxuSTsblnMZk1niH3xFIh/bDP7sRb4clcAN+IBB/RWQjHaRxmhD6iV4MZyZVK0i
	 RT7ISg3tFt4Mns+vAudtaCQH0PBfYFQqsIvbSNi1BnFfsZwMpJ+jlQD7MPPtMImCxd
	 EG90Ho1SHFJ23k+6q2k+oK2+ZwrrqKP+YN97FpVdsBQn/ErBcElydNcmVRfnCXXxEN
	 7qq5apkChtvUw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130062

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview5_5.19.0.bb =3D> gtksourceview5_5.21.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.19.0.bb =
=3D> gtksourceview5_5.21.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.19.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.21.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.19.0.=
bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.21.0.bb
index 075fb754ec..103c933b60 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.19.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.21.0.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 GNOMEBN =3D "gtksourceview"
=20
-SRC_URI[archive.sha256sum] =3D "242bf2c3dc51c44402294b584141399afe7cf87b=
facf2b958685cece964301c5"
+SRC_URI[archive.sha256sum] =3D "65f7ce9d2ec683c6ff9b27a50d909f3abef65f74=
2d11011e1b8f8b848cadf0f7"
 S =3D "${UNPACKDIR}/gtksourceview-${PV}"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
--=20
2.55.0


