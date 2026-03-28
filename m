Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B4C10F3DC3
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 01:10:33 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3161.1774660228952605526
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=XV/nYtZE;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id D1AE9EDBB
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 02:10:24 +0100 (CET)
Received: from fedora.fritz.box ([84.163.35.64]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6IBw-46qDAX0; Sat, 28 Mar 2026 02:10:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nautilus: update 49.4 -> 49.5
Date: Sat, 28 Mar 2026 02:10:13 +0100
Message-ID: <20260328011013.980100-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774660220-767FB8E8-4BA2DE39/0/0 CLEAN NORMAL
X-TOI-MSGID: 2bbf1c3c-7794-42e8-9e62-ad574b0cd9c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774660224; i=f_l_k@t-online.de;
	bh=6vN6KLes4pmN4jV6v/bdaccsCemiIt1julVWZ5KGMN0=;
	h=From:To:Subject:Date;
	b=XV/nYtZEpd355FwLJahC24VrmxfduCZJo0/v/thGH3Qa/d0/J/h8y+z+VTkF6++3r
	 Sw7vFBB8RZCrJxsTQNuB22pmYb4OdspNZ4QmWM4p22ES0VQzCVvcchdYkjQJeUo7GS
	 gYyjZE6qIFrd7ydlwTHhhAd7zZ00crK6alf/53dMxCfuwPUtQzC6V/tBGlRcdUwyE2
	 7D8FPB/lNw7m/kJ5EIxLfBtHp2kwYtY9ip326NRt0B0t5VEH1TGRkkdoM6Ihmk0vLm
	 ccJj4UAf2T6rrGZw8YRE96VQGoMxp4bdRVHT166ygbMUtpxo5L3ySY+AGw4xHmZ44f
	 rsVGF6BmslByQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 01:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125795

Major Changes in 49.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Bugfixes:
- Avoid unnecessary delay before enabling Skip button (parzival)
- Fix crash when searching in Starred (Shivam)

* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_49.4.bb =3D> nautilus_49.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.4.bb =3D> nautilus=
_49.5.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_49.5.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
index 9befe945df..45e0969d66 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.4.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.5.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "1476d9459a63c85f0ebc18f237b32d12b008ad78=
6002376424919725f50e76a8"
+SRC_URI[archive.sha256sum] =3D "fa5655e73ee7953aecfe71fea67bfec0c67447e1=
4e6df135aa3f80334386872c"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
--=20
2.53.0


