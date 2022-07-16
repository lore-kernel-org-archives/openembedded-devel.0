Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2AECCA47F
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 03:14:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.1994.1657941277903165625
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 20:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pzj1p4wF;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id g17so4652428plh.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RaXNueTko/gMkhT9E9Yjr3R5G9NFhrdHcZLVWiBmqqo=;
        b=Pzj1p4wFxhu+dq3KyFpF/Qi8BH9Kphg6jZ1ItF44OkJuCwvFVmP9Pw3r8QYFvvS14s
         Rm3ASuDDUHwF10MQWHT3ckC32yonYy7GeO1s1t6nXUS3z/umxGurA3GKy+I8T4sWgZbY
         lz7XD1l2S5OUxvHkGUmZT9Wtg7PIs+b6q5xjmMWWIhSvcnQ1IYd0tu+E8j6T4j4++MdZ
         +YNy+kUljfhYd35fqwYDmVoeWMbryRrOLh6R5tbAnm9Sna1J9PM3cWhp/N+fAoJcE+Mz
         zTdQYNDdz3HtjhomxKNF1HhuWSGYUWUgbbRLVyONNmAne7cA8y2vkLll2g4t541nQE7V
         it4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RaXNueTko/gMkhT9E9Yjr3R5G9NFhrdHcZLVWiBmqqo=;
        b=dUucXEAe5PQAmtywBWR9vWd0pv9+EI/bpySSVekNHzKUgaOFgU7Flv8isTxElPCZe3
         PIhE4SyLkwYyz2+s0WxgG3oGVx7TqNxVJTZ8NAOLKhP0LIZXx1QFg8m658GVWygU9hVg
         UCZT82p8ycXv4ScBbeNETGnM/YsfM/4cGccuZA0YyICsGakMtaSPlzfpSuaubtTUd0ML
         Y3TSE48W/n9BuaZZfnJGf/jcLtSt64Mw5jSRfrh8U+ew0tIA0g5G+svJeG2cUeD9hZc3
         Keiz7O78wVDwE4F9VKXqSBdRiNjQ0SVrmPyemoApulVj9kWp3R7E681fjyrWpCHQ5tZP
         Kzcg==
X-Gm-Message-State: AJIora8pb9iPAmM2L4VVy/SgN94FhHU0KjlaVYs/9auXPTsmQXHHPcQO
	K4J/6GYp0jdyVdcJBTmNjuf+I7t3JJ9FAQ==
X-Google-Smtp-Source: 
 AGRyM1sTw5qHNzM1+S7Ni3OPtQTL33QWVrP/SCE5Zs2d1Ydt2F8yxfrqyhYYsi8ucYAYnaMYbv6Nsw==
X-Received: by 2002:a17:90a:ea88:b0:1ef:94f6:834 with SMTP id
 h8-20020a17090aea8800b001ef94f60834mr19297966pjz.236.1657941277035;
        Fri, 15 Jul 2022 20:14:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 d8-20020a170902654800b0016c6e360ff2sm4279455pln.132.2022.07.15.20.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 20:14:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-antlr4-runtime: Inherit setuptools3
 instead of python_setuptools_build_meta
Date: Fri, 15 Jul 2022 20:14:32 -0700
Message-Id: <20220716031434.4021879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 03:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97850

Adds missing dependency on python3-picobuild-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-antlr4-runtime_4.10.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
index 01f17207c6..7b69b9edba 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
@@ -6,6 +6,6 @@ SRC_URI[sha256sum] = "061a49bc72ae05a35d9b61c0ba0ac36c0397708819f02fbfb20a80e47d
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "nativesdk native"
-- 
2.37.1


