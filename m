Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DD910A1E6D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45492.1774523010574780012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m+eeTUbI;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82c4b5dfe6cso413585b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523010; x=1775127810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ora0Jmu4+xTPjWTp2xMHg6TH+74DluUDfQqZEOhBhA=;
        b=m+eeTUbI1HibVTg4hFF5jnQMRoE/aBUh4Q5tsqljyQCHaBK1WbFzoLEesiTpbr+9vd
         0IsAv4K01cjOezh1z6HHIlwZe0idcwbvLk9hXFHqOO7K1P7OZO2sk+AP7Q9SPXywrUSH
         0ZiqoZrOx0kByF5uBwn8k+cDgooXNWTMyMLCP6CQ1Q+1EsAZIAcCGs5274w1FcHpr/jR
         Gxb2rtCvUgSEJmIIzgiRouIw08FEg2000QfeWnJjI9MllliJcUFD8K3Prksidhd/JzCk
         SnwNBmNhjK0lV79DzV4TKP2kbZSvvcGfDCtYxfUDVzgYxHryyA3zNm3RD0fBgrCVfV4x
         S3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523010; x=1775127810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Ora0Jmu4+xTPjWTp2xMHg6TH+74DluUDfQqZEOhBhA=;
        b=h4S2F26579Kv6Xr/oUam5L/L86p8uCzHhour+eVKWPa7faoVNQlSKj+MmZSdfTRMNt
         cNhGxetJ9jTg65XudGhsA6h143y63jOnSpArnrZgj3YeQp2EGAbIsfJzLt5LYLx6RyMj
         nACSJ88kKVbuiGf1TpY+Be9XKYtSmpCUlLvBPBWyipjJnqHMAKU1FGKrj82SyshF5/To
         UOV0AKeUMGMONCbdjtqxcV+ufcmlJCR70m4M8c9s/VY2V71Mj4/f/wNDiSMT7Br0Feqc
         sGf4qD4v1aQBljllGV9MhyziMxY35u6ij1eNvedrmDY439Ksjr6Sa7JwRFsGsU1tACDR
         PlzA==
X-Gm-Message-State: AOJu0YyqRHSLju7IGrtGxP8DZaeSjJHCu8mB8A/0Ee66Bph0Eviiz1g8
	ogIRuHEvYcEuU08Q4OytYs2PqKtgQwbXKbssxvxnpSpu1dyeOqoZdpx2b4PvU69m
X-Gm-Gg: ATEYQzxo7prntxnxhCb8CXblglYdSX7lmE6toBmUe6jffCPQk/lPsQkS+Ph8ED1oavl
	84t7kD4CW715chwLKTl4Jd9YKqz53yGJW3fcLkx6kGfiwiKy6sC2FPrB8hNQ1b55qd31gwhM0ep
	teAk0KmSssEdHPpTU9hEPZ4WuU3ajdGHDlmrWJW2//Mt1HYmJKF3mh54niDxCllLNUM+i+jPOpS
	5WQ+apLNXbdNlIvXk7MvSdR4BQRre58pjNgB9enle8uOWcVWkIrV+AjhUrlHHycCZ74Nqhur4e0
	CQqOHmskeCkBiEsamWvNkdwCtOsJuZmx4xpL754JXkG9ZMYNpLh8o2VhHkcS7d5H+mgMf8HKNEz
	vdG6XVLEVVXwiKv2xgQJ7wNok5ijQb2f5jY8bNrLo+80o8CWMTAgOpIwjCfqFul/zM0XRn0E0Ds
	sLYXeR7q3KAK3ds40W4cLgkycw2P/gy0WBlEQ=
X-Received: by 2002:a05:6a00:80a:b0:824:1b66:6ae2 with SMTP id d2e1a72fcca58-82c6ded3af0mr8081641b3a.10.1774523009723;
        Thu, 26 Mar 2026 04:03:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/13] freerdp3: upgrade 3.24.1 -> 3.24.2
Date: Fri, 27 Mar 2026 00:03:00 +1300
Message-ID: <20260326110310.1809866-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125644

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/FreeRDP/FreeRDP/releases/tag/3.24.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/{freerdp3_3.24.1.bb => freerdp3_3.24.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.24.1.bb => freerdp3_3.24.2.bb} (97%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
similarity index 97%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.24.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 22b2c4859e..a4561495cf 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -8,8 +8,8 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "b6e770ccba87c58ffd0a55366fef33361798e39c"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
+SRCREV = "3028b706908f81767d9b9c744a90778c28f57d61"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 
 

