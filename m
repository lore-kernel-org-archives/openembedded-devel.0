Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3042.1599324975003278060
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fp/ybzZQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id z19so4163250pfn.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QVb+PC8MwbR4/pObxkhKTq70oiJFgssk0VKHlbN7xk8=;
        b=Fp/ybzZQsHYwx+E1uUaDpSA05wG02r3IaWF/tMI/rwn7JiiBtWSmEDdw9O80BqcCSD
         M5c6XkyLADKdy5olHBC0YTk1yu2weHxzTeXkEgxIc+61vDZzMpjNSELBkp/oDoPjp+E3
         8KlyyAthwm3C5iaPkGuDLL3z26Lp+adyIVUBcdeVdrS1V9gCmeGen9RM5j6eljq6KFMR
         KGim1OCirZBItIFu+FTfj0mrzVqXPmLwOZrD8LiC7Xcvx6/4WQp13mjX0tZ2pRs3macg
         GaO3OeLLjTb+XVcJHZrVLG/reXSE4XjzZSb2o5fpR4zlHD7SySSlcOItGyVLVNO24AJy
         Fkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QVb+PC8MwbR4/pObxkhKTq70oiJFgssk0VKHlbN7xk8=;
        b=dNC6ShgS/GkE0faGPWqjybq/3lnAhLQI0R6H7svMMIKqIae9NrSLz1Q7fWJ/NKoVHL
         a28FiV71dWcdmgI1e80auHq6QyKYM8FnNEjMdzEZhvURgkAsawacXgynu/ClIwBW4t5m
         nj1+9sirDBeKBOjUuuWkMueU8duEXRp9uh3zd8pkmXPCnSUToY9/rguZzGSlXb1W8exX
         r6G4GxTRasA5SpowrM4BaE3dbVuTXTl2FuSkJgMDjV/xJ6fN8JG6yhGvGTich3aAYSDJ
         uJq2/oSjVPCNXQlpmc20yxy/DobwRJX4o7hO9hnyXhfMQpP2eS8STyZBKI3URuSwYxr3
         2tmQ==
X-Gm-Message-State: AOAM5306XJywsUnKd13oAtFzwQrg4qIneuJ/XN9C9V7dQGw+ZhRjGs27
	sHPbZpnVYxGFl5zV6i2zrQqYnLwjgfs=
X-Google-Smtp-Source: ABdhPJxMvlFbfn/ri5WLIbe2l3Q1PmRQOBDOxdkcYuHJzOV5aXUgAWXKKd7K+EWHXNsYQpBuUFQxEg==
X-Received: by 2002:a63:4d56:: with SMTP id n22mr8125451pgl.177.1599324974262;
        Sat, 05 Sep 2020 09:56:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:13 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/20] lua: Security Advisory - lua - CVE-2020-15888
Date: Sat,  5 Sep 2020 09:55:52 -0700
Message-Id: <fae2b902613f0fda14f70cbb1eb4c41e7c0fc9a7.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Yue Tao <Yue.Tao@windriver.com>

Backport fix from https://github.com/lua/lua.git.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 698748c1538ed03efbcfdd936cf8317b4f138c29)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lua/lua/CVE-2020-15888.patch              | 45 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
new file mode 100644
index 0000000000..60a4125971
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/CVE-2020-15888.patch
@@ -0,0 +1,45 @@
+From 6298903e35217ab69c279056f925fb72900ce0b7 Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Mon, 6 Jul 2020 12:11:54 -0300
+Subject: [PATCH] Keep minimum size when shrinking a stack
+
+When shrinking a stack (during GC), do not make it smaller than the
+initial stack size.
+---
+ ldo.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+==== end of original header ====
+
+CVE: CVE-2020-15888
+
+Upstream-Status: backport [https://github.com/lua/lua.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+====
+diff --git a/ldo.c b/ldo.c
+index c563b1d9..a89ac010 100644
+--- a/src/ldo.c
++++ b/src/ldo.c
+@@ -220,7 +220,7 @@ static int stackinuse (lua_State *L) {
+ 
+ void luaD_shrinkstack (lua_State *L) {
+   int inuse = stackinuse(L);
+-  int goodsize = inuse + (inuse / 8) + 2*EXTRA_STACK;
++  int goodsize = inuse + BASIC_STACK_SIZE;
+   if (goodsize > LUAI_MAXSTACK)
+     goodsize = LUAI_MAXSTACK;  /* respect stack limit */
+   if (L->stacksize > LUAI_MAXSTACK)  /* had been handling stack overflow? */
+@@ -229,8 +229,7 @@ void luaD_shrinkstack (lua_State *L) {
+     luaE_shrinkCI(L);  /* shrink list */
+   /* if thread is currently not handling a stack overflow and its
+      good size is smaller than current size, shrink its stack */
+-  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) &&
+-      goodsize < L->stacksize)
++  if (inuse <= (LUAI_MAXSTACK - EXTRA_STACK) && goodsize < L->stacksize)
+     luaD_reallocstack(L, goodsize);
+   else  /* don't change stack */
+     condmovestack(L,{},{});  /* (change only for debugging) */
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index a23a4a5dac..d3461b06de 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            file://0001-Allow-building-lua-without-readline-on-Linux.patch \
+           file://CVE-2020-15888.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-- 
2.17.1

