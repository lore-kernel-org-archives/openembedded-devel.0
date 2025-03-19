Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D878EC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:49:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.2535.1742410193198430601
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 11:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 761D0E08
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:49:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuyU7-13jEo50; Wed, 19 Mar 2025 19:49:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] gnome-calendar: update 47.0 -> 48.0
Date: Wed, 19 Mar 2025 19:50:26 +0100
Message-ID: <20250319185029.296821-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742410187-E97EC96A-9CA78120/0/0 CLEAN NORMAL
X-TOI-MSGID: db84227e-62ef-4387-a705-be14b3b05fb7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116101

Major changes in 48.0:
* Improve performance of the Month view
* Updated translations

Major changes in 48.rc:
* Round temperatures to integer precision in weather forecast,
  to save space and reflect the approximate nature of the forecasts
* Updated translations

Major changes in 48.beta:
* Allow selecting timezones for the start and end times of events
* Fix calendar name overflow in the calendars popover list
* Auto-hide weather temperature labels in Month view when space is insuff=
icient
* Updated translations

Major changes in 48.alpha2:
* Many design improvements to the event editor dialog, such as a rearrang=
ed
  all-day / timed selection, moving the event calendar to a row, and more=
.
* Show a banner in the event editor when the calendar is read-only
* Improve capitalization of title strings in the Week view header
* Fix event order in the sidebar
* Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_47.0.bb =3D> gnome-calendar_48.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_47.0.bb =3D=
> gnome-calendar_48.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_47.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_47.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
index fa9df54fba..44bde3774d 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "3b03313f1c4d12dc821e07e209d1596d53eafa25=
5d492d2ce5abf92ed1b51e76"
+SRC_URI[archive.sha256sum] =3D "e69a5a66be820105a4d823d4dba9b4e6ef9f6e75=
23978aaf33361ebbb993e604"
=20
 do_install:prepend() {
     sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.h
--=20
2.48.1


