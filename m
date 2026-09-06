Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEE0C79FA2
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:31 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11201.1788687443474120551
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=o7G4cO8f;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id 665331C44D
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JO-22AhJg0; Sun, 6 Sep 2026 11:37:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/15] gnome-settings-daemon: upgrade 49.1 -> 50.1
Date: Sun,  6 Sep 2026 11:36:59 +0200
Message-ID: <20260906093713.797648-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687438-E67FB956-BB42C4C5/0/0 CLEAN NORMAL
X-TOI-MSGID: 829304ee-4a64-4fd6-9522-34fc3c1e6de8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=jbHurlKdEGzI9aOkuPQZjW3ciTlFC9yjJDM9XNcqjqg=;
	h=From:To:Subject:Date;
	b=o7G4cO8fUS/1oTWYnJyuwIsX0wDmknOgKAFPEki3Hh8pO8RfrjqgzguJU3XTGFK9+
	 bNNSfjFr+y2lLriSwJ/CEn7kAHRK7Z9bIAtgBYkA0Z/yOHoo2uG66NqLA5FySWo2zu
	 myRIIftALmLa/0Ib0hgMnMGasHpQDvGfu88H8LKYVSDvPN1lxDk6hR5afzd6glKUkj
	 k9ohn5fX1sNp3XOWqDr6VawNspuXL0nXm0leh0EcIIj0SDkznhq8tRb/Mh5M1vfV16
	 Zr2DsubsGwVwGD/UyLCNewu6KuUjWq/x8UT7V06fmOXxRrjSmtNOTCMw9vHWL3kI6J
	 ic6BqBoKDSVTQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129781

The x11 meson option is gone together with the X11 session support, so
drop the x11 PACKAGECONFIG. The new systemd-units option is tied to the
systemd PACKAGECONFIG. The reproducibility patch for the smartcard enum
types is included upstream.

Build tested on corei7-64.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...um-types.c.in-fix-reproducibility-is.patch | 42 -------------------
 ..._49.1.bb =3D> gnome-settings-daemon_50.1.bb} |  8 ++--
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-=
settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is=
.patch
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_49.1.bb =3D> gnome-settings-daemon_50.1.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch =
b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/00=
01-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
deleted file mode 100644
index 1aeb566609..0000000000
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Thu, 15 Jan 2026 14:33:58 +0100
-Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility issue
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-setting=
s-daemon/-/merge_requests/467]=20
----
- plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
- plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in b/plugins/s=
martcard/gsd-smartcard-enum-types.c.in
-index f281cf4e..0a970105 100644
---- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
-+++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
-@@ -5,8 +5,8 @@
- /*** END file-header ***/
-=20
- /*** BEGIN file-production ***/
--#include "@filename@"
--/* enumerations from "@filename@" */
-+#include "@basename@"
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
-diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in b/plugins/s=
martcard/gsd-smartcard-enum-types.h.in
-index 79dcc3d8..3906ba4c 100644
---- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
-+++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
-@@ -9,7 +9,7 @@ G_BEGIN_DECLS
-=20
- /*** BEGIN file-production ***/
-=20
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
-=20
- /*** BEGIN value-header ***/
---=20
-2.52.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_49.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_50.1.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_49.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_50.1.bb
index 4a8b7a33cc..a0f8b81824 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_50.1.bb
@@ -25,14 +25,13 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "alsa polkit pulseaudio systemd gobject-int=
rospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI +=3D "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibil=
ity-is.patch"
-SRC_URI[archive.sha256sum] =3D "2a9957fc4f91c3b9127b49484179bef485120d9c=
1c208e44d44e6a746e6cc1c1"
+SRC_URI[archive.sha256sum] =3D "dd2c9730914f0ececa0229dd8a8c2940a57ddeb0=
802434558d4b164d79cfe05c"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-settings-da=
emon/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
 PACKAGECONFIG ??=3D " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
     gudev \
     smartcard \
@@ -41,9 +40,8 @@ PACKAGECONFIG ??=3D " \
 PACKAGECONFIG[cups] =3D "-Dcups=3Dtrue,-Dcups=3Dfalse,cups"
 PACKAGECONFIG[gudev] =3D "-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgudev"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Dtrue,-Dsmartcard=3Dfalse,nss=
"
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd-units=3Dtrue,-Dsy=
stemd=3Dfalse -Dsystemd-units=3Dfalse,systemd"
 PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse"
-PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,libx11 libxfixes"
=20
 def gnome_verdir(v):
    return oe.utils.trim_version(v, 1)
--=20
2.55.0


