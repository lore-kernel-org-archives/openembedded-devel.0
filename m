Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10AE660797
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 13:18:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r5so2964925wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XrvyBY03movU/eLhNznEMg86Rv52CfOhglnyjfRfnZs=;
	b=UloMqbX+/jxYMoV+UijhrInhM0w/43KjD+/xLyNdEhS6QScdWHFPd8bcQavhCKzUsw
	VMNjTKHmYtcg67IXN2AZ0+zrX8DzdRD+E8JYmCTGzTl3J2vVmR/dd4ns+A43cYBtRPSs
	K05WVq0H+TumI6liNAxQjKhIac1zJZDAsQHkcydY8NyeIIcpGIFXi8Aw/kYCDNoM53E0
	YDzxo765CnI4nOhi6lzTIZQBUjZrggevwUCge1gHjq3M+xawNDWA+CCn+PAa0QOhXZhP
	gZaWKIlNAPbGJO9VnJrTO356hQLsSmZBAgTJojZykiU0EFLCSunbQ3t5WdhNo9bSYB1x
	xz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XrvyBY03movU/eLhNznEMg86Rv52CfOhglnyjfRfnZs=;
	b=MLLEZWYxDvBY4KgPjxBsWyA8nmC/P8aNJTtifOZMPOj8LnT9lNTF/crnspziuHN69g
	dBTYtVe79Bx9b+s5Op5h6Vk/OQru+Hl59gy9x51RsmoujJNjmRyL8s4vBJNXXQ9SCm70
	intYv3I6v2xFiF727V7eKASDSN6joGb6Li74b4zTqlFzeEpDlIYdWXtttGARc3IiQxYJ
	nzibZz65S/ku/7gMfTFTQpLBnOsIrEsWJxRMb8DFpVR0wVOlSVyl8mOROh6tZEhk6fG3
	YqvUOxGZrC5VpxjOMBDMR9s4KTX5muc5QUUvhcgeIRwXU09Yo9GBq3EWN++a9cjSTu/8
	zqvQ==
X-Gm-Message-State: ALyK8tKwkLlh+rmi1cKwmTNg+n5WILKIehrKwBBK5xLrxLxWhtZW+UFl5oW+o43r52BWGA==
X-Received: by 10.28.31.213 with SMTP id f204mr7679858wmf.69.1465391906960;
	Wed, 08 Jun 2016 06:18:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id g3sm1446929wjb.47.2016.06.08.06.18.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 06:18:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 15:18:43 +0200
Message-Id: <20160608131843.3507-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH] evince, gedit, gnome-panel, gnome-session, gnome-terminal, libgnomecups, gtksourceview2, libgweather, libgnomeui, tracker, gimp, poppler, mousepad: blacklist, fails to build with gcc-6
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
X-List-Received-Date: Wed, 08 Jun 2016 13:18:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb                | 2 ++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                  | 1 +
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb      | 2 ++
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb  | 3 +++
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb         | 3 +++
 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb            | 2 ++
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb | 3 +++
 meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb         | 3 ++-
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb          | 3 +++
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb            | 2 ++
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb                    | 2 ++
 meta-oe/recipes-support/poppler/poppler_0.43.0.bb               | 3 +++
 meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb               | 2 ++
 13 files changed, 30 insertions(+), 1 deletion(-)

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
-- 
2.8.4


