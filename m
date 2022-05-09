Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7E6C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 07:40:42 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.29251.1652082025043572759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 00:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nc2Sul2I;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id x23so11542856pff.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 00:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=958swoxRj0Kaxb+ALdwnMynXuwr6t/TVXSDBos/+nFQ=;
        b=Nc2Sul2Iqz/d8HElEuAYmRKBVygv47E16h/s0K9ePutxCmvm2F+c9sItvKgIVkjChE
         qGCznKltlt5kTAu/MCBsKrxFIwp98wYC/Hv/J65ldwt5fVrMtQM1OGne2yMdhrm2JTDh
         wefFU5N67+0SL2s8xNLuJdAOTnC45wqlRy+fWl9uXTVWG54KEGzBrG3vxZ5p9gUYoqBW
         zxnX0koz4jqRHDCpUk7MGGOgCy8/dzr4shkS71Kd4ERWD9GW2kXPZQfcG/51lsid1mKx
         GsLNyuLrlIA+ZcWHML18jtd5H/RPa2Wz3tO6NNC3QXKg6BOCw7OZ1/Ru4cNT7zJ9LN3g
         kfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=958swoxRj0Kaxb+ALdwnMynXuwr6t/TVXSDBos/+nFQ=;
        b=c9CFdOOwAhyo0Z18YVHeKRbGek+RIFhNRKEzHXRM5h9C8Do6xxg28Y57e3zcZEF+Ur
         YvjsjwNUnsgMcKzBYwH0qjbGYTtepc4UY+oShxvxlz2/hTk8jwyrJZBdgh20QRr0KzON
         HE6BH+PWYoWd/QwCqFLFGOltY2sfHUd8Ocwz5AfAfxdbXMDzhx5fC5H1+sOd2pzIV0YE
         A8F7TxHNOuEjVfec44ea5vpKZEP13hwBmcFr/FXhhvOrRG13wB0Y64f4sN1IhGry8Cl+
         uX5/8/8LQ6PIU6gICzoVm1PzRP99h0eKsULoyhPhN3heWoa0CPF8271FHIfVqTJCbODg
         oA+Q==
X-Gm-Message-State: AOAM5315rz2qAF1H3Yix/TLIy59Upb33IgSjiTB4j4x+M/FcTTHWQR+u
	gBBsDLksyakyT3CH8OCz4Y73yHFn+LcbHqgZGeU=
X-Google-Smtp-Source: 
 ABdhPJxKM2Hhq7zDiLveTLwXE7FgwRuCNzHTbIDc7CXC/osjYwNiV1eHBTU6jLelAYCJri6oLJxkvA==
X-Received: by 2002:aa7:9557:0:b0:50d:b868:4798 with SMTP id
 w23-20020aa79557000000b0050db8684798mr14616061pfq.84.1652082024362;
        Mon, 09 May 2022 00:40:24 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:d92:ab9e:a434:3f0f:c0af:c646])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a170902ea4e00b0015e8d4eb27csm6338101plg.198.2022.05.09.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:40:23 -0700 (PDT)
From: omkar <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	omkarpatil10.93@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Steve Sakoman <steve@sakoman.com>,
	Sana Kazi <sana.kazi@kpit.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH] lua: fix CVE-2022-28805
Date: Mon,  9 May 2022 13:10:09 +0530
Message-Id: <20220509074009.12239-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 07:40:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96986

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


