Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5515C369CB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:32:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.9980.1744975967847680058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRgYSjBS;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so2207786a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975966; x=1745580766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih0Li0D34bkUg50jsYalHTL/Nq7Ule1v2GmA3vDCQCY=;
        b=BRgYSjBSbOnKvY3rY9rHxheK8UXX50lsIlc+Dn1Gh+QVCRTm2W+9ZZ9LGaxShS4sLi
         vq0ZJzy8PTBd5YNot2hQbsLAUIsPfsMeRi7vM22i8oJIxhAsGFOWX3nWOL6TtnEEJU2C
         2lDB7o8/AwtKLaG4kc/YKCqcJW30u86tiZ0xJ8M3FY9gO0t9AWZ1+E19OQTA/XuJg4SN
         e9sTPPqORYtq8+KbdSR5hhkjgzKN/u8dk+lbX8+qoGewZFFtIouiTH6p1DzWXtqkbE2M
         y5CiWku/PIJldy8QecGcCIiJBMqj80U7Hf1+aLMtxwCVaWnmuvJKJ1eoAgQJeme84Cf5
         8ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975966; x=1745580766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih0Li0D34bkUg50jsYalHTL/Nq7Ule1v2GmA3vDCQCY=;
        b=Y3dKT5Ha+1DD7aly0zr9zkUHxvs9bVBvoJFZleRf83MoA6xa5f6o68QfYki8YkRWmr
         1rsohLgnF/U/QIDHeer6YdiYnvJEdD5zWYsi2l8ANLu3Sy8bckxIZSZ+cIA1nRuhKkf8
         3jLyvg3Op28HKpdrhX68S11uqsEt73q92iIHaoFjqqjZNLCy8bCYhkicCO/A4hCOID9o
         KcDAwRPRTKLdCQffYgAHJjxksvbh8DMEIFKyQRMCa/xzE0VLOL784WM020CJJrnr3ORw
         eR7apqRZ/TnShwEvRSim5pIXPJGRcFcbjfF6cAJpG0xe/897MCYldzYcahtlCJJNeCcI
         Bk5A==
X-Gm-Message-State: AOJu0Yy7PPLvuZHGgJJD30lrF47QnXsqnm6UuJgDPlt2WrPcHPGr1smu
	EF1/RIuwKj0Lke1ilDgISL2GbalHJ6rOAiLp6tkTPDUtGbMJR0Pz
X-Gm-Gg: ASbGncvoMMU2QiUr4tWdXDdftdQyNuytoJZ9j+zj1xsJ5UJV0SqELg/PuRH1iHin+c1
	NBcMUbn3Q1kjMiun1hZKI/5nb5mx8CmlSCpxm+fgYTRG9ij/g+QkBmLbFtARPEbv7P4PthT8Iq3
	g6T0HpaC2XCjM/yDH3KltK3PgMEZ1/JGXR+KqVzpIgieGVIKJNPdrJUyFD2vQBYci6nYd8DSrJN
	/wWi6mYNPAbVOUCguaTc1liVVQgXS59hwskz+l0WNy+T2maIG7GuSXJq0Eyu/1/ufVo3ZVLtgCS
	8JgJR5riNPvCnsNFeP5lLuecYccuOcXIl9d3NMpkQ8xvrsWzLMKrxZhgJzpDOflsXdlJNME3tAO
	Rs1a6bd9EiHCnHjWYA1hkRPV5M68eHmji1sKlmNFHxvXL80Ej5YlY
X-Google-Smtp-Source: AGHT+IH2rXw69N6kcENiupvv+UQfwV+FTSALadsg8+I1iPeqASq13yVcBorVNxURjE/4tzKtUt5qsA==
X-Received: by 2002:a17:906:c107:b0:acb:594f:9892 with SMTP id a640c23a62f3a-acb74e1db85mr164368566b.52.1744975965951;
        Fri, 18 Apr 2025 04:32:45 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm108313566b.43.2025.04.18.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:32:45 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 2/5] can-utils: Split mcp251fd* into sub-package
Date: Fri, 18 Apr 2025 13:31:45 +0200
Message-Id: <20250418113148.142480-3-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
References: <20250418113148.142480-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116953

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The mcp251fd* tools are specific to Microchip MCP251xFD Family CAN
controllers. This commit creates the package can-utils-mcp251fd to keep
these tools separate.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index cad41944ec..932aa1de20 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -20,6 +20,7 @@ PACKAGES =+ " \
     ${PN}-isotp \
     ${PN}-j1939 \
     ${PN}-log \
+    ${PN}-mcp251xfd \
     ${PN}-slcan \
 "
 
@@ -56,6 +57,10 @@ FILES:${PN}-j1939 = " \
 
 FILES:${PN}-log = "${bindir}/*log*"
 
+FILES:${PN}-mcp251xfd = " \
+    ${bindir}/mcp251xfd* \
+"
+
 FILES:${PN}-slcan = "${bindir}/slcan*"
 
 ALTERNATIVE:${PN} = "candump cansend cansequence"
-- 
2.34.1


