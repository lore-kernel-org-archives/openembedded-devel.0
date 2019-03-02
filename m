Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4EB7CDDC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 02:50:46 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id r14so12341615pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 18:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M84q0Y5bC7ZRbInZx2L871XJu64Voxzzb+z/7B7etWk=;
	b=B5R0pp44yrGjuSqs4RrHqnLGh1XufbHXnJN/yJOloPq2gyKHQtDVfj0Y7lOQiKRgUC
	ODB/HSavHuEcpf26TqjiER1RcDZpPV31NR52mON/HnjeAdDlhhlBWSgF1pVI9JG+GDlx
	/AITSqMtnL3JjQRL0z6hKoHuz9E6A4S7qzzVB48tAVQJXRlY//ThUmrNDV8XrwEAQ2F4
	nmB9oDOopSH7ItEXMKwlXK+9Jg9UKW9fNUiCnPBgw+KN1cPsyjaVq1ri1MBwMkHE7Sai
	W7Dd8F1ben14EhzG8WHsirvjjBAOYPiD1Sjk+ObBDyRkSNbnNkVkkUz0Ks09CFr3BmrM
	eu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M84q0Y5bC7ZRbInZx2L871XJu64Voxzzb+z/7B7etWk=;
	b=j5Y0HpKwny775172KKHZgxTC1/dAnmUMO5PwItORZ3bAJcMRsO9P1rRTx4mbnsRQRB
	pQAldjSZhhmE8eDIR7WETkaP6EsywmgHlGsz9/X6PRSspHonXLVN2WjPfLdRFkgtNlgt
	+1FOM7AaSDyaDNjgno+K9JO6ua6+aR7DvWdJ2K02YojCdf/1//sdPT0cdPLa9QruHPTK
	F27DGtpeZ21QEel9EzkUxQhwCB7G2Co2JwuEJXnS2iDVoRlIDo+f3jzC6WDZBXvsF32n
	hY2Ox9WQqN31EwWajAUaVOiG1SdyX9wFH5nb+55nsVA0e4qKoFjCiBEdTLn9AYfwCY4s
	2k/w==
X-Gm-Message-State: APjAAAXGFCc99gCKTxLsVnITWIYE6yjaWglpzGCRL3oW4i5tYeWylqC7
	TPwhwjIIHoNa2y8eVwRu0PPC2QP9
X-Google-Smtp-Source: APXvYqyYr2IHC+7xm+m5dE9jtxa/JpIWxvrQ6INzh/bhcd8J/wtWfIOczRBX8NvFhTAWD/IofmNNDQ==
X-Received: by 2002:a17:902:7889:: with SMTP id
	q9mr9047639pll.305.1551495046757; 
	Fri, 01 Mar 2019 18:50:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id z7sm46600905pfl.4.2019.03.01.18.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 18:50:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2019 18:50:33 -0800
Message-Id: <20190302025034.10954-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190302025034.10954-1-raj.khem@gmail.com>
References: <20190302025034.10954-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/3] vlc: Upgrade to 3.0.6
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
X-List-Received-Date: Sat, 02 Mar 2019 02:50:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patches or fixed differently upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/vlc/vlc.inc            |  18 +-
 .../vlc/vlc/0001-enable-subdir-objects.patch  |  13 -
 .../0002-glibc-does-not-provide-strlcpy.patch |  12 +-
 .../vlc/vlc/0003-use-am-path-libgcrypt.patch  |  46 ---
 ...04-modules-gui-qt4-out-of-tree-build.patch |  19 --
 .../vlc/0005-libpostproc-header-check.patch   |  12 +-
 .../vlc/vlc/0008-fix-luaL-checkint.patch      | 234 ++++++--------
 ...-swscale-use-AV_PIX_FMT-consistently.patch | 293 ------------------
 ...010-SWSCALE-fix-compilation-with-4.x.patch |  45 ---
 .../recipes-multimedia/vlc/vlc_2.2.2.bb       |  19 --
 .../recipes-multimedia/vlc/vlc_3.0.6.bb       |  14 +
 11 files changed, 127 insertions(+), 598 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-enable-subdir-objects.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index f13c0ead6e..19ac8206c6 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "fribidi libtool libgcrypt libgcrypt-native \
+DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
    dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac fluidsynth alsa-lib \
    lua-native lua libidn \
@@ -21,12 +21,12 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 inherit autotools gettext pkgconfig distro_features_check
 
 ARM_INSTRUCTION_SET = "arm"
-
+export BUILDCC = "${BUILD_CC}"
 EXTRA_OECONF = "\
     --enable-run-as-root \
     --enable-xvideo \
     --disable-screen --disable-caca \
-    --enable-httpd --enable-vlm \
+    --enable-vlm \
     --enable-freetype \
     --enable-tremor \
     --enable-v4l2 --disable-aa --disable-faad \
@@ -35,22 +35,22 @@ EXTRA_OECONF = "\
     --without-kde-solid \
     --enable-realrtsp \
     --disable-libtar \
+    --enable-avcodec \
     ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
     ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl vdpau', '', d)}"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
-PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
 PACKAGECONFIG[libass] = "--enable-libass,--disable-libass,libass"
-PACKAGECONFIG[mkv] = "--enable-mkv,--disable-mkv,libmatroska libebml"
 PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc,libpostproc"
+PACKAGECONFIG[libva] = "--enable-libva,--disable-libva,libva"
 PACKAGECONFIG[opencv] = "--enable-opencv,--disable-opencv,opencv"
-PACKAGECONFIG[libva] = "--enable-libva --enable-avcodec,--disable-libva --disable-avcodec,libva libav"
 PACKAGECONFIG[speex] = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
 PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
@@ -81,7 +81,6 @@ do_configure_prepend() {
 }
 
 do_configure_append() {
-    sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/include\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
     sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${TARGET_SYS}-libtool:g ${B}/doltlibtool
 }
 
@@ -94,10 +93,11 @@ FILES_libvlc = "${libdir}/lib*.so.*"
 
 FILES_${PN} += "\
     ${bindir}/vlc \
+    ${libdir}/vlc/vlc/libvlc_vdpau.so \
     ${datadir}/applications \
     ${datadir}/vlc/ \
     ${datadir}/icons \
-    ${lindir}/vlc/vlc/libvlc_vdpau.so \
+    ${datadir}/metainfo/vlc.appdata.xml \
 "
 
 FILES_${PN}-dbg += "\
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-enable-subdir-objects.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-enable-subdir-objects.patch
deleted file mode 100644
index 9f0e708ed7..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-enable-subdir-objects.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: vlc-2.1.2/configure.ac
-===================================================================
---- vlc-2.1.2.orig/configure.ac
-+++ vlc-2.1.2/configure.ac
-@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
- AC_CANONICAL_HOST
- AC_PRESERVE_HELP_ORDER
- 
--AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
-+AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
- AC_CONFIG_HEADERS([config.h])
- 
- # Disable with "./configure --disable-silent-rules" or "make V=1"
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
index 6d2a46fb3c..3db3df34b2 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0002-glibc-does-not-provide-strlcpy.patch
@@ -1,8 +1,6 @@
-Index: vlc-2.1.2/src/input/subtitles.c
-===================================================================
---- vlc-2.1.2.orig/src/input/subtitles.c
-+++ vlc-2.1.2/src/input/subtitles.c
-@@ -44,6 +44,12 @@
+--- a/src/input/subtitles.c
++++ b/src/input/subtitles.c
+@@ -42,6 +42,12 @@
  #include "input_internal.h"
  
  /**
@@ -12,6 +10,6 @@ Index: vlc-2.1.2/src/input/subtitles.c
 +#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) = '\0'
 +
 +/**
-  * We are not going to autodetect more subtitle files than this.
+  * The possible extensions for subtitle files we support
   */
- #define MAX_SUBTITLE_FILES 128
+ static const char *const sub_exts[] = { SLAVE_SPU_EXTENSIONS, "" };
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
deleted file mode 100644
index 8e881d0935..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-* The upstream tests for libgcrypt are awkward and not working.
-  - Requires libgcrypt-config, which seems broken?
-* AM_PATH_LIBGCRYPT exists for a reason, why not use it? KISS.
-* Upstream abandoned AM_PATH_LIBGCRYPT in the past...newer automake ok?
-
-Upstream status: Pending
-
-Index: vlc-2.2.1/configure.ac
-===================================================================
---- vlc-2.2.1.orig/configure.ac
-+++ vlc-2.2.1/configure.ac
-@@ -4017,25 +4017,19 @@ PKG_ENABLE_MODULES_VLC([LIBXML2], [xml],
- dnl
- dnl libgcrypt
- dnl
-+GCRYPT_LIBVER=1
-+GCRYPT_REQ=1.1.94
- AC_ARG_ENABLE(libgcrypt,
-   [  --disable-libgcrypt     gcrypt support (default enabled)])
- AS_IF([test "${enable_libgcrypt}" != "no"], [
--  AC_CHECK_DECL([GCRYCTL_SET_THREAD_CBS], [
--    libgcrypt-config --version >/dev/null || \
--        AC_MSG_ERROR([gcrypt.h present but libgcrypt-config could not be found])
--    AC_CHECK_LIB(gcrypt, gcry_control, [
--      have_libgcrypt="yes"
--      GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
--      GCRYPT_LIBS="`libgcrypt-config --libs`"
--    ], [
--      AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or pass --disable-libgcrypt.])
--    ], [`libgcrypt-config --libs`])
--  ], [
--    AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or pass --disable-libgcrypt.])
--  ], [#include <gcrypt.h>]
--  )
-+      AM_PATH_LIBGCRYPT($GCRYPT_LIBVER:$GCRYPT_REQ,
-+      [
-+          GCRYPT_CFLAGS="$LIBGCRYPT_CFLAGS"
-+          GCRYPT_LIBS="$LIBGCRYPT_LIBS"
-+      ],[
-+          AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
-+      ])
- ])
--
- AC_SUBST(GCRYPT_CFLAGS)
- AC_SUBST(GCRYPT_LIBS)
- AM_CONDITIONAL([HAVE_GCRYPT], [test "${have_libgcrypt}" = "yes"])
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
deleted file mode 100644
index 53df1c6ebf..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-* modules/gui/qt4/Makefile.am not B!=S friendly
-* Simple solution to missing directories in ${B}
-
-Upstream status: Pending
-
-Signed-off-by: Tim Orling <TicoTimo@gmail.com>
-
-Index: vlc-2.2.1/modules/gui/qt4/Makefile.am
-===================================================================
---- vlc-2.2.1.orig/modules/gui/qt4/Makefile.am
-+++ vlc-2.2.1/modules/gui/qt4/Makefile.am
-@@ -127,6 +127,7 @@ moc_verbose_0 = @echo "  MOC   " $@;
- moc_verbose__0 = $(moc_verbose_0)
- 
- .hpp.moc.cpp:
-+	[ -d $(dir $@) ] || mkdir -p $(dir $@)
- 	$(moc_verbose)$(MOC) $(MOC_CPPFLAGS) -o $@ $<
- 
- # These MOC files depend on the configure settings:
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
index 2d84ffd2f4..77a7d61730 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0005-libpostproc-header-check.patch
@@ -2,16 +2,14 @@
 
 Upstream-status: Pending
 
-Index: vlc-2.1.4/configure.ac
-===================================================================
---- vlc-2.1.4.orig/configure.ac
-+++ vlc-2.1.4/configure.ac
-@@ -2444,7 +2444,7 @@ then
+--- a/configure.ac
++++ b/configure.ac
+@@ -2589,7 +2589,7 @@ then
        VLC_SAVE_FLAGS
        CPPFLAGS="${CPPFLAGS} ${POSTPROC_CFLAGS}"
        CFLAGS="${CFLAGS} ${POSTPROC_CFLAGS}"
 -      AC_CHECK_HEADERS(postproc/postprocess.h)
 +      AC_CHECK_HEADERS(postproc/postprocess.h,[],[AC_CHECK_HEADERS(libpostproc/postprocess.h)])
        VLC_ADD_PLUGIN([postproc])
-       VLC_ADD_LIBS([postproc],[$POSTPROC_LIBS $AVUTIL_LIBS])
-       VLC_ADD_CFLAGS([postproc],[$POSTPROC_CFLAGS $AVUTIL_CFLAGS])
+       VLC_RESTORE_FLAGS
+     ],[
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
index 145e1ab821..96b5d2d246 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0008-fix-luaL-checkint.patch
@@ -5,46 +5,29 @@ Upstream-status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 
-Index: vlc-2.2.1/modules/lua/demux.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/demux.c
-+++ vlc-2.2.1/modules/lua/demux.c
-@@ -52,7 +52,7 @@ struct demux_sys_t
+--- a/modules/lua/demux.c
++++ b/modules/lua/demux.c
+@@ -52,7 +52,7 @@ struct vlclua_playlist
  static int vlclua_demux_peek( lua_State *L )
  {
-     demux_t *p_demux = (demux_t *)vlclua_get_this( L );
+     stream_t *s = (stream_t *)vlclua_get_this(L);
 -    int n = luaL_checkint( L, 1 );
 +    int n = luaL_checkinteger( L, 1 );
      const uint8_t *p_peek;
  
-     int i_peek = stream_Peek( p_demux->s, &p_peek, n );
-@@ -67,7 +67,7 @@ static int vlclua_demux_read( lua_State
+     ssize_t val = vlc_stream_Peek(s->p_source, &p_peek, n);
+@@ -66,7 +66,7 @@ static int vlclua_demux_peek( lua_State
+ static int vlclua_demux_read( lua_State *L )
  {
-     demux_t *p_demux = (demux_t *)vlclua_get_this( L );
-     const uint8_t *p_read;
+     stream_t *s = (stream_t *)vlclua_get_this(L);
 -    int n = luaL_checkint( L, 1 );
 +    int n = luaL_checkinteger( L, 1 );
-     int i_read = stream_Peek( p_demux->s, &p_read, n );
+     char *buf = malloc(n);
  
-     if( i_read > 0 )
-Index: vlc-2.2.1/modules/lua/libs/configuration.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/configuration.c
-+++ vlc-2.2.1/modules/lua/libs/configuration.c
-@@ -84,7 +84,7 @@ static int vlclua_config_set( lua_State
-             break;
- 
-         case VLC_VAR_INTEGER:
--            config_PutInt( p_this, psz_name, luaL_checkint( L, 2 ) );
-+            config_PutInt( p_this, psz_name, luaL_checkinteger( L, 2 ) );
-             break;
- 
-         case VLC_VAR_BOOL:
-Index: vlc-2.2.1/modules/lua/libs/net.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/net.c
-+++ vlc-2.2.1/modules/lua/libs/net.c
-@@ -202,7 +202,7 @@ static int vlclua_net_listen_tcp( lua_St
+     if (buf != NULL)
+--- a/modules/lua/libs/net.c
++++ b/modules/lua/libs/net.c
+@@ -179,7 +179,7 @@ static int vlclua_net_listen_tcp( lua_St
  {
      vlc_object_t *p_this = vlclua_get_this( L );
      const char *psz_host = luaL_checkstring( L, 1 );
@@ -53,16 +36,16 @@ Index: vlc-2.2.1/modules/lua/libs/net.c
      int *pi_fd = net_ListenTCP( p_this, psz_host, i_port );
      if( pi_fd == NULL )
          return luaL_error( L, "Cannot listen on %s:%d", psz_host, i_port );
-@@ -274,7 +274,7 @@ static int vlclua_net_connect_tcp( lua_S
+@@ -251,7 +251,7 @@ static int vlclua_net_connect_tcp( lua_S
  {
      vlc_object_t *p_this = vlclua_get_this( L );
      const char *psz_host = luaL_checkstring( L, 1 );
 -    int i_port = luaL_checkint( L, 2 );
 +    int i_port = luaL_checkinteger( L, 2 );
-     int i_fd = net_Connect( p_this, psz_host, i_port, SOCK_STREAM, IPPROTO_TCP );
+     int i_fd = net_ConnectTCP( p_this, psz_host, i_port );
      lua_pushinteger( L, vlclua_fd_map_safe( L, i_fd ) );
      return 1;
-@@ -282,26 +282,26 @@ static int vlclua_net_connect_tcp( lua_S
+@@ -259,14 +259,14 @@ static int vlclua_net_connect_tcp( lua_S
  
  static int vlclua_net_close( lua_State *L )
  {
@@ -79,22 +62,25 @@ Index: vlc-2.2.1/modules/lua/libs/net.c
      size_t i_len;
      const char *psz_buffer = luaL_checklstring( L, 2, &i_len );
  
--    i_len = luaL_optint( L, 3, i_len );
-+    i_len = luaL_optinteger( L, 3, i_len );
-     lua_pushinteger( L, (fd != -1) ? send( fd, psz_buffer, i_len, 0 ) : -1 );
-     return 1;
- }
+@@ -278,7 +278,7 @@ static int vlclua_net_send( lua_State *L
  
  static int vlclua_net_recv( lua_State *L )
  {
 -    int fd = vlclua_fd_get( L, luaL_checkint( L, 1 ) );
--    size_t i_len = luaL_optint( L, 2, 1 );
 +    int fd = vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
-+    size_t i_len = luaL_optinteger( L, 2, 1 );
+     size_t i_len = (size_t)luaL_optinteger( L, 2, 1 );
      char psz_buffer[i_len];
  
-     ssize_t i_ret = (fd != -1) ? recv( fd, psz_buffer, i_len, 0 ) : -1;
-@@ -382,19 +382,19 @@ static int vlclua_fd_open( lua_State *L
+@@ -312,7 +312,7 @@ static int vlclua_net_poll( lua_State *L
+     lua_pushnil( L );
+     for( int i = 0; lua_next( L, 1 ); i++ )
+     {
+-        luafds[i] = luaL_checkint( L, -2 );
++        luafds[i] = luaL_checkinteger( L, -2 );
+         p_fds[i].fd = vlclua_fd_get( L, luafds[i] );
+         p_fds[i].events = luaL_checkinteger( L, -1 );
+         p_fds[i].events &= POLLIN | POLLOUT | POLLPRI;
+@@ -360,7 +360,7 @@ static int vlclua_fd_open( lua_State *L
  #ifndef _WIN32
  static int vlclua_fd_write( lua_State *L )
  {
@@ -103,47 +89,18 @@ Index: vlc-2.2.1/modules/lua/libs/net.c
      size_t i_len;
      const char *psz_buffer = luaL_checklstring( L, 2, &i_len );
  
--    i_len = luaL_optint( L, 3, i_len );
-+    i_len = luaL_optinteger( L, 3, i_len );
-     lua_pushinteger( L, (fd != -1) ? write( fd, psz_buffer, i_len ) : -1 );
-     return 1;
- }
+@@ -371,7 +371,7 @@ static int vlclua_fd_write( lua_State *L
  
  static int vlclua_fd_read( lua_State *L )
  {
 -    int fd = vlclua_fd_get( L, luaL_checkint( L, 1 ) );
--    size_t i_len = luaL_optint( L, 2, 1 );
 +    int fd = vlclua_fd_get( L, luaL_checkinteger( L, 1 ) );
-+    size_t i_len = luaL_optinteger( L, 2, 1 );
+     size_t i_len = (size_t)luaL_optinteger( L, 2, 1 );
      char psz_buffer[i_len];
  
-     ssize_t i_ret = (fd != -1) ? read( fd, psz_buffer, i_len ) : -1;
-Index: vlc-2.2.1/modules/lua/libs/osd.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/osd.c
-+++ vlc-2.2.1/modules/lua/libs/osd.c
-@@ -67,7 +67,7 @@ static int vlclua_osd_icon( lua_State *L
- {
-     const char *psz_icon = luaL_checkstring( L, 1 );
-     int i_icon = vlc_osd_icon_from_string( psz_icon );
--    int i_chan = luaL_optint( L, 2, SPU_DEFAULT_CHANNEL );
-+    int i_chan = luaL_optinteger( L, 2, SPU_DEFAULT_CHANNEL );
-     if( !i_icon )
-         return luaL_error( L, "\"%s\" is not a valid osd icon.", psz_icon );
- 
-@@ -114,9 +114,9 @@ static int vlc_osd_position_from_string(
- static int vlclua_osd_message( lua_State *L )
- {
-     const char *psz_message = luaL_checkstring( L, 1 );
--    int i_chan = luaL_optint( L, 2, SPU_DEFAULT_CHANNEL );
-+    int i_chan = luaL_optinteger( L, 2, SPU_DEFAULT_CHANNEL );
-     const char *psz_position = luaL_optstring( L, 3, "top-right" );
--    mtime_t duration = luaL_optint( L, 4, 1000000 );
-+    mtime_t duration = luaL_optinteger( L, 4, 1000000 );
- 
-     input_thread_t *p_input = vlclua_get_input_internal( L );
-     if( p_input )
-@@ -154,10 +154,10 @@ static int vlc_osd_slider_type_from_stri
+--- a/modules/lua/libs/osd.c
++++ b/modules/lua/libs/osd.c
+@@ -154,7 +154,7 @@ static int vlc_osd_slider_type_from_stri
  
  static int vlclua_osd_slider( lua_State *L )
  {
@@ -151,11 +108,7 @@ Index: vlc-2.2.1/modules/lua/libs/osd.c
 +    int i_position = luaL_checkinteger( L, 1 );
      const char *psz_type = luaL_checkstring( L, 2 );
      int i_type = vlc_osd_slider_type_from_string( psz_type );
--    int i_chan = luaL_optint( L, 3, SPU_DEFAULT_CHANNEL );
-+    int i_chan = luaL_optinteger( L, 3, SPU_DEFAULT_CHANNEL );
-     if( !i_type )
-         return luaL_error( L, "\"%s\" is not a valid slider type.",
-                            psz_type );
+     int i_chan = (int)luaL_optinteger( L, 3, VOUT_SPU_CHANNEL_OSD );
 @@ -198,7 +198,7 @@ static int vlclua_spu_channel_register(
  
  static int vlclua_spu_channel_clear( lua_State *L )
@@ -165,10 +118,8 @@ Index: vlc-2.2.1/modules/lua/libs/osd.c
      input_thread_t *p_input = vlclua_get_input_internal( L );
      if( !p_input )
          return luaL_error( L, "Unable to find input." );
-Index: vlc-2.2.1/modules/lua/libs/playlist.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/playlist.c
-+++ vlc-2.2.1/modules/lua/libs/playlist.c
+--- a/modules/lua/libs/playlist.c
++++ b/modules/lua/libs/playlist.c
 @@ -69,7 +69,7 @@ static int vlclua_playlist_next( lua_Sta
  
  static int vlclua_playlist_skip( lua_State * L )
@@ -186,17 +137,17 @@ Index: vlc-2.2.1/modules/lua/libs/playlist.c
 +    int i_id = luaL_checkinteger( L, 1 );
      playlist_t *p_playlist = vlclua_get_playlist_internal( L );
      PL_LOCK;
-     int i_ret = playlist_Control( p_playlist, PLAYLIST_VIEWPLAY,
-@@ -139,7 +139,7 @@ static int vlclua_playlist_gotoitem( lua
+     playlist_ViewPlay( p_playlist, NULL,
+@@ -138,7 +138,7 @@ static int vlclua_playlist_gotoitem( lua
  
  static int vlclua_playlist_delete( lua_State * L )
  {
 -    int i_id = luaL_checkint( L, 1 );
 +    int i_id = luaL_checkinteger( L, 1 );
      playlist_t *p_playlist = vlclua_get_playlist_internal( L );
+ 
      PL_LOCK;
-     playlist_item_t *p_item = playlist_ItemGetById( p_playlist, i_id );
-@@ -155,8 +155,8 @@ static int vlclua_playlist_delete( lua_S
+@@ -152,8 +152,8 @@ static int vlclua_playlist_delete( lua_S
  
  static int vlclua_playlist_move( lua_State * L )
  {
@@ -207,11 +158,9 @@ Index: vlc-2.2.1/modules/lua/libs/playlist.c
      playlist_t *p_playlist = vlclua_get_playlist_internal( L );
      PL_LOCK;
      playlist_item_t *p_item = playlist_ItemGetById( p_playlist, i_item );
-Index: vlc-2.2.1/modules/lua/libs/stream.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/stream.c
-+++ vlc-2.2.1/modules/lua/libs/stream.c
-@@ -101,7 +101,7 @@ static int vlclua_stream_read( lua_State
+--- a/modules/lua/libs/stream.c
++++ b/modules/lua/libs/stream.c
+@@ -123,7 +123,7 @@ static int vlclua_stream_read( lua_State
  {
      int i_read;
      stream_t **pp_stream = (stream_t **)luaL_checkudata( L, 1, "stream" );
@@ -220,23 +169,8 @@ Index: vlc-2.2.1/modules/lua/libs/stream.c
      uint8_t *p_read = malloc( n );
      if( !p_read ) return vlclua_error( L );
  
-Index: vlc-2.2.1/modules/lua/libs/variables.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/variables.c
-+++ vlc-2.2.1/modules/lua/libs/variables.c
-@@ -103,7 +103,7 @@ static int vlclua_tovalue( lua_State *L,
-             val->b_bool = luaL_checkboolean( L, -1 );
-             break;
-         case VLC_VAR_INTEGER:
--            val->i_int = luaL_checkint( L, -1 );
-+            val->i_int = luaL_checkinteger( L, -1 );
-             break;
-         case VLC_VAR_STRING:
-             val->psz_string = (char*)luaL_checkstring( L, -1 ); /* XXX: Beware, this only stays valid as long as (L,-1) stays in the stack */
-Index: vlc-2.2.1/modules/lua/libs/volume.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/volume.c
-+++ vlc-2.2.1/modules/lua/libs/volume.c
+--- a/modules/lua/libs/volume.c
++++ b/modules/lua/libs/volume.c
 @@ -48,7 +48,7 @@
  static int vlclua_volume_set( lua_State *L )
  {
@@ -246,34 +180,54 @@ Index: vlc-2.2.1/modules/lua/libs/volume.c
      if( i_volume < 0 )
          i_volume = 0;
      int i_ret = playlist_VolumeSet( p_this, i_volume/(float)AOUT_VOLUME_DEFAULT );
-@@ -68,7 +68,7 @@ static int vlclua_volume_up( lua_State *
-     playlist_t *p_this = vlclua_get_playlist_internal( L );
-     float volume;
- 
--    playlist_VolumeUp( p_this, luaL_optint( L, 1, 1 ), &volume );
-+    playlist_VolumeUp( p_this, luaL_optinteger( L, 1, 1 ), &volume );
-     lua_pushnumber( L, lroundf(volume * AOUT_VOLUME_DEFAULT) );
-     return 1;
- }
-@@ -78,7 +78,7 @@ static int vlclua_volume_down( lua_State
-     playlist_t *p_this = vlclua_get_playlist_internal( L );
-     float volume;
- 
--    playlist_VolumeDown( p_this, luaL_optint( L, 1, 1 ), &volume );
-+    playlist_VolumeDown( p_this, luaL_optinteger( L, 1, 1 ), &volume );
-     lua_pushnumber( L, lroundf(volume * AOUT_VOLUME_DEFAULT) );
-     return 1;
+--- a/modules/lua/libs/dialog.c
++++ b/modules/lua/libs/dialog.c
+@@ -382,7 +382,7 @@ static int lua_GetDialogUpdate( lua_Stat
+     /* Read entry in the Lua registry */
+     lua_pushlightuserdata( L, (void*) &key_update );
+     lua_gettable( L, LUA_REGISTRYINDEX );
+-    return luaL_checkint( L, -1 );
++    return luaL_checkinteger( L, -1 );
  }
-Index: vlc-2.2.1/modules/lua/libs/win.c
-===================================================================
---- vlc-2.2.1.orig/modules/lua/libs/win.c
-+++ vlc-2.2.1/modules/lua/libs/win.c
-@@ -123,7 +123,7 @@ static int vlclua_console_init( lua_Stat
  
- static int vlclua_console_wait( lua_State *L )
- {
--    int i_timeout = luaL_optint( L, 1, 0 );
-+    int i_timeout = luaL_optinteger( L, 1, 0 );
-     DWORD status = WaitForSingleObject( GetConsole( L ), i_timeout );
-     lua_pushboolean( L, status == WAIT_OBJECT_0 );
-     return 1;
+ /** Manually update a dialog
+@@ -573,22 +573,22 @@ static int vlclua_create_widget_inner( l
+ 
+     /* Set common arguments: col, row, hspan, vspan, width, height */
+     if( lua_isnumber( L, arg ) )
+-        p_widget->i_column = luaL_checkint( L, arg );
++        p_widget->i_column = luaL_checkinteger( L, arg );
+     else goto end_of_args;
+     if( lua_isnumber( L, ++arg ) )
+-        p_widget->i_row = luaL_checkint( L, arg );
++        p_widget->i_row = luaL_checkinteger( L, arg );
+     else goto end_of_args;
+     if( lua_isnumber( L, ++arg ) )
+-        p_widget->i_horiz_span = luaL_checkint( L, arg );
++        p_widget->i_horiz_span = luaL_checkinteger( L, arg );
+     else goto end_of_args;
+     if( lua_isnumber( L, ++arg ) )
+-        p_widget->i_vert_span = luaL_checkint( L, arg );
++        p_widget->i_vert_span = luaL_checkinteger( L, arg );
+     else goto end_of_args;
+     if( lua_isnumber( L, ++arg ) )
+-        p_widget->i_width = luaL_checkint( L, arg );
++        p_widget->i_width = luaL_checkinteger( L, arg );
+     else goto end_of_args;
+     if( lua_isnumber( L, ++arg ) )
+-        p_widget->i_height = luaL_checkint( L, arg );
++        p_widget->i_height = luaL_checkinteger( L, arg );
+     else goto end_of_args;
+ 
+ end_of_args:
+--- a/modules/lua/libs/io.c
++++ b/modules/lua/libs/io.c
+@@ -139,7 +139,7 @@ static int vlclua_io_file_seek( lua_Stat
+     const char* psz_mode = luaL_optstring( L, 2, NULL );
+     if ( psz_mode != NULL )
+     {
+-        long i_offset = luaL_optlong( L, 3, 0 );
++        long i_offset = (long)luaL_optinteger( L, 3, 0 );
+         int i_mode;
+         if ( !strcmp( psz_mode, "set" ) )
+             i_mode = SEEK_SET;
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch
deleted file mode 100644
index cb3ba71dd6..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From 427732a379893491eac27aeadff0e0b3e252d158 Mon Sep 17 00:00:00 2001
-From: Jean-Baptiste Kempf <jb@videolan.org>
-Date: Mon, 31 Aug 2015 08:19:00 +0200
-Subject: [PATCH] Avcodec/swscale: use AV_PIX_FMT consistently
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-(cherry picked from commit faa7bd357b1f9e07a6ffbc451a188773fad7a275)
-Signed-off-by: Rafaël Carré <funman@videolan.org>
-
-Conflicts:
-	modules/codec/avcodec/chroma.c
-	modules/codec/avcodec/video.c
----
- modules/codec/avcodec/chroma.c | 104 ++++++++++++++++++++---------------------
- modules/codec/avcodec/video.c  |  10 ++--
- modules/video_chroma/swscale.c |  28 +++++------
- 3 files changed, 71 insertions(+), 71 deletions(-)
-
-diff --git a/modules/codec/avcodec/chroma.c b/modules/codec/avcodec/chroma.c
-index 393364b..c31f93d 100644
---- a/modules/codec/avcodec/chroma.c
-+++ b/modules/codec/avcodec/chroma.c
-@@ -62,77 +62,77 @@ static const struct
- } chroma_table[] =
- {
-     /* Planar YUV formats */
--    {VLC_CODEC_I444, PIX_FMT_YUV444P, 0, 0, 0 },
--    {VLC_CODEC_J444, PIX_FMT_YUVJ444P, 0, 0, 0 },
--
--    {VLC_CODEC_I440, PIX_FMT_YUV440P, 0, 0, 0 },
--    {VLC_CODEC_J440, PIX_FMT_YUVJ440P, 0, 0, 0 },
--
--    {VLC_CODEC_I422, PIX_FMT_YUV422P, 0, 0, 0 },
--    {VLC_CODEC_J422, PIX_FMT_YUVJ422P, 0, 0, 0 },
--
--    {VLC_CODEC_I420, PIX_FMT_YUV420P, 0, 0, 0 },
--    {VLC_CODEC_YV12, PIX_FMT_YUV420P, 0, 0, 0 },
--    {VLC_FOURCC('I','Y','U','V'), PIX_FMT_YUV420P, 0, 0, 0 },
--    {VLC_CODEC_J420, PIX_FMT_YUVJ420P, 0, 0, 0 },
--    {VLC_CODEC_I411, PIX_FMT_YUV411P, 0, 0, 0 },
--    {VLC_CODEC_I410, PIX_FMT_YUV410P, 0, 0, 0 },
--    {VLC_FOURCC('Y','V','U','9'), PIX_FMT_YUV410P, 0, 0, 0 },
--
--    {VLC_FOURCC('N','V','1','2'), PIX_FMT_NV12, 0, 0, 0 },
--    {VLC_FOURCC('N','V','2','1'), PIX_FMT_NV21, 0, 0, 0 },
--
--    {VLC_CODEC_I420_9L, PIX_FMT_YUV420P9LE, 0, 0, 0 },
--    {VLC_CODEC_I420_9B, PIX_FMT_YUV420P9BE, 0, 0, 0 },
--    {VLC_CODEC_I420_10L, PIX_FMT_YUV420P10LE, 0, 0, 0 },
--    {VLC_CODEC_I420_10B, PIX_FMT_YUV420P10BE, 0, 0, 0 },
-+    {VLC_CODEC_I444, AV_PIX_FMT_YUV444P, 0, 0, 0 },
-+    {VLC_CODEC_J444, AV_PIX_FMT_YUVJ444P, 0, 0, 0 },
-+
-+    {VLC_CODEC_I440, AV_PIX_FMT_YUV440P, 0, 0, 0 },
-+    {VLC_CODEC_J440, AV_PIX_FMT_YUVJ440P, 0, 0, 0 },
-+
-+    {VLC_CODEC_I422, AV_PIX_FMT_YUV422P, 0, 0, 0 },
-+    {VLC_CODEC_J422, AV_PIX_FMT_YUVJ422P, 0, 0, 0 },
-+
-+    {VLC_CODEC_I420, AV_PIX_FMT_YUV420P, 0, 0, 0 },
-+    {VLC_CODEC_YV12, AV_PIX_FMT_YUV420P, 0, 0, 0 },
-+    {VLC_FOURCC('I','Y','U','V'), AV_PIX_FMT_YUV420P, 0, 0, 0 },
-+    {VLC_CODEC_J420, AV_PIX_FMT_YUVJ420P, 0, 0, 0 },
-+    {VLC_CODEC_I411, AV_PIX_FMT_YUV411P, 0, 0, 0 },
-+    {VLC_CODEC_I410, AV_PIX_FMT_YUV410P, 0, 0, 0 },
-+    {VLC_FOURCC('Y','V','U','9'), AV_PIX_FMT_YUV410P, 0, 0, 0 },
-+
-+    {VLC_FOURCC('N','V','1','2'), AV_PIX_FMT_NV12, 0, 0, 0 },
-+    {VLC_FOURCC('N','V','2','1'), AV_PIX_FMT_NV21, 0, 0, 0 },
-+
-+    {VLC_CODEC_I420_9L, AV_PIX_FMT_YUV420P9LE, 0, 0, 0 },
-+    {VLC_CODEC_I420_9B, AV_PIX_FMT_YUV420P9BE, 0, 0, 0 },
-+    {VLC_CODEC_I420_10L, AV_PIX_FMT_YUV420P10LE, 0, 0, 0 },
-+    {VLC_CODEC_I420_10B, AV_PIX_FMT_YUV420P10BE, 0, 0, 0 },
- #if LIBAVUTIL_VERSION_INT >= AV_VERSION_INT(51,13,0)
--    {VLC_CODEC_I422_9L, PIX_FMT_YUV422P9LE, 0, 0, 0 },
--    {VLC_CODEC_I422_9B, PIX_FMT_YUV422P9BE, 0, 0, 0 },
-+    {VLC_CODEC_I422_9L, AV_PIX_FMT_YUV422P9LE, 0, 0, 0 },
-+    {VLC_CODEC_I422_9B, AV_PIX_FMT_YUV422P9BE, 0, 0, 0 },
- #endif
--    {VLC_CODEC_I422_10L, PIX_FMT_YUV422P10LE, 0, 0, 0 },
--    {VLC_CODEC_I422_10B, PIX_FMT_YUV422P10BE, 0, 0, 0 },
-+    {VLC_CODEC_I422_10L, AV_PIX_FMT_YUV422P10LE, 0, 0, 0 },
-+    {VLC_CODEC_I422_10B, AV_PIX_FMT_YUV422P10BE, 0, 0, 0 },
- 
--    {VLC_CODEC_YUV420A, PIX_FMT_YUVA420P, 0, 0, 0 },
-+    {VLC_CODEC_YUV420A, AV_PIX_FMT_YUVA420P, 0, 0, 0 },
- #if LIBAVUTIL_VERSION_CHECK( 51, 45, 0, 74, 100 )
-     {VLC_CODEC_YUV422A, AV_PIX_FMT_YUVA422P, 0, 0, 0 },
- #endif
- 
--    {VLC_CODEC_I444_9L, PIX_FMT_YUV444P9LE, 0, 0, 0 },
--    {VLC_CODEC_I444_9B, PIX_FMT_YUV444P9BE, 0, 0, 0 },
--    {VLC_CODEC_I444_10L, PIX_FMT_YUV444P10LE, 0, 0, 0 },
--    {VLC_CODEC_I444_10B, PIX_FMT_YUV444P10BE, 0, 0, 0 },
--    {VLC_CODEC_I444_16L, PIX_FMT_YUV444P16LE, 0, 0, 0 },
--    {VLC_CODEC_I444_16B, PIX_FMT_YUV444P16BE, 0, 0, 0 },
-+    {VLC_CODEC_I444_9L, AV_PIX_FMT_YUV444P9LE, 0, 0, 0 },
-+    {VLC_CODEC_I444_9B, AV_PIX_FMT_YUV444P9BE, 0, 0, 0 },
-+    {VLC_CODEC_I444_10L, AV_PIX_FMT_YUV444P10LE, 0, 0, 0 },
-+    {VLC_CODEC_I444_10B, AV_PIX_FMT_YUV444P10BE, 0, 0, 0 },
-+    {VLC_CODEC_I444_16L, AV_PIX_FMT_YUV444P16LE, 0, 0, 0 },
-+    {VLC_CODEC_I444_16B, AV_PIX_FMT_YUV444P16BE, 0, 0, 0 },
- 
-     /* Packed YUV formats */
--    {VLC_CODEC_YUYV, PIX_FMT_YUYV422, 0, 0, 0 },
--    {VLC_FOURCC('Y','U','Y','V'), PIX_FMT_YUYV422, 0, 0, 0 },
--    {VLC_CODEC_UYVY, PIX_FMT_UYVY422, 0, 0, 0 },
--    {VLC_FOURCC('Y','4','1','1'), PIX_FMT_UYYVYY411, 0, 0, 0 },
-+    {VLC_CODEC_YUYV, AV_PIX_FMT_YUYV422, 0, 0, 0 },
-+    {VLC_FOURCC('Y','U','Y','V'), AV_PIX_FMT_YUYV422, 0, 0, 0 },
-+    {VLC_CODEC_UYVY, AV_PIX_FMT_UYVY422, 0, 0, 0 },
-+    {VLC_FOURCC('Y','4','1','1'), AV_PIX_FMT_UYYVYY411, 0, 0, 0 },
- 
-     /* Packed RGB formats */
--    VLC_RGB( VLC_FOURCC('R','G','B','4'), PIX_FMT_RGB4, PIX_FMT_BGR4, 0x10, 0x06, 0x01 )
--    VLC_RGB( VLC_FOURCC('R','G','B','8'), PIX_FMT_RGB8, PIX_FMT_BGR8, 0xC0, 0x38, 0x07 )
-+    VLC_RGB( VLC_FOURCC('R','G','B','4'), AV_PIX_FMT_RGB4, AV_PIX_FMT_BGR4, 0x10, 0x06, 0x01 )
-+    VLC_RGB( VLC_FOURCC('R','G','B','8'), AV_PIX_FMT_RGB8, AV_PIX_FMT_BGR8, 0xC0, 0x38, 0x07 )
- 
--    VLC_RGB( VLC_CODEC_RGB15, PIX_FMT_RGB555, PIX_FMT_BGR555, 0x7c00, 0x03e0, 0x001f )
--    VLC_RGB( VLC_CODEC_RGB16, PIX_FMT_RGB565, PIX_FMT_BGR565, 0xf800, 0x07e0, 0x001f )
--    VLC_RGB( VLC_CODEC_RGB24, PIX_FMT_BGR24, PIX_FMT_RGB24, 0xff0000, 0x00ff00, 0x0000ff )
-+    VLC_RGB( VLC_CODEC_RGB15, AV_PIX_FMT_RGB555, AV_PIX_FMT_BGR555, 0x7c00, 0x03e0, 0x001f )
-+    VLC_RGB( VLC_CODEC_RGB16, AV_PIX_FMT_RGB565, AV_PIX_FMT_BGR565, 0xf800, 0x07e0, 0x001f )
-+    VLC_RGB( VLC_CODEC_RGB24, AV_PIX_FMT_BGR24, AV_PIX_FMT_RGB24, 0xff0000, 0x00ff00, 0x0000ff )
- 
--    VLC_RGB( VLC_CODEC_RGB32, PIX_FMT_RGB32, PIX_FMT_BGR32, 0x00ff0000, 0x0000ff00, 0x000000ff )
--    VLC_RGB( VLC_CODEC_RGB32, PIX_FMT_RGB32_1, PIX_FMT_BGR32_1, 0xff000000, 0x00ff0000, 0x0000ff00 )
-+    VLC_RGB( VLC_CODEC_RGB32, AV_PIX_FMT_RGB32, AV_PIX_FMT_BGR32, 0x00ff0000, 0x0000ff00, 0x000000ff )
-+    VLC_RGB( VLC_CODEC_RGB32, AV_PIX_FMT_RGB32_1, AV_PIX_FMT_BGR32_1, 0xff000000, 0x00ff0000, 0x0000ff00 )
- 
- #ifdef AV_PIX_FMT_0BGR32
-     VLC_RGB( VLC_CODEC_RGB32, AV_PIX_FMT_0BGR32, AV_PIX_FMT_0RGB32, 0x000000ff, 0x0000ff00, 0x00ff0000 )
- #endif
- 
--    {VLC_CODEC_RGBA, PIX_FMT_RGBA, 0, 0, 0 },
--    {VLC_CODEC_ARGB, PIX_FMT_ARGB, 0, 0, 0 },
--    {VLC_CODEC_BGRA, PIX_FMT_BGRA, 0, 0, 0 },
--    {VLC_CODEC_GREY, PIX_FMT_GRAY8, 0, 0, 0},
-+    {VLC_CODEC_RGBA, AV_PIX_FMT_RGBA, 0, 0, 0 },
-+    {VLC_CODEC_ARGB, AV_PIX_FMT_ARGB, 0, 0, 0 },
-+    {VLC_CODEC_BGRA, AV_PIX_FMT_BGRA, 0, 0, 0 },
-+    {VLC_CODEC_GREY, AV_PIX_FMT_GRAY8, 0, 0, 0},
- 
-      /* Paletized RGB */
--    {VLC_CODEC_RGBP, PIX_FMT_PAL8, 0, 0, 0},
-+    {VLC_CODEC_RGBP, AV_PIX_FMT_PAL8, 0, 0, 0},
- 
- #if LIBAVUTIL_VERSION_CHECK(51, 42, 0, 74,100)
-     {VLC_CODEC_GBR_PLANAR, AV_PIX_FMT_GBRP, 0, 0, 0 },
-@@ -201,5 +201,5 @@ int FindFfmpegChroma( vlc_fourcc_t fourcc )
-     for( int i = 0; chroma_table[i].i_chroma != 0; i++ )
-         if( chroma_table[i].i_chroma == fourcc )
-             return chroma_table[i].i_chroma_id;
--    return PIX_FMT_NONE;
-+    return AV_PIX_FMT_NONE;
- }
-diff --git a/modules/codec/avcodec/video.c b/modules/codec/avcodec/video.c
-index c115db9..ae600e8 100644
---- a/modules/codec/avcodec/video.c
-+++ b/modules/codec/avcodec/video.c
-@@ -1004,7 +1004,7 @@ static picture_t *lavc_dr_GetFrame(struct AVCodecContext *ctx,
-     if (GetVlcChroma(&dec->fmt_out.video, ctx->pix_fmt) != VLC_SUCCESS)
-         return NULL;
-     dec->fmt_out.i_codec = dec->fmt_out.video.i_chroma;
--    if (ctx->pix_fmt == PIX_FMT_PAL8)
-+    if (ctx->pix_fmt == AV_PIX_FMT_PAL8)
-         return NULL;
- 
-     int width = frame->width;
-@@ -1180,7 +1180,7 @@ static picture_t *ffmpeg_dr_GetFrameBuf(struct AVCodecContext *p_context)
-     if (GetVlcChroma(&p_dec->fmt_out.video, p_context->pix_fmt) != VLC_SUCCESS)
-         goto no_dr;
- 
--    if (p_context->pix_fmt == PIX_FMT_PAL8)
-+    if (p_context->pix_fmt == AV_PIX_FMT_PAL8)
-         goto no_dr;
- 
-     p_dec->fmt_out.i_codec = p_dec->fmt_out.video.i_chroma;
-@@ -1215,7 +1215,7 @@ static picture_t *ffmpeg_dr_GetFrameBuf(struct AVCodecContext *p_context)
-             goto no_dr;
-     }
- 
--    if( p_context->pix_fmt == PIX_FMT_YUV422P )
-+    if( p_context->pix_fmt == AV_PIX_FMT_YUV422P )
-     {
-         if( 2 * p_pic->p[1].i_pitch != p_pic->p[0].i_pitch ||
-             2 * p_pic->p[2].i_pitch != p_pic->p[0].i_pitch )
-@@ -1325,7 +1325,7 @@ static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
- 
-     /* Enumerate available formats */
-     bool can_hwaccel = false;
--    for( size_t i = 0; pi_fmt[i] != PIX_FMT_NONE; i++ )
-+    for( size_t i = 0; pi_fmt[i] != AV_PIX_FMT_NONE; i++ )
-     {
-         const AVPixFmtDescriptor *dsc = av_pix_fmt_desc_get(pi_fmt[i]);
-         if (dsc == NULL)
-@@ -1352,7 +1352,7 @@ static enum PixelFormat ffmpeg_GetFormat( AVCodecContext *p_context,
-     if( p_va == NULL )
-         goto end;
- 
--    for( size_t i = 0; pi_fmt[i] != PIX_FMT_NONE; i++ )
-+    for( size_t i = 0; pi_fmt[i] != AV_PIX_FMT_NONE; i++ )
-     {
-         if( p_va->pix_fmt != pi_fmt[i] )
-             continue;
-diff --git a/modules/video_chroma/swscale.c b/modules/video_chroma/swscale.c
-index 569e0f5..4e0ecf1 100644
---- a/modules/video_chroma/swscale.c
-+++ b/modules/video_chroma/swscale.c
-@@ -257,35 +257,35 @@ static void FixParameters( int *pi_fmt, bool *pb_has_a, bool *pb_swap_uv, vlc_fo
-     switch( fmt )
-     {
-     case VLC_CODEC_YUV422A:
--        *pi_fmt = PIX_FMT_YUV422P;
-+        *pi_fmt = AV_PIX_FMT_YUV422P;
-         *pb_has_a = true;
-         break;
-     case VLC_CODEC_YUV420A:
--        *pi_fmt = PIX_FMT_YUV420P;
-+        *pi_fmt = AV_PIX_FMT_YUV420P;
-         *pb_has_a = true;
-         break;
-     case VLC_CODEC_YUVA:
--        *pi_fmt = PIX_FMT_YUV444P;
-+        *pi_fmt = AV_PIX_FMT_YUV444P;
-         *pb_has_a = true;
-         break;
-     case VLC_CODEC_RGBA:
--        *pi_fmt = PIX_FMT_BGR32;
-+        *pi_fmt = AV_PIX_FMT_BGR32;
-         *pb_has_a = true;
-         break;
-     case VLC_CODEC_ARGB:
--        *pi_fmt = PIX_FMT_BGR32_1;
-+        *pi_fmt = AV_PIX_FMT_BGR32_1;
-         *pb_has_a = true;
-         break;
-     case VLC_CODEC_BGRA:
--        *pi_fmt = PIX_FMT_RGB32;
-+        *pi_fmt = AV_PIX_FMT_RGB32;
-         *pb_has_a = true;
-         break;
-     case VLC_CODEC_YV12:
--        *pi_fmt = PIX_FMT_YUV420P;
-+        *pi_fmt = AV_PIX_FMT_YUV420P;
-         *pb_swap_uv = true;
-         break;
-     case VLC_CODEC_YV9:
--        *pi_fmt = PIX_FMT_YUV410P;
-+        *pi_fmt = AV_PIX_FMT_YUV410P;
-         *pb_swap_uv = true;
-         break;
-     default:
-@@ -314,7 +314,7 @@ static int GetParameters( ScalerConfiguration *p_cfg,
-     {
-         if( p_fmti->i_chroma == VLC_CODEC_YUVP && ALLOW_YUVP )
-         {
--            i_fmti = i_fmto = PIX_FMT_GRAY8;
-+            i_fmti = i_fmto = AV_PIX_FMT_GRAY8;
-             i_sws_flags = SWS_POINT;
-         }
-     }
-@@ -327,9 +327,9 @@ static int GetParameters( ScalerConfiguration *p_cfg,
-      * Without SWS_ACCURATE_RND the quality is really bad for some conversions */
-     switch( i_fmto )
-     {
--    case PIX_FMT_ARGB:
--    case PIX_FMT_RGBA:
--    case PIX_FMT_ABGR:
-+    case AV_PIX_FMT_ARGB:
-+    case AV_PIX_FMT_RGBA:
-+    case AV_PIX_FMT_ABGR:
-         i_sws_flags |= SWS_ACCURATE_RND;
-         break;
-     }
-@@ -403,8 +403,8 @@ static int Init( filter_t *p_filter )
-     const unsigned i_fmto_visible_width = p_fmto->i_visible_width * p_sys->i_extend_factor;
-     for( int n = 0; n < (cfg.b_has_a ? 2 : 1); n++ )
-     {
--        const int i_fmti = n == 0 ? cfg.i_fmti : PIX_FMT_GRAY8;
--        const int i_fmto = n == 0 ? cfg.i_fmto : PIX_FMT_GRAY8;
-+        const int i_fmti = n == 0 ? cfg.i_fmti : AV_PIX_FMT_GRAY8;
-+        const int i_fmto = n == 0 ? cfg.i_fmto : AV_PIX_FMT_GRAY8;
-         struct SwsContext *ctx;
- 
-         ctx = sws_getContext( i_fmti_visible_width, p_fmti->i_visible_height, i_fmti,
--- 
-2.5.0
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch
deleted file mode 100644
index 56744e7de8..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0010-SWSCALE-fix-compilation-with-4.x.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6fa8a4a9bb64ff34328aae46acd600f8502b2c05 Mon Sep 17 00:00:00 2001
-From: Jean-Baptiste Kempf <jb@videolan.org>
-Date: Mon, 31 Aug 2015 09:07:39 +0200
-Subject: [PATCH] SWSCALE: fix compilation with 4.x
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-(cherry picked from commit 2b23857c68622edda76b72b74aeb3d943ee277c9)
-Signed-off-by: Rafaël Carré <funman@videolan.org>
----
- modules/video_chroma/swscale.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/modules/video_chroma/swscale.c b/modules/video_chroma/swscale.c
-index 4e0ecf1..26d0d6f 100644
---- a/modules/video_chroma/swscale.c
-+++ b/modules/video_chroma/swscale.c
-@@ -36,6 +36,7 @@
- #include <vlc_cpu.h>
- 
- #include <libswscale/swscale.h>
-+#include <libswscale/version.h>
- 
- #ifdef __APPLE__
- # include <TargetConditionals.h>
-@@ -235,6 +236,7 @@ static int GetSwsCpuMask(void)
- {
-     int i_sws_cpu = 0;
- 
-+#if LIBSWSCALE_VERSION_MAJOR < 4
- #if defined(__i386__) || defined(__x86_64__)
-     if( vlc_CPU_MMX() )
-         i_sws_cpu |= SWS_CPU_CAPS_MMX;
-@@ -248,6 +250,7 @@ static int GetSwsCpuMask(void)
-     if( vlc_CPU_ALTIVEC() )
-         i_sws_cpu |= SWS_CPU_CAPS_ALTIVEC;
- #endif
-+#endif
- 
-     return i_sws_cpu;
- }
--- 
-2.5.0
-
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
deleted file mode 100644
index b5be04cb91..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require ${BPN}.inc
-
-# work around build failure
-EXTRA_OECONF += " --enable-libxml2=no"
-
-SRC_URI += "file://0001-enable-subdir-objects.patch \
-            file://0002-glibc-does-not-provide-strlcpy.patch \
-            file://0003-use-am-path-libgcrypt.patch \
-            file://0004-modules-gui-qt4-out-of-tree-build.patch \
-            file://0005-libpostproc-header-check.patch \
-            file://0006-make-opencv-configurable.patch \
-            file://0007-use-vorbisidec.patch \
-            file://0008-fix-luaL-checkint.patch \
-            file://0009-Avcodec-swscale-use-AV_PIX_FMT-consistently.patch \
-            file://0010-SWSCALE-fix-compilation-with-4.x.patch \
-"
-
-SRC_URI[md5sum] = "f98d60f0f59ef72b6e3407f2ff09bda6"
-SRC_URI[sha256sum] = "9ad23128be16f9b40ed772961272cb0748ed8e4aa1bc79c129e589feebea5fb5"
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
new file mode 100644
index 0000000000..95b6779fde
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.6.bb
@@ -0,0 +1,14 @@
+require ${BPN}.inc
+
+# work around build failure
+EXTRA_OECONF += " --enable-libxml2=no"
+
+SRC_URI += " \
+            file://0002-glibc-does-not-provide-strlcpy.patch \
+            file://0005-libpostproc-header-check.patch \
+            file://0006-make-opencv-configurable.patch \
+            file://0007-use-vorbisidec.patch \
+            file://0008-fix-luaL-checkint.patch \
+"
+SRC_URI[md5sum] = "4ff71d262e070fd19f86a1c3542c7b4e"
+SRC_URI[sha256sum] = "18c16d4be0f34861d0aa51fbd274fb87f0cab3b7119757ead93f3db3a1f27ed3"
-- 
2.21.0


