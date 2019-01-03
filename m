Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6E96A74813
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 18:08:01 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id y4so16300757pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2019 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cKiuPVTbPoaJtrFSx+aUSdpI+UzMXyqTaFQ9NzMzLUI=;
	b=JWdYuLuBPsM5kpnfhJ7dTnBG9x5ALGD1Mqm5OGC8K/mDkMCm30Y7Ji26ve5K/GZjrl
	50FXUdbB4hoCAoUJ4GxIpeXM9S6yBcHXGvGtKrp6PK8mZpU/2NF9PpMU0KGvk87hZwgK
	OZoWEwxn/5Nvg6GMCfQkAazXpM1YaqGM5k1OL3dQaH12Jm82UtANJyHotfVEpx5m6pL2
	uZvJzTgKG+iB/4GufB1rB2e9tiwaSz0bHDbdb5Mi+7C4TbPGVH+8mimRd1DPPwKuHMdP
	Yojc+So0r829YxSbsbVg3g9L/xvURVwTu4MHUmQpb4blj5DRt4cQ8wXkjs2S6oR8o+mN
	LdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cKiuPVTbPoaJtrFSx+aUSdpI+UzMXyqTaFQ9NzMzLUI=;
	b=Uy7TgMuNggAm7U73HWYfrNnJnslaUoYztp0bsECkqjuq+B/UscwCcsMiO3cWXR3zPx
	EcwtbXWCl4LuhcY9njX6S+ZsNDtM1n8EZwQImc3XEAClBWyjGEq7uAUv2bF7u0nfG9QD
	6F74najrCYz7MF/0rjy0NN9phXGNMABfeWQSXI0eX5NIm+dK/pfQGJb8uxm3EvJdJoE4
	qbuawSOD+wzNMdFLelmOLPBJ2JilfxqyqK2vRgE/j6BcN3gDrqRB3yTwSsE2X85UbQcv
	ZtET02QmU5eDQR21zEaPZGwfqQOO5PzijpL0QocCpFEFvSConN2cNsUCHlPexi1qTb4i
	o7xA==
X-Gm-Message-State: AJcUukfeiQ2TGObRzwUHGr+JK5E/KyUe8GOuGztWvumPtOc2K9u4HeuP
	J92+6/xbEpozLY3r67bg/thlBdERPkw=
X-Google-Smtp-Source: ALg8bN4Mggtrmfl+RntM7w5bWSPp46w0Guz8DOP+brp/TPliaDuH4sEyOZYPx8zX6iNtNF+oqTvU2A==
X-Received: by 2002:a63:ac46:: with SMTP id z6mr17903117pgn.162.1546538881693; 
	Thu, 03 Jan 2019 10:08:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	m67sm75487168pfm.73.2019.01.03.10.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 10:08:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 10:07:51 -0800
Message-Id: <20190103180751.24958-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103180751.24958-1-raj.khem@gmail.com>
References: <20190103180751.24958-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] sysdig: Upgrade to 0.24.1
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
X-List-Received-Date: Thu, 03 Jan 2019 18:08:01 -0000
Content-Transfer-Encoding: 8bit

* License changed to Apache-2.0 upstream as well [1]
* Forward port patches to apply on 0.24
* Just build libb64 from internal modules everything else should be
  provided by OE recipes
* Disable luajit on aarch64 and mips64 since luajit on these arches is
  not available, fall back to liblua

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...usl-backtrace-APIs-are-glibc-specifi.patch | 37 +++++++++----------
 ...-libsinsp-Port-to-build-with-lua-5.2.patch | 25 +++++--------
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 34 ++++++++---------
 3 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch
index 7d3f8a19d7..6ba436911a 100644
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
+@@ -772,6 +772,7 @@ bool sinsp_utils::glob_match(const char
  
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
+@@ -793,6 +794,7 @@ void sinsp_utils::bt(void)
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
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
index 8fec0ca59f..1c71b91fcc 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Port-to-build-with-lua-5.2.patch
@@ -8,38 +8,36 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  userspace/libsinsp/chisel.cpp | 40 +++++++++++++++++++++++++++++-----------
  1 file changed, 29 insertions(+), 11 deletions(-)
 
-diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
-index 3cfbd8d..2db9348 100644
 --- a/userspace/libsinsp/chisel.cpp
 +++ b/userspace/libsinsp/chisel.cpp
-@@ -94,7 +94,7 @@ void lua_stackdump(lua_State *L)
+@@ -97,7 +97,7 @@ void lua_stackdump(lua_State *L)
  // Lua callbacks
  ///////////////////////////////////////////////////////////////////////////////
  #ifdef HAS_LUA_CHISELS
--const static struct luaL_reg ll_sysdig [] = 
+-const static struct luaL_reg ll_sysdig [] =
 +const static struct luaL_Reg ll_sysdig [] =
  {
  	{"set_filter", &lua_cbacks::set_global_filter},
  	{"set_snaplen", &lua_cbacks::set_snaplen},
-@@ -120,7 +120,7 @@ const static struct luaL_reg ll_sysdig [] =
+@@ -133,7 +133,7 @@ const static struct luaL_reg ll_sysdig [
  	{NULL,NULL}
  };
  
--const static struct luaL_reg ll_chisel [] = 
+-const static struct luaL_reg ll_chisel [] =
 +const static struct luaL_Reg ll_chisel [] =
  {
  	{"request_field", &lua_cbacks::request_field},
  	{"set_filter", &lua_cbacks::set_filter},
-@@ -131,7 +131,7 @@ const static struct luaL_reg ll_chisel [] =
+@@ -145,7 +145,7 @@ const static struct luaL_reg ll_chisel [
  	{NULL,NULL}
  };
  
--const static struct luaL_reg ll_evt [] = 
+-const static struct luaL_reg ll_evt [] =
 +const static struct luaL_Reg ll_evt [] =
  {
  	{"field", &lua_cbacks::field},
  	{"get_num", &lua_cbacks::get_num},
-@@ -853,10 +853,28 @@ bool sinsp_chisel::parse_view_info(lua_State *ls, OUT chisel_desc* cd)
+@@ -959,10 +959,28 @@ bool sinsp_chisel::parse_view_info(lua_S
  
  
  #ifdef HAS_LUA_CHISELS
@@ -69,7 +67,7 @@ index 3cfbd8d..2db9348 100644
  	if(ls == NULL)
  	{
  		return false;
-@@ -867,9 +885,9 @@ bool sinsp_chisel::init_lua_chisel(chisel_desc &cd, string const &fpath)
+@@ -973,9 +991,9 @@ bool sinsp_chisel::init_lua_chisel(chise
  	//
  	// Load our own lua libs
  	//
@@ -82,13 +80,13 @@ index 3cfbd8d..2db9348 100644
  
  	//
  	// Add our chisel paths to package.path
-@@ -1111,16 +1129,16 @@ void sinsp_chisel::load(string cmdstr)
+@@ -1203,16 +1221,16 @@ void sinsp_chisel::load(string cmdstr)
  	//
  	// Open the script
  	//
 -	m_ls = lua_open();
 +	m_ls = luaL_newstate();
-  
+ 
  	luaL_openlibs(m_ls);
  
  	//
@@ -103,6 +101,3 @@ index 3cfbd8d..2db9348 100644
  
  	//
  	// Add our chisel paths to package.path
--- 
-2.6.2
-
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index 4f58281f9f..bbe25e8d43 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -3,39 +3,39 @@ DESCRIPTION = "Sysdig is open source, system-level exploration: capture \
 system state and activity from a running Linux instance, then save, \
 filter and analyze."
 HOMEPAGE = "http://www.sysdig.org/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8fee3d59797546cffab04f3b88b2d44"
 
 inherit cmake pkgconfig
 
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-DEPENDS = "luajit zlib ncurses"
+DEPENDS = "luajit zlib ncurses jsoncpp tbb jq openssl elfutils"
+DEPENDS_remove_mips64 = "luajit"
+DEPENDS_remove_aarch64 = "luajit"
+DEPENDS_append_aarch64 = " lua"
+DEPENDS_append_mips64 = " lua"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "git://github.com/draios/sysdig.git;branch=master \
+SRC_URI = "git://github.com/draios/sysdig.git;branch=dev \
            file://0001-libsinsp-Port-to-build-with-lua-5.2.patch \
            file://0001-Fix-build-with-musl-backtrace-APIs-are-glibc-specifi.patch \
           "
-SRCREV = "85d16f33a82a17f87ccdbc088749271c71d87013"
-PV = "0.1.102+git${SRCPV}"
+# v0.24.2
+SRCREV = "aa82b2fb329ea97a8ade31590954ddaa675e1728"
+PV = "0.24.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DIR_ETC="/etc"
-EXTRA_OECMAKE = ' -DUSE_BUNDLED_LUAJIT="OFF" \
-                  -DUSE_BUNDLED_ZLIB="OFF" \
-                  -DBUILD_DRIVER="OFF" \
-                  -DUSE_BUNDLED_NCURSES="OFF" \
-                  -DDIR_ETC="${DIR_ETC}" \
-                '
+EXTRA_OECMAKE = "\
+                -DUSE_BUNDLED_DEPS=OFF \
+                -DBUILD_DRIVER=OFF \
+                -DUSE_BUNDLED_B64=ON \
+                -DDIR_ETC=${sysconfdir} \
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
-- 
2.20.1


