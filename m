Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70D7C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 10:21:12 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.5883.1645611671332517554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M7xRm5Dy;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id f8so19484125pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=w2FZCI4F5IcY1IS5XWWkWdAkYnQYmiU37Ko5FehymBM=;
        b=M7xRm5DyMSyV0E52VbUgaAmBWHhLfk2/fndmA6tVwyD8JmWJkUc2erBpVLdgcO6dvZ
         Q0hT4I83hUyGjYDJ/lVqgwJ28QqiLzxrBn2YfBNjRg3egpsXuyfJlngaa5l4AU/Wv89p
         jqa92y+BMS6D83UDKzfRNdrYVOehJ+ye1XoPbA4QxmU/DsnMknHz4zEk2NGNZzD/n5bk
         lCV5WO5bmV3IF0wpWRRTDPdsnP0A0iJmZjZdwISrH2y4JgLvPeRdmOHm8D2vD5rXvPVt
         CSd8Ffrg506lNBDtqz/X/gzUIH9HTDhybnVDt0qsXnXEM6vIpd+7v8eT89gV9MlJNYFT
         GXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w2FZCI4F5IcY1IS5XWWkWdAkYnQYmiU37Ko5FehymBM=;
        b=b8cxWHyTovRUcccyRctVcQxzuYcth1p3JKjeu7fQzBjg7ffQ7CDaZWUBy7A20X2n7F
         fPGokKeu+JCM821e39TH46qTF5eaO+erE+lKolZVvZyD8zbU0exC22agHG0CZ0ddpsM7
         SJqp6Yss5SqKrbo4DiAmpqFEgjN2IYAjGTgkkzzzq2hSbI4UiCDk0Yozw7zaRx1fEvOF
         Awq2oLK/GdQ4gsglOHU4XX2zfiqgL5j6Xv2lYlBvvq/ujMZImEIyuIM5szH4LxbYHV6c
         9+7YHRBfDgN6qGdNEEhQ0Ys6csRbWk6yPzv5ASf1rK/BGCIvIhAC+hz99fHKbwaGKyYN
         ZHZg==
X-Gm-Message-State: AOAM532+FSDnMk6S2+GAEii18Ri5HoFGekkrmmr7AK0un1zZPnVHYry0
	GBrtrC63SuIDFKJFU0SN0cwGLiwprWE=
X-Google-Smtp-Source: 
 ABdhPJyj074dsS5JRVbLKgHNn2J1L9k2P2gXo/DE4+IhYfGRHTDHJxO6Tl3oKmhaVUSttoiNSR8RNg==
X-Received: by 2002:a63:2024:0:b0:374:1052:5679 with SMTP id
 g36-20020a632024000000b0037410525679mr15214153pgg.548.1645611670465;
        Wed, 23 Feb 2022 02:21:10 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:5037:bd06:ed79:4b49:7d6b:e512])
        by smtp.gmail.com with ESMTPSA id
 12-20020a17090a01cc00b001bc1e04842fsm2473973pjd.26.2022.02.23.02.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 02:21:09 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-oe][dunfell][PATCH] protobuf: Fix CVE-2021-22570
Date: Wed, 23 Feb 2022 15:50:16 +0530
Message-Id: <20220223102016.28259-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 10:21:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95476

Fix CVE-2021-22570.
Link: https://koji.fedoraproject.org/koji/buildinfo?buildID=1916865
Link: https://src.fedoraproject.org/rpms/protobuf/blob/394beeacb500861f76473d47e10314e6a3600810/f/CVE-2021-22570.patch

Remove first and second hunk because the second argument in
InsertIfNotPresent() function is of type const char* const& but the
first and second hunk makes the type of second argument as const string
which is not compatible with the type of second argument in
InsertIfNotPresent().

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../protobuf/protobuf/CVE-2021-22570.patch    | 64 +++++++++++++++++++
 .../protobuf/protobuf_3.11.4.bb               |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
new file mode 100644
index 000000000..be3180181
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
@@ -0,0 +1,64 @@
+CVE: CVE-2021-22570
+Upstream-Status: Backport [https://src.fedoraproject.org/rpms/protobuf/blob/394beeacb500861f76473d47e10314e6a3600810/f/CVE-2021-22570.patch]
+Comment: Removed first and second hunk
+Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/src/google/protobuf/descriptor.cc b/src/google/protobuf/descriptor.cc
+index 7af37c57f3..03c4e2b516 100644
+--- a/src/google/protobuf/descriptor.cc
++++ b/src/google/protobuf/descriptor.cc
+@@ -2626,6 +2626,8 @@ void Descriptor::DebugString(int depth, std::string* contents,
+       const Descriptor::ReservedRange* range = reserved_range(i);
+       if (range->end == range->start + 1) {
+         strings::SubstituteAndAppend(contents, "$0, ", range->start);
++      } else if (range->end > FieldDescriptor::kMaxNumber) {
++        strings::SubstituteAndAppend(contents, "$0 to max, ", range->start);
+       } else {
+         strings::SubstituteAndAppend(contents, "$0 to $1, ", range->start,
+                                   range->end - 1);
+@@ -2829,6 +2831,8 @@ void EnumDescriptor::DebugString(
+       const EnumDescriptor::ReservedRange* range = reserved_range(i);
+       if (range->end == range->start) {
+         strings::SubstituteAndAppend(contents, "$0, ", range->start);
++      } else if (range->end == INT_MAX) {
++        strings::SubstituteAndAppend(contents, "$0 to max, ", range->start);
+       } else {
+         strings::SubstituteAndAppend(contents, "$0 to $1, ", range->start,
+                                   range->end);
+@@ -4019,6 +4023,11 @@ bool DescriptorBuilder::AddSymbol(const std::string& full_name,
+   // Use its file as the parent instead.
+   if (parent == nullptr) parent = file_;
+ 
++  if (full_name.find('\0') != std::string::npos) {
++    AddError(full_name, proto, DescriptorPool::ErrorCollector::NAME,
++             "\"" + full_name + "\" contains null character.");
++    return false;
++  }
+   if (tables_->AddSymbol(full_name, symbol)) {
+     if (!file_tables_->AddAliasUnderParent(parent, name, symbol)) {
+       // This is only possible if there was already an error adding something of
+@@ -4059,6 +4068,11 @@ bool DescriptorBuilder::AddSymbol(const std::string& full_name,
+ void DescriptorBuilder::AddPackage(const std::string& name,
+                                    const Message& proto,
+                                    const FileDescriptor* file) {
++  if (name.find('\0') != std::string::npos) {
++    AddError(name, proto, DescriptorPool::ErrorCollector::NAME,
++             "\"" + name + "\" contains null character.");
++    return;
++  }
+   if (tables_->AddSymbol(name, Symbol(file))) {
+     // Success.  Also add parent package, if any.
+     std::string::size_type dot_pos = name.find_last_of('.');
+@@ -4372,6 +4386,12 @@ FileDescriptor* DescriptorBuilder::BuildFileImpl(
+   }
+   result->pool_ = pool_;
+ 
++  if (result->name().find('\0') != std::string::npos) {
++    AddError(result->name(), proto, DescriptorPool::ErrorCollector::NAME,
++             "\"" + result->name() + "\" contains null character.");
++    return nullptr;
++  }
++
+   // Add to tables.
+   if (!tables_->AddFile(result)) {
+     AddError(proto.name(), proto, DescriptorPool::ErrorCollector::OTHER,
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
index d2f22ba6b..55d56ff08 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x;protocol=https \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
+           file://CVE-2021-22570.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.17.1


