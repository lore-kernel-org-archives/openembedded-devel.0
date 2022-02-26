Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B1FC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 05:08:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.3486.1645852133779428273
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 21:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BLJdoC5S;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id o26so5824545pgb.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 21:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGnq5CBxkgHCuP+HGAJwk7dyAZiYdfnS23EazknNz3A=;
        b=BLJdoC5SH8aakbyutXX95qekwXRMaIzGzqBS+3uM1sURu6ZioW58/f5u4tDytaXnTI
         4Ckpjk1cq1ZV2lvqLh9064+mobQmm6sMmyusR/yb1jMBLDz6S5baqsQ/maWybCmyl3Dt
         FAf/vzc6ID1+JkVywWos5gMOLiZpS4r6PH/imLfUdzPxgc12kOlXPcq7My7JRGcLgw04
         CL4yjqni8uEonH12r3WXngryCSgfadGVH/39G4R7HV5m0hg6uAr5E2Ej3Yc6kSW6nGWm
         e3mWzHOU0JaDLaRYUh2gDj8dDOIoknLWfSLtNJPa8Nnpqbjzz99fD+VJuwTHNPwuf2la
         P/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGnq5CBxkgHCuP+HGAJwk7dyAZiYdfnS23EazknNz3A=;
        b=sx5j2jKJzBWCp4YViJpYPRygbuo98qUAGneeprnhu/bOXd7XzIVixn97Jpe0cRvX5N
         K+Dj/qGV3iB8tuLorbj4VbD7KJzafOYm0wE+8Dtm9LU0ByUxkbFmtbqeQaYqrPWby/mh
         JmCeYAOg79acCsmdkkAD12m/SnoanCpt02VHuYKNsLzO5XUpGsxx9U/zJ8e3z6IA4vqf
         1HLWo/r8DWzq/jR6+WzIixG1JvGwROyEXUOZwlxRNko03hVbJ7bxBQwRui2H7NQVPPUg
         Yr71Nn8brXAyf4vaE84/+EeuDnjMehf77HrwFohGbBm7/055ET+9finONsaHIrFI8cGv
         Bg4A==
X-Gm-Message-State: AOAM533HDL8HQi6NPBxgQI26IH2879eo4OLt/PLDbHXV2IqIeMjD11+d
	q3Dc6kC5WV1zpk15/kijFD6fHvyaHkM=
X-Google-Smtp-Source: 
 ABdhPJx3P32hLQAaglqI2XutInTG1hNPC52S1vaUL0LE7AAlhOQKjnLOjYO+t4aMwrPsAebyVSOA7Q==
X-Received: by 2002:a63:2a43:0:b0:376:4b9:f7e0 with SMTP id
 q64-20020a632a43000000b0037604b9f7e0mr6804549pgq.437.1645852132885;
        Fri, 25 Feb 2022 21:08:52 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f0fbf3b524sm5431819pfk.206.2022.02.25.21.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 21:08:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pako: remove duplicate LICENSE
Date: Fri, 25 Feb 2022 21:08:47 -0800
Message-Id: <20220226050847.1731560-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 05:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95540

The LICENSE is already included in the wheel and therefore packaged like
any other wheel. Remove the duplicate LICENSE erroneously installed in
/usr/pako/LICENSE.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pako_0.3.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
index 65af4121f9..34cd096c9d 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.1.bb
@@ -8,5 +8,6 @@ SRC_URI[sha256sum] = "c033a073bb818ca336ae1fccba2655bd60dfe77744f85d4517abd3160d
 inherit pypi setuptools3
 
 do_install:append() {
-    rm -rf ${D}/usr/share
+  rm -rf ${D}${prefix}/pako/LICENSE
+  rm -rf ${D}${prefix}/pako
 }
-- 
2.30.2


