Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC846C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 18:49:58 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.2538.1742410194892251113
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 11:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id 7BB45C0D
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 19:49:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.245]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuyU7-13jEo80; Wed, 19 Mar 2025 19:49:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] gnome-system-monitor: update 47.1 -> 48.0
Date: Wed, 19 Mar 2025 19:50:29 +0100
Message-ID: <20250319185029.296821-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319185029.296821-1-f_l_k@t-online.de>
References: <20250319185029.296821-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742410187-0B7E896A-4F86E3E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ad6d8c4-5dc7-4396-889e-c1ba36933ce1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 18:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116104

- add catch2 dependency

New in 48.0 - 15 March 2025
* Updated translations
New in 48.rc - 1 March 2025
* Updated translations
New in 48.beta - 1 February 2025
* Updated translations
* Code improvements (David Stone)
* Fixed memory leaks drawing graphs #302 !190 (Matthew House)
New in 48.alpha - 11 January 2025
* Updated translations
* Ensure search button is only active on processes page !161 (=C3=93scar =
Fern=C3=A1ndez D=C3=ADaz)
* Drop lsof ellipses following Human Interface Guidelines !163 (=C3=93sca=
r Fern=C3=A1ndez D=C3=ADaz)
* Fix resuming from suspended state #304 !166 (Ball=C3=B3 Gy=C3=B6rgy)
* Fix high disks writes during window resize #327 !167 (=C3=93scar Fern=C3=
=A1ndez D=C3=ADaz)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ome-system-monitor_47.1.bb =3D> gnome-system-monitor_48.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monit=
or_47.1.bb =3D> gnome-system-monitor_48.0.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_47.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_48.0.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-mo=
nitor_47.1.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor_48.0.bb
index e26ae991ff..35d1adf700 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
48.0.bb
@@ -3,6 +3,7 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
 DEPENDS =3D " \
+    catch2 \
     gnome-common-native \
     libxml2-native \
     glib-2.0-native \
@@ -22,7 +23,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon=
-cache features_check get
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "d3c5714fd91fa7f05d6775e6797ccdab3149f131=
d1aa776a3352e2addb110f01"
+SRC_URI[archive.sha256sum] =3D "e4e5b345fbd4d7dc2f40ad6c62305ae5c7cc2b46=
5ce95988692a54af347532a3"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
--=20
2.48.1


