Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7557C88E73
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18122.1789458275929593921
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hHVr6ccm;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id B82861C4E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds650; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 26/31] tecla: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:42 +0200
Message-ID: <20260915074347.6003-26-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-767FB9B9-C05C2B0E/0/0 CLEAN NORMAL
X-TOI-MSGID: cbc0ecad-3aec-493c-bd81-0a888fca0898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=gzRSc+J4UYZ/xupIuF7hbxIUBIIKYfQubbCQzJk9FQ4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hHVr6ccmmn0BdeGfR3mfhmard9JnHvO5l3EwOH7AD/GIENUQPFLfTmHyF5fKPKkLh
	 swuwPp3L3PrMlJnY/hhEeEftTjXXPHZdk+q2fXBX8B8CSClI+Um85EBU8angwoyfSb
	 w3dSFK0RII5Xx5KY5zK5w234Jz5REq7VZfOPyZN20LL8DJjxmpj26A6ce9a1FJCGQV
	 UBREvKNOL3rpJV4zuKy0z8t46FrqJXI6A351zmbYEcxgU5DW/ocMCw6ADZvwJKg2JX
	 oUvsqHwzUKG9BWr3DyNBqeu6SBjUfaohZUUPcTbpTEI+bzBz05g9RT6mXNuH/+zmzt
	 XLBTEl9kV3Bzw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130065

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/tecla/{tecla_50.0.bb =3D> tecla_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tecla/{tecla_50.0.bb =3D> tecla_51.0.bb}=
 (84%)

diff --git a/meta-gnome/recipes-gnome/tecla/tecla_50.0.bb b/meta-gnome/re=
cipes-gnome/tecla/tecla_51.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/tecla/tecla_50.0.bb
rename to meta-gnome/recipes-gnome/tecla/tecla_51.0.bb
index f0a4874eca..9c677ef758 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_50.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_51.0.bb
@@ -14,5 +14,5 @@ REQUIRED_DISTRO_FEATURES =3D "wayland"
 inherit gnomebase pkgconfig  features_check
=20
 SRC_URI =3D "https://download.gnome.org/sources/tecla/${@oe.utils.trim_v=
ersion('${PV}', 1)}/tecla-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "2542acb24850082e0ccf6aa17af9651db71d22f0e233fdbf=
5ed0cffe2e45bc06"
+SRC_URI[sha256sum] =3D "ddf1a8555044171d0d84b580d6d541c3c621ae77996f6bc5=
edde598de2f8625b"
=20
--=20
2.55.0


