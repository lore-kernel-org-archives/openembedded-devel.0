Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6767DCD4F46
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 22:35:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.63661.1725489336657382440
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 15:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oe9Z/mDR;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7178df70f28so66539b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 15:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725489336; x=1726094136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a/K9UksWV4cqkbpCKUS7yHnx2eEk6Q+b+W04j3hDAs=;
        b=Oe9Z/mDRhnWqVkGUhaaTh5fT3V7OsoJlEEXr9ZJDCXKVzTDAbxmmerMue9/9Sa9E+v
         HFcpgvkc4n26hmOWB7rZZ+y2u0R39afMOS9bMTDq7okuQl1vUs9NjxfraSj6+DcyqIHR
         uuAfNrbND3C7xXUQVGI9Cnqfdis79MoXROP3NWu68SLUn8dCWoMROyg1ImnKIdDlglsw
         55YiJfgioUsChS5OH2fbaGOA0fk/PASfd6CzUFB4rlrS/1ZlxO5rgVJErL3WTyfI/v+1
         gxepvq2MGUmfuzvrNci5+c3kHQ6nqdWyOoXW3hNhUjeEMZqDFaTzkpHfDkh/csVlCTMU
         aF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725489336; x=1726094136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a/K9UksWV4cqkbpCKUS7yHnx2eEk6Q+b+W04j3hDAs=;
        b=R5a+BczFqNZW7iOPQMHphSZR5dMhkSGWUWJIDgSu24SAl5/KF8gEIq/uMKKklQxpVz
         RihpmhqJFvLqMihD4ZuD6IyJZo2/+lwoaa5fjJSbVv6a8lWLATgKKHYDwmSp4dty1iun
         mXF+r4kDvc9//Vf3zp41M4hE48CctDMatQ0JaPrVC8qxS2rdCK3cCeQCZjTaqs+CYwg5
         jPpLQ/V4XY0IhUdBBI1U4ahWNABY1bheXcXm9R10CQANpX61R32dBGr7IGItRQaERJLB
         xfTwzDQ7m5bC1pyPvtW/9KDKbCAC6uukvO09f/M/2oTDNbM+b2IWvHvLQqaMnjfcGxXY
         FPVA==
X-Gm-Message-State: AOJu0Yz9ToiiAlgPd6fwPkIDmku56vFgte2Hyed8Thl1HDa7t9p9Ijda
	enxEr6Mn14mZXA0UDlZvp7448JvMJ5eCBafB2Qn7ITVTzAIBOSnH6PUppnx3
X-Google-Smtp-Source: AGHT+IHKjTDpGdVdghGqQ9wtg/VM4ykEj4DnNwJ2n2wpNpTRxr1y1vA1Y5jXsEq6RCM2ZgktegIMNg==
X-Received: by 2002:a05:6a00:218c:b0:714:2ba6:e5c9 with SMTP id d2e1a72fcca58-71745776a9emr15116415b3a.7.1725489335748;
        Wed, 04 Sep 2024 15:35:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785307cesm2101637b3a.55.2024.09.04.15.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:35:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] etcd-cpp-apiv3: Fix build with gprc 2.66+
Date: Wed,  4 Sep 2024 15:35:32 -0700
Message-ID: <20240904223532.37918-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904223532.37918-1-raj.khem@gmail.com>
References: <20240904223532.37918-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 22:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112091

GPR_ASSERT is removed from latest gprc

Fixes
   | /home/pokybuild/yocto-worker/meta-oe/build/build/tmp-glibc/work/core2-64-poky-linux/etcd-cpp-apiv3/0.15.4/git/src/v3/Action.cpp: In member function 'void etcdv3::Action::waitForResponse()':
   | /home/pokybuild/yocto-worker/meta-oe/build/build/tmp-glibc/work/core2-64-poky-linux/etcd-cpp-apiv3/0.15.4/git/src/v3/Action.cpp:101:5: error: 'GPR_ASSERT' was not declared in this scope
   |   101 |     GPR_ASSERT(got_tag == (void*) this);
   |       |     ^~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Replacing-GPR_ASSERT-with-c-assert.patch | 33 +++++++++++++++++++
 .../etcd/etcd-cpp-apiv3_0.15.4.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-Replacing-GPR_ASSERT-with-c-assert.patch

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-Replacing-GPR_ASSERT-with-c-assert.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-Replacing-GPR_ASSERT-with-c-assert.patch
new file mode 100644
index 0000000000..87000b663d
--- /dev/null
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-Replacing-GPR_ASSERT-with-c-assert.patch
@@ -0,0 +1,33 @@
+From aeb34f58782fb6d06aea4f5cbeccb23a0224466e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Sep 2024 14:54:42 -0700
+Subject: [PATCH] Replacing GPR_ASSERT with c assert
+
+Latest GRPC >= 2.66 has dropped GRPC_ASSERT macro [1]
+
+[1] https://github.com/grpc/grpc/commit/0e23c2259da967a037e839e80cafd62bc6f9f68e
+
+Upstream-Status: Submitted [https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/pull/281]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/v3/Action.cpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+--- a/src/v3/Action.cpp
++++ b/src/v3/Action.cpp
+@@ -2,6 +2,15 @@
+ #include <grpc/support/log.h>
+ #include <grpcpp/support/status.h>
+ #include "etcd/v3/action_constants.hpp"
++#include <cstdlib>
++
++#ifndef GPR_ASSERT
++#define GPR_ASSERT(x)                                             \
++  if (!(x)) {                                                     \
++    fprintf(stderr, "%s:%d assert failed\n", __FILE__, __LINE__); \
++    abort();                                                      \
++}
++#endif
+ 
+ etcdv3::Action::Action(etcdv3::ActionParameters const& params) {
+   parameters = params;
diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
index 7b7e3bc7af..0e6509d2d1 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eae7da6a2cd1788a5cf8a9f838cf6450"
 SRC_URI = " \
     git://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3.git;branch=master;protocol=https \
     file://0001-include-stdint.h-for-int64_t-types.patch \
+    file://0001-Replacing-GPR_ASSERT-with-c-assert.patch \
 "
 
 SRCREV = "ba6216385fc332b23d95683966824c2b86c2474e"

