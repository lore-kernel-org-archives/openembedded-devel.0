Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4733EC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 19:20:05 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.968.1705087195243243790
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 11:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7beda2e6794so153368939f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 11:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705087193; x=1705691993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hryDfaolfFbUFFoleV8xUWavJ2umitjtsPjk5xcxMyc=;
        b=To6Hxt7RdntHYFFl/xSPb2mJ/1/6FdA/sq52PZegH0bhQhNMiYAJs6944deoxnFvbh
         Un47jOM/Wk48JbzdQ+Rt1wYfAZjRsO18MIwvKZAbsBhv2JfYkA8RAs9VWUSoqpRG4Xnk
         VCI1lYbMEgOtgn+d8H0P2yGaw2H5lNlJFzYO8we52PC/eVYHzIiU6Ozle9YnwPZ4cQwX
         vqDfPzeNEv+BooWCJZ6UkmRmOrt6PHsH2seugI2s5iKbSmB5cNckRXgVy1JMHDELPJ1X
         5sKM5g6MAOKnD39/24KfA/VCRVcdqQxXO0vfyVr1aCiJYi7BB6OKeXrp74ffo2pHbVMv
         kLrQ==
X-Gm-Message-State: AOJu0Yxw/7c3s/hTfUNt7XLcnSawQ9mMyahQe2AMlfIbX9iDbYKZf+o5
	0RSjihGGh1Y9YHs2thD+ktZw1mxum2DSpg==
X-Google-Smtp-Source: AGHT+IEIwykt2q9Np6Q+Jmv9pD4N1YOshVuY/OSzeLubOuCKzTavQBMzsLRrwp8JnywvO71OBMRkSg==
X-Received: by 2002:a05:6602:142:b0:7bf:827:9c61 with SMTP id v2-20020a056602014200b007bf08279c61mr1421593iot.9.1705087193634;
        Fri, 12 Jan 2024 11:19:53 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d69-20020a6bcd48000000b007baf1948186sm1010466iog.42.2024.01.12.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 11:19:53 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-4.8.2: update to version 4.8.2
Date: Fri, 12 Jan 2024 19:19:44 +0000
Message-Id: <20240112191944.3025922-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 19:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108251

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


