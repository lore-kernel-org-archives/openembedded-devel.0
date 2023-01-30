Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3656C636D6
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.34386.1675055358163514209
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gFcWCGu2;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id mi9so893796pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghBgzmzmXTGnBQwLKI/sbQARJcQGnnElh1J3IHecmD4=;
        b=gFcWCGu2FldWSHbgwJXSsYFCvxfhX3MOEO3xsvn6uLkh8eaqQdan5Qv4ovjGnuHSiF
         7zgHIXdSGP9HXAScXpl+VWtRpKtLd/WTlzhe1yYXLfISyAzRxfNplQOWi7iu9uO2elPS
         mEaMdAwwwIkrIxAHu3cpQc4Gipuun0PE4bt+ZT8BZPZzBMoI72VrM+AMRoeV9t9YV96y
         5gwYx/nbWpE5woclNlatb4M8TVhgukNlml6u8kv92ys8QckeQQo5TLu02p6cE3eeEZy3
         zoVswI/439pdhYrEjYg6z5281JAMoOJPS3hnLCsv5OlGHozXpXGpKNjX8HqJnkQOYJzT
         USWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghBgzmzmXTGnBQwLKI/sbQARJcQGnnElh1J3IHecmD4=;
        b=alj79HWKz478TNK9xNFu8gM/Xf8T8SV8PsQ/L7jIggoe+w+lMiyeWNs+TTeWm5Ze55
         wgLtU6PxBjHR5LvMngzOSCJKUJJtLxGBbija4cZa6AytXBsJ9xzMuBzzlnl7ACfx3lb2
         6hD4QEE9OvbHhnvl+ngNRhrptch3MoTDPddVHMCZcohwvjqzD8ZxtledI6Jwya+Wrueq
         25gqOcADEZmwt8Rv7bLD5iR8RTtFaGPIzPal3jwIfr1RvlGp1EkDc5DwxfH7J4eyibc1
         Qt5i/3Oua7MoNxFiMyQkG55GODs9kWrEdBuUzvCgJB/+Omha5Ha1g0PwPsrYYTRx8wyq
         yPqQ==
X-Gm-Message-State: AO0yUKVeANYNT6uBeYVZHRSFloUNn73JVpnX3FLhtADinaY72VGkoqeJ
	2H8X2uKMaAmP/9mRuc8tQPuTRekBUwcNHg==
X-Google-Smtp-Source: AK7set83wayIlEyJlmDdowGpcvLJZVG74DO4xVG3KkAs6w7aTvpS01auXKVwdQg9npIRCE2bKDDvAQ==
X-Received: by 2002:a17:902:f34a:b0:192:7f35:90ed with SMTP id q10-20020a170902f34a00b001927f3590edmr5593965ple.11.1675055357321;
        Sun, 29 Jan 2023 21:09:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/12] breakpad: Fix build with gcc13
Date: Sun, 29 Jan 2023 21:09:04 -0800
Message-Id: <20230130050909.133727-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100851

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-gcc-13-cannot-use-uintptr_t-via-inc.patch | 30 +++++++++++++++++++
 .../recipes-devtools/breakpad/breakpad_git.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
new file mode 100644
index 0000000000..d6d326dd03
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
@@ -0,0 +1,30 @@
+From 7ea7ded187b4d739239f3ab7082fcd5a2ccc1eaa Mon Sep 17 00:00:00 2001
+From: mingtaoxt xt <mingtaoxt@gmail.com>
+Date: Wed, 19 Oct 2022 19:36:13 +0800
+Subject: [PATCH] mainline version gcc-13 cannot use "uintptr_t" via "#include <string>"
+
+Change-Id: I0049bb92658b4226e32783ad4d8271787deef5f3
+Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/3964166
+Reviewed-by: Mike Frysinger <vapier@chromium.org>
+
+Upstream-Status: Backport [https://chromium-review.googlesource.com/c/breakpad/breakpad/+/3964166]
+Signed-of-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/client/linux/handler/minidump_descriptor.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/client/linux/handler/minidump_descriptor.h b/src/client/linux/handler/minidump_descriptor.h
+index 4349b88f..d822c9d9 100644
+--- a/src/client/linux/handler/minidump_descriptor.h
++++ b/src/client/linux/handler/minidump_descriptor.h
+@@ -32,6 +32,7 @@
+ #include <assert.h>
+ #include <sys/types.h>
+ 
++#include <cstdint>
+ #include <string>
+ 
+ #include "client/linux/handler/microdump_extra_info.h"
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index c752a10083..d1d338c6a8 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=h
            file://mcontext.patch \
            file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
            file://0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch \
+           file://0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
            file://0001-Do-not-add-stack-pointer-to-clobber-list.patch;patchdir=src/third_party/lss \
-- 
2.39.1


