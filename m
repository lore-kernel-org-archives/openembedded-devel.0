Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6008960AFD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 21:06:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v4so8612760wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PZV/3kLBqfrZZHJLlXeoG305iDaomP4iEIB/3oomJEU=;
	b=oa9IlelmZBNZDfHGWpoZ+sgMUV5KYI0NvKtCfGqLHsKY/OYinqc8yKYrqgr00lkQIg
	ChpkX5piduexsslktX6DzyWBpZRhLqSXrHueBKPTLN+YKfiaJ7G7BPOL168+YRilRiLB
	UPoxKJ5lJ3On0em9r+BwsKU/H/F9bM48GCiVE+Vog7gchL2XqMHzZubzj4/FffLnIVTt
	LtsY+sKyi8FQAuRBoTdDRjuJqqyeo03OoaUUQDg5de1n1HiFm5fyXSHKw6rK4ptBxouZ
	hV21Qc6bWw+/tBO+BSudkmDAc5YzDyKCtRe/1pX1bZwcUsmO2Djlnnu6wjJlmrmlGW/U
	pZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PZV/3kLBqfrZZHJLlXeoG305iDaomP4iEIB/3oomJEU=;
	b=NDK/MYi294FEe1vx+NFL5y0bRUsGUwPePjwpcH86qC8gfCXtF8Jy3uXWaqLxAuKM76
	56Dikr7ENzYnUmj26x6/HZ79kUiuujh8rkKPeywTuV2cw4nxNwVIj9cRZvg7hvdc8ETh
	RkzYHOXhwjxLBt3Fm1325mQXTYaU7Rxj8jVeBormgsTmDhVVbj3ndEId1sHNzRrPk1yK
	YB60mggClDhUvdEeHUfGsMmWSsb3cQpaQIqbwela8xzzOFnLH4yaFCAADghSNn+CPt8M
	vY9B8gOlFUdCiU1915VpFXhgbvIzVDLqiaff2G86NsQC7XLlmB1V+9P4qO9z9W8mh3XU
	lhgg==
X-Gm-Message-State: ANhLgQ3P2V0UJSitAx2Cz5pbj4kNC6Vosty0mntIbsUXymM+l9YkVzsG
	Q0smbCLatoe4NYJZPv4MSYZADl2l
X-Google-Smtp-Source: ADFU+vviUtUDjho5JYOzHbNOSZaq+5tq9WgAOHCr0/Rf567p9f/HGED2zhQMzbkzLpVQRAONLBDXPw==
X-Received: by 2002:adf:94c2:: with SMTP id 60mr9520303wrr.396.1583701601402; 
	Sun, 08 Mar 2020 14:06:41 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0623924E94E7AA8CB6D463.dip0.t-ipconnect.de.
	[2003:f0:7f06:2392:4e94:e7aa:8cb6:d463])
	by smtp.gmail.com with ESMTPSA id o5sm23193457wmb.8.2020.03.08.14.06.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 14:06:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 22:06:30 +0100
Message-Id: <20200308210630.23306-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] mutter: add patch from upstream to fix build with mesa >= 20.0.x
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
X-List-Received-Date: Sun, 08 Mar 2020 21:06:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fixes:
| FAILED: cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.o
| arm-mortsgna-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dh=
ard -mcpu=3Dcortex-a7 --sysroot=3D/home/superandy/tmp/oe-core-glibc/work/co=
rtexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroo=
t -Icogl/cogl/d9c41d2@@mutter-cogl-5@sha -Icogl/cogl -I../mutter-3.34.4/cog=
l/cogl -Icogl -I../mutter-3.34.4/cogl -I/home/superandy/tmp/oe-core-glibc/w=
ork/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-=
sysroot/usr/include/glib-2.0 -I/home/superandy/tmp/oe-core-glibc/work/corte=
xa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/u=
sr/lib/glib-2.0/include -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2=
hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/in=
clude/libdrm -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfp=
v4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/include/cairo=
 -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-=
linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/include/pixman-1 -I/home/=
superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnu=
eabi/mutter/3.34.4-r0/recipe-sysroot/usr/include/uuid -I/home/superandy/tmp=
/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3=
.34.4-r0/recipe-sysroot/usr/include/freetype2 -I/home/superandy/tmp/oe-core=
-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0=
/recipe-sysroot/usr/include/libpng16 -I/home/superandy/tmp/oe-core-glibc/wo=
rk/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-s=
ysroot/usr/include/gdk-pixbuf-2.0 -fdiagnostics-color=3Dalways -pipe -D_FIL=
E_OFFSET_BITS=3D64 -D_GNU_SOURCE -O2 -g -feliminate-unused-debug-types -fma=
cro-prefix-map=3D/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-v=
fpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0=3D/usr/src/debug/mutter/3.34.4=
-r0 -fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/work/cortexa7t2h=
f-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0=3D/usr/src/debug/mutte=
r/3.34.4-r0 -fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/work/cor=
texa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot=
=3D -fdebug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/work/cortexa7t2h=
f-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot-native=
=3D -fPIC -pthread '-DCOGL_LOCALEDIR=3D"/usr/share/locale"' -DCOGL_COMPILAT=
ION '-DCOGL_GL_LIBNAME=3D"libGL.so.1"' '-DCOGL_GLES2_LIBNAME=3D"libGLESv2.s=
o"' -MD -MQ 'cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.=
o' -MF 'cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.o.d' =
-o 'cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.o' -c ../=
mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c
| ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c: In function '_cogl_w=
insys_display_setup':
| ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c:467:23: error: 'CoglR=
endererEGL' {aka 'struct _CoglRendererEGL'} has no member named 'pf_eglBind=
WaylandDisplay'
|   467 |       if (egl_renderer->pf_eglBindWaylandDisplay)
|       |                       ^~
| ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c:468:14: error: 'CoglR=
endererEGL' {aka 'struct _CoglRendererEGL'} has no member named 'pf_eglBind=
WaylandDisplay'
|   468 |  egl_renderer->pf_eglBindWaylandDisplay (egl_renderer->edpy,
|       |              ^~
| ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c: In function '_cogl_e=
gl_create_image':
| ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c:902:17: error: 'EGL_W=
AYLAND_BUFFER_WL' undeclared (first use in this function)
|   902 |   if (target =3D=3D EGL_WAYLAND_BUFFER_WL)
|       |                 ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
---
 .../0001-EGL-Include-EGL-eglmesaext.h.patch   | 72 +++++++++++++++++++
 .../recipes-gnome/mutter/mutter_3.34.4.bb     |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Include=
-EGL-eglmesaext.h.patch

diff --git a/meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Include-EGL-eg=
lmesaext.h.patch b/meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Include-=
EGL-eglmesaext.h.patch
new file mode 100644
index 000000000..b4fd03983
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Include-EGL-eglmesaex=
t.h.patch
@@ -0,0 +1,72 @@
+From a444a4c5f58ea516ad3cd9d6ddc0056c3ca9bc90 Mon Sep 17 00:00:00 2001
+From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
+Date: Sun, 20 Oct 2019 12:04:31 +0200
+Subject: [PATCH] EGL: Include EGL/eglmesaext.h
+
+The eglext.h shipped by libglvnd does not include the Mesa extensions,
+unlike the header shipped in Mesa.
+
+Fixes https://gitlab.gnome.org/GNOME/mutter/issues/876
+
+Upstream-Status: Applied [1]
+
+[1] https://gitlab.gnome.org/GNOME/mutter/-/commit/a444a4c5f58ea516ad3cd9d=
6ddc0056c3ca9bc90
+---
+ cogl/cogl/meson.build       | 2 +-
+ src/backends/meta-egl-ext.h | 1 +
+ src/backends/meta-egl.c     | 1 +
+ src/backends/meta-egl.h     | 1 +
+ 4 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/cogl/cogl/meson.build b/cogl/cogl/meson.build
+index 261955796..b0e66bff3 100644
+--- a/cogl/cogl/meson.build
++++ b/cogl/cogl/meson.build
+@@ -48,7 +48,7 @@ cogl_gl_header_h =3D configure_file(
+ built_headers +=3D [cogl_gl_header_h]
+=20
+ if have_egl
+-  cogl_egl_includes_string =3D '#include <EGL/egl.h>\n#include <EGL/eglex=
t.h>'
++  cogl_egl_includes_string =3D '#include <EGL/egl.h>\n#include <EGL/eglex=
t.h>\n#include <EGL/eglmesaext.h>'
+ else
+   cogl_egl_includes_string =3D ''
+ endif
+diff --git a/src/backends/meta-egl-ext.h b/src/backends/meta-egl-ext.h
+index 8705e7d5b..db0b74f76 100644
+--- a/src/backends/meta-egl-ext.h
++++ b/src/backends/meta-egl-ext.h
+@@ -29,6 +29,7 @@
+=20
+ #include <EGL/egl.h>
+ #include <EGL/eglext.h>
++#include <EGL/eglmesaext.h>
+=20
+ /*
+  * This is a little different to the tests shipped with EGL implementatio=
ns,
+diff --git a/src/backends/meta-egl.c b/src/backends/meta-egl.c
+index 6554be935..fdeff4f77 100644
+--- a/src/backends/meta-egl.c
++++ b/src/backends/meta-egl.c
+@@ -27,6 +27,7 @@
+=20
+ #include <EGL/egl.h>
+ #include <EGL/eglext.h>
++#include <EGL/eglmesaext.h>
+ #include <gio/gio.h>
+ #include <glib.h>
+ #include <glib-object.h>
+diff --git a/src/backends/meta-egl.h b/src/backends/meta-egl.h
+index f2a816445..4591e7d85 100644
+--- a/src/backends/meta-egl.h
++++ b/src/backends/meta-egl.h
+@@ -28,6 +28,7 @@
+=20
+ #include <EGL/egl.h>
+ #include <EGL/eglext.h>
++#include <EGL/eglmesaext.h>
+ #include <glib-object.h>
+=20
+ #define META_EGL_ERROR meta_egl_error_quark ()
+--=20
+2.21.1
+
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_3.34.4.bb
index b4ddc5dad..7979802d2 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
@@ -24,6 +24,7 @@ inherit gnomebase gsettings gobject-introspection gettext=
 upstream-version-is-ev
=20
 SRC_URI[archive.md5sum] =3D "de19a6de98a2250dd7efdfca14359e39"
 SRC_URI[archive.sha256sum] =3D "0134513515f605dd0858154d0b54d2e23c5779d525=
90533e266d407251e20ba2"
+SRC_URI +=3D "file://0001-EGL-Include-EGL-eglmesaext.h.patch"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "x11"
--=20
2.21.1


