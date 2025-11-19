Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4CACF3972
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:03:09 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12182.1763571783939308318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 09:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout05.t-online.de (Postfix) with SMTP id C9407DEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 18:02:58 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.168.50]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vLla5-2HgJLV0; Wed, 19 Nov 2025 18:02:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-remote-desktop: remove obsolete patch
Date: Wed, 19 Nov 2025 18:02:49 +0100
Message-ID: <20251119170249.204447-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1763571777-B0FF743C-BA740C6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e38ddac-0678-45f3-8610-fb91c3f189ef
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 17:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121911

With latest freerdp3 release its not required anymore
---
 ...uild-add-missing-dependency-on-winpr.patch | 34 -------------------
 .../gnome-remote-desktop_49.1.bb              |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-gnome/dynamic-layers/meta-security/recipes-gnome=
/gnome-remote-desktop/gnome-remote-desktop/0001-src-meson.build-add-missi=
ng-dependency-on-winpr.patch

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop/0001-src-meson.build-add-missing-depe=
ndency-on-winpr.patch b/meta-gnome/dynamic-layers/meta-security/recipes-g=
nome/gnome-remote-desktop/gnome-remote-desktop/0001-src-meson.build-add-m=
issing-dependency-on-winpr.patch
deleted file mode 100644
index c10962a447..0000000000
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop/0001-src-meson.build-add-missing-dependency-=
on-winpr.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 22f223873de1e805ad8760cdf59a1e7af89a436c Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 28 Oct 2025 19:33:44 +0100
-Subject: [PATCH] src/meson.build: add missing dependency on winpr
-
-This fixes:
-    | In file included from ../sources/gnome-remote-desktop-49.1/src/grd=
-settings.c:28:
-    | /home/flk/poky/build/tmp/work/corei7-64-poky-linux/gnome-remote-de=
sktop/49.1/recipe-sysroot/usr/include/freerdp3/freerdp/freerdp.h:25:10: f=
atal error: winpr/stream.h: No such file or directory
-    |    25 | #include <winpr/stream.h>
-    |       |          ^~~~~~~~~~~~~~~~
-    | compilation terminated.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-remote-=
desktop/-/merge_requests/350]
----
- src/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/meson.build b/src/meson.build
-index 1b2cb93..cca475a 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -360,6 +360,7 @@ if have_rdp
-   ctl_deps +=3D [
-     freerdp_dep,
-     polkit_dep,
-+    winpr_dep,
-   ]
-=20
-   enable_service_sources =3D ([
---=20
-2.51.0
-
diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_49.1.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_49.1=
.bb
index a102af9792..2ffa9a800e 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_49.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_49.1.bb
@@ -8,7 +8,6 @@ inherit gnomebase pkgconfig gettext gsettings features_ch=
eck useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI +=3D "file://0001-src-meson.build-add-missing-dependency-on-winp=
r.patch"
 SRC_URI[archive.sha256sum] =3D "7800f388301eeb8147b0be55e8fa7cbd7521066a=
48a06115cc0ead9f0cea188a"
=20
 DEPENDS =3D " \
--=20
2.51.0


