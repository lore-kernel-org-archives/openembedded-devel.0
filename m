Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ADFC07E8E
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:00:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.12007.1713765621761941606
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 2027713D70
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 08:00:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.11]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rymix-0eOXRs0; Mon, 22 Apr 2024 08:00:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/5] gnome-calendar: update 46.0 -> 46.1
Date: Mon, 22 Apr 2024 08:00:40 +0200
Message-ID: <20240422060041.222739-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240422060041.222739-1-f_l_k@t-online.de>
References: <20240422060041.222739-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713765619-71F10D2B-253754E8/0/0 CLEAN NORMAL
X-TOI-MSGID: 319cbcf6-ba0f-429d-9179-3c9035417ffa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110076

Major changes in 46.1:
* Cleanup shortcut handling of some dialogs
* Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_46.0.bb =3D> gnome-calendar_46.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_46.0.bb =3D=
> gnome-calendar_46.1.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.1.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.1.bb
index 707c4b583..eac768c8f 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.1.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "5e21960c174bd8606d9089bf79c70f31070ab483=
7919878b00db2f14af9fe718"
+SRC_URI[archive.sha256sum] =3D "9861ff7b8abd5b7b20690ba55eb7542c7ec534b5=
66269e29b5b1e858c1610897"
=20
 do_install:prepend() {
     sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.h
--=20
2.44.0


