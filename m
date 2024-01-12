Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A73C47422
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 20:13:45 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.4300.1705090415788008270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 12:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3606de7f4bdso29416615ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705090414; x=1705695214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hryDfaolfFbUFFoleV8xUWavJ2umitjtsPjk5xcxMyc=;
        b=wi4Gn5vICZhO7p/NZ+aOcFQ5C4qyLNcRsHAoa25aa4iEH2epURhM3UqqNI7+SFU+6L
         O7T/Dt03XWG+QUQOBoJjGv6v3tekrhT3sMeoZEtO++C5xBp9GnjhsB0ya554Wb9vos90
         EcvL2jGfktwsS19CEYwAaNSq2d5o/dKYCMwa/6FghZLGMiiZJ9vRDjm5tOCg2R6anS9j
         s4oCoAIq5xEYeGD3A8K59EHkpLirCarQEumNxz3taxFj5dsu6nRSM89HL88oW4K6Kqgi
         MKp+ptBbM0lCRiaj/7g089Acc3tWw+KSZ/kH7OTgMmqtRtJKS2XG3WxuaK6feiS6Ypvg
         aixA==
X-Gm-Message-State: AOJu0Yzebpb3z8ggsy+y1Qv+8a3pLAvo2ZZoqkWjLQltfymXwE3+9MtW
	tt7X9BXvRZ9+3H0OL3Z3KtAWpQ6Zttz6VA==
X-Google-Smtp-Source: AGHT+IE7XAbek8JRdt2OFzBKpAD8od1r7Qp7OBbKL70BjBZtzHIK9Iae7tEXIN3OZQcxlvrg6daeKA==
X-Received: by 2002:a92:cd8e:0:b0:360:884e:a56a with SMTP id r14-20020a92cd8e000000b00360884ea56amr2052563ilb.57.1705090414663;
        Fri, 12 Jan 2024 12:13:34 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f5-20020a056e0212a500b0036090442bd8sm1133023ilr.47.2024.01.12.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 12:13:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-engineio: update to version 4.8.2
Date: Fri, 12 Jan 2024 20:13:22 +0000
Message-Id: <20240112201322.3026849-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 20:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108253

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-engineio_4.8.1.bb => python3-engineio_4.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.8.1.bb => python3-engineio_4.8.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.8.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.8.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.8.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.8.2.bb
index f88a3acf1..9dad138ea 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.8.2.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "fadc39c66348f96476d8dc2d7aaee7ea0a39d96e333217f5321300677b980121"
+SRC_URI[sha256sum] = "f8609e3afdda318fdc336b4ba2de8dd397bb8f9b8a1b43e56c27330e32c2e34c"
-- 
2.34.1


