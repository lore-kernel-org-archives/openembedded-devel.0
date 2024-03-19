Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4041EC54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 06:57:28 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.9066.1710831441175329427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 23:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id ABF9231DF2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 07:57:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmTPF-2A0Jgf0; Tue, 19 Mar 2024 07:57:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-calendar: update 45.1 -> 46.0
Date: Tue, 19 Mar 2024 07:57:35 +0100
Message-ID: <20240319065735.33275-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710831425-457F9979-187655B8/0/0 CLEAN NORMAL
X-TOI-MSGID: a7bc9932-683d-4ba8-8895-54d4e41384cb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 06:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109472

- this update will require libadwaita 1.5.0

Major changes in 46.0:
* Updated translations

Major changes in 46.rc:
* Improve AppData information some more
* Various code cleanups
* Updated translations

Major changes in 46.beta:
* Improve AppData information
* Use the Settings portal for the show-week-dates setting
* Fix daylight saving time events in the Week view
* Add accessible labels to a few UI elements
* Use the new AdwDialog API for responsive dialogs
* Tweak the visuals of the Month view
* Properly make Calendar stop the weather service in Flatpak
* Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_45.1.bb =3D> gnome-calendar_46.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_45.1.bb =3D=
> gnome-calendar_46.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
index 99cb9f67e..707c4b583 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "7fa8507543865aa7432bb5319830c87158b5447c=
a09cca45b607dc6796c71008"
+SRC_URI[archive.sha256sum] =3D "5e21960c174bd8606d9089bf79c70f31070ab483=
7919878b00db2f14af9fe718"
=20
 do_install:prepend() {
     sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.h
--=20
2.44.0


