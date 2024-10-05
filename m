Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1E9CF8873
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 06:54:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.7093.1728111250802116051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 23:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9keEFDq;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b01da232aso23006885ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728111250; x=1728716050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0Gl9Z5AzZGZCjRhA7A+9etieEaD1gNM2DUCHQjqykA=;
        b=D9keEFDqhgBlWnXhjZ0tTuBOJAJxckWqdQMMDvcEH6shcQfZzbAdR3BFVqwgN173Tj
         /X/Ak96zP1tgsUaFuZMAhZJ2ia/hXjMAbChltP3iWp3j6fRJ+f7q7ZooTVwQnITsNzAx
         /b72Eq4i5bLos+DsDazkRr8oSdHwx6kG+2L8spEqY5ajKKn3lXgYmybjtifBZwaeZ097
         UvYYp4egqza6CwXJ3Y3LCSAmVGQwvO7U9hmypKDiM24XSuThV3nq51YqEpG21VYFMrgE
         l5gQMpa3IuGC6w7uoNFr+7fZhoCnwtOpxPq8rP1I59xPNExibHGO7bin3DmLyiM9v+7Y
         G1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728111250; x=1728716050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0Gl9Z5AzZGZCjRhA7A+9etieEaD1gNM2DUCHQjqykA=;
        b=cZg1aR30sD5knyRlQY38vk63C7MGX6QwF4TS/gH6XuQ2BJWaQXaE2QwCzweHjYigtM
         u+PT0HeJxK5zZf4UpsoxVUlvy9KnD/1OwyQrldroI0VsGNnAxVpMuXN0c7ixVmOrwb98
         g4FfztaIq48jxFx+u/AVyy5J2tzbmnYCSYEeEl1h3AsLGgDK7jq8dl1N6JfRc8Gobu0L
         IR6MVgThbSrQ3T71zcyXoQD+INt41tkSjpL/nXtMNpHH84/5dLnRSpVwRoR3LM4HWRdy
         UDDjgFa93+CeLQYfYJz6gooDoxJhcRCLCawrVrFeFAR+AZWrrUtuHYLAUTkuxHhHn2Io
         LMnw==
X-Gm-Message-State: AOJu0YxEoSIEXBA0LQYCOcAU6LNKaheSIDuL5gRB2IrzJ6xwOo8GpsoL
	1QPMOrrzjOERCr1hL0JGSH2qmJSPNwJ8ElsvftL28kPO9jYas8piirNEfW75
X-Google-Smtp-Source: AGHT+IGjVepewc/mWWpcXNNy6QietFaX9guU4dO1aIW7HpIWx+N4hNZXTJi1shHA9wjPAYX+k5lxuw==
X-Received: by 2002:a17:903:1247:b0:205:5c06:39e6 with SMTP id d9443c01a7336-20be176ce3cmr136996565ad.0.1728111249891;
        Fri, 04 Oct 2024 23:54:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6d1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138afaa0sm8024325ad.4.2024.10.04.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 23:54:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] highway: Drop forcing gcc-only toolchain
Date: Fri,  4 Oct 2024 23:54:06 -0700
Message-ID: <20241005065406.3182738-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241005065406.3182738-1-raj.khem@gmail.com>
References: <20241005065406.3182738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Oct 2024 06:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112673

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/highway/highway_1.2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/highway/highway_1.2.0.bb b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
index d226cd82ce..e7dfc706bd 100644
--- a/meta-oe/recipes-extended/highway/highway_1.2.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
@@ -17,5 +17,3 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
 CXXFLAGS:append:arm = " -mfp16-format=ieee"
 # Option not supported with clang and its default format for __fp16 anyway with clang
 CXXFLAGS:remove:toolchain-clang = "-mfp16-format=ieee"
-
-TOOLCHAIN = "gcc"

