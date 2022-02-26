Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F18C433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:41:30 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.6804.1645890088855407727
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jH05hx6C;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so6578299pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BT3L9aekpZcWUwD93D7yatXhZWLCWnzBTjaqQ0RrW6k=;
        b=jH05hx6CMsoVT50KRkcJU2t2iSdt3ICv2cX7HUIPvSE9ws7961m2bVkVkTSyspqXKd
         pl+FytyPHKiCS9YMrNfG0EXehmRszvwzFVt/h1/SZI1fUovYTcg/1c4mWEFB+Z72WFwc
         9SWjxPlwACZbBxXVV8QywVuY5EatNfRA6vLDPrbxGC61XGuUlVSzRAH9igrmR3frCWf6
         wxHaykD/AdG+SlkT8YKqaJcmWNk2dDpVBKfOzFaLdpfTXeLyKBJgVK5Ziezw1rK9+isv
         OF8pOJofXe0JHBpUelwFfRG400WrxqLY7fUbdoJxTkxkUkFjXyBwRhZtaqigYY3dxQrX
         uWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BT3L9aekpZcWUwD93D7yatXhZWLCWnzBTjaqQ0RrW6k=;
        b=5KD6iHcyyUB1SQCO4TTZmmB335HhrlHShI2nV4x7faBgywT7tbefXdEippFUuDC38A
         T7sGsGyG/i2km/8TIpZUy4LXuDP5+zim3fAClWlJG2yQuqsxA9h22BK3iDuJa6m8rBT+
         +oDLrtPKsRq+LwQG4yFsrvVWbjLJyfeMDNIgxNlqzvRv+Ap/KGYI+gSZtu7gw3PD6qSx
         5e7ndMK8l6ToqO8ml6/O9q42Z7mZw/bg0NnWcQ+C4dgFlIQnQrty4B1qlPRgpA7rcnZz
         Isqn7B0zfOIV+GuSM+4aOzIGGyPwB48RceDeoZh32ea1WYpQKCRCP35p1qL084kVCdUD
         jqPg==
X-Gm-Message-State: AOAM533CEySaH6Ce+5p8XdHPyhxpUgrhY5e6if797j+nG4YBujDUsQ76
	n5BTlu1AfFilNW4qnRhd1CQgVJ2e+Ok=
X-Google-Smtp-Source: 
 ABdhPJzuUMeu3XYXyXv+VYH1DwgOXwhf30X0g2t7MA9lbH8W9jg8kxDpIunL4s0Rsz4kQixp2CesIg==
X-Received: by 2002:a17:90a:7e95:b0:1bc:5d56:8d4c with SMTP id
 j21-20020a17090a7e9500b001bc5d568d4cmr8293362pjl.93.1645890088025;
        Sat, 26 Feb 2022 07:41:28 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004e136d54a15sm7676075pfv.105.2022.02.26.07.41.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:41:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 5/5] protobuf: Fix CVE-2021-22570
Date: Sat, 26 Feb 2022 07:41:19 -0800
Message-Id: 
 <0722ff6f021df91542b5efa1ff5b5f6269f66add.1645890015.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645890015.git.akuster808@gmail.com>
References: <cover.1645890015.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 15:41:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95549

From: Sana Kazi <sanakazisk19@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../protobuf/protobuf/CVE-2021-22570.patch    | 64 +++++++++++++++++++
 .../protobuf/protobuf_3.11.4.bb               |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
new file mode 100644
index 0000000000..be3180181a
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
index d2f22ba6b8..55d56ff08e 100644
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
2.25.1


