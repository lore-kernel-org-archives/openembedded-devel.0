Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.13608.1612652680017113417
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=IlPm9OPn;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id p21so16263967lfu.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkjcUIjGw+GH1LjsStqB7FBl1VXTGP0Yskb0UkoCAtc=;
        b=IlPm9OPnTxS5P3QnWCSy4EpRzQScSS1hDKcNc1lwe5y4Kv0Ztyu+c10Xh34PBdIre6
         4ylK/BAcOUqhzzuxlrieCkwQGv/8SI+MI3dn2p7bLq2rZU6E2Itnx5V0//YNEAi7yBnD
         KBuX+f6Y5XDa34bYRZ0Knu0RBayeaU5ZRciXi/eTAIbIU7YqdaimO1GOIAhKjq7TEr2C
         IRPa0+UvcPCqp4j1ec3eBD2RpNimhHnKHBwjF1imlE2tKQX87IkREa1xaOpp/nTNBi8S
         9NiYW+Q2IzD0OFPHISOUrB8tGYdiVReysMeRPvVhsMz2lLOwY2oFn3wqcLKP778PnyZG
         eMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkjcUIjGw+GH1LjsStqB7FBl1VXTGP0Yskb0UkoCAtc=;
        b=qNisPijr/ouefSKH/Fq7FoiZURdzg9nFUGhJCtC+Szv+C49MeRbV9pg79j0jTBSoc0
         3E5gHYu0bZKNyi1HdZi4LsMaQ1zVMCjCgUY4iOUzMOs9zn+udzt7prP5k4EY5u7VK76C
         b9xp8yc5llBpBQ9OIYZq63F2c4KkcKPISxvsAr3yAu24gR/y3rowmI0TVV1Li2Wy34CN
         3k9xfdnzc/gTHx3KKInA+bImT0IuTgvRh82YWKbJ0nFFCe4CKtCfXts9OMTF5yXP31Pd
         8l04b60XTRCvWW0Zo8ldOn4THbm5Ois8Tdupy81CCtB2KBUwOMsvw2r3Mih1epy+aiyf
         LcmA==
X-Gm-Message-State: AOAM533PEan7053jpYFzFjWzrMl78nysRULl816mqTgllXy2jaNWK2mb
	WcHB9vkXqZfrQ02/8PcjaiKFjoqQNAXv+nG5
X-Google-Smtp-Source: ABdhPJynYzxR9JMBZLWgEJyjroKRmU/Bac0TTHs3I+sW2TVHEk+n9l1LJnvI3Yl4VTuoqtBLggumcA==
X-Received: by 2002:a19:c7ca:: with SMTP id x193mr1125837lff.158.1612652678013;
        Sat, 06 Feb 2021 15:04:38 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id g17sm1499302lfb.30.2021.02.06.15.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:04:37 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-aws-iot-device-sdk-python: update to 1.4.9
Date: Sun,  7 Feb 2021 00:04:35 +0100
Message-Id: <20210206230435.4106978-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...hon_1.4.8.bb => python3-aws-iot-device-sdk-python_1.4.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.4.8.bb => python3-aws-iot-device-sdk-python_1.4.9.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
index f763067cf..5408c5aa8 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "\
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
 
-SRC_URI[md5sum] = "d05596f02774ea39517765c5dced874a"
-SRC_URI[sha256sum] = "bcd68cb7fdb044dbd5e5d3a02c311b25717c0376168e7c992982130f19c51b03"
+SRC_URI[sha256sum] = "84b440c5929f33da1cd204f3ad0ea891e208637dd63de9fb039ed7d49d78c303"
 
 inherit pypi setuptools3
 
-- 
2.25.1

