Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A87CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:51 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32875.1792043145530408329
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=seWkyide;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e95bd1c14cso3278925ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043145; x=1792647945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oepr5rvGsFOP/ucaUJ6BleehzODGj89mYx1dg03XcFE=;
        b=seWkyide3/SI43UPHzxiR+OPAwuIIq9DW1JsiEiPEJKChPXNr6T/paQo95nKgJl6Jt
         inY6x+mhLh912TdipsIzNJx+Y49o4+QiTR3cURlrK2rpIK2CvmX2/ybBYQMzkgIEOHOo
         eDyBD0CaFb9kajf9FBXTFk5GdmWYfv7J1TeTYx9cjsywwCzHGlRCBSvRTMEituoezurZ
         HOJawxTFC1OLKSt+QpK3cl3I6/olBk13AwEKKxCkHG4OsN3qFf3L5M+uuvBsZFKzFjmV
         HzJbxvrlj6VhEvQYiSN87KDZ84xSkDDpwIk2xM6e7RMB+gGPqGpbngeVXoD+0g/wEqe7
         e4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043145; x=1792647945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oepr5rvGsFOP/ucaUJ6BleehzODGj89mYx1dg03XcFE=;
        b=qtVFmHrjjRDJ3kZSB2pIsWJCnDIQ9ti27dcy1EayhBoyKjzR2NoQGXa7Nco4mGBsRz
         kWbooiXRtCnFQQVElZejVoGwPSsU22ogjFeWKpocHs9XNwk8ZVeamYqb4J9ss/KeMB/e
         rUoKynpdj/olgUD/FIEW3Yq7F9N87hHQsKKEssadWfsPqno/mz9Mc1DQYnvDHNKZU+4V
         qGeI08EiEIHfqesbo4TlW/SSzRZ99LHR/ILQr7p5loAZlpWnkTD+Dxp3AFwghbgAIuqe
         B9A0Fvi6GpL4OQiWUED73z/0ffSysgBHg3BOILvKL20yjFLGw1/+1FleWd5wEvtDaVcb
         FJQg==
X-Gm-Message-State: AFq9FYLWMIuwZ/zN64FMqAexezn6PGInC4PmAtwOcMFjMmznz6jnpXIX
	YtXY9CcBfUGPEKytEMon3UyB31iBzHmKc5isjtsdrgdkdu3ejMiYwctZbluKMQ==
X-Gm-Gg: AYBFou26Wa3y0ys0GncbzZ1VtIeYVJJLWO0E4hJFl0OXwjI+TbXxdO6Vri3EvArTQcV
	qfH3b0V1F3BmuzMnYz2qHs+oPisasjjMud1k+Q2XIO9ftuFxOWLYW7iPQ5xj36b1pzATT2NcJLY
	au6vNyOHL6AIvzZHOreDPvdCMi0WqdMycnxy7nKxSBtVTDs95KOT0Z4hdQUSUHb2qZPQjT/Rnrj
	5TF01MzDnOW4Om3dvjFRKZRqatKrgsJB7DJgnJcTypXGFjI7x5RbJz0dYXWanzck/IezGVWreY2
	F86bDfA9++Eei0qr/pZFACv3XNevvPET3CANUFq4sp9dQZ2Cu0dxd3C1LqIjJnK7I7Wa/VBaeOJ
	bEJ+EMsg8rh5vbxh7uO/ncsFD3el6fGNw9FMKdYYiY150xzgdZkVoVOX4SDCajxZlUbj/NvbK7R
	6oFnH2OHoRqLEJPkWJZfJPFuGfUicuRixtl/66gjn3ZriIQnapLomsoElFTkx4oe9ZcxbjAFR2U
	KwqvRBfGljZDUdXQVE+wZk=
X-Received: by 2002:a17:903:46c8:b0:2df:9a7e:d41f with SMTP id d9443c01a7336-2e842e14a25mr159383355ad.41.1792043144823;
        Wed, 14 Oct 2026 22:45:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 82/82] lvgl-demo-fb: fix SRCREV
Date: Thu, 15 Oct 2026 18:42:10 +1300
Message-ID: <a9d69bc066bf9498397db27902c287dd666fdfd4.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131002

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Previous SRCREV does not belong to any branch on this repository and build
fails with error:

ERROR: lvgl-demo-fb-9.5.0+git-r0 do_fetch: Fetcher failure: Unable to find revision 045137cf0fa1781483cb796261a11b5eb21e99d9 in branch release/v9.5 even from upstream
ERROR: lvgl-demo-fb-9.5.0+git-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=https;branch=release/v9.5;name=demo')

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
index cd6441ded7..dc96b999f3 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "\
     git://github.com/lvgl/lvgl;protocol=https;branch=release/v9.5;tag=v9.5.0;name=lvgl;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
 "
 
-SRCREV_demo = "045137cf0fa1781483cb796261a11b5eb21e99d9"
+SRCREV_demo = "b0aeee00922fdd8f2c5e3409ce464a8f714cf919"
 SRCREV_lvgl = "85aa60d18b3d5e5588d7b247abf90198f07c8a63"
 SRCREV_FORMAT = "demo_lvgl"
 # The version check runs against the first SRC_URI (the demo repo), whose tags

