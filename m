Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35DBC28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 11:47:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.22890.1661428071356698002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GOAXdgaZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e20so23763987wri.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=hWFcV8obFMLzGF/DGVtN94KlX+wjgs9/011ikDJhvZY=;
        b=GOAXdgaZUmyOFahMJAHSKN9uFbBIM2PNhyI2tu1CxrFqBvqxNl2Qj5aINP4L8g/5J+
         MzGi4OfG0h/+3SlKhzNGxi6JrtFRZqOrtSrfSyBh6Qv5qa9sJmYfxzjQo0/PhY/KuLU5
         TZqbDLlD0EXgE8kp3tAI+2/92+U9uwPWlQJeH4HV9foRriGM0wZSvOSUmtoRm0DF6txV
         OK6R//8ba+HyrgYjhdkB6GNeYbGzaA2T5ljQVMsUid3rNpTHUubVWPdyxV/98K4lwdfp
         kt458dKSa6psdSnJxuprB4zzaHoMCuEYv7Ao7m4OYJkBY5gDuSjc9++yvFdfuS3YSASp
         SHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=hWFcV8obFMLzGF/DGVtN94KlX+wjgs9/011ikDJhvZY=;
        b=YsPnxzb3PLwhFh+mz5U+BuqXyS70Sy/SWAy6MOzhpV46pCrjMsbZrtwlq/gwq7CKaF
         GpBpVJ/7wrgOp5YXcvX5yOOndZJNSVc9ogF0TbB4/lpHpBtycPXHh/sDXcWGBGWaeLdx
         mZ88hroyunAFK+KhO0vl7BEHgbrGJ1CMlySEmPM+kYcyOyhgFBYOW/nMZlwPBObb23T7
         wbDKDEhPZq+wbTdFLnrWaSAJtQkNroDxKL3b3Z4RltkT6O++DBBlPGqU1y3oeURUtzHp
         zTdHPaG3Ig5hA1Zc5C0qCNDFaxFJYkjs/GBEi7VgTw752wIpUnuSxV087o7hf3Klvkqo
         6Omw==
X-Gm-Message-State: ACgBeo3OCN8cufP3KO30AwOK1O9qkKsvT+XVVYiCJyoMRM8BeSrrISxe
	528V9L6bb8z3KTBjLz2cd1m3ewOnB2uywQ==
X-Google-Smtp-Source: 
 AA6agR6zXmMxi9FXeCCO7z1ykyqP+/653VAqzrqNNkjX3SDEqXHUrY4drcBHmovI2Z/NbOrQlGVO6Q==
X-Received: by 2002:a05:6000:1f83:b0:223:60ee:6c08 with SMTP id
 bw3-20020a0560001f8300b0022360ee6c08mr1975170wrb.682.1661428069463;
        Thu, 25 Aug 2022 04:47:49 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-142.002.205.pools.vodafone-ip.de. [2.205.7.142])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a1c5446000000b003a500b612fcsm4913239wmi.12.2022.08.25.04.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 04:47:47 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-oe][PATCH 2/3] protobuf: change build system to cmake
Date: Thu, 25 Aug 2022 13:46:21 +0200
Message-Id: <20220825114622.2978807-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825114622.2978807-1-uvv.mail@gmail.com>
References: <20220825114622.2978807-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Aug 2022 11:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98431

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
 .../protobuf/protobuf_3.21.5.bb               | 25 ++++++++++-----
 3 files changed, 18 insertions(+), 68 deletions(-)
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
index a8828ec40..6af02de0e 100644
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
@@ -24,12 +22,19 @@ SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.pa
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig ptest
+inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[python] = ",,"
 
-EXTRA_OECONF += "--with-protoc=echo"
+EXTRA_OECMAKE += "\
+    -Dprotobuf_BUILD_TESTS=OFF \
+    -Dprotobuf_BUILD_EXAMPLES=OFF \
+"
+EXTRA_OECMAKE:append:class-target= "\
+    -Dprotobuf_BUILD_PROTOC_BINARIES=OFF \
+    -Dprotobuf_BUILD_SHARED_LIBS=ON \
+"
 
 TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
@@ -40,9 +45,15 @@ do_compile_ptest() {
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
@@ -54,7 +65,7 @@ do_compile_ptest() {
 
 	# Compile the tests
 	for lang in ${LANG_SUPPORT}; do
-		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
+		oe_runmake -C "${B}/${TEST_SRC_DIR}" ${lang}
 	done
 
 	# Restore the pkgconfig sysroot variable
@@ -71,7 +82,7 @@ do_install_ptest() {
 			install "$i" "${D}/${PTEST_PATH}"
 		fi
 	done
-	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
+	cp "${B}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
 	cd "$olddir"
 }
 
-- 
2.25.1


