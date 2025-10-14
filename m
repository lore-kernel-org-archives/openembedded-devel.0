Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFD4CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:18 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.3571.1760484790976159989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQ595bdg;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3322e63602eso7858608a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484790; x=1761089590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZEJiuVWMeJJ8+CxKPDlfL4j+5gm619xbbXYX8LZH98=;
        b=KQ595bdgjpQi4zsO8n7kP4zo3Ozb8jFFvhGCAJzYesYvLs9rwQ7Fa2HWVTMYVEFUkb
         SMDuaF5Nh60Qw/KEqeKYAYm6Wr0dfQGoOABltVS0JI5nes4wpM9Vi8IfAMQapPWwLYmP
         O+77goTsvEVP8A95La+Zy4YmaR7o5P7v0/WpSo6Ps+FckfIsH0PLdgJv4+nIyiJJID0B
         0BTWqbf7rG6+WP8BHUUw7IDaElYxtmznCPsY2zxKKLDP/vI9hQNqZFF1WOQXPkNpA0rl
         h0br+zvPbb3Rvlt7obay2l2xNk4MouTS8f3mSokdHvAJWWey/WJEE6dHp8/Fqiidb95f
         Xgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484790; x=1761089590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZEJiuVWMeJJ8+CxKPDlfL4j+5gm619xbbXYX8LZH98=;
        b=dgzycREzEaK0qlv7z8ngE6B7HvI1EcWnfCjWoU/GLKPQ0m/Mi3XuNir0PDy4UqL8B+
         BT0wu3tiPP7IQ+Wa4S3HUz1mKUNaKQghZlUpy9DOS7+ec8U0U0YaPrsAFs6OepgyGjk5
         eNyBNI0Nsldz6L5fuFjijI+IGDwCKXupI9L9vT1TBSHUgwYqUb1SS8uKICxPIQkB2K+j
         oy7ILhXyMkQiTHmLqbbPdawqM1nq0YY05HV2b5TSPwtoMODCj8IbW0vA8c4IQ8skgMek
         2jqaMWXm1ouGuQ37bJS2ZM3VPkRMc35NFIWAoNzu6wlf6JFo1c/qex80r84c3WiINnQO
         U6AQ==
X-Gm-Message-State: AOJu0Yzyi1QVo9RArNCG5z23s/banSckbS6OSHS5ihYFALNPaifj+u5N
	k3lKbmK6Ep3fYhzfKqLMctp03kjXTSMxjsc8ssLkmHRbMyIiLoDxoZNhcOoUlA==
X-Gm-Gg: ASbGncsPsi3xdUFl4Gs9crcDhfFUuDKP9UJ8g3f0PBFXfjnTPkhdg63aX+YgshpFkL7
	B5+/tAlroCV3vZez5ybYnY+8OZR+Hyh5wsDAvyBA1FaosAwUNHJ5gx/o0N8H/l3h+Mwa65aquHE
	i9aRxNoF47ZbdrEuAimQbRFgztXDwizItbSaFP5BTgKoJvT6mymcTMx8yUbI3nwdxErdTUBjfXy
	z6dAnDKIRo6eynTp54sMjxaYqte4hFK3Ey9kvZjJyUPGO6U19ygGRkEUU7hLBOjsucoGuW3X61z
	2CGP8wjfIe/q1igm0j+JaBLGALRUXnddmO9AzIg3CNtuSn7JeiFO2ZOUH2UTD5ZsvpxFyq5exJ0
	XVhm2X8yKA5BVRwLf3FeSGgB6CTuJ7lnWXJH61DHEgJ9u4JF6PZ8aDCKwwDnhL8nFjg==
X-Google-Smtp-Source: AGHT+IEuKuRBydijLORj7lrpulSui3ZGSuSKzAgHogPkt/xQ/3RXqyhd2Ruaage9rm6SnT5qTKEWbQ==
X-Received: by 2002:a17:90b:4d08:b0:330:793a:4240 with SMTP id 98e67ed59e1d1-33b513ced41mr34845731a91.31.1760484790184;
        Tue, 14 Oct 2025 16:33:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:09 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 09/18] libraw: patch CVE-2025-43963
Date: Wed, 15 Oct 2025 12:32:20 +1300
Message-ID: <20251014233233.304125-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120668

Details https://nvd.nist.gov/vuln/detail/CVE-2025-43963

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 287ed36b866adf46b0ec6245947da64531a98fa2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/libraw/0002-CVE-2025-43963.patch   | 40 +++++++++++++++++++
 .../recipes-support/libraw/libraw_0.21.2.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch

diff --git a/meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch b/meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
new file mode 100644
index 0000000000..d571164781
--- /dev/null
+++ b/meta-oe/recipes-support/libraw/libraw/0002-CVE-2025-43963.patch
@@ -0,0 +1,40 @@
+From 975393c804bc321fd4bc709c3c221733dac2d80a Mon Sep 17 00:00:00 2001
+From: Alex Tutubalin <lexa@lexa.ru>
+Date: Thu, 6 Feb 2025 21:01:58 +0300
+Subject: [PATCH] CVE-2025-43963
+
+check split_col/split_row values in phase_one_correct
+
+CVE: CVE-2025-43963
+Upstream-Status: Backport [https://github.com/LibRaw/LibRaw/commit/be26e7639ecf8beb55f124ce780e99842de2e964]
+
+(cherry picked from commit be26e7639ecf8beb55f124ce780e99842de2e964)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/decoders/load_mfbacks.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/decoders/load_mfbacks.cpp b/src/decoders/load_mfbacks.cpp
+index 1a1bdfb3..f89aecce 100644
+--- a/src/decoders/load_mfbacks.cpp
++++ b/src/decoders/load_mfbacks.cpp
+@@ -348,7 +348,8 @@ int LibRaw::phase_one_correct()
+           off_412 = ftell(ifp) - 38;
+         }
+       }
+-      else if (tag == 0x041f && !qlin_applied)
++      else if (tag == 0x041f && !qlin_applied && ph1.split_col > 0 && ph1.split_col < raw_width
++		&& ph1.split_row > 0 && ph1.split_row < raw_height)
+       { /* Quadrant linearization */
+         ushort lc[2][2][16], ref[16];
+         int qr, qc;
+@@ -432,7 +433,8 @@ int LibRaw::phase_one_correct()
+         }
+         qmult_applied = 1;
+       }
+-      else if (tag == 0x0431 && !qmult_applied)
++      else if (tag == 0x0431 && !qmult_applied && ph1.split_col > 0 && ph1.split_col < raw_width 
++		&& ph1.split_row > 0 && ph1.split_row < raw_height)
+       { /* Quadrant combined - four tile gain calibration */
+         ushort lc[2][2][7], ref[7];
+         int qr, qc;
diff --git a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
index c6d9acb960..d4750630e0 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
 SRC_URI = " \
     git://github.com/LibRaw/LibRaw.git;branch=0.21-stable;protocol=https \
     file://0001-CVE-2025-43961-CVE-2025-43962.patch \
+    file://0002-CVE-2025-43963.patch \
 "
 SRCREV = "1ef70158d7fde1ced6aaddb0b9443c32a7121d3d"
 S = "${WORKDIR}/git"

