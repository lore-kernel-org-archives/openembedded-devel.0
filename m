Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9EA104BEBE
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:04:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17297.1773223437718662043
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=evURpt3Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c6fc2910so5583805f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773223436; x=1773828236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/+4eJfmZZ0mQKF5fANb8gpYkLxBVlx4jCQFI8eQyHk=;
        b=evURpt3QBWgyP05J8qM6Zzw9ZdTycyndDQy868D1zKmcYawODsPl2ioVyXQr2iI4Q4
         Wm6vsNd6C4uf4rug+YBtnQq89Fs42QhTepP7wH7yYnju0Y8qqLmxSWXbwYH+qTcocbt3
         XHtNPUXgxx+lITpZV+ol0p23BqtDfb3YOFKHuQ7Z2eLsqHw6chOFcT2as7h0StSTs6B6
         fK7RauB9jyehaOLykQwQSk3SO0FpaurDqP1QWukX7yK16IP2A5Gg7ADnKBwSqyNjqqny
         TFPacLwYD/3Uimx+9/9cS9cqFSPj9dmQ0QmsvPYj+8uSVU5HVYVE/FnCe2nsAJ8WRkhB
         1s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773223436; x=1773828236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/+4eJfmZZ0mQKF5fANb8gpYkLxBVlx4jCQFI8eQyHk=;
        b=owpMt7EWDS5o5RYJgUP4vBWz9Pu1jCzN0ICt+/DgJEmu752PQ15c/TDuo5ZevaefI7
         AdhTmtfV8x4k7hInqjwD0s1Yhu4TDvUWjM1EOifjrDlqI4genUc3MC5TGGj7SXzD5H3e
         bcuvIM4ZCU0fYhiWUjY0/yKaLN947vfPB4VHzI+3lZcN/FUqgRiF1nvx0Mw5L4chFmGt
         nnfsKfveA0AZEv6mKkdG0n8PvuwIVPyTqNqWx5jZ5mR6Gd4iXwdgtU2KSBl23utBvae/
         Np8gmDLAmuPNT1vFiD28MboMBkkIZ/e/R7VuxWb2IPnMGH3E754hiSRYTJda9krq0JN/
         e92A==
X-Gm-Message-State: AOJu0YxFSmClmNnqVzAmBFM8RmbPw2VRiymEaJ1jPM37A3cw/VZLYFe/
	WRoUwA4mF924hDlsIG70WPfqxl2RVDTQdGxLXKygMX79H35qsa4rJEG0WBuEWg==
X-Gm-Gg: ATEYQzzXI8WTcnnEpsAC8tLYydVGkKJ4juoo0hRgwGSDCOHo4E6ZxAFyYWnXx+xefCL
	+GsQDaUksxMVZYPQ8Jn9htWUVRylJt0v0+XRXhq4SuyTPCI1m6pZxHMZkjRHwlhCkdMZ/tYeOMS
	hH8NMHeaVqsax8s1pRffe71UWDvOOO61v5b6oewM+TOxQ5E4ObM4il3NbsYAdk7HaaqIyrr9Tmq
	FVKJ5dECIv6/g3b3OFwX6RWcIqo0PmyAlvrPV/ibsoCYWOqIDx2OYV3lKtNkvQZerjTOCTNIFdK
	WYcq6xe/qrcZCHwG1lUt6wouvNQdwj5Z7EiaOQQTZY2ApwvBN2z88dJRmy562TStDfq1HzTCOGK
	II/S+wgUmWtnt5ec0se0tt+iM/ieSXdDimsbZoKY758FraBKRSFtz+4HOkhIn1BAfQg/oeeQT3O
	0mHUWOnnAtpAraxhpmj/Je
X-Received: by 2002:a05:6000:258a:b0:439:bf2f:122f with SMTP id ffacd0b85a97d-439f8434f7emr3747929f8f.45.1773223435930;
        Wed, 11 Mar 2026 03:03:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f82067a2sm4575816f8f.28.2026.03.11.03.03.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:03:55 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/3] exiv2: patch CVE-2026-27631
Date: Wed, 11 Mar 2026 11:03:52 +0100
Message-ID: <20260311100352.1638062-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311100352.1638062-1-skandigraun@gmail.com>
References: <20260311100352.1638062-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 10:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125080

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27631

Backport the patches referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2026-27631-1.patch        | 63 +++++++++++++++++++
 .../exiv2/exiv2/CVE-2026-27631-2.patch        | 26 ++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
new file mode 100644
index 0000000000..918c9a234a
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
@@ -0,0 +1,63 @@
+From 70edff9f6f5af7314b65d6aab04b208f752f8953 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 26 Feb 2026 21:14:10 +0000
+Subject: [PATCH] Regression test for
+ https://github.com/Exiv2/exiv2/issues/3513
+
+CVE: CVE-2026-27631
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/7adedce8c779e9c7bce843cbaf9eff26bc1659b6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/data/issue_3513_poc.psd                   | Bin 0 -> 206 bytes
+ tests/bugfixes/github/test_issue_3513.py       |  17 +++++++++++++++++
+ .../test_regression_allfiles.py                |   1 +
+ 3 files changed, 18 insertions(+)
+ create mode 100644 test/data/issue_3513_poc.psd
+ create mode 100644 tests/bugfixes/github/test_issue_3513.py
+
+diff --git a/test/data/issue_3513_poc.psd b/test/data/issue_3513_poc.psd
+new file mode 100644
+index 0000000000000000000000000000000000000000..b8cf982ccc29e4574783b1317347a8494bce4240
+GIT binary patch
+literal 206
+zcmcC;3J7LkWXND(VPIfj2I6QSp2oldW&@cF4i-+HzAOnKCIbVQ%?V)xNk#^S{{sU!
+VK$eS7U=ZX2Ii>-KnHh{ttN=+HebfK|
+
+literal 0
+HcmV?d00001
+
+diff --git a/tests/bugfixes/github/test_issue_3513.py b/tests/bugfixes/github/test_issue_3513.py
+new file mode 100644
+index 000000000..5383470e4
+--- /dev/null
++++ b/tests/bugfixes/github/test_issue_3513.py
+@@ -0,0 +1,17 @@
++# -*- coding: utf-8 -*-
++
++import system_tests
++
++
++class test_issue_3513_PsdImage_readResourceBlock(metaclass=system_tests.CaseMeta):
++    url = "https://github.com/Exiv2/exiv2/issues/3513"
++
++    filename = "$data_path/issue_3513_poc.psd"
++    commands = ["$exiv2 -pp $filename"]
++    retval = [1]
++    stderr = [
++        """$exiv2_exception_message $filename:
++$kerCorruptedMetadata
++"""
++    ]
++    stdout = [""]
+diff --git a/tests/regression_tests/test_regression_allfiles.py b/tests/regression_tests/test_regression_allfiles.py
+index 34bea3b03..ef7b066e0 100644
+--- a/tests/regression_tests/test_regression_allfiles.py
++++ b/tests/regression_tests/test_regression_allfiles.py
+@@ -124,6 +124,7 @@ def get_valid_files(data_dir):
+         "pocIssue283.jpg",
+         "poc_1522.jp2",
+         "xmpsdk.xmp",
++        "issue_3513_poc.psd",
+         "issue_3511_poc.eps",
+         # large file that creates 11Mb of output so let's exclude it
+         "ReaganLargeTiff.tiff",
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
new file mode 100644
index 0000000000..e762b10b6d
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
@@ -0,0 +1,26 @@
+From 5a6dd6015d436c1f64b55b47bb50ef8fa72f11d2 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 27 Feb 2026 10:38:22 +0000
+Subject: [PATCH] Check for integer overflow.
+
+CVE: CVE-2026-27631
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/284b4e20229dd6edf492e712871878ae320801fc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/psdimage.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/psdimage.cpp b/src/psdimage.cpp
+index 1a8e4c61c..b2f5247a2 100644
+--- a/src/psdimage.cpp
++++ b/src/psdimage.cpp
+@@ -287,6 +287,9 @@ void PsdImage::readResourceBlock(uint16_t resourceId, uint32_t resourceSize) {
+       nativePreview.height_ = getLong(buf + 8, bigEndian);
+       const uint32_t format = getLong(buf + 0, bigEndian);
+ 
++      Internal::enforce(nativePreview.size_ <= static_cast<size_t>(std::numeric_limits<long>::max()),
++                        Exiv2::ErrorCode::kerCorruptedMetadata);
++
+       if (nativePreview.size_ > 0 && nativePreview.position_ > 0) {
+         io_->seek(static_cast<long>(nativePreview.size_), BasicIo::cur);
+         if (io_->error() || io_->eof())
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index 9ec2f48a77..f9ccdc079f 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
            file://CVE-2026-25884-2.patch \
            file://CVE-2026-27596-1.patch \
            file://CVE-2026-27596-2.patch \
+           file://CVE-2026-27631-1.patch \
+           file://CVE-2026-27631-2.patch \
            "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"

