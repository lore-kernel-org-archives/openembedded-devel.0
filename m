Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCDEC35FF2
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:43:48 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.9439.1741851819922771906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id F37511023;
	Thu, 13 Mar 2025 08:43:37 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsdE8-4WdEZ90; Thu, 13 Mar 2025 08:43:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFC][gnome48][meta-gnome][PATCH 3/8] gnome-software: update 47.2 -> 48.rc
Date: Thu, 13 Mar 2025 08:44:06 +0100
Message-ID: <20250313074411.5600-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313074411.5600-1-f_l_k@t-online.de>
References: <20250313074411.5600-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1741851816-D6FFB466-6D408FA7/0/0 CLEAN NORMAL
X-TOI-MSGID: b93be3b5-8454-419b-bfec-6fdb6f60a0cf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115956

Version 48~rc
~~~~~~~~~~~~~
Released: 2025-02-28

This is an unstable release with the following changes:
 * Minor interface improvements on the updates page
 * Various minor performance improvements
 * Improve error handling for app launches and distribution upgrades
 * Fix a crash on the app review dialog
 * Fix version checks preventing some firmware updates when historical up=
dates are also listed
 * Fix a crash when copying error details
 * Minor interface improvements to search
 * Improvements to flatpak permissions checking for D-Bus

This release also updates translations:
 * Bulgarian (twlvnn kraftwerk)
 * Catalan (Jordi Mas)
 * Chinese (China) (Luming Zh)
 * Chinese (Taiwan) (Cheng-Chia Tseng)
 * Czech (Daniel Rusek)
 * Finnish (Jiri Gr=C3=B6nroos)
 * French (Vincent Chatelain)
 * Galician (Fran Dieguez)
 * Georgian (Ekaterine Papava)
 * Hebrew (Yaron Shahrabani)
 * Korean (Seong-ho Cho)
 * Lithuanian (Aurimas =C4=8Cernius)
 * Persian (Danial Behzadi)
 * Portuguese (Hugo Carvalho)
 * Portuguese (Brazil) (Rafael Fontenelle)
 * Russian (Artur S0)
 * Slovenian (Martin)
 * Swedish (Anders Jonsson)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)

Version 48~beta
~~~~~~~~~~~~~~~
Released: 2025-01-31
This is an unstable release with the following changes:
 * Support installing flatpaks via a flatpak+https: link
 * Fix notifying about outdated updates when in power saver mode or offli=
ne
 * Prioritise verified apps in source list
This release also updates translations:
 * Bulgarian (twlvnn kraftwerk)
 * Czech (Daniel Rusek)
 * Russian (Artur S0)
 * Slovenian (Martin)
Version 48~alpha3
~~~~~~~~~~~~~~~~~
Released: 2025-01-14
This is an unstable release with the following changes:
 * Fix downloads of firmware updates
 * Fix the release process
This release also updates translations:
 * Belarusian (Vasil Pupkin)
 * Slovenian (Martin)
Version 48~alpha2
~~~~~~~~~~~~~~~~~
Released: 2025-01-04
This is an unstable release with the following changes:
 * Fix the release process
Version 48~alpha
~~~~~~~~~~~~~~~~
Released: 2025-01-04
This is an unstable release with the following changes:
 * Include dependencies in estimated download size
 * Improve performance when loading updates
 * Fix interface freeze when upvoting/downvoting reviews
 * Various minor interface improvements for keyboard navigation and small=
 screens
 * Fix crash when uninstalling snaps
 * Add experimental systemd-sysupdate plugin
 * Warn about microphone permissions if an app has PipeWire access
This release also updates translations:
 * Belarusian (Vasil Pupkin)
 * Catalan (Jordi Mas i Hernandez, Jordi Mas)
 * Dutch (Nathan Follens)
 * French (Vincent Chatelain)
 * Friulian (Fabio Tomat)
 * German (J=C3=BCrgen Benvenuti)
 * Hebrew (Yaron Shahrabani)
 * Kabyle (Athmane MOKRAOUI)
 * Latvian (R=C5=ABdolfs Mazurs)
 * Portuguese (Hugo Carvalho)
 * Portuguese (Brazil) (Rafael Fontenelle)
 * Russian (Artur S0)
 * Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=
=D1=9B, =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=B8=
=D1=9B)
 * Slovak (Jose Riha)
 * Slovenian (Martin)
 * Thai (Aefgh Threenine)
 * Turkish (Sabri =C3=9Cnal)
 * Ukrainian (Yuri Chornoivan)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gnome-software_47.2.bb =3D> gnome-software_48.rc.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_47.2.bb =3D=
> gnome-software_48.rc.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.rc.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_48.rc.bb
index 31b13accf8..083212c8cb 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.rc.bb
@@ -26,9 +26,9 @@ DEPENDS +=3D " \
=20
 RDEPENDS:${PN} =3D "iso-codes"
=20
-EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
+EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "112338f8a98e7e5125de3f57229873534215b77e=
eef37d3fd4262f02151c7cea"
+SRC_URI[archive.sha256sum] =3D "2610b5bca65042546779f9e70120d33b5f626edc=
f8a5ce534dbb54119be455cf"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.48.1


