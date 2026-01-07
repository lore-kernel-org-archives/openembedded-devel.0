Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA642D0D14C
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:31:27 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11707.1767807078140065994
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 09:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 0FD01A22
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 18:31:16 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.225.85]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vdXNG-3EXKLZ0; Wed, 7 Jan 2026 18:31:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pavucontrol: update 5.0 -> 6.2
Date: Wed,  7 Jan 2026 18:31:04 +0100
Message-ID: <20260107173104.211861-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1767807070-6DFF885C-BF7D88A6/0/0 CLEAN NORMAL
X-TOI-MSGID: f2187361-bb8b-4096-a205-853adef74040
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 17:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123226

- switch to meson buildsystem
- pavucontrol now requires gtk4 and thus requires gpu acceleration
- remove patch. Meanwhile libcanberra is optional and build doesn't
  fail without anymore
- pavucontrol was migrated from intltool to gettext
- add packageconfigs for libcanberra and lynx to have both disabled
  by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ucontrol-remove-canberra-gtk-support.patch | 112 ------------------
 .../pulseaudio/pavucontrol_5.0.bb             |  27 -----
 .../pulseaudio/pavucontrol_6.2.bb             |  22 ++++
 3 files changed, 22 insertions(+), 139 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/000=
1-pavucontrol-remove-canberra-gtk-support.patch
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0=
.bb
 create mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2=
.bb

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavuc=
ontrol-remove-canberra-gtk-support.patch b/meta-oe/recipes-multimedia/pul=
seaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch
deleted file mode 100644
index 44169240c5..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-=
remove-canberra-gtk-support.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 87992a57e5f517d5ceb5dfabaea662ac64983720 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Fri, 27 May 2022 18:37:53 +0200
-Subject: [PATCH] pavucontrol: remove canberra-gtk support
-
-libcanberra-gtk3 module isn't buildable for wayland.
-Remove its dpendency.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Inappropriate
----
- configure.ac           |  2 +-
- src/pavuapplication.cc |  2 --
- src/pavucontrol.cc     |  4 ----
- src/sinkwidget.cc      | 17 -----------------
- 4 files changed, 1 insertion(+), 24 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 056ba5e..e857563 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,7 +41,7 @@ AC_TYPE_SIGNAL
- AC_HEADER_STDC
- AX_CXX_COMPILE_STDCXX_11
-=20
--PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 libcanberra=
-gtk3 >=3D 0.16 json-glib-1.0 ])
-+PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 json-glib-1=
.0 ])
- AC_SUBST(GUILIBS_CFLAGS)
- AC_SUBST(GUILIBS_LIBS)
-=20
-diff --git a/src/pavuapplication.cc b/src/pavuapplication.cc
-index 6773b53..60c016c 100644
---- a/src/pavuapplication.cc
-+++ b/src/pavuapplication.cc
-@@ -24,8 +24,6 @@
-=20
- #include "i18n.h"
-=20
--#include <canberra-gtk.h>
--
- #include "pavuapplication.h"
- #include "pavucontrol.h"
- #include "mainwindow.h"
-diff --git a/src/pavucontrol.cc b/src/pavucontrol.cc
-index 18d5400..10ab646 100644
---- a/src/pavucontrol.cc
-+++ b/src/pavucontrol.cc
-@@ -29,8 +29,6 @@
- #include <json-glib/json-glib.h>
- #endif
-=20
--#include <canberra-gtk.h>
--
- #include "pavucontrol.h"
- #include "i18n.h"
- #include "minimalstreamwidget.h"
-@@ -916,8 +914,6 @@ MainWindow* pavucontrol_get_window(pa_glib_mainloop =
*m, bool maximize, bool _ret
-     tab_number =3D _tab_number;
-     retry =3D _retry;
-=20
--    ca_context_set_driver(ca_gtk_context_get(), "pulse");
--
-     mainWindow =3D MainWindow::create(maximize);
-=20
-     api =3D pa_glib_mainloop_get_api(m);
-diff --git a/src/sinkwidget.cc b/src/sinkwidget.cc
-index f30bd37..482fd1f 100644
---- a/src/sinkwidget.cc
-+++ b/src/sinkwidget.cc
-@@ -24,7 +24,6 @@
-=20
- #include "sinkwidget.h"
-=20
--#include <canberra-gtk.h>
- #if HAVE_EXT_DEVICE_RESTORE_API
- #  include <pulse/format.h>
- #  include <pulse/ext-device-restore.h>
-@@ -111,7 +110,6 @@ SinkWidget* SinkWidget::create(MainWindow* mainWindo=
w) {
- void SinkWidget::executeVolumeUpdate() {
-     pa_operation* o;
-     char dev[64];
--    int playing =3D 0;
-=20
-     if (!(o =3D pa_context_set_sink_volume_by_index(get_context(), inde=
x, &volume, NULL, NULL))) {
-         show_error(_("pa_context_set_sink_volume_by_index() failed"));
-@@ -120,22 +118,7 @@ void SinkWidget::executeVolumeUpdate() {
-=20
-     pa_operation_unref(o);
-=20
--    ca_context_playing(ca_gtk_context_get(), 2, &playing);
--    if (playing)
--        return;
--
-     snprintf(dev, sizeof(dev), "%lu", (unsigned long) index);
--    ca_context_change_device(ca_gtk_context_get(), dev);
--
--    ca_gtk_play_for_widget(GTK_WIDGET(gobj()),
--                           2,
--                           CA_PROP_EVENT_DESCRIPTION, _("Volume Control=
 Feedback Sound"),
--                           CA_PROP_EVENT_ID, "audio-volume-change",
--                           CA_PROP_CANBERRA_CACHE_CONTROL, "permanent",
--                           CA_PROP_CANBERRA_ENABLE, "1",
--                           NULL);
--
--    ca_context_change_device(ca_gtk_context_get(), NULL);
- }
-=20
- void SinkWidget::onMuteToggleButton() {
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb b/m=
eta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
deleted file mode 100644
index 29500bdb94..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION =3D "PulseAudio Volume Control (pavucontrol) is a simple GTK=
 based volume control tool ("mixer") for the PulseAudio sound server."
-HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/pavucontrol/"
-SECTION =3D "x11/multimedia"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
-
-# glib-2.0-native is required for glib-gettextize, which is used by the
-# AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated, s=
o the
-# glib-2.0-native dependency may go away at some point (something to kee=
p in
-# mind when doing version upgrades).
-DEPENDS =3D "libxml-parser-perl-native intltool-native glib-2.0-native g=
tkmm3 pulseaudio json-glib"
-
-inherit autotools features_check perlnative pkgconfig
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-SRC_URI =3D "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}=
.tar.xz"
-SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-pavucontrol-remove-canberra-gtk-support.patch', '', d)}"
-
-SRC_URI[sha256sum] =3D "ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3a36=
d20536af2e8f4e7a"
-
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] =3D ",,libcanberra"
-
-EXTRA_OECONF =3D "--disable-lynx "
-
-RDEPENDS:${PN} +=3D "pulseaudio-server"
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b/m=
eta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
new file mode 100644
index 0000000000..b6b9a068a9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "PulseAudio Volume Control is a simple GTK based volume cont=
rol tool for the PulseAudio sound server"
+HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/pavucontrol/"
+SECTION =3D "multimedia"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "gtkmm4 pulseaudio json-glib"
+
+inherit meson features_check pkgconfig gettext
+
+ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
+
+SRC_URI =3D "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}=
.tar.xz"
+SRC_URI[sha256sum] =3D "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90=
e89ed52fd4f15d32"
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[audio-feedback] =3D "-Daudio-feedback=3Denabled,-Daudio-fe=
edback=3Ddisabled,libcanberra"
+PACKAGECONFIG[lynx] =3D "-Dlynx=3Denabled,-Dlynx=3Ddisabled,lynx"
+
+FILES:${PN} +=3D "${datadir}"
+
+RDEPENDS:${PN} +=3D "pulseaudio-server"
--=20
2.52.0


