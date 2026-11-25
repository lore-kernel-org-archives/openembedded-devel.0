Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37943.1795594107390375106
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sQBJbRJi;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385c497bf94so2110333eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594107; x=1796198907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HZLV45cUvUgXR1dXwuDGeEcqBvI0CboDBcZPlyK3VE=;
        b=sQBJbRJi1uiAG5g6I0V9QGb978CJ9jobo+uie0vVvjPouLcp+nr/azVADAYEKRpYzt
         fGiierVDTN3hnddfXYGoWqT3vGXJYfYjPlvB1dwxgGuC4IwkkCKg1cnLS/E9bpIMEIiR
         R9UaIzD8rGvqaXJVMkQnwKHC/Fk31CnLC/yeboJ9g7twnJEVVxPs9jHfu4Vlg3eal0hp
         KOGt2Xq9KyM/SNXrddYLrFmb7/w88tkkSLhH2yAJ4y2r534U0mtqvV353BGQs0ulbbYJ
         tr29JEh0VRA8CVlmL+rIBbg/pdWnnKyOyfB1W+t33O+ZdHPsafmdb+Mm0UJ78G7PPoU/
         2rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594107; x=1796198907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HZLV45cUvUgXR1dXwuDGeEcqBvI0CboDBcZPlyK3VE=;
        b=eM7PgXEmSS0zD7gV8b3Sc/4Tjpie8ToD5XrGwM4oFdag3BPiJemRNei6I9mRtnKze/
         zuvuMtLHr1YGHxXsNvxbg0qzvWioRsr7OW8uewQuYDXYPxzUor/7uyEU/VmROWcudzM1
         Ca1Bb2IxFEz1MDYw3A+owwcvYDLEMTJ7q7GB/nKe/n8NuEC66flQt0E3LKq8Tz1AKT1z
         LHuPnAIJEFNgpHTVLbtsZwFDh9asrRxNuiD6QKxNcabCbwWs8JlNPszwjy0w6zKhqWE6
         iCXXSrQDD1GyDo/sPJNz7/Z0/3pvsECg7b6UAwqhlnW21lFGdy0+iSkf2gh55gBt3Qgb
         bG2A==
X-Gm-Message-State: APuU4Z/yisr0rBQLcRy3MLZSrsvea0I5XZNJrsZTcXtiiQO8rgZV/fLB
	lgMTGJ7+XGEu4WQlV4Ny9pUojUIuM4HkEeeY/GwWby65rfjF03umsZUVlkz3VdXu
X-Gm-Gg: AZFdTZdZUfDzp3qyotbUGexbSNzR3GpuSLFut3J/o+uIPoE9e0JelSwr4XB/cBq/sjY
	LaLDf9EFYWhlQbaovJgU4cFAigk3vbBMLTbefux0Ry+gbzFqQFsXk25DK0RCu5/t68lkX5pFMPq
	FGumPjYdtReXcyGX5vw/l85gVhm2A+sHWeWA8R93fttVt8Y6g3m8WXwWa1uXBQ6VaNU2qlN2ITG
	G0/iCBtY53ySeClopldeV8d85qnPf1aCGAcP8WeA/gp35O8g3rlee5R0VVF2bFMwrQ2WqwxQH5P
	uZ88cEj3frHa8uYNjeJ4bQBRfa0n7Z/kxDyxInVpU8lZ3kw/NN6ESQYpimTKSrulURQ4SgAmyDp
	8pgRhP5Cx0zgM1+3VmqSRMiSJntFUgnln6cdWIzLr+qvvDnFwa+UF8NKjqKErSrCeB6NT8bxzAX
	XKkX0oS1gSw92WeBHG1kBZiB9tn/Ut7Yd1Rn0i/YJK53F0Vcfx7GJnPw1HiaOE94XlSuCw8ZIUX
	D/863NEfPd8tCmaoAvrsXSBZlDqhNAcI8xwFQ0ploAdVbNRmNNV09Aw48nWjTh4MYpnbOmtaRop
	ZIdU+XHYNj3WKg8iMwYoKRLK0AxvbfqBRU9T/+5QekF2rwMuxU0zK7CMLhpU/e+cfYNI9QQeymm
	Feg+4SEAaGvbaUUhWI5uN94aN8qtCezio+Eil2NM3nDaRTERoFLtZhH5a5A86MkwiXtkApt2I5D
	OEC/XVmVCbBXkVq7eN1M+bee+VZ4arQV989SQ+LTl5yYWPwsH8HLYIfMrrjy1BVnfsgJb3zfJzj
	+hySuQIy6oZXVdaaxh1cBxMDBGPA40OhGLO69uyozVU1yzUl7wl6J8tTQeilKG6QWtHnUeluSwn
	eLhm
X-Received: by 2002:a05:7301:1a08:b0:386:9f4c:e07f with SMTP id 5a478bee46e88-3869f4ce1d9mr14003091eec.14.1795594106521;
        Wed, 25 Nov 2026 00:08:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 35/55] luaposix: upgrade 36.3 -> 39
Date: Wed, 25 Nov 2026 00:06:51 -0800
Message-ID: <20261125080732.2419614-41-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133038
Content-Type: text/plain; charset="utf-8"

- 37.0: Lua 5.5 support; setpid as root drops supplementary groups;
  errnum reporting fixes
- 38: the undocumented posix.deprecated module and the legacy
  top-level posix.* APIs (exec, stat, uname, ...) are removed; new
  posix.time.tzset, posix.unistd.exece, WIFCONTINUED/WCONTINUED;
  getopt no longer overflows the Lua stack with many arguments
- 38: the bundled build-aux/luke is gone; the build is described by
  the rockspec build table for the luarocks-build-luke backend
- 39: needs std.normalize >= 5.1 for bit32 and no longer installs
  bit32; new posix.sys.stat.futimens/utimensat and nanosecond stat
  fields

Fetch the standalone luke build tool (v0.9) alongside the source and
generate a lukefile from the rockspec build table in do_configure,
since OE has no LuaRocks. Pass CFLAGS to luke, which otherwise
compiles with -O2 only. Track the release-v39 branch and add an
upstream check, and RDEPEND on the new lua-std-normalize. No recipe in
the layers uses the removed posix.* compatibility APIs.

License-Update: copyright year updated to 2026.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../luaposix/luaposix_36.3.bb                 | 30 ----------
 .../recipes-devtools/luaposix/luaposix_39.bb  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb
 create mode 100644 meta-oe/recipes-devtools/luaposix/luaposix_39.bb

diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb b/meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb
deleted file mode 100644
index e420c1a289..0000000000
--- a/meta-oe/recipes-devtools/luaposix/luaposix_36.3.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "luaposix is a POSIX binding for Lua."
-LICENSE = "MIT"
-HOMEPAGE = "https://github.com/luaposix/luaposix"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9a2c76dbe2ca56cf57296af9c9995c27"
-
-DEPENDS += "lua-native lua virtual/crypt"
-
-SRC_URI = "git://github.com/luaposix/luaposix.git;nobranch=1;tag=v${PV};protocol=https \
-"
-SRCREV = "e6b94b37c19c4bd19a7dc475a4f4cb56f61f5da9"
-LUA_VERSION = "5.5"
-
-B = "${S}"
-
-inherit pkgconfig
-
-do_configure() {
-    sed -i "s/^version *= .*/version  = '${PV}'/" ${S}/lukefile
-}
-
-do_compile() {
-    ${S}/build-aux/luke LUA_INCDIR=${STAGING_INCDIR}
-}
-
-do_install() {
-    ${S}/build-aux/luke PREFIX=${D}${prefix} INST_LIBDIR=${D}${libdir}/lua/${LUA_VERSION} install
-}
-
-FILES:${PN} = "${datadir}/lua/${LUA_VERSION} \
-               ${libdir}/lua/${LUA_VERSION}"
diff --git a/meta-oe/recipes-devtools/luaposix/luaposix_39.bb b/meta-oe/recipes-devtools/luaposix/luaposix_39.bb
new file mode 100644
index 0000000000..027239b72e
--- /dev/null
+++ b/meta-oe/recipes-devtools/luaposix/luaposix_39.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "luaposix is a POSIX binding for Lua."
+LICENSE = "MIT"
+HOMEPAGE = "https://github.com/luaposix/luaposix"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f4d11c0590d3adb0a38c88477af3598"
+
+DEPENDS += "lua-native lua virtual/crypt"
+
+SRC_URI = "git://github.com/luaposix/luaposix.git;branch=release-v${PV};tag=v${PV};protocol=https;name=luaposix \
+           git://github.com/gvvaughan/luke.git;branch=release-v0.9;tag=v0.9;protocol=https;name=luke;destsuffix=luke \
+"
+SRCREV_luaposix = "71638fb00c93a38d64daeccdeecedf2a44498006"
+SRCREV_luke = "b18fd6eef0af4380c081976b2e016c76956b571a"
+SRCREV_FORMAT = "luaposix"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)*)$"
+
+LUA_VERSION = "5.5"
+
+B = "${S}"
+
+LUKE = "${UNPACKDIR}/luke/build-aux/luke --file=lukefile.oe"
+
+inherit pkgconfig
+
+# luaposix only describes its build in the rockspec, so turn that into a lukefile
+do_configure() {
+    cat ${S}/luaposix-${PV}-1.rockspec - > ${B}/lukefile.oe <<LUKEFILE
+
+luke_format = 0
+version = '${PV}'
+defines = build.defines
+incdirs = build.incdirs
+modules = build.modules
+build = nil
+source = nil
+description = nil
+dependencies = nil
+build_dependencies = nil
+test_dependencies = nil
+test = nil
+rockspec_format = nil
+LUKEFILE
+}
+
+do_compile() {
+    ${LUKE} LUA_INCDIR=${STAGING_INCDIR} CFLAGS="${CFLAGS}"
+}
+
+do_install() {
+    ${LUKE} PREFIX=${D}${prefix} INST_LIBDIR=${D}${libdir}/lua/${LUA_VERSION} install
+}
+
+FILES:${PN} = "${datadir}/lua/${LUA_VERSION} \
+               ${libdir}/lua/${LUA_VERSION}"
+
+RDEPENDS:${PN} = "lua-std-normalize"
