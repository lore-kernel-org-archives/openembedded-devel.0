Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC27ECAC5A9
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:23:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.11616.1758194630136756703
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJn/CbnQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso145594866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194628; x=1758799428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WNW/Y5Dp6Grro+nZyNsxs4Lu4E5O/fP1FlPP0eW3uE=;
        b=KJn/CbnQVfDynAW4dj0VgdMUC4hp/tTPyKWtRhzwKfNGlOY7r/nIqYzrCAyg84ZIV0
         k29RHWiaoKwE8v3Au1IqJdD/o/LkyLP5rXvtr9nC8HTUx7RUmH8ub736awVZrkhBlGkL
         Rti0C2rWpNLwA19Zkb5Eve7lrhFPX6cfsM+WDyyQRNOQlBcElZYXA8z+gej6JzdJPrQW
         Evenpwdo9UVwhSY27cTkoLc02BhMYOqcDtz3D10ETBAh51K6nzsy87SqOaXnO6dQfru+
         M2OVTZprhqgJj4KdXhzaEoLy3TAPIRxisjs5Ro0d3vhe6miJqyjcG/iyci/4SpTr9nd5
         PXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194628; x=1758799428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WNW/Y5Dp6Grro+nZyNsxs4Lu4E5O/fP1FlPP0eW3uE=;
        b=sUnqleUUS34RY6II7U5/KTpZFWYmiBk7Ira3sVTUw5jWmcRhE25WpYv9r4zA6rGXQ9
         gLgElqJLN7ZV/UkqjaAzxFiYwFZZNGF/e9aJQLSYh6YPP588q3hFsJpNcze2EHpu+7qk
         5aw20OJ2TdlEyW1mMelYXLqxbLZ4kjRMPqcBMM+8shA6WyYRwGQC9xzB1Bu5QXDobsyB
         kBqKacAA7nXkhFTxwJMDD2xEphgvUODHTzYVZwel1EWgzJJ6C6yX0uIOuNfecb0X2k7S
         Hndm3MOApcdSCuhIav6xgifueq5XgGAjvX1lxgzFdHlVxirjK996ZYhUe904im7HtyD8
         /WoQ==
X-Gm-Message-State: AOJu0YywSNVMmqwmWKY3RRByAoq0Iv9C5hjFjbSzfRhRThUvt/MHojUq
	cgk7dryQUD+lOB4WXZScCjRetcG+DEm3vospmxWtiXUF5g4PGCv4yyHuYxOOzQ==
X-Gm-Gg: ASbGnct22MF/QxhMxSRhYkH4ygxTW0WWshLsLkwwY026Cw59dl2NHAPQGM3WeAQ4k2T
	vPBVPQbzdhnE+gzq0Is++VCDgXC/GnaomT7EQ/SYnwCEUr9CWH1eIUvqVj+wjPuWPLsTiBhlnRP
	2XkfusdeNtVs7W8WlVsxw3vI7wbsjsRd+A4xF2Kko8iSnZLFLL6K2d4Wz6f9Z0jd9M1xUYyWAwo
	9eheVInwYEmsfBFhYd51GmhPrSES+fF/4+o6d2WOSWmKLKpZtLVQNhUd4TstUf5oM1d/3eH60VB
	gZDRQ4aNP/pVwd5uLtVTTThVT+mi1fvrEhvE9UI+O+2KQCJYJDBmw7XBhh0rCdrIn3XaEu0vyKS
	nQSKkBtRlORfUmcrvkScOroZjyAEqt8ue37NYX3k=
X-Google-Smtp-Source: AGHT+IG0Z2mOuN+50MephklA8he5pWY0a+it/mgCIHKgfnM3KMxxhiuIPeTgMAvgKdQEXMezWM05bQ==
X-Received: by 2002:a17:906:f58c:b0:b04:11e5:9a8e with SMTP id a640c23a62f3a-b1bbfa2c97cmr671345166b.40.1758194628198;
        Thu, 18 Sep 2025 04:23:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/10] fb-test: include UPSTREAM_CHECK_COMMITS to fix UNKNOWN_BROKEN status
Date: Thu, 18 Sep 2025 13:23:35 +0200
Message-ID: <20250918112347.1331393-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119560

From: Alexandre Truong <alexandre.truong@smile.fr>

When performing devtool check-upgrade-status, UNKNOWN_BROKEN status appears.
On the upstream source repository, releases are not identified by tags. So,
UPSTREAM_CHECK_COMMITS is set to 1, to find the latest upstream update.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 16688b0f565badadace8732840f0ff01718cc87c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
index 6082ea2574..b19bba0156 100644
--- a/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
+++ b/meta-oe/recipes-test/fbtest/fb-test_1.1.0.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 SRCREV = "063ec650960c2d79ac51f5c5f026cb05343a33e2"
 SRC_URI = "git://github.com//ponty/fb-test-app.git;branch=master;protocol=https"
 
+# Upstream repo does not tag
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 do_install() {

