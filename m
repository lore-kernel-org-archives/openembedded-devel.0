Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDE4C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.2736.1633977717315625579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jQ1E7HX/;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r10so59184054wra.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zbbfk2ZT/ZHhCfvf5F+7RK8UFNYAgRq01zmjPDLB+is=;
        b=jQ1E7HX/HOfJdwPFucCBnECiXynxl9rI05DL/M+sjWPypv7ake8720lqsDb8fqsmr2
         wme3Nj5zpF2kttEGPImI/d86trEq1c7wmTm9s4+sHed/Y3MdbkC5++t1neY3kxq40I6f
         N8d/RsU1lnJmBsDLlEdSLwS8xHxO9zDpPeKXcclCGmdWD3wDCPUx63etFLswtqdwChXS
         Z4C+4Kjz7M3E6cqGlBvZF0ebpwWhvgZUuSc0KHddU4D5QfV/Y6/n5Yt3kUmR/uyjT/YS
         bUAO508H9+tSve9uMhs7NQ3eGNGLM85UbpyTX8aC9AvVnL85r2CfkozAhVV/gfKWLRex
         GHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zbbfk2ZT/ZHhCfvf5F+7RK8UFNYAgRq01zmjPDLB+is=;
        b=wVJ/oJrIUBTvrN6HZflJ9xC50TmsCXCRCupKAJ3MOQI+8PEqj+b5lPddxr0kq5KnOv
         82mV//MgX9iLEzJmkuVvxDCsZa8mTDb4440Y7DHtSPohBXOIboplRRSjMBX2BRVC77xq
         YAdd5balLHKqSFAAwefryRe2hqx+mH17cjjn5KieNEc/JxwA3YmyRzxpJGYPIn2Q6JhM
         QGtpoW9jSZOGcKjVd6P+Iuey5ptoIbqdgz4N2A4H7U7FAj92vYYLSeQW433VWECrfrPs
         SJCL65G5aTQ0PFGIyJydEWWfONsShMlvAVNzLkOGzqvv8Tkmox7GBICTe2rQgSZmh7dw
         BQKw==
X-Gm-Message-State: AOAM533eRzkO/mskQFa41I0JF+wNode5KxN7j2CEH5aWrD4zKMxgiX/7
	yb1dyPvrupsIc+DuyVNfenvkbbu5hoDW3g==
X-Google-Smtp-Source: 
 ABdhPJyajUEkOQoFHEKvXYOPxVJ20wU4DwZQxospVizZvFDWlILfZRM4pwWvPezQJqrVXGtzPOQtaw==
X-Received: by 2002:a05:600c:35d4:: with SMTP id
 r20mr742421wmq.24.1633977716002;
        Mon, 11 Oct 2021 11:41:56 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/24] ldns: blacklist due to openssl 3.x incompatibility
Date: Mon, 11 Oct 2021 20:41:29 +0200
Message-Id: <20211011184140.653609-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93227

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
index 2ce669154..858614cee 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
@@ -8,6 +8,7 @@ SRC_URI[md5sum] = "166262a46995d9972aba417fd091acd5"
 SRC_URI[sha256sum] = "8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229"
 
 DEPENDS = "openssl"
+PNBLACKLIST[ldns] ?= "Needs porting to openssl 3.x"
 
 inherit autotools-brokensep
 
-- 
2.20.1


