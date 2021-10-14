Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC12C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:14:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.1710.1634249663583187454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=A+I1gi58;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id x27so33390647lfu.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Yyc2QKzfYQ1LS0BPtERHl4l/UWmlwXRVtFSoa85Odo=;
        b=A+I1gi58VJ0IIeY3O0rqHTjbJDks4hHp8i2RNxURZ88SSS5CAq0HuEeErMAdGnrXMo
         E5mEjxMgDH7aHpGFLEr4pstdD5bfg+Sp/yWstdmagXDJNDb7ilNNlkeZO7426wCoGGSW
         Kp9vo5SzZWm7lt6SoeiuWxId3n+B7Fyn/9Jo86jMKU59EHnhUdiFikGmeVEFcUmh4yZz
         FFxd0RkiArRp9gCU7XYkEgNkDIUN7HqEHd5cXrHi8EDhh3JXow4BoJ/sq3iw11jY3gMZ
         owLttNqDUQJix5AHHxpF6VB83l5Bu9xlaBbH7IImaHwuIxQnjTf1heXI9e2OMhgAE9+J
         VJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Yyc2QKzfYQ1LS0BPtERHl4l/UWmlwXRVtFSoa85Odo=;
        b=1VQMPCfZEPjxeyTkqyA/skr8e40C7LBm5mPFFqXRZVdeA7+mBiW03ARC0yc+Ngcx0r
         uapllVFsm4vFvB0WtVjfGiR2pIcoZ+VlwX/+4ccM7jmqRrGTBXJF7bde4Ha2bGzGF5kH
         2E2evhMo8KcvgOjJ953iIoHfmZ4tDwAg2ydlffBYNdOIJYYdkuewMwSiGFMzyNa2MLxr
         1AaNWf8KfUDk1sHZlv4Gi/UMScOujX+lrWKKkuOzznb6KyIahejPwTi2yp6OlWWtcG9u
         mP+NaPYP08/hCHBS82F9TNWL4ljYZDgRSa6OsOsE7IKINN4XR8y9sy5ezjW+UHtoX4hf
         vTyw==
X-Gm-Message-State: AOAM533KG4b+YnHBIGdPh5YXouonBClFmHC7sf+LyuJn3Yy8YdkK0bIz
	amiIQREXqMhtaSDLAreuWN2ww+XUz6fXSS57
X-Google-Smtp-Source: 
 ABdhPJy/LXA5soFMo4fuEkQaZMtgvjDCsAD2U+lPxpa//Z07ybBppqF3O3r6wQUMCzdtRmLYRRNy+g==
X-Received: by 2002:a2e:9790:: with SMTP id y16mr9290147lji.175.1634249661279;
        Thu, 14 Oct 2021 15:14:21 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 r3sm332229lfc.169.2021.10.14.15.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 15:14:20 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] protobuf-c: update to 1.4.0
Date: Fri, 15 Oct 2021 00:14:19 +0200
Message-Id: <20211014221419.3705787-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93306

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../0001-avoid-race-condition.patch           | 36 -------------------
 ...rotobuf-c_1.3.3.bb => protobuf-c_1.4.0.bb} |  7 ++--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.3.bb => protobuf-c_1.4.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
deleted file mode 100644
index 4fc7703d8..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Sun, 29 Sep 2019 17:20:42 +0800
-Subject: [PATCH] avoid race condition
-
-It's possible that the cxx-generate-packed-data.cc is compiled
-while the t/test-full.pb.h is being generated. This will result
-the following error.
-
-  DEBUG:	./t/test-full.pb.h:4:0: error: unterminated #ifndef
-  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
-
-Add a dependency to avoid such problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index b0cb065..1608ae0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -156,6 +156,7 @@ noinst_PROGRAMS += \
- t_generated_code2_cxx_generate_packed_data_SOURCES = \
- 	t/generated-code2/cxx-generate-packed-data.cc \
- 	t/test-full.pb.cc
-+t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
- $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
- t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
- 	$(AM_CXXFLAGS) \
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
index 1a0bf535c..cc037d393 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
@@ -12,11 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRCREV = "f20a3fa131c275a0e795d99a28f94b4dbbb5af26"
-
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
-           file://0001-avoid-race-condition.patch \
-          "
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
+SRCREV = "f224ab2eeb648a818eb20687d7150a285442c907"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


