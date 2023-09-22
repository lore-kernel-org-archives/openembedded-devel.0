Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397D0CE7A81
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 22:20:28 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.10067.1695421222093593886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 15:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-79faf4210b2so2783739f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 15:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695421221; x=1696026021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dr56zdTIhPKdIu6jOe7aAzDKP4Zfews2gHQUby++B5w=;
        b=Q6FNXXb0CCa4hsv56eFyjCmqqWHOKhg1fNygLcxrV5c/xB73KW1mDDXeTZ0xEBPKok
         hh3ucg1DLPVj5Z0W23nIh5G3GyPnc1COIEHzdnbSz/Alz4WeyIq7cZfA1aLFtBk5I/um
         /q6jL9gYG0qiUa1pG7WMQScpPkgbCJ3MPyJC44ycAEkKiJvZ1qw7dLmXkcU+qYsioU6H
         uErdabzOcBEqp5/C8dZudhUrvI/NtWU6GiZS+thqY1ldFG8y7wabLZdH88ou9n2hNwF/
         cgOYS/C3AqGHzqXiiZbkhSjX99hl3Mw6kq/w+roZ36Kv1izT7mbJC0qSFbyBG9FIuPWs
         s2BA==
X-Gm-Message-State: AOJu0YxygkS5uI0aWP13PMBFPm4L0GrDn10cmkHYcnl7lkWsDxpJgAXi
	G0GYUerN9YPijOl++jXHOsL8752Nwl5gIQ==
X-Google-Smtp-Source: AGHT+IFdEutZDXq/1MqsP7sYXqMdUL6eaS394O7pORlN6Lb+v4GWFkFKl3OqpdWmqBR/alnJEDu/yA==
X-Received: by 2002:a05:6602:22d1:b0:792:6963:df30 with SMTP id e17-20020a05660222d100b007926963df30mr657410ioe.0.1695421220891;
        Fri, 22 Sep 2023 15:20:20 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id y6-20020a02a386000000b0043a20ad93c8sm1288372jak.41.2023.09.22.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 15:20:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-langtable: Update version 0.0.63 -> 0.0.64
Date: Fri, 22 Sep 2023 22:20:11 +0000
Message-Id: <20230922222011.3159305-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 22:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105078

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{python3-langtable_0.0.63.bb => python3-langtable_0.0.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.63.bb => python3-langtable_0.0.64.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.63.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.63.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
index ca68a6cc7..8fb8c6e88 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.63.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "ff2b5a1db27900cb83e06bcbd14cb0bbd5caaf304c913308246608d8e93d684f"
+SRC_URI[sha256sum] = "1297b7f6e33160887fe08a88176aa0ea873b810a55f2a2740257b124184b067a"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


