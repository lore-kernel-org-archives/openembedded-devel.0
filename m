Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FD6CD37B5
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 07:18:55 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.7680.1694848734295041392
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 00:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmJR643F;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c337aeefbdso27173365ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 00:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694848733; x=1695453533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oe2Kub67PphLtMGt22cVux2DtPTs1BrvoVmDFBPWG/k=;
        b=PmJR643F4RDc33K1TzYpgMWo0DtfQSMTwe6iIZxc0rAZM52KFyyJTRWDbtgVQaPxsE
         mnG3j98MSRFQvG7AR884lKDcceW7cqLZgrdX1Vqomwvif9N2inUXJ23mZj0F1HUS+6ru
         CKzsFK5Z2b7+F//WGX1EaamxxadsRdZfg1gRKek57JDWLxpxYhWas3v8058AEd3cQkPj
         98cuS3ZdbF0qPkkQqXrq25jPefBLhVhidi0Ii0a40qkP9gw9wh/RxSY/sVMH/yCYCUdC
         zSNjgISygkgrvHKX8u/KpRdBPeybkv5fjR+5RNP8AXsTs/DZAV7DkwwVkPeKrW9sba2V
         U9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694848733; x=1695453533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oe2Kub67PphLtMGt22cVux2DtPTs1BrvoVmDFBPWG/k=;
        b=oxhHe2eC0Xq4432H20H3MAPMxDoW2m2VzAyGAgDDlyfoVX/ijcA5+rQYKHiEOtIA1L
         OluYJoYD7FnxGQvEH3+1lHpJVG1D5LE/J1UFtVKqnnJi8zVy64brw5ZkfTqXVDresUpc
         H1dDF3spXx2hoRDaD+KXMA/nTNQ/IK3QtGA4PEPqsNqExwMnOMRqaILPZBVZBhsRHDgv
         KekDILmxecsqMM3FMx91WB+FU/gCcWfGFDCWJjqtxalYClPctga0dFnIculLRk/jHQAm
         HhddOiOXBfyiIH9Ba0XNV5wAJmC1lRxRDqiWE6k6HZZhnrcoQJ1+JpArQYh0+WfcvdrE
         hZGg==
X-Gm-Message-State: AOJu0YzpfzJRWRo/QtS5Kf548xcdUP3ALGapcSTSxTp6EXlZOu1iJ2Tj
	xZ+6fKwG2QeQ23PFOHfLJNkkZ9YBSX8=
X-Google-Smtp-Source: AGHT+IE1wcKPIHlrEMk4qBN40WHpxtXT39UqWn2ublrL5RYbYncQK0KncQ4NnYqN02Lq/gQ+O9LZag==
X-Received: by 2002:a17:903:22cc:b0:1c4:13f:9dd3 with SMTP id y12-20020a17090322cc00b001c4013f9dd3mr4972535plg.62.1694848733523;
        Sat, 16 Sep 2023 00:18:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902778800b001bdb0483e65sm4577795pll.265.2023.09.16.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 00:18:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Add pass/fail ststus into logs
Date: Sat, 16 Sep 2023 00:18:50 -0700
Message-ID: <20230916071850.4034585-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 07:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104897

Ptests do not report status otherwise on build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index 521cc08a75..db8cf8511f 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -1,8 +1,19 @@
 #!/bin/sh
+i=0
 while read runner; do
   oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
   ./$runner -ignore $oldpath/cppignore.lnx -all
+  export res$((i++))=$?
   cd $oldpath >/dev/null
 done < testrunners
+i=0
+while read runner; do
+  eval assign=\$res$((i++))
+  if [ $assign -ne 0 ]; then
+    echo "FAIL: $runner"
+  else
+    echo "PASS: $runner"
+  fi
+done < testrunners
-- 
2.42.0


