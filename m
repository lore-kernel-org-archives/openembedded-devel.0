Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA9ACA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:17 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47678.1790553847888260762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OJnxYTvL;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7979d1dadso1063816a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553847; x=1791158647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TF50gHQMgQT4YECGHSU8/ZsAEe80BNs15f+a41pNEQ=;
        b=OJnxYTvLPcFUn7NIEnlpksKKfahkimhlnHXfLDlPRkVaCxh0tAAXpQ7wmf22MZZh0b
         eGijN0YEkodQvQi0tklyww6C5tuqFZZMsnO9h91EJIA4xAxYgeu9R/v/hDEQQ3cc4sJO
         HK2xRN7vd+K+H1g0nLFHJ0flv32TG3fd5Doil7bUi4vxaun3nfZtJeWT5KEn2h//H754
         O548Vu+yieZL28USvsMXHS33pqXiZr/3VJdZIuqC8jHfb1nnWVNBn9AbNeAaNiFfjbv/
         n94owWdNOmrm3uFeGG9XH6Oodw//DmsZ/o09cY0o4brA4OTTp424IZl4V361VUuvrUGF
         tN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553847; x=1791158647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TF50gHQMgQT4YECGHSU8/ZsAEe80BNs15f+a41pNEQ=;
        b=uviFASWOe9Ql1Lm3tvguKKkvv+75mEubTLkTQ1HgwyLN1BUVu6R2j83HdXEKNopKLt
         UGbKOlUsR7J1wPQbqMWHnrlb8axOve1Sqjot66QVwOvunr2dKCH/gnKYfgWuXJnHrvoU
         6jh/cML747U/PL/eea7SJe9MQs8CQf+VYhOXgORgubhoNKvTUTmdpVvU4tAddqndSFsW
         8z8jWBvkFjHFWtIek5edeAKt2f3d4zthXLdr3rDeeXRnSTM1shmbuS3MYwNPdKeJz94O
         R9OtOjQV5P3lT7JHQlMa2S6qDEzcxSuXCBX8khYq+CzY4FzaCL3uKOGW/1/yzERAZfal
         hVNA==
X-Gm-Message-State: AFq9FYLGoAXc6Jm7VZyaC0X8knWgiEBDw/3OiRryhip2Y0Wy5URrTY0X
	Qf6nXzj3dWAaEjVQGaBixmSRNGD5xzkuyMyOuBt/oHOh63jPrTTWonky5c4NPQ==
X-Gm-Gg: AYBFou1C+iITMLhQxpAYU8FaUFCDD63OHzccERmSr2cEUZDIGLwPVchpqsgZ6sA3gGd
	SRtpJEwJrp/8lIXgIU5h4Xd3kgV1t1FwB7kpBG96JlMlI43zN21AVFUq+o/O+XMVnzxDjKrncPb
	ekICVPcJW7m4UmlcZEUefa4rtoEbrJJny8jmrdQ2QRANbZMevaxHavsl5fiS+lLpKjpqqYraPTq
	h+HRtijLylGRwtBa/qpSffGz20LhbVHuA/DR/VNOVwqWV7IVw+mOcGZTxWZJZVUd0bvjA6wdGkI
	iREC6dgO25FOj7cBD65N9P+xjO4Y8fXb6Yk9a+KJ6vKKtUihx6o8w9Z5nkVavvD6GmsJuFBUqq5
	2PUbHhTRQkD/1a1t0S35OenxwM+/l164xdf/vSAXNS8LuHLnhrbLd1UslEGsab3l8FRritLC13v
	H2ixZwOaaoPOQskcj6kwXKMr+k02C1GmAYRas1YJ7dgPvIrAZRWvD7jN0JMV6MtbDb/HFlWTqfM
	pBNLiy+rLa9ed+TKtSIN8c=
X-Received: by 2002:a17:903:2f82:b0:2df:9ac9:bcd5 with SMTP id d9443c01a7336-2df9ac9be4fmr52599845ad.50.1790553847195;
        Sun, 27 Sep 2026 17:04:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:04:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 27/30] python3-pyais: upgrade 3.2.2 -> 3.2.3
Date: Mon, 28 Sep 2026 13:02:59 +1300
Message-ID: <20260928000302.2528437-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130414

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/M0r13n/pyais/releases/tag/v3.2.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pyais_3.2.2.bb => python3-pyais_3.2.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_3.2.2.bb => python3-pyais_3.2.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_3.2.2.bb b/meta-python/recipes-devtools/python/python3-pyais_3.2.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pyais_3.2.3.bb
index 44ce12bfba..4e2dccacb3 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_3.2.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "bf1a07fcac5c42d49d682635bba44e493d5e6025"
+SRCREV = "b44fdc6e0fd4ddb9e0afadab9c8ef87f475aa091"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 

