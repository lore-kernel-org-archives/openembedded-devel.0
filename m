Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80521C624DB
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:14 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4192.1788429011688239160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O5KMBk/G;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84864086bfeso2091027b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429011; x=1789033811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJNaaA117FjO44ZoX/aNvEUa03P/eWFlU96iCZaTQ+0=;
        b=O5KMBk/GCwMhBcYdCfAVVQXWi1KgZ11W/e7y0B45xaF8Fz3ip2rO/F9PGI+ODusuJA
         s2r9/BDH6YOMK4eWwCzEEEHkqQKVn7mM+R+TcytsBnEYqP9Cxh5N4NhDquI3rcpjOYdV
         nL7lXlJXr6yItbSkB+jBEzsy+EfbzJhhF+CuFkmjnXux/ZlHJ3MRslXT8nsx29EgkVCf
         otFGiONNG0FlT1sfD2Kv7R/Ty+mMZxoFHRwsS+nPHiVckmeqnMqE6OAxEo4wWPewfReg
         z7k6bnwNSuEeqHOGFP2n3NpqnfDdj6fBCSvqh9X9H+7s+cuir9CGNgU/xOQdzDbPBoGw
         hxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429011; x=1789033811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJNaaA117FjO44ZoX/aNvEUa03P/eWFlU96iCZaTQ+0=;
        b=JRN5uhWdb5pDu828NcJIXGQgQAGABK2lh/PynOaayZzh44AmOsBoRfbzaCGfRWU5/6
         qLzyH+VVq4vxgy+cpwt3KFWHu+QfU1Muh0/zNc/Zpf9mzggTGNLJcP8PFwfUix8UzvAn
         mVvdsrRoUWYVlhx6zjTepno/NfEVKRrEW54Nln5/WotycmhtS1fd20Zl0qnwZ8b0fzyd
         3SoA4n+FHrbFPVfDH79UOR+0AzMSL9mudNybtisbdE9jstB1uZCqDA4/JhLzhoR0nZK+
         F5s2pjO4y3/hHqY3xE/RMDzvrlh5KBf/QB4BjyOmzYfwqIBDRAXgq1Vbfb/7XqDqJlYH
         DJyg==
X-Gm-Message-State: AFuF++kfnaFJdN7P3KTDBrHkkZFmT2SB8+4c6yfx3/tFaAVW/YXacb32
	KDLpl0N6syNl7/izuf8yst+W4RGUdkB9xGt7d6F0QDuwS5dInY6r5u7k3VuiqWPU
X-Gm-Gg: AYBFou3g5dQBneVj/dqXpZnOR+V+4yLmLCQP3kPqCbJfrPcWX81SzXhutFjVtZjnP38
	9ZSW6cG7DMTD6lo3kMNK37/OmhnKmIWqwxdyoQfMVwvNvNqO3d97CTNprGA20i0zGtM9uF9VJGJ
	kpf8quDBehIVvXsBbBopi/NBpoQJTgsnCwUziDk8MsjI8bNdDAASwzNZRic8WrIKYN4oiwDcuFT
	qIMpBv23fX7Bc0a2RswGK5Ew5/RvT22E814FwiiYeT2LdJToufHUXC04+gDAXCmRa6vTUMGRNyn
	HdVVC0P1bAUZEb1NBKs7pN6T3CokF+5kIjUD7aAOolSJPqMU49W9YAvDj+3WhMKDyjZKy1QYgk7
	h40Y4gfG8SlUNcUwsHMjGR2OoAUBlJJXzW4WozCpLr/uUVlZbItAJrE+cfwnn8xPJn+BJcUh9Ox
	Q2jUnA8IteRBY4BS9Xx3bVayayZXf/k4GbFDmxwGbkR1QW7LFgYHtSf2kC0BykZu2V9o7mncQWo
	s0v9BtFs0E=
X-Received: by 2002:a05:6a00:6d43:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-85f1492679fmr14115223b3a.7.1788429011050;
        Thu, 03 Sep 2026 02:50:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 5/22] libde265: patch CVE-2026-49337
Date: Thu,  3 Sep 2026 21:49:36 +1200
Message-ID: <20260903094954.3240723-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129721

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49337

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49337.patch    | 53 +++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49337.patch
new file mode 100644
index 0000000000..88e0e32949
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
index b4f80d18a7..bca5c9d776 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2026-49295.patch \
+           file://CVE-2026-49337.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

