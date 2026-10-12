Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CD5CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:55 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5067.1791839451597302868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=adVFFL72;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so896470a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839451; x=1792444251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPtpAxsWgHCGclwUU4Kex2f7e/VVpeiiVhkw7dMAbMg=;
        b=adVFFL72XAE4barrEjR6NZiGjGUYF9R0eeCvtNAxZZLN24NFIXZiylaaHx/xNVPZ4O
         zWwJRdv2I5Nw810g9p2wK6ytFijpheWdq7BKTja4YuSjWgZrZtPeqLOOhyUq9P8UDj+f
         iXRXtVJ+E9Z7s8E5FHdZPxdzXgMh4gDltPO9Z1lWdtCyu5SzBxclLvV3KJxCln9+QKW3
         8mLb7xIYXGK7wiiVMR2qnzNY4TeNcupiFm0GsEnGm4pklKSt9WZ6wJsa6NINQRmVQGll
         m5VuYjxq+CLr8QCIfLvWtvXPx+5GupzIMVWUpTFjnOHKscPFufKu/7fuZuRFMJ4gRwJD
         dS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839451; x=1792444251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPtpAxsWgHCGclwUU4Kex2f7e/VVpeiiVhkw7dMAbMg=;
        b=KnMF0ovp1sDK2OrMam13ypB/2XQodyLiHbWVg5xgf5f/NtVIkj6hVPxoI/SCHYih5S
         KZe3FoSnev5BjngWXkjHtRFRPmcFYHRFviYC875qW9m7WdCyaTeaaB0LgOKRh9TB1WkF
         Y83uf/1O+3e2G2UgsanEiBieQ8MtIs2h/7x4i9edUf/eTsR0vvA1KV2sliurHhUR3ZgG
         0+ipYM0rTud2vFYd7Za4Zo/JxRyuwOv+FG1koZAz+64BArKHGQK5gM+5JBy42GNi7NYN
         G3VK5NhEO5Y/X3Ze3gE7wJKnVr5am6HJJTbdDFbUEhOeh2NY4I24vUvQCS282AnBYsjh
         oZmw==
X-Gm-Message-State: AFq9FYLLFYy1OI7O27mKVnMZV2l6A1OlBabpbeQM6ZHh/+0ORdAAKksf
	TotHfbRilLtEWFwN0tcQi4zISchqkI6+ZdyahE5aLoGoo6AFW6Q0XhFTatoQ0KeI
X-Gm-Gg: AYBFou29/hzHX4bd7S1bQ2qHnXWVudF+e691uJkIfSWFmrxCZyqkvOYxu1BbM9g+T/g
	ki+5+RfKu6Fu3eHs+OeRWoBIR56NX5gg7FCl+IXP1L14OoKw5ga9GI5FAcOViIQfyqJYkNfxEU4
	nPDDtqDg0yz3N+pT18Dxl/CfMUUXPp0sZBBlSrt48knrUjd6kVNjGlceuuPCgjl6RBNxNLC6Ttz
	Qv5PeS5LtqW5t7f9GPKtCX3DwR0oQ1ZJp9SJPaTK/lsRixFDr04w805lyYsf4m9fNXx2ihIJI9+
	rdXzG2Y5Lb+400wefnmISF4ACig1zyvyMSpSY16K8C4Q7nDBrTupbQY1AMl6PebTBsTuffx97US
	qU15crJE789EYRrG3TCuKOSz+2LAjeYcYA0A8AdFbtSdqASgpbWlcNtiTc6+TEwAA8cpyO2G8J0
	/Q3YHDYy1Egmw9jyF6uzpqHdbEw/+0lmjj7zvrs8qsrNAU0neRd9vrlN+g16Z7tnQeo2q5DftDo
	rXutRsPh8g17ECTOEEKsiKeRb+YYm3raHrqWAU=
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr3529234a91.33.1791839450968;
        Mon, 12 Oct 2026 14:10:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 13/43] libde265: patch CVE-2026-49337
Date: Tue, 13 Oct 2026 10:09:37 +1300
Message-ID: <20261012211009.3352822-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130783

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
 

