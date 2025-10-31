Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42201CCF9FF
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 11:23:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.13412.1761909826032886151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 04:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eO2ITiwP;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-426f1574a14so1405405f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761909824; x=1762514624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6YxLqtgGZYPhBS3WDY7BqavoXWXPfPWijRmmk+A/ZY0=;
        b=eO2ITiwPuduDrMad3XfLgtdrOtp5Rsod9K4X8ZwTEilmZfxDifXryjifO4gpzriPmW
         g7j0yjdIwFpA0niS0YRRtIB+g3sYuOF40GsFfvD8Zi3wR9FV9AjtIM4DxXXMujhKKFCW
         /dBbdSefkDE2XuZccfLSwUJKbF7LkWFQOZ4ep0m4WL83uqrbaB+hd0Iv0PJehhoTfFbX
         A5+gJU5pf2QDhbSGOedyyUpWk/t1S42TIQFY1L9MimyzGnF4MceV6vSyVNQpAVGBdF8C
         3E4QeM3jsE9lr3T5JL5voob2c/2CUXy3ttJ0INJzY3wt/Hpvg7AWVWA1X/oemg2fr5Mw
         UiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909824; x=1762514624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YxLqtgGZYPhBS3WDY7BqavoXWXPfPWijRmmk+A/ZY0=;
        b=oU0/u2DyunhVsId0QJnb7g9gYP1kUGvMz/WhxtdVGOSSQuxmtIPugcPz6bNvmuMSii
         0ic+si6rgZpsFuAQCDS2oNVVyTQwoBTWIqZw0+4GlKWi0aA3zX2/Rabddu52ghS5RxHN
         RpbD9LPHtx28HwF6o3/2g8oXXyPxAX2QgYWbL9HopFqIfegwXcVyK7JNIu9jD/G8Ydpc
         DXN/yoC6b9E9J7RG5EFH74RIIneYAZYApBvTdEpBt5mMQUm3cJ4AAK3920v9QNWJ3M6U
         IeWZ7yt/9A1RDH2DDs2JnnyG2qZt2CQau/sgDTyk7GwOk+KDY3I9lCzRHOGvURTNCgKS
         Oe0A==
X-Gm-Message-State: AOJu0YxMnAaVdX532gEEqrLAjJVr+qjKsi+bYiOLiCbsv8uoshXgBVqV
	cyKcTORD901xHqkeFbidPXXvkE/JwY181uISTPnER29AJrjZtE0os4v2pTvaahjJ
X-Gm-Gg: ASbGncvVYov2EKsPenSRSVH4jSo2wFL4M+vYqJ53ohrfqvQF8h18ZdGXbCG+nT1k0EU
	qAHZGc2MAby68FJzBvftUIfgO32Jeeccigb97apsFsepzLaQr214BhwekCd6cyco2n6hN2aRZaL
	u8bkTS4c39YwZl1yx8Be5fDCQCeM0xRp4dcTLFnO3emdiffFAWqFZNIZIE6xRfvK09xyiZLWRiO
	3B/t860qu/fRpksVuuNbtN5cosf1QrlFOyVizJBPlqaRieG6VkiNaI9zaReJUuvtmlC3bFjkBzI
	5M0cI47HDA3IaCixxxn4q/EowBuewWm3JYGHXcclbDkiHLHU++K/+VmhMgZPCTYBGE/nDQQtwNa
	f684ycF2q1ZBPvenrWsNO3YzqGi6YJfb5Hxu5mKhbt+Ji3laCsMTFgSJhU173wCL9eywHXsu7RA
	==
X-Google-Smtp-Source: AGHT+IHn0i7ofDNiUMp+DIhwK3BnrUB/gOfZqNWDCvBIfxibWoZg2yhPo73AFi2xFegkSv91l7SgmA==
X-Received: by 2002:a05:6000:4021:b0:426:eef2:fa86 with SMTP id ffacd0b85a97d-429bd671ce3mr2613417f8f.11.1761909824014;
        Fri, 31 Oct 2025 04:23:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e16e3sm3174401f8f.28.2025.10.31.04.23.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:23:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] libxml++: fix ptests
Date: Fri, 31 Oct 2025 12:23:41 +0100
Message-ID: <20251031112342.674183-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 11:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121230

The previous version installed the examples as ptests, not the actual tests.

This change compiles the tests on the build machine, install them, and execute
them on the target machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libxml/libxml++/libxml++_ptest.patch      | 78 -------------------
 .../recipes-core/libxml/libxml++/run-ptest    |  5 +-
 .../recipes-core/libxml/libxml++_2.42.1.bb    | 12 ++-
 3 files changed, 11 insertions(+), 84 deletions(-)
 delete mode 100644 meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch

diff --git a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch b/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
deleted file mode 100644
index dc6198fe98..0000000000
--- a/meta-oe/recipes-core/libxml/libxml++/libxml++_ptest.patch
+++ /dev/null
@@ -1,78 +0,0 @@
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -40,5 +40,8 @@ EXTRA_DIST = \
-   tools/conf_tests/have_exception_ptr.cc \
-   untracked/README
- 
-+install-ptest:
-+	make -C examples install-ptest
-+
- # Optional: auto-generate the ChangeLog file from the git log on make dist
- include $(top_srcdir)/build/dist-changelog.am
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -19,6 +19,8 @@ AM_CPPFLAGS = -I$(top_builddir) -I$(top_
- AM_CXXFLAGS = $(LIBXMLXX_WXXFLAGS)
- LDADD = $(top_builddir)/libxml++/libxml++-$(LIBXMLXX_API_VERSION).la $(LIBXMLXX_LIBS)
- 
-+LOG_DRIVER = $(SHELL) ../macros/test-driver
-+
- check_PROGRAMS = \
-   dom_build/dom_build \
-   dom_parse_entities/dom_parse_entities \
-@@ -37,6 +39,23 @@ check_PROGRAMS = \
-   schemavalidation/schemavalidation \
-   textreader/textreader
- 
-+check_DOTLIBS = \
-+  dom_build/.libs/dom_build \
-+  dom_parse_entities/.libs/dom_parse_entities \
-+  dom_parser/.libs/dom_parser \
-+  dom_parser_raw/.libs/dom_parser_raw \
-+  dom_read_write/.libs/dom_read_write \
-+  dom_xinclude/.libs/dom_xinclude \
-+  dom_xpath/.libs/dom_xpath \
-+  dtdvalidation/.libs/dtdvalidation \
-+  import_node/.libs/import_node \
-+  sax_exception/.libs/sax_exception \
-+  sax_parser/.libs/sax_parser \
-+  sax_parser_build_dom/.libs/sax_parser_build_dom \
-+  sax_parser_entities/.libs/sax_parser_entities \
-+  schemavalidation/.libs/schemavalidation \
-+  textreader/.libs/textreader
-+
- # Shell scripts that call the example programs.
- check_SCRIPTS = \
-   dom_build/make_check.sh \
-@@ -154,10 +173,10 @@ dist_noinst_DATA = \
- # file are located in different directories.
- dom_read_write/make_check.sh: Makefile
- 	$(AM_V_GEN)echo '# Generated and used by "make check"' >$@
--	$(AM_V_at)echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/example.xml" dom_read_write/example_output.xml >/dev/null' >>$@
-+	$(AM_V_at)echo 'cd dom_read_write && .libs/dom_read_write "example.xml" example_output.xml >/dev/null' >>$@
- 	$(AM_V_at)chmod +x $@
- 
--script_template = cd "$(srcdir)/<!progname!>" && "$(abs_builddir)/<!progname!>/<!progname!>" >/dev/null
-+script_template = cd "<!progname!>" && ".libs/<!progname!>" >/dev/null
- standard_scripts = $(filter-out dom_read_write/make_check.sh,$(check_SCRIPTS))
- 
- # All other script files are generated like so:
-@@ -169,3 +188,18 @@ $(standard_scripts): Makefile
- CLEANFILES = \
-   dom_read_write/example_output.xml \
-   $(check_SCRIPTS)
-+
-+buildtest: all
-+	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS) $(check_SCRIPTS)
-+	$(MAKE) $(AM_MAKEFLAGS) buildtest-TESTS
-+
-+install-ptest:
-+	$(MKDIR_P) $(DESTDIR)/examples
-+	cp --parents $(check_DOTLIBS) $(DESTDIR)/examples
-+	cp --parents $(check_SCRIPTS) $(DESTDIR)/examples
-+	cd $(srcdir) && cp --parents $(dist_noinst_DATA) $(DESTDIR)/examples
-+	cp Makefile $(DESTDIR)/examples
-+	$(MKDIR_P) $(DESTDIR)/macros
-+	cp $(top_srcdir)/build/test-driver $(DESTDIR)/macros
-+	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/examples/Makefile
-+
diff --git a/meta-oe/recipes-core/libxml/libxml++/run-ptest b/meta-oe/recipes-core/libxml/libxml++/run-ptest
index 236f667538..5e2d4177e2 100644
--- a/meta-oe/recipes-core/libxml/libxml++/run-ptest
+++ b/meta-oe/recipes-core/libxml/libxml++/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
-cd examples
-make -k check-TESTS
+for t in tests/*; do
+  $t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
index f75568a1d9..412cc1ac21 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
-    file://libxml++_ptest.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "9b59059abe5545d28ceb388a55e341095f197bd219c73e6623aeb6d801e00be8"
@@ -24,10 +23,15 @@ do_configure:prepend() {
 }
 
 do_compile_ptest() {
-  oe_runmake -C examples buildtest
+  oe_runmake_call -C tests check || true
+}
+
+do_install_ptest() {
+  cd ${B}/tests
+  for t in *; do
+    [ -d $t ] && install -D $t/.libs/test ${D}${PTEST_PATH}/tests/$t
+  done
 }
 
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/libxml++-2.6/include/libxml++config.h"
-
-RDEPENDS:${PN}-ptest += "make"

