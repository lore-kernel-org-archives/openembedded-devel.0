Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E630EC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 04:57:20 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.45085.1695013036955062436
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 21:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gDW8oQr6;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c453379020so9190535ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 21:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695013036; x=1695617836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMYwuq3g9NX2wx6lX5b1qI2ryhsxlWdbjr9w3uD2qUs=;
        b=gDW8oQr6VVTOgoETgaYn6IXXtf/3WNJNAll5c6qQtJJ1v6Da3uUgMkdJleSmBVWjsH
         ZGAQna3mQudyjItGKkPJXD7W1W2Ter7HEYIQqX9vDvp7tBOw59SMxK+//CTIu8x1hGdJ
         H+Wil69/fBJ6/r2oPJWYMHEAKQ6XyB0KHipZuqWdQn6aOc/ZTveW9SQzHFzZicoG8q5P
         SDsMbK2IHRdQgU/yhVHlsuEW6frxVp+LVn6HJtpvp8YeHk2pVJs7o1gImFZ0xorKrq2f
         H90XguJlBy5vz4JbxqWJrhLP8qzIGPYyL6A9XkjXZqgBh7gAPWJqSy7zJTGgh/LLTbwZ
         KMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695013036; x=1695617836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMYwuq3g9NX2wx6lX5b1qI2ryhsxlWdbjr9w3uD2qUs=;
        b=vzJgLiseF1JI2O4W1VIK2Bt42N3QRy+tBXk+t1apw+EZ92ZNf1l7iK1jZz+/oMR6cR
         B5XNx66yTrnNbk79NvAbTTT7bodWh+Np7kUJshQe9qLknbiyQ3JDOLMlGp2lptvurYFF
         0vGGyskdNFY9+BgvrqzQpPqxte8AW1IQ0fhKoh4VSTkr4osGx6xLs/zcZWySGmULNr0b
         +fDpoIZywZfSk59Ah43Lx6h9BJGG7ouL0vgG9+JbAV2YmBFO/uEaFlKdSQqGjsRQeaIa
         W8DCH+FMlDqIOJmYjQdAQd2qmTTn2Yw9h4QKpSYGNG9DXgZdXVzZQOPDmm+mIBQl5fZm
         c7FQ==
X-Gm-Message-State: AOJu0Ywq3exWqqbVTR7ZEEnhH6iv04lDf8uVqyQORXLsCDYe6w3POE0R
	tIJFDHR0tuMTr64m5jVN1Ucr7dYHpoE=
X-Google-Smtp-Source: AGHT+IFfaSsNCnCm/ANPmytDk1DSnqu9dPpcf6PsALVTQLdeDT4iiUFs1/GaW6WVQ2jPD5TUDBrCLQ==
X-Received: by 2002:a17:902:cec2:b0:1b7:e49f:1d with SMTP id d2-20020a170902cec200b001b7e49f001dmr7601759plg.62.1695013036070;
        Sun, 17 Sep 2023 21:57:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902e84300b001c3721897fcsm7342698plg.277.2023.09.17.21.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 21:57:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Upgrade to 4.4.24
Date: Sun, 17 Sep 2023 21:57:13 -0700
Message-ID: <20230918045713.1751183-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 04:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104921

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mongodb/mongodb/PTHREAD_STACK_MIN.patch   | 19 -------------------
 .../recipes-dbs/mongodb/mongodb_git.bb        |  7 +++----
 2 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch
deleted file mode 100644
index f08177d7b4..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/PTHREAD_STACK_MIN.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-PTHREAD_STACK_MIN is no longer a compile time define in glibc 2.34+ and since
-we only care for glibc and musl where PTHREAD_STACK_MIN is always defined there
-is no need to check for constant called PTHREAD_STACK_MIN since its already defined
-this fix may not work for wider audience but for OE needs its sufficient
-
-Upstream-Status: Inappropriate [OE-only fix]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp
-+++ b/src/third_party/boost-1.70.0/boost/thread/pthread/thread_data.hpp
-@@ -57,9 +57,7 @@ namespace boost
- #else
-           std::size_t page_size = ::sysconf( _SC_PAGESIZE);
- #endif
--#if PTHREAD_STACK_MIN > 0
-           if (size<PTHREAD_STACK_MIN) size=PTHREAD_STACK_MIN;
--#endif
-           size = ((size+page_size-1)/page_size)*page_size;
-           int res = pthread_attr_setstacksize(&val_, size);
-           BOOST_VERIFY(!res && "pthread_attr_setstacksize failed");
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 21051a8958..f1a508f3f2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.19"
-#v4.4.18
-SRCREV = "9a996e0ad993148b9650dc402e6d3b1804ad3b8a"
+PV = "4.4.24"
+#v4.4.24
+SRCREV = "0b86b9b7b42ad9970c5f818c527dd86c0634243a"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
@@ -29,7 +29,6 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-include-needed-c-header.patch \
            file://disable_runtime_check.patch \
            file://ppc64_ARCH_BITS.patch \
-           file://PTHREAD_STACK_MIN.patch \
            file://0001-add-explict-static_cast-size_t-to-maxMemoryUsageByte.patch \
            file://0001-server-Adjust-the-cache-alignment-assumptions.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
-- 
2.42.0


