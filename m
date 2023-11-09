Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207B2C4167B
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 09:32:54 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.117704.1699522364593056211
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 01:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=Fcp8qSNj;
 spf=pass (domain: thaumatec.com, ip: 209.85.167.49, mailfrom: dse@thaumatec.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so746108e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1699522362; x=1700127162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SgBt0bVHCTFxN8XxfejcR5MIq4aPzm/tozQPmvrNYQ=;
        b=Fcp8qSNj6ATUMCRrnXUf8qdnG53Fj9GU6jMTuueG0AXWsGEsG40gyY+cATYUivzSl0
         at2e4ga7MoAzOPL3AuDuZ6UCmnjPY9RIUgZzZV0Af2XVR+gndXnGikCuj8B8HM6Bb48X
         9TnhAqkmEF3A+Y1SfBF8xPPRhKjaXpStIY3D4bPac4p7ZYi9DBIE+Xe/xLPdUNrTHQjy
         50ba5Yf/LNYzL6z18obcl27WGM8Ib2tsInW7qUNtB6afJYyaItOtY/l/+fqhqUBifskQ
         FkT3BCF++Fc9DibT0a0q7RXWTlaUAYD251oZcoYITEn51qkzR4m6AUraHEzk/LiBf6jG
         0eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699522362; x=1700127162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SgBt0bVHCTFxN8XxfejcR5MIq4aPzm/tozQPmvrNYQ=;
        b=SfPh5qv5tLU9fl6eQUwbYgw7meUhzQ9cvOHfXZSpDGsUyfieiGJQq/Z/AH5lVi5Cuw
         QzSzIQE1kwYm1a8D6bJaz6U5nGfZwP9/n0gc/QK+mQoUjsnIBB8EH24xFN7815MjmW3R
         pjsEjjSkIF3flhKyRwWAFg0T4lU5gpGdR+RcL3spmrfbZvRMKyZQhcUksEtgybAY4a9N
         POAcEsg8vujF+RZqipzEUo6d4ner+fPNsxeV2zIfsFJg+sFriS/24y0mdlOG8OgrUmw8
         P6CLv+HLuT9sR10xjJDZVBoLXiLc51zc4i9MpkgbFD0W4TUzF/KWEhd9j8tHZ2Bnua+V
         IVFw==
X-Gm-Message-State: AOJu0YwbLS3uu4QatcKS3VO4t6iyrNZhfxqvmxVWtCptFppmpPh3Nf6L
	D8Ab3ProFxo6BOLsMjwhFKopJgujUpk/ch1DLymG6Q==
X-Google-Smtp-Source: AGHT+IGxt0l2J7ME6lTQ0166sWIY8n1hS5/JP/GS+xrkcTya7ymzEgsLLZ/wimT4ZtdlhhImOVlnQA==
X-Received: by 2002:ac2:44af:0:b0:509:8eae:c94c with SMTP id c15-20020ac244af000000b005098eaec94cmr455419lfm.3.1699522362295;
        Thu, 09 Nov 2023 01:32:42 -0800 (PST)
Received: from localhost.localdomain ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id x19-20020a19f613000000b005032ebff21asm988937lfe.279.2023.11.09.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:32:41 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [meta-webserver][PATCH v1 1/2] cockpit: Fix cockpit-askpass path
Date: Thu,  9 Nov 2023 10:31:44 +0100
Message-ID: <20231109093151.101752-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 09:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106513

Non-existing variable was used as a prefix for 'cockpit-askpass'.
Fix the path, so the binary will be correctly installed
in 'cockpit-bridge' package.

Fortunately, even with incorrect path, this binary was "caught"
by the main 'cockpit' package, so it was always installed in the final
image.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
index 262302424..39dbec54e 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_298.bb
@@ -119,7 +119,7 @@ FILES:${PN}-apps = "${datadir}/cockpit/apps"
 
 FILES:${PN}-bridge = " \
     ${bindir}/cockpit-bridge \
-    ${libexec}/cockpit-askpass \
+    ${libexecdir}/cockpit-askpass \
 "
 RDEPENDS:${PN}-bridge = ""
 
-- 
2.41.0


