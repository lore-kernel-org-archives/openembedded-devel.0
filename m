Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9F4C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20736.1782663766086226476
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mTaBmUIJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-139f1dfc9faso1390637c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663765; x=1783268565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L322cVvopf0NFYKDd43pnEkB1AtBJ3yhgWzxcyMrN9Y=;
        b=mTaBmUIJVybOsQNm8p7djvGK1B0SeTo8Hi/JvaK1YfKQOrVMbMd4/LCHPtvir/S20o
         gnH4zSbxX7hitEETCXPdDrtNcsyWwPVy4+XAB/kFWQ3q2JFqwCIR/ZwYnmygaF6vnp7/
         glcNvHlaIO2TewvT6IHRj9TiYIaLLBfqBHs/8DPYmZ9G/2nuuy5aam0/Bla7zUObfsGQ
         n4l5CZczhS/XURMvTgHlMHbTYPXHv0O5RyphWMZrYFfrqiRR862qh90ddAVt9rYCQzn2
         9oUKTEgNX8X/e6K2vAGQ20QGRYMzezV2J2mZaZP8dv5AJROVbzVOPo7qpWl1jpNPd85f
         cU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663765; x=1783268565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L322cVvopf0NFYKDd43pnEkB1AtBJ3yhgWzxcyMrN9Y=;
        b=er8tFnXNuqzPKqRpgczcZHnSxd+vur0LzbEqnGJWtVsMHMGnRyHhGcqvVqf/qmSqI7
         AhjMEG0m9F/lFsbXZPJBr/F1C8ZJ7OS41OeM+S2Hu8eI7joXFMtTpsdqxHw+nTUVvkNj
         qMROruq8DZxHnKkziaHr30ySMC2HAK4qNQV/ays7Whft86Wa/D8SkF9ppNZ0ydZVfeSY
         JgCPDYc4vJ0zlxIJOOb/IXyQAMgKXez5u6lENVwk6mOQp/U3BxBR/PUyEYNm6jM06fvO
         NGtTTh7r9ksCk6Ru3FEy7i91pwDrT63c9w4FpNUHlUrSYTjU/vkamML1I/jT4I6pj0OO
         CAhA==
X-Gm-Message-State: AOJu0Yyx+vKxLwk41lHyvcULXey0gHTYxIUCABOdiwlJBZ2lK6uCnl/7
	s2wQG5MWzR6ATGIowy40lGQwzxEak3Zqpyp2zadSiI+bUULidsbemTb1P58geiQdjRQDJQ==
X-Gm-Gg: AfdE7ckXTTJa+2dwdnk1Ii3k+5msiqXmGlTNST44W+Zk9zOwdLTbuR9HUkRypO2GRi0
	PE1imHugzJp769KUlXl9Ae0wbhzdMq3BzeFcnHURa7Oxm7Ahi3CEReHOJb60mpC13bIZn1ji2Pv
	bk3SZ8vW1HaxuYgmDGBijUL2zWjZkvxZHopXvHRmc38fE0lRuH9WJjHo/Jioa0WYTTT1/0I0AkB
	eFhTXqrIcdAfCpSrMdQdHo81mMtRX2JodZBEgFta4iSjJm3+yaic7qvpVs85pWjPphMNeoXrfCr
	ZuuhP3cCHPhJxHyanfe+4U+n0pv2E+mcEjEh/Hfa/M3mV34aTqs/2Pd2mV89rNGMbvDh9eJikzC
	G6R03pEfrLL9MKS8f5afpBk3/OAqbD+YHr+oeFi33DITXCtaik8u7y8oMOBVh5IRG+3O0PH1ueT
	tUCoczSNppHv7hWRVs2Q9YCZ0Sm/7m0xBvEo3YIKr4AQ8dq/0PWFtV95nix/ApyVHq0cjkZahtG
	vVxdCNVNsww7LUHDpqeSM135c5hhiEp+wKLMiprSv4KfOO6til6Y0EpB1NL09KOAMQY+GVgtCTb
	EidGMLzQNn5Qo7jSjBA01ehSk9g+7g==
X-Received: by 2002:a05:7300:6902:b0:2e0:1f09:d924 with SMTP id 5a478bee46e88-30c84cf3f8cmr14419767eec.5.1782663765362;
        Sun, 28 Jun 2026 09:22:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 120/128] assimp: disable warnings-as-errors to fix GCC 16 build
Date: Sun, 28 Jun 2026 09:22:14 -0700
Message-ID: <20260628162222.4081517-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127930

GCC 16 flags a set-but-unused variable in MS3DLoader.cpp and assimp builds
with -Werror:

  code/AssetLib/MS3D/MS3DLoader.cpp:633:28: error: variable 'qu' set but not
  used [-Werror=unused-but-set-variable=]
  cc1plus: all warnings being treated as errors

Pass -DASSIMP_WARNINGS_AS_ERRORS=OFF so upstream warnings do not break the
build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index 13d1002946..4cf2d1f787 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -20,6 +20,7 @@ inherit cmake
 EXTRA_OECMAKE = "\
     -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
     -DASSIMP_BUILD_TESTS=OFF \
+    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
     -DASSIMP_LIB_INSTALL_DIR=${baselib} \
     -DCMAKE_INSTALL_PREFIX=${prefix} \
     -DCMAKE_INSTALL_LIBDIR=${baselib} \

