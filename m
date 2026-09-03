Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E0FC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:19:39 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2920.1788423568608123775
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=RPT07R4P;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id E2B02EC38
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:19:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.36]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x22fL-44btZM0; Thu, 3 Sep 2026 10:19:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 5/6] gnome-shell: update
Date: Thu,  3 Sep 2026 10:19:15 +0200
Message-ID: <20260903081916.156273-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903081916.156273-1-f_l_k@t-online.de>
References: <20260903081916.156273-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788423563-87FFC9C8-A0241443/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d290582-2928-4bc9-9475-1afbf171a853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788423565; i=f_l_k@t-online.de;
	bh=0Al01A76QRdgBLFiifGe9+yIq8iTp/G8OD7ackrL/DE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RPT07R4PiGH4hvOfXohG5gvSacmNc7OMhaWxFjmZ8QdZR1EvB5LxJTIZVBkknP8MI
	 YDyDYdOHICpPxRUIExnXy0h0eYF50HPjSGhmcX4TjZASvxi6S2c27nOrszcikyIYfg
	 Zmno1WQEFp/Ed4fTneOuNk4MuCs3wR0y7eC7zS8mHqrpJLXx/Ro6EMtwifz+ibcViM
	 /K4u1okhAkv6iuBs4OtTJGGgmGGEv4sNGXaQS80oEgqiyPnXx7p6fEmlk3vmwpKwuu
	 EEkQvs7DUJYjrhyv7W+hJy+E4d9pMhCMmc2xcjiw+TZluOaZgiPkl7jalIGWnEzB0/
	 qzYM02yKWeUOw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129707

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ver-Fix-build-failure-with-libical-4.patch | 44 ++++++++++++++++++
 ...nome-shell_48.8.bb =3D> gnome-shell_50.4.bb} | 45 ++++++++++++-------
 2 files changed, 73 insertions(+), 16 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002=
-calendar-server-Fix-build-failure-with-libical-4.patch
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_48.8.bb =3D> gn=
ome-shell_50.4.bb} (65%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calend=
ar-server-Fix-build-failure-with-libical-4.patch b/meta-gnome/recipes-gno=
me/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-li=
bical-4.patch
new file mode 100644
index 0000000000..d64cf38ccc
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-serv=
er-Fix-build-failure-with-libical-4.patch
@@ -0,0 +1,44 @@
+From 91eaa9221b45b506d7a5d84a9ec8c204b5c8c34f Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@xry111.site>
+Date: Fri, 8 May 2026 13:13:37 +0800
+Subject: [PATCH] calendar-server: Fix build failure with libical 4
+
+Fix the following build error with libical 4 due to function signature c=
hanges:
+
+    error: passing argument 4 of 'get_time_from_property' from incompati=
ble pointer type [-Wincompatible-pointer-types]
+    note: expected 'ICalTime * (*)(ICalProperty *)' but argument is of t=
ype 'ICalTime * (*)(const ICalProperty *)'
+
+Link: https://github.com/libical/libical/blob/4.0/docs/MigrationGuide_to=
_4.md
+Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/42=
15>
+
+Only the gnome-shell-calendar-server.c hunk of the upstream commit is ta=
ken;
+src/calendar-server/reminder-watcher.c does not exist in the 50.x series=
.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-shell/-/=
commit/b34766f3992c7616b7816a47249fb463c053e5fa]
+---
+ src/calendar-server/gnome-shell-calendar-server.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/calendar-server/gnome-shell-calendar-server.c b/src/cal=
endar-server/gnome-shell-calendar-server.c
+index 0b2f88eb7..622c16181 100644
+--- a/src/calendar-server/gnome-shell-calendar-server.c
++++ b/src/calendar-server/gnome-shell-calendar-server.c
+@@ -112,11 +112,17 @@ typedef struct
+   time_t  end_time;
+ } CalendarAppointment;
+=20
++#if ICAL_CHECK_VERSION(4, 0, 0)
++typedef ICalTime * (* GetICalPropFunc) (const ICalProperty *prop);
++#else
++typedef ICalTime * (* GetICalPropFunc) (ICalProperty *prop);
++#endif
++
+ static gboolean
+ get_time_from_property (ECalClient            *cal,
+                         ICalComponent         *icomp,
+                         ICalPropertyKind       prop_kind,
+-                        ICalTime * (* get_prop_func) (ICalProperty *pro=
p),
++                        GetICalPropFunc        get_prop_func,
+                         ICalTimezone          *default_zone,
+                         ICalTime              **out_itt,
+                         ICalTimezone          **out_timezone)
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
similarity index 65%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
index e8b1bd6d0c..f39d72532e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
@@ -2,48 +2,58 @@ SUMMARY =3D "GNOME Shell is the graphical shell of the =
GNOME desktop environment"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-
 DEPENDS =3D " \
     libxml2-native \
-    gtk4 \
-    mutter \
+    at-spi2-core \
     evolution-data-server \
     gcr \
-    geocode-glib \
+    gdk-pixbuf \
     gjs \
     gnome-autoar \
     gnome-desktop \
-    gnome-control-center \
-    polkit \
-    pipewire \
-    libsoup-3.0 \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'startup-noti=
fication', d)} \
-    ibus \
     gsettings-desktop-schemas \
+    gtk4 \
+    libsoup-3.0 \
+    libxml2 \
+    mutter \
+    pango \
+    polkit \
 "
=20
 inherit gnomebase gsettings gettext gobject-introspection gtk-icon-cache=
 features_check bash-completion
=20
-REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam"
+REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam wayland"
=20
 GTKIC_VERSION =3D "4"
-GTKDOC_MESON_OPTION =3D "gtk_doc"
 GIR_MESON_OPTION =3D ""
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
 SRC_URI +=3D "file://0001-shell-app-usage.c-only-include-x11-headers-if-=
HAVE_X.patch"
-SRC_URI[archive.sha256sum] =3D "cb9b7d86cf362530e648e68caaf109a32af4e832=
874a26791ca8789773efd233"
-
-PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
+SRC_URI +=3D "file://0002-calendar-server-Fix-build-failure-with-libical=
-4.patch"
+SRC_URI[archive.sha256sum] =3D "c531939539db316a41aef23670370abd1330d325=
4f84bcb0f9f4dae5d6e362cf"
+
+PACKAGECONFIG ??=3D " \
+    camera-monitor \
+    extensions-tool \
+    nm \
+    portal-helper \
+    bluetooth \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
-PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
,networkmanager libsecret,networkmanager"
+PACKAGECONFIG[camera-monitor] =3D "-Dcamera_monitor=3Dtrue, -Dcamera_mon=
itor=3Dfalse, pipewire"
+PACKAGECONFIG[extensions-app] =3D "-Dextensions_app=3Dtrue, -Dextensions=
_app=3Dfalse"
+PACKAGECONFIG[extensions-tool] =3D "-Dextensions_tool=3Dtrue, -Dextensio=
ns_tool=3Dfalse, gnome-autoar json-glib libsoup-3.0"
+PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
, networkmanager libsecret, networkmanager"
+PACKAGECONFIG[portal-helper] =3D "-Dportal_helper=3Dtrue, -Dportal_helpe=
r=3Dfalse"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
=20
 EXTRA_OEMESON +=3D " \
     -Dtests=3Dfalse \
     -Dman=3Dfalse \
+    -Dgtk_doc=3Dfalse \
     --cross-file=3D${WORKDIR}/meson-${PN}.cross \
 "
=20
@@ -88,6 +98,9 @@ RDEPENDS:${PN} +=3D " \
 	librsvg-gtk \
 "
=20
+# The extensions app is a GJS application and pulls libadwaita at runtim=
e only.
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'extensions-a=
pp', 'libadwaita', '', d)}"
+
 PACKAGES =3D+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools =3D "${bindir}/*-tool"
 RDEPENDS:${PN}-tools =3D "python3-core"
--=20
2.55.0


