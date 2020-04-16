Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.7343.1587046627743339276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 07:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q2wR7t4e;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: gregory.vimont@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h26so5026514wrb.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 07:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7/6dncO+TkTxiq1CL+LqzIgx+qBgGUM123vjITbOfKk=;
        b=q2wR7t4eubg3QFbzjJ+N3POeNozVgjGm/FoAw4Drrah3lfwACIGtQqFp5NCgPhiVwX
         TXpaMZ3wl0NorFKk7uHZ8YLMoA5/O1bTTf5fQ3toZTRoIXpD9ezVQY9w7IV0eMvJDy5D
         kalUfqQCkpeNbAdW+QTUfi50zdeK+D02WnzUeyDLtptwPpTViLdYjKetotgI8rnAPEAW
         oa0VzE+WO9ZnzC/50skkTBXup3tbPyUYIuYLm0JvjSwnmKU4AyyyeVFglHr3fyIEYyuu
         SecQlqcjGYvDIXiOs7WGmnwjt0HKB62T2ZMUKrW0t9PhnE40Msztk+WxKFT/dq85d5H5
         +Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7/6dncO+TkTxiq1CL+LqzIgx+qBgGUM123vjITbOfKk=;
        b=GcHQUAAyqwbhjLYESlS1KgkZu5JKaWkZGnf1N7+N9syeBSoej8doHcLKP2eEExsBiF
         3Q+ecINJMUI8a0TkVnGdQ8xRl7REG8sF1Pheh8Jn6uAXvkB+kDu4n6D0zzYNWigcsCj3
         h3zSLhx6s0xzTtsG9GnPdmmSZPBiBDrfg3kfpsX5WhQWiz6v8B1/WL2LTSB3PWtyU+k3
         C8bBjk6bsfK0LARALxiSCXFesQ/UbH4Bwuo6ibWkGxeYB14iMsqXRxonlEYo6PdECUth
         fzp5DgMnNdZxGq/cRXsjhntg9H4d+OWV5x/pkUTrWMEoHYPQFjgARjOqVe+vgnR0TnH5
         sVbQ==
X-Gm-Message-State: AGi0PublnuEVJKk8Eqk6K/r2DQkOg4jq2ZCnWWFKa6k1QttFen4xXMEV
	eCaXYZO6UfeO2fueYOll/dkRqhJ6GJE=
X-Google-Smtp-Source: APiQypIY0hfW2b46rkdNkkoUkftVRmEj6xpIuYW4mF0CI1EDMrR8wGqoWuwszfz7Me6JIqkHb9vEJA==
X-Received: by 2002:adf:df8d:: with SMTP id z13mr10977265wrl.304.1587046626026;
        Thu, 16 Apr 2020 07:17:06 -0700 (PDT)
Return-Path: <gregory.vimont@gmail.com>
Received: from ALD-1799-DE.aldebaran.lan (softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu. [158.255.112.194])
        by smtp.gmail.com with ESMTPSA id r27sm8640992wra.83.2020.04.16.07.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 07:17:05 -0700 (PDT)
From: "Gregory Vimont" <gregory.vimont@gmail.com>
X-Google-Original-From: Gregory Vimont <gregory.vimont@softbankrobotics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][PATCH 2/3] opencv: Fix CVE-2019-15939
Date: Thu, 16 Apr 2020 16:16:55 +0200
Message-Id: <20200416141656.7900-2-gregory.vimont@softbankrobotics.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>

Fixes a floating point exception
https://github.com/opencv/opencv/issues/15287

Upstream-Status: Backport
[https://github.com/opencv/opencv/commit/c05595e48274188e34a30d37ef22bdedc87c53ae]
CVE: CVE-2019-15939
Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
---
 .../opencv/opencv/CVE-2019-15939.patch        | 67 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.1.1.bb    |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
new file mode 100644
index 000000000..b1e996df3
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-15939.patch
@@ -0,0 +1,67 @@
+From 5a497077f109d543ab86dfdf8add1c76c0e47d29 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Fri, 23 Aug 2019 16:14:53 +0300
+Subject: [PATCH] objdetect: add input check in HOG detector
+
+---
+ modules/objdetect/src/hog.cpp | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/modules/objdetect/src/hog.cpp b/modules/objdetect/src/hog.cpp
+index 9524851eebb..378bab30876 100644
+--- a/modules/objdetect/src/hog.cpp
++++ b/modules/objdetect/src/hog.cpp
+@@ -68,6 +68,7 @@ enum {DESCR_FORMAT_COL_BY_COL, DESCR_FORMAT_ROW_BY_ROW};
+ 
+ static int numPartsWithin(int size, int part_size, int stride)
+ {
++    CV_Assert(stride != 0);
+     return (size - part_size + stride) / stride;
+ }
+ 
+@@ -80,13 +81,17 @@ static Size numPartsWithin(cv::Size size, cv::Size part_size,
+ 
+ static size_t getBlockHistogramSize(Size block_size, Size cell_size, int nbins)
+ {
++    CV_Assert(!cell_size.empty());
+     Size cells_per_block = Size(block_size.width / cell_size.width,
+-        block_size.height / cell_size.height);
++                                block_size.height / cell_size.height);
+     return (size_t)(nbins * cells_per_block.area());
+ }
+ 
+ size_t HOGDescriptor::getDescriptorSize() const
+ {
++    CV_Assert(!cellSize.empty());
++    CV_Assert(!blockStride.empty());
++
+     CV_Assert(blockSize.width % cellSize.width == 0 &&
+         blockSize.height % cellSize.height == 0);
+     CV_Assert((winSize.width - blockSize.width) % blockStride.width == 0 &&
+@@ -144,20 +149,20 @@ bool HOGDescriptor::read(FileNode& obj)
+     if( !obj.isMap() )
+         return false;
+     FileNodeIterator it = obj["winSize"].begin();
+-    it >> winSize.width >> winSize.height;
++    it >> winSize.width >> winSize.height; CV_Assert(!winSize.empty());
+     it = obj["blockSize"].begin();
+-    it >> blockSize.width >> blockSize.height;
++    it >> blockSize.width >> blockSize.height; CV_Assert(!blockSize.empty());
+     it = obj["blockStride"].begin();
+-    it >> blockStride.width >> blockStride.height;
++    it >> blockStride.width >> blockStride.height; CV_Assert(!blockStride.empty());
+     it = obj["cellSize"].begin();
+-    it >> cellSize.width >> cellSize.height;
+-    obj["nbins"] >> nbins;
++    it >> cellSize.width >> cellSize.height; CV_Assert(!cellSize.empty());
++    obj["nbins"] >> nbins; CV_Assert(nbins > 0);
+     obj["derivAperture"] >> derivAperture;
+     obj["winSigma"] >> winSigma;
+     obj["histogramNormType"] >> histogramNormType;
+     obj["L2HysThreshold"] >> L2HysThreshold;
+     obj["gammaCorrection"] >> gammaCorrection;
+-    obj["nlevels"] >> nlevels;
++    obj["nlevels"] >> nlevels; CV_Assert(nlevels > 0);
+     if (obj["signedGradient"].empty())
+         signedGradient = false;
+     else
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.1.bb b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
index 5074eb2fa..c77c7ff80 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-Dont-use-isystem.patch \
            file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
            file://download.patch \
+           file://CVE-2019-15939.patch \
            "
 PV = "4.1.1"
 
-- 
2.17.1

