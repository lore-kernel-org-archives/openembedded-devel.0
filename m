Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 280CA7EDF1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 13:56:53 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q10so8217072wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 05:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2J2DzcSNlv0U8jWh3C9xsGjxegG9mVBwfLGEUPK8//w=;
	b=LNExYM/xzAqWSx74Kbzovu3DUn9Szm6uUFmc39TYcWaU+SX/dvKJNHOL9xyNKfgJ79
	F+mAV0nWk04Izm7QBmelVkUvyJ+PRyColOyzPNOD1/226ALj7BL+PGP6UxHwEYwDm2kQ
	hytgAIvas//TKDgl+R2gRDco7/NZhLZY4CXzXdvfM0gm7E6bMStWtYVoGOPOyyj6lwEe
	JE7e07H4dO0BmGWUTTM4woeWl3pKIXjESc38k8XnI3taFT8plX629ojU5+Ox0AvyZksK
	1JAm69dGXCC3Y502n5OlZxFg7n2XbAGx1BJbA+8DTRspS4A90n0VYMaEaxwFqiqZpCcC
	CRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2J2DzcSNlv0U8jWh3C9xsGjxegG9mVBwfLGEUPK8//w=;
	b=MnVMCZgZl7y8taoDbdzkDpS0JuEcYMbtzJCMT2gBgozf7Vy0WS8ldc/OxXFrXqE5cg
	AEb0WyLuvpdBw25YFIdu4oimH9vnmvwt1rxNgNP2BsEDoUcblfUvncweD6qn/oT8oWYk
	dUx0A8E3PY5qoMssAU8nvCKo1SLk8GNfPrhw3PvZKxzsAwxeZTGRp3akBvTdu1JI3tp4
	TE0vNChjJWvcN3CQY3y9kTbTT0a9KCZDJqJGtzixRzj1rdKQ/37enPnXwi8KXyJtgI6Y
	6F21gOxVkZIJ0VCcqSA1tRD4qANyrTkem7ShoKgdz4bVAgGasywAh48bfgYZfCWNAM3y
	Oo9Q==
X-Gm-Message-State: APjAAAUm91hLNI+e4VjSCECdtsDBty9ZabaLpWRQsWFEgPNivLyRIgy3
	ep2C1KA784Sl2uZS+jisUgpnWiG9
X-Google-Smtp-Source: APXvYqx4JcZ+eNu+Wv8ZTNBY2T7VLHG+RsFsz46c8YjbBS6laY82JvfkXPTDdnvre2BonpbLBoFtOA==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr34186426wru.181.1575295014425;
	Mon, 02 Dec 2019 05:56:54 -0800 (PST)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	x10sm39364856wrv.60.2019.12.02.05.56.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 05:56:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 14:56:45 +0100
Message-Id: <20191202135646.9795-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191202135646.9795-1-schnitzeltony@gmail.com>
References: <20191202135646.9795-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] mutter: initial add 3.34.1
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
X-List-Received-Date: Mon, 02 Dec 2019 13:56:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
V1 -> V2:
* rework PACKAGECONFIGs: particularly glx has to be added to opengl/x11 /
  remove remote-desktop
* add patch to fix GLES2 fallback for ancient targets
---
 .../mutter/0001-cogl-Fix-GLES2-fallback.patch | 37 +++++++
 .../recipes-gnome/mutter/mutter_3.34.1.bb     | 96 +++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch
 create mode 100644 meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch b/meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch
new file mode 100644
index 000000000..ec9200042
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/mutter/0001-cogl-Fix-GLES2-fallback.patch
@@ -0,0 +1,37 @@
+From f4f7e31303d78b2a8a0881b61311b8d750301b8f Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 29 Oct 2019 11:53:27 -0400
+Subject: [PATCH] cogl: Fix GLES2 fallback
+
+Say you're using intel gen3, you poor soul. Your big-GL maxes out at 1.5
+unless you use dirty tricks, but you do have GLES2. We try to fall back
+to GLES in this case, but we only ever say eglBindAPI(EGL_OPENGL_API).
+So when we go to do CreateContext, even though we think we've requested
+GLES 2.0, the driver will compare that "2.0" against the maximum big-GL
+version, and things will fail.
+
+Fix this by binding EGL_OPENGL_ES_API before trying a GLES context.
+
+https://gitlab.gnome.org/GNOME/mutter/issues/635
+
+Upstream-Status: Applied
+---
+ cogl/cogl/winsys/cogl-winsys-egl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cogl/cogl/winsys/cogl-winsys-egl.c b/cogl/cogl/winsys/cogl-winsys-egl.c
+index 99dcb8bf3..f2b439a67 100644
+--- a/cogl/cogl/winsys/cogl-winsys-egl.c
++++ b/cogl/cogl/winsys/cogl-winsys-egl.c
+@@ -329,6 +329,8 @@ try_create_context (CoglDisplay *display,
+   if (renderer->driver == COGL_DRIVER_GL ||
+       renderer->driver == COGL_DRIVER_GL3)
+     eglBindAPI (EGL_OPENGL_API);
++  else if (renderer->driver == COGL_DRIVER_GLES2)
++    eglBindAPI (EGL_OPENGL_ES_API);
+ 
+   egl_attributes_from_framebuffer_config (display,
+                                           &display->onscreen_template->config,
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb
new file mode 100644
index 000000000..2d84bfc2f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.1.bb
@@ -0,0 +1,96 @@
+SUMMARY = "Window and compositing manager based on Clutter"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = " \
+    xserver-xorg-cvt-native \
+    virtual/libx11 \
+    gtk+3 \
+    gdk-pixbuf \
+    cairo \
+    pango \
+    gsettings-desktop-schemas \
+    json-glib \
+    gnome-desktop3 \
+    gnome-settings-daemon \
+    libxtst \
+    libxkbfile \
+    xinerama \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even features_check
+
+SRC_URI[archive.md5sum] = "4d7b67471fa4177e5ff0357e1f1736fb"
+SRC_URI[archive.sha256sum] = "ba1826cf88bdb81e63943cac014a8e8bcf35ec178c53264401f9c72fdeab758e"
+SRC_URI += "file://0001-cogl-Fix-GLES2-fallback.patch"
+
+# x11 is still manadatory - see meson.build
+REQUIRED_DISTRO_FEATURES = "x11"
+
+# systemd can be replaced by libelogind (not available atow - make systemd
+# mandatory distro feature)
+LOGIND ?= "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
+
+# profiler requires sysprof 3.34 which is not willing to build atow
+PACKAGECONFIG ??= " \
+    native-backend \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl glx', '', d)} \
+    sm \
+    startup-notification \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', '', d)} \
+"
+
+EXTRA_OEMESON += " \
+    -Dxwayland_path=${bindir}/Xwayland \
+"
+
+# combi-config - see meson_options.txt for more details
+PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput ${LOGIND} virtual/egl virtual/libgles2 udev"
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=true, virtual/libgl"
+PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false"
+PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
+PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
+PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
+PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
+PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
+PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland wayland-native, xserver-xorg-xwayland"
+PACKAGECONFIG[wayland-eglstream] = "-Dwayland_eglstream=true,-Dwayland_eglstream=false"
+
+# yes they changed from mutter-4 -> mutter-5 recently so be perpared
+MUTTER_API_NAME = "mutter-5"
+
+do_install_append() {
+    # Add gir links in standard paths. That makes dependents life much easier
+    # to find them
+    install -d ${D}${datadir}/gir-1.0
+    for gir_full in `find ${D}${libdir}/${MUTTER_API_NAME} -name '*.gir'`; do
+        gir=`basename "$gir_full"`
+        ln -sr "${D}${libdir}/${MUTTER_API_NAME}/$gir" "${D}${datadir}/gir-1.0/$gir"
+    done
+}
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN} += " \
+    ${datadir}/gnome-control-center \
+    ${libdir}/${MUTTER_API_NAME}/lib*${SOLIBS} \
+    ${libdir}/${MUTTER_API_NAME}/*.typelib \
+    ${libdir}/${MUTTER_API_NAME}/plugins \
+"
+
+FILES_${PN}-tests += " \
+    ${datadir}/installed-tests \
+    ${datadir}/${MUTTER_API_NAME}/tests \
+    ${libexecdir}/installed-tests/${MUTTER_API_NAME} \
+"
+
+FILES_${PN}-dev += " \
+    ${libdir}/${MUTTER_API_NAME}/*.gir \
+    ${libdir}/${MUTTER_API_NAME}/lib*.so \
+"
+
+RDEPENDS_${PN} += "zenity"
+
-- 
2.21.0


