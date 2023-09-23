Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFE3CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 00:35:40 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.12409.1695429335252170507
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 17:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-34fdd6d2dabso9336105ab.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 17:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695429334; x=1696034134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0spNogILcAP2RJLdlmdLQD4mu/qdeUTUPLBai9hF9c=;
        b=FCptnVb2d2OcMa7h6x8XwlWTx7lgQdx6uOcHB8dj9RpzjYsiN7SeWE7wio+2wGEQ6B
         VmQQx1XNPKyR062aGms9RR47Mc4uJVaFp7KGx4HTOnwxQghjUDmpCzfSzZJpHZDuXJv1
         hgfHWVMunImQjojVHbFHSojWdvBB6rfmwFCQ51YWFamKhiadxR4U+G+iI27yOa9nfjQ3
         mSocyyEikt1pSZREKcbkRhmutOhP4HqYhkEKv45F6DSq2eK1sdTVhRobd9PcSfcAXAKc
         JuDOGhIHck5lAQ7qXG9C9mOTvFdOqAFTMLjvji5SBVa6pBPqjnQVSV5lZ0uZ32GfdOwu
         5Kyg==
X-Gm-Message-State: AOJu0YyxmodtwOzJO0DJsVxykn+ZsEF+cKKKTE6QKDMCcfDYjDWE1qlK
	GRJdYbTkk1qKWX8L6nkCpXa69A4K48A81g==
X-Google-Smtp-Source: AGHT+IFaIz7VlBUo9w1HnLprmMHc/p5mW8UAsB6TZJBPqpYZZkVpJ+5IIfkdMSCh0KgiotGOt/v4Iw==
X-Received: by 2002:a05:6e02:1d9c:b0:34f:6dbb:6a2a with SMTP id h28-20020a056e021d9c00b0034f6dbb6a2amr1474946ila.7.1695429333959;
        Fri, 22 Sep 2023 17:35:33 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id f4-20020a02a804000000b00418a5e0e93esm1342511jaj.162.2023.09.22.17.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 17:35:33 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-websocket-client: Update version 1.5.3 -> 1.6.3
Date: Sat, 23 Sep 2023 00:35:23 +0000
Message-Id: <20230923003523.3187802-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 00:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105085

Verified license remains the same and updated the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...cket-client_1.5.3.bb => python3-websocket-client_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.5.3.bb => python3-websocket-client_1.6.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.6.3.bb
index f7650f9bb..8104d3759 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.3.bb
@@ -5,9 +5,9 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6eae3bb7247ccb2c3a087ea8de759c01"
 
-SRC_URI[sha256sum] = "b96f3bce3e54e3486ebe6504bc22bd4c140392bd2eb71764db29be8f2639aa65"
+SRC_URI[sha256sum] = "3aad25d31284266bcfcfd1fd8a743f63282305a364b8d0948a43bd606acc652f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


