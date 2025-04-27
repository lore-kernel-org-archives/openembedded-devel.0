Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1CBC369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:39:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.23367.1745743071319661049
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMHvNj1J;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso16490805e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745743069; x=1746347869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkzKc520fh+QG0cypVDvCQz6E22fC43Dj9IwZrjnQTc=;
        b=hMHvNj1Jh3Bacm+dFmjoZz8uF60E0Y1iElsKRrXB2+srDj0RztUItnPhKhiI8TxXcc
         MWxWV+BXHaknMnumrx1VkuhpjD0DYJF8BCMHE5g55MpjAQoLc0jf0QOZ1TwmysOsX9oN
         vFgFYARemq7Igl12Vc4aOK7D1FflvZ2bOviVxJdeFzdj5myOCN/Z0bsVvyWciika7rG8
         1WNe+RuHsiQ7vqvU4Tnqpz//jvFUN+8YiU0DkitlDFbZYLmtUlcgk2QEJp0MsVHEYoH/
         Mp/fvDcZLHpPrMlrI1up+bjhSDHgy5PJ+aCcofel9fOuuJz4+yK7fRrPW5Pmsr9ZjXG5
         uXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745743069; x=1746347869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkzKc520fh+QG0cypVDvCQz6E22fC43Dj9IwZrjnQTc=;
        b=iXi+d8/0L+xYcWeLzlnMaMW1e2PMGk0i6v6iIRF6UUgvo3358VX2PLOFiQ7R3uY21W
         AYby3xWM4Qj9dEQx/7hw1BUEyCXzRvtyqiz++Ln9dJ5Vz4aOiDjeW7/0bdy0n1o2PRJP
         wjGai6ImYtiG4mi9btxtU/5/fN8ftwxF9Q5B/f6PoG9Q044qhXrHPV763/2qUOJe4Qdz
         SXYUZJnsUJbK1O4SW55guNr7S+z6Hzul6sgx0z+cCSYMJ1X3mTOUwCN405wTm/AG6sYe
         Px5c1IXJ2MVSDMpX9k4VrWKU99XcqjexMXNVdacwHwK/uqfMyhPtqJZtWxNNhbp3oXTm
         XGQQ==
X-Gm-Message-State: AOJu0Yw7DSUsVjFrRb+4Ydv7emA34SpCKHU4KCvJARwbQfWHW79Jwop4
	+vK6380k55rNCM0PPmV5oU+k0XGNkTg2baTkgO81w8VBydGZGMrTYupv3bIG
X-Gm-Gg: ASbGnctsqmCnRrVKavfBorz5BgPauSACvbzbtaW9g0doLcREh8M3Hlbe3yA29ahCrxq
	IOc/nmiiyJ9BPybU5UoJFgnrdSu7d/iSf6FsXaddMRaAkOov7VEBzFili+dl9bPJNda+V5Zf7MR
	ZJTXavlYqwSQXj1cIrCQoCqlrmjxs0UMtrLDw9wA6ozQ3Z4QzkS2yeIHnnZ8n9OZAh52XRK5X32
	nKS1dLXa8KaoQhmiWNSQ3Uzs58+7sQ6qxLxDQjfHB7r6qOKk+r29ocuGLLaM98HeeDZwlu5Vf/q
	bXukUzNLXch2BtW8U6RGGi8jK8MTRdgbHyXMKZ+Juhi6wjLlVVVmcVadO1frG+I7bQ==
X-Google-Smtp-Source: AGHT+IEPcbPu+RBV0bYC9hECrx8SAereBN9ZNmHruFAVAMsHx9wDIJbpbmbhESCE17MzRopJU3DUkA==
X-Received: by 2002:a05:6000:1844:b0:39f:b62:8cb2 with SMTP id ffacd0b85a97d-3a07ab85d56mr3707544f8f.38.1745743069252;
        Sun, 27 Apr 2025 01:37:49 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm7733014f8f.20.2025.04.27.01.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:37:48 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][styhead][PATCH 2/2] python3-posix-ipc: switch to PEP-517 build backend
Date: Sun, 27 Apr 2025 08:37:36 +0000
Message-ID: <20250427083736.4010-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427083736.4010-1-gudni.m.g@gmail.com>
References: <20250427083736.4010-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117163

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index cf9e494b20..e314bb8e3b 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -8,4 +8,4 @@ PYPI_PACKAGE = "posix_ipc"
 
 SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
-- 
2.43.0


