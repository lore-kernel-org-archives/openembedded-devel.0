Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FDFC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 06:42:52 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.28819.1652078562929640368
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 May 2022 23:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AXz6K+x9;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id x12so11222066pgj.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 May 2022 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=958swoxRj0Kaxb+ALdwnMynXuwr6t/TVXSDBos/+nFQ=;
        b=AXz6K+x9VDf4msKXtvafE7WiigDCyGU+x6Uvta+Rmk40WZT4oesFKUj5Ushs8qdyjg
         cKFHsXhBZj3CKzhhP15N1syK90v531QzBF58k9xEg0jNHktgOYTJCe7/rYSQe+Gm+JOr
         FdSjR45Yzt6ovc+cnPx6LZrIxhcm/1r8VlIsBSPs2NuY9k9O6axvJ3zaazGKqEtmFyBI
         3ZhyWqBIBGi8NnFLALm/0wREEnbq68aKIxFdtrCp8Vy/N73VhW65B+/vBRpAruGFnZXQ
         /sBvGpPP2ynK3BkXxz1N72gMeaB2iG6VUjmeF7rxdkur107m2n61vCza4XCvam4D6jp6
         BQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=958swoxRj0Kaxb+ALdwnMynXuwr6t/TVXSDBos/+nFQ=;
        b=iy+efzI4xoJ6aDD64k8owxZ8ZL3n6FCAkcPrDz3C/LYlf86XYUsNX3ab5Vyl3v/Eqt
         MexFd8/EJ9r3VgQL6y58X4PQmB1O0nS0cpEIWuoaqr13f4VtvrBAP3ShByoLpB5KV2GV
         VSwFhbysa7bB0Qb4d8DkDPFJB/Gyjknrpo5zunnIUuiYU4/BKQ+W7u38vZt2aYtYIF6e
         SfOL/85CSjOkwVho+zt3VsmR+5HW7iM3IFeFW6HZBCIKiiOFUCwOmZ2P167/zKcseMpb
         G9pAIDi8uetBqFRZOdbCmZnF09sOldPG4pusJ2RONVAVCIHMRs36zBOL6DV0daq2dopB
         GWlg==
X-Gm-Message-State: AOAM532f1lF84cQoD+16AWsf/VpdiLy+FVg/nfSU+T8U1OlbLsSzC57s
	ThIpcRLaiHP29VUqUJBqiICyKPY0veVeKeASGVo=
X-Google-Smtp-Source: 
 ABdhPJwVCLvhx50cOr6FYRZiypvMl0scnE40wJz/OlHbpC8EpKWh8NOzAr9WtMrtueJCKorpsOkfiQ==
X-Received: by 2002:a05:6a00:2188:b0:50d:b093:12a2 with SMTP id
 h8-20020a056a00218800b0050db09312a2mr14616382pfi.84.1652078562129;
        Sun, 08 May 2022 23:42:42 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:d92:ab9e:a434:3f0f:c0af:c646])
        by smtp.gmail.com with ESMTPSA id
 v12-20020a1709028d8c00b0015eab1b097dsm6287605plo.22.2022.05.08.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:42:41 -0700 (PDT)
From: omkar <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	omkarpatil10.93@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Steve Sakoman <steve@sakoman.com>,
	Sana Kazi <sana.kazi@kpit.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [meta-oe][dunfell][PATCH] lua: fix CVE-2022-28805
Date: Mon,  9 May 2022 12:12:30 +0530
Message-Id: <20220509064230.2249-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 06:42:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96984

From: Steve Sakoman <steve@sakoman.com>

singlevar in lparser.c in Lua through 5.4.4 lacks a certain luaK_exp2anyregup
call, leading to a heap-based buffer over-read that might affect a system that
compiles untrusted Lua code.

https://nvd.nist.gov/vuln/detail/CVE-2022-28805

(From OE-Core rev: d2ba3b8850d461bc7b773240cdf15b22b31a3f9e)

Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91e14d3a8e6e67267047473f5c449f266b44f354)
Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../lua/lua/0001-lua-fix-CVE-2022-28805.patch | 73 +++++++++++++++++++
 .../lua/lua/CVE-2022-28805.patch              | 28 +++++++
 meta-oe/recipes-devtools/lua/lua_5.3.6.bb     |  1 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch
 create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch b/meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch
new file mode 100644
index 000000000..606c9ea98
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch
@@ -0,0 +1,73 @@
+From a38684e4cb4e1439e5f2f7370724496d5b363b32 Mon Sep 17 00:00:00 2001
+From: Steve Sakoman <steve@sakoman.com>
+Date: Mon, 18 Apr 2022 09:04:08 -1000
+Subject: [PATCH] lua: fix CVE-2022-28805
+
+singlevar in lparser.c in Lua through 5.4.4 lacks a certain luaK_exp2anyregup
+call, leading to a heap-based buffer over-read that might affect a system that
+compiles untrusted Lua code.
+
+https://nvd.nist.gov/vuln/detail/CVE-2022-28805
+
+(From OE-Core rev: d2ba3b8850d461bc7b773240cdf15b22b31a3f9e)
+
+Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+(cherry picked from commit 91e14d3a8e6e67267047473f5c449f266b44f354)
+Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
+---
+ .../lua/lua/CVE-2022-28805.patch              | 28 +++++++++++++++++++
+ meta-oe/recipes-devtools/lua/lua_5.3.6.bb     |  1 +
+ 2 files changed, 29 insertions(+)
+ create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
+
+diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
+new file mode 100644
+index 000000000..0a21d1ce7
+--- /dev/null
++++ b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
+@@ -0,0 +1,28 @@
++From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
++From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
++Date: Tue, 15 Feb 2022 12:28:46 -0300
++Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
++
++CVE: CVE-2022-28805
++
++Upstream-Status: Backport [https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa]
++
++Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
++Signed-off-by: Steve Sakoman <steve@sakoman.com>
++---
++ src/lparser.c         |  1 +
++ 1 files changed, 1 insertions(+)
++
++diff --git a/src/lparser.c b/src/lparser.c
++index 3abe3d751..a5cd55257 100644
++--- a/src/lparser.c
+++++ b/src/lparser.c
++@@ -300,6 +300,7 @@
++     expdesc key;
++     singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
++     lua_assert(var->k != VVOID);  /* this one must exist */
+++    luaK_exp2anyregup(fs, var);  /* but could be a constant */
++     codestring(ls, &key, varname);  /* key is variable name */
++     luaK_indexed(fs, var, &key);  /* env[varname] */
++   }
++
+diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+index 342ed1b54..0137cc3c5 100644
+--- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
++++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+@@ -10,6 +10,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
+            file://CVE-2020-15888.patch \
+            file://CVE-2020-15945.patch \
+            file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
++           file://CVE-2022-28805.patch \
+            "
+ 
+ # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
new file mode 100644
index 000000000..0a21d1ce7
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
@@ -0,0 +1,28 @@
+From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Tue, 15 Feb 2022 12:28:46 -0300
+Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
+
+CVE: CVE-2022-28805
+
+Upstream-Status: Backport [https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa]
+
+Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+---
+ src/lparser.c         |  1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/src/lparser.c b/src/lparser.c
+index 3abe3d751..a5cd55257 100644
+--- a/src/lparser.c
++++ b/src/lparser.c
+@@ -300,6 +300,7 @@
+     expdesc key;
+     singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
+     lua_assert(var->k != VVOID);  /* this one must exist */
++    luaK_exp2anyregup(fs, var);  /* but could be a constant */
+     codestring(ls, &key, varname);  /* key is variable name */
+     luaK_indexed(fs, var, &key);  /* env[varname] */
+   }
+
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
index 342ed1b54..0137cc3c5 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://CVE-2020-15888.patch \
            file://CVE-2020-15945.patch \
            file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
+           file://CVE-2022-28805.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-- 
2.17.1


