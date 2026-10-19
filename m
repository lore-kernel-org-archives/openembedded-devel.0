Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257D1CCA490
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:35 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24900.1792370485764526018
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M6la39ID;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso2945369eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370485; x=1792975285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtrxA50cTcxIqYEsoReMzxusyEQA+XZbbZtHgKAHsHE=;
        b=M6la39IDsMwWz0jejD5iaCOT+gxA3+vxcWbZJfQ5iQh7Rg68OXDyTzABIreky45TL3
         dLBjo0weYqGr/v+R3zibBTjzj1xzCAP3GTROLln/YHJw6U6l7Mt8b7IRcRaOzebMj4xX
         7wNgUnc0EQ2lCHdlK/+N7FaeUT5oLCgbLvnL0WEov1EhYQ96pr0H3GBaQX3tcASdF4MR
         YTq8WhOGLlNxpmAqFznNf1QjcM+iP4dC9p6wWnUs+1770+ctI+tjliEJV+BHSrSQiVB8
         MyjsFp/+6wdIk0bwX+2nNbCbmIqW+pvRCnfizVjloZ36KXZ8OnqyL/YO1ueUt2cU4fiH
         3MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370485; x=1792975285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtrxA50cTcxIqYEsoReMzxusyEQA+XZbbZtHgKAHsHE=;
        b=UHF+XLLcrNHHl0eK5gYx/aAR2OKtZHqeyt9DULydQvX3bF1dtyTbZmh2DghwRMtPQT
         e9JFc18ySsjyza82BBKsgSX7RRUBEyKLwxl9KDY3JejLpXYWkeGdLYBbNurxHBvRmK6S
         sZ3NBG5xKstyBpJvL60zx2UcBH8Q5LOGjSGla9kuhJu0vCgJNQAd917cs+pl6TQYA/1C
         quMcIXiJ9JCt+z2x4lTXJw3g3CpCHBZTflZXulSNRpQdhg2Oa74Ybz3IfTejE4BYFBUb
         6Ae1KIPKDsek/uZbn34T/9/nk3ELFH9opqWowBmwpEcD7HrOVw52qdGNaMNRAs9Ln1/O
         pABQ==
X-Gm-Message-State: AFq9FYLdxrxEnHn+s2yUAMBJT3fMXwGq4u3e4R/YO6OLH8CCSIraDUpe
	qIvDFQilEVRENGaIYuhcxmOhHnUTyiHQyCLqqioFfagnQS5zDNxtxyIq4QZQQnWCfXE=
X-Gm-Gg: AYBFou0Uc+3xBFxwLMULLdz3BtLSivmWl5knppvsLBWkcBCmHGonBeW5xyLtUw5cFA1
	8NwZKGYz9xqOy5bMHZj2eCqe9N4QV3lzMj/ElD8Vbtma/tk7+ksLZxN35zN5IhaSj4Bl7oxpt0h
	x5VCvZY8MBmFX8tm8N3jjLKIKvyWzcaB8jDaxjZPvkZCG9Te9PD5Ht0TkQumoETr/1BQybx4eql
	88uAIH0qOOQzUSvxpcCfb/k/+6l+1OLUp/Nkh2KA+fyP5jAtU7m40Hs7sFTkwxvQce+hhlhITS1
	74kSMvDkePfOrGE0wqbKLtYb4qOp+7oz+0p1IQkj5l8f8zW/aTChdzYxFjkb/16DsVb1AreWIm1
	PVWL6QH1pKMZyGFCnrki1iFqZPR+tBqbXjVk2WHKypICvLxloeUuYPLOtB8q/AC33SlETvz7/9E
	mRlPZZDX3yJrIx4rnpW9yAFK+w3LRUkbWfzswOI3kAtQ44iodRByT/pCq9abLW3RcAsTbsmK234
	VqwYuo50Pjn/LWPP9vIVG1vj/sREPXAL2Atacp7k0yKvhDbPBk4wLX7ywNZjDLmJH5kKMTTeWv8
	QWmnPzUBZPkd5Jo0BrFXFPLCXDBYJ4ku5qt3c4LwzTRlmH7ckoKkHDA+rAi08jypMEFK9Jzy+tg
	UQcrDjflhn+o572J4u9oGiUUifHU2ybPRmTprat8fSEtLYr7SiTHVKad7WblroMnTnNXNxcgelJ
	ZjiACOcSXNN1BAhhgRN/0Q31yT+1MrIlGhU8Y+FiFh00v//Q==
X-Received: by 2002:a05:693c:6312:b0:353:7f17:4358 with SMTP id 5a478bee46e88-361a1c4888dmr10176431eec.24.1792370484859;
        Sun, 18 Oct 2026 17:41:24 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/8] luajit: Set TARGET_SYS to Linux for musl targets
Date: Sun, 18 Oct 2026 17:41:15 -0700
Message-ID: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131100

TARGET_OS is linux-musl on musl, which matched none of the
LUA_TARGET_OS overrides, so TARGET_SYS was Unknown and LuaJIT was built
for LUAJIT_OS_OTHER, losing Linux-specific features such as the
profiler (LJ_HASPROFILE).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 707cea5766..a929d832e4 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -44,6 +44,7 @@ LUA_TARGET_OS = "Unknown"
 LUA_TARGET_OS:darwin = "Darwin"
 LUA_TARGET_OS:linux = "Linux"
 LUA_TARGET_OS:linux-gnueabi = "Linux"
+LUA_TARGET_OS:linux-musl = "Linux"
 LUA_TARGET_OS:mingw32 = "Windows"

 # We don't want the lua buildsystem's compiler optimizations, or its

