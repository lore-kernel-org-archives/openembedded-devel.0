Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47186C433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 18:24:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.19040.1653243859554359488
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 11:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LKfSKJNv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so7125801wme.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 May 2022 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i2oaNSeNq+C0STewKcSM9THfQKu1AG1Fwt99HZSBKfk=;
        b=LKfSKJNvNLq54r49oInsLMnYhhrM0nPeNCZEeHs1ChccsaslnHkmO5oPH41f0hafL7
         2QzXWnRtHtUHiIesZXyBj9F2hfj2rixZfs5Yt1axm1XfPPM23yFKt5yKui1IsYZYJfPC
         d3488EOWrlHEMCjmngrkR92SE/ughohYTWXm7swdc6sqShQF0EmW8GPnVQ3T5TulbpCN
         N8AU0xHK1/4MHWnaOrtt5X6ouYlKaQ1uqv2bJk5V0sSi6Y+Em1tcPePnvfQl1VVm0IBq
         kKHwmF+LGgQ2X+TaiZpDyrZIiuMtjU3MiwMmSCehd2VDNTd1fVMj50Lo5PC1cjQosftW
         r/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i2oaNSeNq+C0STewKcSM9THfQKu1AG1Fwt99HZSBKfk=;
        b=IC2t1208h5gyIhUDKRZQNuPWvVxmQqrhswaHgzgFb+qMEFRh/3Hf3BehkuLfP6V4RX
         yvnLCzdyHmOYL0r1dLs28rEuIES2LKGqkmNvSxjdaV5DBQeo4Xj5/WG/nVYfHe//naHk
         YoTKDIautgf2ZXQ548IxRvjCz5eSUMUX2em7LUWCHHjQ50xav1bIKAegGN7xDZzZAFd+
         9zKKs+M3tk5+7nnL7hFrwBhwBYdNRkPAourdikLKUbyJWEbymZVpz3Q/0sB2Miux5QpH
         EiJjfdlT6/lt+VbhLvHIW1kbq0FtwbPXNNDm9wDupzH9lZO1s9W12iOU5iwmHgsSt7pb
         TSFQ==
X-Gm-Message-State: AOAM5326cEtwGXd5fCwJOv/XxQYPeGdmyqpld9PlPBJzGaWlJBfkCDRE
	HuKFpmgpUvbwjOD7yIlFMvxjKdP9GeYdXA==
X-Google-Smtp-Source: 
 ABdhPJyup5YROfvqrBUUQ5AaOaqEVjZ4cTotJsggdbm4mHGyyDm/w6Eqmh/v9Na7jAGzlcLrrAoggQ==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr17640216wmq.139.1653243857632;
        Sun, 22 May 2022 11:24:17 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-242-149.002.205.pools.vodafone-ip.de. [2.205.242.149])
        by smtp.gmail.com with ESMTPSA id
 18-20020a05600c021200b003942a244f2bsm7053763wmi.4.2022.05.22.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 11:24:17 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH] packagegroup-meta-filesystems: fix build
 issue
Date: Sun, 22 May 2022 20:23:18 +0200
Message-Id: <20220522182318.2315676-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 May 2022 18:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97219

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

The packagegroup has to be arch dependent to address build failure:
ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (fuse to libfuse2)
ERROR: packagegroup-meta-filesystems-1.0-r0 do_package_write_rpm: An allarch packagegroup shouldn't depend on packages which are dynamically renamed (fuse-dev to libfuse-dev)

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 .../packageconfigs/packagegroup-meta-filesystems.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
index 75591c31f..1954b5979 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Meta-filesystem packagegroups"
 
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
 inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
-- 
2.25.1


