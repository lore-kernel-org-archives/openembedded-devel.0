Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E73CF3968
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20380.1726844888218900297
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id B5FDBDE42
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0M0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/23] gnome-calendar: update 46.1 -> 47.0
Date: Fri, 20 Sep 2024 17:08:05 +0200
Message-ID: <20240920150822.1131707-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844861-96FFB467-7A6C8B0E/0/0 CLEAN NORMAL
X-TOI-MSGID: 5112109a-b227-43ce-864e-e140cb9c1076
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112409

Major changes in 47.0:
* Updated translations
Major changes in 47.rc:
* Set a user agent when requesting remote servers for calendar files
* Port various spinners to AdwSpinner
* Improvements to URL validation when adding new calendars
* Only offer writable calendars when creating new events
* Show indicator icons for invisible calendars in the importer dialog
* Fix drag and drop issue with events in daylight saving time
* Updated translations
Major changes in 47.beta:
* Add the ability to import ICS files using drag n' drop
* Fix the timelines backend, to eliminate divergence between views after =
moving events
* Fix the agenda sidebar's events ordering
* Fix the agenda sidebar's duplication of day separation headers in the e=
vents list
* Fix the agenda sidebar's events randomly appearing or disappearing
* Interpret floating time events (no timezone defined) using local time i=
nstead of UTC
* Interpret timezones when previewing events in the .ics importer dialog
* Various improvements to the file importer dialog
* Many visual improvements to the event preview popover
* Event reminders states are now remembered properly
* Avoid creating an extra duplicate local calendar when adding calendars =
from URLs
* Show service names instead of URLs in tooltips for recognized videoconf=
erencing links
* Small improvement to the spacing of the month view
Major changes in 47.alpha:
* Faster, flicker-free search
* Use modern Adwaita widgets in various places
* Improved event editor dialog
* Improved visuals for mini-calendar in the sidebar
* Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_46.1.bb =3D> gnome-calendar_47.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_46.1.bb =3D=
> gnome-calendar_47.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.1.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_47.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_47.0.bb
index eac768c8f..fa9df54fb 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_47.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "9861ff7b8abd5b7b20690ba55eb7542c7ec534b5=
66269e29b5b1e858c1610897"
+SRC_URI[archive.sha256sum] =3D "3b03313f1c4d12dc821e07e209d1596d53eafa25=
5d492d2ce5abf92ed1b51e76"
=20
 do_install:prepend() {
     sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.h
--=20
2.46.0


