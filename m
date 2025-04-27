Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECA4C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:39:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.23365.1745743070128050324
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 01:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N4ho++Kq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so2336035f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745743068; x=1746347868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8U6MqOmPCeMaTeqNvXDpHoyedotNxeprHwUkMTsJzs=;
        b=N4ho++KqD+6LAv32cRIAKWSzm9yrM+XWoEgbI9SH53Nw+JHqJLwW69OWCrKLixWXWW
         F9nCZoGY9VBzerhC6tGu7DyBvudOOTy59tCqleCavYS0CqrO/P9mcgPGf5PfgYYJkKAp
         T1Mmch+MAxSOibdJ4Qu9iBKgW8kBjUqLkUaUeyR2SIil9eDQcTllZg5UbAYoKnvV+qXz
         8FPV/JEHHy66sCy4PrpxASaSQuZOzNceUz5EqBgId5JWIlVNBBimtUiBXLq9g65gDyqi
         CyVAr7Ms/qnBUsUq0lyF6SaCgnL9Yi/3CquVu2fRl80D0ORAm+caRAu+/CPug0n04jEa
         jwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745743068; x=1746347868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8U6MqOmPCeMaTeqNvXDpHoyedotNxeprHwUkMTsJzs=;
        b=uchFnA4msEdNWDsfDh9p4hWIvb9GWe8JHzSBST4hDCdilder6RogU9XvcBsiBJySfA
         TFmb7h8D3SCMHvqHHtWd2edxOfOAhiO9piItlQdTXw7oOoVKH+WqTj/7fsINeQlS21bq
         hg3Po4OJk983nNKKmefJfWQdU7ARAd3oEF03sTBdYszqFYYcm/zaYVEVCGI+pagig2zX
         y+agt7l8VDWEJ+C3gv9w7+r5t970R3sabBKr6cRAs3wyfbL1V6MnnO79LGzeLeJCPgjE
         7dxKgt8UVgqj1VRr7u+87Otw2uswK0c4J4J1tehbNbxpcnk6YRC2UsRKfAlcLtHTXhjr
         MnwA==
X-Gm-Message-State: AOJu0YzBYw6TQmHt2EyrTMHkJFG04w4WIErYn4PnkD/eATLw5Yrf1aBB
	PxUkvgQcNRicY20dtgD1iWPRvYoA4PH7eHjKJOgWNb3iy0z/pP2Cru6g/z+D
X-Gm-Gg: ASbGnctME7LGqPmpMlZe+iqf6ZFouuc6tJYWshRPFU08z1/jTIFF9k/YOwN1fU0IRxc
	FBb0KkP8fSbyuTIBNrZ+X/YqJaQodhH/0DTKao+yU7cNBzxIW0SP1jX+phbFzEBtEz3a/v8cNno
	LNX0Vb3A8LYOdW48mMMBwtYjzISAlvxSfPUuyvYl61w3UWJNZI7JeT0faSuZu+BIHOvmGMm4Hu2
	ryYiJifRgTaNIXJlHSlGRII8PrKpfMa0t9AJOpcg1zHi/lu/RFKiURc359va50dlZbXMzR2heAR
	ITD+Bp1IGCKxKi0tMslwqztBV1h+cqtW5w6dG3P8BXT9BRCE/pwfmm3cSsCDvpMh0Q==
X-Google-Smtp-Source: AGHT+IGCM5GsUGxGCBTKcw3jCBV+ZNcJsXhAChUF786wp3Uh07nMzOgLznibC/5s7+FqOja5/YUTKA==
X-Received: by 2002:adf:fc12:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-3a07aa700femr3362978f8f.33.1745743067993;
        Sun, 27 Apr 2025 01:37:47 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca99sm7733014f8f.20.2025.04.27.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:37:47 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][styhead][PATCH 1/2] python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
Date: Sun, 27 Apr 2025 08:37:35 +0000
Message-ID: <20250427083736.4010-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117162

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-default-cc-from-environment-variable.patch
removed since it's not available in 1.2.0

License-Update: Reorg and rename files; add pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...{python3-posix-ipc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.1.1.bb => python3-posix-ipc_1.2.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index a71187399b..cf9e494b20 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "POSIX IPC primitives (semaphores, shared memory and message queue
 HOMEPAGE = "http://semanchuk.com/philip/posix_ipc/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=513d94a7390d4d72f3475e2d45c739b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1a4f3bd729df04bf68f66ef877e9c7c9"
 
 PYPI_PACKAGE = "posix_ipc"
 
-SRC_URI[sha256sum] = "e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7"
+SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
 inherit setuptools3 pypi
-- 
2.43.0


