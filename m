Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA9DC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:17 +0000 (UTC)
Received: from mail-pj2-f17.google.com (mail-pj2-f17.google.com [74.125.227.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46642.1790553854515754463
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KUTxgPGm;
 spf=pass (domain: gmail.com, ip: 74.125.227.145, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f17.google.com with SMTP id d9443c01a7336-2db1ca06a25so10347775ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553854; x=1791158654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXQ3aOJfhSmXuixXvCmpv2R2mnvu8zQk/fvPLVp7xM=;
        b=KUTxgPGm5aywsCUw5q77uAy0kX1hPYYbsLbw0umhM4YbLItERS8QVxTbQr46cDf/mV
         9vOIllERwBvF8HfYSEyN0bMJHPGzHx0R1iwQK1ET3OAamRvz1IjRrsOiBMesF8xHFTHW
         8yIL7f6KpATyoQUbBSjZT5T6F2n1Wc7T+bpwYfKTLz8LcDJIo321eQdHxz6o0UxTlGzu
         35nCILk0/h8PjKqix8ZP5fFBRBsXIcfrnl60XnFYYPJWbiQOVwBiZw1YKQc5FV8BrpTU
         tYMNlgqMHvsa42WdOvrphPkjenssUZgd9HtLzpwHQMoBHQDb2sLxWtiZqD9eYg8Ei9A2
         2nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553854; x=1791158654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcXQ3aOJfhSmXuixXvCmpv2R2mnvu8zQk/fvPLVp7xM=;
        b=OZL0jWTokp30cDJ3U7Ct7hH5a5POSFspuZ6JDgyhMjabyoyc8Io0dA7ujado1JMG50
         hz2Hz61HCQj4ZDSvQlqWyoPoS9f5ITxutRzxLKXXYq3by1dUWqIy2I1BwBN890HcWj5G
         echAJ0AWG3W9SCgsRaeURzGz5mpV2vwDsl5dq4NkDkeIPlDeBu1jg8xjtwvLd1JYOAif
         c2vqQOvQhfbE1EYKTumhwzeitaXazOq7AuyClWIsNO2GNnoT/wmOFqBr2JA2rpH6HCvY
         xbLLLCUR2LtgVnNqS6LlKAI2Frk84I69moVeqCJhnIw/0wf0AuyaRUevxkakFpM+3pzK
         2ROw==
X-Gm-Message-State: AFq9FYIc3BmXZSJGI7I9nbBV3InrGbjbzdOzoDHhhI2SyXlIy3DU4Qxi
	DOKBFDSShmzpT4w/a25t23U5SImKVVl3B1H5ElXYoMwMBOsoHmfbfu07xkkdBQ==
X-Gm-Gg: AYBFou3l4tITd+w++ogf5V+JX9+t6G/Hae9IFEGhbuCeR65jVvcCycz865YGhqEGiRY
	rVE4b+4sTxEnDYY0XROYEqG64+JDYiPyYfzdQdPS5yJ2ZS/LagRc3P8BX+XRAUavuOK7c19CW4P
	/IZ5o6hBBlAQ6K0M1T0B2HpUE1t4uooULLXSi2Cb145ZQiD2lrexYJAgg1fiM+XJiqElOs0/yo2
	p9ANGUfswF/Uq6VP6wkTD/Xt3YDNxYvNYAn3u42hH3Hw4NpQmy2P1Yf3OqJyI2RGdfGRyJN8+b2
	aZ92Tngo4L7FmrgRtaNe4UIPnW+XGAxzisGEQ9XU5KuHsuia8QIdMCuzMfqiibXtWQFXWqeno9C
	uKkegKVn/wlwGOuQPSpx/2jd+J01VpBz7U51d62f/m61ELHbRIqS4RZVeJhOlWRKdXgVcJ0gWy5
	PvMP3DzD//qnhv603f6Zq2LTv1sdNOWrIiA92tsOGfzPKGk5dDkBlZXS9Vjn/UxZf6kknwPQCa2
	ZC48g4wFBIfXOmFqE0BA6Q=
X-Received: by 2002:a17:90b:39af:b0:3a0:bbbc:6853 with SMTP id 98e67ed59e1d1-3a0bbbc6e22mr6904515a91.51.1790553853853;
        Sun, 27 Sep 2026 17:04:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:04:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 30/30] python3-socketio: upgrade 5.16.4 -> 5.17.0
Date: Mon, 28 Sep 2026 13:03:02 +1300
Message-ID: <20260928000302.2528437-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130417

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/miguelgrinberg/python-socketio/blob/v5.17.0/CHANGES.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-socketio_5.16.4.bb => python3-socketio_5.17.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.16.4.bb => python3-socketio_5.17.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb b/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
index 8eddcc5b65..1c635b5109 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.16.4.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.17.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python_socketio"
 
-SRC_URI[sha256sum] = "f7fa4a43cc8e687930b5c6e44d6e2efc2071eca4bef49b8bb3dc0827f7f92235"
+SRC_URI[sha256sum] = "c3bbfc4937dcfea7c4d1b182afa94d4a30335d153987e8f2078b344beacf95a0"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"

