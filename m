Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40263C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 06:47:38 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.12792.1669099655067555998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Nov 2022 22:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout05.t-online.de (Postfix) with SMTP id B4DC292CA
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 07:47:32 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.106]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxN48-4c2iET0; Tue, 22 Nov 2022 07:47:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/2] pipewire: upgrade 0.3.59 -> 0.3.60
Date: Tue, 22 Nov 2022 07:47:21 +0100
Message-Id: <20221122064723.314310-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669099652-C2B221D1-BD163D13/0/0 CLEAN NORMAL
X-TOI-MSGID: d14cc965-37b5-44cc-9b91-734f8f0bd09b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 06:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99679

 - switch PIPEWIRE_SESSION_MANAGER to wireplumber by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/{pipewire_0.3.59.bb =3D> pipewire_0.3.60.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.59.bb =3D=
> pipewire_0.3.60.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.59.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.60.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.59.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.60.bb
index 757c88c95..b925cddf6 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.59.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.60.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "f54a72fd9a67eeb8d1502d6d75979dbddb00fdf2"
+SRCREV =3D "38382d002d0905d60a964fc84dcaf4f8b507a473"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
@@ -76,7 +76,7 @@ CFLAGS:append =3D " -Wno-typedef-redefinition"
 # According to wireplumber documentation only one session manager should=
 be installed at a time
 # Possible options are media-session, which has fewer dependencies but i=
s very simple,
 # or wireplumber, which is more powerful.
-PIPEWIRE_SESSION_MANAGER ??=3D "media-session"
+PIPEWIRE_SESSION_MANAGER ??=3D "wireplumber"
=20
 FFMPEG_AVAILABLE =3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'co=
mmercial', 'ffmpeg', '', d)}"
 BLUETOOTH_AAC =3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'comme=
rcial', 'bluez-aac', '', d)}"
--=20
2.34.1


