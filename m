Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F745D3C558
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15647.1765373211470272602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xe5nRsdQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-298250d7769so55322145ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373211; x=1765978011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RPJv/T6uW+SAIwjk2eaX9MvQyIh+NJLyAyBDcfaDaU=;
        b=Xe5nRsdQvXwXE0KlhKmv36itIrC1VDxd8YWWY+V7JnFvrY3s5mvuhgI0nea4di4Owd
         N0inOj8M9R0VuxTd8cXx3mceBVAsaHAI2XjDghXmTv4obdNWNTrbEXe0g80H4RWbIoJP
         aEgpa4kXnTSyrTO2Rbp1vQ0rBSU4+bD71gQFaaa6jiiOi8JYRuetxB5nMBvpKc+bo4iz
         bvBFMircmRtdpW3/F1IBqWObDmL+8rPQ8d90m0PENbLNf9XTsOrSg99/1dgexxBFonF8
         r8xtrYOoTc2+u+qWGmaGitFmnQsIJXuaFNGhXHkM8clFHq2vh4sFEIlMIpVxM+uSi0Bp
         aU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373211; x=1765978011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RPJv/T6uW+SAIwjk2eaX9MvQyIh+NJLyAyBDcfaDaU=;
        b=XujXfzBBXD/Nvs4T+OSDjxQj5H2ZPam+W58R7RIkcWTAq0MTElmY6MiZ2vWMTCyWIm
         zD3OYp0JjHyBuCLWxcIMlivRu/JWjX0iauf+f21B/wPYgOw775eWWlJMCEt0kRbFmWoC
         yykd314Q/0QZbv6gGkcsQ6NL9wh/4kcBcCoYiJn9KcG1ucWFUg9zLmjmmmn0F0B9Clv5
         IcgmP0o+v9w6lCoxmX5l/X50zNjI1MQQDZOwMaHv5Qs7H4pS1jQQ49ulLs+GBCTcJ2Si
         Y0aQCuCmqHlVTcv+1oUHgNAlUI/ILETxfVGXL5RGrIY7r08Y+VeWbXsP927ksHBYohVS
         paeg==
X-Gm-Message-State: AOJu0Yx1aCNm4phyFXWw+CPPoFibTZcy/Pllclbmg3WnUqSKGzloNKx9
	jKigVQGBiPK8FgwZTFemLNB4u/viwFD8pkCVs2sKl3py3PinByL8ngg3Vo8omA==
X-Gm-Gg: AY/fxX6nodlaMKGWzU9sJMyc3URALzVU3AbfvHRAmX6KJMSTdL14jImSj5HxW/P0/j7
	y8PmehJzxiV0qxxn00kpVUubHb2RkuJRc2n/Mddnjd9ze6Df9hBgwMmbJaU7bRBrGpBK6khgX6d
	7P2q4u0n+2HHNAibsx/9fLD56OfzadokptrjUDykZRtKciaR7tNB2K5ojSGsLI+zjoBvkvvXSU7
	zyntyXNx4BveokCcywaJDBIphiP8PCIWIBTpTRflDxJgZwkD+9v5w0DvzzoCfzCnfZevQzkiyCF
	W0iORzGKNTQu6ZgbKQGp45e0ujp/KA3TTRfwetfg1x5J9SKWTw8PUZf2XYI3+yZPirH26QqB0lw
	OehvdIctEQUA6s5hUR+H7jgk6HYLLTCMI/NdapvmhfJGlnSxuMIZ28RKWnwWAqjhQxi3Jl1z4/D
	Zf7lYxyRGkuD2EL7s36UTZxqA=
X-Google-Smtp-Source: AGHT+IExjFUIwl11l9Y5vkzbPcUbjFGLP3laLs9VwinIBMR6i73UMliIH33I9+nrYhiTVftUcEZbuA==
X-Received: by 2002:a17:903:2448:b0:298:648a:f96a with SMTP id d9443c01a7336-29ec2804b11mr22233865ad.61.1765373210677;
        Wed, 10 Dec 2025 05:26:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: yuyu <yaozhenxiu@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 27/43] trace-cmd: Update SRC_URI to use HTTPS protocol
Date: Wed, 10 Dec 2025 18:56:33 +0530
Message-ID: <20251210132641.323679-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122531

From: yuyu <yaozhenxiu@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f00b6ad12f2fead06487711c48544b3dd62bb987)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 6782dec228..38922126c5 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
     "
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master;protocol=https \
            file://0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch \
            file://0002-Drop-using-_LARGEFILE64_SOURCE.patch \
            file://0001-Do-not-emit-useless-rpath.patch"

