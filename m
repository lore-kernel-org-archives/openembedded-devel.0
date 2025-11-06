Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35D4CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 12:40:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14364.1762432812320450078
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Nov 2025 04:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAAyOAJL;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42421b1514fso508371f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762432811; x=1763037611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzsP7mYaOQuUUMUb4X+E1AjECsB5P9zNaMe5DWhYjCM=;
        b=PAAyOAJLEd4v2p++sBZ6yaQn0sDj6TZ3bhVd2mUl1tjxUrSPJglQYs5KhjebghVmtG
         gPEl3whQfd3+eYaIiKJZX2ySMZmFye3KxKFv6yJewzB9YNmRsLplEQt87o9PyuzNplw8
         xdhZUs2z1vxACg7qlGERdq93I1i0/KgjgeKX8vQRgUi+XoxDSliGjle5ouqCioCsXii/
         g2WjdumJCjYZ+uloLC/jHHxSmeWX14PdSL0EYbjrlyEm8+K8yEELha9Y8LYVFOvqTKo0
         jYWjqGYiMHC+L46yWvyF3V1rK2B+J+pmHLJSDR9e3ooZA0XcToH8AJccIbFnUK3B8/HU
         NR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762432811; x=1763037611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzsP7mYaOQuUUMUb4X+E1AjECsB5P9zNaMe5DWhYjCM=;
        b=TDWnoiHTyh3Tc6luI7ajXukb/Q6cuGUqvHmlmTjNF9rpTcl8saDd0MXwos/G5kLQ2/
         Hu1Wmdx0afxB16GNPoXyXTB8uupyErKGQ8eQo6UN/66y5N7OGOlAuF6/whVeeloTRb0M
         0V3dfRzrjfzhH0awFn7ANKRbGha0SCW+kasHhvnokYBeQQG/HlxBJO4P+bAfnpxoMwfm
         hUl/G/h/bTZxzGNUBeTY4c4dotsP70pqtL+kF+CS68YGGJU7d9buX+o4pqvyFZ6V3lnR
         T/Df/aWWXQtBRMnBCgCBoc3xtIzILBuyxCh2yR7MouIe9BIekMZ0RQzhBFS/ef/E2xVf
         p4Ag==
X-Gm-Message-State: AOJu0YwXuikFeI36Ev0bU8woq7T/K6pYWt/2DHo0AzY7G+ZgmWhPtlw9
	uCQUOkI8e+h/AZFqMxwhJgotMffg/4OQxgGji9A7Xcs+8o4881CyazD5GJqR02M4
X-Gm-Gg: ASbGncsKAE4KpPD5tNkaEISnAplIlmrH9MG4ovC0vNDoBt4RnXYi9KnUTNRoJGpY1gF
	KQZv80Mnz5yk1F9Xsyp13jy3XxHuBHP0/SHBI/UMS92eA4bIONSOUIaKoZ+OtKRWgceLM0IVeg4
	Tu3x6CqjPRTfVeAneuM9K2OIrjThcYUdnXk8UhoBbnNJthJo3nmIjk4CUJ+m4qwktW8kH64xdjp
	TlSy24SIhdJqG1mIev8s2bQFuQiTHRD/HxbLkEo0db97CPqOIHA2deyUWqSGRJUr/w1SQNsNlsf
	98BrnKn89icPTnmk50SXMs3ZxLHZ3fDTn9h4YoRc1ZlBLeBJsYFyhotvXs//1FUb1SESLMnOlLJ
	cxKhbJbQq5ZFesv/OKn/V3dQEWm+LAN+AIAiZtRsOtrpuN9ZTI+uq76fsfltgpekfIYSjhDoJyA
	==
X-Google-Smtp-Source: AGHT+IEAQgKs9qMWF+BBsM0BVzHG+IHl3OMDst0Ac1l43JQqa9d3PWVJTCmesX6LoxcZXdJNBrRZ8Q==
X-Received: by 2002:a05:6000:210c:b0:429:a894:a327 with SMTP id ffacd0b85a97d-429e330794dmr4986130f8f.39.1762432810466;
        Thu, 06 Nov 2025 04:40:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40617asm4811327f8f.10.2025.11.06.04.40.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 04:40:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] mariadb: move from PTESTS_PROBLEMS list to PTESTS_SLOW
Date: Thu,  6 Nov 2025 13:40:09 +0100
Message-ID: <20251106124009.490978-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 12:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121363

The tests are executing and passing fine using glibc.
It takes a bit more than 5 minutes to run them.

When using musl, the timezone tests fail due to the different ways
glibc and musl handle posix timezones. It have been reported
upstream: https://jira.mariadb.org/browse/MDEV-38029

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 580c79d6d9..09944e6629 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -63,19 +63,19 @@ PTESTS_SLOW_META_OE = "\
     c-ares \
     fftw \
     libusb-compat \
+    mariadb \
     rocksdb \
     re2 \
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
-PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
+PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest mariadb"
 
 PTESTS_PROBLEMS_META_OE = "\
     keyutils \
-    mariadb \
     ostree \
     poco \
     psqlodbc \
     rsyslog \
 "
-PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile"
+PTESTS_PROBLEMS_META_OE:append:libc-musl = " jemalloc minicoredumper oprofile mariadb"

