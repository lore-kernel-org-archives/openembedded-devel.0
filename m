Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF927C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 23:08:44 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.34692.1703113716290928200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 15:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b913830d8eso7216639f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703113715; x=1703718515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMAMm5NtWjYEu8gorJ4SEAoyzd+zYFLCBHhVxyBXjt8=;
        b=o2yJvhUDvjB6a1X8vKVvFDYMPmvKoY4wkSlaoGsWQvElT15qtFLw7dwcNll0+LnBbo
         w5ToW9lXeGV8U+QqhhDLak23pZXgmj/2U0XaDoqHYq5CtTNZohPh7F7OD2Tx4WUkHgjx
         SptzWszqb7qndXmkcUGvKe76qxpIKt9w07PB6kY2iK+8SrTLOvDUSKU1LVZMvH8REO2Q
         uKKXmotF4z1O4avsYWbhVCM23paeC7I9NFswlDM4BiyoOWEiYPbdCriYMS3CswavnGp4
         7FjnKHe/DZieZD177IOiF1qmp7IoA2K5yD4XXSuICKolaqTdp+++3l25YBwVaJXgVeL7
         Dkhw==
X-Gm-Message-State: AOJu0Yw8Y8QBVYr+QSSysHT6JS1uW2uMQHCsT98a2f/S7uLOy7qjbZyD
	turvQEr6Vh6urzQHEbW4d6kxA4heZXuFDw==
X-Google-Smtp-Source: AGHT+IG0E5jxT99i6mAhyhnXErd3m7oIJPFl1alYO3a9Gel6Sotrv1WTqhPE/Xtb1S/si2GqRwsI/Q==
X-Received: by 2002:a05:6602:4893:b0:7b4:28f8:3126 with SMTP id ee19-20020a056602489300b007b428f83126mr29475143iob.26.1703113714746;
        Wed, 20 Dec 2023 15:08:34 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id ez9-20020a056638614900b004693a30f295sm149608jab.170.2023.12.20.15.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:08:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-sentry-sdk: update to version 1.39.1
Date: Wed, 20 Dec 2023 23:08:28 +0000
Message-Id: <20231220230828.3834586-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 23:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107689

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-sentry-sdk_1.39.0.bb => python3-sentry-sdk_1.39.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.39.0.bb => python3-sentry-sdk_1.39.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.1.bb
index 81828737f..9f421328b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.39.1.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "67f62238af273eebd6432f85116dc6cd5422d4bc02df886514e8139e755f48e4"
+SRC_URI[sha256sum] = "320a55cdf9da9097a0bead239c35b7e61f53660ef9878861824fd6d9b2eaf3b5"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


