Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8133.1794465762262353514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w2C7xvMd;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso313052a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465762; x=1795070562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/k3WuKf/BcLye/0ehxhx/m5Spkf8cynwzeNWewHwt2Y=;
        b=w2C7xvMdvp8MC5Uunj3H864P+tfrNb9SYs1p+XAGt33+i+kOI0OmmLObFUUJkyR6xA
         HC2vCWvpi0E3rkEe5te9KbqDRuaGbrQSr+KcrKgdJ27px10alkKqt0aEEsFYzMM3Yvau
         QRmn+VJ8SVgSoiBVQM28io5KSEk0FMAgsNWveXQOGZINLCXvaIcRjrYhXLESPZhbjPAr
         w6wBlqrsVG1h2Bu7zsQvjmC5wQYLMLvTK/QsJeVklv70sB0uZUo75Xi99YouUwZVs9rm
         HVO5Kbmf4qSeHxfUtwrV78Z+/CC6aRGj5pKeHr1WoXZdwL9ev5p3oz7ZbMdZJO7JBrmB
         rAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465762; x=1795070562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/k3WuKf/BcLye/0ehxhx/m5Spkf8cynwzeNWewHwt2Y=;
        b=xC8208zSzqm/1bAfqG+ys1doTN/aLUrithyv13ei0J61oZdba48JEbpDm4CnDyAeyo
         UFSuzjh4RsmwsSQ0gXdFNCnqCgbnZlSfzdbMGtoieMCDThfUTFwaBi6QJ+iyfwSRho38
         YcGuoo1qWmSIjM7JXO39lKmiJMs6oXtSi6QonpdHTJTZLHeSEe3auWgCkCzRyQbu0eHy
         IWh5jpfJT0KfKE6q36AWrMsGRfHWk4JoVqcJaG2bCEQ1lLeQ5hCsUYvwjorGP7nPhN69
         WpcX360AyMAm0mMPP5sXihsDs8fekuHJGmbWFmXjh7cuKsIUg7Z151rJsRT9Oyd/OFfT
         Ykbw==
X-Gm-Message-State: APuU4Z8AFIBJh+4qEkCd41T7l6fA6uE5i8TKX+VKISFNAy3Lgpa7U+15
	ATYwve53MVNIaJlbjXWT4iq5QRrQdYnNERA44ZpVAYz2S0KshN1BeXWyXMakn4ki6Jk=
X-Gm-Gg: AYBFou0MGLwNK97RlwOrt/sgDtQjT6+yHZlEm75B6006cSE1DROn3/FZYbCEnyvSTk3
	3vQS1Q/IvPBUQCCEIWuQ7DTnpXJI2tTOiuV6nbwgCsCZXNWs3SYB+lChDJLli7eLhkCeSNgNGl/
	872EL51IGUO/+hk2gdemBpOlQjMqCBdrObdoncfAWRlyREUs9Qkjn3aP+eU+R89bOyyjlvLxDLO
	R/RkFGoxdNJq00UZEHD7eMNkbL4gG0qVvJS08D4ODziAt21s7SErXZnbknXiFZy4fwhM27wwXHV
	80wucmRrMkrVyBd/8RFnTD5Lq1uWq2+6feRPNfXWBeciR3ZE/X57AGp1zIvDEw79PXEhNW4a6lT
	Ik16Lxp7p1xWdQusCzmo6EkvK36tqvaEj3f/vuHZbJNlmskil4jF5AtgF6KwRfl3rIBjx09TIz5
	ZICfAcpjPS7g6Qne3zip0ClOPj+8MvuvQ2dnQfc5oMk0pxpGsqRPngGjUFN9iLEg2tlCmLKPKTn
	Cg4BRRieG3KjBnom0IvUjueFP9d7PdwNz41ZbmxCHfW9xBpuOw2i+21/+9pLXrdAxoMxfP2qUYv
	4BrAdoGuvDHvvqHhnfmRpqEQO6RC+EWRJjVnzR7IZ26qBw77RHF+86lZooIUzVwLF6iAnK3ZfR3
	eOt4p/+7hed8a2roc/usbNKWNIEyIzPv5JQwmimzI9xms/+alTwd10lrGls8X9Uw8k0Za9b++9u
	nMciDnPrz8ILIl8b/pbijUqf5rHJD7Wz+5z3mc6IZvvdCJz4oJ9w7dXNZtD+byD8NueaehB0Rsg
	18HpKxvjKDZWSZIgdEYAZ77CxkZ6maWAlVcBdxe/Y+XaMhy1tLLfZdEONoRM3SABCuoDf4VA568
	t6JF
X-Received: by 2002:a17:90b:5785:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b197caa72dmr1070539a91.25.1794465761513;
        Wed, 11 Nov 2026 22:42:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 11/24] chrony: upgrade 4.8 -> 4.9
Date: Wed, 11 Nov 2026 22:42:11 -0800
Message-ID: <20261112064225.2410019-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132180
Content-Type: text/plain; charset="utf-8"

Refresh arm_eabi.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../chrony/chrony/arm_eabi.patch               | 18 +++++++++---------
 .../chrony/{chrony_4.8.bb => chrony_4.9.bb}    |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.8.bb => chrony_4.9.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 07bb044c6d..846de1b13d 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -27,18 +27,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/sys_linux.c b/sys_linux.c
-index 8373e25..47b4459 100644
+index 1815398..2a2e104 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -490,7 +490,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -431,7 +431,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+ #ifdef __NR_clock_settime64
+     SCMP_SYS(clock_settime64),
  #endif
-     SCMP_SYS(gettimeofday),
-     SCMP_SYS(settimeofday),
 -    SCMP_SYS(time),
  
      /* Process */
      SCMP_SYS(clone),
-@@ -500,7 +499,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -441,7 +440,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(exit),
      SCMP_SYS(exit_group),
      SCMP_SYS(getpid),
@@ -46,7 +46,7 @@ index 8373e25..47b4459 100644
      SCMP_SYS(getuid),
      SCMP_SYS(getuid32),
  #ifdef __NR_membarrier
-@@ -520,7 +518,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -461,7 +459,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      /* Memory */
      SCMP_SYS(brk),
      SCMP_SYS(madvise),
@@ -54,7 +54,7 @@ index 8373e25..47b4459 100644
      SCMP_SYS(mmap2),
      SCMP_SYS(mprotect),
      SCMP_SYS(mremap),
-@@ -580,8 +577,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -521,8 +518,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(sendmsg),
      SCMP_SYS(sendto),
      SCMP_SYS(shutdown),
@@ -63,7 +63,7 @@ index 8373e25..47b4459 100644
  
      /* General I/O */
      SCMP_SYS(_newselect),
-@@ -605,7 +600,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -547,7 +542,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #ifdef __NR_futex_time64
      SCMP_SYS(futex_time64),
  #endif
@@ -71,7 +71,7 @@ index 8373e25..47b4459 100644
      SCMP_SYS(set_robust_list),
      SCMP_SYS(write),
      SCMP_SYS(writev),
-@@ -614,6 +608,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -556,6 +550,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(getrandom),
      SCMP_SYS(sysinfo),
      SCMP_SYS(uname),
diff --git a/meta-networking/recipes-support/chrony/chrony_4.8.bb b/meta-networking/recipes-support/chrony/chrony_4.9.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.8.bb
rename to meta-networking/recipes-support/chrony/chrony_4.9.bb
index a7fc73e081..fb76c373e9 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.8.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.9.bb
@@ -36,7 +36,7 @@ SRC_URI = "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
     file://arm_eabi.patch \
 "
 
-SRC_URI[sha256sum] = "33ea8eb2a4daeaa506e8fcafd5d6d89027ed6f2f0609645c6f149b560d301706"
+SRC_URI[sha256sum] = "4924c6f530105bcd5b9e9e33c48a2ae1bfd889222c8480bc41601110efc864d0"
 
 DEPENDS = "pps-tools"
 
