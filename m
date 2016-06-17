Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF15731D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 20:34:52 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id fg1so6375594pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lqsaXzlTUHCiJ4RjjOHyY3FqjnFBBbUWA5R0cay2QVU=;
	b=VOhTV2GWIbhmT5WucnmdrR5N1TPOBD9cpRQmM0dDTqKhP+7maLWDU3FUzflSklSGMf
	NMe2vYWA33q54w0vTrBLfBsMsamcGR/3R83Imh4MkQs9RHRyfb7r9dgSB0wjT8pAXdEp
	DbAhRoFsH9BbX0RhD1bzhNx3MNVeoBp2qFRLqEAExGD92J86uiysiu9sX5de9XADexQK
	hSh9GrcIZU0Wrjv/Y1OO7enNyBtKVJNKyqim556wXW7O9LhJhri4zizeQKYsl/00iFdd
	EV16K75debYaxlRSsbAp5AewGA3rS/wY9wCIx4TtggKEj0dO92NErwkTshi1ueT53XJd
	GaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lqsaXzlTUHCiJ4RjjOHyY3FqjnFBBbUWA5R0cay2QVU=;
	b=Tmg+MDZUy92tJPOmZYXD2MZtNlmNVkfWwMvhMHbqcPjr+0BssNliz9/TzPcepeWlnW
	kKWDiQpImOHPqA1iJVPRkM7Mh2xuImMEDNY1XVBm9PNQSkvyZZnz/G2Zk12YNeWvFVo5
	76N3AXByMWmO6Uk7cbmmq2n9U9yYfJ1BoRBD6VSSvbl6f6WpzscviF7UKhYWrgL7fMmy
	kV9NGSLje4/llJj6w8kkcl91fki8AzQoI+87znx6NFFddEOEPp23kjTVKD79r28mzRte
	YMKYm4UzapXhtNskBhr0bWKvYSU8P/2azmGHVrCcrSVSKaQAe5jhyw1dJhzWeEkUaAkv
	nWHg==
X-Gm-Message-State: ALyK8tLNOk4BQucxA78nmQu+7o3OQuiqwadPnnxxlBHQwXxgT4YD2iTQ/7tMG1Tx38F7tQ==
X-Received: by 10.66.132.45 with SMTP id or13mr4318586pab.79.1466195693535;
	Fri, 17 Jun 2016 13:34:53 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	o84sm65977027pfj.95.2016.06.17.13.34.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 13:34:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:34:49 -0700
Message-Id: <1466195689-14012-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-multimedia][PATCH] libebml: don't rely on make -e, obey LDFLAGS
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
X-List-Received-Date: Fri, 17 Jun 2016 20:34:53 -0000

From: Christopher Larson <chris_larson@mentor.com>

We need to obey LDFLAGS to get the correct hash style for external toolchains,
and passing vars explicitly is better than relying on implicitly overriding
everything blindly from the environment.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-mkv/libebml/libebml/ldflags.patch      | 57 ++++++++++++++++++++++
 .../libebml/libebml/override-uname.patch           | 42 ++++++++++++++++
 .../recipes-mkv/libebml/libebml_1.3.0.bb           | 44 +++++++++++++++--
 3 files changed, 138 insertions(+), 5 deletions(-)
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch b/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
new file mode 100644
index 0000000..a01c754
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
@@ -0,0 +1,57 @@
+Use LD and obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
+diff --git a/make/linux/Makefile b/make/linux/Makefile
+index 391b6e3..a2ac13e 100644
+--- a/make/linux/Makefile
++++ b/make/linux/Makefile
+@@ -64,6 +64,7 @@ objects_so:=$(patsubst %$(EXTENSION),%.lo,$(sources))
+ WARNINGFLAGS=-Wall -Wextra -Wno-unknown-pragmas -ansi -fno-gnu-keywords -Wshadow
+ COMPILEFLAGS=$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(DEBUGFLAGS) $(INCLUDE)
+ DEPENDFLAGS  = $(CXXFLAGS) $(INCLUDE)
++LINKFLAGS=$(LDFLAGS)
+
+ ifeq (Darwin,$(shell uname -s))
+ all: staticlib
+@@ -91,7 +92,7 @@ $(LIBRARY): $(objects)
+	$(RANLIB) $@
+
+ $(LIBRARY_SO): $(objects_so)
+-	$(CXX) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so)
++	$(LD) $(LINKFLAGS) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so)
+	rm -f $(LIBRARY_SO)
+	ln -s $(LIBRARY_SO_VER) $(LIBRARY_SO)
+
+diff --git a/make/mingw32/Makefile b/make/mingw32/Makefile
+index e5986ef..6ca16aa 100644
+--- a/make/mingw32/Makefile
++++ b/make/mingw32/Makefile
+@@ -18,6 +18,7 @@ DEBUGFLAGS=-g -DDEBUG
+ endif
+ CROSS   =
+ CXX     = $(CROSS)g++
++LD      = $(CXX)
+ CC      = $(CROSS)gcc
+ WINDRES = $(CROSS)windres
+ RANLIB  = $(CROSS)ranlib
+@@ -33,6 +34,7 @@ LIBS = libebml.a
+ endif
+ INCS = -I"$(shell pwd)/../.."
+ COMPILEFLAGS = $(DEBUGFLAGS) $(INCS) $(DLLFLAGS) $(CXXFLAGS)
++LINKFLAGS = $(LDFLAGS)
+
+ .PHONY: all all-before all-after clean clean-custom
+
+@@ -54,7 +56,7 @@ libebml.a: $(OBJ)
+	$(RANLIB) $@
+
+ libebml.dll: $(OBJ)
+-	$(CXX) -shared -Wl,--export-all -Wl,--out-implib=$@.a -o $@ $(OBJ)
++	$(LD) $(LINKFLAGS) -shared -Wl,--export-all -Wl,--out-implib=$@.a -o $@ $(OBJ)
+
+ depend:
+	@echo Calculating dependecies:
+--
+2.8.0
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
new file mode 100644
index 0000000..57eb345
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
@@ -0,0 +1,42 @@
+Allow override of the 'uname -s' for cross-compilation
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
+diff --git a/make/linux/Makefile b/make/linux/Makefile
+index a2ac13e..4188bee 100644
+--- a/make/linux/Makefile
++++ b/make/linux/Makefile
+@@ -9,9 +9,11 @@
+ # 'make DEBUG=yes'.
+ #
+
++TARGET_OS ?= $(shell uname -s)
++
+ # Paths
+ # BeOS wants the libs and headers in /boot/home/config
+-ifeq (BeOS,$(shell uname -s))
++ifeq (BeOS,$(TARGET_OS))
+ prefix=/boot/home/config
+ else
+ prefix=/usr/local
+@@ -66,7 +68,7 @@ COMPILEFLAGS=$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(DEBUGFLAGS) $(INCLUDE)
+ DEPENDFLAGS  = $(CXXFLAGS) $(INCLUDE)
+ LINKFLAGS=$(LDFLAGS)
+
+-ifeq (Darwin,$(shell uname -s))
++ifeq (Darwin,$(TARGET_OS))
+ all: staticlib
+ else
+ all: staticlib sharedlib
+@@ -116,7 +118,7 @@ depend:
+		$(CXX) $(DEPENDFLAGS) -MM -MT $$o $$i >> .depend ; \
+	done
+
+-ifeq (Darwin,$(shell uname -s))
++ifeq (Darwin,$(TARGET_OS))
+ install: install_staticlib install_headers
+ else
+ install: install_staticlib install_sharedlib install_headers
+--
+2.8.0
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index 71e2bfc..b756a39 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -2,15 +2,49 @@ SUMMARY = "libebml is a C++ libary to parse EBML files"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
 
-SRC_URI = "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2"
+SRC_URI = "\
+    http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
+    file://ldflags.patch \
+    file://override-uname.patch \
+"
 SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
 SRC_URI[sha256sum] = "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+do_unpack[postfuncs] += "dos2unix"
 
-do_compile() {
-    cd ${S}/make/linux
-    oe_runmake CROSS="${TARGET_PREFIX}"
+dos2unix () {
+    cr="$(printf '\r')"
+    for f in make/*/Makefile; do
+        tr -d "$cr" <"$f" >"$f.new" && \
+            mv "$f.new" "$f"
+    done
+}
+
+LIBEBML_OS = "Unknown"
+LIBEBML_OS_linux = "Linux"
+LIBEBML_OS_darwin = "Darwin"
+LIBEBML_OS_mingw32 = "Windows"
+
+EXTRA_OEMAKE = "\
+    'TARGET_OS=${LIBEBML_OS}' \
+    \
+    'CXX=${CXX}' \
+    'LD=${CXX}' \
+    'AR=${AR}' \
+    'RANLIB=${RANLIB}' \
+    \
+    'DEBUGFLAGS=' \
+    'CPPFLAGS=${CPPFLAGS}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+    \
+    'prefix=${prefix}' \
+    'libdir=${libdir}' \
+    'includedir=${includedir}/ebml' \
+"
+
+do_compile () {
+    oe_runmake -C make/linux
 }
 
 do_install() {
-- 
2.8.0


