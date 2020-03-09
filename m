Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA9AA60C74
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2020 19:30:47 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z65so5274553pfz.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2020 12:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=sq/LeUOqoDp2EGFV+tq6dOUWPbJ9FODtmZ3PuJnIhbs=;
	b=Aauk9Vc9Xvyo83e71fetzygoZ+zXuaaRTW8AcWhg8FfvnIc61NIjsdO+n0rhh8CtNG
	DUAAgyxhMRg51WuXiu+exLObhJCxP/3HCDP7U82d0REb0DhD7+OWlclC1ZdkixmjnyUo
	3HbL2yAT/MntIam7+1kJaOJbKTb+BZGT+ihlEqVsR+T1lPkLfmNtli0Zjf5kHRbRPhMp
	JLLi73zj/5ee2VLTfQTeb5YFqnIhfQKjfZWUCLP430FiBvXFXgpKw0OethfV2Wc2UWdX
	jSJ3neR8/bAMnNIxIL4ZYsn7ci7W2pBDguSnxJH/3PcGMhztThSGZDC5qs9pDxgl7HYB
	s3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sq/LeUOqoDp2EGFV+tq6dOUWPbJ9FODtmZ3PuJnIhbs=;
	b=mddpi1WGj4vdNV9g+cNAdhvHzRfIJJzLijH7OEoSpevs3BtJ5ywnxn1jwXZ4Zqko98
	jgpa+Xzg/VWPNRygnwcX6GRtnC9w6oV8K7xVzODoftMFKzX5o2WJlfiwgRRgAJNR18tU
	7KcL2mFjpjcwEyDhxTBFKUIee4HtQmQ8/nIKWY6257QV6556I4CxPgcTxktjNbl50uUA
	cAHgYnnrrm8RGoBv+G8dKfAiJwFMmlaOSG8Xo3t/oKSH6gicpXRKzsKqQxZizVP3Soi0
	1/66rVzjdnVi7ZYFtCqZAbLhO9Png3IaKXlac/rHVb4jAzRpElTuGIi4B+5PEBTlAvkU
	/kjQ==
X-Gm-Message-State: ANhLgQ3KGMDTz6Xcqq5dR4nB3XG+0hR5MEhB+XvypE0a7cCDwRAfnt4H
	dsirFJtW6YKgcgc+u32uB2Ee2KFc
X-Google-Smtp-Source: ADFU+vvSfqj96+YmUU9D7TzjAMVkFQfOSsEvdVpVMMTc4cL0Mj9z9qIDWcDnflXAsRqdbCSmCFZkxg==
X-Received: by 2002:a63:7c1d:: with SMTP id x29mr16959107pgc.197.1583782248483;
	Mon, 09 Mar 2020 12:30:48 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:c52f:28e9:beb5:18ac?
	([2601:202:4180:a5c0:c52f:28e9:beb5:18ac])
	by smtp.gmail.com with ESMTPSA id
	h22sm45081295pgn.57.2020.03.09.12.30.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Mar 2020 12:30:48 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20200308210630.23306-1-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c4517e41-78a8-ef05-33ea-5b721d28e6f1@gmail.com>
Date: Mon, 9 Mar 2020 12:30:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200308210630.23306-1-schnitzeltony@gmail.com>
Subject: Re: [PATCH] mutter: add patch from upstream to fix build with mesa >= 20.0.x
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
X-List-Received-Date: Mon, 09 Mar 2020 19:30:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 3/8/20 2:06 PM, Andreas M=C3=BCller wrote:
> Fixes:
> | FAILED: cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c=
=2Eo
> | arm-mortsgna-linux-gnueabi-gcc -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=
=3Dhard -mcpu=3Dcortex-a7 --sysroot=3D/home/superandy/tmp/oe-core-glibc/w=
ork/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recip=
e-sysroot -Icogl/cogl/d9c41d2@@mutter-cogl-5@sha -Icogl/cogl -I../mutter-=
3.34.4/cogl/cogl -Icogl -I../mutter-3.34.4/cogl -I/home/superandy/tmp/oe-=
core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.3=
4.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/superandy/tmp/oe-core-=
glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r=
0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/superandy/tmp/oe-core-g=
libc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0=
/recipe-sysroot/usr/include/libdrm -I/home/superandy/tmp/oe-core-glibc/wo=
rk/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe=
-sysroot/usr/include/cairo -I/home/superandy/tmp/oe-core-glibc/work/corte=
xa7t2hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot=
/usr/include/pixman-1 -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2=
hf-neon-vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/=
include/uuid -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-v=
fpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/include/f=
reetype2 -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4=
-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/include/libpn=
g16 -I/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mort=
sgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot/usr/include/gdk-pixbuf=
-2.0 -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -D_GNU_S=
OURCE -O2 -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/home/su=
perandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsgna-linux-gnu=
eabi/mutter/3.34.4-r0=3D/usr/src/debug/mutter/3.34.4-r0 -fdebug-prefix-ma=
p=3D/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-mortsg=
na-linux-gnueabi/mutter/3.34.4-r0=3D/usr/src/debug/mutter/3.34.4-r0 -fdeb=
ug-prefix-map=3D/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-=
vfpv4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot=3D -fdebug-p=
refix-map=3D/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv=
4-mortsgna-linux-gnueabi/mutter/3.34.4-r0/recipe-sysroot-native=3D -fPIC =
-pthread '-DCOGL_LOCALEDIR=3D"/usr/share/locale"' -DCOGL_COMPILATION '-DC=
OGL_GL_LIBNAME=3D"libGL.so.1"' '-DCOGL_GLES2_LIBNAME=3D"libGLESv2.so"' -M=
D -MQ 'cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.o' -=
MF 'cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.o.d' -o=
 'cogl/cogl/d9c41d2@@mutter-cogl-5@sha/winsys_cogl-winsys-egl.c.o' -c ../=
mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c
> | ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c: In function '_co=
gl_winsys_display_setup':
> | ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c:467:23: error: 'C=
oglRendererEGL' {aka 'struct _CoglRendererEGL'} has no member named 'pf_e=
glBindWaylandDisplay'
> |   467 |       if (egl_renderer->pf_eglBindWaylandDisplay)
> |       |                       ^~
> | ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c:468:14: error: 'C=
oglRendererEGL' {aka 'struct _CoglRendererEGL'} has no member named 'pf_e=
glBindWaylandDisplay'
> |   468 |  egl_renderer->pf_eglBindWaylandDisplay (egl_renderer->edpy,
> |       |              ^~
> | ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c: In function '_co=
gl_egl_create_image':
> | ../mutter-3.34.4/cogl/cogl/winsys/cogl-winsys-egl.c:902:17: error: 'E=
GL_WAYLAND_BUFFER_WL' undeclared (first use in this function)
> |   902 |   if (target =3D=3D EGL_WAYLAND_BUFFER_WL)
> |       |                 ^~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../0001-EGL-Include-EGL-eglmesaext.h.patch   | 72 +++++++++++++++++++=

>  .../recipes-gnome/mutter/mutter_3.34.4.bb     |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Inc=
lude-EGL-eglmesaext.h.patch
>
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Include-EG=
L-eglmesaext.h.patch b/meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-In=
clude-EGL-eglmesaext.h.patch
> new file mode 100644
> index 000000000..b4fd03983
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/mutter/mutter/0001-EGL-Include-EGL-eglme=
saext.h.patch
> @@ -0,0 +1,72 @@
> +From a444a4c5f58ea516ad3cd9d6ddc0056c3ca9bc90 Mon Sep 17 00:00:00 2001=

> +From: "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>
> +Date: Sun, 20 Oct 2019 12:04:31 +0200
> +Subject: [PATCH] EGL: Include EGL/eglmesaext.h
> +
> +The eglext.h shipped by libglvnd does not include the Mesa extensions,=

> +unlike the header shipped in Mesa.
> +
> +Fixes https://gitlab.gnome.org/GNOME/mutter/issues/876
> +
> +Upstream-Status: Applied [1]

Missing Signed-off-by:
> +
> +[1] https://gitlab.gnome.org/GNOME/mutter/-/commit/a444a4c5f58ea516ad3=
cd9d6ddc0056c3ca9bc90
> +---
> + cogl/cogl/meson.build       | 2 +-
> + src/backends/meta-egl-ext.h | 1 +
> + src/backends/meta-egl.c     | 1 +
> + src/backends/meta-egl.h     | 1 +
> + 4 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/cogl/cogl/meson.build b/cogl/cogl/meson.build
> +index 261955796..b0e66bff3 100644
> +--- a/cogl/cogl/meson.build
> ++++ b/cogl/cogl/meson.build
> +@@ -48,7 +48,7 @@ cogl_gl_header_h =3D configure_file(
> + built_headers +=3D [cogl_gl_header_h]
> +=20
> + if have_egl
> +-  cogl_egl_includes_string =3D '#include <EGL/egl.h>\n#include <EGL/e=
glext.h>'
> ++  cogl_egl_includes_string =3D '#include <EGL/egl.h>\n#include <EGL/e=
glext.h>\n#include <EGL/eglmesaext.h>'
> + else
> +   cogl_egl_includes_string =3D ''
> + endif
> +diff --git a/src/backends/meta-egl-ext.h b/src/backends/meta-egl-ext.h=

> +index 8705e7d5b..db0b74f76 100644
> +--- a/src/backends/meta-egl-ext.h
> ++++ b/src/backends/meta-egl-ext.h
> +@@ -29,6 +29,7 @@
> +=20
> + #include <EGL/egl.h>
> + #include <EGL/eglext.h>
> ++#include <EGL/eglmesaext.h>
> +=20
> + /*
> +  * This is a little different to the tests shipped with EGL implement=
ations,
> +diff --git a/src/backends/meta-egl.c b/src/backends/meta-egl.c
> +index 6554be935..fdeff4f77 100644
> +--- a/src/backends/meta-egl.c
> ++++ b/src/backends/meta-egl.c
> +@@ -27,6 +27,7 @@
> +=20
> + #include <EGL/egl.h>
> + #include <EGL/eglext.h>
> ++#include <EGL/eglmesaext.h>
> + #include <gio/gio.h>
> + #include <glib.h>
> + #include <glib-object.h>
> +diff --git a/src/backends/meta-egl.h b/src/backends/meta-egl.h
> +index f2a816445..4591e7d85 100644
> +--- a/src/backends/meta-egl.h
> ++++ b/src/backends/meta-egl.h
> +@@ -28,6 +28,7 @@
> +=20
> + #include <EGL/egl.h>
> + #include <EGL/eglext.h>
> ++#include <EGL/eglmesaext.h>
> + #include <glib-object.h>
> +=20
> + #define META_EGL_ERROR meta_egl_error_quark ()
> +--=20
> +2.21.1
> +
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb b/meta-gn=
ome/recipes-gnome/mutter/mutter_3.34.4.bb
> index b4ddc5dad..7979802d2 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.4.bb
> @@ -24,6 +24,7 @@ inherit gnomebase gsettings gobject-introspection get=
text upstream-version-is-ev
> =20
>  SRC_URI[archive.md5sum] =3D "de19a6de98a2250dd7efdfca14359e39"
>  SRC_URI[archive.sha256sum] =3D "0134513515f605dd0858154d0b54d2e23c5779=
d52590533e266d407251e20ba2"
> +SRC_URI +=3D "file://0001-EGL-Include-EGL-eglmesaext.h.patch"
> =20
>  # x11 is still manadatory - see meson.build
>  REQUIRED_DISTRO_FEATURES =3D "x11"



