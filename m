Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7B6C36005
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 18:03:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.125.1742580194942318591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 11:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJwTloJU;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225fbdfc17dso38908495ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742580194; x=1743184994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D72us7eOuSpH/gZJfY4af9yBrq/E+4BFlxNaDy7U8aE=;
        b=aJwTloJUJ/ZR9envfs2GbhknFkhr3W48CHuq3irv7KHXy3Njmpp+uwu4XMnhOYTSuW
         wI1cIwXJR14Tcjnnm5+2bZ7VOiTMKCMfvKZ1alP3yJiSq3DLgcB5Os7dH6VDVxI9BT+W
         om31K98AU2LwE6N99lIuqlap5xdP+P8iY/qaZufiMF2c/9ccleAz6XXfonvDbUOyGk1t
         CO+z0UGPCG970Q2/zFHoxY85M/TKB2F3gp+Pv4Xu/ghB5sIoCWSw6ckJ6h/4ajC4EqP4
         6aAYfBzervoVem1vBpdbX3MMotKGIg4ZeisKwvWZoVCnFi1BYJUafzp3TqjejxxaQP+H
         f2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580194; x=1743184994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D72us7eOuSpH/gZJfY4af9yBrq/E+4BFlxNaDy7U8aE=;
        b=YeZsOncsRgZPZTbGoFCtiBQMzLEUmYCNcj92gtii3W7XSwH+EDAzN350C9hnGjFilb
         Sq971srXzgm/9kiPYCYxfY3UbFfhZ2veUW0V5+qR81jQwfPbQu6niBgObvktCT2nCpur
         VJFo31VYtayJkeZh/m2fqFLLEhNevAu/qHhuAAhlEIy4fFcpL5J6tWti7L/peqheFoYS
         JIwFUo/0VKcoxBg7d8VvbhZuGa1mxmsRWtP3hbrncQzT6M4zovihO4FNEDHckmxf9A+i
         4CbfUexQVe5qimkby2MioKH8EsIiYiUjC8xsIAHalbqRQ6caTVzR3a2BLJCbVslWUsgh
         mREg==
X-Gm-Message-State: AOJu0YzlZziR+ewfndSTKIyxmw3JxDd/YP2PRWDI3UUOLDhqHSFxXTz8
	28Qeu2Zfwd0rt5E5tzAYecjBt9Msf9d6X6sowKvIaeQo7U4VS4KLwJZcvmA4
X-Gm-Gg: ASbGncu6VKgGouWabT+xHgQFdx2bCWZda3wjzDJlAXtePJaEHrWcdCOziE7HwAlA6Ef
	Cpoh6BpATqamno/g52gUqIm1HLzEcQMMNDEr1cvLNQoQWKB7I3iqQMUyr7X11NmjIUaFKMS2Ogf
	pe7XVdf+NuZCfu9SEZ/OG1Onb8LL6HXS7HTif4EBE9M4GAZKgUUqrRsiMhvYzi4G3xX8i1ZdDH7
	MLvkEIc1B7yALkGv9ox77/8doVwJC01smZqYB+487nkInBlQxUmdZNkuZZcx+1/hLXO/W0/HZfZ
	3wnkeE0GNXOqKvQfwFC6ORVWfOGEQQblYtYQg8aUdj3FQQs=
X-Google-Smtp-Source: AGHT+IHN8rtQnBnbaTdlySwackn560ob8pFq5pG8OK63GtSizR94VyfB19RPHox9+HVCIDntL7sWEA==
X-Received: by 2002:a05:6a20:2d24:b0:1f5:80a3:b006 with SMTP id adf61e73a8af0-1fe42f58220mr7386472637.21.1742580193991;
        Fri, 21 Mar 2025 11:03:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4c905sm2079807a12.66.2025.03.21.11.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:03:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] webkitgtk3: Fix build on RISCV32
Date: Fri, 21 Mar 2025 11:03:08 -0700
Message-ID: <20250321180308.1071453-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250321180308.1071453-1-raj.khem@gmail.com>
References: <20250321180308.1071453-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 18:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116191

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/webkitgtk3/sys_futex.patch         | 16 ++++++++++++++++
 .../webkitgtk/webkitgtk3_2.48.0.bb               |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch
new file mode 100644
index 0000000000..19d18dea88
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/sys_futex.patch
@@ -0,0 +1,16 @@
+Fix build on newer 32bit architectures with only 64bit time_t
+
+Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/angle/angle/+/6108397]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
++++ b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
+@@ -17,6 +17,9 @@
+ #        include <linux/futex.h>
+ #        include <sys/syscall.h>
+ #        include <unistd.h>
++#        if !defined(SYS_futex) && defined(SYS_futex_time64)
++#           define SYS_futex SYS_futex_time64
++#        endif
+ #    endif  // defined(ANGLE_PLATFORM_LINUX) || defined(ANGLE_PLATFORM_ANDROID)
+ 
+ #    if defined(ANGLE_PLATFORM_WINDOWS)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
index 10c2576407..291e922df0 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://no-musttail-arm.patch \
+           file://sys_futex.patch \
            file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \

