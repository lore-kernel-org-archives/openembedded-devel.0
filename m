Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21151C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 13:14:22 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.14505.1699794854451665888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 05:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C4MHDfdS;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso544563066b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 05:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699794852; x=1700399652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBo2dDmVaqyPKWkA3gK8SNxtBIlKsCV8GnJrH3f9uW4=;
        b=C4MHDfdSiv3kDmxw0spONRD3Hu5HS5AnCRQGBQpmmesVGj/fKWmY7iD9Nm/+fKK0G6
         KD/eN72DR535VOKpNsstn0HJvqnl2pK3IXn0zLllFxHv02/JLwD9oeRwPQZgqep0xu2l
         hY+Zt5bx8Cf11x9szY2yZWeIcJlAXfbhox+13b3f/MmmT7XlDCxWcHVhbCLpEt32dqME
         QfdTPyluM2Yx5QnjUASoVUf8D8umxcG7tKh2/Fa1Q+xitcMbDASquShRV+H4PifEvVjs
         3zD72Rfvt3UopVI8Mov42yPS47xa4wbSiGa+8LIdxd+LwLMZS/SRIDibVKZAoywmhZFS
         O4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699794852; x=1700399652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBo2dDmVaqyPKWkA3gK8SNxtBIlKsCV8GnJrH3f9uW4=;
        b=JBCjsOIaICk20spbryQpblObtdw/UHXrWH8p4VUAcx2pc5mGf1J9u6++o0qHNdykLf
         qUKvNMjjX2T5li0UjCZHFN46xlDtiT087f/1+JOdei2YadidNaNttHQH6vVVKuzp9Mr1
         gX/ln4ykMvxPngvVhQDOgjjwGowMTmf5B9s86hGodUOEsh+arzFO3lU9Dy3KLMOGkc1H
         POdpuHzp8JxNw7umPxma7cXEUrw1sqD96eRRKgvNbth/K3PcjjHx4KVESDv4Ezqw9DRX
         8Pf79PPp6D7H75mjDPpWNxC2GWQnoBqE7iP2VXZao8eW3x9PoZ+2UVmNLxS1lz/rcsmz
         cFmA==
X-Gm-Message-State: AOJu0YzccFOJfcfOpONZqQ30PG4stOs3rc65jmoI/+QXCITawg4NLE5d
	Txo1irD4VpVWD1Vh0bKFwOZ78ECknskGdw==
X-Google-Smtp-Source: AGHT+IFnW41LWkGe1K54L4GO13dJa+6EVQ6+o2zQIqyXYwDlJyuU3QU8ntaw+k4u9ID83TjZvdiZIA==
X-Received: by 2002:a17:906:361a:b0:9dd:bd42:4ec2 with SMTP id q26-20020a170906361a00b009ddbd424ec2mr2644684ejb.10.1699794852087;
        Sun, 12 Nov 2023 05:14:12 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id dk18-20020a170906f0d200b009c921a8aae2sm2507489ejb.7.2023.11.12.05.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 05:14:11 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libebml: upgrade 1.3.0 -> 1.4.4
Date: Sun, 12 Nov 2023 16:13:55 +0300
Message-Id: <20231112131355.189550-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 13:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106586

Changelog:

https://github.com/Matroska-Org/libebml/blob/master/NEWS.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-mkv/libebml/libebml/ldflags.patch | 57 ------------------
 .../libebml/libebml/override-uname.patch      | 42 -------------
 .../recipes-mkv/libebml/libebml_1.3.0.bb      | 59 -------------------
 .../recipes-mkv/libebml/libebml_1.4.4.bb      | 15 +++++
 4 files changed, 15 insertions(+), 158 deletions(-)
 delete mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
 delete mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
 delete mode 100644 meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch b/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
deleted file mode 100644
index a01c7544b..000000000
--- a/meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Use LD and obey LDFLAGS
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
-diff --git a/make/linux/Makefile b/make/linux/Makefile
-index 391b6e3..a2ac13e 100644
---- a/make/linux/Makefile
-+++ b/make/linux/Makefile
-@@ -64,6 +64,7 @@ objects_so:=$(patsubst %$(EXTENSION),%.lo,$(sources))
- WARNINGFLAGS=-Wall -Wextra -Wno-unknown-pragmas -ansi -fno-gnu-keywords -Wshadow
- COMPILEFLAGS=$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(DEBUGFLAGS) $(INCLUDE)
- DEPENDFLAGS  = $(CXXFLAGS) $(INCLUDE)
-+LINKFLAGS=$(LDFLAGS)
-
- ifeq (Darwin,$(shell uname -s))
- all: staticlib
-@@ -91,7 +92,7 @@ $(LIBRARY): $(objects)
-	$(RANLIB) $@
-
- $(LIBRARY_SO): $(objects_so)
--	$(CXX) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so)
-+	$(LD) $(LINKFLAGS) -shared -Wl,-soname,$(LIBRARY_SO_VER) -o $(LIBRARY_SO_VER) $(objects_so)
-	rm -f $(LIBRARY_SO)
-	ln -s $(LIBRARY_SO_VER) $(LIBRARY_SO)
-
-diff --git a/make/mingw32/Makefile b/make/mingw32/Makefile
-index e5986ef..6ca16aa 100644
---- a/make/mingw32/Makefile
-+++ b/make/mingw32/Makefile
-@@ -18,6 +18,7 @@ DEBUGFLAGS=-g -DDEBUG
- endif
- CROSS   =
- CXX     = $(CROSS)g++
-+LD      = $(CXX)
- CC      = $(CROSS)gcc
- WINDRES = $(CROSS)windres
- RANLIB  = $(CROSS)ranlib
-@@ -33,6 +34,7 @@ LIBS = libebml.a
- endif
- INCS = -I"$(shell pwd)/../.."
- COMPILEFLAGS = $(DEBUGFLAGS) $(INCS) $(DLLFLAGS) $(CXXFLAGS)
-+LINKFLAGS = $(LDFLAGS)
-
- .PHONY: all all-before all-after clean clean-custom
-
-@@ -54,7 +56,7 @@ libebml.a: $(OBJ)
-	$(RANLIB) $@
-
- libebml.dll: $(OBJ)
--	$(CXX) -shared -Wl,--export-all -Wl,--out-implib=$@.a -o $@ $(OBJ)
-+	$(LD) $(LINKFLAGS) -shared -Wl,--export-all -Wl,--out-implib=$@.a -o $@ $(OBJ)
-
- depend:
-	@echo Calculating dependecies:
---
-2.8.0
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch b/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
deleted file mode 100644
index 57eb3450d..000000000
--- a/meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Allow override of the 'uname -s' for cross-compilation
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
-diff --git a/make/linux/Makefile b/make/linux/Makefile
-index a2ac13e..4188bee 100644
---- a/make/linux/Makefile
-+++ b/make/linux/Makefile
-@@ -9,9 +9,11 @@
- # 'make DEBUG=yes'.
- #
-
-+TARGET_OS ?= $(shell uname -s)
-+
- # Paths
- # BeOS wants the libs and headers in /boot/home/config
--ifeq (BeOS,$(shell uname -s))
-+ifeq (BeOS,$(TARGET_OS))
- prefix=/boot/home/config
- else
- prefix=/usr/local
-@@ -66,7 +68,7 @@ COMPILEFLAGS=$(WARNINGFLAGS) $(CXXFLAGS) $(CPPFLAGS) $(DEBUGFLAGS) $(INCLUDE)
- DEPENDFLAGS  = $(CXXFLAGS) $(INCLUDE)
- LINKFLAGS=$(LDFLAGS)
-
--ifeq (Darwin,$(shell uname -s))
-+ifeq (Darwin,$(TARGET_OS))
- all: staticlib
- else
- all: staticlib sharedlib
-@@ -116,7 +118,7 @@ depend:
-		$(CXX) $(DEPENDFLAGS) -MM -MT $$o $$i >> .depend ; \
-	done
-
--ifeq (Darwin,$(shell uname -s))
-+ifeq (Darwin,$(TARGET_OS))
- install: install_staticlib install_headers
- else
- install: install_staticlib install_sharedlib install_headers
---
-2.8.0
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
deleted file mode 100644
index 744486fa2..000000000
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY = "libebml is a C++ libary to parse EBML files"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRC_URI = "\
-    http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2 \
-    file://ldflags.patch \
-    file://override-uname.patch \
-"
-SRC_URI[md5sum] = "efec729bf5a51e649e1d9d1f61c0ae7a"
-SRC_URI[sha256sum] = "83b074d6b62715aa0080406ea84d33df2e44b5d874096640233a4db49b8096de"
-
-inherit dos2unix
-
-LIBEBML_OS = "Unknown"
-LIBEBML_OS_linux = "Linux"
-LIBEBML_OS:darwin = "Darwin"
-LIBEBML_OS:mingw32 = "Windows"
-
-EXTRA_OEMAKE = "\
-    'TARGET_OS=${LIBEBML_OS}' \
-    \
-    'CXX=${CXX}' \
-    'LD=${CXX}' \
-    'AR=${AR}' \
-    'RANLIB=${RANLIB}' \
-    \
-    'DEBUGFLAGS=' \
-    'CPPFLAGS=${CPPFLAGS}' \
-    'CXXFLAGS=${CXXFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-    \
-    'prefix=${prefix}' \
-    'libdir=${libdir}' \
-    'includedir=${includedir}/ebml' \
-"
-
-do_compile () {
-    oe_runmake -C make/linux
-}
-
-do_install() {
-    cd ${S}/make/linux
-
-    install -d ${D}${libdir}
-    install -m 0644 libebml.a ${D}${libdir}
-    install -m 0755 libebml.so.* ${D}${libdir}
-    cp -R --no-dereference --preserve=mode,links -v libebml.so ${D}${libdir}
-
-    install -d ${D}${includedir}/ebml
-    for i in ../../ebml/*.h; do
-        install -m 0644 $i ${D}${includedir}/ebml
-    done
-
-    install -d ${D}${includedir}/ebml/c
-    for i in ../../ebml/c/*.h; do
-        install -m 0644 $i ${D}${includedir}/ebml/c
-    done
-}
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb
new file mode 100644
index 000000000..fe6436b14
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.4.4.bb
@@ -0,0 +1,15 @@
+SUMMARY = "C++ library to parse EBML files"
+HOMEPAGE = "https://github.com/Matroska-Org/libebml"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/Matroska-Org/libebml.git;branch=v1.x;protocol=https"
+SRCREV = "8330b222fec992b295c8b2149cf70f9ff648ce4a"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake dos2unix
+
+#Static library enabled by default. It has been added in case you want to use it dynamically.
+#EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
+
-- 
2.25.1


