Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA48CC6B19
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 20:25:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7560.1791923152006427048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 13:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j7EKUn7x;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3071657a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 13:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923151; x=1792527951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oepr5rvGsFOP/ucaUJ6BleehzODGj89mYx1dg03XcFE=;
        b=j7EKUn7xpxz1L64VbHac+c37cVtE3ggue+MVYnRUeQ9D1N4l4wyuuNzCxwmHIwGebM
         dfk9O8Nh1bHW5UMRnRKoypU6k8mU+X0cOxNa6iD73hrawNiTFdhBL71FwYS4k/xPwFFA
         93Oomo0LOJEsJRZg8X8yZmFwCpNZwx61KiT8AeQ/2kCeno8h9ZPDFpBgpzcRsFzg2VTB
         XQ0YUby6gOZLipL9zRhFWoMw8UEDJWwPvqrhM2ex2wVuvh2eICO9zbIeE+MFHcvuPmsx
         dQhb4chpxogQRIWjIsnX9uID6Lug4oM6DureryO/uDxaMKnZne3YCXbZwrdaB6IK8Bp5
         VVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923151; x=1792527951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oepr5rvGsFOP/ucaUJ6BleehzODGj89mYx1dg03XcFE=;
        b=BMo2XyWfjwvfszOQKSl8hdGA9Js+F7aRSs0WRdiqmTbJ4ma6RhEbu43tf3H5Oxf5Li
         XEq2te34mi2lFjdR4N9E1M5EbF75DzjoB8QhwJyE7L7fYAahukk6xAfVJRyU+LidZC0M
         rxCHp0aZ+HTStxBTMF3fJmBQGkK1b+T2ODuwTapYnDKMmi9uumCTslU5WVIZomODeqkn
         E5sI/2YjnbcxNPvQdV4JdxNQIZ00gP4PLVF5k5ZydKShuK3WQqZWd9qQ8xIFkOoBiYZk
         gfeW/TxsHD5U4/AZu9ANTeGNcHmnO0zp0SYRm5POdT9L5mHeKocSkmV6nCuKTJ6MkaI4
         Gzug==
X-Gm-Message-State: AFq9FYJZIQ4k8uhuQuZLJLtOAtXqNR+rlMX/IkjvVAqgfv+pbAbDOkPL
	Ru1Tn7hM7cKtvT/UUtdzkFiAbFl7jaFdPe27FKZE9ll+UsQp3dFbMOJX+kSrjA==
X-Gm-Gg: AYBFou0zUsGccDRIiYoaoCVAfx4FbR9dD+hE47fgNpW8uox/tvFqsMy/62pw7Vme0AD
	d017cHJAElKHRfvRVHST+bCa4vKV7aX5c0stryCSs3oVrB19bYxINt7gfzqenAIELclDgwNsRYq
	+LHXckYT6XaqTuuOvxQNSIJmowYTLWU1PHUrIRexzRTI85nCbakHIOneT/cqlKlwoV2MzTCLt8W
	B71WGo9cG0h4AHY+Ums1aTO4LUexm3uRkp4ivAPk4znInOQDxfHnyHUw5sLOwhsG+Q4k/ExJDmP
	+b+Ny9p81AIkZSoQgftUPBWLWqSoBGyQTaE3CmXKHoNBA7hsG/cvAA4PFkGSrLQFoy0bcGfaMUA
	I7otbdgEjluHZPtA8VkEiXVKxYl+MgbS9soKRaWJYGL9rFZyqjSCnQlmMZb5g7mz7VGEki+7KXl
	fUTwsT/EGWcbHJMo9bsznHzdiGpJg6IobMNt00ZMGl88uAZL7JvpYxYAnPFb8tvcopHYiDN2SH3
	VaBc0YrFIuwu3DJLG85dc58RTRbdoHtyTrcBY7pSc3C+X4jpw==
X-Received: by 2002:a17:90b:1a8a:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3ab3a9529c8mr7762942a91.7.1791923151244;
        Tue, 13 Oct 2026 13:25:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f1fb257sm1171787a91.0.2026.10.13.13.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:25:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 1/1] lvgl-demo-fb: fix SRCREV
Date: Wed, 14 Oct 2026 09:25:43 +1300
Message-ID: <20261013202543.215725-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 20:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130865

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

