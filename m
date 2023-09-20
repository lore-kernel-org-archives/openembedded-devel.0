Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03B3C04FF0
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 19:17:59 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.4902.1695237479630352682
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 12:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59c0281d72dso2513337b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 12:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695237478; x=1695842278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NryyAQ1T4vww9H6L5xyjosnft75YwEn3QM9ONlQ0820=;
        b=iN3SPM7OhtBerhDlb3qQP/WVSNXcGc5gyFzOyfsfVURouyngoSnG6nqtS85brgc+0B
         7CAc4vf/DCRUJgDsnvLnaowxJbrS6IRPIaak9IocOXf/7+KyYRnETNXoBW6TQD2DZ1id
         iowUa6TzUsL2HJUyp0vwKqREXYbV+LuV4Q3d0mYjgPltZOnuUU6h1VKC201FW/aF8DTw
         +60p7guHc10UgbWUAj44a4GYEBsDqug0bSZpqt9F5iLXxRHIuUO5imHgQl6EyBOCJwoE
         2fQH+Z9aFCKj32UsTo2g7nUWkP1FBMafIo3wGhzB635JFnz6jS7gHy9+/Bogi0jNgv6z
         XH/g==
X-Gm-Message-State: AOJu0YzB11NJH3jUmT+0N6RhQ1KMWbnL1f7bWQHe/Ks4BObLgkhx8dMV
	4LWr6EfonBq6qE/A4MVlY7PU8CtFC3kovQ==
X-Google-Smtp-Source: AGHT+IGwzlivSeDnTANL2fId86iEwMdPmLZ5T7TiloLPRKZpcOL+ccZ06G24xsPwIpkhGVqyNu4LPA==
X-Received: by 2002:a25:b910:0:b0:d78:26a0:ab8b with SMTP id x16-20020a25b910000000b00d7826a0ab8bmr3279277ybj.55.1695237478126;
        Wed, 20 Sep 2023 12:17:58 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id 72-20020a25054b000000b00d7802512079sm3532042ybf.38.2023.09.20.12.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 12:17:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-dynamic-dispatch: Correct the upstream regex check for version upgrades
Date: Wed, 20 Sep 2023 19:17:46 +0000
Message-Id: <20230920191746.1344506-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 19:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105027

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index 9e4a13cff..eeb013d4f 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -5,11 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "6bd3cc24427de753eed0656e89d5302c"
 SRC_URI[sha256sum] = "fbc676aaedc8ec542056c21e5e206b8b62b8d11c3f3c5cfb32b273936da89604"
 
 PYPI_PACKAGE = "dynamic_dispatch"
 
+UPSTREAM_CHECK_URI = "https://pypi.org/project/dynamic-dispatch/"
+UPSTREAM_CHECK_REGEX = "/dynamic-dispatch/(?P<pver>(\d+[\.\-_]*)+)"
+
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
   python3-typeguard \
-- 
2.34.1


