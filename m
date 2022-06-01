Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B62C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 12:26:45 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.6760.1654086402450778016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iudkRwDO;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso6060226pjl.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 05:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TFEk81y/O/dxo4DP88DNUresQYgiWwuvYQq5g+JqdBk=;
        b=iudkRwDOtF38YouZpxeik9WgLwvhBZ/KR+ts2S8qwwyiZ8mHuZRNRZ/WQFZ4VS3Hqs
         QBclKmHmQBajd075IitoUoGeaZqLdYqk2jrTyCrTxITSi7yyNvrzGwYusaCBrpehn2bt
         pSjHSyyLQzjqyBoNEC2NzIjNIfo4jC9lmptbocxaw7V7BSzlYbAr0xfenWvDhqxDksqj
         OhqzNeKwCZip8UL9RGP9wB16KtsqX7kLLaUskdhlvSh8uSSSUeAXUzZdLnzcXNAGOc5n
         vmapIrWy2KlPhFLonIl3SJUO+BTLWCQ9JTdsIdJpY0uXd9qszMv8SZu3V4cnJXDWKVeD
         xJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TFEk81y/O/dxo4DP88DNUresQYgiWwuvYQq5g+JqdBk=;
        b=5AUo+QCsHr81Ju32US6GhB/5YkmXwS/skqrZRURUfnMl+/LE4Luy12vgmnQoOi6x99
         MLMShO1W9JtPhlo0pAtqeLEwbp4yD9itFCrGognwj/z3nyfCyWzTwmZfUahpRQbaSiy/
         bl8JK/xvzOk0LDCZyFp4zxLsiSKFYRE4uNq4U8iy3kN/LHeWJO32GW3SGyIUK8UTDxKT
         PRH70v0MmcMtAlYIjOnqWISxXJaQYpMUF1MXLI0CuHTHktJSqOrEhSOwceyKGYAUD10W
         5VzKjlB/QkM9zCbKjfGG/9qjabYq2K6Y1Csvc8yGaYTG0YPVsK/92oZf7xTyZx8lcaZf
         i45g==
X-Gm-Message-State: AOAM532cloKQdfWpk7DgbcaYWWfrYN5ml6OYVbnMnBIgGUlk4vxQmRgb
	RpDOMkPvp/mAskbwVdB0u3w7gEmMtyR76w==
X-Google-Smtp-Source: 
 ABdhPJwsqBtJFIZsvdO3QYgo4E+0hofJVEjCxx91sg1e3DmWbBvfrLVzNiTRSlLLwaql8eIga0NrTw==
X-Received: by 2002:a17:902:e54e:b0:162:4b8b:f2be with SMTP id
 n14-20020a170902e54e00b001624b8bf2bemr40331686plf.5.1654086401669;
        Wed, 01 Jun 2022 05:26:41 -0700 (PDT)
Received: from localhost.localdomain ([103.85.9.215])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm1401006plm.191.2022.06.01.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:26:41 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	raj.khem@gmail.com,
	Leon Anavi <leon.anavi@konsulko.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-python][dunfell][PATCH 5/9] python3-pillow: Upgrade 8.2.0 ->
 8.3.1
Date: Wed,  1 Jun 2022 17:55:23 +0530
Message-Id: <20220601122527.19987-5-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
References: <20220601122527.19987-1-ranjitsinhrathod1991@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 12:26:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97363

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 8.3.1:

- Catch OSError when checking if fp is sys.stdout
- Handle removing orientation from alternate types of EXIF data
- Make Image.__array__ take optional dtype argument

Conflicts:
	meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
Conflicts due to extra parameter protocol=https in SRC_URI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit a5fc60071f0a0a16096792c4e1970d31f5964539)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.2.0.bb => python3-pillow_8.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
index 9a9a843b48..1e954fcfa1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
+SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
 
 inherit setuptools3
 
-- 
2.17.1


