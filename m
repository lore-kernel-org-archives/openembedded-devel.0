Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD50C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:19 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31700.1788776658299365231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=apu3d/xi;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso2329449a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776658; x=1789381458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVnFNtCOS9B40OlgnM4yEkvNJOe61AEqjSRmrLNtUME=;
        b=apu3d/xiFxeAtVBGG/JoelDih16rvEAqFJhXs0UcK8i9pINU6JE9D9wGD6w4ddGM5m
         u+5wCTwxbuQ+7DBP7Ywcq0T96H+hBDLcvMu1iTTk8H+vvxm9H4cspzmDNDocR8eGt7vJ
         hd/pKLk9JhzIYVqKf9PZs+/UzWFKMLA6EeS46sBQtcgSJ4u6yICeSQdhw8fXvZV6TV4O
         cH55jT/uL0s5ybssOc1ob31mqCfj1kOJ9CJkydlhXe3rRetTS5j/NfLxaG3ABrlBUy5g
         By53wPS8d1/PUHu8L2MgrfQiOSO0eDweYKwgBR/UdAd10oivn9/NirhIBCgceaei7ziB
         FTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776658; x=1789381458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVnFNtCOS9B40OlgnM4yEkvNJOe61AEqjSRmrLNtUME=;
        b=SAzi+PDTW+6dl7EaPNJAcz70vg4ZSSW9yLJ4Ecz8Lu86WbGshEDCPUnWabscuJNIXt
         3m9i9lXzl+OsAuCPlPA8KsVD+1zIZUkd4kDK037UVhksyiVSDWcFNc32KW4AJ7hvZ5KZ
         zk4qziJxQlGGVlrk8+j1rPDt3jLk+8ctF7t6rE7EyPvlNKzh/BDBEFdiNMjhcOzQXZ+e
         TJOGH+94rSjnkkRDPBxhSB6k+KezxYrEgH1cvtnIO+m6F7fp53zS/f5xLi3ens+BNVuz
         aHvenZzs5yfFq+T/LllNUF6qxjcKXI0iA1ZsafWcB+HYaNUJOMaO7cxj6oTY61JQyh4F
         lmWg==
X-Gm-Message-State: AFuF++linxxU2NvCEHQfAZXhebxMmlvtTCRcBRImxGwPtM4+JRhYuZ+t
	Ru7JHoZr2P24epH4WFJgIpu3Jgd+7hXduTIX54VuNwVPQqncV7WZYGtGwD8pHekk
X-Gm-Gg: AYBFou38DgQYtVL0YIlFybZRvMridnL7lOSsXZ5bpxkqmhyCfnSFxgiKnrNzskT4End
	bFPuBMmCYbZOvKuOSJJEDAIsMoAjUtwRKtMT9E3F5wG6GWfMhg+6ydxL7MIEQQN+Thxyg9kxYRc
	TwNSV3DzSZ/z2N44sA4wCYT5mRTM6ELo5PKKIOqiruwNlcgMiyo7GCad7/oMxYFoPoqzgxHLTEs
	OPzT0Y8NW6YjQz1uNcGcS8DZi0I+vAJM6TFmcO5N+UY6uIFIAgxiTA/q+m2gezaJRHGPZeIvf03
	4Un5mJoEuRp7KIZ3RnCPltkE8oZWP3WIb1ycpLtxnHHhaJCtyXyDGD4sju9ouYzIp378Qu97wxC
	cj3/POcYZVLuqCGC1btxMV6FsabDi/dUec8uiN7JqDlHYVxWMegX9XvBfxlmEnq+xCXJKvtZn3r
	kUH/gqODGTlSMrT5+RFLHw+yYbCqyuBUJ0TuyLhRQJkhOtnofFV7+CYjhnxKwtfxSbKgDFP61Y
X-Received: by 2002:a05:6a20:c91c:b0:3d0:8cbb:8c2d with SMTP id adf61e73a8af0-3da39d18686mr36498510637.4.1788776657643;
        Mon, 07 Sep 2026 03:24:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 18/33] tesseract: patch CVE-2026-73066
Date: Mon,  7 Sep 2026 22:23:02 +1200
Message-ID: <20260907102318.2459883-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129830

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-73066

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tesseract/tesseract/CVE-2026-73066.patch  | 152 ++++++++++++++++++
 .../tesseract/tesseract_5.5.2.bb              |   4 +-
 2 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73066.patch

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73066.patch b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73066.patch
new file mode 100644
index 0000000000..fc762ba8ca
--- /dev/null
+++ b/meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-73066.patch
@@ -0,0 +1,152 @@
+From f66bfcc45d1acd3e3c98f81e1edc8ddf49786555 Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Thu, 23 Jul 2026 18:05:39 +0200
+Subject: [PATCH] Fix integer overflow in LSTM Convolve and Reconfig
+ deserialization (#4588)
+
+Add range and overflow validation in Convolve::DeSerialize and
+Reconfig::DeSerialize to prevent a crafted .traineddata file from
+triggering a heap out-of-bounds write via unchecked signed integer
+multiplication when computing the output-channel count.
+
+Validate ni/no/num_weights in Network::CreateFromFile.
+
+Add defense-in-depth bounds assertions in NetworkIO::Randomize and
+NetworkIO::CopyTimeStepGeneral.
+
+Reported-by: Eunho Kim <eunhok98@gmail.com>
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+Assisted-by: OpenCode / big-pickle (opencode)
+Tested-by: Eunho Kim <eunhok98@gmail.com>
+(cherry picked from commit 2f4d2f4bf45c363785d7bf1da29b6628f8939a72)
+
+CVE: CVE-2026-73066
+Upstream-Status: Backport [https://github.com/tesseract-ocr/tesseract/commit/2f4d2f4bf45c363785d7bf1da29b6628f8939a72]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lstm/convolve.cpp  | 24 +++++++++++++++++++++++-
+ src/lstm/network.cpp   |  6 ++++++
+ src/lstm/networkio.cpp |  2 ++
+ src/lstm/reconfig.cpp  | 20 +++++++++++++++++++-
+ 4 files changed, 50 insertions(+), 2 deletions(-)
+
+diff --git a/src/lstm/convolve.cpp b/src/lstm/convolve.cpp
+index 6cfaa06e..d20a991c 100644
+--- a/src/lstm/convolve.cpp
++++ b/src/lstm/convolve.cpp
+@@ -23,8 +23,11 @@
+ 
+ #include "convolve.h"
+ 
++#include <cstdint>
++
+ #include "networkscratch.h"
+ #include "serialis.h"
++#include "tprintf.h"
+ 
+ namespace tesseract {
+ 
+@@ -46,7 +49,26 @@ bool Convolve::DeSerialize(TFile *fp) {
+   if (!fp->DeSerialize(&half_y_)) {
+     return false;
+   }
+-  no_ = ni_ * (2 * half_x_ + 1) * (2 * half_y_ + 1);
++  if (half_x_ < 0 || half_y_ < 0 || ni_ <= 0) {
++    tprintf("Error: invalid Convolve parameters: ni=%d half_x=%d half_y=%d\n", ni_, half_x_,
++            half_y_);
++    return false;
++  }
++  int64_t kx = 2LL * half_x_ + 1;
++  int64_t ky = 2LL * half_y_ + 1;
++  // Stepwise overflow check: ni_ * kx * ky must fit in int.
++  if (kx > INT_MAX / ky) {
++    tprintf("Error: Convolve output-channel count overflows: ni=%d half_x=%d half_y=%d\n", ni_,
++            half_x_, half_y_);
++    return false;
++  }
++  int64_t kxky = kx * ky;
++  if (static_cast<int64_t>(ni_) > INT_MAX / kxky) {
++    tprintf("Error: Convolve output-channel count overflows: ni=%d half_x=%d half_y=%d\n", ni_,
++            half_x_, half_y_);
++    return false;
++  }
++  no_ = static_cast<int>(static_cast<int64_t>(ni_) * kxky);
+   return true;
+ }
+ 
+diff --git a/src/lstm/network.cpp b/src/lstm/network.cpp
+index cfddbfd4..8230992a 100644
+--- a/src/lstm/network.cpp
++++ b/src/lstm/network.cpp
+@@ -247,6 +247,12 @@ Network *Network::CreateFromFile(TFile *fp) {
+     return nullptr;
+   }
+ 
++  if (ni < 0 || no < 0 || num_weights < 0) {
++    tprintf("Error: invalid network layer parameters: type=%d ni=%d no=%d num_weights=%d\n", type,
++            ni, no, num_weights);
++    return nullptr;
++  }
++
+   switch (type) {
+     case NT_CONVOLVE:
+       network = new Convolve(name, ni, 0, 0);
+diff --git a/src/lstm/networkio.cpp b/src/lstm/networkio.cpp
+index 3cb068c6..8636075b 100644
+--- a/src/lstm/networkio.cpp
++++ b/src/lstm/networkio.cpp
+@@ -405,6 +405,7 @@ void NetworkIO::CopyTimeStepFrom(int dest_t, const NetworkIO &src, int src_t) {
+ void NetworkIO::CopyTimeStepGeneral(int dest_t, int dest_offset, int num_features,
+                                     const NetworkIO &src, int src_t, int src_offset) {
+   ASSERT_HOST(int_mode_ == src.int_mode_);
++  ASSERT_HOST(dest_offset + num_features <= NumFeatures());
+   if (int_mode_) {
+     memcpy(i_[dest_t] + dest_offset, src.i_[src_t] + src_offset, num_features * sizeof(i_[0][0]));
+   } else {
+@@ -414,6 +415,7 @@ void NetworkIO::CopyTimeStepGeneral(int dest_t, int dest_offset, int num_feature
+ 
+ // Sets the given range to random values.
+ void NetworkIO::Randomize(int t, int offset, int num_features, TRand *randomizer) {
++  ASSERT_HOST(offset + num_features <= NumFeatures());
+   if (int_mode_) {
+     int8_t *line = i_[t] + offset;
+     for (int i = 0; i < num_features; ++i) {
+diff --git a/src/lstm/reconfig.cpp b/src/lstm/reconfig.cpp
+index 2f49d63e..a4e99497 100644
+--- a/src/lstm/reconfig.cpp
++++ b/src/lstm/reconfig.cpp
+@@ -18,6 +18,10 @@
+ 
+ #include "reconfig.h"
+ 
++#include <cstdint>
++
++#include "tprintf.h"
++
+ namespace tesseract {
+ 
+ Reconfig::Reconfig(const std::string &name, int ni, int x_scale, int y_scale)
+@@ -60,7 +64,21 @@ bool Reconfig::DeSerialize(TFile *fp) {
+   if (!fp->DeSerialize(&y_scale_)) {
+     return false;
+   }
+-  no_ = ni_ * x_scale_ * y_scale_;
++  if (x_scale_ <= 0 || y_scale_ <= 0 || ni_ <= 0) {
++    tprintf("Error: invalid Reconfig parameters: ni=%d x_scale=%d y_scale=%d\n", ni_, x_scale_,
++            y_scale_);
++    return false;
++  }
++  int64_t xs = x_scale_;
++  int64_t ys = y_scale_;
++  // Stepwise overflow check: ni_ * x_scale_ * y_scale_ must fit in int.
++  int64_t xsys = xs * ys;
++  if (static_cast<int64_t>(ni_) > INT_MAX / xsys) {
++    tprintf("Error: Reconfig output-channel count overflows: ni=%d x_scale=%d y_scale=%d\n", ni_,
++            x_scale_, y_scale_);
++    return false;
++  }
++  no_ = static_cast<int>(static_cast<int64_t>(ni_) * xsys);
+   return true;
+ }
+ 
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index 46b789cbc4..1b5a5fe2df 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -6,7 +6,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "6e1d56a847e697de07b38619356550e5cf4e8633"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV}"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV} \
+           file://CVE-2026-73066.patch \
+"
 
 
 DEPENDS = "leptonica"

