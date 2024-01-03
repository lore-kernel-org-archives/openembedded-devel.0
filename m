Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F486C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 17:37:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.23396.1704303470585948595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 09:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efg6EDMq;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d4c91a9adcso1905045ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 09:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704303469; x=1704908269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbeyAMdAGYu5wO2Y2C1ZC2oYmFNtq76UzhPgmGbJ0MQ=;
        b=efg6EDMq1mF7dZE1OpDOgPRJPplKK4breq5AUA/W3hfYD8MqoktPkX8bacggzDVNta
         KFjuw1SKt0aeriiItFHGfiuWHZxhySGd+B9qNPcpcKYr+RTCQIN5SebTCiI32xNvwduO
         oKzBX8mMEfyrPTtrUfW/undIXL1KLHK6I22Y8txnbWn31lmm5cigKgIwBt9Ug/OQTRKt
         OsucjwZQp2YF6IwKXzPmlXmRk8jPyfezzuT2iLW+nbkVdsbEe1CdgIn5vhw8cPT+Nxou
         tF7Bb4C1Sf0jX/0T9h3TigViQIrnPa1aykuPnhZOjrmHE8aZSbAdLnzCNcYOVFx6VzIE
         /qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704303469; x=1704908269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbeyAMdAGYu5wO2Y2C1ZC2oYmFNtq76UzhPgmGbJ0MQ=;
        b=d8sR8/ZOP6q9kldUW1fAPlNHpJMLKmLnJEq5UHDJJUFsWCz+MUmMHQ7pyHroH/CrEk
         xGYo+NzqpOoTjrhNWmqU1JJorUi2HkclHhxopf7nlLAk/rM+5pzkCys5zdqwJh8kY+9s
         Qf6D1RK+cfAGbyRDJXZhDTk2FASumkhqkDGmtr0Q99UymXzeNgq4hl35DvZy0fyEVdFX
         gS5dsuUV0vFhm8q7Y6ciyk1fRhWRp7D2lUhSv/DCjDezwJcG7Itp2dJ/VreMCtG49B57
         1Hs/2rPWIIMWNWyPC7/fkwQ44lgAKAVeNunzTtLeInDs6hiYOS1pzC18cCQG49eSzzSy
         R6VQ==
X-Gm-Message-State: AOJu0YyL1r4oX/Z8d9LrbuW4xe+Lwv59QCH4BzIe1lb+bq7MLDSNK7kb
	DumOzQe5VOUO0dhh1t08fZI5LRlpt5U=
X-Google-Smtp-Source: AGHT+IFop2D5w+Uul0uFE5+VwOX5EExPG/HgjiuoXsYTmczRtfuWJsOKITy/rmoVjQigM6flchtgxw==
X-Received: by 2002:a05:6a20:5152:b0:195:5a8e:cac8 with SMTP id b18-20020a056a20515200b001955a8ecac8mr31953475pzc.6.1704303469574;
        Wed, 03 Jan 2024 09:37:49 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:eaf1:ea0b:ed94:6b4f])
        by smtp.gmail.com with ESMTPSA id a23-20020aa78657000000b006d9b8e1971dsm17130210pfo.191.2024.01.03.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 09:37:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] picocom: Update to 2023-04
Date: Wed,  3 Jan 2024 14:37:42 -0300
Message-Id: <20240103173742.1834490-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 17:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108035

From: Fabio Estevam <festevam@denx.de>

Update to the 2023-04 version.

Use the the new upstream repository and drop the fix that
has been upstreamed.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Also update SRCREV.

 .../picocom/0001-Fix-building-with-musl.patch | 118 ------------------
 .../recipes-support/picocom/picocom_git.bb    |   9 +-
 2 files changed, 4 insertions(+), 123 deletions(-)
 delete mode 100644 meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch

diff --git a/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch b/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
deleted file mode 100644
index c6b01d06fc36..000000000000
--- a/meta-oe/recipes-support/picocom/picocom/0001-Fix-building-with-musl.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 9664809da36bd7bada3e44f50cfc042539fb61ee Mon Sep 17 00:00:00 2001
-From: Paul Eggleton <paul.eggleton@linux.intel.com>
-Date: Sun, 14 Jul 2019 19:13:21 -0700
-Subject: [PATCH] Fix building with musl
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- termios2.c | 27 +++++++++++++++++++++++++++
- termios2.h |  5 +++++
- 2 files changed, 32 insertions(+)
-
-diff --git a/termios2.c b/termios2.c
-index 97c3be0..88ff6fc 100644
---- a/termios2.c
-+++ b/termios2.c
-@@ -37,6 +37,7 @@
- #include <errno.h>
- #include <termios.h>
- #include <sys/ioctl.h>
-+#include <asm/ioctls.h>
- 
- /* Contains the definition of the termios2 structure and some related
-    constants that we should normally include from system
-@@ -53,6 +54,10 @@
- */
- #define IBAUD0 020000000000
- 
-+#if !defined(__GLIBC__)
-+#define __MAX_BAUD B4000000
-+#endif
-+
- int
- tc2setattr(int fd, int optional_actions, const struct termios *tios)
- {
-@@ -79,8 +84,13 @@ tc2setattr(int fd, int optional_actions, const struct termios *tios)
-     t2.c_cflag = tios->c_cflag;
-     t2.c_lflag = tios->c_lflag;
-     t2.c_line = tios->c_line;
-+#if !defined(__GLIBC__)
-+    t2.c_ispeed = tios->__c_ispeed;
-+    t2.c_ospeed = tios->__c_ospeed;
-+#else
-     t2.c_ispeed = tios->c_ispeed;
-     t2.c_ospeed = tios->c_ospeed;
-+#endif
-     memcpy(&t2.c_cc[0], &tios->c_cc[0], K_NCCS * sizeof (cc_t));
- 
-     return ioctl(fd, cmd, &t2);
-@@ -101,8 +111,13 @@ tc2getattr(int fd, struct termios *tios)
-     tios->c_cflag = t2.c_cflag;
-     tios->c_lflag = t2.c_lflag;
-     tios->c_line = t2.c_line;
-+#if !defined(__GLIBC__)
-+    tios->__c_ispeed = t2.c_ispeed;
-+    tios->__c_ospeed = t2.c_ospeed;
-+#else
-     tios->c_ispeed = t2.c_ispeed;
-     tios->c_ospeed = t2.c_ospeed;
-+#endif
-     memcpy(&tios->c_cc[0], &t2.c_cc[0], K_NCCS * sizeof (cc_t));
- 
-     for (i = K_NCCS; i < NCCS; i++)
-@@ -131,7 +146,11 @@ cf2setispeed(struct termios *tios, speed_t speed)
-         errno = EINVAL;
-         return -1;
-     }
-+#if !defined(__GLIBC__)
-+    tios->__c_ispeed = speed;
-+#else
-     tios->c_ispeed = speed;
-+#endif
-     tios->c_cflag &= ~((CBAUD | CBAUDEX) << IBSHIFT);
-     tios->c_cflag |= (speed << IBSHIFT);
- 
-@@ -156,7 +175,11 @@ cf2setospeed_custom(struct termios *tios, int speed)
-     }
-     tios->c_cflag &= ~(CBAUD | CBAUDEX);
-     tios->c_cflag |= BOTHER;
-+#if !defined(__GLIBC__)
-+    tios->__c_ospeed = speed;
-+#else
-     tios->c_ospeed = speed;
-+#endif
- 
-     return 0;
- }
-@@ -177,7 +200,11 @@ cf2setispeed_custom(struct termios *tios, int speed)
-     } else {
-         tios->c_cflag &= ~((CBAUD | CBAUDEX) << IBSHIFT);
-         tios->c_cflag |= (BOTHER << IBSHIFT);
-+#if !defined(__GLIBC__)
-+        tios->__c_ispeed = speed;
-+#else
-         tios->c_ispeed = speed;
-+#endif
-     }
- 
-     return 0;
-diff --git a/termios2.h b/termios2.h
-index e13b0e3..63dd0ce 100644
---- a/termios2.h
-+++ b/termios2.h
-@@ -37,8 +37,13 @@
- /* And define these new ones */
- #define cfsetospeed_custom cf2setospeed_custom
- #define cfsetispeed_custom cf2setispeed_custom
-+#if defined(__linux__) && !defined(__GLIBC__)
-+#define cfgetospeed_custom(tiop) ((tiop)->__c_ospeed)
-+#define cfgetispeed_custom(tiop) ((tiop)->__c_ispeed)
-+#else
- #define cfgetospeed_custom(tiop) ((tiop)->c_ospeed)
- #define cfgetispeed_custom(tiop) ((tiop)->c_ispeed)
-+#endif
- 
- /* Replacements for the standard tcsetattr(3), tcgetattr(3)
-  * functions. Same user interface, but these use the new termios2
diff --git a/meta-oe/recipes-support/picocom/picocom_git.bb b/meta-oe/recipes-support/picocom/picocom_git.bb
index 55dc292710b1..4ec256bb9994 100644
--- a/meta-oe/recipes-support/picocom/picocom_git.bb
+++ b/meta-oe/recipes-support/picocom/picocom_git.bb
@@ -1,16 +1,15 @@
 SUMMARY = "Lightweight and minimal dumb-terminal emulation program"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-or-later"
-HOMEPAGE = "https://github.com/npat-efault/picocom"
+HOMEPAGE = "https://gitlab.com/wsakernel/picocom"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000e4830620e310fe65c0eb69df9e8a"
 
-BASEPV = "3.1"
+BASEPV = "2023-04"
 PV = "${BASEPV}+git${SRCPV}"
 
-SRCREV = "90385aabe2b51f39fa130627d46b377569f82d4a"
+SRCREV = "12537df0314767d5af35bddddbbca3694e6a0342"
 
-SRC_URI = "git://github.com/npat-efault/picocom;branch=master;protocol=https \
-           file://0001-Fix-building-with-musl.patch \
+SRC_URI = "git://gitlab.com/wsakernel/picocom;branch=master;protocol=https \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1



