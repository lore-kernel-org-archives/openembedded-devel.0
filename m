Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD1ACA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3516.1791763854711617576
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MXEX7Izv;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e623eda81cso7569395ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763854; x=1792368654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4x/C/dWGcatHe42E5jutBB/abcUKIjeNHiMFKqhs2V8=;
        b=MXEX7IzvrRje4tpYcf8pR9NH+OuLuEib0oLzV0rBxiBvPF5lqxPu80tkEpvh3gyPmm
         Q/Xs+MPkpa1/s2Sc2UD6h850UQao4UbiGt7pC+6iCR2fcCsIqPsNG4kzUSB1zwSjXhUc
         YH0s0dexnHncU/7WQCIODdl0+0KVo6RgOgfepbnNC0/uFJ0MD4YbCXr1UQU9oCgnvBmE
         zAuma6iXn0Jx72pNNfJcmnZzE9XazrDQYFBlju38LjDcub3lby9hvZErpv7BKVNTPxwL
         1zwxbCgySpgUCyjkmMYEKL/CgmcOT5qFdkfj0kmxs8ojAfbbmaRpDILQsVdb6SHo2njg
         yrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763854; x=1792368654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4x/C/dWGcatHe42E5jutBB/abcUKIjeNHiMFKqhs2V8=;
        b=vEK7Kglt9LfO+2gWfi8Kd9klR56iH1PPU+ZJWCt9NwMuxCOFwpZtVN2DNmC2SmHD3E
         D8HGIjjtden/H1HFnjh+4CGutagE0XA+SJ7Fja8Cm+Gm2pRNwZmv1nsUS/6SM3xpGPdg
         R6llcGMmVFkUUMMQz+AMAT+Xd4K19/g74jdOH8YyvpO/8PN3keviVLKQChCP4QsxyCZj
         dEsqxBQLxTq0oiGSEx9vYAUkRlmTR4zdc2Eh0m0vbv03zO3MlT/xZViSdOhT6fiJLtSv
         +tOnht+7hTqko384gnm3c5tfGRRjzgOWuAa7NxzOK4APnOuIE1qSI7p+s6MQcBsvmxGs
         ZZAQ==
X-Gm-Message-State: AFq9FYJGO7GWgzlukHd7XAkaNX4K4pjtaFBqJKYSbV41087g+OnCszm0
	GMEdvzZlHow8PbH4OtlBxpYrr3IY5bwRY64pkJJ3sFUGuLZ0A6gcmI+5hGb9Gg==
X-Gm-Gg: AYBFou065qhtHrSLt6mc+6eGyABOAkapL8C/84SKkd/4n+yrL4Huq2OduZSwpAAisUA
	kElbmYw96WgACfG+fZuYTl0VV9pU8h0p1b2dUh2QqHFzHKO057qpAgQZ3KgHd4v0t+M2DqmW2N5
	NSVihKM/c73RhN4bJSalMuSZjU8fKg1OxDC54XccrMwoxWnsVwV8mugUwAzP4H1XBzt90PKcNBA
	k7wY32jb/vl4lpvmlXTYK7T5QiyOqreUIsq/pQbzrWzLMcS/NvElx6R9bixxv9VetP79GCUWf9E
	9n66GsrhTw7B2zMcMZNOSxa4n90M+jDmRcEBahPwk1Po0cisVb+PRXwz8gUk1OpfdZzlPQDyYA9
	FEIMjCvivMErJN+HmpqsdVb+G5fNdu+5l9ylD1I39PpGf+Jb1GjRVVd2eOPQlXDl4JnzQ3jrTVX
	7VFinGXOfJk6HZXd68fFLAl7bv+093eL46TAEchhq+cUBHp1PxtV7BtjgIURVS+1NBotbbkKBDq
	8TjK9v5dqmYcYt1kQecUlbyjiwY53plsGOniF0=
X-Received: by 2002:a17:90b:2790:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3abbe66e03fmr2120609a91.54.1791763854047;
        Sun, 11 Oct 2026 17:10:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH 15/28] libde265: patch CVE-2026-49295
Date: Mon, 12 Oct 2026 13:09:53 +1300
Message-ID: <20261012001007.2541673-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130740

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49295

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit bd09bb41b41ee12aeb181bf04e5f5961b00123ef)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49295.patch    | 41 +++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
new file mode 100644
index 00000000000..189d330b9a5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
@@ -0,0 +1,41 @@
+From 7d5e48dbf9324691ba3ce4cd8ffa089d735b0b70 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 25 May 2026 20:14:07 +0200
+Subject: [PATCH] bound aggregate short-term RPS size (GHSA-g2rg-wj66-w594)
+
+(cherry picked from commit 691f3a3c55b3d32478c4a49895dee061a282652b)
+
+CVE: CVE-2026-49295
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/691f3a3c55b3d32478c4a49895dee061a282652]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/refpic.cc | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/libde265/refpic.cc b/libde265/refpic.cc
+index ea4db4b0..dcd2b214 100644
+--- a/libde265/refpic.cc
++++ b/libde265/refpic.cc
+@@ -322,6 +322,22 @@ bool read_short_term_ref_pic_set(error_queue* errqueue,
+ 
+   out_set->compute_derived_values();
+ 
++  // The unused short-term references are all collected into a single PocStFoll array
++  // of MAX_NUM_REF_PICS entries (see decoder_context::process_reference_picture_set).
++  // While each individual list is bounded above, the predicted-RPS construction can
++  // append the current-picture delta to an already-full source set, pushing the
++  // combined count past MAX_NUM_REF_PICS. Reject such sets to avoid an out-of-bounds
++  // write when filling PocStFoll.
++  if (out_set->NumDeltaPocs > MAX_NUM_REF_PICS) {
++    out_set->NumNegativePics = 0;
++    out_set->NumPositivePics = 0;
++    out_set->NumDeltaPocs = 0;
++    out_set->NumPocTotalCurr_shortterm_only = 0;
++
++    errqueue->add_warning(DE265_WARNING_MAX_NUM_REF_PICS_EXCEEDED, false);
++    return false;
++  }
++
+   return true;
+ }
+ 
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index ca05e9099e5..6bed3250fa5 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only AND MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-49295.patch \
+"
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 
 

