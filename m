Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BACECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:59:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.34279.1661497188290236402
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UMwdm8r/;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id a4so703799wrq.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yTcSCdLuCl7wF89s84BNNlIbCh+dNzqPKkB0WgoiyZM=;
        b=UMwdm8r/vArr/aYgTMoqhOXmlLKQDDRtOkwAgffMIuQybUaO+y7S4vv/XZ1XeUDj+X
         Ab8naa4lM1/smomqEB1YCiUnxQyyF3SPlwnSBoAO6EyM1O9/CNYh9JJ3Hn4C0y5rAIsO
         mmiLl6tfW1JbovvxHZV1jMAA3VIFwG7rITNBA7y7P+SUw79rI1cZnLeaF4uGIPbVZEJe
         NNWlJkDix7Olh+W85HJFDpIQ4gUjO8CWDGmPgAEG/GNrI/c38slkC4mL94KfpxSl7FOg
         ZnDa8nB1RqL4uh1bOa2J1VMZkXBVNV1CttfyXX/PgS2nNigVGwEkfFulzGxt9eOvepZx
         d2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yTcSCdLuCl7wF89s84BNNlIbCh+dNzqPKkB0WgoiyZM=;
        b=gm3+g5FicAsBnNlHL7y/QjPIBUBEmY9vfBIGXLH8bakYv459GzStjaCvfkR2s1Ni+2
         chC/yku2UfouOW2QMFkJffz1TvHzihuG/u2XKXokYPgZuNjWuCMKybskoyO2GP5PWwjb
         EetNT8gHKPXTc76wQZG3uRr8ZfLy92G95Av62NlUEyOdtn0BVTxuMmSu0l1YSz3xF7Lz
         5Q8TT3ElMctHgoq+JO1zB7aM3csqXE7Lf1X5pBByxTxM6ANwHpd4/b2/3L63RKfymCze
         s7tRqiOq0xGnewXA/Wr3jlXGTQM/FP/1PhBTeaYf6v3rmJAl2bZqYwndo/PCcSnXrvD1
         ifpQ==
X-Gm-Message-State: ACgBeo0OTi99AqQSvpP+ETCXBTr0eAhD0xt5/iFtEpqs578k2FYM64/k
	ZtGBewg7NDpt8TygHvpvoavUM1kN+zrUqw==
X-Google-Smtp-Source: 
 AA6agR7sT/HmbJWXG30b9MMba7upruUUNpGb+vnmOkbXbRhp3sG+CviV5lptYPynM8e+2wJf/zXEkg==
X-Received: by 2002:a5d:5a0f:0:b0:225:6c01:fba9 with SMTP id
 bq15-20020a5d5a0f000000b002256c01fba9mr4110557wrb.91.1661497186325;
        Thu, 25 Aug 2022 23:59:46 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-142.002.205.pools.vodafone-ip.de. [2.205.7.142])
        by smtp.gmail.com with ESMTPSA id
 i17-20020a5d5591000000b002258619d342sm1167029wrv.2.2022.08.25.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:59:46 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH v2 2/2] protobuf: change build system to cmake
Date: Fri, 26 Aug 2022 08:59:23 +0200
Message-Id: <20220826065923.3004874-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826065923.3004874-1-uvv.mail@gmail.com>
References: <20220826065923.3004874-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:59:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98478

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Autotools support has been removed and replaced completely by CMake.

See related issues for details:
https://github.com/protocolbuffers/protobuf/issues/7911
https://github.com/protocolbuffers/protobuf/pull/10132

Drop autotools patches too.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...ude-descriptor.cc-when-building-libp.patch | 30 ------------------
 .../0001-protobuf-fix-configure-error.patch   | 31 -------------------
 .../protobuf/protobuf_3.21.5.bb               | 23 +++++++++-----
 3 files changed, 16 insertions(+), 68 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
deleted file mode 100644
index 59d43072c..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Makefile.am-include-descriptor.cc-when-building-libp.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 76980e1c84374e8bfa4dffcca78c5050783e83b9 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 27 Jun 2019 13:27:18 +0000
-Subject: [PATCH] Makefile.am: include descriptor.pb.cc when building
- libprotoc.so
-
-* otherwise plugin.pb.o has undefined symbol scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto
-  and build with gold fails with:
-  core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr/bin/i686-oe-linux/../../libexec/i686-oe-linux/gcc/i686-oe-linux/9.1.0/ld.bfd: ./.libs/libprotoc.so: undefined reference to `descriptor_table_google_2fprotobuf_2fdescriptor_2eproto'
-  core2-32-oe-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr/bin/i686-oe-linux/../../libexec/i686-oe-linux/gcc/i686-oe-linux/9.1.0/ld.bfd: ./.libs/libprotoc.so: undefined reference to `scc_info_FileDescriptorProto_google_2fprotobuf_2fdescriptor_2eproto'
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- src/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index e6a7dc7fd..6b0fe6686 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -326,6 +326,7 @@ libprotoc_la_LDFLAGS += -Wl,--version-script=$(srcdir)/libprotoc.map
- EXTRA_libprotoc_la_DEPENDENCIES = libprotoc.map
- endif
- libprotoc_la_SOURCES =                                         \
-+  google/protobuf/descriptor.pb.cc                             \
-   google/protobuf/compiler/code_generator.cc                   \
-   google/protobuf/compiler/command_line_interface.cc           \
-   google/protobuf/compiler/cpp/enum.cc                         \
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch
deleted file mode 100644
index 7c87dbe26..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2649fe191ad3f086274a9bf1520212a4c715c944 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 18 Jul 2018 17:52:34 +0800
-Subject: [PATCH] protobuf: fix configure error
-
-fix below error:
-gnu-configize: 'configure.ac' or 'configure.in' is required
-
-third_party/googletest is git submodule of protobuf. Above error
-caused by missing submodule googletest.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 375a79d93..1d73cd73f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -241,7 +241,6 @@ AC_SUBST([LIBLOG_LIBS])
- #   too.
- export CFLAGS
- export CXXFLAGS
--AC_CONFIG_SUBDIRS([third_party/googletest])
- 
- AC_CONFIG_FILES([Makefile src/Makefile benchmarks/Makefile conformance/Makefile protobuf.pc protobuf-lite.pc])
- AC_OUTPUT
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index a8828ec40..83dabc9f8 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -14,8 +14,6 @@ SRCREV = "ab840345966d0fa8e7100d771c92a73bfbadd25c"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=21.x;protocol=https \
            file://run-ptest \
-           file://0001-protobuf-fix-configure-error.patch \
-           file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
            "
@@ -24,12 +22,17 @@ SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.pa
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig ptest
+inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = ",,"
 
-EXTRA_OECONF += "--with-protoc=echo"
+EXTRA_OECMAKE += "\
+    -Dprotobuf_BUILD_SHARED_LIBS=ON \
+    -Dprotobuf_BUILD_LIBPROTOC=ON \
+    -Dprotobuf_BUILD_TESTS=OFF \
+    -Dprotobuf_BUILD_EXAMPLES=OFF \
+"
 
 TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
@@ -40,9 +43,15 @@ do_compile_ptest() {
 	# Add the location of the cross-compiled header and library files
 	# which haven't been installed yet.
 	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	cp ${S}/${TEST_SRC_DIR}/*.cc "${B}/${TEST_SRC_DIR}/"
+	cp ${S}/${TEST_SRC_DIR}/*.proto "${B}/${TEST_SRC_DIR}/"
+	cp ${S}/${TEST_SRC_DIR}/*.py "${B}/${TEST_SRC_DIR}/"
+	cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
 	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	# Until out-of-tree build of examples is supported, we have to use this approach
+	sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TEST_SRC_DIR}/Makefile"
 	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
 
 	# Save the pkgcfg sysroot variable, and update it to nothing so
@@ -54,7 +63,7 @@ do_compile_ptest() {
 
 	# Compile the tests
 	for lang in ${LANG_SUPPORT}; do
-		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
+		oe_runmake -C "${B}/${TEST_SRC_DIR}" ${lang}
 	done
 
 	# Restore the pkgconfig sysroot variable
@@ -71,7 +80,7 @@ do_install_ptest() {
 			install "$i" "${D}/${PTEST_PATH}"
 		fi
 	done
-	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
+	cp "${B}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
 	cd "$olddir"
 }
 
-- 
2.25.1


