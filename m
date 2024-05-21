Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B89FC25B7C
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.3050.1716315036049309374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aS7WiReK;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f2f566a7c7so76364625ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315035; x=1716919835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5mh71xEMsHSr0lX1GwX2BI75naXSBQtt1JOTdyifqA=;
        b=aS7WiReKLuQjwuzeqosR3zbBHIU3HCqErBx7VXjXqdzR+dR7KWaWj+ISlvK7EgQzsd
         /rM2btEHjcE9T9eq8tajBgLoGnLbU5gvUhh1fv+CzpWHq/MKI1ml3hxTFX0CKgWafsB2
         6avKKtXnX5u3s9B4j75+cX0qXidPU32BXzAqoKxqtykTo6W6PdUzl0UyTjaMMkX19TIF
         fjT3wjfM3JSgySifcWjAcNaWnuSVHPlMogoGJdv8Q2e6NSeTXiNWxo7XaxkswrVcw/B9
         0DLbO1QHRKDAKGHNUoSU9YQC8SyLu8Qz/ujv6aEeRp02h2zkuCwWuvkHz/IGbvTEWptB
         JRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315035; x=1716919835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5mh71xEMsHSr0lX1GwX2BI75naXSBQtt1JOTdyifqA=;
        b=avYrUpCWQXsb2IxsrhKZ9JX3owAAPViRNGWWswN62emrJphY2inmPyqABqBBYfx4U/
         lKcUnYIF32LoiHvIv+iTQ25Eh+Ce98ChVE8RlaTJQnH2f82MmH+K1BSoxy71Lebxcpku
         d3UZUqz90Ws38UNp92cLTKnz1PTe0IZysZdCFr0weHIjMfyVQDxVZTJ8ThWpmA8Kq+Nz
         ukVHOnELudIKAN2rjMSFQOXz303BvKDB7QJFjDQyLzL+eLd/rlzBRTACf1+5UBaxSqQ9
         Wf8VMZfolY2zh2Q3xUq1xh3PiVHWP1nb1/3CvjMogrDDWngMkv2DvEntacYXr9pFK/91
         LMcw==
X-Gm-Message-State: AOJu0Yyv9fXCkjXx+I3CiT9ixLXKdbZUSS6rbLqDYAQd7CpYY2xjsXzQ
	IbFSxhuAMkMsVaCCkFBBhzpaNbP3JJDqrbUtEjzU8e/6DyR/KJ4oQ8Px1pBiNNw=
X-Google-Smtp-Source: AGHT+IHUCnybTm3uBPdvubNGytK0EPJcNmRuJSvtN1sx8zk0IH2VpY+LImXaRoScFPTlPOQVc6Y8dQ==
X-Received: by 2002:a17:902:780c:b0:1f3:1597:5e2 with SMTP id d9443c01a7336-1f3159711a5mr6062435ad.19.1716315035166;
        Tue, 21 May 2024 11:10:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][meta-oe][ 09/22] sox: Fix build with GCC-14
Date: Tue, 21 May 2024 11:10:10 -0700
Message-ID: <20240521181024.426176-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110458

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-Include-math.h-for-fabs-definition.patch | 33 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch b/meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch
new file mode 100644
index 0000000000..5f9135a0ee
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/0001-tests-Include-math.h-for-fabs-definition.patch
@@ -0,0 +1,33 @@
+From afe336ab63ff9b64ef759255de6b03b897dc4453 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 May 2024 09:09:46 -0700
+Subject: [PATCH] tests: Include math.h for fabs() definition
+
+Fixes build with gcc-14
+
+../../sox-14.4.2/src/sox_sample_test.h:190:3: error: implicit declaration of function 'fabs' [-Wimplicit-function-declaration]
+  190 |   assert(fabs(d - 1) < 1e-9 && clips == 0);
+      |   ^~~~~~
+      ../../sox-14.4.2/src/sox_sample_test.h:23:1: note: include '<math.h>' or provide a declaration of 'fabs'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sox_sample_test.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sox_sample_test.h b/src/sox_sample_test.h
+index 62b55e4..17f0069 100644
+--- a/src/sox_sample_test.h
++++ b/src/sox_sample_test.h
+@@ -19,6 +19,7 @@
+ #undef NDEBUG /* Must undef above assert.h or other that might include it. */
+ #endif
+ #include <assert.h>
++#include <math.h>
+ #include "sox.h"
+ 
+ #define TEST_UINT(bits) \
+-- 
+2.45.1
+
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 011cbc2a9d..800fcad2c9 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -30,6 +30,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://0001-Update-exported-symbol-list.patch \
+           file://0001-tests-Include-math.h-for-fabs-definition.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
-- 
2.45.1


