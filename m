Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F95AC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 09:09:55 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.66318.1698311394423535847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 02:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 76136B3C0
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 11:09:52 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.112]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qvwN8-3EEu4Q0; Thu, 26 Oct 2023 11:09:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gnome-calendar: Update 45.0 -> 45.1
Date: Thu, 26 Oct 2023 11:09:58 +0200
Message-ID: <20231026090959.764445-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026090959.764445-1-f_l_k@t-online.de>
References: <20231026090959.764445-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698311386-1EFFAEA2-EC397F70/0/0 CLEAN NORMAL
X-TOI-MSGID: c95e1613-6e75-4fbd-bf39-4b11ea8ae7fd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 09:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105735

Major changes in 45.1:
* Use en dash for various strings
* Read the 12/24h time format setting from the portal
* Show event popover above events
* Fix a crash when loading some specific event in specific ranges and tim=
ezones
* Fix various warnings
* Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_45.0.bb =3D> gnome-calendar_45.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_45.0.bb =3D=
> gnome-calendar_45.1.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
index a8b8123f8..1f63c8aeb 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "8c1483cbba4388db410875ed09d64e9003f929b5=
55d704076a6fe7bd7c1e65b2"
+SRC_URI[archive.sha256sum] =3D "7fa8507543865aa7432bb5319830c87158b5447c=
a09cca45b607dc6796c71008"
=20
 do_install:prepend() {
     sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/s=
rc/gcal-enum-types.h
--=20
2.42.0


