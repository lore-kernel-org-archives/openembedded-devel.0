Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BA8C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 17:28:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.23157.1704302896876184730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 09:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cn6LlzZO;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d4c91a9adcso1890785ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 09:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704302896; x=1704907696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2XhRG8fx4FRHXPnAkx1rRrcs1scElJNVFS+0rJSNgc=;
        b=Cn6LlzZOQ/HMABkcoVbt6uPNMC0w2cyhfCup0PovdDCtrG4JYTJxOuYn0nIKYg8lMS
         goFWcTLKx673fXp0Gw09dJzAjfjwCs2iL9tw33ydketzTNqhg7P/N2oAiUHRP7zq15sm
         irAPpGF+ZZ2EnyZ+eZKX61qQyvMFF+iNsykFlquYmsS6OtRKXUYBOLXqbOhFbLLyIs0H
         LyT18bbsI44TfVdgKAL1ThTAk6q0FSJ8BV8Nz76BGdwtaLFmqtQbyqRtbq/Q6Ukny4A5
         I8D+7S5xRj3he8El/82NJYPzlUfcQVtJPSlqEUCBcbM/WPc5VFUkA5Qsad9B/EgCuNgH
         7soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704302896; x=1704907696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2XhRG8fx4FRHXPnAkx1rRrcs1scElJNVFS+0rJSNgc=;
        b=VxopPILG1bzUH8GW6BqOeDfZq4D/wGlMvoMgTputg0TWd8PJpmDSz6eXvFrIpVEaRK
         RmhjNTfEJQm0rauNCiFxi0dV41jHNd35d1IZUmDAt0mZqZaUuBBi2YGnTLl4/Ime1acs
         MSH17/Jrt/3hJT/iVEpneO1wV1IAlh2qXd6cYw+RWDWR9D3OJ4m9/oLxa1w0R14RsiSg
         0v+5N5w7jSurA6nxtUNjES9uUS9hQMEOjPIdIqzQcGv3ktFf9k54bt6O2cHmYY4hAW6D
         vZe/V3c75OEI9goPeNK+cqWkP8c78pUmkL0DcVaMGUozyJM0jKCQ+6zeuZO716/ti4F6
         Kv6g==
X-Gm-Message-State: AOJu0YxSVLaxty8LtyKm0NLLgyh94TtvEinl89ZZfcQbMPoiUkzjZBJ/
	00G3BbDorK09/mlV7RI3Zrnimahbkik=
X-Google-Smtp-Source: AGHT+IFFGJx7BbsLlmfK8eI3vnhobolurial/noFuirY/Ot/nRs678xTiyZlsrmdi54oqBcqrb2TWw==
X-Received: by 2002:a17:902:7604:b0:1d4:3abc:29e2 with SMTP id k4-20020a170902760400b001d43abc29e2mr35260333pll.0.1704302896029;
        Wed, 03 Jan 2024 09:28:16 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:eaf1:ea0b:ed94:6b4f])
        by smtp.gmail.com with ESMTPSA id jv5-20020a170903058500b001cc2ebd2c2csm24159075plb.256.2024.01.03.09.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 09:28:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] picocom: Update to 2023-04
Date: Wed,  3 Jan 2024 14:28:10 -0300
Message-Id: <20240103172810.1833032-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 17:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108034

From: Fabio Estevam <festevam@denx.de>

Update to the 2023-04 version.

Use the the new upstream repository and drop the fix that
has been upstreamed.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../picocom/0001-Fix-building-with-musl.patch | 118 ------------------
 .../recipes-support/picocom/picocom_git.bb    |   7 +-
 2 files changed, 3 insertions(+), 122 deletions(-)
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
index 55dc292710b1..c46531af01fd 100644
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
 
 SRCREV = "90385aabe2b51f39fa130627d46b377569f82d4a"
 
-SRC_URI = "git://github.com/npat-efault/picocom;branch=master;protocol=https \
-           file://0001-Fix-building-with-musl.patch \
+SRC_URI = "git://gitlab.com/wsakernel/picocom;branch=master;protocol=https \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


