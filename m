Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A73CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 08:53:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9075.1791795228304841164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 01:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hs1TTrUo;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e61ac64ec3so15228465ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795228; x=1792400028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPtpAxsWgHCGclwUU4Kex2f7e/VVpeiiVhkw7dMAbMg=;
        b=Hs1TTrUoD2vQ7yG3IaADmMTdx5CCXMpMrA4T6QeDjOsDC3Lo27ygxFifP6vXPHLPH2
         ESYgYZQ/UyhZdsByQU2gQvbYmsNzFqvLOpMmKUqqy5oIxHXEU2C/7atysSqDP7R12rmD
         5gkCQ4ItccEAkIUAO5YI3S/P4JX8QeyouBCn7nJaYKyUkWFe9uJO4jmPs46L5Z1QpNtd
         rel9g+knAEPJEKw8vRSuJlmIwesyAaAw1vnuDpxhXWlpZPRu9jOp10B3V70mD5TdYYmV
         Ae7wLgvlrEKz5aqvUOgAE1+PWBaJicUZ7UOxquYPGb9RDZEsvF5JtPgH5oeIna53YAFm
         dSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795228; x=1792400028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPtpAxsWgHCGclwUU4Kex2f7e/VVpeiiVhkw7dMAbMg=;
        b=12XO+WEIKMKz1jkLTeE+8dZsDDFOLs7dvCc6PIwlfMv8zMKQKnv75jK4GGlaI6W1gY
         ofwqjCq2YwISP/OagGKvFJ11Dcw9M6/ectFW4Hl2pqIPcTFVkFfcOErKHpkss1gGiX3w
         Pd8fvz+U0N+1VrzR8oLQ53yG/XkM5P0taOnG3Z2Yfy/PTTqukRp4MBKYL2d6rJ2pqCGC
         3IVsgNVgNNDDEe6OGKYltdhcY98htmWY7IsUnB6dOywWsgafyFOkRkiAm4DNZwxq9Drd
         syhO0jJhorGBTsUxsGUgWq9tVD8Qk9W9lyZRlqRkjih44TUa+XW2vmKCM8PsOvH3wpzl
         O2uQ==
X-Gm-Message-State: AFq9FYJlv1epNFgg0AD4WyXRh32+3KaLIZcEAAS90d42ffO/v2FiLhvk
	xCcdgropPLtV0/oF2qzbjF/U8qV57UqbgoPNIr39/2rf7G0ctYSXxrMo+ihW5HZk4uc=
X-Gm-Gg: AYBFou1jJe/ORqpZatYoOVvLZ2Zm5hDt+c0Wllcp1ydZHMKgQ/NaAG32JgYtUinexLh
	xFIA0Se3SsRKwi5IR1bmJWiBrBsTqVyzPssuI7jIQB1uVsiWFG6zhBlFfe9tjGF/70/bVQfnzJG
	cHNkbVWLONikUDp575vZfX7WuJKwtR54Yl/Lky8PAIkR5vmCg3Jd7OQqDgWk2Z51qU/BYwzm4kb
	FuOJKnFMOFOOvFW2CgNkP7riOwdwlp5CWvUQXTxFzt+J0BjVKDtBCNghSPY+z/nG1siFoY34Gfk
	Rnzpz852IyrO0ydW/srzEO28YH5fHB8rxYvh0i19TLVilYbnOQNUbPbYcei5UFmcyOYlfShGnqU
	+d9nH14jpKYFH9zpilOV8ijk+8g2mCSMacloAkjujDU1V3ptJpKr0b2sToBZnUrcGCgql/9TChD
	61N/rPhZPpmvjK7o+8h4z22UynTc1QwKY9Zt0fRDyrWOIpueL4uy32Qb7ia6UB0FNNYrZ1cFuA4
	tc0FFte/BNjyaEugwIUIoe2MLfLJgtmvdmcJnM=
X-Received: by 2002:a17:903:2282:b0:2df:8d6c:bb7c with SMTP id d9443c01a7336-2e842aa7eccmr72669985ad.20.1791795227637;
        Mon, 12 Oct 2026 01:53:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8acfa3b6csm14943335ad.41.2026.10.12.01.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:53:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH v2 2/4] libde265: patch CVE-2026-49337
Date: Mon, 12 Oct 2026 21:53:35 +1300
Message-ID: <20261012085337.2879365-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012085337.2879365-1-ankur.tyagi85@gmail.com>
References: <20261012085337.2879365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 08:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130756

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
 

