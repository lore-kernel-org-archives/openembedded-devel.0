Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88A0C4708E
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 05:13:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.29596.1672636389562349223
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Jan 2023 21:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=krTok2Yu;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d3so28559563plr.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Jan 2023 21:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMigpNEljwi8ct1C3U0MJ8UOZSbMaA/NOnEbwtLnW2s=;
        b=krTok2YuBkPlXrRNmqYcI2rSqU+JPCkFZJnHJf44QUPfi9WRb1tmx8LWhbEBaU3Wmb
         t6HZyJF7OTKqQI9qHRmiaT0ule5Q4xxJzCklNond23ubYrjIU+uZprwbtmhl173TCIqf
         RanPc5rXggHU/Skm7+SUBC3DTUvZheqm4+QsbNkmvUjnVWSBd9Xw//38LLXyg68zSxwr
         FTnmj7Og0MxGgMVwR5LrWDOQpxXk3jZGqiidETsrWVVudpuxxdLmbwgOs08fLPLYlfn9
         sSOPrgr3mXanefdDmb3G7vR/53PMAR8VTEtGvCZPvAGmMqm0fTaEZQ1ChwL4akHrrhYV
         vbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMigpNEljwi8ct1C3U0MJ8UOZSbMaA/NOnEbwtLnW2s=;
        b=55NDs++KVn3SvSGB7TyT82lChNxt6HxpcGjngghGTfn5t9eNgKkk7P6D0e2mS6i4S6
         ekWkyH0htgoZhBnCamwKJY1Fdo8SDKm18jN04SeLl9yl7m8Rc963//swPJOkSWtiGx3Z
         5plyCpayPtVuIyENJPlZR+YpjV0YYcGqVXvc2YoX+jsd87H3WR8KDx5GRWgyjv2o8ndq
         akPhvqpNLarCVI2+aMakkVt23GXrG73m3K1Sn7Ijq4kjPeDJYHOvRLKWHir7A2SdkF/d
         kQrBsdyHsJw3xNYv9m58glH1DsQwlDoSIdfXz1nTRuIm3l1gLU17JA1Oy+ILh1YX46dr
         Un5g==
X-Gm-Message-State: AFqh2ko+B36JA58A3QnL5F631ODs1A5VJfm9TLnUpwYiHRL88qK5gEI8
	jE6pDAzZ6BLsph9UULPmkvpfMVY0frU=
X-Google-Smtp-Source: AMrXdXvFHSYNZyesQy7eXWbD5KLLI44u/9Vahr1h08DiEW/WeCvGErgUmxCVFOpC5ubH9eqy1bqeyg==
X-Received: by 2002:a05:6a20:e616:b0:a6:7529:7c99 with SMTP id my22-20020a056a20e61600b000a675297c99mr46189226pzb.5.1672636388613;
        Sun, 01 Jan 2023 21:13:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c16-20020a170903235000b0016d773aae60sm18994659plh.19.2023.01.01.21.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 21:13:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] libcamera: Diable 64bit time_t on glibc targets
Date: Sun,  1 Jan 2023 21:13:04 -0800
Message-Id: <20230102051305.836940-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 05:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100337

it overrides some of LFS64 functions in peculiar ways that it has to
undefine _FILE_OFFSET_BITS to silence the funtion definitions from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/libcamera/libcamera_0.0.1.bb          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
index 2b77d99371..483fe1507e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
@@ -64,3 +64,8 @@ do_recalculate_ipa_signatures_package() {
 
 FILES:${PN} += " ${libdir}/v4l2-compat.so"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
+
+# libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
+# both 32 and 64 bit file APIs.
+GLIBC_64BIT_TIME_FLAGS = ""
+
-- 
2.39.0


