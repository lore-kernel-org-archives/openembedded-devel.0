Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269B7C4167B
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 14:04:04 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.25285.1700921034939686229
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Nov 2023 06:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id C0F6F21F6C
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Nov 2023 15:03:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.202]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6tFm-1ojE4v0; Sat, 25 Nov 2023 15:03:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] system-config-printer: Add packageconfig for polkit
Date: Sat, 25 Nov 2023 15:03:17 +0100
Message-ID: <20231125140317.12111-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700921006-D67FB93F-4468C216/0/0 CLEAN NORMAL
X-TOI-MSGID: 4e340491-55f8-4fa3-a3fa-b55012db9ddc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Nov 2023 14:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107049

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../system-config-printer/system-config-printer_1.5.18.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/=
system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/d=
ynamic-layers/meta-python/recipes-printing/system-config-printer/system-c=
onfig-printer_1.5.18.bb
index 4f1498546..ead875824 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-=
config-printer/system-config-printer_1.5.18.bb
@@ -13,8 +13,9 @@ REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-dat=
a"
=20
 DEPENDS =3D "cups glib-2.0 libusb xmlto-native desktop-file-utils-native=
 autoconf-archive-native"
=20
-PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd polki=
t', d)}"
 PACKAGECONFIG[systemd] =3D ",--without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[polkit] =3D ",,,cups-pk-helper"
=20
 do_configure:prepend() {
     # This file is not provided if fetching from git but required for co=
nfigure
--=20
2.42.0


