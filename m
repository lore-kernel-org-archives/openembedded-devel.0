Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3879C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 06:52:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.40530.1635749553198147898
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 23:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OE7nr+Ac;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so15383557pje.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 23:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VVEdsZboLjhMJII5wbIha/68JcmlZVCqzH5iSwisyOU=;
        b=OE7nr+AcwAOU+QWUox4pznRs6rJWlR/UjjFyLv8q77zPGaiVNMi5ZOBVH1RG6/LGLJ
         GYcTWuBj23BdNeZ7X/o6MqG8M/HYALharq5dRGTZn1CU9J0Gcil3mA72+JAAP4vJZ6QZ
         rnUx3gNTvxlxRuUXAEKVudY5xoDkknnOiP37pLC6PE0UQNR5Y5M+p9Ff0p+tKC9rqjuE
         mhw510Hdf2oBmPrn+xc5uU8wu87XY+HqWeI2Ri6PYPkHEkvcxEnEl9lqN2Q3mnRjthHi
         SJ/Qym0smTV3lrMEt2eI5JSi7av3F1C6eOuX3w8nh1WTZ2d9RRm7ZfHYeinF+1/ADgnk
         Jyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VVEdsZboLjhMJII5wbIha/68JcmlZVCqzH5iSwisyOU=;
        b=Na0MU7Jzu5ommIWUHqnGS96RRYVvX/+BQxmNGk+pYWbxYrS4yPD0n8yqRWG8UnHJnJ
         +YMEmFVSbGV/9kSzTqH8c8thFhnbZdmC4gU189l6XOARcg2jzOsH8RGeIFyGTFNmI7Xi
         2xfnTIKv1cC+XHxG4Iqu383OfK6bFxLtmo0Ri4ELjXj2Rv/NrW21FeEB/ewwNmyn9T/4
         CqtkCm77w+mfLBjihPpmhv2bbDoGk+eqM7cYmZVwLSbuoQMlWmXnMaHOxmDMR0om11HO
         d91xT1tlijhVRAjSJaMvk7C3D4vUzO4Mz2YIVj5qDvwUeC1lmK3b15tGQcrfnfgRVeQZ
         HHNw==
X-Gm-Message-State: AOAM530niX/QYKoC9XmjaqgZL1hYPNqST7aAIDqPvAiXfBnpnOYbhLgS
	n6HMxipKw9bFNKOxfPLR0Cjp9h3irNk=
X-Google-Smtp-Source: 
 ABdhPJwQ14efgkO6YhN1A54PUZJEFIwjHk6O4uWdj7Y8GoPbfZzWp1j3fY7WTUBreozzLara+doUzQ==
X-Received: by 2002:a17:902:f54f:b0:141:bca1:3c3c with SMTP id
 h15-20020a170902f54f00b00141bca13c3cmr13975322plf.76.1635749552297;
        Sun, 31 Oct 2021 23:52:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 l21sm14558506pfu.213.2021.10.31.23.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 23:52:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] protobuf: Upgrade to 3.19.1
Date: Sun, 31 Oct 2021 23:52:25 -0700
Message-Id: <20211101065228.1430262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 06:52:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93688

Release details [1]
[1] https://github.com/protocolbuffers/protobuf/releases/tag/v3.19.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../protobuf/{protobuf_3.19.0.bb => protobuf_3.19.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.19.0.bb => protobuf_3.19.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
index 94e8695af4..9b8c396045 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "17b30e96476be70b8773b2b807bab857fd3ceb39"
+SRCREV = "7c40b2df1fdf6f414c1c18c789715a9c948a0725"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x \
            file://run-ptest \
-- 
2.33.1


