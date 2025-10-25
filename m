Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F0DCCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 20:37:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.13535.1761424623210961318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 13:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O75UZyEN;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-471191ac79dso33453685e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761424622; x=1762029422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXcm/+hEKCT3dr/phUKnwZY73OjJoMW14PSTNnzLg8k=;
        b=O75UZyENO4abcfq7475OOn3FkGoeMnKF0FWaX39pdHibaHuSCbL3y02yyZAZGsmRTB
         rb/SKRlfq8VkhQn70G8CqU25hfCuymmdFOqBPC0ToD7x9SahrmZT4pCsvXutmeZXPCPL
         KNU+jxFlc4U2+LHuJ2ywvTzt99VOpmMKteuyfDvBI1pPKVkb1GwlnYkarEu8YvfZq5Nf
         2N2IjL9hob3vUW1ZgmBpsMS91CEUGnZIIcr4Xgv/8VSnxaqOsZVLZl8aF6Bw6A++mAwg
         uTI3jUQZ9D+j1CDvZufX4ShXB1UIE/FP7noiL7K3qoLJ3wKe23LCRjU0uxeERv8NlCVF
         4WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761424622; x=1762029422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXcm/+hEKCT3dr/phUKnwZY73OjJoMW14PSTNnzLg8k=;
        b=MOIh+OXVnWsXVpC8ZLMGqb+oKou//Fz6zWrp2TkU7Y4gNjdAZJTJI9B7oI467WfE5o
         C+AGFD/Q19tBbIAaCRcRkEq5qOfoy1ZPO3oBQxtNLaq06y8XFqTYfa4vIyzSetTkIaw2
         Hhnf0i+dEzHN5zEqYnz4eyPI/+xruLxMLbjavvqggcxzd/H/B6qSEtUC/mGfbknXo212
         LRWEGD7T7knaELjGpyDXNGN005skSVHqO6eQLuc4pfG62VfGaeWgGcwPdlfdxz+KIOBB
         DzFZs4g7YGbhW+qH4WWRWso6HOxGsviFMNYYalxDP0tm+8+EJMxqIGZvlOjSnj4ruEJG
         c51g==
X-Gm-Message-State: AOJu0Yz7Ng/veApjTLvX7p1VGnOLQiLPJTjM0huQoqGyMuqGovSX4x+U
	rrkOUwF0TI3uMm4Fp+MgeW5BNOsgTabRkuo35rmG8KLNqk+k7l2ytow/pxamtA==
X-Gm-Gg: ASbGncuY6qh7UTRfYHkFNhUyqK0c+T4LHbOb3jm4ZYgAgKo9MyMwW2IRrsDBPUEj7jM
	BZ/1DlKljJdbg9cR+X1eRaRo/ycOgAO92N5lzL1FWQG9EIf1eoOAkuJ0qJVwub4wBXvTKgLzbHB
	lWmlM2mYG9tN/ADXxCfG6x1QYjQt/jvpObor8h3M05aN0qTYzRARZSYEm4ArMkEhYBeP2lXboMW
	EyMDLRwZanp3GrDjwsekr46uVfoqKG3Yf0xuX2BE7hPvx8hfFiXDYqKX174X9gkr4jSCy+f9vt6
	RwjCRtoaHXoPl1jJgYa9L/J2e4lJ1L6HDK05I6/GLNdIcllB6oWl9RliXGRr0Zzsp/vooqsuFaU
	NvBL2w92lLTIhfnAYJg27TNPlO4K/5eJTt+etwhnwO32pRugoEo3ovtUQXiSOYEiyFJ0aY0QNYG
	sxTI9fp3m6
X-Google-Smtp-Source: AGHT+IFJGymvEPTekuDDtts+Bkbd/0HAEd9rTR/Q5OO7l1DHrjMcILgSaZfIGxCE2zmBJKwiBDo1+g==
X-Received: by 2002:a05:600c:3103:b0:471:1717:411 with SMTP id 5b1f17b1804b1-475d2ec5e4cmr47803025e9.24.1761424621373;
        Sat, 25 Oct 2025 13:37:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e4esm47049055e9.11.2025.10.25.13.37.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 13:37:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] libopenmtp: fix ptests
Date: Sat, 25 Oct 2025 22:36:58 +0200
Message-ID: <20251025203700.1751175-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 20:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121008

Install missing test data file.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-multimedia.inc         | 2 +-
 .../recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb          | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index e21ad5766b..be347286fb 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -7,11 +7,11 @@
 # ptests which take less than ~30s each
 
 PTESTS_FAST_META_MULTIMEDIA = "\
+    libopenmpt\
 "
 
 PTESTS_SLOW_META_MULTIMEDIA = "\
 "
 
 PTESTS_PROBLEMS_META_MULTIMEDIA = "\
-    libopenmpt \
 "
diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
index 613147598a..dececf7488 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.10.bb
@@ -58,6 +58,7 @@ do_install_ptest() {
     install -m 0644 ${S}/test/test.mptm ${D}${PTEST_PATH}/test
     install -m 0644 ${S}/test/test.s3m ${D}${PTEST_PATH}/test
     install -m 0644 ${S}/test/test.xm ${D}${PTEST_PATH}/test
+    install -m 0644 ${S}/test/test.mod ${D}${PTEST_PATH}/test
 
     install -d ${D}${PTEST_PATH}/libopenmpt
     install -m 0644 ${S}/libopenmpt/libopenmpt_version.mk ${D}${PTEST_PATH}/libopenmpt

