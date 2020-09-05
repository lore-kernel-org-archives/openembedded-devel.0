Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.15474.1599300103037968012
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 03:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t5xXDsvw;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id o21so8982745wmc.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/X/qsEkbrObkwcw4c+yIyt4jflQbVSbtp+PsgZ3htJo=;
        b=t5xXDsvwyqnn19Dv/tNUJTZzxVsQBRMSGf6bFGuLbWXUBRFQ+C+YcOBKLAE4/6mvCF
         Kaf2sHgiaup70547No8VJXm4D13zCCypPeNHX6tLdaDxBBc6qfsu/gktMdDa1n4xIgGJ
         TEN4Tjo3O2bFnZ62veoCv25KOpxNqdQAa5zqwp3z5nqMdUS7ppZ7LZcSXgL8fXbf0elv
         n8eC+CQw5xTB/4b72l0JPz+0NQdjaemiWHG+zZcN4MAdDvd/sj3CWmIyfnXCZJIaJPNC
         GoC1EAGuBXdjVmbk/f3kxo73NfxyS71qRd3JgDmJJdUUw60RpaEp9WGUSSJ1d1EH7/DY
         /HpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/X/qsEkbrObkwcw4c+yIyt4jflQbVSbtp+PsgZ3htJo=;
        b=ZOMkPYLJMSWKT6hE3hvWV5e3+8LFI4jl+9T0lP/rRiw/iwGqk8paXcN78jxIF5aaIC
         uY0cSTO+g30MhVSj6g+s1aLUcJYAe4Bn+HxA9rGQT2KD3PY+NpCgu2ezODLImN+nN4Th
         z6PmhO2NXHO8Iqu/8b0UggKvpK/IOlnMPn4iH6cGWTQcIObG+F5pRnaN2+VnrNyp7hJR
         k2MTEmmCfNfsfFgCVqJLpqhUwmMx1EORClId1ktli5hgxakPtBfw/6xto2qFm0dg2AyB
         Pb8akF0t22n69VTMT2FUIj3odE9LgRhJwOQgYuV3wamRYH0hn2RYOe3kGnZH7QBZVGOp
         zgsA==
X-Gm-Message-State: AOAM530dY0NiaGoYUvs78xG38T6Kf+tj04YvkTh/Oc4bWR3BxWg8BD/v
	WRniJhPqBtgmUI7t388ZMoMXThubEov2Tg==
X-Google-Smtp-Source: ABdhPJwLuDUAModYBEQMQsAqRFQeP/+xOvhcmFDYBo7LN/Wl9RL0Wkjzoe3PC86EwHCvWE963eq01Q==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr11548910wmh.39.1599300101004;
        Sat, 05 Sep 2020 03:01:41 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain (mob-2-43-66-181.net.vodafone.it. [2.43.66.181])
        by smtp.gmail.com with ESMTPSA id u17sm16011820wmm.4.2020.09.05.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 03:01:40 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] brotli: set upstream-status for the patch backported from upstream
Date: Sat,  5 Sep 2020 12:01:36 +0200
Message-Id: <20200905100136.24144-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/brotli/brotli/838.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-oe/recipes-extended/brotli/brotli/838.patch
index 8ecf2e4c9..98b888760 100644
--- a/meta-oe/recipes-extended/brotli/brotli/838.patch
+++ b/meta-oe/recipes-extended/brotli/brotli/838.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Backport [https://github.com/google/brotli/pull/838]
 From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 2001
 From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
 Date: Wed, 2 Sep 2020 10:49:49 +0200
-- 
2.17.1

