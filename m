Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23D2C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 22:44:44 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.36483.1747953875062293921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 15:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 3456E1F65
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 00:44:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.126]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uIEeN-2jWeO20; Fri, 23 May 2025 00:44:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] pipewire: use webrtc-audioprocessing-2
Date: Fri, 23 May 2025 00:44:20 +0200
Message-ID: <20250522224420.107223-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522224420.107223-1-f_l_k@t-online.de>
References: <20250522224420.107223-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747953871-38FF74B3-783F4C04/0/0 CLEAN NORMAL
X-TOI-MSGID: b906223a-3d8a-44a8-8392-591caae5688d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 22:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117599

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.b=
b b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
index 2af16aad3e..e554d8737a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.2.bb
@@ -139,7 +139,7 @@ PACKAGECONFIG[udev] =3D "-Dudev=3Denabled,-Dudev=3Ddi=
sabled,udev"
 PACKAGECONFIG[v4l2] =3D "-Dv4l2=3Denabled,-Dv4l2=3Ddisabled,udev"
 PACKAGECONFIG[volume] =3D "-Dvolume=3Denabled,-Dvolume=3Ddisabled"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-headers vulkan-loader"
-PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing-1"
+PACKAGECONFIG[webrtc-echo-cancelling] =3D "-Decho-cancel-webrtc=3Denable=
d,-Decho-cancel-webrtc=3Ddisabled,webrtc-audio-processing-2"
 PACKAGECONFIG[wireplumber] =3D ",,,wireplumber,,media-session"
=20
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
--=20
2.49.0


