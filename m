Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91A1CA9ED3
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:03 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3494.1791763857284450879
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nsB+vXtU;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so612287a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763857; x=1792368657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPtpAxsWgHCGclwUU4Kex2f7e/VVpeiiVhkw7dMAbMg=;
        b=nsB+vXtUvN1wNqd/L8dPkx/TXJ0h5zfrJ0R2SGl69M8qFMgOeBNTeB6V+SXDrdCtn3
         3YWf6Cju9lGDZsSLy+eOA5dCDOpLCmoQwWP+BWaHhq7KQYOtc7nU/3FfAGpnMuoJx3pz
         2DhBNcEnZ+aCLemyPOJ68T4GfVfxg99jvCR2OoKchgFoIdiqkCsxQYJ7qOb8mLhPTcw0
         LxuNtfHEn/UtJXXfhSsUQZrmEKdLw0/r4VWtyF0x0LonbEHQ3gQfoZIUak1pkN2vkLZo
         y2AEd6ikQkn4ZtAJHyPPyaxinJ+UJeOVUMsWAjn8l5NYwuu1nTE+DJPLlvjQCf4ppVw6
         qXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763857; x=1792368657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPtpAxsWgHCGclwUU4Kex2f7e/VVpeiiVhkw7dMAbMg=;
        b=zqpN8VopcwOAt1WHvXM/mtfU8wUdq1xmeqzy56NlzCe2PKIn5+tdyei7JSGa84RxaG
         HUxuLYB6GLErHSS2SGINSRidDNk1Q2Bi8hB2gG1cI83HUx19O6x4zSDyqXkvgAtq05kw
         OvEKiaz0G2tXzWhRYvX92HFkKPtkWQ8BuD+ZL1awkWDPjSr+is4cuj4vG0L+dfaULcPY
         B4+VqPLLC1nZvHdtdrCtlxN/jGmW4IbFrhgCge5UwmCV+lCVvfncuPnmMhcomUcZVSDw
         vemHdO1Q8c84d2kGUtAeCqbqZK6EUEdw+gK1/0iPyPDIg/nnnEAOkkOpBqxHqgagYdRs
         BX6g==
X-Gm-Message-State: AFq9FYJ5nPpWbtzu4VuT09nj+Ob3VkT4qjxrXGFzam1RXTUJ4cf3+WiB
	X8KL/OonSFBTYDlblQ/7TWmX46NFLpTa/QARGbr4EIFG7tI+G3gJ87xXVadTUlun7f0=
X-Gm-Gg: AYBFou0FOTU51S2eLPjFJtsJGKAeJwmIUHhUFJhD7vrs/d71uSkAnjTG1hviSTxsPzC
	LTAS944ewOmddiEAMEp19f+7Pt4I/d9qtabaOnq0QYX8dXQh3+/gh3Xg6ChC5zlR1ihQ48PXYzr
	m4vIybka/r8OHTlOCrYcFE9DMSG7ZR78MqDyuOZN7f07SdjfT6wUQ+BtcEP0ZivLF8fQmJp4jnu
	t5HI5du8fnlUSXENnj+/tySojAjOrULVXhPpF7DN4qpZhAC+vu2c5EdkW3FxnyCxTbhptWyKvha
	NACF4whE5/5eWwXD3j/FxMkk+WcpmyyVGNFZf3zRXDttCzW+/NYJT3h9FSFslmCg/wlgft7u3PF
	vjbwbLdXVUcxHAVvB4RiqTYKPAUBc+9L4ObiHiM6NDFwB6hyZIv0PSngwcm645tuKHHCuEHntXj
	kGvOZ7v9Zrw/Z8r7J44BU+sWy2j1tHGDmcVZ/H4zUGEbu5TCz3vifzO3VswRMfELRHqAX5iRMHS
	8T2tQwQi8oJsGrjHBbZ0FpBBuGH4UcVLDl5UTY=
X-Received: by 2002:a17:90b:224c:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3ab3a0218bfmr7037060a91.0.1791763856572;
        Sun, 11 Oct 2026 17:10:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH 16/28] libde265: patch CVE-2026-49337
Date: Mon, 12 Oct 2026 13:09:54 +1300
Message-ID: <20261012001007.2541673-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130741

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49337

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit c83399f83fbbbb855c5a272c9702e8aff4328ce4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49337.patch    | 53 +++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
new file mode 100644
index 00000000000..88e0e329491
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
@@ -0,0 +1,53 @@
+From 2f0c53241cb9bf2f5acded53c25f1b74db536de7 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 25 May 2026 20:29:40 +0200
+Subject: [PATCH] free orphaned slice header when no active image unit
+ (GHSA-g5hj-rf9f-7vxm)
+
+(cherry picked from commit 683cb9fa603e35840642f98765ab95cdb71cadf9)
+
+CVE: CVE-2026-49337
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/683cb9fa603e35840642f98765ab95cdb71cadf9]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/decctx.cc | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/libde265/decctx.cc b/libde265/decctx.cc
+index fbb3baa1..5deddc37 100644
+--- a/libde265/decctx.cc
++++ b/libde265/decctx.cc
+@@ -478,10 +478,6 @@ de265_error decoder_context::read_slice_NAL(bitreader& reader, NAL_unit* nal, na
+     shdr->entry_point_offset[i] -= skipped;
+   }
+ 
+-  this->img->add_slice_segment_header(shdr);
+-
+-
+-
+   // --- start a new image if this is the first slice ---
+ 
+   if (shdr->first_slice_segment_in_pic_flag) {
+@@ -495,6 +491,13 @@ de265_error decoder_context::read_slice_NAL(bitreader& reader, NAL_unit* nal, na
+ 
+   if ( ! image_units.empty() ) {
+ 
++    // Hand the slice header to the picture (which takes ownership and frees it
++    // on release). Only do this when there is an active image unit to decode
++    // the slice; otherwise the header would be retained on img->slices forever,
++    // which a crafted stream of non-first slice NALs can exploit to grow memory
++    // without bound.
++    this->img->add_slice_segment_header(shdr);
++
+     slice_unit* sliceunit = new slice_unit(this);
+     sliceunit->nal = nal;
+     sliceunit->shdr = shdr;
+@@ -507,6 +510,7 @@ de265_error decoder_context::read_slice_NAL(bitreader& reader, NAL_unit* nal, na
+   }
+   else {
+     nal_parser.free_NAL_unit(nal);
++    delete shdr;
+   }
+ 
+   bool did_work;
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index 6bed3250fa5..5fcf6411131 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2026-49295.patch \
+           file://CVE-2026-49337.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

