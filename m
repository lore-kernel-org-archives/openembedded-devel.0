Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AECC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:36:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.826.1787117808841699979
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T4Sn11V4;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e347638adso825836a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117808; x=1787722608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLSKQhd2S183GLDFssRjTZx3KTIK9z1WDYTs0TsaCi8=;
        b=T4Sn11V45rYCacKiH8qS31SbHhMWOY6Z2F7jJ1uMOaFFVmnKZ9ekAfXZl/M87cix1T
         7UfzLvPMqDpU6iisZ3wDmr106dvCdxyGYgTArDiXb7BlykWwdfrnhXKzNHLdnHeuyo2c
         /TTp0VxbFwxR5Th8uU5WywmObM9qUqjSHUjOzHSVteDIXdYaIx78q6+MivWtmv+aj7O6
         c3IT1NmoDASEzwuxXUN93Ocu2LveZZfBL6bkBga2dQbxap1La/fbGa55koTt/Xbg+kXs
         Hhjaci3x7Ei04EdFzpyHUD470GxnlP2sHCKcHGThvRNHortBc4hjS16knb2hkZHUla+q
         Po+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117808; x=1787722608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLSKQhd2S183GLDFssRjTZx3KTIK9z1WDYTs0TsaCi8=;
        b=WGhxpMAvqar3rIfbOpaK2OFhKSAIOK/1iGz04nWuF964tVY55tb8HaUkoJrZ3kj+eu
         tdK1cOC/OpUqgLmg/T0U5O2m1/Oq1w3VweQwGmRTeXMxlVYj0wZDzf2YpXlu0ccinQBx
         kpv+sA5M7NIX2mHGAfKHH8EvLJXzmMrznd1bMFoXxUQ1ODz7sWNCrWO+DI27RoOLFjkt
         2/+F+EWJdTtCtj7faCVHWN672AJE7j3AmVDK4Evd9v+sBqJ+r7fVfW0E1JcYGUeJLKzu
         AZyGbZ7frnfJxMzhFQNe4jVMv/ESW243cDEKHtsvLhxDE6K4219BlHWncHuaknJePMVp
         ZqrA==
X-Gm-Message-State: AOJu0YwHiS6G49svxwiK1beDbZkt5w1ZEvm5zmdCf72QKMpMT+Mcwio4
	mZTAT42SBuEpkSgfn3HGSM3U0y2nOgNZgHbf7FfW8kpVpYULLD0PJiU3hO8rxClb
X-Gm-Gg: AR+sD117WS+Cp31vqdAZuPFm4nWcQ+2ITRxCDlXUfrCrnjAA89NSHu4u/fnTLJm2acT
	HnIBME8UCsvOLJf0Ln+O3yPRdEG9IGDurKOMKILz9tOsVSqJ8+m2x3dUQjnMntaf1k79x64HI4o
	tVYEXLamD7gIyI5cQ6Wc9k4BiiBrg+g7tns4TZhFO8h90G8VcjK8oDSBUgYn2oxDc1UOVtoj0rh
	5N2/92bD0y7X+hnPgL+JL2Dcz6di3VrDUxSgtqIgIemqLP/XuQjTtXMN3znU1QsqVuizsLRmp2q
	D4Vlj3Ai1m6KGkwvLWcp2uEU5Uut+xWRDXLLKTJkRQr+4/c51K94rCxzG1kpFIYooVSZpkkw8GJ
	pogk7fbLF1upTpyIeSTf4AvQaW+AaRSkWJaRuECcGO19MuevNLCb5JcWZPVvNjEXvRfI0Ol36qv
	6WAtJPFnZtIA5Av8pDxB/niWEetQpfcuBjq4j0dxDMrcjRTLAt1ijn3uD04HVnJCN9pcSko1x50
	g==
X-Received: by 2002:a17:90b:57cc:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-395810e93a0mr4209370a91.14.1787117808143;
        Tue, 18 Aug 2026 22:36:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/25] cpuburn-arm: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:09 +1200
Message-ID: <20260819053629.391864-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129249

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version cpuburn-arm
INFO: Current version: 1.0
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
index feda6599a8..fc9c442c74 100644
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/ssvb/cpuburn-arm.git;branch=master;protocol=https \
            file://0003-burn.S-Remove-.func-.endfunc.patch \
            "
 
+UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile() {
 

