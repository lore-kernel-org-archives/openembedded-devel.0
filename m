Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF416189B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 18:55:27 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so3456382pfa.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Feb 2020 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pyr7gb13JoXKl6xUGYftXZkrPFEy/a/kCKaOvrdyERw=;
	b=rt1RxOrsV845gCN/am9xUZnwsiFgpoou8sS5MpKGulRul+clHu4wzFnDSOyzwHCjuW
	ccDFPxp9BgZhjBBT9QWEFZqSa/+AmDZCWoKKd/a9Kok2Bf3wXyin//kYqkEfxcth8VVl
	yJc7tLHDdRrFx1FkLt7p2LcvrhLnjLTpaRKVt1NZ8Xz8b5L1lXgozgvOvbxvRL9TlWOa
	7nsayRJZIcPZCb7Fz8u1V3Pp8yNKZ/AHwLjrYnqL0NB5JilcAqx8c/b3hS1uvaWRwgba
	TCQfZJIlOh0hD6KvqVc6fnjsz4Jfe6jMUQ2IzCJ7TO4kYU5uMjWJbpB6QA7ll2UjoxAp
	fgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pyr7gb13JoXKl6xUGYftXZkrPFEy/a/kCKaOvrdyERw=;
	b=mGU4dqSafREWtrAggt3FiySg6UmiscvpdS7uw91TY2uVOz1W/39cwP93g9DOLKzAaK
	Mq/ki1HqTd40+qZWH9L8RMQYcBEPpEOgu2gBmUTh8e7cn1ZHhyQ3reOgYuxVva1oOvq0
	+gs5YrGmu72FulEkF0PDCRB4Gixwy/1D/Rhly9wjUm3Aralku8lUuuCZ6ZB1YlwdlV/F
	m/Mw+ofcDbycW1Luo4kFafcx1BtSci6SzS8BjHeh4DtBKJf9zzTLINmB20SC/ox0NoN4
	KienGqZA5cbC1LNIqmN8JINYfNT32VKuJU6GreHtGYE0VEzl+JRqQZYtE5szPl7t6VQe
	q0bg==
X-Gm-Message-State: APjAAAVcEq4YsBPbHpIt7JiRy5+D8YueyVzYxhZYwfnvMVBhDqTDI52r
	9K0BjtOSCReDynPhp4NoFH+cE/W4lio=
X-Google-Smtp-Source: APXvYqylzOF3vthzerKlhc68Oy9+Ho3c8OLD3TkQu7hkwROh03boz2BsJt4qZbr0Y0D/mhBsMchfaA==
X-Received: by 2002:a63:7783:: with SMTP id
	s125mr10624285pgc.214.1583002528507; 
	Sat, 29 Feb 2020 10:55:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	191sm7795661pfa.142.2020.02.29.10.55.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 10:55:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Feb 2020 10:55:39 -0800
Message-Id: <20200229185539.3905864-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] sysdig: Upgrade to 0.26.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Feb 2020 18:55:28 -0000
Content-Transfer-Encoding: 8bit

* License changed to Apache-2.0 upstream as well [1]
* Forward port patches to apply on 0.26
* Just build libb64 from internal modules everything else should be
  provided by OE recipes
* Disable luajit mips64 since luajit on these arches is
  not available, fall back to liblua
* Disable build on musl, it needs fixing in sysdig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...usl-backtrace-APIs-are-glibc-specifi.patch |  37 +++---
 ...0001-fix-build-with-LuaJIT-2.1-betas.patch |  96 ++++++++++++++++
 ...-libsinsp-Port-to-build-with-lua-5.2.patch | 108 ------------------
 .../sysdig/sysdig/fix-uint64-const.patch      |  16 +++
 meta-oe/recipes-extended/sysdig/sysdig_git.bb |  47 +++++---
 5 files changed, 158 insertions(+), 146 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
index 7d3f8a19d7..cb80611578 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
@@ -9,42 +9,41 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  userspace/libsinsp/utils.h   | 2 +-
  2 files changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/userspace/libsinsp/utils.cpp b/userspace/libsinsp/utils.cpp
-index 8f23f9c..c496a57 100644
 --- a/userspace/libsinsp/utils.cpp
 +++ b/userspace/libsinsp/utils.cpp
-@@ -21,7 +21,9 @@ along with sysdig.  If not, see <http://www.gnu.org/licenses/>.
+@@ -22,7 +22,7 @@ limitations under the License.
  #include <limits.h>
  #include <stdlib.h>
  #include <sys/time.h>
-+#ifdef __GLIBC__
+-#ifndef CYGWING_AGENT
++#if !defined(CYGWING_AGENT) || defined(__GLIBC__)
  #include <execinfo.h>
-+#endif
+ #endif
  #include <unistd.h>
- #include <sys/time.h>
- #include <netdb.h>
-@@ -741,7 +743,7 @@ uint64_t sinsp_utils::get_current_time_ns()
-     return tv.tv_sec * (uint64_t) 1000000000 + tv.tv_usec * 1000;
- }
+@@ -780,6 +780,7 @@ bool sinsp_utils::glob_match(const char
  
--#ifndef _WIN32
-+#if defined(_WIN32) && defined(__GLIBC__)
+ #ifndef CYGWING_AGENT
+ #ifndef _WIN32
++#ifdef __GLIBC__
  void sinsp_utils::bt(void)
  {
  	static const char start[] = "BACKTRACE ------------";
-diff --git a/userspace/libsinsp/utils.h b/userspace/libsinsp/utils.h
-index 600d00b..4ab4650 100644
+@@ -801,6 +802,7 @@ void sinsp_utils::bt(void)
+ 
+ 	free(bt_syms);
+ }
++#endif // Glibc
+ #endif // _WIN32
+ #endif // CYGWING_AGENT
+ 
 --- a/userspace/libsinsp/utils.h
 +++ b/userspace/libsinsp/utils.h
-@@ -79,7 +79,7 @@ public:
+@@ -104,7 +104,7 @@ public:
  
- 	static uint64_t get_current_time_ns();
+ 	static bool glob_match(const char *pattern, const char *string);
  
 -#ifndef _WIN32
 +#if not defined(_WIN32) && defined(__GLIBC__)
  	//
  	// Print the call stack
  	//
--- 
-2.6.2
-
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch
new file mode 100644
index 0000000000..71b0b8c8b9
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch
@@ -0,0 +1,96 @@
+From ae82de664a6ba6ab2654adf9bed81f22b6fdc19d Mon Sep 17 00:00:00 2001
+From: Evgeni Golov <evgeni@golov.de>
+Date: Sun, 27 Aug 2017 13:51:19 +0200
+Subject: [PATCH] fix build with LuaJIT 2.1 betas
+
+LuaJIT 2.1 drops some compat symbols [1]. And while I think that this is
+wrong, as it breaks compatibility with Lua 5.1 [2], it is quite easy to
+adopt the code to work with both versions (2.0 and 2.1) of LuaJIT and
+remain Lua 5.1 compatible.
+
+[1] https://github.com/LuaJIT/LuaJIT/commit/dc320ca70f2c5bb3977b82853bcee6dad2523d01
+[2] https://github.com/LuaJIT/LuaJIT/issues/325
+
+Upstream-Status: Submitted [https://github.com/LuaJIT/LuaJIT/issues/325]
+Signed-off-by: Evgeni Golov <evgeni@golov.de>
+sysdig-CLA-1.0-signed-off-by: Evgeni Golov <evgeni@golov.de>
+---
+ CMakeLists.txt                        | 2 +-
+ userspace/libsinsp/chisel.cpp         | 6 +++---
+ userspace/libsinsp/lua_parser.cpp     | 2 +-
+ userspace/libsinsp/lua_parser_api.cpp | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d7020493..33e524f5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -140,7 +140,7 @@ option(USE_BUNDLED_DEPS "Enable bundled dependencies instead of using the system
+ option(USE_BUNDLED_LUAJIT "Enable building of the bundled LuaJIT" ${USE_BUNDLED_DEPS})
+ 
+ if(NOT USE_BUNDLED_LUAJIT)
+-	find_path(LUAJIT_INCLUDE luajit.h PATH_SUFFIXES luajit-2.0 luajit)
++	find_path(LUAJIT_INCLUDE luajit.h PATH_SUFFIXES luajit-2.1 luajit-2.0 luajit)
+ 	find_library(LUAJIT_LIB NAMES luajit luajit-5.1)
+ 	if(LUAJIT_INCLUDE AND LUAJIT_LIB)
+ 		message(STATUS "Found LuaJIT: include: ${LUAJIT_INCLUDE}, lib: ${LUAJIT_LIB}")
+diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
+index 0a6e3cf8..0c2e255a 100644
+--- a/userspace/libsinsp/chisel.cpp
++++ b/userspace/libsinsp/chisel.cpp
+@@ -98,7 +98,7 @@ void lua_stackdump(lua_State *L)
+ // Lua callbacks
+ ///////////////////////////////////////////////////////////////////////////////
+ #ifdef HAS_LUA_CHISELS
+-const static struct luaL_reg ll_sysdig [] =
++const static struct luaL_Reg ll_sysdig [] =
+ {
+ 	{"set_filter", &lua_cbacks::set_global_filter},
+ 	{"set_snaplen", &lua_cbacks::set_snaplen},
+@@ -134,7 +134,7 @@ const static struct luaL_reg ll_sysdig [] =
+ 	{NULL,NULL}
+ };
+ 
+-const static struct luaL_reg ll_chisel [] =
++const static struct luaL_Reg ll_chisel [] =
+ {
+ 	{"request_field", &lua_cbacks::request_field},
+ 	{"set_filter", &lua_cbacks::set_filter},
+@@ -146,7 +146,7 @@ const static struct luaL_reg ll_chisel [] =
+ 	{NULL,NULL}
+ };
+ 
+-const static struct luaL_reg ll_evt [] =
++const static struct luaL_Reg ll_evt [] =
+ {
+ 	{"field", &lua_cbacks::field},
+ 	{"get_num", &lua_cbacks::get_num},
+diff --git a/userspace/libsinsp/lua_parser.cpp b/userspace/libsinsp/lua_parser.cpp
+index 0e26617d..78810d96 100644
+--- a/userspace/libsinsp/lua_parser.cpp
++++ b/userspace/libsinsp/lua_parser.cpp
+@@ -32,7 +32,7 @@ extern "C" {
+ #include "lauxlib.h"
+ }
+ 
+-const static struct luaL_reg ll_filter [] =
++const static struct luaL_Reg ll_filter [] =
+ {
+ 	{"rel_expr", &lua_parser_cbacks::rel_expr},
+ 	{"bool_op", &lua_parser_cbacks::bool_op},
+diff --git a/userspace/libsinsp/lua_parser_api.cpp b/userspace/libsinsp/lua_parser_api.cpp
+index c89e9126..e0169fe1 100644
+--- a/userspace/libsinsp/lua_parser_api.cpp
++++ b/userspace/libsinsp/lua_parser_api.cpp
+@@ -266,7 +266,7 @@ int lua_parser_cbacks::rel_expr(lua_State *ls)
+ 					string err = "Got non-table as in-expression operand\n";
+ 					throw sinsp_exception("parser API error");
+ 				}
+-				int n = luaL_getn(ls, 4);  /* get size of table */
++				int n = (int)lua_objlen(ls, 4);  /* get size of table */
+ 				for (i=1; i<=n; i++)
+ 				{
+ 					lua_rawgeti(ls, 4, i);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
deleted file mode 100644
index 8fec0ca59f..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From c2782a6ca968190e221c25b0890600ba8cd43798 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 23 Oct 2015 00:23:15 -0700
-Subject: [PATCH] libsinsp: Port to build with lua >= 5.2
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- userspace/libsinsp/chisel.cpp | 40 +++++++++++++++++++++++++++++-----------
- 1 file changed, 29 insertions(+), 11 deletions(-)
-
-diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
-index 3cfbd8d..2db9348 100644
---- a/userspace/libsinsp/chisel.cpp
-+++ b/userspace/libsinsp/chisel.cpp
-@@ -94,7 +94,7 @@ void lua_stackdump(lua_State *L)
- // Lua callbacks
- ///////////////////////////////////////////////////////////////////////////////
- #ifdef HAS_LUA_CHISELS
--const static struct luaL_reg ll_sysdig [] = 
-+const static struct luaL_Reg ll_sysdig [] =
- {
- 	{"set_filter", &lua_cbacks::set_global_filter},
- 	{"set_snaplen", &lua_cbacks::set_snaplen},
-@@ -120,7 +120,7 @@ const static struct luaL_reg ll_sysdig [] =
- 	{NULL,NULL}
- };
- 
--const static struct luaL_reg ll_chisel [] = 
-+const static struct luaL_Reg ll_chisel [] =
- {
- 	{"request_field", &lua_cbacks::request_field},
- 	{"set_filter", &lua_cbacks::set_filter},
-@@ -131,7 +131,7 @@ const static struct luaL_reg ll_chisel [] =
- 	{NULL,NULL}
- };
- 
--const static struct luaL_reg ll_evt [] = 
-+const static struct luaL_Reg ll_evt [] =
- {
- 	{"field", &lua_cbacks::field},
- 	{"get_num", &lua_cbacks::get_num},
-@@ -853,10 +853,28 @@ bool sinsp_chisel::parse_view_info(lua_State *ls, OUT chisel_desc* cd)
- 
- 
- #ifdef HAS_LUA_CHISELS
-+static void chisel_lua_registerlib(lua_State *L, const char *libname,
-+				const luaL_Reg *l, int ind)
-+{
-+#if LUA_VERSION_NUM >= 502
-+	if (libname)
-+	{
-+		lua_newtable(L);
-+		luaL_setfuncs(L, l, ind);
-+		lua_pushvalue(L, -1);
-+		lua_setglobal(L, libname);
-+	}
-+	else
-+		luaL_setfuncs(L, l, ind);
-+#else
-+	luaL_register(L, libname, l);
-+#endif
-+}
-+
- // Initializes a lua chisel
- bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, string const &fpath)
- {
--	lua_State* ls = lua_open();
-+	lua_State* ls = luaL_newstate();
- 	if(ls == NULL)
- 	{
- 		return false;
-@@ -867,9 +885,9 @@ bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, string const &fpath)
- 	//
- 	// Load our own lua libs
- 	//
--	luaL_openlib(ls, "sysdig", ll_sysdig, 0);
--	luaL_openlib(ls, "chisel", ll_chisel, 0);
--	luaL_openlib(ls, "evt", ll_evt, 0);
-+	chisel_lua_registerlib(ls, "sysdig", ll_sysdig, 0);
-+	chisel_lua_registerlib(ls, "chisel", ll_chisel, 0);
-+	chisel_lua_registerlib(ls, "evt", ll_evt, 0);
- 
- 	//
- 	// Add our chisel paths to package.path
-@@ -1111,16 +1129,16 @@ void sinsp_chisel::load(string cmdstr)
- 	//
- 	// Open the script
- 	//
--	m_ls = lua_open();
-+	m_ls = luaL_newstate();
-  
- 	luaL_openlibs(m_ls);
- 
- 	//
- 	// Load our own lua libs
- 	//
--	luaL_openlib(m_ls, "sysdig", ll_sysdig, 0);
--	luaL_openlib(m_ls, "chisel", ll_chisel, 0);
--	luaL_openlib(m_ls, "evt", ll_evt, 0);
-+	chisel_lua_registerlib(m_ls, "sysdig", ll_sysdig, 0);
-+	chisel_lua_registerlib(m_ls, "chisel", ll_chisel, 0);
-+	chisel_lua_registerlib(m_ls, "evt", ll_evt, 0);
- 
- 	//
- 	// Add our chisel paths to package.path
--- 
-2.6.2
-
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch b/meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch
new file mode 100644
index 0000000000..5c756294b9
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/fix-uint64-const.patch
@@ -0,0 +1,16 @@
+Fix x86 build
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/userspace/libsinsp/cgroup_limits.cpp
++++ b/userspace/libsinsp/cgroup_limits.cpp
+@@ -9,7 +9,7 @@ namespace {
+ // This reports extremely large values (e.g. almost-but-not-quite 9EiB as set by k8s) as unlimited.
+ // Note: we use the same maximum value for cpu shares/quotas as well; the typical values are much lower
+ // and so should never exceed CGROUP_VAL_MAX either
+-constexpr const int64_t CGROUP_VAL_MAX = (1UL << 42u) - 1;
++constexpr const int64_t CGROUP_VAL_MAX = (1ULL << 42u) - 1;
+ 
+ /**
+  * \brief Read a single int64_t value from cgroupfs
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 4f58281f9f..5817c4d533 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -3,39 +3,48 @@ DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
 system state and activity from a running Linux instance, then save, \
 filter and analyze."
 HOMEPAGE = "http://www.sysdig.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE = "Apache-2.0 & (MIT | GPL-2.0)"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8fee3d59797546cffab04f3b88b2d44"
 
 inherit cmake pkgconfig
 
-OECMAKE_GENERATOR = "Unix Makefiles"
+#OECMAKE_GENERATOR = "Unix Makefiles"
+JIT ?= "jit"
+JIT_mipsarchn32 = ""
+JIT_mipsarchn64 = ""
+JIT_aarch64 = ""
 
-DEPENDS = "luajit zlib ncurses"
+DEPENDS += "lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://github.com/draios/sysdig.git;branch=master \
-           file://0001-libsinsp-Port-to-build-with-lua-5.2.patch \
+SRC_URI = "git://github.com/draios/sysdig.git;branch=dev \
+           file://0001-fix-build-with-LuaJIT-2.1-betas.patch \
            file://0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch \
+           file://fix-uint64-const.patch \
           "
-SRCREV = "85d16f33a82a17f87ccdbc088749271c71d87013"
-PV = "0.1.102+git${SRCPV}"
+# v0.26.4
+SRCREV = "9fa0d129668fdabf256446be4be35838888052d9"
+PV = "0.26.5"
 
 S = "${WORKDIR}/git"
 
-DIR_ETC="/etc"
-EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
-                  -DUSE_BUNDLED_ZLIB="OFF" \
-                  -DBUILD_DRIVER="OFF" \
-                  -DUSE_BUNDLED_NCURSES="OFF" \
-                  -DDIR_ETC="${DIR_ETC}" \
-                '
+EXTRA_OECMAKE = "\
+                -DBUILD_DRIVER=OFF \
+                -DUSE_BUNDLED_DEPS=OFF \
+                -DUSE_BUNDLED_B64=ON \
+                -DCREATE_TEST_TARGETS=OFF \
+                -DDIR_ETC=${sysconfdir} \
+                -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
+                -DLUA_LIBRARY=libluajit-5.1.so \
+"
 
 FILES_${PN} += " \
     ${DIR_ETC}/* \
     ${datadir}/zsh/* \
     ${prefix}/src/*  \
 "
-
-# luajit not supported on Aarch64
-COMPATIBLE_HOST = "^(?!aarch64).*"
-
+# Use getaddrinfo_a is a GNU extension in libsinsp
+# It should be fixed in sysdig, until then disable
+# on musl
+# Something like this https://code.videolan.org/ePirat/vlc/-/commit/01fd9fe4c7f6c5558f7345f38abf0152e17853ab  is needed to fix it
+COMPATIBLE_HOST_libc-musl = "null"
-- 
2.25.1


