Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D90CCF9C41
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20378.1726844888079026598
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id B47A3DE41
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0L0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/23] gnome-calculator: update 46.1 -> 47.0
Date: Fri, 20 Sep 2024 17:08:04 +0200
Message-ID: <20240920150822.1131707-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844861-35FF9467-063A2C45/0/0 CLEAN NORMAL
X-TOI-MSGID: 68983826-e621-4f6b-b743-345cb0f031e5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112406

Overview of changes in gnome-calculator 47.0
    * Updated translations
    * Fixed flatpak build !181 (Hari Rana)
    * Don't use symbolic icons for the window !182 (Ball=C3=B3 Gy=C3=B6rg=
y)

Overview of changes in gnome-calculator 47.rc
    * Updated translations
    * Added brand colors !178 (Brage Fuglseth)

Overview of changes in gnome-calculator 47.beta
    * Updated translations
    * Fix hex string conversion for bitwise operator !177 (Xiong Nandi)
    * Force LTR for buttons !171 (Khalid Abu Shawarib)
    * Added kWh, MJ, KJ unit support #417 (Robert Roth)
    * Sort conversion categories alphabetically #395 (Robert Roth)
    * Removed obsolete bulgarian translations #402 (Robert Roth)
    * Only allow alphanumeric values for variable names #396 (Robert Roth=
)
    * Replace base_label with buttons !173 (Cl=C3=A9ment Mathieu--Drif)
    * Updated flathub badge !174 (Brage Fuglseth)
    * Use adwaita spinner !175 (Cristopher Davis)

Overview of changes in gnome-calculator 47.alpha
    * Updated translations
    * Support VND currency #387 (Robert Roth)
    * Fixed incorrect event handling #392 (Robert Roth)
    * Removed Shift left/right dropdown #330 (Robert Roth)
    * Improved popover remove buttons #401 (Robert Roth)
    * Use result format instead of number format #399 (Robert Roth)
    * Ported to Adwaita adaptive dialogs (Robert Roth)
    * Disable undo button if nothing to undo #280 (Robert Roth)
    * Metainfo improvements (Andre Klapper)
    * Keep last conversion options at launch #351 (Robert Roth)
    * Minor improvements to the undo button !166 (Automeris naranja)
    * Make sure to use the correct app id for development builds !170 (Ch=
ristopher Davis)
    * Stop using orange accent color !169 (Alice Mikhaylenko)
    * A11y announce status changes !172 (Luk=C3=A1=C5=A1 Tyrychtr)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_46.1.bb =3D> gnome-calculator_47.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_46.1.=
bb =3D> gnome-calculator_47.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
6.1.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_47.0.=
bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46=
.1.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_47.0=
.bb
index f1a93ea83..c24e45df3 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_47.0.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "2d36750a73890086122cf3f0c83e685178915856=
15165306fa1596a918668247"
+SRC_URI[archive.sha256sum] =3D "decdb23283b5dbeef40951b69eaf7d4b80c0c388=
0ddb01863f9f0f1554f8998b"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.46.0


