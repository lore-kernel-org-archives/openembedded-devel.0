Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4F16E71A0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 14:20:17 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id j192-v6so2232755wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pdAFlxM2Js+nzR262N19uQPvFeq3yD+cV2EDVdWQDnU=;
	b=Ul5yGk3X1Vhh2gqm5SJ2XRTZls6F25x83Gs2qKNlWEZJaZl01AaWtUp1QaB0ZS/ebn
	8OhdC16FnxplcQLqa9bHgWBfW3/XHZRqjmeRCaFl6OkSR7403dk8/7Pox+06UU6Qy493
	PPjBQkOlZiv7vXHVHfYL9y8jQ3ePeVrTOjTQNetYH5hcKZ+gp+7PFzaBp2omgJ6lPv3J
	zU50Xt96gWUtjyQ/I4wJcIkVom60+lthfnhg9T8EE9zJm33HqZ4lFgwz11pOtMhvWG/e
	hCNHdZs9iVN95k2ftspP1ER2kfVkHnYx16uDCd9RsLQakxkJO23J9K9tZVbd3DF9SnhU
	CX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=pdAFlxM2Js+nzR262N19uQPvFeq3yD+cV2EDVdWQDnU=;
	b=hgDTnLJsPsr9s6inMEFp+h6TWJXhESt5rrlMi7hjcqeddGOuR9kq5tVtGm+tmX2xni
	zsPAOtE1udvHYvuIGGWiEVgXYaUhti9XigUtFnMdSxPW2SH4pZZjUxc0er6ikjv5OSPJ
	INrYhBWaTn70oSiMXdFJv041u2CVPJUI5dE4Km9TOGrTZsLCfsn5iTXCuQcXg4tuSmjc
	MbiulJzybhXQJHA8hKWLGu/VEF2ppwagoOTUUsR3su68BP4DylH4QoZ1Rbn9e/B5yx3s
	UcTrYe7IIhMvUWOBqtGJB+hwo9oSy0Z6Osi8/llxK+gYvJFW7n71LXvdqhvlVElOdfhl
	wiyg==
X-Gm-Message-State: APzg51AbzNneniz8/0vMa50Y6CSnL/eCUkQXuWmeQ0aooAahjHUQDFc1
	5WWPWTFSSg16V1vbRpgqC/43+bzi
X-Google-Smtp-Source: ANB0VdafOBd8iYl1sjIUk1Bo1JVCcjfYeG3QeWiU/zzdufvHgK8uAqliV/tICBRoJNFxhkE55bNPdA==
X-Received: by 2002:a1c:5e08:: with SMTP id s8-v6mr1611988wmb.88.1535466017783;
	Tue, 28 Aug 2018 07:20:17 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	o19-v6sm2097757wro.50.2018.08.28.07.20.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 07:20:16 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 16:20:09 +0200
Message-Id: <20180828142009.7409-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180828142009.7409-1-sno@netbsd.org>
References: <20180828142009.7409-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-oe][PATCH 2/2] protobuf-c: Update 1.3.0 -> 1.3.1
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
X-List-Received-Date: Tue, 28 Aug 2018 14:20:18 -0000

Updating protobuf-c to 3.6.1:
  [ Robert Edmonds ]
  * Release 1.3.1.
  * Restore protobuf-2.x compatibility (#284, #285).
  * Use xenial and protobuf 3.6.1 in the Travis-CI environment (#332).
  * Convert uses of protobuf's scoped_ptr.h to C++11 std::unique_ptr, needed
    to compile against protobuf 3.6.1 (#320, #333).
  * Use AX_CXX_COMPILE_STDCXX macro to enable C++11 support in old compilers
    (#312, #317, #327, #334).
  [ Fredrik Gustafsson ]
  * Add std:: to some types (#294, #305, #309).
  [ Sam Collinson ]
  * Check the return value of int_range_lookup before using as an array index;
    it can return -1 (#315).
  [ Matthias Dittrich ]
  * Fix compilation on mingw by using explicit protoc --plugin=NAME=PATH syntax
    in Makefile.am (#289, #290).

Removing deprecated 0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...-compile-error-with-protobuf-3.6.0.1.patch | 207 ------------------
 ...rotobuf-c_1.3.0.bb => protobuf-c_1.3.1.bb} |   6 +-
 2 files changed, 2 insertions(+), 211 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.0.bb => protobuf-c_1.3.1.bb} (85%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
deleted file mode 100644
index e6239ee32..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-From fb77cbce29d9ea4d4acbfd6ba72cb1cffabf649a Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 20 Jul 2018 11:47:53 +0800
-Subject: [PATCH] protobuf-c: fix compile error with protobuf 3.6.0.1
-
-Upstream-Status: Backport[https://github.com/protobuf-c/protobuf-c/pull/328]
-
-1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
-scoped_array is removed, but protoc-c still use scoped_array,
-caused compile error.
-
-2. fix compile error since missing namespace
-
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- protoc-c/c_field.cc     |  2 +-
- protoc-c/c_field.h      |  2 +-
- protoc-c/c_file.cc      |  8 ++++----
- protoc-c/c_file.h       | 10 +++++-----
- protoc-c/c_generator.cc | 12 ++++++------
- protoc-c/c_helpers.cc   |  4 +++-
- protoc-c/c_message.cc   |  6 +++---
- protoc-c/c_message.h    |  7 ++++---
- 8 files changed, 27 insertions(+), 24 deletions(-)
-
-diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
-index 9fa56ef..eaa38d2 100644
---- a/protoc-c/c_field.cc
-+++ b/protoc-c/c_field.cc
-@@ -189,7 +189,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(io::Printer* printer,
- FieldGeneratorMap::FieldGeneratorMap(const Descriptor* descriptor)
-   : descriptor_(descriptor),
-     field_generators_(
--      new scoped_ptr<FieldGenerator>[descriptor->field_count()]) {
-+      new std::unique_ptr<FieldGenerator>[descriptor->field_count()]) {
-   // Construct all the FieldGenerators.
-   for (int i = 0; i < descriptor->field_count(); i++) {
-     field_generators_[i].reset(MakeGenerator(descriptor->field(i)));
-diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
-index 91f1a03..94b2fad 100644
---- a/protoc-c/c_field.h
-+++ b/protoc-c/c_field.h
-@@ -117,7 +117,7 @@ class FieldGeneratorMap {
- 
-  private:
-   const Descriptor* descriptor_;
--  scoped_array<scoped_ptr<FieldGenerator> > field_generators_;
-+  std::unique_ptr<std::unique_ptr<FieldGenerator>[]> field_generators_;
- 
-   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
- 
-diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
-index 9851768..6dae516 100644
---- a/protoc-c/c_file.cc
-+++ b/protoc-c/c_file.cc
-@@ -83,13 +83,13 @@ FileGenerator::FileGenerator(const FileDescriptor* file,
-                              const string& dllexport_decl)
-   : file_(file),
-     message_generators_(
--      new scoped_ptr<MessageGenerator>[file->message_type_count()]),
-+      new std::unique_ptr<MessageGenerator>[file->message_type_count()]),
-     enum_generators_(
--      new scoped_ptr<EnumGenerator>[file->enum_type_count()]),
-+      new std::unique_ptr<EnumGenerator>[file->enum_type_count()]),
-     service_generators_(
--      new scoped_ptr<ServiceGenerator>[file->service_count()]),
-+      new std::unique_ptr<ServiceGenerator>[file->service_count()]),
-     extension_generators_(
--      new scoped_ptr<ExtensionGenerator>[file->extension_count()]) {
-+      new std::unique_ptr<ExtensionGenerator>[file->extension_count()]) {
- 
-   for (int i = 0; i < file->message_type_count(); i++) {
-     message_generators_[i].reset(
-diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
-index ed38ce4..adc2841 100644
---- a/protoc-c/c_file.h
-+++ b/protoc-c/c_file.h
-@@ -98,13 +98,13 @@ class FileGenerator {
-  private:
-   const FileDescriptor* file_;
- 
--  scoped_array<scoped_ptr<MessageGenerator> > message_generators_;
--  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
--  scoped_array<scoped_ptr<ServiceGenerator> > service_generators_;
--  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
-+  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> message_generators_;
-+  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
-+  std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generators_;
-+  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
- 
-   // E.g. if the package is foo.bar, package_parts_ is {"foo", "bar"}.
--  vector<string> package_parts_;
-+  std::vector<string> package_parts_;
- 
-   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
- };
-diff --git a/protoc-c/c_generator.cc b/protoc-c/c_generator.cc
-index a0d0cb6..c46cfe4 100644
---- a/protoc-c/c_generator.cc
-+++ b/protoc-c/c_generator.cc
-@@ -80,13 +80,13 @@ namespace c {
- //   "foo=bar,baz,qux=corge"
- // parses to the pairs:
- //   ("foo", "bar"), ("baz", ""), ("qux", "corge")
--void ParseOptions(const string& text, vector<pair<string, string> >* output) {
--  vector<string> parts;
-+void ParseOptions(const string& text, std::vector<std::pair<string, string> >* output) {
-+  std::vector<string> parts;
-   SplitStringUsing(text, ",", &parts);
- 
-   for (unsigned i = 0; i < parts.size(); i++) {
-     string::size_type equals_pos = parts[i].find_first_of('=');
--    pair<string, string> value;
-+    std::pair<string, string> value;
-     if (equals_pos == string::npos) {
-       value.first = parts[i];
-       value.second = "";
-@@ -105,7 +105,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
-                             const string& parameter,
-                             OutputDirectory* output_directory,
-                             string* error) const {
--  vector<pair<string, string> > options;
-+  std::vector<std::pair<string, string> > options;
-   ParseOptions(parameter, &options);
- 
-   // -----------------------------------------------------------------
-@@ -149,7 +149,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
- 
-   // Generate header.
-   {
--    scoped_ptr<io::ZeroCopyOutputStream> output(
-+    std::unique_ptr<io::ZeroCopyOutputStream> output(
-       output_directory->Open(basename + ".h"));
-     io::Printer printer(output.get(), '$');
-     file_generator.GenerateHeader(&printer);
-@@ -157,7 +157,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
- 
-   // Generate cc file.
-   {
--    scoped_ptr<io::ZeroCopyOutputStream> output(
-+    std::unique_ptr<io::ZeroCopyOutputStream> output(
-       output_directory->Open(basename + ".c"));
-     io::Printer printer(output.get(), '$');
-     file_generator.GenerateSource(&printer);
-diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
-index b79b5b0..f4ef73d 100644
---- a/protoc-c/c_helpers.cc
-+++ b/protoc-c/c_helpers.cc
-@@ -86,6 +86,8 @@ namespace c {
- #pragma warning(disable:4996)
- #endif
- 
-+using std::vector;
-+
- string DotsToUnderscores(const string& name) {
-   return StringReplace(name, ".", "_", true);
- }
-@@ -559,7 +561,7 @@ static int CEscapeInternal(const char* src, int src_len, char* dest,
- }
- string CEscape(const string& src) {
-   const int dest_length = src.size() * 4 + 1; // Maximum possible expansion
--  scoped_array<char> dest(new char[dest_length]);
-+  std::unique_ptr<char[]> dest(new char[dest_length]);
-   const int len = CEscapeInternal(src.data(), src.size(),
-                                   dest.get(), dest_length, false);
-   GOOGLE_DCHECK_GE(len, 0);
-diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
-index 6b22c71..85a946e 100755
---- a/protoc-c/c_message.cc
-+++ b/protoc-c/c_message.cc
-@@ -83,11 +83,11 @@ MessageGenerator::MessageGenerator(const Descriptor* descriptor,
-   : descriptor_(descriptor),
-     dllexport_decl_(dllexport_decl),
-     field_generators_(descriptor),
--    nested_generators_(new scoped_ptr<MessageGenerator>[
-+    nested_generators_(new std::unique_ptr<MessageGenerator>[
-       descriptor->nested_type_count()]),
--    enum_generators_(new scoped_ptr<EnumGenerator>[
-+    enum_generators_(new std::unique_ptr<EnumGenerator>[
-       descriptor->enum_type_count()]),
--    extension_generators_(new scoped_ptr<ExtensionGenerator>[
-+    extension_generators_(new std::unique_ptr<ExtensionGenerator>[
-       descriptor->extension_count()]) {
- 
-   for (int i = 0; i < descriptor->nested_type_count(); i++) {
-diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
-index 8b115d1..114c2d0 100644
---- a/protoc-c/c_message.h
-+++ b/protoc-c/c_message.h
-@@ -126,9 +126,10 @@ class MessageGenerator {
-   const Descriptor* descriptor_;
-   string dllexport_decl_;
-   FieldGeneratorMap field_generators_;
--  scoped_array<scoped_ptr<MessageGenerator> > nested_generators_;
--  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
--  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
-+
-+  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> nested_generators_;
-+  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
-+  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
- 
-   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
- };
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
similarity index 85%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
index 209bb47e8..7ef030092 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
@@ -13,11 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 DEPENDS = "protobuf-native protobuf"
 
 PV .= "+git${SRCPV}"
-SRCREV = "dac1a65feac4ad72f612aab99f487056fbcf5c1a"
+SRCREV = "269771b4b45d3aba04e59569f53600003db8d9ff"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
-           file://0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch \
-"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


