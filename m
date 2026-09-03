Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8906C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4055.1788429018056280327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EQ1hYTqO;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8534d507f59so2739655b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429017; x=1789033817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nowewthG0wVXsjTBf+hJSWnbh84++hTFx2FIAyU07ro=;
        b=EQ1hYTqOZ4pobIIuJQRiLQVo3ApM7eDMwkO4VWxJHh4O3lm+Bdn81DSZPddZpiV5PI
         cyI24w2XNlsThdb9AtPiLFGIfqaB5vGc0Lx0/b7wI0/pcT+WjPeZ6FMnn11UrJW7lbsT
         Qp1/F01lfa8MkxZVdcCl+P1bEHGMuuCbpf6o71F2yOAZY2+ROlULix8LD5LxH+hjy5Pq
         2jmDSNDzU34lA1KXP/s01H5xorFXNMz9ReVh+OTWzupNisJPWcrbsIE8lOYU2CxxAtSC
         0xjtvxTEkYPAvhz68fgdMPEmSOcmOok48hvhqmUQVbtH2QIYp4JWhRk7IrNCSfQaDJu6
         z3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429017; x=1789033817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nowewthG0wVXsjTBf+hJSWnbh84++hTFx2FIAyU07ro=;
        b=X1bC5roTzQqzGf8quDPN+YBg4uE/xnTbJWvlNgwHJLNo1094vbkjmoI6hnyFH04sVt
         Cv3/GDbl1Y6iX56LdK12/sjc9M3+MdmUOsA+2//U+FONi6lcue1jnHta0HVr0dohJwvR
         OOTOgkjSikLPLMfzUp/ygP3yoEu7zteOqtsBV3+XriZzG457BCu8OuZtZMzNufvJqL+P
         VEcJKxkVb9kc6Tn+iU47F0y8EN3MQWCdZPN+4Hm9g++vHNo2mo93nNtGRCrsJ7F3XfgJ
         cEWYcM99in+vfFBZD9ycGEowOi8NazT7UgOGSXLSt9Stj7f7lPpwPvLTSOkDhj7mIEtF
         y1lg==
X-Gm-Message-State: AFuF++mqiUoiM8kZjPE5BP4FnUUoWIzFqnmbVqPEjSac59wEEZ2tuNcn
	WlPYEqHQUmM5AFV8GXYF6KIzdKFGnjX612TFH7h0IWz2jkhjy+3KiuEsEr1Lt4VG
X-Gm-Gg: AYBFou26u6y8RNcn1ydrzBE7yvKbs0wyeUy8jZV7pcrPIR1tksGmRxxxAHXmCxRBLki
	FOhMI//oYsGR+bE7K0IAJ6WyB4KyeA3Mm6Yi+jrcEqMv0lGa1oqAQpPokxA8RCrvjw93dtJ//dI
	1n8duJkrsMdiK0aGPYlki1cqcbl1z/jmcQrlhcoWY997y8dzADqNR6oMk7tDetenhmt8MwDS4V8
	ZCFtNp2/bGnMnckCyA+009kCe4zwGEEtDJxsPU0WHIEEXTymCSroZj4/54DBH+baDeQuvY0cbkr
	6Va2aQca0ZVcO9AfS15p86Q1cUpCtflsIKRlLNbF5rg5WpXVmg8JFVdE17YPERSwastvGbY+zcu
	IKB8I11kqjRX4j2ZDfwKR4+8EkRpsuZhD5aHe58plSYbIZfTe2PGckRIAo8DcMH5wbydx2aPNAT
	I3n6FpkItjE+gXpREOEwMmLpPUWmjGPVAfIgncIUj4NHBZWrW91xtSNsfNZosLxjaqUzuvKf1n
X-Received: by 2002:a05:6a00:3d88:b0:85f:3dd6:f426 with SMTP id d2e1a72fcca58-85f3de63c5emr12739022b3a.17.1788429017379;
        Thu, 03 Sep 2026 02:50:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 8/22] libheif: patch CVE-2026-32738
Date: Thu,  3 Sep 2026 21:49:39 +1200
Message-ID: <20260903094954.3240723-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129724

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32738

[1]https://security-tracker.debian.org/tracker/CVE-2026-32738

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-32738.patch      | 32 +++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32738.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32738.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32738.patch
new file mode 100644
index 0000000000..4308aa6195
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32738.patch
@@ -0,0 +1,32 @@
+From 95a7008c89335ca97fc22ab8caab5d62b077a34f Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Sat, 14 Mar 2026 20:32:39 +0100
+Subject: [PATCH] check that 'stsc' box does not have zero samples per chunk
+
+(cherry picked from commit bdaa37728442800497ea224bd232ca25e2f9bdff)
+
+CVE: CVE-2026-32738
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/bdaa37728442800497ea224bd232ca25e2f9bdff]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/sequences/seq_boxes.cc | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libheif/sequences/seq_boxes.cc b/libheif/sequences/seq_boxes.cc
+index aec84fd5..91865848 100644
+--- a/libheif/sequences/seq_boxes.cc
++++ b/libheif/sequences/seq_boxes.cc
+@@ -875,6 +875,13 @@ Error Box_stsc::parse(BitstreamRange& range, const heif_security_limits* limits)
+     entry.samples_per_chunk = range.read32();
+     entry.sample_description_index = range.read32();
+ 
++    if (entry.samples_per_chunk == 0) {
++      return {
++        heif_error_Invalid_input,
++        heif_suberror_Unspecified,
++        "'stsc' box with zero samples per chunk entry."};
++    }
++
+     if (entry.sample_description_index == 0) {
+       return {
+       heif_error_Invalid_input,
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index ab29fa3b02..b238807fc5 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -8,6 +8,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
 
 SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV} \
            file://CVE-2026-3949.patch \
+           file://CVE-2026-32738.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

