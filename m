Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAD4C4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:59:02 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.15998.1672397940090016095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id A32E7D750
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 11:58:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBD6F-4cGBd60; Fri, 30 Dec 2022 11:58:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 4/5] gnome-flashback: update 3.44.0 -> 3.46.0
Date: Fri, 30 Dec 2022 11:58:43 +0100
Message-Id: <20221230105844.428064-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230105844.428064-1-f_l_k@t-online.de>
References: <20221230105844.428064-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672397935-3AFEA81E-BF4E9A69/0/0 CLEAN NORMAL
X-TOI-MSGID: cda4a7b5-68c6-44f6-8d3b-833eaa594077
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 10:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100310

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-flashback_3.44.0.bb =3D> gnome-flashback_3.46.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-flashback/{gnome-flashback_3.44.0.=
bb =3D> gnome-flashback_3.46.0.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.4=
4.0.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.=
bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.44=
.0.bb
rename to meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0=
.bb
index 1e357af87..597cdbab9 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.46.0.bb
@@ -14,11 +14,11 @@ DEPENDS +=3D " \
     metacity \
     gdm \
     gnome-desktop \
-    gnome-bluetooth3 \
+    gnome-bluetooth \
     gnome-panel \
 "
=20
-SRC_URI[archive.sha256sum] =3D "1df0838127c6246eecd89d1c50ff88fc82abf6de=
3b3068e52dde495a42bd550a"
+SRC_URI[archive.sha256sum] =3D "7a8d5c03310e4dfadd18a65e00a37741032afeea=
5418dd6804a975c4b0980045"
=20
 do_install:append() {
     # no oe-layer has compiz -> remove dead session
--=20
2.34.1


