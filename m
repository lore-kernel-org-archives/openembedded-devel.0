Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA99310AB819
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 19:35:09 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57263.1774553699639520341
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 12:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=MY3RDir0;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id AD79E101FD
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 20:34:57 +0100 (CET)
Received: from fedora.fritz.box ([79.219.228.172]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w5qTo-0WgtUn0; Thu, 26 Mar 2026 20:34:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-online-accounts: update 3.55.1 -> 3.58.0
Date: Thu, 26 Mar 2026 20:34:51 +0100
Message-ID: <20260326193451.1772279-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1774553697-AA7FB80B-AB7933CF/0/0 CLEAN NORMAL
X-TOI-MSGID: 0fc08fe2-0cc2-48b7-b3db-32a7071a1973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774553697; i=f_l_k@t-online.de;
	bh=cMStRFol9WX1OO1q+1cfTBf69TN92Kvz/Ud/R1NO6kE=;
	h=From:To:Subject:Date;
	b=MY3RDir06ePL35vg5POAMiVlcEuXu+0Ht5nSZDOQnhRY3BAPp01f5FQajmnKvzeOS
	 Dui/nKDhvahCR3smL3uN2eD0ExB3vJos8a+LkwNWepyj21ETdxsX9KpDKdvj5SUthc
	 dci8Kp24X8dtXVkL567Ph4uYAFVgE8zoVgMCQ8EQ8f3WI/5plNwsKUcCK0Ra6YBGfu
	 Um63ywcZY1uoOmFQiiYNVYIAyQBUe7PUOxT9A+Q5EUHPDarkv1hD7MKkgPZAzybxX1
	 QoPTMPV+XHP5z+hUQ8JwFMJ1gm5s7lqEY+Irjx3a2pq89zLGww7CrQ+/ahuMBHAum2
	 ud4JriIDwg+Hg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 19:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125770

This fixes gvfs build if online-accounts is enabled
| Dependency goa-1.0 found: NO. Found 3.55.1 but need: '> 3.57.0'
| Found CMake: NO
| Run-time dependency goa-1.0 found: NO
|
| ../sources/gvfs-1.60.0/meson.build:371:12: ERROR: Dependency lookup for=
 goa-1.0 with method 'pkgconfig' failed: Invalid version, need 'goa-1.0' =
['> 3.57.0'] found '3.55.1'.

Overview of changes in 3.58.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - #453 SMTP server without password cannot be configured (Milan Crha)
  - Remove unneeded SMTP password escaping
  - !384 build: Disable google provider Files feature (Ondrej Holy)
  - !385 MS365: Fix mail address and name (Jan-Michael Brummer)
  - !386 Google: Set mail name to presentation identity (Jan-Michael Brum=
mer)
* Translation updates:
  - Arabic (Ahmed Najmawi)
  - Basque (Asier Saratsua Garmendia)
  - Catalan (Victor Dargallo, Jordi Mas)
  - Chinese (China) (luming zh)
  - Czech (Daniel Rusek)
  - Danish (Ask Hjorth Larsen)
  - English (United Kingdom) (Bruce Cowan)
  - Finnish (Jiri Gr=C3=B6nroos)
  - French (Lucien Ouoba)
  - Galician (Fran Di=C3=A9guez)
  - German (J=C3=BCrgen Benvenuti)
  - Greek, Modern (1453-) (Efstathios Iosifidis)
  - Hebrew (Yaron Shahrabani)
  - Hungarian (Bal=C3=A1zs =C3=9Ar)
  - Japanese (=E5=B0=8F=E5=B1=B1=E7=94=B0 =E7=B4=94 - Oyamada Jun)
  - Kazakh (Baurzhan Muftakhidinov)
  - Korean (Seong-ho Cho)
  - Lithuanian (Aurimas Aurimas =C4=8Cernius)
  - Persian (Danial Behzadi)
  - Polish (Victoria)
  - Portuguese (Hugo Carvalho)
  - Romanian (Antonio Marin)
  - Russian (Artur S0)
  - Spanish (Daniel Mustieles)
  - Swedish (Anders Jonsson)
  - Turkish (Sabri =C3=9Cnal)
  - Uighur (Abduqadir Abliz)
Overview of changes in 3.57.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - #335 Default Microsoft 365 client is unverified
  - #442 Unclear which part of "IMAP+SMTP" account test failed
  - #450 adding nextcloud account which has a subfolder does not work
  - !368 Microsoft 365: Make use of email for id (Jan-Michael Brummer)
  - !374 goadaemon: Handle broken account configs
  - !378 goadaemon: Allow manage system notifications
  - !379 goamsgraphprovider: bump credentials generation
  - !377 goaprovider: Allow to disable, instead of enable, selected provi=
ders
* Translation updates:
  - Bulgarian (Alexander Alexandrov Shopov)
  - Georgian (Ekaterine Papava)
  - Indonesian (Andika Triwidada)
  - Italian (Nathan Giovannini)
  - Kazakh (Baurzhan Muftakhidinov)
  - Norwegian Bokm=C3=A5l (Kjartan Maraas)
  - Occitan (post 1500) (Quentin PAG=C3=88S)
  - Portuguese (Brazil) (Juliano de Souza Camargo)
  - Slovenian (Martin)
  - Ukrainian (Yuri Chornoivan)
Overview of changes in 3.57.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Changes:
  - build: bump glib requirement to 2.84
* Bugs fixed:
  - #417 Support for saving a Kerberos password to the keychain after the=
 first
    login

  - #436 changing expired kerberos password is not supported.
  - #437 Provided Files URI does not override undiscovered endpoint
  - #439 DAV client rejects 204 status in OPTIONS request handler
  - #445 Include emblem-default-symbolic.svg
  - #448 Connecting a Runbox CardDAV/CalDAV account hangs/freezes after s=
ign in
  - !355 i81n: fix translatable string
  - !360 goaimapsmptprovider: fix accounts without SMTP or authentication=
-less
    SMTP
  - !364 build: only install icons for the goabackend build
  - !365 build: don't require goabackend to build documentation
  - !366 ci: test the build without gtk4
  - !370 DAV-client: Added short path for SOGo
* Translation updates:
  - Bulgarian (twlvnn kraftwerk)
  - Chinese (China) (luming zh)
  - Czech (Daniel Rusek)
  - English (United Kingdom) (Bruce Cowan)
  - Esperanto (Kristjan SCHMIDT)
  - Friulian (Fabio Tomat)
  - Georgian (Ekaterine Papava)
  - German (Froschi)
  - Greek, Modern (1453-) (Efstathios Iosifidis)
  - Persian (Danial Behzadi)
  - Portuguese (Hugo Carvalho)
  - Romanian (Antonio Marin)
  - Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=
=D0=B8=D1=9B)
  - Slovenian (Martin)
  - Turkish (Sabri =C3=9Cnal)
  - Uighur (Abduqadir Abliz)
  - Ukrainian (Yuri Chornoivan)
Overview of changes in 3.56.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Changes:
  - !353 Code style and logging cleanups
* Translation updates:
  - Basque (Asier Saratsua Garmendia)
  - Catalan (Jordi Mas i Hernandez)
  - Chinese (China) (luming zh)
  - Danish (Ask Hjorth Larsen)
  - Dutch (Nathan Follens)
  - Esperanto (Kristjan SCHMIDT)
  - French (Julien Humbert)
  - Georgian (Ekaterine Papava)
  - Korean (Seong-ho Cho)
  - Lithuanian (Aurimas Aurimas =C4=8Cernius)
  - Occitan (post 1500) (Quentin PAG=C3=88S)
  - Portuguese (Brazil) (Juliano de Souza Camargo)
  - Spanish (Daniel Mustieles)
  - Swedish (Anders Jonsson)
  - Turkish (Sabri =C3=9Cnal)
  - Ukrainian (Yuri Chornoivan)
Overview of changes in 3.55.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
* Bugs fixed:
  - !352 goaoauth2provider: improve error handling for auth/token endpoin=
ts
* Translation updates:
  - Czech (Daniel Rusek)
  - Dutch (Nathan Follens)
  - Galician (Fran Di=C3=A9guez)
  - Hebrew (Yaron Shahrabani)
  - Hungarian (Bal=C3=A1zs =C3=9Ar)
  - Japanese (Makoto Sakaguchi)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Russian (Artur S0)

  - Slovak (Du=C5=A1an Kazik)
  - Thai (Aefgh Threenine)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nline-accounts_3.55.1.bb =3D> gnome-online-accounts_3.58.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-acco=
unts_3.55.1.bb =3D> gnome-online-accounts_3.58.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-=
accounts_3.55.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome=
-online-accounts_3.58.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-a=
ccounts_3.55.1.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-acc=
ounts_3.58.0.bb
index 8edbd8411d..62f67460b0 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.55.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-account=
s_3.58.0.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKA=
GECONFIG', 'goabackend',
=20
 DEPENDS +=3D "gdk-pixbuf dbus glib-2.0 gcr keyutils"
=20
-SRC_URI[archive.sha256sum] =3D "a0b50fb75553c1e360713a827321cd17e2f91a73=
5b8205ba5fd0ff374b26108b"
+SRC_URI[archive.sha256sum] =3D "344d4dff9149a1adc4539417193e1eccc2f76ef4=
0ac24e104ccf58072be55999"
=20
 PACKAGECONFIG ?=3D "goabackend kerberos owncloud google"
=20
--=20
2.53.0


