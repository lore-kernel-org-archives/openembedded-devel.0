Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.2200.1587001600427031294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 18:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ceJGDXV6;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b7so660948pju.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 18:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EBStl9Zu61u4Oh9p7qnn2tBkLPuHcxjt7VlKEHf8mF4=;
        b=ceJGDXV6GhDjM4JUGekp+nkD2Ud6dhUuOuMcHBADZuEdt++pDG1Na+cr+x1e1mMVuV
         xUnTvJLgC6V56RFEdjSSy31uQgmpn4UfsrwNx2BFw1GMoqmWFuVHWkZPpFLjaav9AK86
         D3RwDxDpVqbms/9kBFwfKAzVoDlTRg7DM4gSpJ0BPmDbBCIj8t07PTzA93220XjWmxc4
         U9f7p6YWmjxmkey4GbWz+tvokg6AumJvjXxcwjIfVPklL4v0/xwblphzAMWt4RjCVjFZ
         WmdFM0wVoi9/k5bhh4bBBFARhJmyPAhIgvR3yIn3oP9sOukd+CWYksgC1v46pcQeb3nI
         eq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EBStl9Zu61u4Oh9p7qnn2tBkLPuHcxjt7VlKEHf8mF4=;
        b=VWb1M2i2Gkx5OY/GgYD8dwIw1DfmI1qQdEpi5LOHkbDQLwl3WwGrkR46RQ3txOUL4u
         nSWxyu7sHdRpAuVwRfh8yfut2UYIMm3KMuXZLorMDznWL2MVHG1Nnk8PoSiiae4EHaow
         FhTtjJWdVVqfub1LID9zUT+WiRPZ3aIlnwvf6RO6MaiMYeH2gv1l46qUBZXKOTCYLeT7
         iEGKIUYXxH5Mz+pAIM6PZe+M9/OdFjdNmMiG+rNXLQ+SRLYzt6qA1P9z8TRle+na/Xha
         tRwxXBN4Tzv15y5qZGI/oxAr5JgrHLyoitBfclFNv3VqVE5RjJoyv/MQWiMc5t16dVoZ
         pmDA==
X-Gm-Message-State: AGi0Puabn48MIWlaqOs1FUlkWmX6nTsQDKngzw78Igq7ubgMqraPuKJJ
	Cb5Ex7JWuguhJX6nxsjywqG16KYH4No=
X-Google-Smtp-Source: APiQypK5y7OsThC/h88B7xPhpBQFv68lwL1Q3Il09UXk3/WPJV6cXVHGyhcQSWN03pCwtjUGVzs5VA==
X-Received: by 2002:a17:902:8bc3:: with SMTP id r3mr7741188plo.220.1587001599144;
        Wed, 15 Apr 2020 18:46:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id m2sm838347pjl.21.2020.04.15.18.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 18:46:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] vlc: Use pkgconfig to find userland graphics libs
Date: Wed, 15 Apr 2020 18:46:36 -0700
Message-Id: <20200416014636.1738216-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add mmal, x264, fluidsynth as packageconfigs so it can be easily
enabled/disabled by users

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...packageconfig-to-detect-mmal-support.patch | 61 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.9.2.bb     |  9 ++-
 2 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
new file mode 100644
index 0000000000..424aaa2815
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-Use-packageconfig-to-detect-mmal-support.patch
@@ -0,0 +1,61 @@
+From e8716a7755eef93e1033bb913e1eb4faee54658f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Apr 2020 18:29:26 -0700
+Subject: [PATCH] Use packageconfig to detect mmal support
+
+This needs userland graphics libraries, because distros may install it
+in different locations, therefore its best to rely on pkgconf to find
+the libs and header locations instead of assuming /opt/vc which might
+work on some distros ( like raspbian ) but not everywhere
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d7cf692..f81b99d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3427,27 +3427,18 @@ AC_ARG_ENABLE(mmal,
+   AS_HELP_STRING([--enable-mmal],
+     [Multi-Media Abstraction Layer (MMAL) hardware plugin (default enable)]))
+ if test "${enable_mmal}" != "no"; then
+-  VLC_SAVE_FLAGS
+-  LDFLAGS="${LDFLAGS} -L/opt/vc/lib -lvchostif"
+-  CPPFLAGS="${CPPFLAGS} -isystem /opt/vc/include -isystem /opt/vc/include/interface/vcos/pthreads -isystem /opt/vc/include/interface/vmcs_host/linux"
+-  AC_CHECK_HEADERS(interface/mmal/mmal.h,
+-    [ AC_CHECK_LIB(bcm_host, vc_tv_unregister_callback_full, [
+-        have_mmal="yes"
+-        VLC_ADD_PLUGIN([mmal])
+-        VLC_ADD_LDFLAGS([mmal],[ -L/opt/vc/lib ])
+-        VLC_ADD_CFLAGS([mmal],[ -isystem /opt/vc/include -isystem /opt/vc/include/interface/vcos/pthreads -isystem /opt/vc/include/interface/vmcs_host/linux ])
+-        VLC_ADD_LIBS([mmal],[ -lbcm_host -lmmal -lmmal_core -lmmal_components -lmmal_util -lvchostif ]) ], [
+-          AS_IF([test "${enable_mmal}" = "yes"],
+-            [ AC_MSG_ERROR([Cannot find bcm library...]) ],
+-            [ AC_MSG_WARN([Cannot find bcm library...]) ])
+-          ],
+-        [])
+-    ] , [ AS_IF([test "${enable_mmal}" = "yes"],
+-      [ AC_MSG_ERROR([Cannot find development headers for mmal...]) ],
+-      [ AC_MSG_WARN([Cannot find development headers for mmal...]) ]) ])
+-  VLC_RESTORE_FLAGS
++      PKG_CHECK_MODULES(BCMHOST, [bcm_host], [
++      HAVE_BCMHOST=yes
++      AC_DEFINE(HAVE_BCMHOST, 1, [Define this if you have have userlang graphics installed])
++      VLC_ADD_LIBS([bcmhost],[$BCMHOST_LIBS])
++      VLC_ADD_CFLAGS([bcmhost],[$BCMHOST_CFLAGS])
++      ],:
++      [AC_MSG_WARN([${BCMHOST_PKG_ERRORS}: userland graphics not available.])
++      HAVE_BCMHOST=no])
++
++      AC_CHECK_HEADERS(interface/mmal/mmal.h)
+ fi
+-AM_CONDITIONAL([HAVE_MMAL], [test "${have_mmal}" = "yes"])
++AM_CONDITIONAL([HAVE_MMAL], [test "${have_bcmhost}" = "yes"])
+ 
+ dnl
+ dnl evas plugin
+-- 
+2.26.1
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
index 556e79c7e6..35fda3f8b0 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
    dbus libxml2 gnutls \
-   tremor faad2 ffmpeg flac fluidsynth alsa-lib \
+   tremor faad2 ffmpeg flac alsa-lib \
    lua-native lua libidn \
    avahi jpeg xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
@@ -22,6 +22,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
            file://0006-make-opencv-configurable.patch \
            file://0007-use-vorbisidec.patch \
            file://0008-fix-luaL-checkint.patch \
+           file://0001-Use-packageconfig-to-detect-mmal-support.patch \
 "
 SRC_URI[sha256sum] = "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
 
@@ -29,7 +30,6 @@ inherit autotools features_check gettext pkgconfig features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-ARM_INSTRUCTION_SET = "arm"
 export BUILDCC = "${BUILD_CC}"
 EXTRA_OECONF = "\
     --enable-run-as-root \
@@ -51,12 +51,15 @@ EXTRA_OECONF = "\
 "
 
 PACKAGECONFIG ?= " \
-    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
+    live555 dc1394 dv1394 notify fontconfig fluidsynth freetype dvdread png \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
 
+PACKAGECONFIG[mmal] = "        --enable-omxil --enable-omxil-vout --enable-rpi-omxil --enable-mmal,,userland"
+PACKAGECONFIG[x264] = "--enable-x264,--disable-x264,x264"
+PACKAGECONFIG[fluidsynth] = ",,fluidsynth"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-- 
2.26.1

