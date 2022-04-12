Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E444C3527C
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.2458.1649801001467218026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pY4nKMc8;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id k29so1901130pgm.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n1Yx+XE68+dtn7lgu28eolxplNWlTobNXa9nJUW29TM=;
        b=pY4nKMc8MfuAY2c+Uzt0qAS3FFo/fApvG1eUFliLi9VTWl4/P3wHALpSvu3ujyy3ZI
         ZPGFeF0s43Y2fF5Qm/IvSXECKMh8OHAUSk61zZtu5qJb+qxghAy3ZbuoLx/iT+EwO7Dh
         ec0AcxwHxxTlS5laubunLpeZ5dxdkPE390aQb/iegU76H03xA6HVTFz7dWOAi9pSHYvW
         7Sko3QTb/XHg0LZ21u6rhHzVpE4/9zE3iyE8jcTl7Cd2KSkJOJJFQwQ7xFItq9QZVPhN
         uozKCJNpuKArXfgnKvMvbGmKfIZxM5c/hhnlcgg4w+zrg6dsV3RlHUc72yyWkIhMKFst
         q8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n1Yx+XE68+dtn7lgu28eolxplNWlTobNXa9nJUW29TM=;
        b=c+m+E0Q5L/Be098B4B/PqJnc2Nru8zOz9K9KhlV/gn+sLbTEptA21Y3c/rbkgfd03/
         z5TZSSDw5E3YgXtIWymm0dW/QBdZzW/lVYq2ROn2ik4H3Q8EcNqspcWBXd05ZYg0jUEQ
         hwbEYwYc3aOQU/6kwx/PXnzTBfKP3MtwzPakUhWPk4mkZY+y4LD/6Jp+Zv9UX29RYG8b
         hBVosMb588DDhYouKBG8VuBZ2R1VsNqjITF6IJzA0Q25D2vLQ3iTnAd4FrZUsuAkzgy1
         9DKv7877JYO0u+VfHhbOomXFrChNiBDpoj+GTip30qA2zffR5uhtZT7sKR6WrdAtDY2Y
         w2jw==
X-Gm-Message-State: AOAM531xOYT5Qh1t3Wgdesvd0cFYKZ/0oIaZcsh5pdWNhMaKMIDKQpCG
	49lSCK60FC60wEN34A1c9oN1YIcDetg5wg==
X-Google-Smtp-Source: 
 ABdhPJy1cW9MNs7RYE6s1b4RMRsKBj+8I1zw0XMT4yd3goBNiBDB0AL7ecj1nzqicvuQSzhaqmYFIg==
X-Received: by 2002:a63:5c0b:0:b0:382:76f4:c768 with SMTP id
 q11-20020a635c0b000000b0038276f4c768mr31749118pgb.93.1649801000755;
        Tue, 12 Apr 2022 15:03:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a7c0800b001cb63a477eesm502881pjf.12.2022.04.12.15.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 15:03:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] parallel-deqp-runner: Fix build with gcc 12
Date: Tue, 12 Apr 2022 15:03:12 -0700
Message-Id: <20220412220316.3876985-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412220316.3876985-1-raj.khem@gmail.com>
References: <20220412220316.3876985-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96596

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emchr-are-C-APIs-not-C-std-namespace.patch | 45 +++++++++++++++++++
 .../parallel-deqp-runner_git.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-memmove-and-memchr-are-C-APIs-not-C-std-namespace.patch

diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-memmove-and-memchr-are-C-APIs-not-C-std-namespace.patch b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-memmove-and-memchr-are-C-APIs-not-C-std-namespace.patch
new file mode 100644
index 0000000000..2316c1ffdf
--- /dev/null
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner/0001-memmove-and-memchr-are-C-APIs-not-C-std-namespace.patch
@@ -0,0 +1,45 @@
+From 98bef35c010a9c7891634fe9bcc4b560abbcb4e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Apr 2022 11:29:50 -0700
+Subject: [PATCH] memmove and memchr are C APIs not C++ std namespace
+
+Fixes build error
+../git/src/deqp-runner.cc: In member function 'Line_reader::read_status Line_reader::read(char**, double)':
+../git/src/deqp-runner.cc:249:10: error: 'memmove' is not a member of 'std'; did you mean 'wmemmove'?
+  249 |     std::memmove(buf_.data(), buf_.data() + skip_sz_, valid_sz_);
+      |          ^~~~~~~
+      |          wmemmove
+../git/src/deqp-runner.cc:255:35: error: 'memchr' is not a member of 'std'; did you mean 'wmemchr'?
+  255 |   while (!(newline = (char *)std::memchr(buf_.data(), '\n', valid_sz_)) &&
+      |                                   ^~~~~~
+      |                                   wmemchr
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/parallel-deqp-runner/-/merge_requests/17]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/deqp-runner.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/deqp-runner.cc b/src/deqp-runner.cc
+index 1cc8a55..55a15f9 100644
+--- a/src/deqp-runner.cc
++++ b/src/deqp-runner.cc
+@@ -246,13 +246,13 @@ Line_reader::read_status Line_reader::read(char **text, double timeout) {
+ 
+   if (skip_sz_) {
+     valid_sz_ -= skip_sz_;
+-    std::memmove(buf_.data(), buf_.data() + skip_sz_, valid_sz_);
++    memmove(buf_.data(), buf_.data() + skip_sz_, valid_sz_);
+     skip_sz_ = 0;
+   }
+ 
+   char *newline;
+   bool end = false;
+-  while (!(newline = (char *)std::memchr(buf_.data(), '\n', valid_sz_)) &&
++  while (!(newline = (char *)memchr(buf_.data(), '\n', valid_sz_)) &&
+          !end && valid_sz_ + 1 < (int)buf_.size()) {
+     for (;;) {
+       struct pollfd p = {};
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
index 52723d7af1..eff6ad8f83 100644
--- a/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
+++ b/meta-oe/recipes-graphics/parallel-deqp-runner/parallel-deqp-runner_git.bb
@@ -3,6 +3,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f59d6446bf2e004e80df1a0937129fa"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/parallel-deqp-runner.git;protocol=https;branch=master \
            file://0001-meson.build-WORKAROUND-Remove-vulkan-dependency.patch \
+           file://0001-memmove-and-memchr-are-C-APIs-not-C-std-namespace.patch \
            "
 
 # Modify these as desired
-- 
2.35.1


