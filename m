Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10DFCDD543
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 15:29:58 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.18265.1726673389686268832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 08:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout08.t-online.de (Postfix) with SMTP id 93F5425B4A
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 17:29:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.189]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sqwcj-0Ag9lh0; Wed, 18 Sep 2024 17:29:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] colord: add configuration to fix runtime
Date: Wed, 18 Sep 2024 17:31:32 +0200
Message-ID: <20240918153132.2335-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726673385-DAFFB45E-206F7580/0/0 CLEAN NORMAL
X-TOI-MSGID: d142114f-d47a-49a5-8f9f-4ea12b5110af
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 15:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112359

Make colord work out of the box

- We already create a colord user -> make use of it by passing the userna=
me
  to the 'daemon_user' meson option. The conf files and systemd service f=
ile
  will then be created accordingly.
- Add a backport patch to fix 'only root can write into /var' issue.
  This prevents colord from starting
  [https://github.com/hughsie/colord/issues/166]
- Set the runtime path for hwdata pnp.ids and
  add hwdata to RDEPENDS:${PN} for non systemd images
- inherit gtk-doc to make api-documentation available
- Dont create a home-dir for colord user. It shouldn't need one.

NOTE:
colord will fail on first run with missing databases.
After second boot it should run as expected.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/colord/colord.bb      | 32 +++++++++++--------
 ...2b2379fb5582f4312e59bf51a2823df56276.patch | 28 ++++++++++++++++
 2 files changed, 47 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-support/colord/colord/08a32b2379fb558=
2f4312e59bf51a2823df56276.patch

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-s=
upport/colord/colord.bb
index e30022251..6eb9db8da 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -1,28 +1,33 @@
 require ${BPN}.inc
=20
-inherit meson gobject-introspection gsettings gettext bash-completion sy=
stemd features_check useradd pkgconfig
+inherit meson gobject-introspection gsettings gtk-doc gettext bash-compl=
etion systemd features_check useradd pkgconfig
=20
 # polkit and gobject-introspection are mandatory and cannot be configure=
d
 REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
=20
 DEPENDS +=3D " \
-    ${BPN}-native \
-    glib-2.0 \
-    lcms \
-    sqlite3 \
-    libgusb \
-    libgudev \
-    polkit \
+	${BPN}-native \
+	dbus \
+	glib-2.0 \
+	lcms \
+	libgudev \
+	libgusb \
+	polkit \
+	sqlite3 \
 "
=20
+RDEPENDS:${PN} +=3D "hwdata"
+
 SRC_URI +=3D " \
-    file://0001-Run-native-cd_idt8-cd_create_profile.patch \
+	file://0001-Run-native-cd_idt8-cd_create_profile.patch \
+	file://08a32b2379fb5582f4312e59bf51a2823df56276.patch \
 "
=20
-EXTRA_OEMESON =3D " \
-    -Dman=3Dfalse \
-    -Ddocs=3Dfalse \
+EXTRA_OEMESON +=3D " \
+	-Dman=3Dfalse \
+	-Ddaemon_user=3Dcolord \
+	-Dpnp_ids=3D${datadir}/hwdata/pnp.ids \
 "
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
@@ -42,4 +47,5 @@ FILES:${PN} +=3D " \
 "
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --user-group -d /var/lib/colord -s /bi=
n/false colord"
+USERADD_PARAM:${PN} =3D "--system --user-group -s /bin/false colord"
+
diff --git a/meta-oe/recipes-support/colord/colord/08a32b2379fb5582f4312e=
59bf51a2823df56276.patch b/meta-oe/recipes-support/colord/colord/08a32b23=
79fb5582f4312e59bf51a2823df56276.patch
new file mode 100644
index 000000000..860e6ab4a
--- /dev/null
+++ b/meta-oe/recipes-support/colord/colord/08a32b2379fb5582f4312e59bf51a=
2823df56276.patch
@@ -0,0 +1,28 @@
+From 08a32b2379fb5582f4312e59bf51a2823df56276 Mon Sep 17 00:00:00 2001
+From: Richard Hughes <richard@hughsie.com>
+Date: Mon, 29 Jan 2024 10:37:11 +0000
+Subject: [PATCH] Fix writing to the database with ProtectSystem=3Dstrict
+
+Fixes https://github.com/hughsie/colord/issues/166
+
+Upstream-Status: Backport [https://github.com/hughsie/colord/commit/08a3=
2b2379fb5582f4312e59bf51a2823df56276]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ data/colord.service.in | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/data/colord.service.in b/data/colord.service.in
+index 6825d944..c358dc4b 100644
+--- a/data/colord.service.in
++++ b/data/colord.service.in
+@@ -17,6 +17,10 @@ ProtectControlGroups=3Dtrue
+ RestrictRealtime=3Dtrue
+ RestrictAddressFamilies=3DAF_UNIX
+=20
++ConfigurationDirectory=3Dcolord
++StateDirectory=3Dcolord
++CacheDirectory=3Dcolord
++
+ # drop all capabilities
+ CapabilityBoundingSet=3D~CAP_SETUID CAP_SETGID CAP_SETPCAP CAP_SYS_ADMI=
N CAP_SYS_PTRACE CAP_CHOWN CAP_FSETID CAP_SETFCAP CAP_DAC_OVERRIDE CAP_DA=
C_READ_SEARCH CAP_FOWNER CAP_IPC_OWNER CAP_NET_ADMIN CAP_SYS_RAWIO CAP_SY=
S_TIME CAP_AUDIT_CONTROL CAP_AUDIT_READ CAP_AUDIT_WRITE CAP_KILL CAP_MKNO=
D CAP_NET_BIND_SERVICE CAP_NET_BROADCAST CAP_NET_RAW CAP_SYS_NICE CAP_SYS=
_RESOURCE CAP_MAC_ADMIN CAP_MAC_OVERRIDE CAP_SYS_BOOT CAP_LINUX_IMMUTABLE=
 CAP_IPC_LOCK CAP_SYS_CHROOT CAP_BLOCK_SUSPEND CAP_LEASE CAP_SYS_PACCT CA=
P_SYS_TTY_CONFIG CAP_WAKE_ALARM
+=20
--=20
2.46.0


