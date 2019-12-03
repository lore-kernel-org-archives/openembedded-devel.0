Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1A5A17D27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 17:31:20 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id n96so1796214pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2019 09:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AUtk5G9ddq3io0cPoZMwxidvJbIaTA4XJHX85q3s4Ps=;
	b=pVB0IOwaQO4dLFrXopD79dfhzBMqM9HfQv60Jol7j+U+GplHh7b27Ai5eyG6EqBsEe
	xBh0KBesegmMuzD6JLvKhfiNYicv4XssJFYRIwJ3FHG13Ln1RtcoCnZwcHjYBFhKbtp4
	+QGOzHU2LDY5CAGb1Hf7vik3nrEBJPzvrJB5/LB/AX+XpLzxDm3NMTeu4RKmy6wI18Ur
	SUh89OAjxKMB/CQduxy8ycssmjPL45ma4/2GH65LU+y+MDaEZhSt19jJJRc8zkvqZPFh
	9wHjrI/mMUom5MMwgDRu7RwwJuqTktAqycNdVvbbRQ9sKtdM7gTd15WUiqSz51kHvRTD
	27+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AUtk5G9ddq3io0cPoZMwxidvJbIaTA4XJHX85q3s4Ps=;
	b=LRJyjSy3t6PoU/UxhxS/DGsqToutKZJdR9npAx8WqxXPer5b1hkH8FDkCFyb2inF5c
	H70A2HsoW5oFvSgu4RpJkmsGHjRuYoxl1+1i8iBzqRn6nG2vB9MP0gjBwys9zwqa5q1r
	PzuvdvzKVTvGLgO4G558j9l3H4ugdIfD++Qerbi3dBP6H4J+gqTXyBChAcpBAJfwhciy
	0mO5K3ofQYNWUqdTaPk3q4Qh3n5q37aCOEVl9s8lANZhs5hhKF242YKjVsb/P0AF6bNt
	8cxQGsaOiYdvHkrmFS/gJSNYU+WAgMues78oNqmA04tnmj8mzJ+dvn+KZLDM9RUsgpg7
	3OqQ==
X-Gm-Message-State: APjAAAXPXSqCwZ53kMfZQLHLEUhmHOGgybezUORxc5GtjFy4Y2OGrWRn
	PQz6TZ+CSh/SSk2u/ctRLWi3Em4K8LE=
X-Google-Smtp-Source: APXvYqw8magsD29Ny4c/Maa3XFE5oY654Cq2Vh1tyugw9DxjvH/oqcvEw/4Qapp7prUuwYi1gbeCxw==
X-Received: by 2002:a17:90a:380d:: with SMTP id
	w13mr6663309pjb.133.1575394281311; 
	Tue, 03 Dec 2019 09:31:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::2797])
	by smtp.gmail.com with ESMTPSA id k4sm4229507pfa.25.2019.12.03.09.31.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 09:31:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Dec 2019 09:31:07 -0800
Message-Id: <20191203173108.87041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/2] projucer: Upgrade to 5.4.5
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
X-List-Received-Date: Tue, 03 Dec 2019 17:31:21 -0000
Content-Transfer-Encoding: quoted-printable

License-Update: https://github.com/WeAreROLI/JUCE/commit/d9dee4d87332bf9e3d=
12da2e032608698829dc14#diff-37854d19817c792316d481f5beb93cc7

Enbable GPL build and disable webkit component

Merge native and nativesdk component into single recipe using
bbclassextend

Disable build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../juce/nativesdk-projucer_git.bb            |  3 -
 .../juce/projucer-native_git.bb               |  3 -
 .../recipes-multimedia/juce/projucer.inc      | 15 +++-
 .../0001-Disable-webkit-component.patch       | 83 +++++++++++++++++++
 .../recipes-multimedia/juce/projucer_git.bb   |  2 +
 5 files changed, 96 insertions(+), 10 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/juce/nativesdk-proju=
cer_git.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/juce/projucer-native=
_git.bb
 create mode 100644 meta-multimedia/recipes-multimedia/juce/projucer/0001-D=
isable-webkit-component.patch
 create mode 100644 meta-multimedia/recipes-multimedia/juce/projucer_git.bb

diff --git a/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git=
.bb b/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
deleted file mode 100644
index 7836bae691..0000000000
--- a/meta-multimedia/recipes-multimedia/juce/nativesdk-projucer_git.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit nativesdk
-include projucer.inc
-BBCLASSEXTEND =3D "nativesdk"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb=
 b/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
deleted file mode 100644
index fb54fb9e98..0000000000
--- a/meta-multimedia/recipes-multimedia/juce/projucer-native_git.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit native
-include projucer.inc
-BBCLASSEXTEND =3D "native"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-mu=
ltimedia/recipes-multimedia/juce/projucer.inc
index 63ed9e90e0..8199e9668f 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -4,23 +4,28 @@ JUCE supported platforms, including Linux and Embedded Li=
nux."
 SECTION =3D "utils"
 HOMEPAGE =3D "http://juce.com/"
 LICENSE =3D "GPLv3"
-LIC_FILES_CHKSUM =3D "file://README.md;md5=3D65c50b4ff3522b99436da100536cc=
d1c"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da20f91622a47d4e4af9340d5d3f1=
a2d8"
=20
 inherit pkgconfig
=20
 DEPENDS =3D "libx11 libxext libxinerama libxrandr libxcursor freetype alsa=
-lib curl"
+DEPENDS_append_libc-musl =3D " libexecinfo"
=20
-SRCREV =3D "4f41f28b47d01b939559123d145b4e5860528bb7"
+SRCREV =3D "724ae27c71ef809b836df06713cf9e50bc14162b"
 BRANCH =3D "master"
-SRC_URI =3D "git://github.com/WeAreROLI/JUCE.git;protocol=3Dhttps;branch=
=3D${BRANCH}"
+SRC_URI =3D "git://github.com/WeAreROLI/JUCE.git;protocol=3Dhttps;branch=
=3D${BRANCH} \
+           file://0001-Disable-webkit-component.patch \
+"
=20
 S =3D "${WORKDIR}/git"
-PV =3D "5.0.1"
+PV =3D "5.4.5"
=20
 JUCE_PROJUCER_BUILD_PATH =3D "${B}/extras/Projucer/Builds"
 JUCE_PROJUCER_MAKEFILE_PATH =3D "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
 JUCE_PROJUCER =3D "${JUCE_PROJUCER_MAKEFILE_PATH}/build/Projucer"
=20
+EXTRA_OEMAKE =3D "V=3D1 JUCE_ARCH_LABEL=3D${TARGET_ARCH} TARGET_ARCH=3D'-g=
'"
+
 do_configure() {
   cd ${JUCE_PROJUCER_MAKEFILE_PATH}
   CONFIG=3DRelease oe_runmake clean
@@ -35,3 +40,5 @@ do_install() {
   install -d ${D}${bindir}
   install -m 0755 ${JUCE_PROJUCER} ${D}${bindir}
 }
+# error: '_NL_IDENTIFICATION_LANGUAGE' was not declared in this scope
+COMPATIBLE_HOST_libc-musl =3D "null"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer/0001-Disable-=
webkit-component.patch b/meta-multimedia/recipes-multimedia/juce/projucer/0=
001-Disable-webkit-component.patch
new file mode 100644
index 0000000000..3728439c71
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/juce/projucer/0001-Disable-webkit-=
component.patch
@@ -0,0 +1,83 @@
+From df7190f430f30ee522f56f9714d42ee796f0d5ff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Dec 2019 22:18:41 -0800
+Subject: [PATCH] Disable webkit component
+
+It asks for enable JUCER_ENABLE_GPL_MODE
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extras/Projucer/Builds/LinuxMakefile/Makefile | 10 +++++-----
+ extras/Projucer/JuceLibraryCode/AppConfig.h   |  4 ++--
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/extras/Projucer/Builds/LinuxMakefile/Makefile b/extras/Projuc=
er/Builds/LinuxMakefile/Makefile
+index 25b490460..8960f5bc6 100644
+--- a/extras/Projucer/Builds/LinuxMakefile/Makefile
++++ b/extras/Projucer/Builds/LinuxMakefile/Makefile
+@@ -35,13 +35,13 @@ ifeq ($(CONFIG),Debug)
+     TARGET_ARCH :=3D -march=3Dnative
+   endif
+=20
+-  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DDEBUG=3D1 -D_DEBUG=3D1 -DJ=
UCER_LINUX_MAKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_=
HEX=3D0x50405 $(shell pkg-config --cflags x11 xinerama xext freetype2 webki=
t2gtk-4.0 gtk+-x11-3.0) -pthread -I../../JuceLibraryCode -I../../../../modu=
les $(CPPFLAGS)
++  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DDEBUG=3D1 -D_DEBUG=3D1 -DJ=
UCER_LINUX_MAKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_=
HEX=3D0x50405 $(shell pkg-config --cflags x11 xinerama xext freetype2) -pth=
read -I../../JuceLibraryCode -I../../../../modules $(CPPFLAGS)
+   JUCE_CPPFLAGS_APP :=3D -DJucePlugin_Build_VST=3D0 -DJucePlugin_Build_VS=
T3=3D0 -DJucePlugin_Build_AU=3D0 -DJucePlugin_Build_AUv3=3D0 -DJucePlugin_B=
uild_RTAS=3D0 -DJucePlugin_Build_AAX=3D0 -DJucePlugin_Build_Standalone=3D0 =
-DJucePlugin_Build_Unity=3D0
+   JUCE_TARGET_APP :=3D Projucer
+=20
+   JUCE_CFLAGS +=3D $(JUCE_CPPFLAGS) $(TARGET_ARCH) -g -ggdb -O0 $(CFLAGS)
+   JUCE_CXXFLAGS +=3D $(JUCE_CFLAGS) -std=3Dc++11 $(CXXFLAGS)
+-  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2 webkit2gtk-4.0 gtk+-x11-3=
.0) -lrt -ldl -lpthread $(LDFLAGS)
++  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2) -lrt -ldl -lpthread $(LD=
FLAGS)
+=20
+   CLEANCMD =3D rm -rf $(JUCE_OUTDIR)/$(TARGET) $(JUCE_OBJDIR)
+ endif
+@@ -56,13 +56,13 @@ ifeq ($(CONFIG),Release)
+     TARGET_ARCH :=3D -march=3Dnative
+   endif
+=20
+-  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DNDEBUG=3D1 -DJUCER_LINUX_M=
AKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_HEX=3D0x5040=
5 $(shell pkg-config --cflags x11 xinerama xext freetype2 webkit2gtk-4.0 gt=
k+-x11-3.0) -pthread -I../../JuceLibraryCode -I../../../../modules $(CPPFLA=
GS)
++  JUCE_CPPFLAGS :=3D $(DEPFLAGS) -DLINUX=3D1 -DNDEBUG=3D1 -DJUCER_LINUX_M=
AKE_6D53C8B4=3D1 -DJUCE_APP_VERSION=3D5.4.5 -DJUCE_APP_VERSION_HEX=3D0x5040=
5 $(shell pkg-config --cflags x11 xinerama xext freetype2) -pthread -I../..=
/JuceLibraryCode -I../../../../modules $(CPPFLAGS)
+   JUCE_CPPFLAGS_APP :=3D -DJucePlugin_Build_VST=3D0 -DJucePlugin_Build_VS=
T3=3D0 -DJucePlugin_Build_AU=3D0 -DJucePlugin_Build_AUv3=3D0 -DJucePlugin_B=
uild_RTAS=3D0 -DJucePlugin_Build_AAX=3D0 -DJucePlugin_Build_Standalone=3D0 =
-DJucePlugin_Build_Unity=3D0
+   JUCE_TARGET_APP :=3D Projucer
+=20
+   JUCE_CFLAGS +=3D $(JUCE_CPPFLAGS) $(TARGET_ARCH) -O3 $(CFLAGS)
+   JUCE_CXXFLAGS +=3D $(JUCE_CFLAGS) -std=3Dc++11 $(CXXFLAGS)
+-  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2 webkit2gtk-4.0 gtk+-x11-3=
.0) -fvisibility=3Dhidden -lrt -ldl -lpthread $(LDFLAGS)
++  JUCE_LDFLAGS +=3D $(TARGET_ARCH) -L$(JUCE_BINDIR) -L$(JUCE_LIBDIR) $(sh=
ell pkg-config --libs x11 xinerama xext freetype2) -fvisibility=3Dhidden -l=
rt -ldl -lpthread $(LDFLAGS)
+=20
+   CLEANCMD =3D rm -rf $(JUCE_OUTDIR)/$(TARGET) $(JUCE_OBJDIR)
+ endif
+@@ -136,7 +136,7 @@ all : $(JUCE_OUTDIR)/$(JUCE_TARGET_APP)
+=20
+ $(JUCE_OUTDIR)/$(JUCE_TARGET_APP) : $(OBJECTS_APP) $(RESOURCES)
+ 	@command -v pkg-config >/dev/null 2>&1 || { echo >&2 "pkg-config not ins=
talled. Please, install it."; exit 1; }
+-	@pkg-config --print-errors x11 xinerama xext freetype2 webkit2gtk-4.0 gt=
k+-x11-3.0
++	@pkg-config --print-errors x11 xinerama xext freetype2
+ 	@echo Linking "Projucer - App"
+ 	-$(V_AT)mkdir -p $(JUCE_BINDIR)
+ 	-$(V_AT)mkdir -p $(JUCE_LIBDIR)
+diff --git a/extras/Projucer/JuceLibraryCode/AppConfig.h b/extras/Projucer=
/JuceLibraryCode/AppConfig.h
+index dffd5af75..53302bd24 100644
+--- a/extras/Projucer/JuceLibraryCode/AppConfig.h
++++ b/extras/Projucer/JuceLibraryCode/AppConfig.h
+@@ -32,7 +32,7 @@
+ // BEGIN SECTION A=0D
+ =0D
+ #ifndef JUCER_ENABLE_GPL_MODE=0D
+- #define JUCER_ENABLE_GPL_MODE 0=0D
++ #define JUCER_ENABLE_GPL_MODE 1=0D
+ #endif=0D
+ =0D
+ // END SECTION A=0D
+@@ -180,7 +180,7 @@
+ // juce_gui_extra flags:=0D
+ =0D
+ #ifndef    JUCE_WEB_BROWSER=0D
+- //#define JUCE_WEB_BROWSER 1=0D
++ #define JUCE_WEB_BROWSER 0=0D
+ #endif=0D
+ =0D
+ #ifndef    JUCE_ENABLE_LIVE_CONSTANT_EDITOR=0D
+--=20
+2.24.0
+
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer_git.bb b/meta=
-multimedia/recipes-multimedia/juce/projucer_git.bb
new file mode 100644
index 0000000000..f408f6f1bc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/juce/projucer_git.bb
@@ -0,0 +1,2 @@
+include projucer.inc
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.24.0


