Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6ABC531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:52 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7427.1784746190017582301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 11:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jUF0rOPT;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso7603746a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 11:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746189; x=1785350989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcQl8WpAduq449rTE7o1vQmOQAVmIHtEotqnJdxMQR0=;
        b=jUF0rOPTk0awYHkyP8fnt/YRAzaVkWpfgHuCf4FT8lyi+IrLhIGWWsibF9shN027KX
         d/G2v2/LEsjUmuMXdVjCpuF7D21SyluqG6Hsl00/bIT0BaYK7H4apulc5mTO1aE8o0C/
         Qv90iRuGJNCQXOlMf37l+q0KyLr1Tw1Uw6/h46REUM01YeYq90zgyLxJ/MZFLKrQg2oC
         oDHq8lYsdHVyGKObIyCN9Yvz5qq4rgrpLpoeX3LBqWEjEB66pmw8u9N4rDw9x04Dh2bv
         pwdKoqaL4CjVd/wWCq7++KQ7oMtLe4rvLqq/Nm7KY5zE1Su1kXIXBowutBSYrqma75gh
         0V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746189; x=1785350989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcQl8WpAduq449rTE7o1vQmOQAVmIHtEotqnJdxMQR0=;
        b=RGv4LNMEbFKG6RNpSns0hGDO9OxolW3DcMkMjaAUltpFmAAOKeOE7PJltgPpaEv9MN
         su6fUppVxexV02iLU9QaLWQwxjkHi+azxYEbcj9nYc8Hxw1TnSpuFVf8YZa17CZuCY/D
         CiFj2I/5vhsywTFFN1+DYN5bATYZZG4vSfOc0NVlQMLIw07/O4ZYvgs8tVYBxYXcoyyQ
         T1pVQv5TldZei4il51GkejwQ9ahuuEL8UbOWJdbcq1aP1bX5qowTjOIEm6Pp+dSsszwH
         OEQTp0fV9wNlvOB/BTdHhewtQob/wa5wjo7ZKsumtMCa0CYbUJ7TGzWnlP4aw9AMjl9k
         3Quw==
X-Gm-Message-State: AOJu0Ywo5kdEmozzW/5GdVpboiUKUEXNAMLYpI1ZgOFBYJOI+0xZOeeT
	qu1vD/4mG1p9RFOm0Ze1j6jUnZXPRGth/RwOzyWpmVn2Icm/Is3HOVfJ/n7ckA==
X-Gm-Gg: AR+sD13vBl/5cYwNzDQancw08lZj7EUEL+k3IR+92ynBWKVPoflr1/B5+WhH4FSo9m8
	RPTmtW7LFOSMLwF+D6Y8GuKZ3pQcKz/GmnaeQvgJJRX1GEB+N9YKY1Zk4S79HVsUvKovdijflvd
	R9sJld0qm37vvSTrauYC0FAl5f601uGzbkswOqO6Qi18UphwSLELR3U6tFFMliO8T6wLb+G61IQ
	zVJLJyrdnKFZMT6+NMNT8+8vcXKX3bxO7LlHbdO8ekvzPsgojBAmSdbxVLJVU967/8MSsc6QzUJ
	GJ3klteBTJT550NGHauD7WZRZJLElyrnOlJ/C9t5SxjlHRQ6ww41eqVT6BqIKyxo/vlPq3vduZ/
	u1MMA7pG4SZZ0lrNju3/irr9/NeDN3sCX8tjXVRIwxmy/9HVpWZSHBQsWVH2x165l9q+G/zpTcn
	JoL18/tbX0PMoIpNoXb1bVCuHV5nuCg7F4NRayf1lHoomFXOLBi4koetFMLghUFsaF5UVG9wCft
	ueSTL+dDhbQrm+kZC0vFkmjBQuW2Fxubz7/kRUa+WQFqVjztH5ploG6x7IvVY/ZtUo1n+PdrD9m
	RaWMijwtCxjFDLIvrVY8KFYVdSVt6g==
X-Received: by 2002:a05:6a20:cc0b:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3c3ad7aa226mr27197610637.16.1784746189324;
        Wed, 22 Jul 2026 11:49:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm11115841eec.26.2026.07.22.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:49:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/5] sysdig: pin Curses to target sysroot so chisel uses LuaJIT lua.h
Date: Wed, 22 Jul 2026 11:49:39 -0700
Message-ID: <20260722184939.495321-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
References: <20260722184939.495321-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 18:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128412

chisel does #include "lua.h" and links libluajit-5.1.so, but the link
failed with undefined Lua symbols (luaL_openselectedlibs, lua_setglobal,
lua_getglobal, lua_pcallk). Those come from the stock Lua >= 5.4 header,
not LuaJIT.

The stray stock lua.h reaches the target compile line via ncurses.cmake:
find_package(Curses) resolves CURSES_INCLUDE_DIR to the native sysroot
(recipe-sysroot-native/usr/include, which also carries ncurses.h/form.h
and, dragged in by lua-native, lua.h), then include_directories() places
that dir ahead of the LuaJIT include dir. The prior CXXFLAGS -I workaround
could not win because CMake orders target include_directories before
CMAKE_CXX_FLAGS.

Pin CURSES_INCLUDE_DIR/CURSES_LIBRARIES to the target sysroot so the native
include dir never leaks into the target build; lua.h then resolves through
LUAJIT_INCLUDE and matches the linked library.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-extended/sysdig/sysdig_0.39.0.bb  | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
index a59e7d296c..b9bf8ba90f 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
@@ -60,17 +60,24 @@ EXTRA_OECMAKE = "\
                 -DUSE_BUNDLED_JSONCPP=OFF \
                 -DBUILD_SYSDIG_MODERN_BPF=OFF \
                 -DCREATE_TEST_TARGETS=OFF \
+                -DCURSES_INCLUDE_DIR=${STAGING_INCDIR} \
+                -DCURSES_LIBRARIES=${STAGING_LIBDIR}/libncurses.so\;${STAGING_LIBDIR}/libform.so \
 "

-# sysdig's chisel code does #include "lua.h". The recipe-sysroot also carries
-# stock Lua headers (openembedded-core lua installs lua.h into ${includedir}),
-# which are ABI-incompatible with the LuaJIT library sysdig links against: in
-# Lua >= 5.4.4 luaL_openlibs is a macro for luaL_openselectedlibs and
-# lua_setglobal/lua_pcallk are real symbols, none of which LuaJIT provides.
-# sysdig's luajit.cmake only honours LUA_INCLUDE_DIR in its stock-Lua fallback,
-# not when it finds LuaJIT, and the LuaJIT include dir does not win the search
-# order, so lua.h resolves to the stock header and the link fails. Put the
-# LuaJIT include dir first so its lua.h is used and matches the linked library.
+# sysdig's chisel code does #include "lua.h", but the only lua.h it must ever
+# resolve to is LuaJIT's (it links libluajit-5.1.so). The native sysroot also
+# ships a stock Lua header (lua-native pulls lua.h into
+# recipe-sysroot-native/usr/include), and in Lua >= 5.4.4 luaL_openlibs is a
+# macro for luaL_openselectedlibs while lua_setglobal/getglobal/pcallk are real
+# symbols, none of which LuaJIT provides -- so compiling chisel against it makes
+# the link fail with undefined Lua symbols.
+#
+# That native include dir leaks onto the target compile line because sysdig's
+# ncurses.cmake runs find_package(Curses), which resolves CURSES_INCLUDE_DIR to
+# the native sysroot (native also carries ncurses.h/form.h) and then does
+# include_directories(${CURSES_INCLUDE_DIR}), placing it ahead of the LuaJIT
+# include dir. Pin Curses to the target sysroot so the native dir (and its stray
+# lua.h) never reaches the target build; lua.h then resolves via LUAJIT_INCLUDE.
 #Add include dir to find driver_config.h
 CXXFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"
 CFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"

