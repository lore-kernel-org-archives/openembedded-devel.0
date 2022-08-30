Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A0BC0502C
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.8759.1661843669936443384
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n4IR2Yyf;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 76so10498755pfy.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vL6Phr2xG7yPq2zVj6Jd+5t1UBzmfz9BViPRvSkbp3w=;
        b=n4IR2Yyfc33Xcp3AJdsIGv1ryL4vRq1RxEfL7DHxv+5Z4qsCyrxS64ER7fBC7ZXaw4
         BKhBhov7DJYylB8ljGoRcJI3DYmHEeGBXGu0iV/OYAtRd7TUUpQITHmuWnRsUaQaB0vh
         X+pWw+Yp25ztqjEw/IX4u0HUKWkosrKh/iKeDEdiJu+udr0klaJ4JB1ffWOMjWHd3PXn
         IQr7d+pqEgYFSkTTUUeQh+QtTbNulJQp7NNswJVpT3tvPWZLaO6zrhUCKgzNnZ4i/X3u
         FxRJjzIHzGPonb2tl4jbfTT1mAJ4mC0mjMmuy3VW0XgQCDYXpxX7Pt2apfE/kiY0cmkK
         vV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vL6Phr2xG7yPq2zVj6Jd+5t1UBzmfz9BViPRvSkbp3w=;
        b=C2x1lF3aCQUfC3V72i8Rf/MuqB9LlwyGKgQPfyZcGz/Y9P/nYw9bIWa5OMbR/budKH
         Gh++NOlhcu3OsHFyO0X9b4Ktz1s1hBCyCbIXH87JfI0PC8AlRgkpLs0s4Ca0mdFX86+t
         e5SC5fiU3WJkOMwwYO+E8jGVOSrfbrpzvZtN6Xed3/97MAcqZshaDpFxNryL7pGTt7i5
         HTZcS+qMvfVwVkV2FgM/+YYpFcMAFsZvl4VPtYEhwTvxnsa6lOLUZrqMzaHak5OvLBeL
         Fa7VFgxiThLnMEdFy+dQ67O2KfvUpRisGkdFcv92jm3RmA5qfLAtRMF5qod7IhupnTjH
         vu2w==
X-Gm-Message-State: ACgBeo077Cxfx5dC0rbINRA/uvhIR2WcVBcEgpkF+Plo2b/On6Q/2mKu
	h2Yoi3BJAhbTHlQZ5pvCPl369Zw4uRDIPg==
X-Google-Smtp-Source: 
 AA6agR53f/g/KNKF+QpRMfFOQoRGcFH187mMoSfj6wW50JSX/hD6r8eovNJJvRbE/NTA+uT0yYroGA==
X-Received: by 2002:a63:4a47:0:b0:42b:e4a4:3aec with SMTP id
 j7-20020a634a47000000b0042be4a43aecmr9111737pgl.512.1661843669074;
        Tue, 30 Aug 2022 00:14:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 15/21] linux-atm: Include missing string.h
Date: Tue, 30 Aug 2022 00:14:07 -0700
Message-Id: <20220830071413.3887189-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98552

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-from-memcpy-and-strcpy-function-pro.patch | 87 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  3 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch
new file mode 100644
index 0000000000..81c5efd173
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch
@@ -0,0 +1,87 @@
+From 5217cb7c829cf87771096c4ce41fd4648dca47cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 16:36:21 -0700
+Subject: [PATCH] include string,h from memcpy and strcpy function prototype
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/led/address.c  | 1 +
+ src/led/display.c  | 1 +
+ src/lib/unix.c     | 1 +
+ src/maint/hediag.c | 1 +
+ src/sigd/kernel.c  | 1 +
+ src/sigd/policy.c  | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/src/led/address.c b/src/led/address.c
+index 574e881..b5c5fbb 100644
+--- a/src/led/address.c
++++ b/src/led/address.c
+@@ -31,6 +31,7 @@
+ #endif
+ 
+ #include <sys/ioctl.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <errno.h>
+ 
+diff --git a/src/led/display.c b/src/led/display.c
+index d78a15d..b835e89 100644
+--- a/src/led/display.c
++++ b/src/led/display.c
+@@ -5,6 +5,7 @@
+ #if HAVE_CONFIG_H
+ #include <config.h>
+ #endif
++#include <string.h>
+ 
+ #include <atm.h>
+ #include <atmd.h>
+diff --git a/src/lib/unix.c b/src/lib/unix.c
+index 34aa465..d5bef54 100644
+--- a/src/lib/unix.c
++++ b/src/lib/unix.c
+@@ -8,6 +8,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <errno.h>
+ #include <sys/types.h>
+diff --git a/src/maint/hediag.c b/src/maint/hediag.c
+index 8a4312a..a4f792f 100644
+--- a/src/maint/hediag.c
++++ b/src/maint/hediag.c
+@@ -1,5 +1,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+diff --git a/src/sigd/kernel.c b/src/sigd/kernel.c
+index 9ee74b1..2491626 100644
+--- a/src/sigd/kernel.c
++++ b/src/sigd/kernel.c
+@@ -8,6 +8,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <errno.h>
+ #include <assert.h>
+ 
+diff --git a/src/sigd/policy.c b/src/sigd/policy.c
+index 2cfb42d..87223a7 100644
+--- a/src/sigd/policy.c
++++ b/src/sigd/policy.c
+@@ -6,6 +6,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <string.h>
+ #include <atm.h>
+ #include <atmd.h>
+ 
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index bb79b78568..70125102cd 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -14,7 +14,8 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
            file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
            file://0001-make-Add-PREFIX-knob.patch \
-"
+           file://0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch \
+           "
 
 SRC_URI:append:libc-musl = " file://musl-no-on_exit.patch"
 
-- 
2.37.2


