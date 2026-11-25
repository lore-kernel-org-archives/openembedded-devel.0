Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37946.1795594097407386965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YuFSc+OA;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso6417269c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594097; x=1796198897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Kz9OQTZA4j6q2nwEMRga/6hrD76p0OHlciLj/6cUhY=;
        b=YuFSc+OAITvN8nfN24da/8rhjkfhb+Al0s9rv1JDtUTyOn7H6a0Aik2tTX2RdkEkos
         VwandthGJe6lvn2vXxzZXTm2kOUflyPJbEdq1tNaHqsiVAg7PnYmEM5MktJ1CLMl7cww
         ptNVTBIOdkHbvswEdd7PTQ4VzNCfPO+uHaE3cTOLWnY7Rp171y95PdLrHANmHCA0Kwi7
         QdjG4U01ADn+V60YX27Mq22YQWJmPB1W667CSj7D4mUocRMI19jZQB97I7Ik0MHop1He
         362VRusT78p2vna9PZd7qxJzDI2Z6FCqnWbBwP8cvdgOGhgVi6iMyxDOdqqT634m5pqa
         XVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594097; x=1796198897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Kz9OQTZA4j6q2nwEMRga/6hrD76p0OHlciLj/6cUhY=;
        b=ow/y6rrnSph8nsAv2ihgdktKy67IGIIGC3tzfpXrTPRlNsH9UQ4rcJRLHSmrN/dRrw
         I0WxhSmhKZwl4Dh4H03iv5DVQ2vEpp5deI/cbvVEK/QeMwJ0IIyTUjtdR22SoI1ZfjIG
         /jbsMzpxJnhjs/kJJ2zcy6CRWQE/di1srxWVHHv2d/wGhtlwRVt9NohDJcn769l5p8vZ
         qHtqax6KzgC29Jg7Q3c7bdtXN+kpj1YJ9asnauHusotZrPTvxVYL8E3OqaSFjlGteaSf
         ZtyeQfXaqoDDN7M48+k0itMIRbJyftRdXtoR+J+wIlkqwPKIQyvpjs3jL3R+v7uJvBC/
         6jdQ==
X-Gm-Message-State: APuU4Z9Un2abD0xS/r/lw+UFyJG5KTO4sGrjj6C5SpcihWFiyMaR9ylq
	zsG17j4un/GiDHhUzhFpG5AN8cYFwlmTMkNB97E/dchgAt0qCjeKEWQ4MufWx1Cf
X-Gm-Gg: AZFdTZdzxbfxitqmH1gSOpVRJPjrTKvrEdLiZzCcancjoVgLmYWcyHzzulsXP27zqWH
	bwBzjKswcpekfOpnyyIV5GVVAEkwEuTgz3TDH8C2yIVUl8v9FrOVoyiGXc9xiB1578L8vAuYEi3
	IxjSTHfFOV1UYo4ORDD3AfsZNqJqupuY56VjZy/Z+ZDcfFTSxqtUZyqg/frkr1q55Siq7sedsfh
	3zOzLfBE0nq6hG8vgr7BQwZZHpp/le2CePETbLIYdDUpqHjukIg/3O9Q+AeyvLt1co9M7BMO72Q
	vtoL1S5+WM3nltE2de59vq1jcBV3iLUTHawlU8UFZHZ4vNaPe8XniX05b0qh0ojfywWLFsh3JuD
	E09GRTwHNO1FS96rVpou+zrPrb3yhrwt0wZybasSXpM4ViCGXER5K83uRcEHqOEkoZwziuWAr5K
	e1GONv91fRu80tov4yspqMS5b23lDZUB4Y3+BkrpctXsDWRMqsRrl5ShUL2TQuKg77Bubqsgn47
	FbuVb0o42fw2ZXQFuIOz2MWzMLaSdNt8BUTfynV6lg4ETbPnUl2o2dnL4KSj60KC2qAessPWuof
	TpWyQ4wDczjyqive1frmGFHkLHzCaf13cNlw4GRZWyR5s4WcD5iOIo/odgS+exPAd02In+uSzph
	QdsW7Cs1pwUDdxJgFBaORdpp7TkCcDiphQkPQieDuHCozcpLONO7KIbJ5qLDcbJ1GQjOermiq7i
	9II1R/myKU4z7tdHWRND28trXjtHIXG/mFkHAP17z9ffx3QnZHumF0wq9KQH8wO9t5MT7GUwo+O
	vb0knNQO4qdN+0aulULB2XHPMi4SlPHXCnvja+Z1jJehRO2onfCVNSJm8FJ8GUkSTJragysH7C5
	b9l0dUXhOVC0+V0+RBoDYVjScA==
X-Received: by 2002:a05:7301:1a08:b0:386:9f4c:e07f with SMTP id 5a478bee46e88-3869f4ce1d9mr14002702eec.14.1795594096619;
        Wed, 25 Nov 2026 00:08:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 27/55] protobuf-c: Fix build with protobuf >= 34
Date: Wed, 25 Nov 2026 00:06:43 -0800
Message-ID: <20261125080732.2419614-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133030
Content-Type: text/plain; charset="utf-8"

Protobuf 34 removed FieldDescriptor::label() from the C++ API, so
protoc-gen-c fails to compile against protobuf 7.x. Backport the
pending upstream fix (protobuf-c PR #797), which derives the label from
is_repeated()/is_required(). It also builds with older protobuf.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Fix-compilation-against-protobuf-v34.patch | 210 ++++++++++++++++++
 .../protobuf/protobuf-c_1.5.2.bb              |   4 +-
 2 files changed, 213 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Fix-compilation-against-protobuf-v34.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Fix-compilation-against-protobuf-v34.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Fix-compilation-against-protobuf-v34.patch
new file mode 100644
index 0000000000..8fe2c3f08f
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Fix-compilation-against-protobuf-v34.patch
@@ -0,0 +1,210 @@
+From d39f001b4578966600de0aaf7fc665eec6e057e5 Mon Sep 17 00:00:00 2001
+From: Leon White <l.white@interstellarlab.earth>
+Date: Tue, 10 Mar 2026 10:37:18 +0100
+Subject: [PATCH] Fix compilation against protobuf v34
+
+FieldDescriptor::label() was removed in protobuf v34. Use a local
+FieldLabel() helper based on is_repeated()/is_required() instead.
+
+Upstream-Status: Submitted [https://github.com/protobuf-c/protobuf-c/pull/797]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ protoc-gen-c/c_bytes_field.cc     |  4 ++--
+ protoc-gen-c/c_enum_field.cc      |  4 ++--
+ protoc-gen-c/c_field.cc           | 10 +++++-----
+ protoc-gen-c/c_helpers.cc         | 11 +++++++++++
+ protoc-gen-c/c_helpers.h          |  5 +++++
+ protoc-gen-c/c_message_field.cc   |  4 ++--
+ protoc-gen-c/c_primitive_field.cc |  4 ++--
+ protoc-gen-c/c_string_field.cc    |  4 ++--
+ 8 files changed, 31 insertions(+), 15 deletions(-)
+
+diff --git a/protoc-gen-c/c_bytes_field.cc b/protoc-gen-c/c_bytes_field.cc
+index c8ac772..ab10117 100644
+--- a/protoc-gen-c/c_bytes_field.cc
++++ b/protoc-gen-c/c_bytes_field.cc
+@@ -94,7 +94,7 @@ BytesFieldGenerator::~BytesFieldGenerator() {}
+ 
+ void BytesFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "ProtobufCBinaryData $name$$deprecated$;\n");
+       break;
+@@ -135,7 +135,7 @@ std::string BytesFieldGenerator::GetDefaultValue(void) const
+ }
+ void BytesFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$default_value$");
+       break;
+diff --git a/protoc-gen-c/c_enum_field.cc b/protoc-gen-c/c_enum_field.cc
+index c3111f5..78ffb1c 100644
+--- a/protoc-gen-c/c_enum_field.cc
++++ b/protoc-gen-c/c_enum_field.cc
+@@ -95,7 +95,7 @@ EnumFieldGenerator::~EnumFieldGenerator() {}
+ 
+ void EnumFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$type$ $name$$deprecated$;\n");
+       break;
+@@ -117,7 +117,7 @@ std::string EnumFieldGenerator::GetDefaultValue(void) const
+ }
+ void EnumFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables_, "$default$");
+       break;
+diff --git a/protoc-gen-c/c_field.cc b/protoc-gen-c/c_field.cc
+index 8d22343..8f83e1b 100644
+--- a/protoc-gen-c/c_field.cc
++++ b/protoc-gen-c/c_field.cc
+@@ -125,11 +125,11 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+     variables["oneofname"] = CamelToLower(oneof->name());
+ 
+   if (FieldSyntax(descriptor_) == 3 &&
+-    descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_OPTIONAL) {
++    FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_OPTIONAL) {
+     variables["LABEL"] = "NONE";
+     optional_uses_has = false;
+   } else {
+-    variables["LABEL"] = CamelToUpper(GetLabelName(descriptor_->label()));
++    variables["LABEL"] = CamelToUpper(GetLabelName(FieldLabel(descriptor_)));
+   }
+ 
+   if (descriptor_->has_default_value()) {
+@@ -145,11 +145,11 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+ 
+   variables["flags"] = "0";
+ 
+-  if (descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_REPEATED
++  if (FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_REPEATED
+    && is_packable_type (descriptor_->type())
+    && descriptor_->options().packed()) {
+     variables["flags"] += " | PROTOBUF_C_FIELD_FLAG_PACKED";
+-  } else if (descriptor_->label() == google::protobuf::FieldDescriptor::LABEL_REPEATED
++  } else if (FieldLabel(descriptor_) == google::protobuf::FieldDescriptor::LABEL_REPEATED
+    && is_packable_type (descriptor_->type())
+    && FieldSyntax(descriptor_) == 3
+    && !descriptor_->options().has_packed()) {
+@@ -179,7 +179,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(google::protobuf::io::
+     "  $value$,\n"
+     "  PROTOBUF_C_LABEL_$LABEL$,\n"
+     "  PROTOBUF_C_TYPE_$TYPE$,\n");
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(variables, "  0,   /* quantifier_offset */\n");
+       break;
+diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
+index e5c177c..fcfc258 100644
+--- a/protoc-gen-c/c_helpers.cc
++++ b/protoc-gen-c/c_helpers.cc
+@@ -338,6 +338,17 @@ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label) {
+   return "bad-label";
+ }
+ 
++google::protobuf::FieldDescriptor::Label FieldLabel(
++    const google::protobuf::FieldDescriptor* field) {
++  if (field->is_repeated()) {
++    return google::protobuf::FieldDescriptor::LABEL_REPEATED;
++  }
++  if (field->is_required()) {
++    return google::protobuf::FieldDescriptor::LABEL_REQUIRED;
++  }
++  return google::protobuf::FieldDescriptor::LABEL_OPTIONAL;
++}
++
+ unsigned
+ WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name)
+ {
+diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
+index 6936999..210f17a 100644
+--- a/protoc-gen-c/c_helpers.h
++++ b/protoc-gen-c/c_helpers.h
+@@ -153,6 +153,11 @@ std::string FilenameIdentifier(compat::StringView filename);
+ // return 'required', 'optional', or 'repeated'
+ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label);
+ 
++// Returns the field label in a way that is compatible with protobuf versions
++// where FieldDescriptor::label() is unavailable.
++google::protobuf::FieldDescriptor::Label FieldLabel(
++  const google::protobuf::FieldDescriptor* field);
++
+ // write IntRanges entries for a bunch of sorted values.
+ // returns the number of ranges there are to bsearch.
+ unsigned WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name);
+diff --git a/protoc-gen-c/c_message_field.cc b/protoc-gen-c/c_message_field.cc
+index 9fca920..4366135 100644
+--- a/protoc-gen-c/c_message_field.cc
++++ b/protoc-gen-c/c_message_field.cc
+@@ -83,7 +83,7 @@ void MessageFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer*
+   vars["name"] = FieldName(descriptor_);
+   vars["type"] = FullNameToC(descriptor_->message_type()->full_name(), descriptor_->message_type()->file());
+   vars["deprecated"] = FieldDeprecated(descriptor_);
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print(vars, "$type$ *$name$$deprecated$;\n");
+@@ -103,7 +103,7 @@ std::string MessageFieldGenerator::GetDefaultValue(void) const
+ }
+ void MessageFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* printer) const
+ {
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print("NULL");
+diff --git a/protoc-gen-c/c_primitive_field.cc b/protoc-gen-c/c_primitive_field.cc
+index 588f60e..b3a4a46 100644
+--- a/protoc-gen-c/c_primitive_field.cc
++++ b/protoc-gen-c/c_primitive_field.cc
+@@ -109,7 +109,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(google::protobuf::io::Printe
+   vars["name"] = FieldName(descriptor_);
+   vars["deprecated"] = FieldDeprecated(descriptor_);
+ 
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(vars, "$c_type$ $name$$deprecated$;\n");
+       break;
+@@ -156,7 +156,7 @@ void PrimitiveFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer*
+   } else {
+     vars["default_value"] = "0";
+   }
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+       printer->Print(vars, "$default_value$");
+       break;
+diff --git a/protoc-gen-c/c_string_field.cc b/protoc-gen-c/c_string_field.cc
+index 163f424..6aea8dd 100644
+--- a/protoc-gen-c/c_string_field.cc
++++ b/protoc-gen-c/c_string_field.cc
+@@ -94,7 +94,7 @@ void StringFieldGenerator::GenerateStructMembers(google::protobuf::io::Printer*
+ {
+   const ProtobufCFileOptions opt = descriptor_->file()->options().GetExtension(pb_c_file);
+ 
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       if (opt.const_strings())
+@@ -138,7 +138,7 @@ void StringFieldGenerator::GenerateStaticInit(google::protobuf::io::Printer* pri
+   } else {
+     vars["default"] = "(char *)protobuf_c_empty_string";
+   }
+-  switch (descriptor_->label()) {
++  switch (FieldLabel(descriptor_)) {
+     case google::protobuf::FieldDescriptor::LABEL_REQUIRED:
+     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL:
+       printer->Print(vars, "$default$");
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb
index 7fe514fe07..5740209e6b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb
@@ -13,10 +13,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd8de4f63e06b1ccc06e9f8dc5b1aa97"
 DEPENDS = "protobuf-native protobuf"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https \
-"
+           file://0001-Fix-compilation-against-protobuf-v34.patch \
+           "
 SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
 
 SRCREV = "4719fdd7760624388c2c5b9d6759eb6a47490626"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
 inherit autotools pkgconfig
