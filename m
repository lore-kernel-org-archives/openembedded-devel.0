Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C691C624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:55 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4062.1788429047051646716
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q8j32drn;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1325444b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429046; x=1789033846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7OINWDWkPFWoalCyjxjfpFoGHkJ625GNxys0namKfs=;
        b=q8j32drng1FCfuhlqEdJzzWvi8FiYiFEnsIN1iLcWLtTAskv7k2441Jkj+lBIJeCbq
         WnAJiQRWK4YNWG8abLkoZwDirB3OiLPw+W3x1R0BHuoZ0rsr8Vj+1k7vhnb8E9x+cAgh
         UZD9PCWRtZ6ksZOmKGwgSXfgNsHfswoK/X7BGi1jQzQuT4gJ8bqcPtHNqje2pKF/4O+O
         lrePzLdVta7tV0zz4By1eOKW0kp09lzs2wTldtKcKWbalZkAccGcEWfI8g8yWA+c2j9j
         gic3KUrPaWfW66dociHkWr8z6lCnqHOlR23TR6GrpAG4W5xVAROCoIQeWlH0EhRSewqB
         kydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429046; x=1789033846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7OINWDWkPFWoalCyjxjfpFoGHkJ625GNxys0namKfs=;
        b=aInyC3SrORyLzB8a257QVFrQqGmSo2YiuTlR9cyJ6po/IiiluyyqoqcUdwD2zdROPQ
         B0bNI2wmF+ClJ6t7korIcEcB7zUSOltrQvpI5MpTnHSgD3eXCrpyE5jbVUulR4XiFMwS
         HDc6eXrOt3jjZjoBwPz+8NdIGawIerXwRcxyaSb9Edxqvwf2VkBNGm6l8QPD8ijmsS0X
         YyoLPxxVuSZD24JwD4IxEbUwSqzFJQdBubMmBAvPkpA4F9g0Cf4I52bJcFeRxe+/Wg7Z
         j7m+YPvuoxeRUtaipcKbPE7Zr+7uk+XoF38V6SwbIC4nl5G5cXyMfkw0sV8JK+T2OMNV
         I4Mg==
X-Gm-Message-State: AFuF++l2xbzsRwzqKGoUGhoWbtvA3gbAratiLuXwwKUtiU94nU4pFAH7
	HgD+7Hu5UcISTQvSstVjjFziNF1sMCYWywKBJb/Co+lmSQu4VT3IV4zfUhaGuCk+
X-Gm-Gg: AYBFou1ab9DkUh05FJEwVB+doSIk41fivqxC72mmyTXMzrLXRSVwtUt+PVVWF1MoWQu
	MDJWar9GC8RuypDwohoHNGwiSSyOLEhx+GcTKlpMI7cLB2+aqJjEVIFB3OR8yTvrc8dE2yX4zY1
	bdmYyboF8Hn77iWO9h3L9/E77LtLmj3KO+cNM6lfBHhojLNzIF8u0ws14RJvGHOEVnrGHY1S2RQ
	GYyOr+6hgLRgI3IAdc6G1iYk13FpPExcEJXPTt7MVS/gjJKBfKw2iw7obPk+Zyfmchg+VVZCIvf
	W79Bx28k3bu7ZQcD5Znnw3DJFKGq297cmhxktl0h1EvWedOzJSr+4HQT/AHvrW+6E50U/2hJjPD
	Vnqu0KjMO9rjFuUDE58ktk84PLswwWEMxvyx2twgCVAZawy/AbIRIV9+AJDOoHpdit4xW3Md0ht
	QNZp/SQurVRkqVhI9KZzw3P/V6e80gFGznv/7ZBQuuBgEzyF0G6n3hbOutx6wGwwwgLtrp3R0dH
	IevKLH4DMw=
X-Received: by 2002:a05:6a00:bd8c:b0:847:770f:da4c with SMTP id d2e1a72fcca58-85ed8ed841fmr17615752b3a.16.1788429046328;
        Thu, 03 Sep 2026 02:50:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 21/22] libkcapi: patch CVE-2026-71227
Date: Thu,  3 Sep 2026 21:49:52 +1200
Message-ID: <20260903094954.3240723-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129737

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit fixing the CVE as per the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-71227

[1]https://github.com/smuellerDD/libkcapi/releases/tag/v1.5.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libkcapi/libkcapi/CVE-2026-71227.patch    | 40 +++++++++++++++++++
 .../recipes-crypto/libkcapi/libkcapi_1.5.0.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71227.patch

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71227.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71227.patch
new file mode 100644
index 0000000000..6074c0da27
--- /dev/null
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi/CVE-2026-71227.patch
@@ -0,0 +1,40 @@
+From d85279e3bec7578f8c238aec92539985c2032616 Mon Sep 17 00:00:00 2001
+From: Stephan Mueller <smueller@chronox.de>
+Date: Thu, 30 Jul 2026 08:38:10 +0200
+Subject: [PATCH] Fix potential infinite loop
+
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+
+CVE: CVE-2026-71227
+Upstream-Status: Backport [https://github.com/smuellerDD/libkcapi/commit/9a29cc2ce0fa87ec212d58118402eafe07db3f60]
+
+Dropped changes to the CHANGES.md file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/kcapi-kernel-if.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
+index 8a12c09..a54cdaa 100644
+--- a/lib/kcapi-kernel-if.c
++++ b/lib/kcapi-kernel-if.c
+@@ -436,6 +436,8 @@ int _kcapi_aio_read_all(struct kcapi_handle *handle, size_t toread,
+ 
+ 		if (rc < 0)
+ 			return err == 0 ? rc : err;
++		if (rc == 0)
++			return err == 0 ? -ETIMEDOUT : err;
+ 
+ 		for (i = 0; i < rc; i++) {
+ 			struct iocb *cb;
+@@ -509,7 +511,7 @@ int _kcapi_aio_read_iov(struct kcapi_handle *handle,
+ 			timeout.tv_sec = 0;
+ 			timeout.tv_nsec = 10000;
+ 			ret = _kcapi_aio_read_all(handle, iovlen, &timeout);
+-			if (ret < 0)
++			if (ret < 0 && ret != -ETIMEDOUT)
+ 				return ret;
+ 		}
+ 
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
index f2ddc25336..f1fe6a0940 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.5.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https
            file://CVE-2026-71226-1.patch \
            file://CVE-2026-71226-2.patch \
            file://CVE-2026-71226-3.patch \
+           file://CVE-2026-71227.patch \
           "
 
 inherit autotools

