Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1F2C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:00 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.829.1787117816225109611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CCE0U5qj;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so655278a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117815; x=1787722615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJo6oJHQq5NPN/fjdFWlLmIo7tqBViHPldvB5U8gDyM=;
        b=CCE0U5qjOgwS8yTfttjP/xJvbPvjnlD+9AoqCk6RkoYgEJ1IUvWsfDFqCIAePE/39/
         J/tiN/kioUlwBwcsKhFeEnf0PX/CK3fkhZIYtqeNYYuq/j8KpaxOo88H+zCKhG/TtsMO
         fPVXZfPLTeX8ATEh1zXhAY3+6b6mC6KtwozE632G0H5x16VhCi+W+/kwGC90voN6smmb
         NVOom6OdMQVMLeerEDFO+Bajd1L7ZPyad8hEXn/Q2DvGXoWHlPG3I6OXDHd6s4Y+oDfx
         qIvDciRXFKOrCzEKskbX4l53bGPRa3PY/FzIhXdAOwIsI/FnZOChjkWo+Q+EKy4LsSad
         RuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117815; x=1787722615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJo6oJHQq5NPN/fjdFWlLmIo7tqBViHPldvB5U8gDyM=;
        b=tG1vuZlGD0i9ZNu28Tbc9dbXQvqy/OIwXeygAEsIGoBWQInIvrBSvVAlT8oRFysgHZ
         +KKU0LxDk7q7V+01lgPa5SWqvSWdsBR8AtIXWrPUHYj4WzfD2nkEIdpHuXGVbBZxmDS+
         PXL7OVrj5lK3AMQ9UBPJzSU4YAk7dFsXd2c8+iA2SdB+8OXIekQTs/wWuKM2CXGSkBEC
         /i3jwbn+coxoYacyLhnBarjMGpB3v0PMCdQt0TsIffnGrh6FWguxu7dCoHaMdDDX+DDo
         TITgkIrZFJ8o7UxNYeLkLa/kuCJfRhvVWk1pxwZ4dVE0BTqxStBdODdpOpxaoi12dd/W
         xZTw==
X-Gm-Message-State: AOJu0Yxd1oDZ+2iPRLAlKRoEpVfEZOqJ1t18SUV4Mxn/DrmQmca69IPr
	XKGSW6xZnolkw07azQJmhMH3LLkkb+H9jTVL1ZHWl+9uQSbxWQaNjCdD1T+CzMhd
X-Gm-Gg: AR+sD10V8LqjaGIU4oqjekH3SERgoVvR4q84mfXCkH8/pkPKN25ys00hFFQavyK0pdI
	2Pj6Ho5L/ex59mcmhl+Th9itH2Z5/xQ2zpUA/FMwN995X15X4E2TE9fPpkKThgWg1A9WS0EuvfJ
	CyrwENsRBElIH9kTr07nFszwWWptodmGa7EQ7awr3JeZr3X+iUwlk0lAZWX6IAcPCKcMCAf1xns
	hFcyjIHyOPqq2VN9AbRiDx14qEmx9vV6w1+1ibtCOmAlQwUcx2Z3CG4J0EYBfNKNUxz5BJa0UcB
	kvCJ5ME1TzHrK7SUgyDYjrGVAbZewKHEWYUfqrXDosbp1y/FIhB5MbxCc0fOFP7U1KPt4+vLMA+
	MGb85tKWlG6oD1NgLHsA+G37pbA7Q5AOnYc48SFuVpPDm+SZM1W32u9XmnYsdlElCIJJbnz8oYW
	WhRj8jO1J0+1YCQWnmZbDyDBqJlxPOwVkqPGMo2P0nuOaL9gTjTl44hut5rJ6SGQWcal+t1G9lj
	g==
X-Received: by 2002:a17:90a:d2d0:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-395813f7597mr4058122a91.10.1787117815534;
        Tue, 18 Aug 2026 22:36:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/25] hackbench: add UPSTREAM_CHECK_COMMITS
Date: Wed, 19 Aug 2026 17:36:12 +1200
Message-ID: <20260819053629.391864-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129252

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version hackbench
...
INFO: Current version: git
INFO: Latest version: 2.10
INFO: Latest version's commit: 40b14a2aac9449dfb07d4f9b4bd873fc3ea62f28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-benchmark/hackbench/hackbench_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb b/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb
index 109e816cce..71ef486aff 100644
--- a/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb
+++ b/meta-oe/recipes-benchmark/hackbench/hackbench_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;protocol=https;branch=main"
 SRCREV = "d232f528fd131b7d840e79a3756d1dbdaa9b1b60"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 DEPENDS = "numactl"
 
 # Filter out unsupported compiler flags

