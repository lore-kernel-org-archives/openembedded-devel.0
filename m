Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90678C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 08:16:00 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.8873.1652256959329231214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 01:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=u6+DDYrX;
 spf=pass (domain: baylibre.com, ip: 209.85.221.67,
 mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f67.google.com with SMTP id s15so512550wrb.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQNkOSfu/76gRPGDfoLxxYT4PBDRWfv5jTRY6m+3yOc=;
        b=u6+DDYrX5qNH+hBbJi08ZYE5cZ0KtOgEO8a8uyzNOsH+XM2cMVjxwHmCuBI+QZ9TdK
         Tibyzitda7zHTPUEhbiYBxlYMlKdpyvN6MiqM4wvrwmDtr/pEAhsnfPlJam43JNhXgAV
         5ynOGjoDR9zAh4MHH28NQzABfZp/rf8dnVL18gErYHDD3MWjcFE8N5FxgQ509wySg/Fs
         BWC3ylZYPF87ha2oh1OyNkDS2DV2yW3U1/cUyCD8qrEERdxgLRLZIRnod90id34afV+s
         u0WNXZh+SJilqHTsdc4bb4/w9O/k0flhUFBZato8vkSODdaK/u2Ne3/6w13v8OfRe1oH
         Y46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQNkOSfu/76gRPGDfoLxxYT4PBDRWfv5jTRY6m+3yOc=;
        b=DESrN2VeFJWGpdgJlYCW6ilx0cAR6NmJIJE7BgR0n4+N4tBAn/khO5TXoIWkaP+0AM
         N4UIdVZdcBo8Dkp3MpBBWqAoFIIS3vtJteSCJ5Reo0CEqc6Xooeh+R3mXjwa4dmCI9+C
         1ut5Rdr/k1Y0vAKXmbLGf78UhsksTIMbNaYKJTxHpSM298uNGoS0/xPTOaaKTHVLhqYb
         t1E7HRUTkTlwu733ZCCs/IMDUQRPAW0GlGhByalwplPflgVypWqQGXCbZ6D3StBTR0G9
         OqnXd/un6yEWmR+6jEH7IUTu9XYuqYbYfaTLM1TFP7XhlTqiduDqoQLFZBvxNs+lWDyz
         s1lg==
X-Gm-Message-State: AOAM531iWXT+cg4jWOCKjWGCvEU637YHaMLUTpd3VTSgcEHbWRo0J1jE
	XIuNumHnqsk9bW1nzwq2ST+9f6bM3k/dk995
X-Google-Smtp-Source: 
 ABdhPJz+TQnKYSg4V2/rZFDeQHpLeb/kELZCDdwRnqI1M4hTha/C+DfcNMjjcAmlIaBU/nzdAUFRfA==
X-Received: by 2002:a5d:6c65:0:b0:20c:5230:f145 with SMTP id
 r5-20020a5d6c65000000b0020c5230f145mr21057027wrz.337.1652256957608;
        Wed, 11 May 2022 01:15:57 -0700 (PDT)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
        by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b003942a244eebsm1356453wmb.48.2022.05.11.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 01:15:57 -0700 (PDT)
From: Julien STEPHAN <jstephan@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Julien STEPHAN <jstephan@baylibre.com>
Subject: [meta-multimedia][kirkstone][PATCH] libcamera: fix packaging
Date: Wed, 11 May 2022 10:14:09 +0200
Message-Id: <20220511081409.3437145-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 08:16:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97034

libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev although
they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
This trigger the following error when trying to run the `cam` utility
(packaged inside ${PN}):

$ cam -l
cam: error while loading shared libraries: libcamera.so.0: cannot open shared object file: No such file or directory

$ read-elf -d /usr/bin/cam
Dynamic section at offset 0x2c740 contains 37 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libcamera.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libcamera-base.so.0]
[...]

So package libcamera is broken and need to be installed along with
libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and
libcamera-base.so.0 into ${PN}

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 713626069..0b9f3f7a5 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
 
 FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES:${PN}-dev += " ${libdir}/libcamera.so"
-FILES:${PN}-dev += " ${libdir}/libcamera.so.0"
+FILES:${PN} += " ${libdir}/libcamera.so.0"
 FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
 FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
-FILES:${PN}-dev += " ${libdir}/libcamera-base.so.0"
+FILES:${PN} += " ${libdir}/libcamera-base.so.0"
 FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
 FILES:${PN} += " ${libdir}/v4l2-compat.so"
 FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
-- 
2.35.2


