Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E299EC6FA82
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 23:08:28 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.119.1662678500158143866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 16:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id 04A75160CB
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 01:08:18 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.39.189]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oWQcv-1GToPp0; Fri, 9 Sep 2022 01:08:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: update 0.3.56 -> 0.3.57
Date: Fri,  9 Sep 2022 01:07:51 +0200
Message-Id: <20220908230751.2788760-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662678485-2488F98D-42FBD035/0/0 CLEAN NORMAL
X-TOI-MSGID: 491ae2fb-cae4-469e-a3ee-5994425a76de
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Sep 2022 23:08:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98723

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...01-avb-fix-compilation-on-big-endian.patch | 53 -------------------
 ...{pipewire_0.3.56.bb =3D> pipewire_0.3.57.bb} | 12 ++---
 2 files changed, 5 insertions(+), 60 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/=
0001-avb-fix-compilation-on-big-endian.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.56.bb =3D=
> pipewire_0.3.57.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-av=
b-fix-compilation-on-big-endian.patch b/meta-multimedia/recipes-multimedi=
a/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
deleted file mode 100644
index fc618b4a7..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-c=
ompilation-on-big-endian.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 1a5ec4452fa21592eaeeb823ad95a1db6eb60376 Mon Sep 17 00:00:00 2001
-From: Wim Taymans <wtaymans@redhat.com>
-Date: Tue, 19 Jul 2022 13:49:42 +0200
-Subject: [PATCH 001/113] avb: fix compilation on big endian
-
-Patch-Status: Backport
-
----
- src/modules/module-avb/aaf.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/modules/module-avb/aaf.h b/src/modules/module-avb/aaf.h
-index cb4871ca6..b444ce251 100644
---- a/src/modules/module-avb/aaf.h
-+++ b/src/modules/module-avb/aaf.h
-@@ -35,7 +35,7 @@ struct avb_packet_aaf {
- 	unsigned gv:1;
- 	unsigned tv:1;
-=20
--	uint8_t seq_number;
-+	uint8_t seq_num;
-=20
- 	unsigned _r2:7;
- 	unsigned tu:1;
-diff --git a/src/modules/module-avb/iec61883.h b/src/modules/module-avb/=
iec61883.h
-index d3b3a7daa..6ca8724ad 100644
---- a/src/modules/module-avb/iec61883.h
-+++ b/src/modules/module-avb/iec61883.h
-@@ -37,7 +37,7 @@ struct avb_packet_iec61883 {
- 	unsigned gv:1;
- 	unsigned tv:1;
-=20
--	uint8_t seq_number;
-+	uint8_t seq_num;
-=20
- 	unsigned _r2:7;
- 	unsigned tu:1;
-diff --git a/spa/plugins/avb/avbtp/packets.h b/spa/plugins/avb/avbtp/pac=
kets.h
-index 7047456bf..3d4a652ee 100644
---- a/spa/plugins/avb/avbtp/packets.h
-+++ b/spa/plugins/avb/avbtp/packets.h
-@@ -116,7 +116,7 @@ struct spa_avbtp_packet_aaf {
- 	unsigned gv:1;
- 	unsigned tv:1;
-=20
--	uint8_t seq_number;
-+	uint8_t seq_num;
-=20
- 	unsigned _r2:7;
- 	unsigned tu:1;
---=20
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.57.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.b=
b
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.57.bb
index feefe7c15..0ca8fd0dc 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.57.bb
@@ -13,11 +13,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D "dbus ncurses"
=20
-SRCREV =3D "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
-SRC_URI =3D " \
-	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3Dmaster;prot=
ocol=3Dhttps \
-	file://0001-avb-fix-compilation-on-big-endian.patch \
-"
+SRCREV =3D "49f1c2038fb7b5249affa56709b117a2a8603b52"
+SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=3D=
master;protocol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -86,7 +83,7 @@ BLUETOOTH_AAC =3D "${@bb.utils.contains('LICENSE_FLAGS_=
ACCEPTED', 'commercial', 'b
=20
 PACKAGECONFIG:class-target ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}=
 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETO=
OTH_AAC}', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-op=
us ${BLUETOOTH_AAC}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
     ${PIPEWIRE_SESSION_MANAGER} \
@@ -102,6 +99,7 @@ PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddis=
abled,alsa-lib udev,,pipewire-al
 PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi"
 PACKAGECONFIG[bluez] =3D "-Dbluez5=3Denabled,-Dbluez5=3Ddisabled,bluez5 =
sbc"
 PACKAGECONFIG[bluez-aac] =3D "-Dbluez5-codec-aac=3Denabled,-Dbluez5-code=
c-aac=3Ddisabled,fdk-aac"
+PACKAGECONFIG[bluez-opus] =3D "-Dbluez5-codec-opus=3Denabled,-Dbluez5-co=
dec-opus=3Ddisabled,libopus"
 PACKAGECONFIG[docs] =3D "-Ddocs=3Denabled,-Ddocs=3Ddisabled,doxygen-nati=
ve graphviz-native"
 PACKAGECONFIG[ffmpeg] =3D "-Dffmpeg=3Denabled,-Dffmpeg=3Ddisabled,ffmpeg=
"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,gstreamer1.0-pipewire=
"
@@ -248,7 +246,7 @@ CONFFILES:${PN} +=3D "${datadir}/pipewire/pipewire.co=
nf"
 FILES:${PN} =3D " \
     ${datadir}/pipewire \
     ${systemd_system_unitdir}/pipewire* \
-    ${systemd_user_unitdir}/pipewire* \
+    ${systemd_user_unitdir} \
     ${bindir}/pipewire \
     ${bindir}/pipewire-avb \
 "
--=20
2.34.1


