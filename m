Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C29C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 05:22:52 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.189986.1673932965972207190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 21:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W53Ljns2;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id a14-20020a17090a70ce00b00229a2f73c56so906409pjm.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 21:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCr6/biAeMqRiah1dKOJK3CpL82IjYPku3p+5XObmFE=;
        b=W53Ljns2Wo3JfB/HISxpZr2dm+aWZvNm56HhAcuUXxKQxdgMnFs7MYOkZvq1X0AEyK
         QPVDbSsAjVv2lul1v94lfK8/PbcU6IH6lbe/XKtGM5NXAD6BpFelmTxRh1GUY5+9kxrf
         OVCT6zuMsSw04aKKgB9C0oJKw+qVy4NMPMSRRcGq2l1AeCTH62xrQvmaV1IYz/P2b3tR
         HcyjmbrLQcXCGNiAulJgDatg/IjNlbaxOJlWa+t6DVnfFmmB1IYirQEM20Wc8nuTsuAp
         7bgPMj3LEDlsbA2UfCL8kAPiKWCu7tKzCOu3hODm9u0wO6ExrwL07Qnn2NADP+Y+AA0p
         MuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCr6/biAeMqRiah1dKOJK3CpL82IjYPku3p+5XObmFE=;
        b=GpcX3WNKobe1e500wsj69psVD6Kkv+a4U8IjgtXKcMlMrKy/M/gI1QiPFzf0kI1blA
         K4nn/mnzYLw6bVTFEwLN/ap2b4QamaROhr8FJY2XWH/dUjaGEmI3w9mlUExBHX2LazWi
         q9HB7SpKebU1c6LEPZftefnfPK8I23tF6kKtRKmyU3HGBhldKe+BBjFniesjD2omAoJW
         bRZ0DUENwGjZhJmDpOizOfmLdIu59NSZxt7bTvm3zaLuu2OdI4tcfbH7BIBjF3njxFbr
         FzcRkvP7Uiehb8LTJkriP8l7L2z6j8/66Qy/b8RvVusXY9VJpIdpHLx+nKoBzkxsCt2W
         0y4w==
X-Gm-Message-State: AFqh2krRGzEt12yv0PWUGZ1Mpwd0/n/8Ue8GzD92/CXrw+B/vHmgiaJU
	dfdkPr/NOTHCDsqisP0k9MzSkiJVk1ShNw==
X-Google-Smtp-Source: AMrXdXu+HDs577/x6Am79CZSEzG7LOCO2ppIZmeoX6d6il1037X825a6WA1VIzthFyco5tNzN8vrgg==
X-Received: by 2002:a05:6a20:6f06:b0:b5:9fd7:bb64 with SMTP id gt6-20020a056a206f0600b000b59fd7bb64mr939852pzb.39.1673932965105;
        Mon, 16 Jan 2023 21:22:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm12682692pgw.44.2023.01.16.21.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:22:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 7/7] python3-matplotlib: Fix build with c++17
Date: Mon, 16 Jan 2023 21:22:37 -0800
Message-Id: <20230117052237.3117521-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117052237.3117521-1-raj.khem@gmail.com>
References: <20230117052237.3117521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 05:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100593

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mberGenerator-class-included-random-.patch | 59 +++++++++++++++++++
 .../python/python3-matplotlib_3.6.3.bb        |  5 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch b/meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch
new file mode 100644
index 0000000000..1f9b8cdeaf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch
@@ -0,0 +1,59 @@
+From 3eb9987b02cc10b93e09219ddc86aa6be5f10177 Mon Sep 17 00:00:00 2001
+From: tybeller <ty.c.beller@gmail.com>
+Date: Fri, 30 Sep 2022 16:13:41 -0400
+Subject: [PATCH] removed RandomNumberGenerator class, included <random>,
+ replaced random_shuffle with shuffle and used mersenne twister engine to
+ generate uniform random bit generator for the shuffle.
+
+Upstream-Status: Backport [https://github.com/matplotlib/matplotlib/commit/601d92a8850]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tri/_tri.cpp | 20 ++++----------------
+ 1 file changed, 4 insertions(+), 16 deletions(-)
+
+diff --git a/src/tri/_tri.cpp b/src/tri/_tri.cpp
+index b7a87783de..6e639eea44 100644
+--- a/src/tri/_tri.cpp
++++ b/src/tri/_tri.cpp
+@@ -12,6 +12,7 @@
+ 
+ #include <algorithm>
+ #include <set>
++#include <random>
+ 
+ 
+ TriEdge::TriEdge()
+@@ -1465,8 +1466,8 @@ TrapezoidMapTriFinder::initialize()
+     _tree->assert_valid(false);
+ 
+     // Randomly shuffle all edges other than first 2.
+-    RandomNumberGenerator rng(1234);
+-    std::random_shuffle(_edges.begin()+2, _edges.end(), rng);
++    std::mt19937 rng(1234);
++    std::shuffle(_edges.begin()+2, _edges.end(), rng);
+ 
+     // Add edges, one at a time, to tree.
+     size_t nedges = _edges.size();
+@@ -2055,17 +2056,4 @@ TrapezoidMapTriFinder::Trapezoid::set_upper_right(Trapezoid* upper_right_)
+     upper_right = upper_right_;
+     if (upper_right != 0)
+         upper_right->upper_left = this;
+-}
+-
+-
+-
+-RandomNumberGenerator::RandomNumberGenerator(unsigned long seed)
+-    : _m(21870), _a(1291), _c(4621), _seed(seed % _m)
+-{}
+-
+-unsigned long
+-RandomNumberGenerator::operator()(unsigned long max_value)
+-{
+-    _seed = (_seed*_a + _c) % _m;
+-    return (_seed*max_value) / _m;
+-}
++}
+\ No newline at end of file
+-- 
+2.39.0
+
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
index 809f9425ba..fa0a78d6a9 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
@@ -27,7 +27,8 @@ inherit pypi setuptools3 pkgconfig
 
 # Stop the component from attempting to download when it detects a missing
 # dependency
-SRC_URI += "file://matplotlib-disable-download.patch"
+SRC_URI += "file://matplotlib-disable-download.patch \
+            file://0001-removed-RandomNumberGenerator-class-included-random-.patch"
 
 # This python module requires a full copy of freetype-2.6.1
 SRC_URI += "https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/build"
@@ -40,6 +41,8 @@ SRC_URI[qhull.sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b86500046
 # LTO with clang needs lld
 LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
 LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
+LDFLAGS:remove:toolchain-clang:riscv64 = "-fuse-ld=lld"
+LDFLAGS:remove:toolchain-clang:riscv32 = "-fuse-ld=lld"
 RDEPENDS:${PN} = "\
     freetype \
     libpng \
-- 
2.39.0


