Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.2944.1622092055365896261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 22:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qbQGWv9W;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id u7so1747073plq.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 22:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qnunv/J/zbxMxq16a1PgiaPzFqTWzGcHhWO5Pw71ArY=;
        b=qbQGWv9WQoIUvBA1j5zPNsK1HSvRi96K/kIYGHfzANHQtsQbaYYNpDQXD9AJRny7sG
         YEfLEJSorcNVjzmern9zOvzH1iEE5RTkx6Fm7ZNXyGM9jd8cv4FVS2jWTp3rUUjTQWXf
         36LypSQ5Dud6IEFpqSwxgGOdJY+WIg2CWQ8AJZlRkkufnhWd3YZLMjDqX7qjcdJXv2hd
         CVvt2CnD7T5QDwv1mxlNidnwqTLr0VJKfxw/ebmWrf4OOZwpNfH9/UxnuVcWKeLVHO3q
         ABiTxYGqK69HJth/J6eRbBM8l0sWxAALqZAC9+HENNjFsQdsCGgQvRak7YU0MfBrzZ9R
         zlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qnunv/J/zbxMxq16a1PgiaPzFqTWzGcHhWO5Pw71ArY=;
        b=XXiwzJjteeiFrjjmrlLZgpIFy2jl8oFytGcTX+OVExyYI0fyChjbXoOxJwsB53HrpB
         2G6byDGVTkXav/c80gSLtx8WgqDTi/87isdjKaKK92xWASIG3Jq5nijyPvPs7lMqFO92
         Ow6G0sfM8m9TjIYdbUEITjEpWoMb2LidXaYsGd04hK5d5n0cXzDxG4Iol1JHLLjNlnx+
         aIQVisDG8+iK2GwKEg+gP/INBvoEX1ZcFT/qggjsC5v3Ke9leArkL4bL8dzFGnN8kIP0
         DjlKeUE9xvXfLZ97ynNOUTCBImk7ZBIP3TkTrPuLuNwLoxkhXzhpdcr7gh9dLbZYSjvz
         LkzA==
X-Gm-Message-State: AOAM533ML607qG/uFuiOkaRUHKahKb4n7YvpXxdxD9HnQDVr0PYAOa81
	+09VcdTDSVJJEmumD/PHqtQIg7p329MeDw==
X-Google-Smtp-Source: ABdhPJyCuF+5Jyn/w5Wi0eWC+DNY2zHC2glLelEhqfV/1PqyMPBHGI3nn6S4Jvpn1ZODDNcbZ52NJA==
X-Received: by 2002:a17:90a:aa12:: with SMTP id k18mr7554926pjq.232.1622092054347;
        Wed, 26 May 2021 22:07:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id r5sm794933pjd.2.2021.05.26.22.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 22:07:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] projucer: Update to latest master tip
Date: Wed, 26 May 2021 22:07:31 -0700
Message-Id: <20210527050731.1401478-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Drop patch which no longer is needed as it has been fixed differently
upstream

License-Update: Updated to reflect JUCE 6 Terms [1]

[1] https://github.com/juce-framework/JUCE/commit/de6ecc57f84294e82a608bcc6=
d0f5d11645f15e3#diff-4673a3aba01813b595de187a7a6e9e63a3491d55821606fecd9f13=
a10c188a1d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/juce/projucer.inc      |  7 +-
 .../0001-Disable-webkit-component.patch       | 83 -------------------
 ...Check-for-googletest-on-system-first.patch | 41 +++++++++
 3 files changed, 44 insertions(+), 87 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/juce/projucer/0001-D=
isable-webkit-component.patch
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-tes=
t-Check-for-googletest-on-system-first.patch

diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-mu=
ltimedia/recipes-multimedia/juce/projucer.inc
index ab0f23879f..9f03cbd80f 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -4,7 +4,7 @@ JUCE supported platforms, including Linux and Embedded Linu=
x."
 SECTION =3D "utils"
 HOMEPAGE =3D "http://juce.com/"
 LICENSE =3D "GPLv3"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da20f91622a47d4e4af9340d5d3f1=
a2d8"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D12e9c2db7897c0349a4cc1c6d2a8=
c5d5"
=20
 inherit pkgconfig features_check
=20
@@ -13,14 +13,13 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
 DEPENDS =3D "libx11 libxext libxinerama libxrandr libxcursor freetype alsa=
-lib curl bzip2 libpng harfbuzz glib-2.0 libpcre"
 DEPENDS_append_libc-musl =3D " libexecinfo"
=20
-SRCREV =3D "724ae27c71ef809b836df06713cf9e50bc14162b"
+SRCREV =3D "90e8da0cfb54ac593cdbed74c3d0c9b09bad3a9f"
 BRANCH =3D "master"
 SRC_URI =3D "git://github.com/WeAreROLI/JUCE.git;protocol=3Dhttps;branch=
=3D${BRANCH} \
-           file://0001-Disable-webkit-component.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-PV =3D "5.4.5"
+PV =3D "6.0.8"
=20
 JUCE_PROJUCER_BUILD_PATH =3D "${B}/extras/Projucer/Builds"
 JUCE_PROJUCER_MAKEFILE_PATH =3D "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer/0001-Disable-=
webkit-component.patch b/meta-multimedia/recipes-multimedia/juce/projucer/0=
001-Disable-webkit-component.patch
deleted file mode 100644
index 3728439c71..0000000000
--- a/meta-multimedia/recipes-multimedia/juce/projucer/0001-Disable-webkit-=
component.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From df7190f430f30ee522f56f9714d42ee796f0d5ff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Dec 2019 22:18:41 -0800
-Subject: [PATCH] Disable webkit component
-
-It asks for enable JUCER_ENABLE_GPL_MODE
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- extras/Projucer/Builds/LinuxMakefile/Makefile | 10 +++++-----
- extras/Projucer/JuceLibraryCode/AppConfig.h   |  4 ++--
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/extras/Projucer/Builds/LinuxMakefile/Makefile b/extras/Projuc=
er/Builds/LinuxMakefile/Makefile
-index 25b490460..8960f5bc6 100644
---- a/extras/Projucer/Builds/LinuxMakefile/Makefile
-+++ b/extras/Projucer/Builds/LinuxMakefile/Makefile
-@@ -35,13 +35,13 @@ ifeq ($(CONFIG),Debug)
-     TARGET_ARCH :=3D -march=3Dnative
-   endif
-=20
--  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DDEBUG=3D1 -D_DEBUG=3D1 -DJ=
UCER_LINUX_MAKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_=
HEX=3D0x50405 $(shell pkg-config --cflags x11 xinerama xext freetype2 webki=
t2gtk-4.0 gtk+-x11-3.0) -pthread -I../../JuceLibraryCode -I../../../../modu=
les $(CPPFLAGS)
-+  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DDEBUG=3D1 -D_DEBUG=3D1 -DJ=
UCER_LINUX_MAKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_=
HEX=3D0x50405 $(shell pkg-config --cflags x11 xinerama xext freetype2) -pth=
read -I../../JuceLibraryCode -I../../../../modules $(CPPFLAGS)
-   JUCE_CPPFLAGS_APP :=3D -DJucePlugin_Build_VST=3D0 -DJucePlugin_Build_VS=
T3=3D0 -DJucePlugin_Build_AU=3D0 -DJucePlugin_Build_AUv3=3D0 -DJucePlugin_B=
uild_RTAS=3D0 -DJucePlugin_Build_AAX=3D0 -DJucePlugin_Build_Standalone=3D0 =
-DJucePlugin_Build_Unity=3D0
-   JUCE_TARGET_APP :=3D Projucer
-=20
-   JUCE_CFLAGS +=3D $(JUCE_CPPFLAGS) $(TARGET_ARCH) -g -ggdb -O0 $(CFLAGS)
-   JUCE_CXXFLAGS +=3D $(JUCE_CFLAGS) -std=3Dc++11 $(CXXFLAGS)
--  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2 webkit2gtk-4.0 gtk+-x11-3=
.0) -lrt -ldl -lpthread $(LDFLAGS)
-+  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2) -lrt -ldl -lpthread $(LD=
FLAGS)
-=20
-   CLEANCMD =3D rm -rf $(JUCE_OUTDIR)/$(TARGET) $(JUCE_OBJDIR)
- endif
-@@ -56,13 +56,13 @@ ifeq ($(CONFIG),Release)
-     TARGET_ARCH :=3D -march=3Dnative
-   endif
-=20
--  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DNDEBUG=3D1 -DJUCER_LINUX_M=
AKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_HEX=3D0x5040=
5 $(shell pkg-config --cflags x11 xinerama xext freetype2 webkit2gtk-4.0 gt=
k+-x11-3.0) -pthread -I../../JuceLibraryCode -I../../../../modules $(CPPFLA=
GS)
-+  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DNDEBUG=3D1 -DJUCER_LINUX_M=
AKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_HEX=3D0x5040=
5 $(shell pkg-config --cflags x11 xinerama xext freetype2) -pthread -I../..=
/JuceLibraryCode -I../../../../modules $(CPPFLAGS)
-   JUCE_CPPFLAGS_APP :=3D -DJucePlugin_Build_VST=3D0 -DJucePlugin_Build_VS=
T3=3D0 -DJucePlugin_Build_AU=3D0 -DJucePlugin_Build_AUv3=3D0 -DJucePlugin_B=
uild_RTAS=3D0 -DJucePlugin_Build_AAX=3D0 -DJucePlugin_Build_Standalone=3D0 =
-DJucePlugin_Build_Unity=3D0
-   JUCE_TARGET_APP :=3D Projucer
-=20
-   JUCE_CFLAGS +=3D $(JUCE_CPPFLAGS) $(TARGET_ARCH) -O3 $(CFLAGS)
-   JUCE_CXXFLAGS +=3D $(JUCE_CFLAGS) -std=3Dc++11 $(CXXFLAGS)
--  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2 webkit2gtk-4.0 gtk+-x11-3=
.0) -fvisibility=3Dhidden -lrt -ldl -lpthread $(LDFLAGS)
-+  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2) -fvisibility=3Dhidden -l=
rt -ldl -lpthread $(LDFLAGS)
-=20
-   CLEANCMD =3D rm -rf $(JUCE_OUTDIR)/$(TARGET) $(JUCE_OBJDIR)
- endif
-@@ -136,7 +136,7 @@ all : $(JUCE_OUTDIR)/$(JUCE_TARGET_APP)
-=20
- $(JUCE_OUTDIR)/$(JUCE_TARGET_APP) : $(OBJECTS_APP) $(RESOURCES)
- 	@command -v pkg-config >/dev/null 2>&1 || { echo >&2 "pkg-config not ins=
talled. Please, install it."; exit 1; }
--	@pkg-config --print-errors x11 xinerama xext freetype2 webkit2gtk-4.0 gt=
k+-x11-3.0
-+	@pkg-config --print-errors x11 xinerama xext freetype2
- 	@echo Linking "Projucer - App"
- 	-$(V_AT)mkdir -p $(JUCE_BINDIR)
- 	-$(V_AT)mkdir -p $(JUCE_LIBDIR)
-diff --git a/extras/Projucer/JuceLibraryCode/AppConfig.h b/extras/Projucer=
/JuceLibraryCode/AppConfig.h
-index dffd5af75..53302bd24 100644
---- a/extras/Projucer/JuceLibraryCode/AppConfig.h
-+++ b/extras/Projucer/JuceLibraryCode/AppConfig.h
-@@ -32,7 +32,7 @@
- // BEGIN SECTION A=0D
- =0D
- #ifndef JUCER_ENABLE_GPL_MODE=0D
-- #define JUCER_ENABLE_GPL_MODE 0=0D
-+ #define JUCER_ENABLE_GPL_MODE 1=0D
- #endif=0D
- =0D
- // END SECTION A=0D
-@@ -180,7 +180,7 @@
- // juce_gui_extra flags:=0D
- =0D
- #ifndef    JUCE_WEB_BROWSER=0D
-- //#define JUCE_WEB_BROWSER 1=0D
-+ #define JUCE_WEB_BROWSER 0=0D
- #endif=0D
- =0D
- #ifndef    JUCE_ENABLE_LIVE_CONSTANT_EDITOR=0D
---=20
-2.24.0
-
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-test-Check=
-for-googletest-on-system-first.patch b/meta-oe/recipes-core/sdbus-c++/sdbu=
s-c++-0.8.3/0001-test-Check-for-googletest-on-system-first.patch
new file mode 100644
index 0000000000..8a6aceac87
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-test-Check-for-go=
ogletest-on-system-first.patch
@@ -0,0 +1,41 @@
+From dc5fa7a4b342ef80cda533cdb821841d8183287c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 May 2021 09:01:09 -0700
+Subject: [PATCH] test: Check for googletest on system first
+
+This ensures if googletest is instslled already then use that version
+before downloading and building own copy
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 97f7c1a..3dfdd1c 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -2,6 +2,10 @@
+ # DOWNLOAD AND BUILD OF GOOGLETEST
+ #-------------------------------
+=20
++find_package(GTest)
++
++if(NOT GTest_FOUND)
++
+ include(FetchContent)
+=20
+ message("Fetching googletest...")
+@@ -23,7 +27,7 @@ if(NOT googletest_POPULATED)
+     add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
+     set(BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS_BAK})
+ endif()
+-
++endif()
+ #-------------------------------
+ # SOURCE FILES CONFIGURATION
+ #-------------------------------
+--=20
+2.31.1
+
--=20
2.31.1

