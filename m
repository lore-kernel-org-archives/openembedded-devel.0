Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02224C001DE
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.15561.1689967533229025584
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=SzJTaMzk;
 spf=pass (domain: baylibre.com, ip: 209.85.217.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-443746c638eso899619137.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967532; x=1690572332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9afd2xa5nIHk6o3P6RrOlHCpvG44of5nM6btdvaCCA=;
        b=SzJTaMzknS3OeTtHxFDS5HVGXNdGH2Y5m1X0h2eNfawaOhEWfjNqn/FqRR0fy9qbo9
         DVZpTibjQcLNbCBaHdjQVp9lIoioSpynHG9ZBxhxC5nbNpGmaXVtsOYIuPSFkJ4ujy6t
         Wio4eZm2GJe+1zEVt9T7eYYYgeIFCTGgF5Z7SW5Xuo4/sMYBs2Iiedu5Cu698vEt7TB0
         F+zphKgDEHRDBmIMWPZImKNFWz3+/Th2m0RhxjC1ViBIQ6VKFGZy1p739GCXs6ajoZLa
         +Y1eoxPJTf4NZgYHymvFzD61m05eha9/H2ecp5xbIJNtxRjOSHSo4g28JKL6Z3G3PqfD
         aVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967532; x=1690572332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9afd2xa5nIHk6o3P6RrOlHCpvG44of5nM6btdvaCCA=;
        b=CtAyq4QExMbWSF0XrdVDRLNFoLu3LnlzpgNKcFjpAD0nLc542WEgz1COVX3k6de9/x
         EgpRy/lRqutedBPR4Y0NoSkORT5prNjI5MEmLNiWmQoAUJNEFcuWpMvMZluvGfMxBK+6
         a43ORb5nF3P8+dTm/DnyDWLlLLS1ix2nzNOWZDMjbw/UJA+LQH9fHxsrE40/ZxmtOoqK
         2dhuLsSXKxdvBebgzvkj8IHVLhRyEm7W1ykg+XNiYLEhSfzVZWzCHT26paV8LRwP21Mm
         Iga6UAfQF760gx5epLRTbHlBA1PJ1NomoiwRVRgerhiY+VvKCHivhMR/vuzzqbedaF6Q
         O4IA==
X-Gm-Message-State: ABy/qLZcM/eoy4PJRQ3k+5E1c5L15q4TK0+SKsBcXPckVENbFP9dnH0i
	PKPYTWlB7VFfUnwNBQ7nG+wVKAXsf2g7ijja3T0=
X-Google-Smtp-Source: APBJJlGlSDIzdIrVRHp+NAztzimmXCOUPMtIPtrK2yMiflfs3sPbV20d8xRHRNHeYSG9L1EZtExxxA==
X-Received: by 2002:a67:f959:0:b0:443:5b37:a5a5 with SMTP id u25-20020a67f959000000b004435b37a5a5mr704072vsq.34.1689967531766;
        Fri, 21 Jul 2023 12:25:31 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/9] python3-awesomeversion: upgrade 22.9.0 -> 23.5.0
Date: Fri, 21 Jul 2023 15:25:22 -0400
Message-ID: <20230721192530.2515633-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103974

The project has stopped using setuptools in favor of poetry, so inherit
python_poetry_core instead.

Changelog (https://github.com/ludeeus/awesomeversion/releases/tag/23.5.0):

- Add CI for Python 3.11 by @ludeeus in #191
- Add demo page by @ludeeus in #195
- Add better styles to demo by @ludeeus in #197
- Remove setuptools from dev-dependencies by @ludeeus in #202
- Update demo with compare by @ludeeus in #219
- Add Python 3.12 to CI by @ludeeus in #222
- Add in_range helper method by @ludeeus in #224
- Restructure README contents by @ludeeus in #225

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...someversion_22.9.0.bb => python3-awesomeversion_23.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-awesomeversion_22.9.0.bb => python3-awesomeversion_23.5.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-awesomeversion_22.9.0.bb b/meta-python/recipes-devtools/python/python3-awesomeversion_23.5.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-awesomeversion_22.9.0.bb
rename to meta-python/recipes-devtools/python/python3-awesomeversion_23.5.0.bb
index 20ed1890db..bcd959cb27 100644
--- a/meta-python/recipes-devtools/python/python3-awesomeversion_22.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-awesomeversion_23.5.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.md;md5=92622b5a8e216099be741d78328bae5d"
 
-SRC_URI[sha256sum] = "2f4190d333e81e10b2a4e156150ddb3596f5f11da67e9d51ba39057aa7a17f7e"
+SRC_URI[sha256sum] = "a505558316010d2d10d487226f79c1157204af00fa462fdcf948e347011dd491"
 
 RDEPENDS:${PN} += "python3-profile python3-logging"
 
-inherit pypi setuptools3
+inherit pypi python_poetry_core
-- 
2.41.0


