Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939C5EE01EC
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:01:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.2366.1694624484921526957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sKqPcqWc;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-307d20548adso7185905f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694624483; x=1695229283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1ZzS4x58AYfn5DcG7unsfLCSI3qrowHqPhW5SLZLzA=;
        b=sKqPcqWc/fgTGPOGl7Ec4A98P9FRZpWxGTEAqV/gJjp0sBM37fj9Mo3Q71096Xz6Kt
         Hzn3WhiSABxoFsYQwZryvM5RdHyaZoCKQ5UjwSlXiIGlB27mT//MoX6e+d2f7vALtSMN
         9n4npo0g9uv2/myQJrMp2r8OyO0dByOKOnwz4ez+NIPn4+AbgwO4QiqgpKkPtcVM7Yf4
         yUW2WmivnRJhuDN2qM+Gj0Uho4o4jkNCEWNw4OV4Jeo/ioXFl01UpYjVeAiUp4huy1D9
         0NZoBXTmiIHr+LVhCdM1WH+EjBRMK6KAHmRxAmsLWOXUJ6pvHX+Rhe7bHOiXbp41zPcO
         CYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624483; x=1695229283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1ZzS4x58AYfn5DcG7unsfLCSI3qrowHqPhW5SLZLzA=;
        b=l4OESfZ0p2aQ5F3CoVG0nXtmOErPfoq0oYkJZd4s4SJnMmX5xTSf8xGTcs6EC56SeM
         +3+56FQmhpkPZuM8Y9GzpA6ghRbc0u1ehwFNzkJH7wKlzKixZO0rSt+uHiSQKtlVi9Gu
         arJ0tCBL0K8CvU1iayqFT5JMg8gaYB+qpKnuu0FOd8cZTrmxZEdHK8fsRMaDcPFBrO2L
         MQEi8qroiE/cBXb2/t/GHRbrucmLd88b7NF+8SFeRUj6T11by3aouOJtnj+jWHYECZnP
         9rGjBkNU7TIZ1zxv4+3SNyIRiZYBKfZ226Fdxu5lCR5zv9H9+/bv82uQUAxvL3LG8K+z
         HS9A==
X-Gm-Message-State: AOJu0YyY4IiGCmIgk36sDFz71IuMUFSYjKPFqEpI0QZdoBxWXSAtyKGa
	Lp1YjyIl9iYD64Njgi03DWjWbJxfI0y+gQ==
X-Google-Smtp-Source: AGHT+IHdusDQV3vzWh/VgDAMbs7/07UwvWKhQHn5gHFch75MjEviI0y5Bhx8TL0pkfLcNR2issbUCA==
X-Received: by 2002:adf:de0d:0:b0:318:f7a:e3cb with SMTP id b13-20020adfde0d000000b003180f7ae3cbmr2941754wrm.31.1694624482804;
        Wed, 13 Sep 2023 10:01:22 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.net ([2001:bc8:6005:6:8218:44ff:fef2:ade0])
        by smtp.gmail.com with ESMTPSA id 14-20020a056000154e00b0031f8be5b41bsm13260058wry.5.2023.09.13.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 10:01:22 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][kirkstone][PATCH] opensc: ignore CVE-2021-34193
Date: Wed, 13 Sep 2023 17:01:06 +0000
Message-Id: <20230913170106.1101913-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Sep 2023 17:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104859

The CVE-2021-34193 is a duplicate CVE covering the 5 individual already fixed.

https://github.com/OpenSC/OpenSC/pull/2855

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-support/opensc/opensc_0.22.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 4590b85fa..3bb79b9d9 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -16,6 +16,11 @@ SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2023-2977.patch \
           "
+
+# CVE-2021-34193 is a duplicate CVE covering the 5 individual
+# https://github.com/OpenSC/OpenSC/pull/2855/commits/7a049fc3922060fb75cb9fea9e58eef9edc357ae
+CVE_CHECK_IGNORE += "CVE-2021-34193"
+
 DEPENDS = "virtual/libiconv openssl"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


