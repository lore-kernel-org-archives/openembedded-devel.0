Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B056ACEB2FC
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:18:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13938.1763230694448700282
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5AmvA5x;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso25078645e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230693; x=1763835493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVhwjOctpXnmXWjS5GU2u/0T43VaMuY7w++ucv3XM9w=;
        b=A5AmvA5xnf6IxpdLC9c1+Ct9uVzqVvwyiSXRCzCMw4jVeW7nopv7dD7rb0yEfjoAef
         xFKMK2mlsMYnOi37qCW1yf1K2hoJmfmGD7B1T+stKDRBvkbew7/KJHAaWAH/Dxd4xWLy
         sLynpKl5g9kXsvUoRzw41ddPHNuc9JcFnFhcXUq5oPh0chd6RFvNmmqr50casLLkKjXl
         +f3FtLwKzjSMQmpnwgXRXQO5P2l8kncjRzgRsMhzsJgI3xtUppgTtYsBVg4aa8hXbLyn
         nrr1CuAEc9GobLOs4CNpzJR1VO1BXfVUvJoC2SjAwH1scUwEcmQ+2DxkpqqBzMYFtyS8
         MnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230693; x=1763835493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GVhwjOctpXnmXWjS5GU2u/0T43VaMuY7w++ucv3XM9w=;
        b=pN6ixjn1niNWPfbtF6hVljC8n3sgJVIqxgF+xeOyVku8rK98IaVTAL7GXcD9ek4Ac/
         /Ut12618nhKVDs/WZDQHdkFLXTSoDGdJlxEjSG1desXySj3EB+YWHplqK/3NANYXEmXD
         6rpKjHilpHOtvMq9nwmj3D6Ql+JGLG/sJhRycXBgTZV4h83BW0yoGbqzOnUK1AH6vbue
         61c/ju6isa6LimQcV0ufvnUaoPRH/enq/wy3GXBHYaeO03vaNGZqegZ/pRtF9vH/P/om
         1GcIHzbI1OJSamfVP6X9p/pJkf9QIUxpm0ZSsKYs3mRma/o/xXktdRXGQw0J38/MgHIz
         ia1Q==
X-Gm-Message-State: AOJu0Yy63I2hcElIGHmEAuNdetIPxO1H0I33CpMf9k1rp95fwHmJqRgS
	x4ricjZFaehdd7MLMSIRyQUKPkdoRcrNn9T+fZmC7YI5RH9ttQt4QqzvjLp4AbYK
X-Gm-Gg: ASbGncvRThVF0Hvil9ATHpdwqScBm3516UPuuZiPrCeQ55BcMmoGDAcP/eFI/clBX04
	fqW/xl6qYTR4HeB9mROQYHlWuy5Nff2GJPxxjaADgjDciHWHE9Pl3k/Uaq15gmbppUi3uoPJOkv
	7H7bYcKCqdKP2KWR+pXQuGxbTuv/jJTIWEFYHM97+lHLbAZ4McO5qtFHk54/3tsAzAaSsxMPgKt
	YLFjJWJeFuIYDKoXbqPigWfSYMN8Tqp6L+Zxvbnq8Np7ytYmSuTyAsUMn0s5m9dIpC0ZpAwrj/C
	Gh+Iy7s+bAEbHP72XXOZUfz/FyCHpjaqg4JJuvBgu47nh745xYGmFlD/SKoXf19LHfveo6iRRpL
	CYOvfNtfi4Ca3FCekA1j/zShCMhxabOv40S7qwJQ8CkMXkvXoOVNX0J91Oz1BDBgSO8ve6QIYoH
	iXG2A5MHs+
X-Google-Smtp-Source: AGHT+IGA+qj9ppH/L076dqNlF4wNKS/s6skgGC2spJSZ6+Qq47mCmP9ZeR8flWBHfM7lnjzcl0F/OQ==
X-Received: by 2002:a05:600c:3586:b0:477:7d94:9cf0 with SMTP id 5b1f17b1804b1-4778fdb36d5mr75137455e9.12.1763230692511;
        Sat, 15 Nov 2025 10:18:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm17344186f8f.10.2025.11.15.10.18.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:18:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/4] yasm: patch CVE-2021-33464
Date: Sat, 15 Nov 2025 19:18:09 +0100
Message-ID: <20251115181810.1262158-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115181810.1262158-1-skandigraun@gmail.com>
References: <20251115181810.1262158-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121740

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-33464

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1010-nasm-pp-no-env-CVE-2021-33464.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yasm/yasm/CVE-2021-33464.patch            | 34 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
new file mode 100644
index 0000000000..ebae250ff9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2021-33464.patch
@@ -0,0 +1,34 @@
+From 3c3f968d48d768c1e355199d4067d99cb72abc26 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:30:12 +0100
+Subject: [PATCH] Handle file descriptors with nonexisting env names better. 
+ Avoid writing past allocated memory.
+
+This fixes CVE-2021-33464.
+Author: Petter Reinholdtsen <pere@debian.org>
+Bug: https://github.com/yasm/yasm/issues/164
+Bug-Debian: https://bugs.debian.org/1016353
+Forwarded: https://github.com/yasm/yasm/issues/164
+Last-Update: 2025-04-30
+
+CVE: CVE-2021-33464
+Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/164]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/preprocs/nasm/nasm-pp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/preprocs/nasm/nasm-pp.c b/modules/preprocs/nasm/nasm-pp.c
+index 512f02c3..f9f92dd1 100644
+--- a/modules/preprocs/nasm/nasm-pp.c
++++ b/modules/preprocs/nasm/nasm-pp.c
+@@ -1815,7 +1815,7 @@ inc_fopen(char *file, char **newname)
+             error(ERR_WARNING, "environment variable `%s' does not exist",
+                   p1+1);
+             *p2 = '%';
+-            p1 = p2+1;
++            pb = p1 = p2+1;
+             continue;
+         }
+         /* need to expand */
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 4fb1aa3552..9bd81c1dfd 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
            file://CVE-2023-29579.patch \
+           file://CVE-2021-33464.patch \
            "
 
 

