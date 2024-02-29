Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7327C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 18:59:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3577.1709233170337805807
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 10:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHKmtFXd;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e56787e691so1580358b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709233169; x=1709837969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXlam31MrI20AVzTM701MVmL2s8H+NNeU4gZzMwnVY4=;
        b=eHKmtFXdUFYR64+vHVdmnzA5VD/tXRdtG0JO6Jggcf0kkxKr2oVtYvWy/jGrKAdLfV
         9CD/AT56gxxB60JLZDWlzv6GUsXmTXEPG4JxKY2DP7wcCwwcsShXL2DX0ysxwC1E3yDJ
         txywMdpmziyXoD1YMpfP5kV8tbI4up/LNABahY+O2xyAhC4PmcJO4XSoCPR8SeYHFr1W
         3EHu5BrgCejSChiG6AtvntagT5EHuCLUVUW1YAf8fx/ndy8i7Fp8Q7cKXBNNedFW0lIc
         cOv7OCE8RfYrVA3lIDr+oX4J3LSRZq4sHSPvpIlVlt/6Q2bNHT7VStIXbToNOmZt0Nnz
         58ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709233169; x=1709837969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXlam31MrI20AVzTM701MVmL2s8H+NNeU4gZzMwnVY4=;
        b=V/SJGKW4hiaEzkVOlMgaW3cljLN3KWzAApbi4Wa0DcMyLmeZow1YAmQbk3itOJuyZ1
         hGalq53GARkYpk8ZmyAHLV+aQjwAEDqGWfu3rP9eEqSHNu1jxDy3l1dvJ/6nLEgpN94I
         Q+b6wPr14b/fBKDJF5a2oPOd6zW6eAuCfUCC6KDax98iyamoqbJYiM1pggtKlKjb2XBI
         rkn4YmGplUrVHB+KUTr2Jbl3ydg0JMF8Xu8tuUxL7rXqGSJsWoPJ1Gr+lqBvHJRZdVXZ
         KPp0rwvdyqeq1rk7svqqA43V/IxPXmHe3e51MYwzjR/fveaQ+oj25zBglTTVN+INbNSk
         GrRw==
X-Gm-Message-State: AOJu0YzwYJkIFOw0pBEvf0Rp/AoHkKLvvEgxz6vL4SkzP6xaQyyr8TMs
	hj7apYv7vMpN8M+Bfz85rx1qmCLhiYvkrsEMUcBCTgqgVUvBmq86ZyIIlKhC
X-Google-Smtp-Source: AGHT+IFTMMViPz1xzhOH3MQB6ygTFGUkjbriEnnazqO6UjXDSnoiZJMiMAffOso9iQAaxjQINVQFog==
X-Received: by 2002:a17:902:a3cc:b0:1dc:b16c:6406 with SMTP id q12-20020a170902a3cc00b001dcb16c6406mr3224557plb.6.1709233169414;
        Thu, 29 Feb 2024 10:59:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4edf])
        by smtp.gmail.com with ESMTPSA id h19-20020a170902f2d300b001db63cfe07dsm1834430plc.283.2024.02.29.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 10:59:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-fastjsonschema: Add missing ptest deps
Date: Thu, 29 Feb 2024 10:59:27 -0800
Message-ID: <20240229185927.1010236-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 18:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109059

Fixes
INTERNALERROR>   File "/usr/lib/python3.12/site-packages/pytest_benchmark/stats.py", line 5, in <module>
INTERNALERROR>     import statistics
INTERNALERROR> ModuleNotFoundError: No module named 'statistics'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-fastjsonschema_2.18.0.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
index 6b74f7260c..b2e969c5c1 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
@@ -27,6 +27,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-pytest \
     python3-pytest-benchmark \
     python3-pytest-cache \
+    python3-statistics \
     python3-unittest-automake-output \
 "
 RDEPENDS:${PN} += "\
-- 
2.44.0


