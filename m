Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E53C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 12:44:03 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.24945.1653828232970678217
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 05:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 13E44500E
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 14:43:51 +0200 (CEST)
Received: from localhost.localdomain ([84.163.37.187]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nvIGn-1a7Qyf0; Sun, 29 May 2022 14:43:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] pavucontrol: update; fix build for wayland only
Date: Sun, 29 May 2022 14:43:31 +0200
Message-Id: <20220529124332.28817-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653828225-01421A9A-2C75C990/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d66702e-5115-4ebf-abbf-c339deda67bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 May 2022 12:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97317

- Update to v5.0
- Add a patch for wayland builds that removes canberra dependency. Since =
the
  canberra-gtk+3 module paradoxically depends on gtk+2 it is unbuildable =
for
  wayland.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ucontrol-remove-canberra-gtk-support.patch | 112 ++++++++++++++++++
 ...{pavucontrol_4.0.bb =3D> pavucontrol_5.0.bb} |  15 ++-
 2 files changed, 121 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/000=
1-pavucontrol-remove-canberra-gtk-support.patch
 rename meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_4.0.bb =3D> pa=
vucontrol_5.0.bb} (66%)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavuc=
ontrol-remove-canberra-gtk-support.patch b/meta-oe/recipes-multimedia/pul=
seaudio/pavucontrol/0001-pavucontrol-remove-canberra-gtk-support.patch
new file mode 100644
index 000000000..44169240c
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0001-pavucontrol-=
remove-canberra-gtk-support.patch
@@ -0,0 +1,112 @@
+From 87992a57e5f517d5ceb5dfabaea662ac64983720 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 27 May 2022 18:37:53 +0200
+Subject: [PATCH] pavucontrol: remove canberra-gtk support
+
+libcanberra-gtk3 module isn't buildable for wayland.
+Remove its dpendency.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate
+---
+ configure.ac           |  2 +-
+ src/pavuapplication.cc |  2 --
+ src/pavucontrol.cc     |  4 ----
+ src/sinkwidget.cc      | 17 -----------------
+ 4 files changed, 1 insertion(+), 24 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 056ba5e..e857563 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,7 +41,7 @@ AC_TYPE_SIGNAL
+ AC_HEADER_STDC
+ AX_CXX_COMPILE_STDCXX_11
+=20
+-PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 libcanberra=
-gtk3 >=3D 0.16 json-glib-1.0 ])
++PKG_CHECK_MODULES(GUILIBS, [ gtkmm-3.0 >=3D 3.22 sigc++-2.0 json-glib-1=
.0 ])
+ AC_SUBST(GUILIBS_CFLAGS)
+ AC_SUBST(GUILIBS_LIBS)
+=20
+diff --git a/src/pavuapplication.cc b/src/pavuapplication.cc
+index 6773b53..60c016c 100644
+--- a/src/pavuapplication.cc
++++ b/src/pavuapplication.cc
+@@ -24,8 +24,6 @@
+=20
+ #include "i18n.h"
+=20
+-#include <canberra-gtk.h>
+-
+ #include "pavuapplication.h"
+ #include "pavucontrol.h"
+ #include "mainwindow.h"
+diff --git a/src/pavucontrol.cc b/src/pavucontrol.cc
+index 18d5400..10ab646 100644
+--- a/src/pavucontrol.cc
++++ b/src/pavucontrol.cc
+@@ -29,8 +29,6 @@
+ #include <json-glib/json-glib.h>
+ #endif
+=20
+-#include <canberra-gtk.h>
+-
+ #include "pavucontrol.h"
+ #include "i18n.h"
+ #include "minimalstreamwidget.h"
+@@ -916,8 +914,6 @@ MainWindow* pavucontrol_get_window(pa_glib_mainloop =
*m, bool maximize, bool _ret
+     tab_number =3D _tab_number;
+     retry =3D _retry;
+=20
+-    ca_context_set_driver(ca_gtk_context_get(), "pulse");
+-
+     mainWindow =3D MainWindow::create(maximize);
+=20
+     api =3D pa_glib_mainloop_get_api(m);
+diff --git a/src/sinkwidget.cc b/src/sinkwidget.cc
+index f30bd37..482fd1f 100644
+--- a/src/sinkwidget.cc
++++ b/src/sinkwidget.cc
+@@ -24,7 +24,6 @@
+=20
+ #include "sinkwidget.h"
+=20
+-#include <canberra-gtk.h>
+ #if HAVE_EXT_DEVICE_RESTORE_API
+ #  include <pulse/format.h>
+ #  include <pulse/ext-device-restore.h>
+@@ -111,7 +110,6 @@ SinkWidget* SinkWidget::create(MainWindow* mainWindo=
w) {
+ void SinkWidget::executeVolumeUpdate() {
+     pa_operation* o;
+     char dev[64];
+-    int playing =3D 0;
+=20
+     if (!(o =3D pa_context_set_sink_volume_by_index(get_context(), inde=
x, &volume, NULL, NULL))) {
+         show_error(_("pa_context_set_sink_volume_by_index() failed"));
+@@ -120,22 +118,7 @@ void SinkWidget::executeVolumeUpdate() {
+=20
+     pa_operation_unref(o);
+=20
+-    ca_context_playing(ca_gtk_context_get(), 2, &playing);
+-    if (playing)
+-        return;
+-
+     snprintf(dev, sizeof(dev), "%lu", (unsigned long) index);
+-    ca_context_change_device(ca_gtk_context_get(), dev);
+-
+-    ca_gtk_play_for_widget(GTK_WIDGET(gobj()),
+-                           2,
+-                           CA_PROP_EVENT_DESCRIPTION, _("Volume Control=
 Feedback Sound"),
+-                           CA_PROP_EVENT_ID, "audio-volume-change",
+-                           CA_PROP_CANBERRA_CACHE_CONTROL, "permanent",
+-                           CA_PROP_CANBERRA_ENABLE, "1",
+-                           NULL);
+-
+-    ca_context_change_device(ca_gtk_context_get(), NULL);
+ }
+=20
+ void SinkWidget::onMuteToggleButton() {
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/m=
eta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
similarity index 66%
rename from meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
rename to meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
index 5f9d7a6ba..012fc3a94 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
@@ -8,16 +8,19 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa9=
54499f7abaabaa882bbe"
 # AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated, s=
o the
 # glib-2.0-native dependency may go away at some point (something to kee=
p in
 # mind when doing version upgrades).
-DEPENDS =3D "libxml-parser-perl-native intltool-native glib-2.0-native g=
tkmm3 libcanberra pulseaudio"
+DEPENDS =3D "libxml-parser-perl-native intltool-native glib-2.0-native g=
tkmm3 pulseaudio json-glib"
=20
 inherit autotools features_check perlnative pkgconfig
=20
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-SRC_URI =3D "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar=
.xz \
-          "
-SRC_URI[md5sum] =3D "9dcc2c76292e7e5e075d51b8dcb20202"
-SRC_URI[sha256sum] =3D "8fc45bac9722aefa6f022999cbb76242d143c31b314e2dbb=
38f034f4069d14e2"
+SRC_URI =3D "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar=
.xz"
+SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-pavucontrol-remove-canberra-gtk-support.patch', '', d)}"
+
+SRC_URI[sha256sum] =3D "ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3a36=
d20536af2e8f4e7a"
+
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
 EXTRA_OECONF =3D "--disable-lynx "
=20
--=20
2.25.1


