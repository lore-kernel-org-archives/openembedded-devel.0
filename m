Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500B7CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:37 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32807.1792043015772460704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CnvaAz3q;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e60f9af6e6so13993165ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043015; x=1792647815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XT00PAJLu0knCLcwz9J4YOEylZjMmPpUrDVjoU6iBkU=;
        b=CnvaAz3qaJ6v6ZvMa88gGN7AyvM7xDLIRckWpIO/eTVd1GYciqkPqxw7ZbhvBRdrH8
         KRp1JePE03L18iDPugbRz+ezkUUmguT2A1yazk/dAgZgfb2P7PcpdPTjIDSYxnMFmX7T
         cXKsr9Sx7mAsjnJmARCi3SRS+NgXu0fRlMUbYQtksADIMnRbj82F6GjpcgHS0QgoFci4
         B/7p5mpgdY5bNqbXqojvX4FCcm87r3/s+DyIcCxZdT0LmTrZpOIIQdBOqoY9M7uo/eWD
         HRdFpXPdK3Whsj7ILdcbY7GxKTNt5LVyizJAxepKSpNOBUnDhwb3YMYCwHmUS5TToi7R
         GLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043015; x=1792647815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XT00PAJLu0knCLcwz9J4YOEylZjMmPpUrDVjoU6iBkU=;
        b=E97aUlOXwusDj8yx1Z9gMel7WQaTX3YsZ4CcrjKrcns6vxLzTgG88jgaYqDoxB+19T
         +AZgN3k9D7Jnf7gNXhJV/BNTvcmqScl3biCbh7eLtOX9LryVnHkCa/FwgFZr0Oyo+qpe
         N7CVS3ZHRrYD8bgqIZY2Plw+mI8oIPmFAnPKHD8Sjbj/xzaG1qYLkT1/iFasTTwcx5U1
         /Hnf0s0/2F6i6JKG2wpE09FS9Q6xfSNNawH0BgjfBB9Yxles83NERYDadPAgWWcbgq3c
         LSfngbl77/lkZiaVYCukmxqpehy8dhlRyM5LhuVBEKLyez87iGv7lNKF6qjTWY/H+frm
         0u7g==
X-Gm-Message-State: AFq9FYIwfsVoBGXuhSCi9puEaF/hCEV660KYfseHu3DzOO5csC0nbxjl
	FHIxKffwQo4hOUllc4kFw2XkdpGIQBiSlxcaiWqrbI/AVI6CRoiIXlnDej7pPw==
X-Gm-Gg: AYBFou3tuARtjk/9W0ppQRvSV8/Umer18mYngx6YQvySJt0FipxYXgt+zX258ZZSTjU
	nv0LTGQOlaRnlPISSIB4Ae/Z2JjkB+deXxB0478pH8ijJ3ZzGEN9RXhC1cVGOa7pg5OMsbHnjWw
	8Qf3FUTOzXcxUXYdzUNSmviG6SudaLA2uQ11xi02uwNnIwaEMFdvKqgrlCFyrH4811tvt6AxtaI
	QSPs3IVRRi6NYMXgGdBusYTe9zLjkfkk5epvXtzwK7ABW52cgX2BxLQmQx/Ahaj3EEFyK8kEg3X
	dWIwieTiF6qPWog+ZOwRjal5b+eRgIGWxGeD2/1795HH8DCqYLY4uoSSWFiMDK/vedEpHzgAQQa
	T2VVqIchwOc4bXYBE5V4ONEYsIY0vTmgjqxyVwzhs36p1+6zR5Gr8YoudRjRTMD1FsUmirlcB4F
	bmCLWp0ZdGpyISDLdGOty+0+BvOEdvllXw5wF7MJETBfJXc9gxpvr+lYQb6NapmjQ2hQcy8xXnM
	wYXfcvhoQrD2FWyTSdQMww=
X-Received: by 2002:a17:902:f70f:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2e9660a7bc6mr3005205ad.58.1792043015066;
        Wed, 14 Oct 2026 22:43:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/82] libde265: patch CVE-2026-49337
Date: Thu, 15 Oct 2026 18:41:10 +1300
Message-ID: <c4a222a650e00835cf8447e2970b1857c84d83b1.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130942

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
index 6bed3250fa..5fcf641113 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2026-49295.patch \
+           file://CVE-2026-49337.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

