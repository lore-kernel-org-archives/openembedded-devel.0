Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.5641.1621325518539105116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XmN4INeL;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id y14so7045480wrm.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 01:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dLfPwLmtPwxBHAXTRbwiDXKGGAQcptkdg5pqYuQYoq0=;
        b=XmN4INeLWlZ5Owc3l2U8ZT8rCYMPf+ijdEOHTv9Qw1xH00LcJiSn/zvh1kzGolZQt4
         Hhky0Gad3Pu+dNTcnEMw1DdK2PP5bOXUlXKZOHFEuE/eOYeDvbctw0qY91+kV3ctlAXB
         rs3ABNFJCjcpopkUOTm1k6A0HksgBOmZ/U0m4VGho1c/FDTNKdnG5/tkc36qZLE5EhIq
         +pZ/j85MF66hCOx+q9x7osyML/DHw3R49jiCkPJcoQ5J7ynGsFPoQau4Jifb2oHZfREQ
         b8ub1bsgT/06Sguk1GI7fm1tvgFYmfnoT2JmhegAt4hVn7K7PTNTuVKIWlCxFT57n3hR
         KKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dLfPwLmtPwxBHAXTRbwiDXKGGAQcptkdg5pqYuQYoq0=;
        b=hd/3WzaNMqketNAGBBsum2dtLkeXLJfdj1sRNTTNz4HJQNUabz5J4aZy/UnyHEcqdM
         DTmTVsuIZMdU6ZCKJNEDzOTyLVW5tzoNP4Urq+Yd9VOhI7v20z8rivOPHgqdWCblIPuU
         F/1xJ0WBrlwxBACbUY8JuJtGKG4DVOwJH6wdpUCwIEDytOtORlcw50nOGK3PsH+X3MTr
         0qPqO9MyF8PnTQjlNaaVMChhALmmSKWKnWmetayJk8p+GK3YMT2n9p4ZIBdTAOsb0Y12
         m23iweYNQAc2UfM6ONokBFWa0VempBoNOKAEaPTH3U5WJf0nrBIzbtNpavMPrXWbxM07
         vQQQ==
X-Gm-Message-State: AOAM531rGx00Nvs5/1sQE0Il1BZIuGtArxEoDYRlfeZRV+vR3RH/rsy2
	ZiwXW+/m/LEIE8UovnTJNN5BtAuA8ZA=
X-Google-Smtp-Source: ABdhPJzuC6rWzsYpjtBczmWbzo10UCgRkFoKbggw/PLkj9cSGguJLu2GtGs0f1D0yJclnFItzU0w+Q==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr5015678wrv.321.1621325516602;
        Tue, 18 May 2021 01:11:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f0ec830b81d2d73abc7bc58.dip0.t-ipconnect.de. [2003:f0:7f0e:c830:b81d:2d73:abc7:bc58])
        by smtp.gmail.com with ESMTPSA id v18sm24505319wro.18.2021.05.18.01.11.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 01:11:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] portaudio-v19: upgrade 19.6.0 -> 19.7.0
Date: Tue, 18 May 2021 10:11:44 +0200
Message-Id: <20210518081147.1291254-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* development continues on github
* build with CMake
* examples is a configure option -> replace (always empty) extra package by
  PACKAGECONFIG

From announcement:

* support for latest Mac OS APIs
* Jack - fixes for device names that allows use on Linux systems with PipeWire
* WASAPI - numerous improvements
* OSS - better format support
* ALSA - various fixes for hangs and crashes
* WDMKS - improved performance and fixes
* updated build scripts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../portaudio/files/ldflags.patch             | 51 -------------------
 .../portaudio-v19/0001-Find-jack.patch        | 32 ++++++++++++
 .../portaudio/portaudio-v19_19.7.0.bb         | 32 ++++++++++++
 .../portaudio/portaudio-v19_20161030.bb       | 32 ------------
 4 files changed, 64 insertions(+), 83 deletions(-)
 delete mode 100644 meta-oe/recipes-support/portaudio/files/ldflags.patch
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
 delete mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb

diff --git a/meta-oe/recipes-support/portaudio/files/ldflags.patch b/meta-oe/recipes-support/portaudio/files/ldflags.patch
deleted file mode 100644
index aca93a51f..000000000
--- a/meta-oe/recipes-support/portaudio/files/ldflags.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream forgot to pass LDFLAGS to everything apart from the main library.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile.in b/Makefile.in
-index 5e1a764..61ecdd1 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -171,20 +171,20 @@ lib/$(PALIB): lib-stamp $(LTOBJS) $(MAKEFILE) $(PAINC)
- 	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) $(PA_LDFLAGS) -o lib/$(PALIB) $(LTOBJS) $(DLL_LIBS)
- 
- $(ALL_TESTS): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) test/%.c
--	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
--	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
- 
- $(EXAMPLES): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) examples/%.c
--	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
--	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
- 
- $(SELFTESTS): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) qa/%.c
--	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
--	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
- 
- bin/paloopback: lib/$(PALIB) $(MAKEFILE) $(PAINC) $(LOOPBACK_OBJS)
--	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
--	@WITH_ASIO_TRUE@ $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS)  $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
-+	@WITH_ASIO_TRUE@ $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
- 
- install: lib/$(PALIB) portaudio-2.0.pc
- 	$(INSTALL) -d $(DESTDIR)$(libdir)
-@@ -224,10 +224,10 @@ distclean: clean
- 	$(CC) -c $(CFLAGS) $< -o $@
- 
- %.lo: %.c $(MAKEFILE) $(PAINC)
--	$(LIBTOOL) --mode=compile $(CC) -c $(CFLAGS) $< -o $@
-+	$(LIBTOOL) --mode=compile $(CC) -c $(CFLAGS) $(LDFLAGS) $< -o $@
- 
- %.lo: %.cpp $(MAKEFILE) $(PAINC)
--	$(LIBTOOL) --mode=compile --tag=CXX $(CXX) -c $(CXXFLAGS) $< -o $@
-+	$(LIBTOOL) --mode=compile --tag=CXX $(CXX) -c $(CXXFLAGS) $(LDFLAGS) $< -o $@
- 
- %.o: %.cpp $(MAKEFILE) $(PAINC)
- 	$(CXX) -c $(CXXFLAGS) $< -o $@
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch
new file mode 100644
index 000000000..d6c6300ec
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch
@@ -0,0 +1,32 @@
+From 8ec1b100afda5b3e31f9d44af04b04b16dfff2e4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 18 May 2021 00:15:46 +0200
+Subject: [PATCH] Find jack with pkgconfig
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 122fe93..ab7d7f5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -274,7 +274,8 @@ ELSE()
+ 
+   ELSEIF(UNIX)
+ 
+-    FIND_PACKAGE(Jack)
++    find_package(PkgConfig REQUIRED)
++    pkg_check_modules (JACK jack)
+     IF(JACK_FOUND)
+       OPTION(PA_USE_JACK "Enable support for Jack" ON)
+     ELSE()
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
new file mode 100644
index 000000000..3a0f7894f
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "A portable audio library"
+SECTION = "libs/multimedia"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
+
+PV = "v190700"
+
+SRC_URI = " \
+    git://github.com/PortAudio/portaudio.git \
+    file://0001-Find-jack.patch \
+"
+SRCREV = "147dd722548358763a8b649b3e4b41dfffbcfbb6"
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??= "alsa jack"
+PACKAGECONFIG[alsa] = ",,alsa-lib"
+PACKAGECONFIG[jack] = ",,jack"
+PACKAGECONFIG[examples] = "-DPA_BUILD_EXAMPLES=ON,-DPA_BUILD_EXAMPLES=OFF"
+
+do_install_append() {
+    if [ -d ${B}/examples ]; then
+        install -d ${D}${bindir}
+        for example in ${B}/examples/pa*; do
+            install -m755 $example ${D}${bindir}/
+        done
+    fi
+}
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/libportaudio.so"
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb
deleted file mode 100644
index 489f8ad9e..000000000
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_20161030.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "A portable audio library"
-SECTION = "libs/multimedia"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
-
-PV = "v190600"
-
-SRC_URI = "http://www.portaudio.com/archives/pa_stable_v190600_20161030.tgz \
-           file://ldflags.patch"
-SRC_URI[md5sum] = "4df8224e047529ca9ad42f0521bf81a8"
-SRC_URI[sha256sum] = "f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513"
-
-S = "${WORKDIR}/portaudio"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= "alsa jack"
-PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
-PACKAGECONFIG[jack] = "--with-jack, --without-jack, jack,"
-
-EXTRA_OECONF = "--without-oss --without-asihpi"
-
-do_install_append() {
-    mkdir --parents ${D}${bindir}
-    for b in ${B}/bin/pa*; do
-        # Bit nasty, should always work
-        ${B}/*-libtool --mode install install $b ${D}${bindir}
-    done
-}
-
-PACKAGES += "portaudio-examples"
-FILES_portaudio-examples = "${bindir}"
-- 
2.31.1

