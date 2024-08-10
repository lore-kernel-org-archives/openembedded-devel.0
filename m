Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4898C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:28:19 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.7629.1723303692512717323
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GqlUVtMk;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-661d7e68e89so23395827b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723303691; x=1723908491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH2omG98+TPCX8GCrQMGzrYREE0Bv+R97qe7q0+M0+c=;
        b=GqlUVtMkgOO1bM2+lvgkf4DGyM0eGCXEyJteJlJJHjBxKbDbqb+PAXswnMgp3XVb7f
         v6GOQrZ0XLcOO6vuHVeXpGLXy0mDcJ1bMcb0Y7ANrLe/nqHAbzfyI9NGk8JHYnWvzbKn
         zrT9/gV7naELqsRJag6/e92baWqMDfT0/Apwh6zQN4hkBXMSAY2L8kgxlwHgT+QR8Rid
         IPcIgqtnzy19gsFyBAFSp52kI0zWVWYUOjn00v8ANxarGq/adJQivk7j7mLCRf7RY8m/
         OKLUAPo4YFkptaRnSpB3etVmYGyA+dvMwe7/FHDNeHM4wCnhcl6hTwJN24zFyfniOIKO
         l5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723303691; x=1723908491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH2omG98+TPCX8GCrQMGzrYREE0Bv+R97qe7q0+M0+c=;
        b=tQyJya63CxEiHC2c/oUJD8IvjeRDlOmtN9yh56wE3ZaqEkYoas93+XYw3IFMt7FtxA
         5tredHJr5nrraNx5xoEOyHNDhK0jdCTHbAbXv4doMhFNBd1I6rXs1bNDurjeF1IdlIlW
         Kz7bXPuvFEcTtq4L3Qlfxb0F4ywFgkHaG0NC5s57xHdfyIqr9ysQZ05kdASb8JlGPA9R
         t3jYBKBOsZ1rQTEakVbw3WBavTasYH9qgHP8J0PRFkmygPc2FxITUkly67dXud7W38Lz
         7NFTIyHZYIzRsnn4xrYcsL5I1/tvMGZCLTLiOc/bkKODfnLoDC8rIt2co4S7tz8jbCOh
         MuDg==
X-Gm-Message-State: AOJu0YxBHpZcSc1rmKjq9qUnltayE172mbIO9Ud1EEYfnFYw7nTAI5CJ
	zTuZ47UgNnlrSF7jtR3ieayWSymKCQYJk0E6dpss+VHutvWCMpmm0YnODA==
X-Google-Smtp-Source: AGHT+IHkLlY8Us8k2oF3Yl+hhRd1KPcWbFqLpAsGmaDI0HKiyG0l6jXPaD1YZAK7nAFNwUSCMJ6/0g==
X-Received: by 2002:a05:690c:3741:b0:61b:e61e:8988 with SMTP id 00721157ae682-69c110e8cb6mr67952127b3.18.1723303691533;
        Sat, 10 Aug 2024 08:28:11 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6a0a068cf32sm2848947b3.48.2024.08.10.08.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:28:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 7/7] etcd-cpp-apiv3: Fix contains reference to TMPDIR [buildpaths] warning
Date: Sat, 10 Aug 2024 11:28:07 -0400
Message-Id: <20240810152807.899873-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810152807.899873-1-akuster808@gmail.com>
References: <20240810152807.899873-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111744

From: alperak <alperyasinak1@gmail.com>

WARNING: etcd-cpp-apiv3-0.15.4-r0 do_package_qa: QA Issue: File /usr/lib/cmake/etcd-cpp-api/etcd-targets.cmake in package etcd-cpp-apiv3-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a70cacd0c25dbeb641e364ecc0e28fc4b924e59b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
index 401d53c79c..e6fe8af890 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
@@ -19,5 +19,9 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
 
+do_install:append() {
+	sed -i -e 's#${RECIPE_SYSROOT}##g' ${D}${libdir}/cmake/etcd-cpp-api/etcd-targets.cmake
+}
+
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.34.1


