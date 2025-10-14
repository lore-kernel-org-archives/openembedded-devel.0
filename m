Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA248CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.363.1760475270319474835
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TirFsPXU;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2681660d604so63456995ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475269; x=1761080069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZEJiuVWMeJJ8+CxKPDlfL4j+5gm619xbbXYX8LZH98=;
        b=TirFsPXUDH7/xd+y7gokCyYoDz8Sw44GKqdw2+2GSmvD8QsDTtE9d/Xioq3eGFDcLH
         t29FwqZwLk5Cn8CZ4K1rV899qxANAgxMl7LqmdLjk2Mr6EyWnUDOOzQAvjdbIuq/CG6c
         m+iE0tdFkRAw1HDrNfEzpf2/dMy3WBnt6uxVZBqrobDivVomRpKwPzFq9ddXUlB1tx5F
         OnTN7GCLNqAitRGiN/pUcZUn98dneVAmWtyjYX2XerQgdWTOhgoMqjrHgC7+vZdvKtH1
         PR3i7fykMHoBWsa4ED1h09SALlo/SRGOUwU4CC8M+nbSTPON1Ur3bHEgjME7X4uqoDh0
         sHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475269; x=1761080069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZEJiuVWMeJJ8+CxKPDlfL4j+5gm619xbbXYX8LZH98=;
        b=m5bBU6Lkuaih0DMq1WDY3893nFcgQ9E62lCT/OcPNFr7NmneV9lsBo8qT71ahAXjQa
         dxrCUxBJQOVazed8Bth2RsAiLYaompkWd3ta6Kqwi/LqIZCE4RDFcZ5Zp6Tb/sel5HKY
         ttl4OOA0x0fl/GKUuK/e5xBrCT6680+2izGSNrM0FOhUIAXakVbYChKl4ZM0BADjJJGG
         2XV4ycK/QfPRt6GI7cxHg9d+/GLH3NJrwhF1q/tdmGvRurTeQDlZfKXqubxVHiUDWzGv
         hsr5UCrwL2eZu6Kmhiqzxur/asHPkTqamY2ygYsdkSZCq4qelOFlZYwvcmrjdogbQDNj
         fjKA==
X-Gm-Message-State: AOJu0YztOf5UTdaqox6KhJ0VBhxnLpaCKWok5Q4Ais90xPj+5MzMLI1W
	RGWgqf7ZjaYfeXhz3uBAPZxldxYUMjVjGVkVDLo2WMhnYvE3Csx7v+6RKb9LkA==
X-Gm-Gg: ASbGncvnD9uVjoA+yI4fdLC8UjyhGZrqf9fXAQJohciM4oxH4pW1YW6B3n+mcOPnN3w
	RmXob8ILMxPFTA/mbPHVA98huI2t7V2JST9I5+AVcg+BYYOrMJBD1WO3NY/pQZ+X983MriL0lCt
	4jRcR5JcnWLT/vaVGkivjUnWSIQmUfzy31VZYBUvrpryfKTDpHVLP048xrMGHJRwbafP+vqEffA
	IPYbXqdPg7L/xtg1fWuogRkfNo0IzCC0lXwPvYqrCJyoKiSOXMikvEcot20FdlE/HabTDjTPkRi
	Ddpw3OTpQIPXwlDx1cr6WgSUdTSenY7YK0D5YWVjrP2Du5S51GLAG8liBucK8XhTID2wPqUnXDl
	dmwJ61r3s97JIJbq+qvG+ETdR4kS34S8jcDCAqpR/o9SimLeT4mDhakQ=
X-Google-Smtp-Source: AGHT+IHfgnVac4wL0JNz3GHGvg6X8U23UpWrimIFRu/aa7fWGr3HaHydOt5Mgz00KM1UJfWbaDNrkA==
X-Received: by 2002:a17:903:246:b0:27b:defc:802d with SMTP id d9443c01a7336-290272b537bmr335063795ad.28.1760475269566;
        Tue, 14 Oct 2025 13:54:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:29 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 09/18] libraw: patch CVE-2025-43963
Date: Wed, 15 Oct 2025 09:53:52 +1300
Message-ID: <20251014205402.1487867-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120642

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

