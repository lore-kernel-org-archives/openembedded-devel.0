Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8428.1622039769752099310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 07:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B7F1516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 07:36:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8E4F3F73D
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 07:36:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-gnome] meta-gnome: add Cogl/Clutter from oe-core
Date: Wed, 26 May 2021 15:36:04 +0100
Message-Id: <20210526143604.3921863-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nothing in openembedded-core needs Clutter now, and Clutter is abandoned
upstream.  Move it to meta-gnome as there are still a few users of
Clutter in Gnome.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/classes/clutter.bbclass            |  18 +++
 .../recipes-graphics/clutter/clutter-1.0.inc  |  49 ++++++
 ...ypes-as-it-is-build-configuration-sp.patch | 143 ++++++++++++++++++
 .../clutter-1.0/install-examples.patch        |  19 +++
 .../run-installed-tests-with-tap-output.patch |  30 ++++
 .../clutter/clutter-1.0/run-ptest             |   3 +
 .../clutter/clutter-1.0_1.26.4.bb             |  10 ++
 .../clutter/clutter-gst-3.0.inc               |  23 +++
 ...binary-needed-for-core-image-clutter.patch |  33 ++++
 .../clutter/clutter-gst-3.0_3.0.27.bb         |   7 +
 .../clutter/clutter-gtk-1.0.inc               |  23 +++
 ...iable-for-enabling-disabling-introsp.patch |  37 +++++
 .../clutter/clutter-gtk-1.0_1.8.4.bb          |   7 +
 meta-gnome/recipes-graphics/cogl/cogl-1.0.inc |  84 ++++++++++
 ...figure.ac-don-t-require-eglmesaext.h.patch |  92 +++++++++++
 .../recipes-graphics/cogl/cogl-1.0_1.22.8.bb  |   6 +
 .../packagegroup-core-clutter.bb              |  22 +++
 17 files changed, 606 insertions(+)
 create mode 100644 meta-gnome/classes/clutter.bbclass
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-1.0/0001-=
Remove-clutter.types-as-it-is-build-configuration-sp.patch
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-1.0/insta=
ll-examples.patch
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-1.0/run-i=
nstalled-tests-with-tap-output.patch
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-1.0/run-p=
test
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-1.0_1.26.=
4.bb
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.i=
nc
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-gst-3.0/0=
001-Install-example-binary-needed-for-core-image-clutter.patch
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-gst-3.0_3=
.0.27.bb
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.i=
nc
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0/0=
001-Add-a-config-variable-for-enabling-disabling-introsp.patch
 create mode 100644 meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0_1=
.8.4.bb
 create mode 100644 meta-gnome/recipes-graphics/cogl/cogl-1.0.inc
 create mode 100644 meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-config=
ure.ac-don-t-require-eglmesaext.h.patch
 create mode 100644 meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
 create mode 100644 meta-gnome/recipes-graphics/packagegroups/packagegrou=
p-core-clutter.bb

diff --git a/meta-gnome/classes/clutter.bbclass b/meta-gnome/classes/clut=
ter.bbclass
new file mode 100644
index 0000000000..24b53a13e4
--- /dev/null
+++ b/meta-gnome/classes/clutter.bbclass
@@ -0,0 +1,18 @@
+def get_minor_dir(v):
+    import re
+    m =3D re.match(r"^([0-9]+)\.([0-9]+)", v)
+    return "%s.%s" % (m.group(1), m.group(2))
+
+def get_real_name(n):
+    import re
+    m =3D re.match(r"^([a-z]+(-[a-z]+)?)(-[0-9]+\.[0-9]+)?", n)
+    return "%s" % (m.group(1))
+
+VERMINOR =3D "${@get_minor_dir("${PV}")}"
+REALNAME =3D "${@get_real_name("${BPN}")}"
+
+SRC_URI =3D "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.t=
ar.xz;name=3Darchive"
+S =3D "${WORKDIR}/${REALNAME}-${PV}"
+
+CLUTTERBASEBUILDCLASS ??=3D "autotools"
+inherit ${CLUTTERBASEBUILDCLASS} pkgconfig gtk-doc gettext
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc b/meta-g=
nome/recipes-graphics/clutter/clutter-1.0.inc
new file mode 100644
index 0000000000..80472178be
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0.inc
@@ -0,0 +1,49 @@
+SUMMARY =3D "Graphics library for creating hardware-accelerated user int=
erfaces"
+DESCRIPTION =3D "Clutter is an Open GL based interactive canvas library,=
 \
+designed for creating fast, mainly 2D single window applications such as=
 media \
+box UIs, presentations, kiosk style applications and so on."
+HOMEPAGE =3D "http://www.clutter-project.org/"
+LICENSE =3D "LGPLv2.1+"
+
+inherit clutter ptest-gnome features_check upstream-version-is-even gobj=
ect-introspection
+# depends on cogl-1.0 which needs opengl
+REQUIRED_DISTRO_FEATURES ?=3D "opengl"
+
+DEPENDS =3D "pango glib-2.0 json-glib atk udev cogl-1.0"
+PACKAGE_BEFORE_PN +=3D "${PN}-examples"
+AUTOTOOLS_AUXDIR =3D "${S}/build-aux"
+
+EDEPENDS_X11 =3D "virtual/libx11 libxi libxfixes"
+EDEPENDS_GLX =3D "virtual/libgl"
+EDEPENDS_EGL =3D "virtual/egl"
+EDEPENDS_WAYLAND =3D "wayland libxkbcommon gdk-pixbuf"
+
+EDEPENDS_EVDEV =3D "libxkbcommon"
+ERDEPENDS_EVDEV =3D "xkeyboard-config"
+
+# Disable pretty much everything, override in platform specific set up
+EXTRA_OECONF +=3D "--disable-quartz-backend	\
+	     	 --disable-win32-backend	\
+	     	 --disable-cex100-backend	\
+	     	 --disable-tslib-input		\
+	    	"
+
+PACKAGECONFIG[gdk] =3D "--enable-gdk-backend,--disable-gdk-backend,gtk+3=
"
+PACKAGECONFIG[x11] =3D "--enable-x11-backend,--disable-x11-backend,${EDE=
PENDS_X11}"
+PACKAGECONFIG[glx] =3D ",,${EDEPENDS_X11} ${EDEPENDS_GLX}"
+PACKAGECONFIG[egl] =3D "--enable-egl-backend,--disable-egl-backend,${EDE=
PENDS_EGL}"
+PACKAGECONFIG[evdev] =3D "--enable-evdev-input,--disable-evdev-input,${E=
DEPENDS_EVDEV},${ERDEPENDS_EVDEV}"
+PACKAGECONFIG[wayland] =3D "--enable-wayland-backend,--disable-wayland-b=
ackend,${EDEPENDS_WAYLAND}"
+PACKAGECONFIG[wayland-compositor] =3D "--enable-wayland-compositor,--dis=
able-wayland-compositor,wayland"
+
+# Default configuration, distros might want to override
+PACKAGECONFIG ??=3D "egl gdk \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} =
\
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x=
11', '', d)}"
+
+FILES_${PN}-examples =3D "${libdir}/clutter/examples"
+
+do_configure_prepend() {
+	# see https://bugzilla.gnome.org/show_bug.cgi?id=3D661128 for this
+	touch -t 200001010000 ${S}/po/clutter-1.0.pot
+}
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0/0001-Remove-=
clutter.types-as-it-is-build-configuration-sp.patch b/meta-gnome/recipes-=
graphics/clutter/clutter-1.0/0001-Remove-clutter.types-as-it-is-build-con=
figuration-sp.patch
new file mode 100644
index 0000000000..7b3c1980b6
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0/0001-Remove-clutter=
.types-as-it-is-build-configuration-sp.patch
@@ -0,0 +1,143 @@
+From 3a0404dfbc65c6a864e01d1200a48074e19d5def Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 2 Sep 2016 14:28:38 +0300
+Subject: [PATCH] Remove clutter.types as it is build configuration-speci=
fic.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ doc/reference/clutter.types | 122 -------------------------------------=
-------
+ 1 file changed, 122 deletions(-)
+ delete mode 100644 doc/reference/clutter.types
+
+diff --git a/doc/reference/clutter.types b/doc/reference/clutter.types
+deleted file mode 100644
+index 0037acc..0000000
+--- a/doc/reference/clutter.types
++++ /dev/null
+@@ -1,122 +0,0 @@
+-cally_actor_get_type
+-cally_clone_get_type
+-cally_group_get_type
+-cally_rectangle_get_type
+-cally_root_get_type
+-cally_stage_get_type
+-cally_text_get_type
+-cally_texture_get_type
+-cally_util_get_type
+-clutter_action_get_type
+-clutter_actor_box_get_type
+-clutter_actor_get_type
+-clutter_actor_meta_get_type
+-clutter_align_constraint_get_type
+-clutter_alpha_get_type
+-clutter_animatable_get_type
+-clutter_animation_get_type
+-clutter_animator_get_type
+-clutter_animator_key_get_type
+-clutter_backend_get_type
+-clutter_behaviour_depth_get_type
+-clutter_behaviour_ellipse_get_type
+-clutter_behaviour_get_type
+-clutter_behaviour_opacity_get_type
+-clutter_behaviour_path_get_type
+-clutter_behaviour_rotate_get_type
+-clutter_behaviour_scale_get_type
+-clutter_bin_layout_get_type
+-clutter_bind_constraint_get_type
+-clutter_binding_pool_get_type
+-clutter_blur_effect_get_type
+-clutter_box_get_type
+-clutter_box_layout_get_type
+-clutter_brightness_contrast_effect_get_type
+-clutter_cairo_texture_get_type
+-clutter_canvas_get_type
+-clutter_child_meta_get_type
+-clutter_click_action_get_type
+-clutter_clip_node_get_type
+-clutter_clone_get_type
+-clutter_color_get_type
+-clutter_color_node_get_type
+-clutter_colorize_effect_get_type
+-clutter_constraint_get_type
+-clutter_container_get_type
+-clutter_content_get_type
+-clutter_deform_effect_get_type
+-clutter_desaturate_effect_get_type
+-clutter_device_manager_get_type
+-clutter_drag_action_get_type
+-clutter_drop_action_get_type
+-clutter_effect_get_type
+-clutter_event_get_type
+-clutter_event_sequence_get_type
+-clutter_fixed_layout_get_type
+-clutter_flow_layout_get_type
+-clutter_fog_get_type
+-clutter_geometry_get_type
+-clutter_gesture_action_get_type
+-clutter_glx_texture_pixmap_get_type
+-clutter_grid_layout_get_type
+-clutter_group_get_type
+-clutter_image_get_type
+-clutter_input_device_get_type
+-clutter_interval_get_type
+-clutter_keyframe_transition_get_type
+-clutter_knot_get_type
+-clutter_layout_manager_get_type
+-clutter_layout_meta_get_type
+-clutter_list_model_get_type
+-clutter_margin_get_type
+-clutter_media_get_type
+-clutter_model_get_type
+-clutter_model_iter_get_type
+-clutter_offscreen_effect_get_type
+-clutter_page_turn_effect_get_type
+-clutter_paint_node_get_type
+-clutter_paint_volume_get_type
+-clutter_pan_action_get_type
+-clutter_param_color_get_type
+-clutter_param_fixed_get_type
+-clutter_param_units_get_type
+-clutter_path_constraint_get_type
+-clutter_path_get_type
+-clutter_path_node_get_type
+-clutter_perspective_get_type
+-clutter_pipeline_node_get_type
+-clutter_point_get_type
+-clutter_property_transition_get_type
+-clutter_rect_get_type
+-clutter_rectangle_get_type
+-clutter_rotate_action_get_type
+-clutter_score_get_type
+-clutter_script_get_type
+-clutter_scriptable_get_type
+-clutter_scroll_actor_get_type
+-clutter_settings_get_type
+-clutter_shader_effect_get_type
+-clutter_shader_float_get_type
+-clutter_shader_get_type
+-clutter_shader_int_get_type
+-clutter_shader_matrix_get_type
+-clutter_size_get_type
+-clutter_snap_constraint_get_type
+-clutter_stage_get_type
+-clutter_stage_manager_get_type
+-clutter_state_get_type
+-clutter_state_key_get_type
+-clutter_swipe_action_get_type
+-clutter_table_layout_get_type
+-clutter_tap_action_get_type
+-clutter_text_buffer_get_type
+-clutter_text_get_type
+-clutter_text_node_get_type
+-clutter_texture_get_type
+-clutter_texture_node_get_type
+-clutter_timeline_get_type
+-clutter_transition_get_type
+-clutter_transition_group_get_type
+-clutter_units_get_type
+-clutter_vertex_get_type
+-clutter_zoom_action_get_type
+--=20
+2.9.3
+
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-exam=
ples.patch b/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-exam=
ples.patch
new file mode 100644
index 0000000000..ce9ab3a248
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0/install-examples.pa=
tch
@@ -0,0 +1,19 @@
+Install the examples to $libdir/clutter/.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Inappropriate
+
+Index: clutter-1.26.2/examples/Makefile.am
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- clutter-1.26.2.orig/examples/Makefile.am
++++ clutter-1.26.2/examples/Makefile.am
+@@ -33,7 +33,8 @@ AM_CPPFLAGS =3D \
+ 	-I$(top_srcdir)/clutter \
+ 	-I$(top_builddir)/clutter
+=20
+-noinst_PROGRAMS =3D $(all_examples)
++exampledir =3D $(pkglibdir)/examples
++example_PROGRAMS =3D $(all_examples)
+=20
+ EXTRA_DIST =3D redhand.png
+=20
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0/run-installe=
d-tests-with-tap-output.patch b/meta-gnome/recipes-graphics/clutter/clutt=
er-1.0/run-installed-tests-with-tap-output.patch
new file mode 100644
index 0000000000..fef82eaf92
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0/run-installed-tests=
-with-tap-output.patch
@@ -0,0 +1,30 @@
+From d6ceb5a44b28e0e50ede22b84984d8516897de4b Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 27 Apr 2015 20:12:33 +0300
+Subject: [PATCH] Run installed tests with tap output
+
+Configure output from installed-tests to be TAP compliant such that
+gnome-desktop-testing-runner properly interprets the results.
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <TicoTimo@gmail.com>
+
+---
+ build-aux/autotools/glib-tap.mk | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/build-aux/autotools/glib-tap.mk b/build-aux/autotools/glib-=
tap.mk
+index a4f0dad..51cfa31 100644
+--- a/build-aux/autotools/glib-tap.mk
++++ b/build-aux/autotools/glib-tap.mk
+@@ -127,7 +127,8 @@ installed_test_meta_DATA =3D $(installed_testcases:=3D=
.test)
+ %.test: %$(EXEEXT) Makefile
+ 	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
+ 	echo 'Type=3Dsession' >> $@.tmp; \
+-	echo 'Exec=3Denv G_ENABLE_DIAGNOSTIC=3D0 CLUTTER_ENABLE_DIAGNOSTIC=3D0=
 $(installed_testdir)/$<' >> $@.tmp; \
++	echo 'Exec=3Denv G_ENABLE_DIAGNOSTIC=3D0 CLUTTER_ENABLE_DIAGNOSTIC=3D0=
 $(installed_testdir)/$< --tap' >> $@.tmp; \
++	echo 'Output=3DTAP' >> $@.tmp; \
+ 	mv $@.tmp $@)
+=20
+ CLEANFILES +=3D $(installed_test_meta_DATA)
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0/run-ptest b/=
meta-gnome/recipes-graphics/clutter/clutter-1.0/run-ptest
new file mode 100644
index 0000000000..98877e5226
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner clutter
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-1.0_1.26.4.bb b/=
meta-gnome/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
new file mode 100644
index 0000000000..ee549fbdd5
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
@@ -0,0 +1,10 @@
+require clutter-1.0.inc
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI[archive.md5sum] =3D "624dd776a5159de0267587b1df6b97b2"
+SRC_URI[archive.sha256sum] =3D "8b48fac159843f556d0a6be3dbfc6b083fc6d9c5=
8a20a49a6b4919ab4263c4e6"
+SRC_URI +=3D "file://install-examples.patch \
+            file://run-installed-tests-with-tap-output.patch \
+            file://0001-Remove-clutter.types-as-it-is-build-configuratio=
n-sp.patch \
+            file://run-ptest"
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc b/me=
ta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
new file mode 100644
index 0000000000..73315c97ec
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -0,0 +1,23 @@
+SUMMARY =3D "GStreamer integration library for Clutter"
+DESCRIPTION =3D "Clutter-Gst is an integration library for using GStream=
er with Clutter. \
+It provides a GStreamer sink to upload frames to GL and an actor that \
+implements the ClutterGstPlayer interface using playbin."
+HOMEPAGE =3D "http://www.clutter-project.org/"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/clutter-gst/-/issues"
+LICENSE =3D "LGPLv2+"
+
+inherit clutter features_check upstream-version-is-even gobject-introspe=
ction
+# depends on clutter-1.0 which depends on cogl-1.0
+REQUIRED_DISTRO_FEATURES ?=3D "opengl"
+
+export GST_PLUGIN_SCANNER_1_0=3D"${S}/gst-plugin-scanner-dummy"
+
+SRC_URI +=3D "file://0001-Install-example-binary-needed-for-core-image-c=
lutter.patch"
+
+DEPENDS =3D "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-=
1.0 libgudev"
+RDEPENDS_${PN} +=3D "gstreamer1.0-meta-base"
+PACKAGES  =3D+ "${PN}-examples"
+
+FILES_${PN}          +=3D "${libdir}/gstreamer-1.0/lib*.so"
+FILES_${PN}-dev      +=3D "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-examples  =3D "${bindir}/video-player ${bindir}/video-sink"
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0/0001-Ins=
tall-example-binary-needed-for-core-image-clutter.patch b/meta-gnome/reci=
pes-graphics/clutter/clutter-gst-3.0/0001-Install-example-binary-needed-f=
or-core-image-clutter.patch
new file mode 100644
index 0000000000..0b26b990d7
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0/0001-Install-ex=
ample-binary-needed-for-core-image-clutter.patch
@@ -0,0 +1,33 @@
+From d77c711277bf075ce0545c19b322f040c49c778a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 30 Apr 2015 12:19:13 +0300
+Subject: [PATCH] Install example binary needed for core-image-clutter
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Imported from clutter-gst-1.8 package, git://git.openembedded.org/openem=
bedded,
+commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b, updated for clutter-gst=
 3.0
+
+Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/Makefile.am b/examples/Makefile.am
+index bfbc1b5..09655e3 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -1,6 +1,6 @@
+ NULL =3D #
+=20
+-noinst_PROGRAMS =3D camera-player video-player video-sink video-sink-na=
vigation video-content
++bin_PROGRAMS =3D camera-player video-player video-sink video-sink-navig=
ation video-content
+=20
+ AM_CPPFLAGS =3D -I$(top_srcdir) \
+ 		$(MAINTAINER_CFLAGS) \
+--=20
+2.1.4
+
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.b=
b b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
new file mode 100644
index 0000000000..35382453c2
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
@@ -0,0 +1,7 @@
+require clutter-gst-3.0.inc
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
+                    file://clutter-gst/clutter-gst.h;beginline=3D1;endli=
ne=3D24;md5=3D95baacba194e814c110ea3bdf25ddbf4"
+
+SRC_URI[archive.md5sum] =3D "2bf9d7ca146c9d71e86c45cd00e9a28e"
+SRC_URI[archive.sha256sum] =3D "fe69bd6c659d24ab30da3f091eb91cd1970026d4=
31179b0724f13791e8ad9f9d"
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc b/me=
ta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc
new file mode 100644
index 0000000000..9a28b5219b
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -0,0 +1,23 @@
+SUMMARY =3D "Library for embedding a Clutter canvas in a GTK+ applicatio=
n"
+DESCRIPTION =3D "Clutter-GTK is a library providing facilities to integr=
ate Clutter into GTK+ \
+applications and vice versa. It provides a GTK+ widget, GtkClutterEmbed,=
 for embedding the \
+a Clutter stage into any GtkContainer; and GtkClutterActor, a Clutter \
+actor for embedding any GtkWidget inside a Clutter stage."
+HOMEPAGE =3D "http://www.clutter-project.org/"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/clutter/-/issues"
+LICENSE =3D "LGPLv2+"
+
+CLUTTERBASEBUILDCLASS =3D "meson"
+inherit clutter features_check upstream-version-is-even gobject-introspe=
ction gtk-doc
+
+# depends on clutter-1.0 which depends on cogl-1.0
+REQUIRED_DISTRO_FEATURES ?=3D "opengl"
+# depends on gtk+3
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+DEPENDS =3D "clutter-1.0 gtk+3"
+PACKAGES  =3D+ "${PN}-examples"
+
+GTKDOC_MESON_OPTION =3D "enable_docs"
+
+GIR_MESON_OPTION =3D 'enable_gi'
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add=
-a-config-variable-for-enabling-disabling-introsp.patch b/meta-gnome/reci=
pes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-config-variable-for-enabl=
ing-disabling-introsp.patch
new file mode 100644
index 0000000000..e21c6fd903
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0/0001-Add-a-conf=
ig-variable-for-enabling-disabling-introsp.patch
@@ -0,0 +1,37 @@
+From 7233883c6bd4e80c0e91b29b5c76fe798023e9fe Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 11 Feb 2019 16:41:13 +0100
+Subject: [PATCH] Add a config variable for enabling/disabling introspect=
ion
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ clutter-gtk/meson.build | 2 +-
+ meson_options.txt       | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/clutter-gtk/meson.build b/clutter-gtk/meson.build
+index 5d6847d..5d934b6 100644
+--- a/clutter-gtk/meson.build
++++ b/clutter-gtk/meson.build
+@@ -49,7 +49,7 @@ clutter_gtk_dep =3D declare_dependency(link_with: clut=
ter_gtk,
+                                      dependencies: [ mathlib_dep, clutt=
er_dep, gtk_dep ],
+                                      include_directories: include_direc=
tories('.'))
+=20
+-if not meson.is_cross_build()
++if get_option('enable_gi')
+   gnome.generate_gir(clutter_gtk,
+                      sources: clutter_gtk_headers + clutter_gtk_sources=
,
+                      namespace: 'GtkClutter',
+diff --git a/meson_options.txt b/meson_options.txt
+index aaf59f1..b7e51c3 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,3 +2,7 @@ option('enable_docs',
+        type: 'boolean',
+        value: false,
+        description: 'Enable generating the API reference (depends on GT=
K-Doc)')
++option('enable_gi',
++       type: 'boolean',
++       value: false,
++       description: 'Enable gobject introspection')
diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb=
 b/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
new file mode 100644
index 0000000000..53948c8944
--- /dev/null
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gtk-1.0_1.8.4.bb
@@ -0,0 +1,7 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903=
e34"
+
+SRC_URI +=3D " file://0001-Add-a-config-variable-for-enabling-disabling-=
introsp.patch"
+SRC_URI[archive.md5sum] =3D "b363ac9878e2337be887b8ee9e1da00e"
+SRC_URI[archive.sha256sum] =3D "521493ec038973c77edcb8bc5eac23eed4164511=
7894aaee7300b2487cb42b06"
diff --git a/meta-gnome/recipes-graphics/cogl/cogl-1.0.inc b/meta-gnome/r=
ecipes-graphics/cogl/cogl-1.0.inc
new file mode 100644
index 0000000000..d581ad1c04
--- /dev/null
+++ b/meta-gnome/recipes-graphics/cogl/cogl-1.0.inc
@@ -0,0 +1,84 @@
+SUMMARY =3D "Modern 3D graphics API with associated utility APIs"
+DESCRIPTION =3D "Cogl is a small open source library for using 3D graphi=
cs \
+hardware for rendering. The API departs from the flat state machine styl=
e of \
+OpenGL and is designed to make it easy to write orthogonal components th=
at \
+can render without stepping on each others toes."
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/cogl"
+LICENSE =3D "MIT"
+
+inherit clutter features_check upstream-version-is-even gobject-introspe=
ction
+# cogl-1.0 needs opengl to build
+REQUIRED_DISTRO_FEATURES ?=3D "opengl"
+
+DEPENDS =3D "glib-2.0 gdk-pixbuf"
+PACKAGES =3D+ "${PN}-examples \
+             libcogl libcogl-gles2 libcogl-pango libcogl-path \
+            "
+AUTOTOOLS_AUXDIR =3D "${S}/build"
+
+# Extra DEPENDS for PACKAGECONFIG
+EDEPENDS_GL =3D "virtual/libgl libdrm"
+EDEPENDS_GLES2 =3D "virtual/libgles2"
+EDEPENDS_KMS =3D "libdrm virtual/egl"
+EDEPENDS_EGL =3D "virtual/egl"
+EDEPENDS_X11 =3D "virtual/libx11 libxcomposite libxdamage libxfixes libx=
randr"
+EDEPENDS_WAYLAND =3D "virtual/egl virtual/libgles2 wayland"
+
+# Extra RDEPENDS for PACKAGECONFIG
+# This has to be explictly listed, because cogl dlopens the backends
+ERDEPENDS_GL    =3D "libgl"
+ERDEPENDS_GLES2 =3D "libgles2"
+
+# GLESv1 is rarely tested, so disable it
+EXTRA_OECONF +=3D "--enable-examples-install	\
+	       	 --enable-debug		 	\
+	       	 --disable-gles1		\
+	         --disable-cairo                \
+	    	"
+DEBUG_OPTIMIZATION_append =3D " -Wno-error=3Dmaybe-uninitialized"
+
+# OpenGL/GLX
+PACKAGECONFIG[glx] =3D "--enable-gl --enable-glx,--disable-gl --disable-=
glx,${EDEPENDS_GL} ${EDEPENDS_X11},${ERDEPENDS_GL}"
+
+# GLESv2
+PACKAGECONFIG[gles2] =3D "--enable-gles2,--disable-gles2,${EDEPENDS_GLES=
2}, ${ERDEPENDS_GLES2}"
+
+# EGL backends
+PACKAGECONFIG[egl-kms] =3D "--enable-kms-egl-platform,--disable-kms-egl-=
platform,${EDEPENDS_KMS}"
+PACKAGECONFIG[egl-null] =3D "--enable-null-egl-platform,--disable-null-e=
gl-platform"
+PACKAGECONFIG[egl-x11] =3D "--enable-xlib-egl-platform,--disable-xlib-eg=
l-platform,${EDEPENDS_X11} ${EDEPENDS_EGL}"
+PACKAGECONFIG[egl-wayland] =3D "--enable-wayland-egl-platform,--disable-=
wayland-egl-platform,${EDEPENDS_WAYLAND}"
+
+# Wayland (server-side)
+PACKAGECONFIG[wayland-server] =3D "--enable-wayland-egl-server,--disable=
-wayland-egl-server,${EDEPENDS_WAYLAND}"
+
+# Support rendering text directly with Pango
+PACKAGECONFIG[cogl-pango] =3D "--enable-cogl-pango,--disable-cogl-pango,=
pango"
+
+# Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate b=
y
+# default.
+PACKAGECONFIG ??=3D "cogl-pango gles2 \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'e=
gl-wayland', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx e=
gl-x11', '', d)} \
+                   "
+
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH=3D"${B}/cogl/.libs"
+}
+
+FILES_${PN} =3D ""
+FILES_${PN}-examples =3D "${bindir}/* ${datadir}/cogl/examples-data/*"
+FILES_libcogl =3D "${libdir}/libcogl${SOLIBS} ${libdir}/girepository-1.0=
/Cogl-*.typelib"
+FILES_libcogl-gles2 =3D "${libdir}/libcogl-gles2${SOLIBS}"
+FILES_libcogl-pango =3D "${libdir}/libcogl-pango${SOLIBS} ${libdir}/gire=
pository-1.0/CoglPango*.typelib"
+
+FILES_libcogl-path =3D "${libdir}/libcogl-path${SOLIBS}"
+
+# For backwards compatibility after Debian-renaming
+RPROVIDES_libcogl =3D "cogl-1.0"
+RCONFLICTS_libcogl =3D "cogl-1.0"
+RREPLACES_libcogl =3D "cogl-1.0"
+
+RDEPENDS_${PN}-dev =3D "libcogl"
+
+COMPATIBLE_HOST_armv4 =3D 'null'
diff --git a/meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-=
don-t-require-eglmesaext.h.patch b/meta-gnome/recipes-graphics/cogl/cogl-=
1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
new file mode 100644
index 0000000000..328984a63f
--- /dev/null
+++ b/meta-gnome/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-r=
equire-eglmesaext.h.patch
@@ -0,0 +1,92 @@
+From bb9765a926588ebfe1eb324fbbe8fc22d419eebe Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Thu, 25 Jun 2020 11:27:40 +0000
+Subject: [PATCH] configure.ac: don't require eglmesaext.h
+
+E.g. the Vivante EGL implementation does not provide eglmesaext.h.
+
+The commit moves the check for header file existence outside of the
+check for existence of a egl packageconfig and makes the existence
+of eglmesaext.h optional.
+
+fixes commit fb1acfec ("Fix building against libglvnd-provided EGL heade=
rs")
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cogl/-/merge_=
requests/28]
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ configure.ac | 51 ++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 32 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b7ba95d..0d1d8de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1212,22 +1212,6 @@ AS_IF([test "x$NEED_EGL" =3D "xyes" && test "x$EG=
L_CHECKED" !=3D "xyes"],
+         PKG_CHECK_EXISTS([egl],
+           [COGL_PKG_REQUIRES=3D"$COGL_PKG_REQUIRES egl"],
+           [
+-            AC_CHECK_HEADERS(
+-              [EGL/egl.h],
+-              [],
+-              [AC_MSG_ERROR([Unable to locate required EGL headers])])
+-            AC_CHECK_HEADERS(
+-              [EGL/eglext.h],
+-              [],
+-              [AC_MSG_ERROR([Unable to locate required EGL headers])],
+-              [#include <EGL/egl.h>])
+-            AC_CHECK_HEADERS(
+-              [EGL/eglmesaext.h],
+-              [],
+-              [AC_MSG_ERROR([Unable to locate required EGL headers])],
+-              [#include <EGL/egl.h>
+-#include <EGL/eglext.h>])
+-
+             AC_CHECK_LIB(EGL, [eglInitialize],
+               [COGL_EXTRA_LDFLAGS=3D"$COGL_EXTRA_LDFLAGS -lEGL"],
+               [AC_MSG_ERROR([Unable to locate required EGL library])])
+@@ -1236,9 +1220,38 @@ AS_IF([test "x$NEED_EGL" =3D "xyes" && test "x$EG=
L_CHECKED" !=3D "xyes"],
+           ]
+           )
+=20
+-        COGL_EGL_INCLUDES=3D"#include <EGL/egl.h>
+-#include <EGL/eglext.h>
+-#include <EGL/eglmesaext.h>"
++dnl Test for the existence of egl headers.
++dnl egl*.h includes eglplatform.h which on __unix__ defaults to a X11 p=
latform.
++dnl In that case AC_CHECK_HEADERS failes if X11 headers are not availab=
le.
++dnl Set the usual include guard define and, if the EGL implementation d=
oesn't
++dnl use that guard fall back to USE_OZONE and EGL_NO_X11 platforms whic=
h don't
++dnl require additional headers.
++        AC_CHECK_HEADERS(
++          [EGL/egl.h],
++          [COGL_EGL_INCLUDES=3D"#include <EGL/egl.h>"],
++          [AC_MSG_ERROR([Unable to locate required EGL headers])],
++          [#define __egl_h_
++ #define USE_OZONE
++ #define EGL_NO_X11])
++        AC_CHECK_HEADERS(
++          [EGL/eglext.h],
++          [COGL_EGL_INCLUDES=3D"$COGL_EGL_INCLUDES
++#include <EGL/eglext.h>"],
++          [AC_MSG_ERROR([Unable to locate required EGL headers])],
++          [#define __eglext_h_
++ #define USE_OZONE
++ #define EGL_NO_X11
++$COGL_EGL_INCLUDES])
++        AC_CHECK_HEADERS(
++          [EGL/eglmesaext.h],
++          [COGL_EGL_INCLUDES=3D"$COGL_EGL_INCLUDES
++#include <EGL/eglmesaext.h>"],
++          [],
++          [#define __eglmesaext_h_
++#define USE_OZONE
++#define EGL_NO_X11
++$COGL_EGL_INCLUDES])
++
+         AC_SUBST([COGL_EGL_INCLUDES])
+       ])
+=20
+--=20
+2.20.1
+
diff --git a/meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta-g=
nome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
new file mode 100644
index 0000000000..b9446fab38
--- /dev/null
+++ b/meta-gnome/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
@@ -0,0 +1,6 @@
+require cogl-1.0.inc
+
+SRC_URI +=3D "file://0001-configure.ac-don-t-require-eglmesaext.h.patch"
+SRC_URI[archive.sha256sum] =3D "a805b2b019184710ff53d0496f9f0ce6dcca420c=
141a0f4f6fcc02131581d759"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1b1a508d91d25ca607c83f92f3e31=
c84"
diff --git a/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-=
clutter.bb b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-=
clutter.bb
new file mode 100644
index 0000000000..2e7b47dd40
--- /dev/null
+++ b/meta-gnome/recipes-graphics/packagegroups/packagegroup-core-clutter=
.bb
@@ -0,0 +1,22 @@
+#
+# Copyright (C) 2007 OpenedHand Ltd.
+#
+
+SUMMARY =3D "Clutter package groups"
+
+PR =3D "r6"
+
+inherit packagegroup features_check
+# rdepends on clutter-*
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+PACKAGES =3D "\
+    ${PN}-core \
+    "
+
+SUMMARY_${PN}-core =3D "Clutter graphics library"
+RDEPENDS_${PN}-core =3D "\
+    clutter-1.0 \
+    clutter-gst-3.0 \
+    clutter-gtk-1.0 \
+    "
--=20
2.25.1

