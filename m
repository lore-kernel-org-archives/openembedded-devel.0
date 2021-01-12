Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.601.1610495758467808830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 15:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=odLT7Z+t;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id j1so39995pld.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 15:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HQtdmkkb4gMA8Jyhln++gabE7j2ns+TxVwEYfERevTo=;
        b=odLT7Z+tBzno4RtAN2PkKpoqZFxFDy0ASK0RGBBrXN9LRrHx8nMzXahy5ksQmYtZEh
         WH6Uwn8ZIx1A5LxYceCB0F8ZKCJtKui+KJ7b3n9VTWeYQ8F8hKELys4mtrctUKH9IA9s
         Xz4WuWYN9Yy4zRsamlcBZyKiYvdZ9OyDotNPdJGW2N7alU/V4g+rqPba/TEei9nbMHMF
         rdfuVRelkWA0szQ/pjuZi3sR0BZmKttLjMjrIMWwzvYAurfOTEbXHD7w8al61yh3wj1G
         v+LeEy3TgU6g5POMMljaRV9N2NEJPRWEcrTv7GD4DYAUKN32D24sXraYV4PsiWqMrDY8
         dRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HQtdmkkb4gMA8Jyhln++gabE7j2ns+TxVwEYfERevTo=;
        b=sUksKr1nP5/obV9WXVPIW9b79twNPFWyonNeW+ioh08YVzYwypIUF18hSHB52AdHO1
         d700ZQq3pCC/ZJlKkjlVgT8oHqXiJVJayRQ+fN89Pbn3n6rsK+l/2jHo7Jn8/YnC7EZe
         0G6pCD2WX74Jaw13PoiYul/TE+BREAZR58g6wpLKIBhOQHwZnaDD+sKlBMxLgTzLKYAd
         ImggDQdbDCq/PTeuMGg5p71IFqhuLsmOMc5rXrDiHKzCcm0CpahUmd4q3jsP4nFqSWr8
         0E11fkhnj+eXLI7pQKv8YApIslNH69uR3ww6M64CxY60XecnJ1MplpSPVx6HOsGYb6Tv
         fMhg==
X-Gm-Message-State: AOAM530DIKDZoLeb4bgI7gObJVOm4j+g//f1tSFdmQFPN4A0Uq6kPkNI
	uGkQKaARUO6n6pfMj9I7/Vv/VD7teDQrxA==
X-Google-Smtp-Source: ABdhPJzJNiXk3icVk9seUJxxeB+5PfCPo0uTVbVEsoCqM6Na8Y+N66/QmZKgZqV+nFlkRalK8izXXA==
X-Received: by 2002:a17:902:7489:b029:de:23eb:c1eb with SMTP id h9-20020a1709027489b02900de23ebc1ebmr1397937pll.75.1610495757788;
        Tue, 12 Jan 2021 15:55:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id n1sm239491pfu.28.2021.01.12.15.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 15:55:57 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] lua: update to 5.3.6
Date: Tue, 12 Jan 2021 15:55:56 -0800
Message-Id: <20210112235556.7943-1-akuster808@gmail.com>
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
index 7d84ea60b6..342ed1b547 100644
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

