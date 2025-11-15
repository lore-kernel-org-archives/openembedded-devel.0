Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C42CEB2F5
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:18:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13793.1763230693550423780
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyYnPApb;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1798153f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230692; x=1763835492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOIkVwhBeoFWvjoe+8C9pL8QLbG2w7DadcJdUTcL+fY=;
        b=QyYnPApb/4hJ8pWQ2o5n8taCTrZkQYwE4E903m0I2Jp+ekX2lL7t1UwRvgK78ZreAh
         fkS+4G+FrcYRK4v5W1K8SAfg2ZtLRjRnbYY0sJJkT3x8efuZnCoApIUSmoJJX6abZqhU
         N/Ti01ZrhFIOTBtpfsSkJmo4tF7y2iG3+y2p7x5uHRXxyAiQyH1VldNrsQeiV+lWMW4r
         oQHWRmXCLLOgOo6SKI7sYn0LAOFoZCX7PiP9RN4YjgWKM91JQ3u0OrcdhgIbGs9tcDDd
         eTepe7z2/uiUhNif7Q6GTtTVhJ0Dq2LIky6sxxWpxWjRL2jnppvAVMJTcBIYYrmHviSc
         LZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230692; x=1763835492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOIkVwhBeoFWvjoe+8C9pL8QLbG2w7DadcJdUTcL+fY=;
        b=LrjM6yNnWfXaimN4o+ti8Gg1yeno84SIV4XVk8p/bakea2ZidEbZkKw7Jw89lUbDo+
         Ce7dpZq/4C80XJNSf+L9giyD2SpSvFnlpnQ2tiRwDy7HyfiM87dvSJoeZZkJOb8QSNNs
         VIZqOzzEXu7Tg1dq7x4ofd65D7m3cu0RiR4G4TDatRbZJrD4S2L+CJs51A3LZqoHs6EO
         7mnCKgza/A8fUQ2PoPWTsXhTzXkntBRk800+3TCyp7yo5PpLv0dzYn6QFmy2NzcuPzwU
         uQpGontHoE/3G5y4838WCWTLgrFM/F4obg7NrKZHG5emU3/ZvLMkbNiWh8wWnPxOt0QJ
         IFVQ==
X-Gm-Message-State: AOJu0Yy7FbZHFbpjBGTEVwGVH/6lNhavgji1gVFnF/8lR2DNj5ZGDNp6
	NJBAC1oiWUodrGGci21iQ3sryQ5JsbmcMWYshkWqsg22ZNTAwxcchYvwTb3rFsyS
X-Gm-Gg: ASbGncunT9NQMoM6mzwbVzKEh+JNub/g1ycO4WPUnXRn+bpuM7TT8e/FT3rEt2wy8iC
	B7Ic7tCZ4iwrcMQ63walC3umAsveiRJ5lLL4LYxWIExEz6wno9ItE+scxIBQJS+D/nYFPs83yTb
	vR4dGNl3LzrsBkd0PV+zojsLlpfq7iMsNg/MSnkcimQZrJ/ziTiaum126UVDG6aG0pzNSqs0mvm
	2OO2wi3puK53gF2adYBlO15SkXcrJ4aama1EJEppa5f2OCla6pivgG/Aciz1zP/uF8676WQh/Ak
	JZtjksb/d6SLQ3R8lNMtl/vjQQa/sOqfSg9uTQ9UBVQeWFZs7LNdxnZNyGL4HzKEGNpMGi/DAAU
	zsuvUZivR0MlsSAKnaSS3Wz2OI5SyocXZTPNDQktoqjfMKT5zd5n7APqcNG5cz7MX0ADDZ3tkd5
	lf797V3qS5
X-Google-Smtp-Source: AGHT+IGCIWNojO4trZlMS4udQ8mZjsu9c8e3uXKIJsdOTwFWUwQ14K47Qa5HQeZDPvO7hgpKALlA1g==
X-Received: by 2002:a5d:5f92:0:b0:429:cff0:1929 with SMTP id ffacd0b85a97d-42b58ddc246mr7197545f8f.29.1763230691858;
        Sat, 15 Nov 2025 10:18:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm17344186f8f.10.2025.11.15.10.18.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:18:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/4] yasm: patch CVE-2023-29579
Date: Sat, 15 Nov 2025 19:18:08 +0100
Message-ID: <20251115181810.1262158-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115181810.1262158-1-skandigraun@gmail.com>
References: <20251115181810.1262158-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121739

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-29579

The patch was taken from Debian:
https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../yasm/yasm/CVE-2023-29579.patch            | 39 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
new file mode 100644
index 0000000000..58b4ed1996
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-29579.patch
@@ -0,0 +1,39 @@
+From 81c1b7b0a28f052eaadddcb010944bf67e6ae257 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 15 Nov 2025 13:24:21 +0100
+Subject: [PATCH] Make sure CPU feature parsing use large enough string buffer.
+  Fixes CVE-2023-29579.
+
+Author: Petter Reinholdtsen <pere@debian.org>
+Bug: https://github.com/yasm/yasm/issues/214
+Bug-Debian: https://bugs.debian.org/1035951
+Forwarded:  https://github.com/yasm/yasm/issues/214
+Last-Update: 2025-04-30
+
+This patch is taken from Debian:
+https://sources.debian.org/patches/yasm/1.3.0-8/1000-x86-dir-cpu-CVE-2023-29579.patch/
+
+CVE: CVE-2023-29579
+Upstream-Status: Submitted [https://github.com/yasm/yasm/issues/214]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ modules/arch/x86/x86arch.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/modules/arch/x86/x86arch.c b/modules/arch/x86/x86arch.c
+index bac11774..58327958 100644
+--- a/modules/arch/x86/x86arch.c
++++ b/modules/arch/x86/x86arch.c
+@@ -165,8 +165,9 @@ x86_dir_cpu(yasm_object *object, yasm_valparamhead *valparams,
+                 yasm_error_set(YASM_ERROR_SYNTAX,
+                                N_("invalid argument to [%s]"), "CPU");
+             else {
+-                char strcpu[16];
+-                sprintf(strcpu, "%lu", yasm_intnum_get_uint(intcpu));
++                char strcpu[21]; /* 21 = ceil(log10(LONG_MAX)+1) */
++                assert(8*sizeof(unsigned long) <= 64);
++                snprintf(strcpu, sizeof(strcpu), "%lu", yasm_intnum_get_uint(intcpu));
+                 yasm_x86__parse_cpu(arch_x86, strcpu, strlen(strcpu));
+             }
+         } else
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index abaeef4db3..4fb1aa3552 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
            file://0001-bitvect-fix-build-with-gcc-15.patch \
-"
+           file://CVE-2023-29579.patch \
+           "
 
 
 inherit autotools gettext python3native

