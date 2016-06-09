Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C2D46B6F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 12:28:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id k184so10273382wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l9U/f+YFhPeJocVtCIIxNvcLH9jGqwFVVy4hDaHSBQQ=;
	b=a5P7Pc/qLZg9RfaR/Efv24Yyvb6MGlSEc5TgDeT9rnDTLKeWZK40ztw87G3TQom/od
	dKmc+g/K9WT6k6QcGmcPYvVgyhT8u1C/efTGvKAxr7VC71nW5bvNWVoX/sQYy7J5bSzf
	gqSLNOjk2izVCSgr4lhvv3WswyoGGlK53E4rvJa3LQDwoUL0CQBETxmU2uxNXLK5qSR4
	RwIoXmIvLEsmQ74Zj6h24hctHo07QipoCmJ3abrIT+ppdno90Ghz4VaHhoZGWoBeA4Kj
	tiVt6YguoiimU3BF+YAQ4si0NFJTrj4KF89UN+esXx4h1XwGpGELa2WbHr6KeIwxziS2
	S66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l9U/f+YFhPeJocVtCIIxNvcLH9jGqwFVVy4hDaHSBQQ=;
	b=f9qkdsTee11mS55c6kM45CUwGbMaeoyzkAHlR5nPRpIrrMHCjDLS26BKpADXE5VEF/
	lMLBVvZXI8F4yFCWy+Wk8+lawtULhuJjBP2lOPxPeU4xhPWm3PfPVTXxwg20lJ3XFGji
	Eh/bAN+kgVFK5Ka3GQLxTFRjDV+yWrodXlFQsV3uQs+wIJo3EeRr8lQj/1It/t04z6hN
	0L+JPGrKNzHkWeSDi2iokDyL221XphYbH7g1iSDr81st8tdwXatUeL7X60MZXjvoEDgr
	rVzlmxyI9UjhoCyoDHBLa1ry8fgjOhMydMOuha6IyDWor1pAc7eCs1ly1TTkMA5gZ7f/
	AspA==
X-Gm-Message-State: ALyK8tKZD8GLXc6O4nV/2IlFtSOxXDZcvxVtSJaCbDO+XI92MtvioHEIfhVYLnDKqjxhGw==
X-Received: by 10.194.58.162 with SMTP id s2mr10763563wjq.37.1465475315749;
	Thu, 09 Jun 2016 05:28:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	zc7sm6802164wjb.42.2016.06.09.05.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jun 2016 05:28:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 14:28:59 +0200
Message-Id: <20160609122900.12978-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCHv2 1/2] evince, epdf, gdm, gnumeric, libgnomeprint, tumbler, gedit, gnome-panel, gnome-session, gnome-terminal, libgnomecups, gtksourceview2, libgweather, libgnomeui, tracker, gimp, poppler, mousepad: blacklist, fails to build with gcc-6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2016 12:28:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdf_svn.bb                            | 2 ++
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb                | 2 ++
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb                      | 2 ++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                  | 1 +
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb      | 2 ++
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb  | 3 +++
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb         | 3 +++
 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb            | 2 ++
 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb          | 2 ++
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb            | 2 ++
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb | 3 +++
 meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb         | 3 ++-
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb          | 3 +++
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb            | 2 ++
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb                    | 2 ++
 meta-oe/recipes-support/poppler/poppler_0.43.0.bb               | 3 +++
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb               | 2 ++
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb                | 2 ++
 18 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index e32a5fd..a4c7d49 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -25,3 +25,5 @@ EXTRA_OECONF = "\
 
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
+
+PNBLACKLIST[epdf] ?= "Depends on broken poppler"
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index fe63093..4fa11a5 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -46,3 +46,5 @@ FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
                           ${libdir}/evince/*/backends/*.a"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
 FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
+
+PNBLACKLIST[evince] ?= "Depends on broken poppler"
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 9ede2f5..9266f97 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -104,3 +104,5 @@ pkg_postrm_${PN} () {
     delgroup gdm || true
     sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
 }
+
+PNBLACKLIST[gdm] ?= "Depends on broken gnome-panel"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 4ae5bbb..7e6b343 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -20,3 +20,4 @@ EXTRA_OECONF = "--disable-scrollkeeper \
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
 FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
 
+PNBLACKLIST[gedit] ?= "Depends on broken gtksourceview2"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 0f7cb59..b85850e 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -43,3 +43,5 @@ FILES_${PN} =+ "${datadir}/gnome* \
                 ${datadir}/PolicyKit \
                 ${libdir}/bonobo \
 "
+
+PNBLACKLIST[gnome-panel] ?= "Depends on broken libgweather"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index c6fb75b..db85af7 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -27,3 +27,6 @@ do_configure_append() {
 RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-ck-connector', '', d)}"
 FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${datadir}/gnome ${libdir}/gnome-session/helpers"
 FILES_${PN}-dbg += "${libexecdir}/gnome-session/helpers/.debug"
+
+# http://errors.yoctoproject.org/Errors/Details/68621/
+PNBLACKLIST[libgnomeui] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index 0ac2b20..4695e1e 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -17,3 +17,6 @@ SRC_URI[archive.sha256sum] = "2c7af2250698b9f9f53c6eaa93211c1118cf2c7e29cbbacfd1
 GNOME_COMPRESS_TYPE="bz2"
 
 RRECOMMENDS_${PN} += "gnome-common-schemas"
+
+# http://errors.yoctoproject.org/Errors/Details/68636/
+PNBLACKLIST[libgnomeui] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
index 6bb6816..2caa820 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -21,3 +21,5 @@ SRC_URI += "\
 SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
 SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
 GNOME_COMPRESS_TYPE="bz2"
+
+PNBLACKLIST[libgnomecups] ?= "Depends on broken libgnomeui"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index 9d41914..ff14616 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -24,3 +24,5 @@ FILES_${PN}-staticdev += "\
     ${libdir}/${PN}/${PV}/modules/*.a \
     ${libdir}/${PN}/${PV}/modules/*/*.a \
 "
+
+PNBLACKLIST[libgnomeprint] ?= "Depends on broken libgnomecups"
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 3d3118a..5d1d251 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -45,3 +45,5 @@ python populate_packages_prepend () {
         recursive=True,
         prepend=True)
 }
+
+PNBLACKLIST[gnumeric] ?= "Depends on broken libgnomeprint"
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index c745e34..46d547f 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -26,3 +26,6 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
+
+# http://errors.yoctoproject.org/Errors/Details/68609/
+PNBLACKLIST[libgnomeui] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
index aeec2d3..71fe545 100644
--- a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
@@ -20,4 +20,5 @@ FILES_${PN} += "${datadir}/gnome* \
 PACKAGES =+ "${PN}-locationdata"
 FILES_${PN}-locationdata = "${datadir}/libgweather/Locations*"
 
-
+# http://errors.yoctoproject.org/Errors/Details/68608/
+PNBLACKLIST[libgweather] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
index 6fb2786..3208a81 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
@@ -5,3 +5,6 @@ PR = "r1"
 SRC_URI[archive.md5sum] = "ceab6f4370581d1a03c09f15cc103099"
 SRC_URI[archive.sha256sum] = "04c81f3bb5a337cdf3ed1230916f82d29857ee95eb884f58dd2f5c6860efe803"
 GNOME_COMPRESS_TYPE="bz2"
+
+# http://errors.yoctoproject.org/Errors/Details/68607/
+PNBLACKLIST[libgnomeui] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index ff53669..7e6c400 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -83,3 +83,5 @@ FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
 
 SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
 SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
+
+PNBLACKLIST[tracker] ?= "Depends on broken poppler"
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
index 29ed4d9..3c134bb 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
@@ -30,3 +30,5 @@ CFLAGS += "-fPIC"
 
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
 FILES_${PN}  += "${datadir}/appdata"
+
+PNBLACKLIST[gimp] ?= "Depends on broken poppler"
diff --git a/meta-oe/recipes-support/poppler/poppler_0.43.0.bb b/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
index 95cd5e5..743e0aa 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.43.0.bb
@@ -53,3 +53,6 @@ FILES_libpoppler = "${libdir}/libpoppler.so.*"
 FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
 
 RDEPENDS_libpoppler = "poppler-data"
+
+# http://errors.yoctoproject.org/Errors/Details/68605/
+PNBLACKLIST[poppler] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
index 4ca21a6..3748a06 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
@@ -17,3 +17,5 @@ SRC_URI[sha256sum] = "60114431eac8db6bb6ce18bd38f1630cccb684375b97a445a1b6fd6198
 EXTRA_OECONF = "--disable-gtk3"
 
 FILES_${PN} += "${datadir}/glib-2.0/schemas"
+
+PNBLACKLIST[mousepad] ?= "Depends on broken gtksourceview2"
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
index 66385a4..5a0fc6d 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
@@ -27,3 +27,5 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
                     ${libdir}/tumbler-1/plugins/.debug \
                     ${libdir}/tumbler-1/plugins/cache/.debug \
 "
+
+PNBLACKLIST[tumbler] ?= "Depends on broken poppler"
-- 
2.8.4


