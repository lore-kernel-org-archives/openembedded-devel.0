Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F75FC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:52:22 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.75188.1747140740449843098
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 7B9215E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 14:52:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.233]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uEp7J-3FhvG60; Tue, 13 May 2025 14:52:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] mutter: use libxcvt instead of xserver-xorg-cvt
Date: Tue, 13 May 2025 14:52:08 +0200
Message-ID: <20250513125209.1088462-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513125209.1088462-1-f_l_k@t-online.de>
References: <20250513125209.1088462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747140737-11FF95CE-6184DB2A/0/0 CLEAN NORMAL
X-TOI-MSGID: 430dd38a-abbf-426b-94f6-354f1cbd71f0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 12:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117396

xserver-xorg-cvt is deprecated and libxcvt can be used as drop-in replace=
ment

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/mutter/mutter_48.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_48.0.bb
index 777fef79b0..6f799ad57a 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.0.bb
@@ -3,7 +3,6 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D " \
-    xserver-xorg-cvt-native \
     wayland-native \
     virtual/libx11 \
     colord \
@@ -16,6 +15,7 @@ DEPENDS =3D " \
     json-glib \
     libdisplay-info \
     libei \
+    libxcvt-native \
     libxtst \
     libxkbfile \
     python3-argcomplete-native \
--=20
2.49.0


