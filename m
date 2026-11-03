Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8031.1793701452549073118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LoEtYWib;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so31029285e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701451; x=1794306251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3yEeYaH7oVmaAqqL4MkA9SgXNXMVgft26BoH7no3AY=;
        b=LoEtYWibWZZ8wfv4cXhYaWWSrzpDrr3raZOYHbKzlEm17elU6amePC5eXw4EeOQz37
         RrWSutL/52fjhnkCRXEzUJd/5ucl9idINaHyn7C/0qUUb4wZdol8oRD8IXZ4mntOkTUB
         dxPmkYYhydxjg1XV2ILBESqWGd46WuEnh5wzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701451; x=1794306251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3yEeYaH7oVmaAqqL4MkA9SgXNXMVgft26BoH7no3AY=;
        b=JxuRSGb/2avxbjpK6md7A8UmjUoDyLJmiJydyBv9PycwKqr3x4+B323XeESRg/TrR2
         xO/aLtqogB9aDV8RKgGISEDEViLtrHLz4W22ENsXy/7WQHGgBoSDvzX3P4JDj/30qgOm
         yYcWustOaT8EcCZJPjU+mX5qvSgwg2Pj0N0TKDHLzzsPSNQd6Y4dd87cpi9gb/lGLLY5
         OUtXLQ4vtaZ3cYmFH50Vcurktx82lPB6/w3oH86G9DmND6Sk/CE6cs4mmeegQ+OmbRqi
         ++GCNcOuMB2zAcuERVLsi38jf2SSEOvFsINzkwVqaBWQdCcnrlq7L1NhERbcpK42883D
         1Lyw==
X-Gm-Message-State: APuU4Z9GeRk7OuKi/6drQnFrUVUv+eHBVMhF1mNle2znlCs9g/W8vXnL
	n6hgsohqlZZv0q277WK8WZW9ClnW+mNgzbAvOECMTClz4evDpC/NcrDXouK4M0D0hUnLdQUIIoT
	v0HoW
X-Gm-Gg: AYBFou2Nru2H+IXQ+2pley6G+APvmltC6VUpP1CYQOHp3PQ572foGQNmr0REDjyPO67
	mW5YVT3e5Cg1abKWJwJhGI0IPHGx7ExYFGPr8O1LjyenfqNFHjHfQ1FimBNjKBlLRPizlnWcgly
	nnRt4MZ3bHMRaZzvHQxm3E/VjrNRVHYd2q7VBzr2ueM5oW3yCtfLAXJdEKQPzaYvGJdT3IK9jEP
	ujRRnOhjy+Qx7sNFrUx8/YVORPwMgIkiwt4M3HQT974Jf8qqPP5BjN7w3MJ8w249mjC1rzCPfdp
	1ILfGjxccm9tSpytiJiDoEAYSB5PnsrHxhgs2J+uhWQbXVqtzAOz0FhV6ich7/RLpMpzAWd13AA
	GwPACCqfjnDgSwn4HHyKWudbcz2WvWL32yO5JtRe+WbTWQO50/twHkrMm4Jr8lbA1QWg145+5S1
	IgCLJyvpYAmmLjUVLUa6WiVjZg7ig1gBSYK/Ep9EbyqAhTzRBh8lwU3zKNDToVjyLIwxiSFoL7T
	Y3cOdlWhMSpTBerKpCwHJ9OuyA2LieFXH2vXJPJnfXOt6sfVd/R07TRgIuIRE8S8RsMBMQkG4B4
	VGIg44vtgxoeQHtAG4C5K978ld817wgGmVRjvS4lPWrlcYRoX53m/EepBLzoLSoM2ZbbRCAnl2T
	MdtOxpxCOztyjL21xlU2GSHemn0Dn9et0J+dfwkNWnqgTrtJASY8zLw==
X-Received: by 2002:a05:600c:3b29:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4ac17d19aeamr262541635e9.21.1793701450727;
        Tue, 03 Nov 2026 02:24:10 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:10 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/22] python3-grpcio-channelz: Upgrade 1.85.0 -> 1.85.1
Date: Tue,  3 Nov 2026 12:23:35 +0200
Message-ID: <20261103102350.1952237-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131770
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.1:

- Fixes Denial of service in Health Watch RPC
- Fixes Memory leak in AsyncIO client-streaming calls with
  interceptors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...cio-channelz_1.85.0.bb => python3-grpcio-channelz_1.85.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.85.0.bb => python3-grpcio-channelz_1.85.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.1.bb
index f7b580142d..e8a82a0dfa 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.85.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2a16ad645cf4897325c617c6eb2a9f82ffaf28978c3de3b1039ef06e3bef8c42"
+SRC_URI[sha256sum] = "bab93349a820e714c6b827e374bb10896dbf6acfa45df6b6ccfa9af13301e4da"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

