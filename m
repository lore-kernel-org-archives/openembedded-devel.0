Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C643AC636D7
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 02:13:45 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.25723.1676772822839869669
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 18:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nx9gdlsk;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id gt5-20020a17090af2c500b00233d7314c1cso1716006pjb.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 18:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZZePvz2IRub1gk8NkWccZH6fyvLMPPEInujsZ9ymcw=;
        b=Nx9gdlskP0dcCLwHHSI7Y1uYUsZyXmW58kp0rUZq/9Ckzd6mYPtYIDqguHQ6QS1qyi
         YzYjbv7Qp/Nw8S8UKrHvyYgG+nGi+ENsdtsX+PF/TstjEXKeXp/M8npjJAEqXadS6dbS
         kXBrkud3EUir5SI49XEWdplAQ6mG19ts+ETTNJQSlp0yspZP+09YGCbKPIvnVb1pV+HU
         LiNf6BIVCGdW4H+g+xfHyLaCeWe6F48Tub9I1bTTyjh5NDcgRdW6I9pi4M/64dga0tpg
         Px7pbLsWtQFDG1CLL6O9n84+wK/S0Wsra6t+Felw5fiEethob6uE62sQw2XYsGLQmlPW
         eVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZZePvz2IRub1gk8NkWccZH6fyvLMPPEInujsZ9ymcw=;
        b=sYt3/O5GqyKgyGpFNxdkABHrq0hXQJvv0Uxkqf9lP1Ekxf7ySxkKJXTOgJaUWz7KIM
         PrtxKcMU6f5qvFT4a6vTRRfuGE5fS20KvEuzVMsqIwlz1AbE9AkU9o4x+4+GZ2trLQUq
         FgZRq6FZQ1VdZmExL9A4ysyIhSn8CjvGn6DTcOaUZIy0BuBcIlx2qUzXEEOH4szJ25M2
         qhL8GOviVwfGCGjqneQCd/3hoMOxOJplnNAb1YxE5AsaMkCIw3XR38XRt8XegMhSE42M
         CWdJGl+kepKXba78eQM9ij3/GCLwBRme8HLcnDKT89DVgKYAx/CNfssV6P7q4qHFf+H7
         H5/g==
X-Gm-Message-State: AO0yUKVYSjkbBcGu1ViWzGA+aLkAvcCnL4LZGboQPU74l+otIqGXnx6h
	ppk+fWUtt5a1JrJuo/w4M0RjFQU1zaw=
X-Google-Smtp-Source: AK7set/drHzUFT6TjipxdEQ48ZEkSgoGmTFENTbnQre3sDDKNeRnZiYkn9njhj0KOOXlLhG+PwC9bg==
X-Received: by 2002:a17:902:e5c4:b0:19a:b4f1:a847 with SMTP id u4-20020a170902e5c400b0019ab4f1a847mr2680883plf.8.1676772821897;
        Sat, 18 Feb 2023 18:13:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::112a])
        by smtp.gmail.com with ESMTPSA id p22-20020a170902a41600b001966d94cb2esm701087plq.288.2023.02.18.18.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 18:13:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] liburing: Update to latest tip of tree
Date: Sat, 18 Feb 2023 18:13:39 -0800
Message-Id: <20230219021339.3157586-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230219021339.3157586-1-raj.khem@gmail.com>
References: <20230219021339.3157586-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Feb 2023 02:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101150

Add a patch to fix build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-test-Remove-unused-linux-errqueue.h.patch | 47 +++++++++++++++++++
 .../recipes-support/liburing/liburing_2.3.bb  |  6 ++-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch

diff --git a/meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch b/meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch
new file mode 100644
index 0000000000..21aaf8d991
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing/0001-examples-test-Remove-unused-linux-errqueue.h.patch
@@ -0,0 +1,47 @@
+From 0fbcc44fe1fb2dc6807660b2cff1c2995add095b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 18 Feb 2023 18:01:22 -0800
+Subject: [PATCH] examples,test: Remove unused linux/errqueue.h
+
+This header is not needed therefore remove it, this cleanup also helps
+compiling on musl/clang
+
+/usr/include/linux/errqueue.h:57:20: error: array has incomplete element typ
+e 'struct timespec'
+        struct timespec ts[3];
+                          ^
+
+Upstream-Status: Submitted [https://github.com/axboe/liburing/pull/798]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/send-zerocopy.c | 1 -
+ test/send-zerocopy.c     | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/examples/send-zerocopy.c b/examples/send-zerocopy.c
+index 6092af9..cf1fa8b 100644
+--- a/examples/send-zerocopy.c
++++ b/examples/send-zerocopy.c
+@@ -13,7 +13,6 @@
+ #include <string.h>
+ 
+ #include <arpa/inet.h>
+-#include <linux/errqueue.h>
+ #include <linux/if_packet.h>
+ #include <linux/ipv6.h>
+ #include <linux/socket.h>
+diff --git a/test/send-zerocopy.c b/test/send-zerocopy.c
+index 86a31cd..5d578c6 100644
+--- a/test/send-zerocopy.c
++++ b/test/send-zerocopy.c
+@@ -11,7 +11,6 @@
+ #include <string.h>
+ 
+ #include <arpa/inet.h>
+-#include <linux/errqueue.h>
+ #include <linux/if_packet.h>
+ #include <linux/ipv6.h>
+ #include <linux/socket.h>
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-support/liburing/liburing_2.3.bb b/meta-oe/recipes-support/liburing/liburing_2.3.bb
index b3da4d5e0e..ba9b7480ce 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.3.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.3.bb
@@ -9,11 +9,13 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only | MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=2b0e9926530c269f5ae95560370195af"
 
-SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https \
+           file://0001-examples-test-Remove-unused-linux-errqueue.h.patch"
 SRC_URI:append:libc-musl:riscv64 = " file://0001-do-not-build-examples.patch "
 SRC_URI:append:libc-musl:riscv32 = " file://0001-do-not-build-examples.patch "
-SRCREV = "4915f2af869876d892a1f591ee2c21be21c6fc5c"
+SRCREV = "f5cac78e621ab452d3035902085f66d2bf73243b"
 
+PV .= "+2.4+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 DEPENDS:append:libc-musl = " libucontext"
-- 
2.39.2


