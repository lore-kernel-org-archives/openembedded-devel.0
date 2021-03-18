Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.5638.1616050136631431721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 23:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JybjC+m+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id g10so797497plt.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Mar 2021 23:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L3UP51mlFDMvxWFepLe9fQ9xTs1hwsghrxEfaOnP6tM=;
        b=JybjC+m+EF7U2vgE7fPRk/s2w9+UTS27ORzPdK3zmfF8j2Be6e7kNqL7DVhIV/RRHe
         djeaKXx6VDGkMy/D5MgYoh1XcVejgk7ZKidAiPDhC+9+ilfADLVlB3h28og1GIMLjM9J
         +fjO2DqVTjdkZqx5iIUC5QGhJwDWDVe+Uw58m5UZJeUETzjCgSn8Uboxy9rWNoGPjQZ7
         1STV+WJGWph9Oj5nSsGoqOBexWm+MfBQ3oZKay79cT9+eCRHsuXO6/n/vD1qpLKMxkv+
         A+T3CK8fGzA3KArptQ/XaRWEaKLi8hK6gv1bHvZX6250rA74Kbvw31ar4tk8i+CF7GgJ
         57BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L3UP51mlFDMvxWFepLe9fQ9xTs1hwsghrxEfaOnP6tM=;
        b=rJ01neuJI9Fh9g3i8e9dJxJec8/m2UG1FfnGxzFyez9DMDUvqLFA3yWzrhX2PsmhBN
         +Aec1I2FfIKXgg0x38+XMKVMGHRXNCH/nOjECtdV2A1pgjsz0XBYkH8GRi3FQBktj4/F
         VTg4uuq9/QJV2mcYRGBwpQf8VQcGzusxsbm0cnNstz/Q+3LkF6MBrjLomqC0Txp8OC17
         r4qb1bLE2Cj5LMID0G/HZ8ivWaAjU1adQQgTUjOnemzH+X4myfXavfixSX3RdR86LFi2
         8bMhLQ7FTP/YVvcSONEafDLMQl1aQCsgSN8we1AOElrzrCBFztFKYoVctSwlDGn/zFmA
         +Yxw==
X-Gm-Message-State: AOAM5322/CbDZz6TNOaVTIhCBIeOtqVHPERxvZA/VHGlq3Y5ndMdVGMS
	+HBOJrXF471w8CF+7A15SC0/WLx1MAPb+g==
X-Google-Smtp-Source: ABdhPJyEdHOLAWtMXtlDcur156O1yi7BwVJNH5WYXM5l4V31bhCHxFbvwJ4VashxHVp8Bf/GCPQ3NQ==
X-Received: by 2002:a17:90a:987:: with SMTP id 7mr2785531pjo.61.1616050135509;
        Wed, 17 Mar 2021 23:48:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id 76sm1135867pfw.156.2021.03.17.23.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 23:48:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-spidev: Remove recipe for 3.2
Date: Wed, 17 Mar 2021 23:48:51 -0700
Message-Id: <20210318064853.1268-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

3.5 is already there

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-spidev_3.2.bb                 | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-spidev_3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
deleted file mode 100644
index 65679594d3..0000000000
--- a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python bindings for Linux SPI access through spidev"
-DESCRIPTION = "This project contains a python module for interfacing with SPI\
-devices from user space via the spidev linux kernel driver.\
-This is a modified version of the code originally found\
-[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
-All code is GPLv2 licensed unless explicitly stated otherwise."
-HOMEPAGE = "http://github.com/doceme/py-spidev"
-SECTION = "devel/python"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60"
-SRCNAME = "spidev"
-
-SRC_URI[md5sum] = "f601676f1bb48b9aa3b3897f95216365"
-SRC_URI[sha256sum] = "09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456"
-
-inherit pypi setuptools3
-- 
2.31.0

