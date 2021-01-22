Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.10891.1611331018496453434
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 07:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AoStjnU2;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id e9so3445987plh.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 07:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9tqeaHOnVgV+Ih1rHsHUoJqwwn/DEURHCT3IfXI+x5I=;
        b=AoStjnU2hzTPxVIVkhTSKg6JC5J1GQSrL3RTZrGqdsFNb9YrV+p5YmrZcWsFzNqYbW
         MsSkoE0elDtPcb+trgb0p3Sv0vZGf9+rQsYNoYWOgGvww20A/kQ2IghvJ4uDTlj9N2Xq
         35qxozrN8lX0qO3FPXE7P9XqZ1vIpr8y6hH6s/31Jz8Usu2GCL8VcKxBz1QSKX3UPJWL
         kaJ2MgC3x0RJFJWLlkcsOn6Nkg8IEkuzIuhx67r8sPhVfi9N3MXC3fl3zDvWjVdIFCqO
         vCtJue+D7sexDx8Pab7aRRAiAUxzGCuu1PARknzmHqaMK38j3Z5R4CzKqQDKGwk7CEnq
         w8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9tqeaHOnVgV+Ih1rHsHUoJqwwn/DEURHCT3IfXI+x5I=;
        b=epLoBxYYa5KA7toUHiLPr7l0CPlnm+o8Qfd/w8AEg4e6p8t4DK6w1Q9vbPoluU+bRh
         wIKb695DzqHaZNkr7+Ic/qWdyyofxnAHReuXTKgKVExQbD1J68MauHO3owYWtLDHxUiA
         JjeGdhRUmaPvV2p+RR4BtOImCjJWm8cZ8jzQ+ThAO9YP3MH9vgHtubBMtGGEXJPEUZWP
         +0G62hyXKhM/AApU8KVCsiDUAFcC4P5aUyWbwvok4ljtA2ox9Us+S6JpNv5Vwr7ze3ZS
         5x6P2dLJZ9VOXzE2onPsYHr1PtAGO6ZGA6rLHMlfZsz8bgAyU+GDSmU1BI9GRqMJssiP
         kaeA==
X-Gm-Message-State: AOAM533shioogfsDiBJFmxp0GefzbXGGX5Oy3Q7a+LR3giaf/NlpVJDT
	72Qv8/kmioajz3CJ8CWrI8BUN5weMbChbA==
X-Google-Smtp-Source: ABdhPJyLaAcc+mc5G7NeDpOBQQKfBIc8lJqsGpQzXkZvnbfBK8SJ7oqG98Z6x2ZQlomNi8+H+notWQ==
X-Received: by 2002:a17:90a:5318:: with SMTP id x24mr9156pjh.226.1611331017809;
        Fri, 22 Jan 2021 07:56:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:558f:b0e2:ccf8:d652])
        by smtp.gmail.com with ESMTPSA id c23sm9609181pgc.72.2021.01.22.07.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 07:56:57 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH 1/1] lua: update to 5.3.6
Date: Fri, 22 Jan 2021 07:56:54 -0800
Message-Id: <20210122155654.18920-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122155654.18920-1-akuster808@gmail.com>
References: <20210122155654.18920-1-akuster808@gmail.com>

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

