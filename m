Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.623.1610495735370386374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 15:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LyXcPO7Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id g3so41849plp.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 15:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9tqeaHOnVgV+Ih1rHsHUoJqwwn/DEURHCT3IfXI+x5I=;
        b=LyXcPO7Zmpbz+p6ixUwE523bjoYqaYhpxeF3zCuLQdVQ2PpuaoPlfjkfiwSuKoJbbf
         /088dmRobHZcZPgY2vsr0V/UWsVy//0QW3kwkm3+g7AR+zHbgHlj0Stm7YKFnZzr/E8H
         U6/4yQgw0f0cOVpxFKfx52IV0qdkNvXCBQRK8kIGhyXG8s2SMwQtcDb8N+HfJhyTwsVa
         oj37zWxr46cjefi5l7txsvcLK6w4kzoDkVq8m06kQhYrTf1KRwQUF6GqYwcz4tySZIWI
         YxkphfDzKocnWzyWScLvkuNoRZQ5cJQNhoO2l0OS9z0vk8ANLcBrFHAtT1LCHteQsWWL
         O0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9tqeaHOnVgV+Ih1rHsHUoJqwwn/DEURHCT3IfXI+x5I=;
        b=EI8lMI46v7qLlWhNlo0LQ1jLJzBDEGJIUsIiZ74lUNIf64u9I/4+SoVjoNMk1LjcyE
         3ki1VV2mlHzDuMJ/+U9qZS4ij9ih9Y0FdIAIshCh/5jseh1QHr1Fa+mm6LZoLqOOL/ZS
         V64Ds+lX3dDXZtIMOFUNRuqnnv6wEtg/fC9mNkgFIU3o1MXkmOWyEpLkv/BmiJsoHw+N
         j2ItsvcHxR1Zw5xGVhtjxqnhPXqBqpCL9I1h1uzi/KrzttDBBsApoewxH2OL3Sn3AxmP
         3mf/zBNn26bLWhwUb3sMhJ/c0PbxaEocQ3EL45CYMl9dpV1A03/uiYTLRfvkXKcAZWOv
         r+mw==
X-Gm-Message-State: AOAM5326ilFGzyJFvtiU0W+6K3FeOBxJ9gYEziltVAlGqQ+tGTkbz7h+
	TG5vDVdz2xR4tw6NMGN04GjSrT9d3kuHTw==
X-Google-Smtp-Source: ABdhPJxBn6fcW7/jBXap9GrXcuHfsINx1fa19SLALRrngoWVNC16EKV+xpWZkdyjVTtS0xwkNNrOkA==
X-Received: by 2002:a17:902:be11:b029:da:ba30:5791 with SMTP id r17-20020a170902be11b02900daba305791mr1842320pls.13.1610495734684;
        Tue, 12 Jan 2021 15:55:34 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id b26sm94483pgm.25.2021.01.12.15.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 15:55:34 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][master][gatesgarth][PATCH] lua: update to 5.3.6
Date: Tue, 12 Jan 2021 15:55:32 -0800
Message-Id: <20210112235532.7871-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

LIC_FILES_CHKSUM changed to do year updates

This is the last 5.3.x update. This will give us the best
starting point for doing Maintence moving forward.

Its a bug fix only update. See http://www.lua.org/work/diffs-lua-5.3.5-lua-5.3.6.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/lua/{lua_5.3.5.bb => lua_5.3.6.bb} (92%)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
similarity index 92%
rename from meta-oe/recipes-devtools/lua/lua_5.3.5.bb
rename to meta-oe/recipes-devtools/lua/lua_5.3.6.bb
index 60c33d6586..5e8f54588b 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=60aa5cfdbd40086501778d9b6ebf29ee"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=f43d8ee6bc4df18ef8b276439cc4a153"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -20,8 +20,8 @@ SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \
             file://run-ptest \
            ', '', d)}"
 
-SRC_URI[tarballsrc.md5sum] = "4f4b4f323fd3514a68e0ab3da8ce3455"
-SRC_URI[tarballsrc.sha256sum] = "0c2eed3f960446e1a3e4b9a1ca2f3ff893b6ce41942cf54d5dd59ab4b3b058ac"
+SRC_URI[tarballsrc.md5sum] = "83f23dbd5230140a3770d5f54076948d"
+SRC_URI[tarballsrc.sha256sum] = "fc5fd69bb8736323f026672b1b7235da613d7177e72558893a0bdcd320466d60"
 SRC_URI[tarballtest.md5sum] = "b14fe3748c1cb2d74e3acd1943629ba3"
 SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d43a8eb79845fa7f599f"
 
-- 
2.17.1

