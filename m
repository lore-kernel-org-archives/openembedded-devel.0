Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0131CC48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 17:34:39 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.1350.1706895269124300769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 09:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c029beb8efso24154939f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 09:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706895268; x=1707500068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEAfm4QEkD71xX3vkkiUIIp6fY3qNh1sGsyQ4iTVBeI=;
        b=hoZijfTQu8EwBJ+WuQXQbIHFQVdvmC/wo/V43keP/12k96JZp/+bEvnPTd/qir3DiJ
         HKcfPhdhhAW5+JwSr80cvH2JiONK29M7jo+uKCWrMW1C6tNMPOwqvclUc0Z6sMQgDyfn
         bZcE6fngZeJLTzcqqa/edmyte+N14geQA4pmXxvCk7nv9czRXoBuQ6yzNicv7WRqBIAs
         gG9kJeUzhYAQUElvoY0B1TaIV+NdpPSjOUKbDnG5l/EzrOM7Ub2ng6RHimdZmmeIgJRK
         /CbOiJgKsxO1MAajt66ymrhCXbZoEMuURw2f0MG3DVgFtmpVGw4rEx6VwJHj1LygkUj1
         Ky/A==
X-Gm-Message-State: AOJu0YxbkVJr3KnL7Mn0LsGJ9lGWZx/b3t0fa48z/42EXU6zY8CDj22Z
	sg0GUigw5VFWyA+2WE1oTnFYndKJD9gMiZWTUAocN248gAUCqo54Ue7nLhKshxC2wQ==
X-Google-Smtp-Source: AGHT+IEK195+5zoiZXWkKrzyO98OqJPC+igQ/9zlSLaZEdu4p1vvJDBe0MS/OdcK/+WlHeJpKHus/w==
X-Received: by 2002:a5e:c114:0:b0:7be:ef35:94fe with SMTP id v20-20020a5ec114000000b007beef3594femr2426697iol.0.1706895267776;
        Fri, 02 Feb 2024 09:34:27 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id b12-20020a056602218c00b007bfe0a1286bsm580267iob.54.2024.02.02.09.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 09:34:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-grpcio: update to version 1.60.1
Date: Fri,  2 Feb 2024 17:34:15 +0000
Message-Id: <20240202173415.1473565-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 17:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108532

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-grpcio_1.60.0.bb => python3-grpcio_1.60.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.60.0.bb => python3-grpcio_1.60.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.60.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.60.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
index 77b4198e3..6bcb31656 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            "
-SRC_URI[sha256sum] = "2199165a1affb666aa24adf0c97436686d0a61bc5fc113c037701fb7c7fceb96"
+SRC_URI[sha256sum] = "dd1d3a8d1d2e50ad9b59e10aa7f07c7d1be2b367f3f2d33c5fade96ed5460962"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.34.1


