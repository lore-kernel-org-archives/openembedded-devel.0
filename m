Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3B0C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.21619.1635617180882972237
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YffCiULc;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 127so12411630pfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9I2ax8V7AOMQ8qmKwiN7JubcaqCSLprRs/ODom3F7rY=;
        b=YffCiULcQDnFNy/EC/xGyzQUDkkegh+t0msJhXK7rPa/x1y++p6POp8Pzm3ScLhNNt
         l506/qNKBWArg+G+N7Wsgrkv1VZX3zqwAKuGigadvuK/qdxCG1Vd3byW2njL29sYyyPe
         XjXn2nSV+OYfDH2Mjt2M2k9Y1576y57/uBUaF9VGejHrJxjSHl101WN7blJW9/pXSz2F
         eYMGY6nVsGjEjhFNoaVMEYAf0DuYzhMHbU4OtEKDSy3iwBcwHMLTxFWjsT9iGdAKETrj
         qQ2yTxpT+QsciDSQXahhbnD3KuugU43hozXT2eKtel7+0q2uUYtJc2XUOEidJIjDj4Zs
         xQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9I2ax8V7AOMQ8qmKwiN7JubcaqCSLprRs/ODom3F7rY=;
        b=YaWdNxxAwGi5MxaNbxKzDf5UUW/65khmk+trAUTK/wPOKT8z6YvQpOowwu8G8ApLhM
         5gryDooWixORd5Ze7omK0CVJtPWmhrt5ZVZAEuZtfrCUSS/sB31m0R7FdeAgx39ZbUr0
         3AMb/SW0UJxEaa1oYwiZVLtsA0/ZYm5zGnweWpKhmtxI7frmMkkj22p786URaBgLqwWp
         V4CSHQqOfdiq1gkcpBYO2aYGwlckoDkYydDZvzygUhj9Sceg3znT3vzcLksCX4StAZIq
         Iw1tZVF4c5vCojPuJYPceDgdlgeOgth24CeRoMV9DaxISVcWlOaLC0/MTuEPJ4DYGapV
         jl0Q==
X-Gm-Message-State: AOAM531YE5ZqBpfDJ3YE1tOcIO2//qaaz6KcWB5CqAU31rNvYoJJH39V
	8a9MnnVJm99hr5JdwvcZE3qeZf/a0fs=
X-Google-Smtp-Source: 
 ABdhPJy2Ww4i8EhgtHNM1Vpz+0AdG6N9f5JFqjaT31+xL8bhimln1ENgIyHwcLRhl/Lg18tJ+x67wA==
X-Received: by 2002:a65:6215:: with SMTP id d21mr14031537pgv.62.1635617180114;
        Sat, 30 Oct 2021 11:06:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/8] bitwise: Fix build with latest ncurses 6.3+
Date: Sat, 30 Oct 2021 11:06:11 -0700
Message-Id: <20211030180618.2200698-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93672

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/bitwise/bitwise_0.42.bb  |  1 +
 ...ormat-security-errors-with-mvwprintw.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch

diff --git a/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb b/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
index 04d4ca6e40..ebf4b3c5e6 100644
--- a/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
+++ b/meta-oe/recipes-extended/bitwise/bitwise_0.42.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://github.com/mellowcandle/bitwise/releases/download/v${PV}/bitwise-v${PV}.tar.gz \
            file://0001-makefile.am-Fix-build-when-build-dir-is-not-same-as-.patch \
+           file://0001-Fix-Werror-format-security-errors-with-mvwprintw.patch \
            "
 SRC_URI[sha256sum] = "d3d43cef47bf8f49e85f7ed381c3eaf1df921ca51805e0962f1a97a517e1d1d2"
 
diff --git a/meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch b/meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch
new file mode 100644
index 0000000000..ebcb0dd5ee
--- /dev/null
+++ b/meta-oe/recipes-extended/bitwise/files/0001-Fix-Werror-format-security-errors-with-mvwprintw.patch
@@ -0,0 +1,27 @@
+From 53237c103b06f58ad9c2ce3914fcc7fe73629f11 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 01:11:33 -0700
+Subject: [PATCH] Fix -Werror=format-security errors with mvwprintw()
+
+Here a non-constant is used as a format string which
+compiler complains about. Fix by using "%s" as format.
+
+Upstream-Status: Submitted [https://github.com/mellowcandle/bitwise/pull/49]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/interactive.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/interactive.c b/src/interactive.c
+index cce418a..2c0b152 100644
+--- a/src/interactive.c
++++ b/src/interactive.c
+@@ -114,7 +114,7 @@ void update_history_win(void)
+ 				break;
+ 			}
+ 
+-		mvwprintw(history_win, j, 2, history[history_pos - i].line);
++		mvwprintw(history_win, j, 2, "%s", history[history_pos - i].line);
+ 	}
+ 
+ 	if (g_has_color)
-- 
2.33.1


