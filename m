Return-Path: <dagmcr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33452C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 15:10:05 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web08.6822.1643469003580548453
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 07:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAc2eyVB;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: dagmcr@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id c7so12674925ljr.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 07:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tub+B10v3Z6zJ9ofo6s+m2jYoQFJWJyacQ3HY1YpkHs=;
        b=TAc2eyVBsSOnvrFJAHEuo8K2h7A2/A56x2oLkKNhTpFVdDglduTHo1IZLKAYLkVZ2A
         DVN4dFN+KQVpDHCoLo/oXS1YuhuEflbEeo6ggi3OxlFoFdTxvfDJ7TA0X5MlgZyXMa/5
         HcmsBSWKbXK9FDQNSc4q5Pm8C2CbfuEdohEPGcxkrkrO+kF5vYLpsir2i9bBvrf88c3p
         zWGWt47SgP5za3GUMP0EhIwfd2ka0CTA2EMyyko8dGMf8zerNvecuWlgrvjBOV10ulRL
         A2f5FSdgt2ZnjHdBGeaWw5UJLKEtVTk1z03UJEJLpqFy7ByY0JoU6UGVuGRnLF4UCib0
         LS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tub+B10v3Z6zJ9ofo6s+m2jYoQFJWJyacQ3HY1YpkHs=;
        b=oR9tblh8tci5keNIRTxmIVKsOF/9wcRkzpHe0aHEdSkUAitRNsUk2sjwvXBGTG/Zkl
         1jhs8MLw0Rl9BTyssxLn1XK/5hest+LHnsvFJjze9uderADG/hYROwRx7lE1QvJTEKDN
         K7t2MmYa0egJ6mEI4+b6SmPlGA68iEZ41LEZHZEia9R4MJqshsbsWtVz+Dh4kvlp1UbU
         LWVk3XwtBT0gJH6wBw/uUGQ77b36lM4sq5etgN8y//7PmVpxYs0C1XUdTbBKNbneLwMi
         TdKHGlf6VT02+7HqiitGXDtJwJZVSnXt/sW9AQeRUs4VkmuS6zA2lr8G/tyNi9lpZF5l
         w2Og==
X-Gm-Message-State: AOAM533KzdXsb4A0pqGCna3vbEoRzDwj1XINzBxWoHUf3ts0UMxOuCQg
	S2CHVLhbJcSLR4mAq7yeHul+vQCdvFM=
X-Google-Smtp-Source: 
 ABdhPJynTxuyfPRFISYV140J3yCuFtDsvJ8AFFKmKPyOZVzk/HxQd+nPX+8mbY+7yNP1vEmZ2VkWkw==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr8871327ljk.19.1643469001435;
        Sat, 29 Jan 2022 07:10:01 -0800 (PST)
Received: from localhost.localdomain (87-52-47-7-cable.dk.customer.tdc.net.
 [87.52.47.7])
        by smtp.gmail.com with ESMTPSA id
 p21sm904803lja.32.2022.01.29.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 07:10:01 -0800 (PST)
From: Daniel Gomez <dagmcr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Gomez <dagmcr@gmail.com>
Subject: [oe][PATCH] opencv: Update contrib 4.5.2 -> 4.5.5
Date: Sat, 29 Jan 2022 16:09:55 +0100
Message-Id: <20220129150955.325750-1-dagmcr@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 15:10:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95174

Patch [1] was dropped but contrib repo was not updated leading into the
glog link issues for the sfm module. Update opencv_contrib 4.5.2 ->
4.5.5.

Error:
/var/lib/yocto/builds/build_honister/tmp/work/bobcat-poky-linux/
qtec-screwcounter-camera/1.0+gitAUTOINC+7f76d8d874-r0/
recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/
x86_64-poky-linux/gcc/x86_64-poky-linux/11.2.0/ld:
/var/lib/yocto/builds/build_honister/tmp/work/bobcat-poky-linux/
qtec-screwcounter-camera/1.0+gitAUTOINC+7f76d8d874-r0/recipe-sysroot/
usr/lib/../lib/libopencv_sfm.so:
undefined reference to `google::LogMessageFatal::LogMessageFatal(char
const*, int)'

[1]:
meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LIBS.patch

Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index ca50e80b0..9627190bd 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
@@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
 SRCREV_opencv = "dad26339a975b49cfb6c7dbe4bd5276c9dcb36e2"
-SRCREV_contrib = "f5d7f6712d4ff229ba4f45cf79dfd11c557d56fd"
+SRCREV_contrib = "49e8f123ca08e76891856a1ecce491b62d08ba20"
 SRCREV_ipp = "a56b6ac6f030c312b2dce17430eef13aed9af274"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
-- 
2.34.1


