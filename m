Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8B4C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:02:51 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.2168.1702389764173426683
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T44D5N4x;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50c04ebe1bbso5532503e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 06:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702389762; x=1702994562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=djXnZA46yewxDfMM2T9xwQuv213fk4C7GHVa7cjEzFk=;
        b=T44D5N4xn2grqcVKYNj3JwBOGCLc1Zz0baMo+U8wv+Q69hsBulKaQ+KqcrU0tyVdYT
         Iq6faDZuLp6oKbbNGRf2z+6HOBnCqaxZEKoLXpRmYZcKKyxD1KUtTHjYv+zm4zcG1IDn
         J8Gb9fNQVecusjlTe8TffgYN7rN4/EDRkRg5ZqkmO/CJNkR4yTwlxguTYNjy3b2lmnKy
         l/YRv2XqkfZHJuhrCpFrqq4hkOpprmK1+nvL6mYHvg9+xdeumS74F2IkobekhmxjN38H
         xz/hOcTQUPFMWBwg5HV/xCgWY3C1u10emFcM0/KD9P1LPt6xK4eoFN1gRafF5stMuZpq
         p94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389762; x=1702994562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djXnZA46yewxDfMM2T9xwQuv213fk4C7GHVa7cjEzFk=;
        b=Y7FUgjt6ScwEr63FFbS3Ftsk8irPrGmPPR75alQqw1cc3yJoVHAern78LDNnpq8lcm
         5EYAApLEXyJjDIurj3k5LfNCUNu1hUnNdb4KaXfQxNHYA9oVS+3sxGc0j2Lvh8suthaU
         h+NVM+NOyewXmNt8ICAbjAvYcPM6G+YXjwX8S+vIgqe6SIDGRgjo50sEI1b/r9MyqQio
         LLRA3S3Vl7mxNNPeoPWn3fRPjVMk0PlqU3lIZ7tObEzOxQHUppijXcmVVEZiznGwhg07
         NPSI3N7uBrFUHdN/CVgqbZ2R1UUYntWKETXgdSyn6U8Y1v/7LZ59fLHSSPwWJLVafZUw
         eH1g==
X-Gm-Message-State: AOJu0YxBSogtlgg3mAf/B9c7y1NkmAtBFpDKFanyRxajqmTxv9QAUhOx
	V8XLwBuv9tINx6DCFp/ejdOoPBD51OYrZu/jWBFRGg==
X-Google-Smtp-Source: AGHT+IF2omen6Q2tpfsdLk8beCFLatTNweoq9tsHXYDK6wlqQAeBQ6o2d+PD5DOV2LHNDeQmP/tE7A==
X-Received: by 2002:a05:6512:3ba9:b0:50b:f231:d444 with SMTP id g41-20020a0565123ba900b0050bf231d444mr4441838lfv.7.1702389761635;
        Tue, 12 Dec 2023 06:02:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b005007e7211f7sm1367490lfb.21.2023.12.12.06.02.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:02:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools: remove two Debianisms
Date: Tue, 12 Dec 2023 16:02:40 +0200
Message-Id: <20231212140240.2600626-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 14:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107334

If the build happens on a Debian system, android-tools build will hang
forever, filling the log files (and the disk) with the following
messages:

make: dpkg-architecture: No such file or directory
make: dpkg-architecture: No such file or directory
make: dpkg-architecture: No such file or directory
make: dpkg-architecture: No such file or directory
/usr/share/dpkg/architecture.mk:9: pipe: Too many open files
/usr/share/dpkg/architecture.mk:9: pipe: Too many open files
/usr/share/dpkg/architecture.mk:9: pipe: Too many open files
/usr/share/dpkg/architecture.mk:9: pipe: Too many open files
/usr/share/dpkg/architecture.mk:9: pipe: Too many open files

Fix two places which include dpkg makefile fragments from the host
system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...tools-modifications-to-make-it-build-in-yoct.patch | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
index e749366bb631..b719acec4c5a 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0002-android-tools-modifications-to-make-it-build-in-yoct.patch
@@ -88,11 +88,12 @@ diff --git a/debian/system/core/libbacktrace.mk b/debian/system/core/libbacktrac
 index e3411d76..86e69874 100644
 --- a/debian/system/core/libbacktrace.mk
 +++ b/debian/system/core/libbacktrace.mk
-@@ -1,3 +1,4 @@
+@@ -1,4 +1,4 @@
+-include /usr/share/dpkg/architecture.mk
 +include rules_yocto.mk
- include /usr/share/dpkg/architecture.mk
  
  NAME = libbacktrace
+ 
 @@ -83,10 +84,9 @@ CPPFLAGS += \
  LDFLAGS += \
    -L/usr/lib/p7zip \
@@ -218,6 +219,12 @@ diff --git a/debian/system/core/libutils.mk b/debian/system/core/libutils.mk
 index c37b1d2d..332492c1 100644
 --- a/debian/system/core/libutils.mk
 +++ b/debian/system/core/libutils.mk
+@@ -1,4 +1,4 @@
+-include /usr/share/dpkg/architecture.mk
++include rules_yocto.mk
+ 
+ NAME = libutils
+ 
 @@ -41,7 +41,7 @@ CPPFLAGS += \
  
  LDFLAGS += \
-- 
2.39.2


