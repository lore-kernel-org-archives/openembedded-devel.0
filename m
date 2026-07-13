Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A68C44506
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:15 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1210.1783903510847488828
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gD+hgWOA;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so1909280a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903510; x=1784508310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfsuynBHS/ClgndzU28nRc3+nWj7GReSYjw/+iP/a9s=;
        b=gD+hgWOAFZf18Rwe131GIiCcxHRRJVuk1Cze1M2t3bDu4z8CAfm0EEPj+dHyrSpcRI
         5dksHsOHEOewroKodtj9/GPHM3H3aplvjbTsKFNycrDa7YftVqBRoH1SHhsGsPd+256w
         s8ZEgqoe5VDW+4P0qQxtboZ3gT38ekCGEUljO6EA51syCjZwlWMxVz7MrX0Amebb92yq
         kmIvHQsbwEWcjacSq4db09XHkaCExrJop7w0tqBzwnBX3haU7GRQ418QT4z4+Fn5csrm
         Q3jvGH69R+XMe1VWK4bwP513wyLGJzVrtS2QfwqnHkSSTCTMHLoY+oNzJW9HR3yhU3f2
         1Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903510; x=1784508310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfsuynBHS/ClgndzU28nRc3+nWj7GReSYjw/+iP/a9s=;
        b=YYP1aPsURE2OWveWveFCKxkG9ULjIqMdGRYL89EMafEYLa7CHeNRYFNLUIA2jmNb2z
         zre4OA514umRPRbyaDMLUYmqU1AIlMdCmWAvI3EaoE66pFQBWLuxAgMJiGpfhEDXf9Us
         o4ddHvdD21TNm/ctUi1PEWtJ5bClyyXOrq/lF4ubmOw2K9ypLkcMKKQ91Hbwbf+YVEoE
         oN5GGYhsJlBEm/OEBiMNVraeej8ZIfnn6KLuboFMeVlHdCHOrs5hdZXxaV8LeRDAkZ0W
         KWQjt5FJfhVH/GHhArmS7GvrmtjOGbFauX8FKEamlAyiqdOh44JCnGKdWsGTfGWCGVSG
         1pKg==
X-Gm-Message-State: AOJu0YzfH0elkLAkAUewhZdRDLIXMj275YgcZ7RwVzKmvTMTKkAzRh0l
	asjRvNW15ods8jk5CDpVas15+YbrjOxHYkJmZ9ott8slqyqJiDng1xdcJl9Qh5vDxzk=
X-Gm-Gg: AfdE7ckC2YPwgLqrezxgVDnIPZPy9LO5Uz8wvva+X/GUDDEMNyhuUrX+vRvOEbqf/mU
	JvDOsluoptpMYJt9MakXejz87dJNgYt9x15XRZ/aLoBd5xWvtItycCNJlZQ3BpjfWeZRnvovdol
	h1vdnyYycvT0/olft5DGJGdIe8/WweS2uhdnCfldzZl65enn0a5PnAHYnfLn5uJTNFv8UXBBOsD
	S2HQ/lO9GCKMke34rKvvFwg1XUXVtuhF0R7HHYhOrKZaia8lHdIrRmhysBPhh2f3iKBeO5bdm62
	5kkzmirnlnceW4zzpHgngkmslrKmvdNfuD57ezR6HTpPzQYKbx6w9nhJV7bskwVt/PDXvZpXYdA
	GkhIibYKTRu8XLj5Jd2XW4Z4+9V6bG90BUhqrg7byzBFlv4pcYasAWoem2NsaxnuPJXsJfZ7IRW
	vBWBtbClQs6kTiE0kIGsdERQwqqm7fM6SQ557bRp6YWuPlsUe2MS7Oncf4HP9jfTDhk/tZDWJE0
	vQnVPqJxCwViiuknJ4tSRcQ5Zf1R9DFaQWpT0qJX4LRTzqtjqIdCAuGxD6+bUF6C2AclTYsvkxL
	8TAoambe6Jf1x8EjLypPWc7bDL6kpg==
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr7905179637.76.1783903510040;
        Sun, 12 Jul 2026 17:45:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [meta-oe][PATCH 4/8] sysdig: Use LuaJIT headers to match the linked LuaJIT library
Date: Sun, 12 Jul 2026 17:44:58 -0700
Message-ID: <20260713004502.716970-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128146

csysdig fails to link when stock Lua is also present in the sysroot:

  ld.lld: error: undefined symbol: luaL_openselectedlibs
  >>> referenced by chisel.cpp:1190
  ld.lld: error: undefined symbol: lua_pcallk
  ld.lld: error: undefined symbol: lua_setglobal

sysdig's chisel code does #include "lua.h" and links against LuaJIT
(lua${JIT}), but the recipe-sysroot also carries stock Lua headers
(openembedded-core lua installs lua.h into ${includedir}). Those headers
win the include search over ${includedir}/luajit-2.1, so the chisel
objects are compiled against stock Lua while the binary links
libluajit-5.1.so. In Lua >= 5.4.4 luaL_openlibs is a macro for
luaL_openselectedlibs and lua_setglobal/lua_pcallk are real symbols,
none of which LuaJIT (a Lua 5.1 ABI) provides, hence the undefined
references. -DLUA_INCLUDE_DIR does not help: sysdig's luajit.cmake only
consults it in its stock-Lua fallback, not when it finds LuaJIT.

Prepend ${STAGING_INCDIR}/luajit-2.1 to CFLAGS/CXXFLAGS. These land in
CMAKE_CXX_FLAGS, which precede CMake's generated -I includes, so LuaJIT's
lua.h is found first and matches the linked library.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
index 6d754b9bd0..bea66ad17c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
@@ -62,9 +62,18 @@ EXTRA_OECMAKE = "\
                 -DCREATE_TEST_TARGETS=OFF \
 "

+# sysdig's chisel code does #include "lua.h". The recipe-sysroot also carries
+# stock Lua headers (openembedded-core lua installs lua.h into ${includedir}),
+# which are ABI-incompatible with the LuaJIT library sysdig links against: in
+# Lua >= 5.4.4 luaL_openlibs is a macro for luaL_openselectedlibs and
+# lua_setglobal/lua_pcallk are real symbols, none of which LuaJIT provides.
+# sysdig's luajit.cmake only honours LUA_INCLUDE_DIR in its stock-Lua fallback,
+# not when it finds LuaJIT, and the LuaJIT include dir does not win the search
+# order, so lua.h resolves to the stock header and the link fails. Put the
+# LuaJIT include dir first so its lua.h is used and matches the linked library.
 #Add include dir to find driver_config.h
-CXXFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
-CFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
+CXXFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"
+CFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"

 #To fix do_package QA Issue
 do_compile:append() {

