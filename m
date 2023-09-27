Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418F0E810A8
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.13268.1695804169075677633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=al02nNgr;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so1181355e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804166; x=1696408966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mv9onMfzryYeVT3tPm0WaM1IyMYOr9Imu+/BBYjJWwA=;
        b=al02nNgrboefYlxdzmY1afAHcgjOUQWXWCh8n9ywvYLAdrORCpTZfls7WunDsJyxhs
         kIWe3FnihR57uLe3xNGiGbPYhYdy58N19dn6FrZe0dof8NMGY0dx5KWI+UST3oN1qtYT
         vUSCY9nHEUbHi0FASiM34FCMWfYwSj0A8TM+ci0uXcvOryyOkfbhUJcs1q1fV9f+MGhb
         A327mp65KYr1Pm5ocp7zbBsSzciLACxvRvy+kQrC4RpgvrxY7Ww5+PRAIJ+Saq/MOvF/
         4rYKUd7IZBFDgnl+pJBAxyCT1dVfUDj6m9WHKOBVB9CfdF11PtU6nXn0Mm9evk7cLRPA
         Gs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804166; x=1696408966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mv9onMfzryYeVT3tPm0WaM1IyMYOr9Imu+/BBYjJWwA=;
        b=PV89xknbbjXekFdjNffuBeMZ42oGPhGnzwiJMaXtG21Zti3MCwJspMJXbg1/ubJDAn
         w5Sa7ZFkZdr5Qr8j/HcCkvAzwGSFjgCsrC8O5rp7v/E4az1SB8WuBLIqcCYZy4KgQKZx
         A/NZeFjHuOItf/0IqudVdmhRQCpcV4rfTkA8FeDvOklo62lVOzsFX6GluHi0IB4tc2ew
         xfvSZd90eLoOPMDkAWh6/imdcRhhKELZAV9/kLuZv4UDcbu6WWBA65T/XAEsreAWOSao
         z/D48mMpQfbK3lN1C2sIgiuDjdtL/g7NgM+wM+RqtVyNMxviMLoOwxiA5PGoYYjpF4+Z
         XOsA==
X-Gm-Message-State: AOJu0YxjtfKvkSLCz+3qf+40CouI/uAR0qqCbuG7KkKt9kU3qqsM7wXn
	Juy1kNlFpKPu93wUHvLZu3iKU1jkgZ0=
X-Google-Smtp-Source: AGHT+IEcXSw0u43yHY+nwT1o/4MxGdN1iUq4OTW1zlxWT1meh59HmFWmYmRhNdIC6By8X0gIj+AJeg==
X-Received: by 2002:a05:600c:2184:b0:403:b64:ad0a with SMTP id e4-20020a05600c218400b004030b64ad0amr1228459wme.26.1695804166340;
        Wed, 27 Sep 2023 01:42:46 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Xiangyu Chen <xiangyu.chen@windriver.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 2/9] protobuf-c: add support of protobuf 4.22.x
Date: Wed, 27 Sep 2023 10:42:35 +0200
Message-Id: <20230927084242.1195772-3-peron.clem@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105177

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
 .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
 3 files changed, 467 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
new file mode 100644
index 000000000..4450a2f62
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch
@@ -0,0 +1,147 @@
+From c263360d4f40beb2badd04e5bd084f46fd25595b Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Fri, 31 Mar 2023 16:02:50 +0800
+Subject: [PATCH] Makefile.am: do not compile the code which was generated from
+ test-full.proto in protobuf-c-native
+
+Those code was auto generated by protoc command with test-full.proto, those code are not compatible
+with protobuf 4.22.x, so temporarily disable compile those code until protobuf-c upstream adapt
+the test-full.proto with latest version protobuf.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ Makefile.am | 116 ++++++++++++++++++++++++++--------------------------
+ 1 file changed, 58 insertions(+), 58 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3b0d1d6..ff4c196 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -136,64 +136,64 @@ else
+ 
+ LOG_COMPILER = $(VALGRIND)
+ 
+-check_PROGRAMS += \
+-	t/generated-code/test-generated-code \
+-	t/generated-code2/test-generated-code2 \
+-	t/version/version
+-
+-TESTS += \
+-	t/generated-code/test-generated-code \
+-	t/generated-code2/test-generated-code2 \
+-	t/version/version
+-
+-t_generated_code_test_generated_code_SOURCES = \
+-	t/generated-code/test-generated-code.c \
+-	t/test.pb-c.c
+-t_generated_code_test_generated_code_LDADD = \
+-	protobuf-c/libprotobuf-c.la
+-
+-t_generated_code2_test_generated_code2_SOURCES = \
+-	t/generated-code2/test-generated-code2.c \
+-	t/test-full.pb-c.c \
+-	t/test-optimized.pb-c.c
+-t_generated_code2_test_generated_code2_LDADD = \
+-	protobuf-c/libprotobuf-c.la
+-
+-noinst_PROGRAMS += \
+-	t/generated-code2/cxx-generate-packed-data
+-
+-t_generated_code2_cxx_generate_packed_data_SOURCES = \
+-	t/generated-code2/cxx-generate-packed-data.cc \
+-	t/test-full.pb.cc \
+-	protobuf-c/protobuf-c.pb.cc
+-$(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
+-t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
+-	$(AM_CXXFLAGS) \
+-	$(protobuf_CFLAGS)
+-t_generated_code2_cxx_generate_packed_data_LDADD = \
+-	$(protobuf_LIBS)
+-
+-t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
+-
+-t/test-optimized.pb-c.c t/test-optimized.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-optimized.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-optimized.proto
+-
+-t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
+-	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
+-
+-t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
+-	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
+-
+-t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
+-	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
+-
+-BUILT_SOURCES += \
+-	t/test.pb-c.c t/test.pb-c.h \
+-	t/test-full.pb-c.c t/test-full.pb-c.h \
+-	t/test-optimized.pb-c.c t/test-optimized.pb-c.h \
+-	t/test-full.pb.cc t/test-full.pb.h \
+-	t/generated-code2/test-full-cxx-output.inc
++# check_PROGRAMS += \
++#	t/generated-code/test-generated-code \
++#	t/generated-code2/test-generated-code2 \
++#	t/version/version
++
++# TESTS += \
++#	t/generated-code/test-generated-code \
++#	t/generated-code2/test-generated-code2 \
++#	t/version/version
++
++# t_generated_code_test_generated_code_SOURCES = \
++#	t/generated-code/test-generated-code.c \
++#	t/test.pb-c.c
++# t_generated_code_test_generated_code_LDADD = \
++#	protobuf-c/libprotobuf-c.la
++
++# t_generated_code2_test_generated_code2_SOURCES = \
++#	t/generated-code2/test-generated-code2.c \
++#	t/test-full.pb-c.c \
++#	t/test-optimized.pb-c.c
++# t_generated_code2_test_generated_code2_LDADD = \
++#	protobuf-c/libprotobuf-c.la
++
++# noinst_PROGRAMS += \
++#	t/generated-code2/cxx-generate-packed-data
++
++# t_generated_code2_cxx_generate_packed_data_SOURCES = \
++#	t/generated-code2/cxx-generate-packed-data.cc \
++#	t/test-full.pb.cc \
++#	protobuf-c/protobuf-c.pb.cc
++# $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
++# t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
++#	$(AM_CXXFLAGS) \
++#	$(protobuf_CFLAGS)
++# t_generated_code2_cxx_generate_packed_data_LDADD = \
++#	$(protobuf_LIBS)
++
++# t/test.pb-c.c t/test.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test.proto
++#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test.proto
++
++# t/test-optimized.pb-c.c t/test-optimized.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-optimized.proto
++#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-optimized.proto
++
++# t/test-full.pb-c.c t/test-full.pb-c.h: $(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) $(top_srcdir)/t/test-full.proto
++#	$(AM_V_GEN)@PROTOC@ --plugin=protoc-gen-c=$(top_builddir)/protoc-c/protoc-gen-c$(EXEEXT) -I$(top_srcdir) --c_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
++
++# t/test-full.pb.cc t/test-full.pb.h: @PROTOC@ $(top_srcdir)/t/test-full.proto
++#	$(AM_V_GEN)@PROTOC@ -I$(top_srcdir) --cpp_out=$(top_builddir) $(top_srcdir)/t/test-full.proto
++
++# t/generated-code2/test-full-cxx-output.inc: t/generated-code2/cxx-generate-packed-data$(EXEEXT)
++#	$(AM_V_GEN)$(top_builddir)/t/generated-code2/cxx-generate-packed-data$(EXEEXT) > $(top_builddir)/t/generated-code2/test-full-cxx-output.inc
++
++# BUILT_SOURCES += \
++#	t/test.pb-c.c t/test.pb-c.h \
++#	t/test-full.pb-c.c t/test-full.pb-c.h \
++#	t/test-optimized.pb-c.c t/test-optimized.pb-c.h \
++#	t/test-full.pb.cc t/test-full.pb.h \
++#	t/generated-code2/test-full-cxx-output.inc
+ 
+ if BUILD_PROTO3
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
new file mode 100644
index 000000000..075b7044c
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf-4.22.x.patch
@@ -0,0 +1,315 @@
+From 66a0b0d205224f63f19dd8f96abf9dcdc2112331 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 29 Mar 2023 14:25:17 +0800
+Subject: [PATCH] add support of protobuf 4.22.x
+
+after upgrade the protobuf to 4.22.x, the protobuf-c cannot compile anymore (#544) due to following changes:
+1.protobuf using c++14, that cause the command_line_interface.h report error
+2.protobuf using abseil-cpp library instead the trace API with GOOGLE_ header
+3. removed GOOGLE_DISALLOW_EVIL_CONSTRUCTORS
+
+Upstream-Status: Pending [https://github.com/protobuf-c/protobuf-c/pull/548]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ Makefile.am                   | 2 +-
+ configure.ac                  | 8 ++++++++
+ protoc-c/c_bytes_field.h      | 1 -
+ protoc-c/c_enum.h             | 1 -
+ protoc-c/c_enum_field.h       | 1 -
+ protoc-c/c_extension.h        | 1 -
+ protoc-c/c_field.cc           | 2 +-
+ protoc-c/c_field.h            | 3 ---
+ protoc-c/c_file.h             | 1 -
+ protoc-c/c_generator.h        | 2 --
+ protoc-c/c_helpers.cc         | 4 ++--
+ protoc-c/c_message.cc         | 4 ++--
+ protoc-c/c_message.h          | 1 -
+ protoc-c/c_message_field.h    | 3 ---
+ protoc-c/c_primitive_field.cc | 6 +++---
+ protoc-c/c_primitive_field.h  | 3 ---
+ protoc-c/c_service.h          | 1 -
+ protoc-c/c_string_field.h     | 1 -
+ 18 files changed, 17 insertions(+), 28 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c7339ef..3b0d1d6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ AM_CPPFLAGS = \
+ 	-I${top_builddir} \
+ 	-I${top_srcdir}
+ AM_CFLAGS = ${my_CFLAGS}
+-AM_LDFLAGS =
++AM_LDFLAGS = ${ABSL_LOG_INTERNAL_CHECK_OP_LIBS} ${ABSL_LOG_RAW_HASH_SET_LIBS}
+ 
+ # code coverage
+ 
+diff --git a/configure.ac b/configure.ac
+index f5a0261..8ed549a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -78,6 +78,14 @@ if test "x$enable_protoc" != "xno"; then
+ 
+   AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
+ 
++# now checking 4.22.x protobuf, if so, set cxx as 14
++  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],[AX_CXX_COMPILE_STDCXX(14, noext, mandatory)])
++
++  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
++    [PKG_CHECK_MODULES([ABSL_LOG_INTERNAL_CHECK_OP], [absl_log_internal_check_op],
++       [PKG_CHECK_MODULES([ABSL_LOG_RAW_HASH_SET], [absl_raw_hash_set], [], [AC_MSG_ERROR([Missing absl_raw_hash_set library.])])],
++       [AC_MSG_ERROR([Missing absl_log_internal_check_op library.])])])
++
+   PKG_CHECK_MODULES([protobuf], [protobuf >= 3.0.0],
+     [proto3_supported=yes],
+     [PKG_CHECK_MODULES([protobuf], [protobuf >= 2.6.0])]
+diff --git a/protoc-c/c_bytes_field.h b/protoc-c/c_bytes_field.h
+index bf873f0..8fc63d3 100644
+--- a/protoc-c/c_bytes_field.h
++++ b/protoc-c/c_bytes_field.h
+@@ -88,7 +88,6 @@ class BytesFieldGenerator : public FieldGenerator {
+  private:
+   std::map<std::string, std::string> variables_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(BytesFieldGenerator);
+ };
+ 
+ 
+diff --git a/protoc-c/c_enum.h b/protoc-c/c_enum.h
+index 9c34b69..d5e58f0 100644
+--- a/protoc-c/c_enum.h
++++ b/protoc-c/c_enum.h
+@@ -107,7 +107,6 @@ class EnumGenerator {
+   const EnumDescriptor* descriptor_;
+   std::string dllexport_decl_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_enum_field.h b/protoc-c/c_enum_field.h
+index 3f8c005..03eb402 100644
+--- a/protoc-c/c_enum_field.h
++++ b/protoc-c/c_enum_field.h
+@@ -86,7 +86,6 @@ class EnumFieldGenerator : public FieldGenerator {
+  private:
+   std::map<std::string, std::string> variables_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumFieldGenerator);
+ };
+ 
+ 
+diff --git a/protoc-c/c_extension.h b/protoc-c/c_extension.h
+index 9541388..9c5797d 100644
+--- a/protoc-c/c_extension.h
++++ b/protoc-c/c_extension.h
+@@ -99,7 +99,6 @@ class ExtensionGenerator {
+   std::string type_traits_;
+   std::string dllexport_decl_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ExtensionGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
+index 0716744..4abdc6d 100644
+--- a/protoc-c/c_field.cc
++++ b/protoc-c/c_field.cc
+@@ -231,7 +231,7 @@ FieldGeneratorMap::~FieldGeneratorMap() {}
+ 
+ const FieldGenerator& FieldGeneratorMap::get(
+     const FieldDescriptor* field) const {
+-  GOOGLE_CHECK_EQ(field->containing_type(), descriptor_);
++  ABSL_CHECK_EQ(field->containing_type(), descriptor_);
+   return *field_generators_[field->index()];
+ }
+ 
+diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
+index 3cad35d..76d3b0b 100644
+--- a/protoc-c/c_field.h
++++ b/protoc-c/c_field.h
+@@ -104,8 +104,6 @@ class FieldGenerator {
+                                             const std::string &descriptor_addr) const;
+   const FieldDescriptor *descriptor_;
+ 
+- private:
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGenerator);
+ };
+ 
+ // Convenience class which constructs FieldGenerators for a Descriptor.
+@@ -122,7 +120,6 @@ class FieldGeneratorMap {
+ 
+   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGeneratorMap);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
+index 8dfd8ba..ec55906 100644
+--- a/protoc-c/c_file.h
++++ b/protoc-c/c_file.h
+@@ -104,7 +104,6 @@ class FileGenerator {
+   std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generators_;
+   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
+index ac1ffaf..9260116 100644
+--- a/protoc-c/c_generator.h
++++ b/protoc-c/c_generator.h
+@@ -94,8 +94,6 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenerator {
+                 OutputDirectory* output_directory,
+                 std::string* error) const;
+ 
+- private:
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(CGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
+index 6fd0cd3..1eaeeb4 100644
+--- a/protoc-c/c_helpers.cc
++++ b/protoc-c/c_helpers.cc
+@@ -286,7 +286,7 @@ const char* const kKeywordList[] = {
+ 
+ std::set<std::string> MakeKeywordsMap() {
+   std::set<std::string> result;
+-  for (int i = 0; i < GOOGLE_ARRAYSIZE(kKeywordList); i++) {
++  for (int i = 0; i < ABSL_ARRAYSIZE(kKeywordList); i++) {
+     result.insert(kKeywordList[i]);
+   }
+   return result;
+@@ -548,7 +548,7 @@ std::string CEscape(const std::string& src) {
+   std::unique_ptr<char[]> dest(new char[dest_length]);
+   const int len = CEscapeInternal(src.data(), src.size(),
+                                   dest.get(), dest_length, false);
+-  GOOGLE_DCHECK_GE(len, 0);
++  ABSL_DCHECK_GE(len, 0);
+   return std::string(dest.get(), len);
+ }
+ 
+diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
+index 37e8bf8..c7e8515 100755
+--- a/protoc-c/c_message.cc
++++ b/protoc-c/c_message.cc
+@@ -499,7 +499,7 @@ GenerateMessageDescriptor(io::Printer* printer, bool gen_init) {
+ 	  // NOTE: not supported by protobuf
+ 	  vars["maybe_static"] = "";
+ 	  vars["field_dv_ctype"] = "{ ... }";
+-	  GOOGLE_LOG(DFATAL) << "Messages can't have default values!";
++	  ABSL_LOG(FATAL) << "Messages can't have default values!";
+ 	  break;
+ 	case FieldDescriptor::CPPTYPE_STRING:
+ 	  if (fd->type() == FieldDescriptor::TYPE_BYTES || opt.string_as_bytes())
+@@ -521,7 +521,7 @@ GenerateMessageDescriptor(io::Printer* printer, bool gen_init) {
+ 	    break;
+ 	  }
+ 	default:
+-	  GOOGLE_LOG(DFATAL) << "Unknown CPPTYPE";
++	  ABSL_LOG(FATAL) << "Unknown CPPTYPE";
+ 	  break;
+ 	}
+ 	if (!already_defined)
+diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
+index ea1c3ab..e90782b 100644
+--- a/protoc-c/c_message.h
++++ b/protoc-c/c_message.h
+@@ -137,7 +137,6 @@ class MessageGenerator {
+   std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
+   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_message_field.h b/protoc-c/c_message_field.h
+index 39b8d99..42efe36 100644
+--- a/protoc-c/c_message_field.h
++++ b/protoc-c/c_message_field.h
+@@ -83,9 +83,6 @@ class MessageFieldGenerator : public FieldGenerator {
+   std::string GetDefaultValue(void) const;
+   void GenerateStaticInit(io::Printer* printer) const;
+ 
+- private:
+-
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageFieldGenerator);
+ };
+ 
+ 
+diff --git a/protoc-c/c_primitive_field.cc b/protoc-c/c_primitive_field.cc
+index 6990893..d5a7b60 100644
+--- a/protoc-c/c_primitive_field.cc
++++ b/protoc-c/c_primitive_field.cc
+@@ -99,7 +99,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(io::Printer* printer) const
+     case FieldDescriptor::TYPE_STRING  :
+     case FieldDescriptor::TYPE_BYTES   :
+     case FieldDescriptor::TYPE_GROUP   :
+-    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a primitive type"; break;
++    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a primitive type"; break;
+ 
+     // No default because we want the compiler to complain if any new
+     // types are added.
+@@ -143,7 +143,7 @@ std::string PrimitiveFieldGenerator::GetDefaultValue() const
+     case FieldDescriptor::CPPTYPE_BOOL:
+       return descriptor_->default_value_bool() ? "1" : "0";
+     default:
+-      GOOGLE_LOG(DFATAL) << "unexpected CPPTYPE in c_primitive_field";
++      ABSL_LOG(FATAL) << "unexpected CPPTYPE in c_primitive_field";
+       return "UNEXPECTED_CPPTYPE";
+   }
+ }
+@@ -197,7 +197,7 @@ void PrimitiveFieldGenerator::GenerateDescriptorInitializer(io::Printer* printer
+     case FieldDescriptor::TYPE_STRING  :
+     case FieldDescriptor::TYPE_BYTES   :
+     case FieldDescriptor::TYPE_GROUP   :
+-    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a primitive type"; break;
++    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a primitive type"; break;
+ 
+     // No default because we want the compiler to complain if any new
+     // types are added.
+diff --git a/protoc-c/c_primitive_field.h b/protoc-c/c_primitive_field.h
+index a9eb893..d2bb724 100644
+--- a/protoc-c/c_primitive_field.h
++++ b/protoc-c/c_primitive_field.h
+@@ -83,9 +83,6 @@ class PrimitiveFieldGenerator : public FieldGenerator {
+   std::string GetDefaultValue(void) const;
+   void GenerateStaticInit(io::Printer* printer) const;
+ 
+- private:
+-
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(PrimitiveFieldGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_service.h b/protoc-c/c_service.h
+index 27125a6..4737ff3 100644
+--- a/protoc-c/c_service.h
++++ b/protoc-c/c_service.h
+@@ -101,7 +101,6 @@ class ServiceGenerator {
+   const ServiceDescriptor* descriptor_;
+   std::map<std::string, std::string> vars_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ServiceGenerator);
+ };
+ 
+ }  // namespace c
+diff --git a/protoc-c/c_string_field.h b/protoc-c/c_string_field.h
+index 513cea7..ba258e4 100644
+--- a/protoc-c/c_string_field.h
++++ b/protoc-c/c_string_field.h
+@@ -88,7 +88,6 @@ class StringFieldGenerator : public FieldGenerator {
+  private:
+   std::map<std::string, std::string> variables_;
+ 
+-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(StringFieldGenerator);
+ };
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
index d724287d6..86d83e9cc 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
@@ -12,7 +12,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f725889e0d77383e26cb42b0b62cea2"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https \
+           file://0001-add-support-of-protobuf-4.22.x.patch \
+           "
+SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
+
 SRCREV = "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


