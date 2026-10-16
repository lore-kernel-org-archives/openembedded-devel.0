Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4350CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:08:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14625.1792123677440454117
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MHNqPGT2;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987b4a710so1137785ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123677; x=1792728477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wejhKIw4h4fm/sLqKPiDcY1XyNWWXSLxkvNTYtHLHwU=;
        b=MHNqPGT2Wn7adM+OFh8smGMSvpOF2SaVSnSCidyJF3/9JAx0oKhGO+9E9IQq0Zslsz
         k1L05XK1MUJOsBXFg6z5hUxOs/+n2ZIwJLuCRrZBAeDkdFGwCO+ksPESgtSbgiV6HA1t
         HEPIb04ui9CTRQQy1Qa+g/N7U8neZ69szjbSYjehl4mxymhI71EtOVHZvmd0YHN7RKow
         wi9aWHZAJApH4Qx/2MvXEwtP7lsWslm6oWTagW2sIIsYwSkfFOzEbP12HXg9qOff3iZ6
         iEZqHObk08xv3WSeHKfew6tcoisuuZgqIXoBjz/mdKms9/hK26c6oXmEAtazm5p9iIzV
         gW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123677; x=1792728477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wejhKIw4h4fm/sLqKPiDcY1XyNWWXSLxkvNTYtHLHwU=;
        b=zCb1N8ublyCRdkYrI0qaMfxcWjfkwgQS/sURbjwSKSoPb7aDy4b9pSnBbDCF4u4WDb
         3Q4Vvcv7iKMaRyL1cqpkKCI4rKLRXsAIIMF7b6AAgyBOyJYiflr2rgEb3HtnmVD4XWKa
         pADSpwyDZEP2tgJK5nxa0DQO/bgEQ/81Kh5+BR1j60qWZbPqn8L0NyI35r8g13ZcUhyL
         S74mrcsqUfS6jwKaoybOMd6WrIoJdNKUULeg1tFgl49DvMsqbXoLxzajHaXh1yhf0pjl
         ITgO73TYq4K8z2vESgvHTL7wb9qk3yHNvneY8CLCZ9/OZ+pG5J1TRMEu2Tjqx8b6Hu7b
         5ThQ==
X-Gm-Message-State: AFq9FYJH+cAZkNrJKi/SbYRDYdrVb4u3ujNze5OFXtK+K8aA8nln4moH
	/rGRSi2KRGWOvF1WAOz5Jm1Wh/IKV2XDoWDbShi2VoXPXpAa+yTYn36QTAB0Ug==
X-Gm-Gg: AYBFou1/yfqHCU+5ZHRyPS9Fy3+CnjZJWA0tR9+iYklDqVSH5tLWkkBtSlDU4wUv2YM
	UhkNWsEQnkoZzfuljeiOIglgy/K56dMunXes9lPIU3h41FjQoUmZYQogBHarp3vUxpj0djdhyc/
	Sf5u91e1rqpfJCmmDOCD6uPov/aDwvPqeHhhJsntwV8Ksq8Vb4vLkz3bdbYC9SDbIrvrrz7Ee+X
	6nB9/7KW3SxXz73TbkA++E4d3/4/q1wEqWaz73NvtTDdwwoNO+oE1KfzwAr8OETQV9wQAXPcx7y
	lnBrN0akyOqy26tZXnT6/JGibpK5+2+8OqEOKQD9E9/QGOs5MRmNJIfC06OrVsBHyHhDv/tJNEU
	bzjywu18+r5bB2uGMpnRIiSJiM2TXSxBEmGjYLlsiWf26Hak9at0ItVNKTk7e9fije4xUAMYcBQ
	h4zlxNSYRxvtPcS/kY/ZBNKiL5oyEqnD7QNLs6CRyV2DGCwO8Jl2b2fSMyYdaiJ/khSPLHpDO6H
	kXf+Q/SNMEHOntS/hkO7uq3kgVqVt1fTvtEwgY=
X-Received: by 2002:a17:903:2a8d:b0:2e8:6540:11ba with SMTP id d9443c01a7336-2e977177b43mr13242025ad.20.1792123676674;
        Thu, 15 Oct 2026 21:07:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 7/10] python3-coverage: upgrade 7.16.1 -> 7.16.2
Date: Fri, 16 Oct 2026 17:07:31 +1300
Message-ID: <20261016040734.1499287-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131043

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://coverage.readthedocs.io/en/7.16.2/changes.html#version-7-16-2-2026-09-27

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-coverage_7.16.1.bb => python3-coverage_7.16.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.16.1.bb => python3-coverage_7.16.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.16.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.16.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.16.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.16.2.bb
index 6b0204a939..d5efa1b0c8 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.16.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f83981779bcf9dfa06fa0a8d4cb43e0faec1706328ce07aa3e7b665b4ac0f210"
+SRC_URI[sha256sum] = "ca64d9f1f384f151b9511bec01126072acd2f313439f8ed015a22d8790aab6fa"
 
 inherit pypi python_setuptools_build_meta
 

