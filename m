Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC2FD743E8
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 22:04:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.161.1732140233703592414
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 14:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout10.t-online.de (Postfix) with SMTP id 97B5063A
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 23:03:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.160.173]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tDsne-12FfWL0; Wed, 20 Nov 2024 23:03:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] eog: add itstool-native dependency
Date: Wed, 20 Nov 2024 23:06:08 +0100
Message-ID: <20241120220608.1690113-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732140230-72FFB700-CEE121D1/0/0 CLEAN NORMAL
X-TOI-MSGID: d93d2726-8fb4-40e1-a62e-08e611c95991
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 22:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113940

fixes:
| ../eog-47.0/help/meson.build:45:6: ERROR: Program 'itstool' not found o=
r not executable
|
| A full log can be found at /home/flk/poky/build/tmp/work/corei7-64-poky=
-linux/eog/47.0/build/meson-logs/meson-log.txt
| ERROR: meson failed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/eog_47.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/eog/eog_47.0.bb b/meta-gnome/recipe=
s-gnome/eog/eog_47.0.bb
index 8e0583cf9..82a1febed 100644
--- a/meta-gnome/recipes-gnome/eog/eog_47.0.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_47.0.bb
@@ -3,6 +3,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D " \
+    itstool-native \
     librsvg \
     gnome-desktop \
     gsettings-desktop-schemas \
--=20
2.47.0


