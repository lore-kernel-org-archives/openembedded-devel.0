Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53ACC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4194.1788429020120854483
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mdJbB06f;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso838952b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429019; x=1789033819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xt0DsEzYfg2N1l1lKc8p50V4MIDbRVm3Csf9fTiMOzU=;
        b=mdJbB06fd1UQxpDkGSbWStGoOYDdRevXydjgX8o6tMZ/eSFcdx0ZROH1MrGni4s2BF
         ZaonROcbbOZaHSCOYKE1sztJkTT8I7Ock7xzflb2olAnCfm6Fd1yc2Uq/+K4zoKAEEg3
         IPBmf75K774WPnmxlKLQvwBNPuqjwtn8FE6AEFfKXr0tUqzstaXJi1Sgl2LGYu93AAWS
         f6jT46pedL4bhSRVyei2vbb6kxeEjQHutZnpxu9actox7X+HzJ7yucsUt6HAPgoYqnWL
         GT4WxVzIGqVA/pXmnggrvQatW7nOJyBvXpLfyJYSdzrcVDoYxvUkbrrPftWuFjwdFatY
         8fYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429019; x=1789033819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xt0DsEzYfg2N1l1lKc8p50V4MIDbRVm3Csf9fTiMOzU=;
        b=MEEB8tuSno3ZezSS0hZnQV+o1PKB8NfP5OofOlpUVltVVmVcO5jk5LFmWi7reCckZ4
         wEwakVqwDSdk8P1X2Ukl8fCNHAkHuH1d1DJps7Osney/czox/p9JusH3Y+SOwdMVgrFX
         B7OhlOItOlNxXFHOmdcOfq6YBrERMW6xCaFWb4m33y8cidhgy1cPk4q9N3cl1Oji0vF9
         +Wh48UVIgEW5vH+An0+krTqvsFt6m05V0d8G7Jfkek87nOcv3AFD7QcfTXk1ftP70bDG
         5ltsR0NcYboDTMdnuCiOscZeMkZOYu1Rcf8qysy4KqrqA02znhVym+CxQJBK6JJgpneo
         xL3A==
X-Gm-Message-State: AFuF++mkGGOm7T53+a/Ckg1WE7M31dmODCMX6epr2IApsStBXZb3m9Ka
	ZnvY1S+ae8FRGBOX355yymPdZSlfWDLOp9+S6EmOBr3SgqhDNgFDoL0spFY0uvh7
X-Gm-Gg: AYBFou2xzH93vspFEEq20voWclv3GI8hEJgtbyFmqMx/2hUjH/QdDNhvz1uCpTGi3rV
	6ldQn/7pNXgaJf5sg//d73V4VOl8Ut74460EBiOKDW2usgUJk55TiE6muR7nJ8v3ZWj0q0OKh2M
	2qVaW1SCUTOBnoRCPl0s6u79Ky7B5Cwi20OPAWWRoz0zkz0XyPqVxyhZ+d/E7p/1NQOv9xtnyLW
	/xnX9CkGtq2t6o520o37HZx5p25sCbphrR71siuKmMy8Ye4murfSxxqC0XaIAtn89L8GfXrjKg3
	1z3UZHuMF5sRL49blhDO9Uu35VuwqMXwp2865gMLJSqUuXl60oUfOTV4ZUl5Vw6jRrmYQ10bbO5
	b6Pag9slKKfSJE1RvljI0R7I6p99We93vy/EmO37uKE/e0cSSnSOHqOMlxrdb4tUA766v6Y1pBG
	BiQw2nAtU4n4rvt9eXHa/QAe0FGVApMbTJ4MVJVejz/aABfXIx9Tky6INFIH7ZliPUZ5MIRJR4
X-Received: by 2002:a05:6a00:e8f:b0:851:c1f6:948 with SMTP id d2e1a72fcca58-85ffe109fcbmr4043850b3a.16.1788429019447;
        Thu, 03 Sep 2026 02:50:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 9/22] libheif: patch CVE-2026-32739
Date: Thu,  3 Sep 2026 21:49:40 +1200
Message-ID: <20260903094954.3240723-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129725

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32739

[1]https://security-tracker.debian.org/tracker/CVE-2026-32739

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-32739.patch      | 54 +++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32739.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32739.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32739.patch
new file mode 100644
index 0000000000..59cd793ef6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32739.patch
@@ -0,0 +1,54 @@
+From 1c6fde64e37efa6031a6be2318dac62dfb38f370 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Fri, 13 Mar 2026 23:39:33 +0100
+Subject: [PATCH] fix infinite loop for sequences with variable frame-rate
+
+CVE: CVE-2026-32739
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/723b58d6ca329b2743822951aeaf3299c7410448]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/sequences/seq_boxes.cc | 22 ++++++++--------------
+ 1 file changed, 8 insertions(+), 14 deletions(-)
+
+diff --git a/libheif/sequences/seq_boxes.cc b/libheif/sequences/seq_boxes.cc
+index 91865848..39c2e8f4 100644
+--- a/libheif/sequences/seq_boxes.cc
++++ b/libheif/sequences/seq_boxes.cc
+@@ -621,14 +621,11 @@ Error Box_stts::write(StreamWriter& writer) const
+ 
+ uint32_t Box_stts::get_sample_duration(uint32_t sample_idx)
+ {
+-  size_t i = 0;
+-  while (i < m_entries.size()) {
+-    if (sample_idx < m_entries[i].sample_count) {
+-      return m_entries[i].sample_delta;
+-    }
+-    else {
+-      sample_idx -= m_entries[i].sample_count;
++  for (const auto& entry : m_entries) {
++    if (sample_idx < entry.sample_count) {
++      return entry.sample_delta;
+     }
++    sample_idx -= entry.sample_count;
+   }
+ 
+   return 0;
+@@ -813,14 +810,11 @@ Error Box_ctts::write(StreamWriter& writer) const
+ 
+ int32_t Box_ctts::get_sample_offset(uint32_t sample_idx)
+ {
+-  size_t i = 0;
+-  while (i < m_entries.size()) {
+-    if (sample_idx < m_entries[i].sample_count) {
+-      return m_entries[i].sample_offset;
+-    }
+-    else {
+-      sample_idx -= m_entries[i].sample_count;
++  for (const auto& entry : m_entries) {
++    if (sample_idx < entry.sample_count) {
++      return entry.sample_offset;
+     }
++    sample_idx -= entry.sample_count;
+   }
+ 
+   return 0;
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index b238807fc5..ba16ee7afe 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -9,6 +9,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
 SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV} \
            file://CVE-2026-3949.patch \
            file://CVE-2026-32738.patch \
+           file://CVE-2026-32739.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

