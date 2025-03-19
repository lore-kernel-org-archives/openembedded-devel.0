Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DFDC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:49:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.2607.1742410193204988196
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 11:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 78042E10
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:49:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuyU7-13jEo60; Wed, 19 Mar 2025 19:49:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] gnome-calculator: update 47.0 -> 48.0
Date: Wed, 19 Mar 2025 19:50:27 +0100
Message-ID: <20250319185029.296821-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319185029.296821-1-f_l_k@t-online.de>
References: <20250319185029.296821-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742410187-EB7E896A-3471507E/0/0 CLEAN NORMAL
X-TOI-MSGID: d83996ab-a955-4985-97a2-2305b5c275bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116102

Overview of changes in gnome-calculator 48.0
    * Updated translations
    * Fixed converter context menus not working (fcusr)
    * Code cleanup and improvements (fcusr, Adrien Plazas)
    * Improvements in function usage, brackets usage (Adrien Plazas)

Overview of changes in gnome-calculator 48.rc
    * Updated translations
    * UI and styling fixes (fcusr, Adrien Plazas)
    * Do not steal focus on window move #422 (Robert Roth)

Overview of changes in gnome-calculator 48.beta
    * Updated translations
    * Added Conversion mode (fcusr)
    * Ported financial dialogs to modern widgets (fcusr)
    * programming: disable digits not available in current number base
    * buttons: improvements to popover styling

Overview of changes in gnome-calculator 48.alpha
    * Updated translations
    * a11y: Announce the calculation result even when done through the bu=
ttons #411 (Luk=C3=A1=C5=A1 Tyrychtr)
    * display: Cycle through history with Alt+Left/Right buttons #296 (Ha=
ri Rana)
    * character-dialog: Modernized the character dialog (Hari Rana)
    * history-entry: Apply dim label to some buttons (Hari Rana)
    * math-preferences: Use header capitalization (Automeris naranja)
    * converter: Use correct kJ unit shortName #427 (Robert Roth)
    * converter: Fixed incorrect units in financial mode #424 (Robert Rot=
h)
    * converter: Added nanosecond unit (Robert Roth)
    * tests: Fixed broken test on slower computers #434 (Robert Roth)
    * history-view: Improve default size #419 (Robert Roth)
    * display: Fixed incorrectly sized text entry #405 (Robert Roth)
    * converter: Add pressure units !179 (Olexander Movchan, Anders Jonss=
on)
    * converter: Updated russian ruble currency symbol and name #440 (Rob=
ert Roth)
    * display: Fix crash on using Shift+Insert #442 (Robert Roth)
    * converter: Fixed MJ and kWh conversion factors #445 (=C3=87a=C4=9Fa=
tay Yi=C4=9Fit =C5=9Eahin)
    * tests: Added test to validate MJ and kWh conversion (Robert Roth)
    * keyboard: Added shortcut to clear history #398 (Claudio Silva Junio=
r)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_47.0.bb =3D> gnome-calculator_48.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_47.0.=
bb =3D> gnome-calculator_48.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
7.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_48.0.=
bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_47=
.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_48.0=
.bb
index c24e45df39..b8433a2b5a 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_48.0.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "decdb23283b5dbeef40951b69eaf7d4b80c0c388=
0ddb01863f9f0f1554f8998b"
+SRC_URI[archive.sha256sum] =3D "07b627136bbfddb6142b324acc30440911f77f51=
37009103276a2d35ffd39510"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.48.1


