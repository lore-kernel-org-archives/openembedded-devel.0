Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66E8CD37AE
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:49:45 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.43470.1725428980544918915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UsDPUvYw;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7091558067eso2310484a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725428979; x=1726033779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfKAHK940g4lxjvr+d6YVvEJM6OUozA0gA/gL+0AsJs=;
        b=UsDPUvYwrVZXCIUDYUIW1AwPV7Q0OTVWwp+E89P4TGsXn/maW37a6xrWyKjydZc8hM
         sdwPVGwacIV2QmJlzyYPPVC+r7ce36/bw+EMxaABKl1OP1c/VSYoNLBm3gt5QGqV46rX
         wPDtBdtDkjnF656UA2dMJh14MROWw25lmzdnXbwFQ9SHUeoLYp/pK92Uyg7SI9exT4Se
         y5UzYIjQYSlbuUl2XJS2uHKKs1xvATVJv+VI1lasvzrzIAZGyPPqKpHG9RrctRIyCO+2
         rb1Uu2Edq74MpeldLAygMLNXukeHJJwqEntb520paJqfvfQvXbniUSAA6/KICrJf4m6x
         vaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725428979; x=1726033779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfKAHK940g4lxjvr+d6YVvEJM6OUozA0gA/gL+0AsJs=;
        b=iJ2Oj4E/xVH839RlXLF6je/8sJzvxGTCDXWK3mxGnTMIBYpgYvbWE4t29WGQrUmjHC
         H+crK77tf/JPfgO9FQzdDDAzw4aLpmXGXR/I8ckXhF2EzxpIcYhYNlFTdcg6f5ghLVPP
         bO9bxna+QTRRRYGGodS+qfq/Q/oXT8iqsXoNXkX6uQN0prJKNHfdM95ahR7tTm3vMWjT
         XOOrUNePq8vXT6DUXsmBeZrnB7ypBQKu1KqMQ+Ji1z18bD2w4alpRLfQY7UzWGoBf53k
         WwlqFqtFhwyRvHt87iAsf8HFyJQxsXDdsmz7Z7CzRwKVWlxLGV6tvGxwVODmEd7qo3J3
         uNiw==
X-Gm-Message-State: AOJu0YxkBvvFL8MnciVNatNQ3QD9NrHpAW+uZ/aXi2e6x4zkWlfMDwYO
	UHlW60u4zmESCo/u32Ffj6a0yoBDq0WMHDm74aiknYT+L/tg2IwyrcLyK4UF
X-Google-Smtp-Source: AGHT+IHRB6wh3ZrbsWI/EO68thUQN+DIA/ct/EfDj4k5Dtknjn18EwfP6ey0cM3Iwc+u0TWvvRTyig==
X-Received: by 2002:a05:6358:5245:b0:1b8:203b:db84 with SMTP id e5c5f4694b2df-1b8203bdc7fmr90683555d.4.1725428979547;
        Tue, 03 Sep 2024 22:49:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859974fsm839010b3a.149.2024.09.03.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:49:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs-115: fix build with clang and libc++ 19
Date: Tue,  3 Sep 2024 22:49:37 -0700
Message-ID: <20240904054937.2097000-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 05:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112089

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs-115/1849070.patch             | 36 +++++++++++++++++++
 .../mozjs/mozjs-115/1894423.patch             | 30 ++++++++++++++++
 .../mozjs/mozjs-115_115.11.0.bb               |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patch
new file mode 100644
index 0000000000..c19a32690d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patch
@@ -0,0 +1,36 @@
+Bug 1849070 - Avoid using char_traits<unsigned char>. r=spidermonkey-reviewers,anba
+
+It is not guaranteed to exist by the standard, and is actively being
+removed from libc++ in LLVM 18.
+
+Differential Revision: https://phabricator.services.mozilla.com/D186421
+
+Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/68ff4d3f7338248b4d67cf03aade5a73f8d396b2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/js/src/builtin/intl/Locale.cpp
++++ b/js/src/builtin/intl/Locale.cpp
+@@ -802,8 +802,10 @@ static inline auto FindUnicodeExtensionT
+                                             UnicodeKey key) {
+   JS::AutoCheckCannotGC nogc;
+   return unicodeExtension->hasLatin1Chars()
+-             ? FindUnicodeExtensionType(unicodeExtension->latin1Chars(nogc),
+-                                        unicodeExtension->length(), key)
++             ? FindUnicodeExtensionType(
++                   reinterpret_cast<const char*>(
++                       unicodeExtension->latin1Chars(nogc)),
++                   unicodeExtension->length(), key)
+              : FindUnicodeExtensionType(unicodeExtension->twoByteChars(nogc),
+                                         unicodeExtension->length(), key);
+ }
+@@ -920,7 +922,9 @@ static BaseNamePartsResult BaseNameParts
+ static inline auto BaseNameParts(JSLinearString* baseName) {
+   JS::AutoCheckCannotGC nogc;
+   return baseName->hasLatin1Chars()
+-             ? BaseNameParts(baseName->latin1Chars(nogc), baseName->length())
++             ? BaseNameParts(
++                   reinterpret_cast<const char*>(baseName->latin1Chars(nogc)),
++                   baseName->length())
+              : BaseNameParts(baseName->twoByteChars(nogc), baseName->length());
+ }
+ 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patch
new file mode 100644
index 0000000000..93e0f0f4f9
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patch
@@ -0,0 +1,30 @@
+Bug 1894423 - Remove unused ExclusiveData move constructor. r=spidermonkey-reviewers,jonco
+
+Because the constructor is actually not used, the compiler used to not
+complain about it being broken. Recent changes on clang trunk made it
+catch this problem without the constructor being used.
+
+As Mutex doesn't have a move constructor, it's also not only a matter of
+adding the missing underscore to lock.
+
+As the constructor is never used, just remove it.
+
+Differential Revision: https://phabricator.services.mozilla.com/D209108
+
+Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/223087fdc29f]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/js/src/threading/ExclusiveData.h
++++ b/js/src/threading/ExclusiveData.h
+@@ -109,11 +109,6 @@ class ExclusiveData {
+   explicit ExclusiveData(const MutexId& id, Args&&... args)
+       : lock_(id), value_(std::forward<Args>(args)...) {}
+ 
+-  ExclusiveData(ExclusiveData&& rhs)
+-      : lock_(std::move(rhs.lock)), value_(std::move(rhs.value_)) {
+-    MOZ_ASSERT(&rhs != this, "self-move disallowed!");
+-  }
+-
+   ExclusiveData& operator=(ExclusiveData&& rhs) {
+     this->~ExclusiveData();
+     new (mozilla::KnownNotNull, this) ExclusiveData(std::move(rhs));
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
index c0eb1291fe..4a0baf5fa6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
            file://armv5.patch \
+           file://1849070.patch \ 
+           file://1894423.patch \
            "
 SRC_URI[sha256sum] = "16be46f16a356a2b8bd3541805a24c8a2acf6f077cf8a65859689685c26025e0"
 

