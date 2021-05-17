Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.19532.1621261515385562658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WmdVpSLQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id s4so1669439plg.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bx7XqPHK/tqwRKdcbqLvpiAXg0kv8HWld4essnZOw/M=;
        b=WmdVpSLQn9qRdOI3ekiysWA6P7Iobrt6bTsZx6Qx/2pwKM3fyERR62bX3djjCjCwoe
         ywpV+VHudaNEhaGwi2IzxG+TCDUvL0GYesYBC69Gege2Dx/9TJ0z2cFbCeA31F/24BYy
         7FHo0Hs0UiAOuIpBL4XEl6W6tINbZlPTQx8sjWHE0hTJwljPBDQ6xA5AWalZq2QjHSmc
         sZCtEVXTcb6bc+B0ABTrW2Wv20qY+40cOKLZDL9g0TbEzCQSVLnLQ9CZV+pGd0QDU1UE
         py4484raoUva/X1+jIy7+bUNdR9n+SdbkTXA3fuDvQiasnc3zAQO4mYbNAgunCk5c4WD
         3UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bx7XqPHK/tqwRKdcbqLvpiAXg0kv8HWld4essnZOw/M=;
        b=H8ytU/urLgYc5d6qzFsrvcKoa9ZPncSVXfXzFIFAwsHR+WBxWKD/nVtj7wCjd8W9hN
         MjMmCrPq11UKxMqK6BuZQprMqTmT5EMZ0XGRUMjYBSz9L7e7BfyLRJf0U9DnGLjTtQi8
         y87tDHUE6dYYNzxxmUmr1covvctJESm6ZFUpLDfY0qtq2MHzcY4CCjBbOTiOsBvsTITr
         Po6d/cX5yCGxcYfrs1cSFIrFX4ZMvvRIgBcOJUjVFxQilahMJ8GB6f7UiobdubPYJ6xD
         yuluXzGUHSo8EwFvhe3zHDQ5SyQwCeoSyBN9OTb/DvH5zgFGS/iDCLxukmjiRFfR76OR
         MDMA==
X-Gm-Message-State: AOAM5334iD/dNIeznjqBof1w5uOHzXaqtplcGDwkwrcVmCxKOLeJ9m4M
	YwnSXGNwyCfgp3KRAbSgmKlLcwnBFvY=
X-Google-Smtp-Source: ABdhPJyx/3bnXnVfstkAH8E3e8t1zYRpEzpVeKZgAXD/GTgc7fOzYQvzE17CuadUB8rzTdnbm+TxIw==
X-Received: by 2002:a17:902:f24c:b029:f0:f29b:8cd4 with SMTP id j12-20020a170902f24cb02900f0f29b8cd4mr74936plc.80.1621261514823;
        Mon, 17 May 2021 07:25:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:14 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/11] wireshark: upgrade 3.4.4 -> 3.4.5
Date: Mon, 17 May 2021 07:25:01 -0700
Message-Id: <480e25bb08d7835a48458d4b4c3b24cbd5b741e0.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 37d8352d0d9c20e41f5b4085adf39fc615f412e5)
[Bug fix update only &  CVE-2021-22207]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
index b75f41835b..f440328027 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29"
+SRC_URI[sha256sum] = "de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333"
 
 PE = "1"
 
-- 
2.17.1

