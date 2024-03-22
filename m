Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92261C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 09:49:49 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.9223.1711100980371555800
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 02:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id 90D0D3EC9
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 10:49:38 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.243]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnbWr-0eyYr30; Fri, 22 Mar 2024 10:49:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] wireplumber: update 0.4.17 -> 0.5.0
Date: Fri, 22 Mar 2024 10:49:57 +0100
Message-ID: <20240322094957.439681-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711100977-E6A6E957-DDB9E301/0/0 CLEAN NORMAL
X-TOI-MSGID: 5221402b-f177-4c90-8fe4-b48248b5f816
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 09:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109517

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.4.17.bb =3D> wireplumber_0.5.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.1=
7.bb =3D> wireplumber_0.5.0.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.17.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5=
.0.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.17.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.=
0.bb
index 3959cd7f8..8aa95a3e9 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.17.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.0.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "d3eb77b292655cef333a8f4cab4e861415bc37c2"
+SRCREV =3D "59d190a2bd400f3b093f99b16fc0fb06f6cb2cfe"
 SRC_URI =3D " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaste=
r;protocol=3Dhttps \
     file://90-OE-disable-session-dbus-dependent-features.lua \
@@ -50,7 +50,7 @@ PACKAGECONFIG[dbus] =3D ""
 PACKAGESPLITFUNCS:prepend =3D " split_dynamic_packages "
 PACKAGESPLITFUNCS:append =3D " set_dynamic_metapkg_rdepends "
=20
-WP_MODULE_SUBDIR =3D "wireplumber-0.4"
+WP_MODULE_SUBDIR =3D "wireplumber-0.5"
=20
 do_install:append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'false', 'true', d)=
}; then
--=20
2.44.0


