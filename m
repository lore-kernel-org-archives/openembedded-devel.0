Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F18C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 19:11:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.68037.1723144287065864660
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 12:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IEm99bC9;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-368380828d6so701360f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723144285; x=1723749085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1UEkQN7rw6up4sQIFi9tB910r/ELMMLfWb6vt6PHag=;
        b=IEm99bC9GBUXwspyFG0S00miChAAnaITFzVCZblmtnWRIiDkm/y7CTlOY81RFph0KW
         UFYhcF/gKNjjxh4b0yYlMw4WwwSoxA7Yu0k4iA1V6ne33+evcCEJSksilkaHqTta9xKJ
         iHmyPMC20OTKqDGm96+gvBYt0Kn36K+xsqe1xWdVw0Ahe87GP9IdV0Ejq6VhQjfuvXh0
         gdpIkpwYUv9vjZyYIR4d2gq9uDwbGLLNCrhCx9sfNIQlphO1owf2fMqVR69tk5zWYr6V
         ke4EM4wbkPf7Y9uZrek+KuwV1gyuCiEy+CKBEEqGi1MeF8K5aXtv9qCgXHS1INGQMZXx
         JLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723144285; x=1723749085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1UEkQN7rw6up4sQIFi9tB910r/ELMMLfWb6vt6PHag=;
        b=imFkp+qr5olCf/uGc1AB2wExQ5X2zG4wNMjGYd6/7N15eIGbRXJYX14Qv+eWo6J9rX
         sYTS0jXnqFBm86/2DVVuL0ltrIBIz2fUbIB0FS0YQLS5qTeIshDuEtHvsA/A72xF71fu
         dZ1kToNVwFrpEB4iFDGkkNBLhPNV5BXIJmx5Gz8i1du3Xya4lHHxDpmJfitzzpiuSvfy
         PjxothzKTgP1TKQ0SkoPNX0wOf5ODXIYU5/T22+3TpkIreVPpe8ejc0reKku8ujlaI82
         x8lpnVP6cuAs993j2mMQgxMgfoxkWqb4QAmcRn5ELzc/qAOJCAyuBOGwAyZUD6MsuXJE
         1ZKg==
X-Gm-Message-State: AOJu0YwV/e9S0kQKaJreNTIa1UGcrQSGmcz3m/n3yICXDUgUApNNZ69N
	18rm73trzGxEEvLyBEz+3dL/cGhryXqez0PE84W1hAu1YyGq1lG2uKQSoYPI
X-Google-Smtp-Source: AGHT+IFA/Gnnj3yzL/WRfN1dgBrh2ESZi4y3htV5UbUMJH/xVk/YtT00R2MoQO0JFbfVDP1/MZDiiQ==
X-Received: by 2002:a5d:5743:0:b0:368:6d75:1bde with SMTP id ffacd0b85a97d-36d274df3eamr2225357f8f.15.1723144284946;
        Thu, 08 Aug 2024 12:11:24 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d272085c4sm2805122f8f.82.2024.08.08.12.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 12:11:24 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] blueman: Fix do_package QA issue
Date: Thu,  8 Aug 2024 22:11:19 +0300
Message-Id: <20240808191119.158166-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 19:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111682

ERROR: blueman-2.4.3-r0 do_package: QA Issue: blueman: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd/system
  /usr/lib/systemd/system/blueman-mechanism.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
blueman: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: blueman-2.4.3-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index 5aa3b2bd5..df2a226f0 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -40,6 +40,7 @@ FILES:${PN} += " \
     ${datadir} \
     ${systemd_user_unitdir} \
     ${PYTHON_SITEPACKAGES_DIR} \
+    ${prefix}${systemd_system_unitdir} \
 "
 
 # In code, path to python is a variable that is replaced with path to native version of it
-- 
2.25.1


