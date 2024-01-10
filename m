Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798EBC47422
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 09:11:57 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.8046.1704877916511063746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 01:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout11.t-online.de (Postfix) with SMTP id ECED427DAA
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 10:11:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNUcr-27uFYT0; Wed, 10 Jan 2024 10:11:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/5] gnome-shell-extensions: update 45.1 -> 45.2
Date: Wed, 10 Jan 2024 10:11:46 +0100
Message-ID: <20240110091146.867242-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110091146.867242-1-f_l_k@t-online.de>
References: <20240110091146.867242-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1704877913-DB7FD94C-BA592DFE/0/0 CLEAN NORMAL
X-TOI-MSGID: ba69f380-ec6d-4597-8062-11b571830d2d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 09:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108212

45.2
=3D=3D=3D=3D
* window-list: Fix buttons not being clickable at the screen edge
  [Florian; !291]
* window-list: Really fix initial preview visibility [Florian; !292]
* workspace-indicator: Really fix initial preview visibility [Florian; !2=
92]
* Misc. bug fixes and cleanups [Florian; !290]

Contributors:
  Florian M=C3=BCllner

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_45.1.bb =3D> gnome-shell-extensions_45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_45.1=
.bb =3D> gnome-shell-extensions_45.2.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
45.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.=
2.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
5.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.=
2.bb
index cfc01c7da..49cd6b810 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_45.2.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "242e15a0c06e820c3fd8dd6aeac1a8ef865ce588=
82e5975af1d65934bb4d4261"
+SRC_URI[archive.sha256sum] =3D "ee32f6387a2d18adbff7a956689bc747866b4a87=
12d73790c002abeae4ccaaaf"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.43.0


