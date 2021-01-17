Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.21194.1610905609448920981
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fBa8hJdx;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id n7so9503964pgg.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HQtdmkkb4gMA8Jyhln++gabE7j2ns+TxVwEYfERevTo=;
        b=fBa8hJdx850AUqZUnymKFTxKspuT/QqxsFqLLmNZXcHji24hkffBeWMYj1JPQ3uOVk
         Er+7fX2yY4gWE1Gi5Q7xhHyYZs4quUFk5WQ3qDg7wlYp9bzgF8MecV3NgcT0Y+tNAYjk
         YSP/3fL+Rh3H48ecBr7sfN+3U6WcwfQhxX4eL7XRK+4ipmxdwRzmk/yaBxXdHVA7/WyY
         Ojl5JyBbe3h5UFoIZNDTBxI3dyDkld6YVrjPGh3ekrzAvomCUuwg/HHsuXHACmgeXqP6
         rMCjgnFChSbTw8lYPrM/wFxfhjeGcWNguY3G1BC/+VxyzTga+r/MBQBbJ+ZrUFjPI3qg
         vSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HQtdmkkb4gMA8Jyhln++gabE7j2ns+TxVwEYfERevTo=;
        b=E9HarZhC7oCF/8TJss/8SN/Cehnzgw/nViTXlARYdLTWpEvAZt74uPtcKQuasGc+It
         t+J3nbPv0JNQ+ZpLQoaox7hswA8pcWXEmlERj3qMMAD57CPTHa+itxJ/AGbyjQ/Cm/Ph
         yt/h3KyfLrDdDrxa6q/v2t91XoPBtVQpe69QqZnvKET178qnPxdXh4g81/DdQH75A7zl
         yGOcFJ/NKFN3pDTQ6sVsNco7y8xMSEQPu8yFjWDxn3nPqg7UB+s9Cqdgo9CkTLgUeMpy
         SO8KZqM1e9RnYjpHCbn3gNk3EMIJe1Uj1nl0B69Tv2AZkf3B6lK2xlV5mzQyIj0QqunV
         uG6w==
X-Gm-Message-State: AOAM532FcjDT4nqx7V+qS6Mh0AhPJY6lgjlx0DbzS1jCIEDYZTJDmvkM
	/vcBcH9XW8Ym+LhP0G8fuS4ClmNkZH4dGA==
X-Google-Smtp-Source: ABdhPJzP9/gdoFMaKiyWWoMhqB1+gXzD/bzpA1N10S4vY7VsZBoCnk/cTabfXv0sygOsAVLGu+tM4Q==
X-Received: by 2002:a62:37c7:0:b029:1aa:22ea:537d with SMTP id e190-20020a6237c70000b02901aa22ea537dmr22424058pfa.56.1610905608859;
        Sun, 17 Jan 2021 09:46:48 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:48 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/28] lua: update to 5.3.6
Date: Sun, 17 Jan 2021 09:46:15 -0800
Message-Id: <0d766834161339625ccd9f7c74b8f672aa030d3d.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

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

