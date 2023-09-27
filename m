Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C79E810B9
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.13276.1695804177144924586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hkmIoie0;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-405361bb93bso103326705e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804174; x=1696408974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP2H9xhJY8AmzBVL4N9FAlhUAZHTNP6KSDolOciJCO0=;
        b=hkmIoie0d7LO8BuAhCdSEODzePaOCUvnfLAKGGfNt2RURb7t+JJqmZbDVvs4tC5/EO
         gI/GffkCqwrwOg3BweS0UlPH6hilvEGD8kubzNSMnaBurXVnk1NuSDM+CY9JLSfR2FaL
         qX662glHF9tIUuk8RW5t3i8yYTnaH098ZKCj5MK1olwLmBaqAF/ykmz2jNoZyahVWtjp
         GPaGYSxO3d57qW8wqXZ1v6dA06wlypr9OHtH1UWhPvFatxbmZKr25XoPCa9nYG1lwifN
         T7+5nkBi5+ZPr82YXKar5CiuTH5p6y41A9usi7KLyYn+wsYZMRIbVRIj9nCAOwp9RrDa
         t1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804174; x=1696408974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP2H9xhJY8AmzBVL4N9FAlhUAZHTNP6KSDolOciJCO0=;
        b=GBoOj+vUar3Pm7WOCpRcSJKq42sZ2me8ALbiCroow1wFrLk8GOr2KDA0pIdcLfoXDA
         7EZIfYX4rND659TUp9nk3S1q6zWiEG8y8g2hMl5box036bX50AuAz/A7rs2QH7OD8nLH
         5eC5O4kdRxkMq79y0F6+SGONeqYIyO76jj53O4e/Hzs6GBgb19+O8z0xiVF5/a/bR0Q3
         kj4Nj9gA7wiUuKgq5D6ximrGSHkNvHPljXLb7JmBUws963uYpKQiY1p2HTCrtuzQqqVw
         a5Ocyo3f9taBhRxRc9/ZL6VCcoavvj3ohM3RA249j06O40ZzX9xPO5BhUVe7muvKYDLG
         cMIA==
X-Gm-Message-State: AOJu0YwhJ1Ll+bkVsY0M54+ZxxB4DU2kwQOiajum/zgTaiNPZip6H43o
	JA8RcaZt/Kkc4rZrlFVR13s1lleL3P8=
X-Google-Smtp-Source: AGHT+IEGe4eHWDQy8304ypO0cg8m8X2b/xXxRmhRs4lgZOD/76fCYjhJj6CRDbI78A+3tO8arAxvxg==
X-Received: by 2002:a7b:cd0c:0:b0:405:9666:5242 with SMTP id f12-20020a7bcd0c000000b0040596665242mr1400257wmj.31.1695804174166;
        Wed, 27 Sep 2023 01:42:54 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 8/9] protobuf-c: bump to next release to support protobuf 4.23.x
Date: Wed, 27 Sep 2023 10:42:41 +0200
Message-Id: <20230927084242.1195772-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927084242.1195772-1-peron.clem@gmail.com>
References: <20230927084242.1195772-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105183

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...ot-compile-the-code-which-was-genera.patch |  91 ++---
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ------------------
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 3 files changed, 27 insertions(+), 385 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
index 4450a2f62..896a568e1 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
@@ -1,4 +1,4 @@
-From c263360d4f40beb2badd04e5bd084f46fd25595b Mon Sep 17 00:00:00 2001
+From 62b2fd0a150133b6439f6537cb1762d35f5790ee Mon Sep 17 00:00:00 2001
 From: Xiangyu Chen <xiangyu.chen@windriver.com>
 Date: Fri, 31 Mar 2023 16:02:50 +0800
 Subject: [PATCH] Makefile.am: do not compile the code which was generated from
@@ -12,25 +12,27 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
- Makefile.am | 116 ++++++++++++++++++++++++++--------------------------
- 1 file changed, 58 insertions(+), 58 deletions(-)
+ Makefile.am | 75 -----------------------------------------------------
+ 1 file changed, 75 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 3b0d1d6..ff4c196 100644
+index ff12664..7412aef 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -136,64 +136,64 @@ else
+@@ -136,81 +136,6 @@ else
  
  LOG_COMPILER = $(VALGRIND)
  
 -check_PROGRAMS += \
 -	t/generated-code/test-generated-code \
 -	t/generated-code2/test-generated-code2 \
+-	t/generated-code3/test-generated-code3 \
 -	t/version/version
 -
 -TESTS += \
 -	t/generated-code/test-generated-code \
 -	t/generated-code2/test-generated-code2 \
+-	t/generated-code3/test-generated-code3 \
 -	t/version/version
 -
 -t_generated_code_test_generated_code_SOURCES = \
@@ -46,6 +48,16 @@ index 3b0d1d6..ff4c196 100644
 -t_generated_code2_test_generated_code2_LDADD = \
 -	protobuf-c/libprotobuf-c.la
 -
+-t_generated_code3_test_generated_code3_CPPFLAGS = \
+-	-DPROTO3
+-
+-t_generated_code3_test_generated_code3_SOURCES = \
+-	t/generated-code/test-generated-code.c \
+-	t/test-proto3.pb-c.c
+-
+-t_generated_code3_test_generated_code3_LDADD = \
+-	protobuf-c/libprotobuf-c.la
+-
 -noinst_PROGRAMS += \
 -	t/generated-code2/cxx-generate-packed-data
 -
@@ -72,6 +84,9 @@ index 3b0d1d6..ff4c196 100644
 -t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
 -	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
 -
+-t/test-proto3.pb-c.c t/test-proto3.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-proto3.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-proto3.proto
+-
 -t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
 -	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
 -
@@ -80,68 +95,12 @@ index 3b0d1d6..ff4c196 100644
 -	t/test-full.pb-c.c t/test-full.pb-c.h \
 -	t/test-optimized.pb-c.c t/test-optimized.pb-c.h \
 -	t/test-full.pb.cc t/test-full.pb.h \
+-	t/test-proto3.pb-c.c t/test-proto3.pb-c.h \
 -	t/generated-code2/test-full-cxx-output.inc
-+# check_PROGRAMS += \
-+#	t/generated-code/test-generated-code \
-+#	t/generated-code2/test-generated-code2 \
-+#	t/version/version
-+
-+# TESTS += \
-+#	t/generated-code/test-generated-code \
-+#	t/generated-code2/test-generated-code2 \
-+#	t/version/version
-+
-+# t_generated_code_test_generated_code_SOURCES = \
-+#	t/generated-code/test-generated-code.c \
-+#	t/test.pb-c.c
-+# t_generated_code_test_generated_code_LDADD = \
-+#	protobuf-c/libprotobuf-c.la
-+
-+# t_generated_code2_test_generated_code2_SOURCES = \
-+#	t/generated-code2/test-generated-code2.c \
-+#	t/test-full.pb-c.c \
-+#	t/test-optimized.pb-c.c
-+# t_generated_code2_test_generated_code2_LDADD = \
-+#	protobuf-c/libprotobuf-c.la
-+
-+# noinst_PROGRAMS += \
-+#	t/generated-code2/cxx-generate-packed-data
-+
-+# t_generated_code2_cxx_generate_packed_data_SOURCES = \
-+#	t/generated-code2/cxx-generate-packed-data.cc \
-+#	t/test-full.pb.cc \
-+#	protobuf-c/protobuf-c.pb.cc
-+# $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
-+# t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
-+#	$(AM_CXXFLAGS) \
-+#	$(protobuf_CFLAGS)
-+# t_generated_code2_cxx_generate_packed_data_LDADD = \
-+#	$(protobuf_LIBS)
-+
-+# t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test.proto
-+#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
-+
-+# t/test-optimized.pb-c.c t/test-optimized.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-optimized.proto
-+#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-optimized.proto
-+
-+# t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
-+#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
-+
-+# t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
-+#	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
-+
-+# t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
-+#	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
-+
-+# BUILT_SOURCES += \
-+#	t/test.pb-c.c t/test.pb-c.h \
-+#	t/test-full.pb-c.c t/test-full.pb-c.h \
-+#	t/test-optimized.pb-c.c t/test-optimized.pb-c.h \
-+#	t/test-full.pb.cc t/test-full.pb.h \
-+#	t/generated-code2/test-full-cxx-output.inc
- 
- if BUILD_PROTO3
- 
+-
+ t_version_version_SOURCES = \
+ 	t/version/version.c
+ t_version_version_LDADD = \
 -- 
 2.34.1
 
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
deleted file mode 100644
index 075b7044c..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
+++ /dev/null
@@ -1,315 +0,0 @@
-From 66a0b0d205224f63f19dd8f96abf9dcdc2112331 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Wed, 29 Mar 2023 14:25:17 +0800
-Subject: [PATCH] add support of protobuf 4.22.x
-
-after upgrade the protobuf to 4.22.x, the protobuf-c cannot compile anymore (#544) due to following changes:
-1.protobuf using c++14, that cause the command_line_interface.h report error
-2.protobuf using abseil-cpp library instead the trace API with GOOGLE_ header
-3. removed GOOGLE_DISALLOW_EVIL_CONSTRUCTORS
-
-Upstream-Status: Pending [https://github.com/protobuf-c/protobuf-c/pull/548]
-
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- Makefile.am                   | 2 +-
- configure.ac                  | 8 ++++++++
- protoc-c/c_bytes_field.h      | 1 -
- protoc-c/c_enum.h             | 1 -
- protoc-c/c_enum_field.h       | 1 -
- protoc-c/c_extension.h        | 1 -
- protoc-c/c_field.cc           | 2 +-
- protoc-c/c_field.h            | 3 ---
- protoc-c/c_file.h             | 1 -
- protoc-c/c_generator.h        | 2 --
- protoc-c/c_helpers.cc         | 4 ++--
- protoc-c/c_message.cc         | 4 ++--
- protoc-c/c_message.h          | 1 -
- protoc-c/c_message_field.h    | 3 ---
- protoc-c/c_primitive_field.cc | 6 +++---
- protoc-c/c_primitive_field.h  | 3 ---
- protoc-c/c_service.h          | 1 -
- protoc-c/c_string_field.h     | 1 -
- 18 files changed, 17 insertions(+), 28 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index c7339ef..3b0d1d6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -20,7 +20,7 @@ AM_CPPFLAGS = \
- 	-I${top_builddir} \
- 	-I${top_srcdir}
- AM_CFLAGS = ${my_CFLAGS}
--AM_LDFLAGS =
-+AM_LDFLAGS = ${ABSL_LOG_INTERNAL_CHECK_OP_LIBS} ${ABSL_LOG_RAW_HASH_SET_LIBS}
- 
- # code coverage
- 
-diff --git a/configure.ac b/configure.ac
-index f5a0261..8ed549a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -78,6 +78,14 @@ if test "x$enable_protoc" != "xno"; then
- 
-   AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
- 
-+# now checking 4.22.x protobuf, if so, set cxx as 14
-+  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],[AX_CXX_COMPILE_STDCXX(14, noext, mandatory)])
-+
-+  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
-+    [PKG_CHECK_MODULES([ABSL_LOG_INTERNAL_CHECK_OP], [absl_log_internal_check_op],
-+       [PKG_CHECK_MODULES([ABSL_LOG_RAW_HASH_SET], [absl_raw_hash_set], [], [AC_MSG_ERROR([Missing absl_raw_hash_set library.])])],
-+       [AC_MSG_ERROR([Missing absl_log_internal_check_op library.])])])
-+
-   PKG_CHECK_MODULES([protobuf], [protobuf >= 3.0.0],
-     [proto3_supported=yes],
-     [PKG_CHECK_MODULES([protobuf], [protobuf >= 2.6.0])]
-diff --git a/protoc-c/c_bytes_field.h b/protoc-c/c_bytes_field.h
-index bf873f0..8fc63d3 100644
---- a/protoc-c/c_bytes_field.h
-+++ b/protoc-c/c_bytes_field.h
-@@ -88,7 +88,6 @@ class BytesFieldGenerator : public FieldGenerator {
-  private:
-   std::map<std::string, std::string> variables_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(BytesFieldGenerator);
- };
- 
- 
-diff --git a/protoc-c/c_enum.h b/protoc-c/c_enum.h
-index 9c34b69..d5e58f0 100644
---- a/protoc-c/c_enum.h
-+++ b/protoc-c/c_enum.h
-@@ -107,7 +107,6 @@ class EnumGenerator {
-   const EnumDescriptor* descriptor_;
-   std::string dllexport_decl_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_enum_field.h b/protoc-c/c_enum_field.h
-index 3f8c005..03eb402 100644
---- a/protoc-c/c_enum_field.h
-+++ b/protoc-c/c_enum_field.h
-@@ -86,7 +86,6 @@ class EnumFieldGenerator : public FieldGenerator {
-  private:
-   std::map<std::string, std::string> variables_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumFieldGenerator);
- };
- 
- 
-diff --git a/protoc-c/c_extension.h b/protoc-c/c_extension.h
-index 9541388..9c5797d 100644
---- a/protoc-c/c_extension.h
-+++ b/protoc-c/c_extension.h
-@@ -99,7 +99,6 @@ class ExtensionGenerator {
-   std::string type_traits_;
-   std::string dllexport_decl_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ExtensionGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
-index 0716744..4abdc6d 100644
---- a/protoc-c/c_field.cc
-+++ b/protoc-c/c_field.cc
-@@ -231,7 +231,7 @@ FieldGeneratorMap::~FieldGeneratorMap() {}
- 
- const FieldGenerator& FieldGeneratorMap::get(
-     const FieldDescriptor* field) const {
--  GOOGLE_CHECK_EQ(field->containing_type(), descriptor_);
-+  ABSL_CHECK_EQ(field->containing_type(), descriptor_);
-   return *field_generators_[field->index()];
- }
- 
-diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
-index 3cad35d..76d3b0b 100644
---- a/protoc-c/c_field.h
-+++ b/protoc-c/c_field.h
-@@ -104,8 +104,6 @@ class FieldGenerator {
-                                             const std::string &descriptor_addr) const;
-   const FieldDescriptor *descriptor_;
- 
-- private:
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGenerator);
- };
- 
- // Convenience class which constructs FieldGenerators for a Descriptor.
-@@ -122,7 +120,6 @@ class FieldGeneratorMap {
- 
-   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGeneratorMap);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
-index 8dfd8ba..ec55906 100644
---- a/protoc-c/c_file.h
-+++ b/protoc-c/c_file.h
-@@ -104,7 +104,6 @@ class FileGenerator {
-   std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generators_;
-   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
-index ac1ffaf..9260116 100644
---- a/protoc-c/c_generator.h
-+++ b/protoc-c/c_generator.h
-@@ -94,8 +94,6 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
-                 OutputDirectory* output_directory,
-                 std::string* error) const;
- 
-- private:
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(CGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
-index 6fd0cd3..1eaeeb4 100644
---- a/protoc-c/c_helpers.cc
-+++ b/protoc-c/c_helpers.cc
-@@ -286,7 +286,7 @@ const char* const kKeywordList[] = {
- 
- std::set<std::string> MakeKeywordsMap() {
-   std::set<std::string> result;
--  for (int i = 0; i < GOOGLE_ARRAYSIZE(kKeywordList); i++) {
-+  for (int i = 0; i < ABSL_ARRAYSIZE(kKeywordList); i++) {
-     result.insert(kKeywordList[i]);
-   }
-   return result;
-@@ -548,7 +548,7 @@ std::string CEscape(const std::string& src) {
-   std::unique_ptr<char[]> dest(new char[dest_length]);
-   const int len = CEscapeInternal(src.data(), src.size(),
-                                   dest.get(), dest_length, false);
--  GOOGLE_DCHECK_GE(len, 0);
-+  ABSL_DCHECK_GE(len, 0);
-   return std::string(dest.get(), len);
- }
- 
-diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
-index 37e8bf8..c7e8515 100755
---- a/protoc-c/c_message.cc
-+++ b/protoc-c/c_message.cc
-@@ -499,7 +499,7 @@ GenerateMessageDescriptor(io::Printer* printer, bool gen_init) {
- 	  // NOTE: not supported by protobuf
- 	  vars["maybe_static"] = "";
- 	  vars["field_dv_ctype"] = "{ ... }";
--	  GOOGLE_LOG(DFATAL) << "Messages can't have default values!";
-+	  ABSL_LOG(FATAL) << "Messages can't have default values!";
- 	  break;
- 	case FieldDescriptor::CPPTYPE_STRING:
- 	  if (fd->type() == FieldDescriptor::TYPE_BYTES || opt.string_as_bytes())
-@@ -521,7 +521,7 @@ GenerateMessageDescriptor(io::Printer* printer, bool gen_init) {
- 	    break;
- 	  }
- 	default:
--	  GOOGLE_LOG(DFATAL) << "Unknown CPPTYPE";
-+	  ABSL_LOG(FATAL) << "Unknown CPPTYPE";
- 	  break;
- 	}
- 	if (!already_defined)
-diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
-index ea1c3ab..e90782b 100644
---- a/protoc-c/c_message.h
-+++ b/protoc-c/c_message.h
-@@ -137,7 +137,6 @@ class MessageGenerator {
-   std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
-   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_message_field.h b/protoc-c/c_message_field.h
-index 39b8d99..42efe36 100644
---- a/protoc-c/c_message_field.h
-+++ b/protoc-c/c_message_field.h
-@@ -83,9 +83,6 @@ class MessageFieldGenerator : public FieldGenerator {
-   std::string GetDefaultValue(void) const;
-   void GenerateStaticInit(io::Printer* printer) const;
- 
-- private:
--
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageFieldGenerator);
- };
- 
- 
-diff --git a/protoc-c/c_primitive_field.cc b/protoc-c/c_primitive_field.cc
-index 6990893..d5a7b60 100644
---- a/protoc-c/c_primitive_field.cc
-+++ b/protoc-c/c_primitive_field.cc
-@@ -99,7 +99,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(io::Printer* printer) const
-     case FieldDescriptor::TYPE_STRING  :
-     case FieldDescriptor::TYPE_BYTES   :
-     case FieldDescriptor::TYPE_GROUP   :
--    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a primitive type"; break;
-+    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a primitive type"; break;
- 
-     // No default because we want the compiler to complain if any new
-     // types are added.
-@@ -143,7 +143,7 @@ std::string PrimitiveFieldGenerator::GetDefaultValue() const
-     case FieldDescriptor::CPPTYPE_BOOL:
-       return descriptor_->default_value_bool() ? "1" : "0";
-     default:
--      GOOGLE_LOG(DFATAL) << "unexpected CPPTYPE in c_primitive_field";
-+      ABSL_LOG(FATAL) << "unexpected CPPTYPE in c_primitive_field";
-       return "UNEXPECTED_CPPTYPE";
-   }
- }
-@@ -197,7 +197,7 @@ void PrimitiveFieldGenerator::GenerateDescriptorInitializer(io::Printer* printer
-     case FieldDescriptor::TYPE_STRING  :
-     case FieldDescriptor::TYPE_BYTES   :
-     case FieldDescriptor::TYPE_GROUP   :
--    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a primitive type"; break;
-+    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a primitive type"; break;
- 
-     // No default because we want the compiler to complain if any new
-     // types are added.
-diff --git a/protoc-c/c_primitive_field.h b/protoc-c/c_primitive_field.h
-index a9eb893..d2bb724 100644
---- a/protoc-c/c_primitive_field.h
-+++ b/protoc-c/c_primitive_field.h
-@@ -83,9 +83,6 @@ class PrimitiveFieldGenerator : public FieldGenerator {
-   std::string GetDefaultValue(void) const;
-   void GenerateStaticInit(io::Printer* printer) const;
- 
-- private:
--
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(PrimitiveFieldGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_service.h b/protoc-c/c_service.h
-index 27125a6..4737ff3 100644
---- a/protoc-c/c_service.h
-+++ b/protoc-c/c_service.h
-@@ -101,7 +101,6 @@ class ServiceGenerator {
-   const ServiceDescriptor* descriptor_;
-   std::map<std::string, std::string> vars_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ServiceGenerator);
- };
- 
- }  // namespace c
-diff --git a/protoc-c/c_string_field.h b/protoc-c/c_string_field.h
-index 513cea7..ba258e4 100644
---- a/protoc-c/c_string_field.h
-+++ b/protoc-c/c_string_field.h
-@@ -88,7 +88,6 @@ class StringFieldGenerator : public FieldGenerator {
-  private:
-   std::map<std::string, std::string> variables_;
- 
--  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(StringFieldGenerator);
- };
- 
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
index 86d83e9cc..1d9ca9daa 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
@@ -12,12 +12,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https \
-           file://0001-add-support-of-protobuf-4.22.x.patch \
-           "
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=next;protocol=https"
 SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
 
-SRCREV = "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
+SRCREV = "ba4c55f0e686e0252c451f7163ab529e4b36831a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


