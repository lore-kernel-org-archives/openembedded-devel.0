Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C907C79FA4
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11204.1788687444026531520
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=fvoyOnVh;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout05.t-online.de (Postfix) with SMTP id A57B267E
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJs0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 13/15] gnome-calendar: upgrade 48.0 -> 50.0
Date: Sun,  6 Sep 2026 11:37:11 +0200
Message-ID: <20260906093713.797648-13-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-E87F7956-A49954A2/0/0 CLEAN NORMAL
X-TOI-MSGID: 71e88c49-8d3c-494e-b1f2-9bc4d02b182d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=lTUP8cssXGmV5aUo70Y9WFY4X6OD8s2Id4ZgQa2inJI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fvoyOnVhGnbLNdcDdG0rFoWGbnYd4JPNr3Rco7v9s2VETg7wqH8GFrvAT8ape/Nen
	 RSu1mBvPnmigRKcgoJ9bgnqKfcwIM32dUID5snSp/IGRB7+hk8a/11fp3/Pjn3pF9h
	 4GORPN80qFrcHcn/1jFa59rjAp4R8iNcTcAEkxh+K/WlzlwoD9teBd0ksR015TmS3a
	 ToisrKMds9cy4Fxw+rtnghZ3Bi7iW+j1qeC+K34yP7ustqJWp2YdbK6twtlzX5FDyQ
	 SMc77Li3/ILm5XPz6ISFi554ukNpg8WOpxQ7IUqsXOiYZyYkKR98M0NNseDEwIthQM
	 EXMZvnqN/YWkg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129787

fribidi and blueprint-compiler-native are new build dependencies. The
libical 4 patch still applies with an offset.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_48.0.bb =3D> gnome-calendar_50.0.bb}      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_48.0.bb =3D=
> gnome-calendar_50.0.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_50.0.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_50.0.bb
index 0a639a45c2..10a2ae8b0c 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_50.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e0518=
9ec81232da84bd6e1a"
 SECTION =3D "x11/gnome"
=20
 DEPENDS =3D " \
+    blueprint-compiler-native \
+    fribidi \
     gtk4 \
     libical \
     gsettings-desktop-schemas \
@@ -23,7 +25,9 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-Support-building-against-libical-4.0.patch"
=20
-SRC_URI[archive.sha256sum] =3D "e69a5a66be820105a4d823d4dba9b4e6ef9f6e75=
23978aaf33361ebbb993e604"
+export GI_TYPELIB_PATH =3D "${STAGING_LIBDIR}/girepository-1.0/"
+
+SRC_URI[archive.sha256sum] =3D "4b75df071a52d98fb35e647d018030129d24d900=
7790d02457746c98617aeab0"
=20
 FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
--=20
2.55.0


