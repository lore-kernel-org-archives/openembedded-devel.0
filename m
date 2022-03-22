Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874E1C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:53:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.6153.1647924791095136340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bheQzNYH;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso1128557pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SV0DmWucuuFsxpOVmGPNmG2t/04kEnmsb3jRN6ujSFo=;
        b=bheQzNYH/EKxsIhti//5tKdj02f3VigV5CVTbL8hzidESs9Ofb2WguoLswycXZMkHC
         5TuxcR9bUbFKlZmJ9Xi/f08hqyTJOl3BAufhZjqrv6K+ULx0zNt5+hytL7RelOBn0LuJ
         YYGyzbPjSmkccfNPBzE3oug5+bYasvRMCJdx3dlN+61wE1ujw7vFgcrzcxwFsR/BbNrM
         Vm1PhscQrqS+ku9jfIgml0ZUI8IkMYJcyp0R21CYVbQYR9UJ3+fwIK44G8eNyKA0/ym2
         PvIGOuBzfZ2pogoK9bXGbuiG8gOmSak60inENhLdt5E9agbF1m2pM8zOkT9tCiyzYFO7
         CYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SV0DmWucuuFsxpOVmGPNmG2t/04kEnmsb3jRN6ujSFo=;
        b=RbAccN3Z/75s7vWxtZbqfmiv6hJP2EhZ3VhOHRhY86TpHInVuq6RjdIVGzNxqXNeZo
         zVuQ3FcNUm2ifOtbDZbJMx5KeSgA13hu4S0lktItVVAttmblYOcBc1OBJ7RyjZ2qpo3t
         Rm0PHhuvQsYoqIfVTR1Q9c/m5bnVO8IkD9DKC4hVDNElgy56lKrc4SHGsVV24fTdLF8x
         l/SAk76+0Dr0GdzbVN/92bwsCdCDhWhQDy+lC3OjiF8b74jrfOXLfF/U9FbJHJX+I/gB
         2S9DATsESg86PfoD9OgOpHOF3mUFcd58nvItTF2vBP/AXZ9/JLlAhLYNFENFqy05Iojo
         78ig==
X-Gm-Message-State: AOAM532ZlY1CoRwXXu14vuzH8kG8jIGqX1mCzm3b8TCwvmkNEc293/Sx
	SyrRDB/sJPjaNlNW+MaKHp2LCzkYAx3iUA==
X-Google-Smtp-Source: 
 ABdhPJybvI7A/c3dX44YWSTudETpW/Ptbb6AjNUPVQj4eB95c7HSRrOayqrERO4gZWJos+D+GnnW4g==
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id
 q12-20020a17090311cc00b0015171e4dadcmr15955353plh.78.1647924790068;
        Mon, 21 Mar 2022 21:53:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm1039024pju.44.2022.03.21.21.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 21:53:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] sysdig: Upgrade to 0.28.0
Date: Mon, 21 Mar 2022 21:53:07 -0700
Message-Id: <20220322045307.2841335-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322045307.2841335-1-raj.khem@gmail.com>
References: <20220322045307.2841335-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 04:53:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96131

Drop patches, since they are not needed
Add a patch to define PROBE_NAME for CFLAGS
Disable sysdig for ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |   2 +-
 ...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch |  29 ++
 ...0001-fix-build-with-LuaJIT-2.1-betas.patch |  96 -----
 ...ot-of-Werror-format-security-errors-.patch | 155 --------
 .../sysdig/sysdig/aarch64.patch               | 359 ------------------
 .../{sysdig_git.bb => sysdig_0.28.0.bb}       |  21 +-
 6 files changed, 43 insertions(+), 619 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/aarch64.patch
 rename meta-oe/recipes-extended/sysdig/{sysdig_git.bb => sysdig_0.28.0.bb} (69%)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5992cdd950..52a82e8acd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -446,7 +446,7 @@ RDEPENDS:packagegroup-meta-oe-extended:remove:mipsarch = "upm mraa minifi-cpp ti
 RDEPENDS:packagegroup-meta-oe-extended:remove:mips = "sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc = "upm mraa minifi-cpp"
 RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc64 = "upm mraa minifi-cpp"
-RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc64le = "upm mraa"
+RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc64le = "upm mraa sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:riscv64 = "upm libleak libyang mraa sysdig tiptop"
 RDEPENDS:packagegroup-meta-oe-extended:remove:riscv32 = "upm libleak libyang mraa sysdig tiptop"
 
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
new file mode 100644
index 0000000000..903ccdf36a
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
@@ -0,0 +1,29 @@
+From ed8969a233adb6bf701de96d0fd0570e5ddcc787 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 21 Mar 2022 19:35:48 -0700
+Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS
+
+This helps compliation of driver code where its calling modprobe on the
+given kernel module via system() API
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7dceb7ae..e156c36f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -149,6 +149,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+ 	if(NOT DEFINED PROBE_NAME)
+ 		set(PROBE_NAME "scap")
+ 	endif()
++	add_definitions(-DPROBE_NAME="${PROBE_NAME}")
+ 
+ 	set(DRIVERS_REPO "https://download.sysdig.com/scap-drivers")
+ 	
+-- 
+2.35.1
+
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch
deleted file mode 100644
index 71b0b8c8b9..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-fix-build-with-LuaJIT-2.1-betas.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From ae82de664a6ba6ab2654adf9bed81f22b6fdc19d Mon Sep 17 00:00:00 2001
-From: Evgeni Golov <evgeni@golov.de>
-Date: Sun, 27 Aug 2017 13:51:19 +0200
-Subject: [PATCH] fix build with LuaJIT 2.1 betas
-
-LuaJIT 2.1 drops some compat symbols [1]. And while I think that this is
-wrong, as it breaks compatibility with Lua 5.1 [2], it is quite easy to
-adopt the code to work with both versions (2.0 and 2.1) of LuaJIT and
-remain Lua 5.1 compatible.
-
-[1] https://github.com/LuaJIT/LuaJIT/commit/dc320ca70f2c5bb3977b82853bcee6dad2523d01
-[2] https://github.com/LuaJIT/LuaJIT/issues/325
-
-Upstream-Status: Submitted [https://github.com/LuaJIT/LuaJIT/issues/325]
-Signed-off-by: Evgeni Golov <evgeni@golov.de>
-sysdig-CLA-1.0-signed-off-by: Evgeni Golov <evgeni@golov.de>
----
- CMakeLists.txt                        | 2 +-
- userspace/libsinsp/chisel.cpp         | 6 +++---
- userspace/libsinsp/lua_parser.cpp     | 2 +-
- userspace/libsinsp/lua_parser_api.cpp | 2 +-
- 4 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d7020493..33e524f5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -140,7 +140,7 @@ option(USE_BUNDLED_DEPS "Enable bundled dependencies instead of using the system
- option(USE_BUNDLED_LUAJIT "Enable building of the bundled LuaJIT" ${USE_BUNDLED_DEPS})
- 
- if(NOT USE_BUNDLED_LUAJIT)
--	find_path(LUAJIT_INCLUDE luajit.h PATH_SUFFIXES luajit-2.0 luajit)
-+	find_path(LUAJIT_INCLUDE luajit.h PATH_SUFFIXES luajit-2.1 luajit-2.0 luajit)
- 	find_library(LUAJIT_LIB NAMES luajit luajit-5.1)
- 	if(LUAJIT_INCLUDE AND LUAJIT_LIB)
- 		message(STATUS "Found LuaJIT: include: ${LUAJIT_INCLUDE}, lib: ${LUAJIT_LIB}")
-diff --git a/userspace/libsinsp/chisel.cpp b/userspace/libsinsp/chisel.cpp
-index 0a6e3cf8..0c2e255a 100644
---- a/userspace/libsinsp/chisel.cpp
-+++ b/userspace/libsinsp/chisel.cpp
-@@ -98,7 +98,7 @@ void lua_stackdump(lua_State *L)
- // Lua callbacks
- ///////////////////////////////////////////////////////////////////////////////
- #ifdef HAS_LUA_CHISELS
--const static struct luaL_reg ll_sysdig [] =
-+const static struct luaL_Reg ll_sysdig [] =
- {
- 	{"set_filter", &lua_cbacks::set_global_filter},
- 	{"set_snaplen", &lua_cbacks::set_snaplen},
-@@ -134,7 +134,7 @@ const static struct luaL_reg ll_sysdig [] =
- 	{NULL,NULL}
- };
- 
--const static struct luaL_reg ll_chisel [] =
-+const static struct luaL_Reg ll_chisel [] =
- {
- 	{"request_field", &lua_cbacks::request_field},
- 	{"set_filter", &lua_cbacks::set_filter},
-@@ -146,7 +146,7 @@ const static struct luaL_reg ll_chisel [] =
- 	{NULL,NULL}
- };
- 
--const static struct luaL_reg ll_evt [] =
-+const static struct luaL_Reg ll_evt [] =
- {
- 	{"field", &lua_cbacks::field},
- 	{"get_num", &lua_cbacks::get_num},
-diff --git a/userspace/libsinsp/lua_parser.cpp b/userspace/libsinsp/lua_parser.cpp
-index 0e26617d..78810d96 100644
---- a/userspace/libsinsp/lua_parser.cpp
-+++ b/userspace/libsinsp/lua_parser.cpp
-@@ -32,7 +32,7 @@ extern "C" {
- #include "lauxlib.h"
- }
- 
--const static struct luaL_reg ll_filter [] =
-+const static struct luaL_Reg ll_filter [] =
- {
- 	{"rel_expr", &lua_parser_cbacks::rel_expr},
- 	{"bool_op", &lua_parser_cbacks::bool_op},
-diff --git a/userspace/libsinsp/lua_parser_api.cpp b/userspace/libsinsp/lua_parser_api.cpp
-index c89e9126..e0169fe1 100644
---- a/userspace/libsinsp/lua_parser_api.cpp
-+++ b/userspace/libsinsp/lua_parser_api.cpp
-@@ -266,7 +266,7 @@ int lua_parser_cbacks::rel_expr(lua_State *ls)
- 					string err = "Got non-table as in-expression operand\n";
- 					throw sinsp_exception("parser API error");
- 				}
--				int n = luaL_getn(ls, 4);  /* get size of table */
-+				int n = (int)lua_objlen(ls, 4);  /* get size of table */
- 				for (i=1; i<=n; i++)
- 				{
- 					lua_rawgeti(ls, 4, i);
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch
deleted file mode 100644
index 055b0c1c29..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From a5c8e2676b94d2ea41b44b4e05943bee6459f337 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Oct 2021 09:46:35 -0700
-Subject: [PATCH] libsinsp: Fix a lot of -Werror=format-security errors with
- mvprintw/mvwprintw
-
-In all these places a non-constant is used as a format string which
-compiler complains about. Fix by using "%s" as format.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- userspace/libsinsp/cursescomponents.cpp |  4 ++--
- userspace/libsinsp/cursesspectro.cpp    |  2 +-
- userspace/libsinsp/cursestable.cpp      |  6 +++---
- userspace/libsinsp/cursesui.cpp         | 14 +++++++-------
- 4 files changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/userspace/libsinsp/cursescomponents.cpp b/userspace/libsinsp/cursescomponents.cpp
-index 4003cb4e..372b4526 100644
---- a/userspace/libsinsp/cursescomponents.cpp
-+++ b/userspace/libsinsp/cursescomponents.cpp
-@@ -877,7 +877,7 @@ void curses_textbox::print_no_data()
- 	string wstr = "No Data For This Selection";
- 	mvprintw(m_parent->m_screenh / 2,
- 		m_parent->m_screenw / 2 - wstr.size() / 2,
--		wstr.c_str());
-+		"%s", wstr.c_str());
- 
- 	refresh();
- }
-@@ -1100,7 +1100,7 @@ void curses_textbox::render()
- 		attrset(m_parent->m_colors[sinsp_cursesui::LARGE_NUMBER]);
- 		mvprintw(0,
- 			m_parent->m_screenw / 2 - wstr.size() / 2,
--			wstr.c_str());
-+			"%s", wstr.c_str());
- 	}
- 
- 	//
-diff --git a/userspace/libsinsp/cursesspectro.cpp b/userspace/libsinsp/cursesspectro.cpp
-index 6858bc95..32012963 100644
---- a/userspace/libsinsp/cursesspectro.cpp
-+++ b/userspace/libsinsp/cursesspectro.cpp
-@@ -227,7 +227,7 @@ void curses_spectro::print_error(string wstr)
- 	mvwprintw(m_tblwin, 
- 		m_parent->m_screenh / 2,
- 		m_parent->m_screenw / 2 - wstr.size() / 2, 
--		wstr.c_str());	
-+		"%s", wstr.c_str());	
- }
- 
- void curses_spectro::update_data(vector<sinsp_sample_row>* data, bool force_selection_change)
-diff --git a/userspace/libsinsp/cursestable.cpp b/userspace/libsinsp/cursestable.cpp
-index 69c2aa32..54667554 100644
---- a/userspace/libsinsp/cursestable.cpp
-+++ b/userspace/libsinsp/cursestable.cpp
-@@ -254,7 +254,7 @@ void curses_table::print_line_centered(string line, int32_t off)
- 		mvwprintw(m_tblwin, 
- 			m_parent->m_screenh / 2 + off,
- 			m_parent->m_screenw / 2 - line.size() / 2, 
--			line.c_str());
-+			"%s", line.c_str());
- 	}
- 	else
- 	{
-@@ -268,7 +268,7 @@ glogf("2, %d %s\n", spos, ss.c_str());
- 			mvwprintw(m_tblwin, 
- 				m_parent->m_screenh / 2 + off + j,
- 				0,
--				ss.c_str());
-+				"%s", ss.c_str());
- 
- 			spos += m_parent->m_screenw;
- 			if(spos >= line.size())
-@@ -328,7 +328,7 @@ void curses_table::print_error(string wstr)
- 	mvwprintw(m_tblwin, 
- 		m_parent->m_screenh / 2,
- 		m_parent->m_screenw / 2 - wstr.size() / 2, 
--		wstr.c_str());	
-+		"%s", wstr.c_str());	
- }
- 
- void curses_table::render(bool data_changed)
-diff --git a/userspace/libsinsp/cursesui.cpp b/userspace/libsinsp/cursesui.cpp
-index 1eeb0864..69652edc 100644
---- a/userspace/libsinsp/cursesui.cpp
-+++ b/userspace/libsinsp/cursesui.cpp
-@@ -825,7 +825,7 @@ void sinsp_cursesui::render_header()
- 		attrset(m_colors[sinsp_cursesui::LARGE_NUMBER]);
- 		mvprintw(0,
- 			m_screenw / 2 - wstr.size() / 2, 
--			wstr.c_str());	
-+			"%s", wstr.c_str());	
- 	}
- 
- 	//
-@@ -1123,7 +1123,7 @@ void sinsp_cursesui::render_filtersearch_main_menu()
- 
- 		m_cursor_pos = cursor_pos;
- 
--		mvprintw(m_screenh - 1, m_cursor_pos, str->c_str());
-+		mvprintw(m_screenh - 1, m_cursor_pos, "%s", str->c_str());
- 
- 		m_cursor_pos += str->size();
- 	}
-@@ -2189,7 +2189,7 @@ void sinsp_cursesui::print_progress(double progress)
- 	string wstr = "Processing File";
- 	mvprintw(m_screenh / 2,
- 		m_screenw / 2 - wstr.size() / 2, 
--		wstr.c_str());	
-+		"%s", wstr.c_str());	
- 
- 	//
- 	// Using sprintf because to_string doesn't support setting the precision 
-@@ -2199,7 +2199,7 @@ void sinsp_cursesui::print_progress(double progress)
- 	wstr = "Progress: " + string(numbuf);
- 	mvprintw(m_screenh / 2 + 1,
- 		m_screenw / 2 - wstr.size() / 2, 
--		wstr.c_str());
-+		"%s", wstr.c_str());
- 
- 	refresh();
- }
-@@ -2308,7 +2308,7 @@ sysdig_table_action sinsp_cursesui::handle_textbox_input(int ch)
- 						attrset(m_colors[sinsp_cursesui::FAILED_SEARCH]);
- 						mvprintw(m_screenh / 2,
- 							m_screenw / 2 - wstr.size() / 2, 
--							wstr.c_str());	
-+							"%s", wstr.c_str());	
- 
- 						//
- 						// Restore the cursor
-@@ -2363,7 +2363,7 @@ sysdig_table_action sinsp_cursesui::handle_textbox_input(int ch)
- 
- 					mvprintw(m_screenh / 2,
- 						m_screenw / 2 - wstr.size() / 2, 
--						wstr.c_str());
-+						"%s", wstr.c_str());
- 
- 					render();
- 				}
-@@ -2436,7 +2436,7 @@ sysdig_table_action sinsp_cursesui::handle_textbox_input(int ch)
- 
- 				mvprintw(m_screenh / 2,
- 					m_screenw / 2 - wstr.size() / 2, 
--					wstr.c_str());
-+					"%s", wstr.c_str());
- 
- 				render();
- 			}
--- 
-2.33.1
-
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/aarch64.patch b/meta-oe/recipes-extended/sysdig/sysdig/aarch64.patch
deleted file mode 100644
index f16b0eca50..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/aarch64.patch
+++ /dev/null
@@ -1,359 +0,0 @@
-Check if legacy syscalls exist
-
-A lot of legacy syscalls are replaced with *at and are not implemented in newer
-architectures like aarch64
-
-Upstream-Status: Submitted [https://github.com/draios/sysdig/pull/1601]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/driver/syscall_table.c
-+++ b/driver/syscall_table.c
-@@ -42,26 +42,46 @@ or GPL2.txt for full copies of the licen
-  * SYSCALL TABLE
-  */
- const struct syscall_evt_pair g_syscall_table[SYSCALL_TABLE_SIZE] = {
-+#ifdef __NR_open
- 	[__NR_open - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_OPEN_E, PPME_SYSCALL_OPEN_X},
-+#endif
-+#ifdef __NR_creat
- 	[__NR_creat - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_CREAT_E, PPME_SYSCALL_CREAT_X},
-+#endif
- 	[__NR_close - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_CLOSE_E, PPME_SYSCALL_CLOSE_X},
- 	[__NR_brk - SYSCALL_TABLE_ID0] =                        {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_BRK_4_E, PPME_SYSCALL_BRK_4_X},
- 	[__NR_read - SYSCALL_TABLE_ID0] =                       {UF_USED, PPME_SYSCALL_READ_E, PPME_SYSCALL_READ_X},
- 	[__NR_write - SYSCALL_TABLE_ID0] =                      {UF_USED, PPME_SYSCALL_WRITE_E, PPME_SYSCALL_WRITE_X},
- 	[__NR_execve - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_EXECVE_19_E, PPME_SYSCALL_EXECVE_19_X},
- 	[__NR_clone - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_CLONE_20_E, PPME_SYSCALL_CLONE_20_X},
-+#ifdef __NR_fork
- 	[__NR_fork - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_FORK_20_E, PPME_SYSCALL_FORK_20_X},
-+#endif
-+#ifdef __NR_vfork
- 	[__NR_vfork - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_VFORK_20_E, PPME_SYSCALL_VFORK_20_X},
-+#endif
-+#ifdef __NR_pipe
- 	[__NR_pipe - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_PIPE_E, PPME_SYSCALL_PIPE_X},
-+#endif
- 	[__NR_pipe2 - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_PIPE_E, PPME_SYSCALL_PIPE_X},
-+#ifdef __NR_eventfd
- 	[__NR_eventfd - SYSCALL_TABLE_ID0] =                    {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_EVENTFD_E, PPME_SYSCALL_EVENTFD_X},
-+#endif
- 	[__NR_eventfd2 - SYSCALL_TABLE_ID0] =                   {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_EVENTFD_E, PPME_SYSCALL_EVENTFD_X},
- 	[__NR_futex - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_FUTEX_E, PPME_SYSCALL_FUTEX_X},
-+#ifdef __NR_stat
- 	[__NR_stat - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_STAT_E, PPME_SYSCALL_STAT_X},
-+#endif
-+#ifdef __NR_lstat
- 	[__NR_lstat - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_LSTAT_E, PPME_SYSCALL_LSTAT_X},
-+#endif
- 	[__NR_fstat - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_FSTAT_E, PPME_SYSCALL_FSTAT_X},
-+#ifdef __NR_epoll_wait
- 	[__NR_epoll_wait - SYSCALL_TABLE_ID0] =                 {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_EPOLLWAIT_E, PPME_SYSCALL_EPOLLWAIT_X},
-+#endif
-+#ifdef __NR_poll
- 	[__NR_poll - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_POLL_E, PPME_SYSCALL_POLL_X},
-+#endif
- #ifdef __NR_select
- 	[__NR_select - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_SELECT_E, PPME_SYSCALL_SELECT_X},
- #endif
-@@ -70,13 +90,21 @@ const struct syscall_evt_pair g_syscall_
- 	[__NR_getcwd - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_GETCWD_E, PPME_SYSCALL_GETCWD_X},
- 	[__NR_chdir - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_CHDIR_E, PPME_SYSCALL_CHDIR_X},
- 	[__NR_fchdir - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_FCHDIR_E, PPME_SYSCALL_FCHDIR_X},
-+#ifdef __NR_mkdir
- 	[__NR_mkdir - SYSCALL_TABLE_ID0] =                      {UF_USED, PPME_SYSCALL_MKDIR_2_E, PPME_SYSCALL_MKDIR_2_X},
-+#endif
-+#ifdef __NR_rmdir
- 	[__NR_rmdir - SYSCALL_TABLE_ID0] =                      {UF_USED, PPME_SYSCALL_RMDIR_2_E, PPME_SYSCALL_RMDIR_2_X},
-+#endif
- 	[__NR_openat - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_OPENAT_2_E, PPME_SYSCALL_OPENAT_2_X},
- 	[__NR_mkdirat - SYSCALL_TABLE_ID0] =                    {UF_USED, PPME_SYSCALL_MKDIRAT_E, PPME_SYSCALL_MKDIRAT_X},
-+#ifdef __NR_link
- 	[__NR_link - SYSCALL_TABLE_ID0] =                       {UF_USED, PPME_SYSCALL_LINK_2_E, PPME_SYSCALL_LINK_2_X},
-+#endif
- 	[__NR_linkat - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_SYSCALL_LINKAT_2_E, PPME_SYSCALL_LINKAT_2_X},
-+#ifdef __NR_unlink
- 	[__NR_unlink - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_SYSCALL_UNLINK_2_E, PPME_SYSCALL_UNLINK_2_X},
-+#endif
- 	[__NR_unlinkat - SYSCALL_TABLE_ID0] =                   {UF_USED, PPME_SYSCALL_UNLINKAT_2_E, PPME_SYSCALL_UNLINKAT_2_X},
- 	[__NR_pread64 - SYSCALL_TABLE_ID0] =                    {UF_USED, PPME_SYSCALL_PREAD_E, PPME_SYSCALL_PREAD_X},
- 	[__NR_pwrite64 - SYSCALL_TABLE_ID0] =                   {UF_USED, PPME_SYSCALL_PWRITE_E, PPME_SYSCALL_PWRITE_X},
-@@ -85,16 +113,22 @@ const struct syscall_evt_pair g_syscall_
- 	[__NR_preadv - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_SYSCALL_PREADV_E, PPME_SYSCALL_PREADV_X},
- 	[__NR_pwritev - SYSCALL_TABLE_ID0] =                    {UF_USED, PPME_SYSCALL_PWRITEV_E, PPME_SYSCALL_PWRITEV_X},
- 	[__NR_dup - SYSCALL_TABLE_ID0] =                        {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_DUP_E, PPME_SYSCALL_DUP_X},
-+#ifdef __NR_dup2
- 	[__NR_dup2 - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_DUP_E, PPME_SYSCALL_DUP_X},
-+#endif
- 	[__NR_dup3 - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SYSCALL_DUP_E, PPME_SYSCALL_DUP_X},
-+#ifdef __NR_signalfd
- 	[__NR_signalfd - SYSCALL_TABLE_ID0] =                   {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_SIGNALFD_E, PPME_SYSCALL_SIGNALFD_X},
-+#endif
- 	[__NR_signalfd4 - SYSCALL_TABLE_ID0] =                  {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_SIGNALFD_E, PPME_SYSCALL_SIGNALFD_X},
- 	[__NR_kill - SYSCALL_TABLE_ID0] =                       {UF_USED, PPME_SYSCALL_KILL_E, PPME_SYSCALL_KILL_X},
- 	[__NR_tkill - SYSCALL_TABLE_ID0] =                      {UF_USED, PPME_SYSCALL_TKILL_E, PPME_SYSCALL_TKILL_X},
- 	[__NR_tgkill - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_SYSCALL_TGKILL_E, PPME_SYSCALL_TGKILL_X},
- 	[__NR_nanosleep - SYSCALL_TABLE_ID0] =                  {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_NANOSLEEP_E, PPME_SYSCALL_NANOSLEEP_X},
- 	[__NR_timerfd_create - SYSCALL_TABLE_ID0] =             {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_TIMERFD_CREATE_E, PPME_SYSCALL_TIMERFD_CREATE_X},
-+#ifdef __NR_inotify_init
- 	[__NR_inotify_init - SYSCALL_TABLE_ID0] =               {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_INOTIFY_INIT_E, PPME_SYSCALL_INOTIFY_INIT_X},
-+#endif
- 	[__NR_inotify_init1 - SYSCALL_TABLE_ID0] =              {UF_USED | UF_NEVER_DROP, PPME_SYSCALL_INOTIFY_INIT_E, PPME_SYSCALL_INOTIFY_INIT_X},
- 	[__NR_fchmodat - SYSCALL_TABLE_ID0] =                   {UF_USED, PPME_SYSCALL_FCHMODAT_E, PPME_SYSCALL_FCHMODAT_X},
- 	[__NR_fchmod - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_SYSCALL_FCHMOD_E, PPME_SYSCALL_FCHMOD_X},
-@@ -114,14 +148,22 @@ const struct syscall_evt_pair g_syscall_
- #endif
- /* [__NR_old_select - SYSCALL_TABLE_ID0] =	{UF_USED, PPME_GENERIC_E, PPME_GENERIC_X}, */
- 	[__NR_pselect6 - SYSCALL_TABLE_ID0] =                   {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
-+#ifdef __NR_epoll_create
- 	[__NR_epoll_create - SYSCALL_TABLE_ID0] =               {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
-+#endif
- 	[__NR_epoll_ctl - SYSCALL_TABLE_ID0] =                  {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
-+#ifdef __NR_uselib
- 	[__NR_uselib - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
-+#endif
- 	[__NR_sched_setparam - SYSCALL_TABLE_ID0] =             {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
- 	[__NR_sched_getparam - SYSCALL_TABLE_ID0] =             {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
- 	[__NR_syslog - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
-+#ifdef __NR_chmod
- 	[__NR_chmod - SYSCALL_TABLE_ID0] =                      {UF_USED, PPME_SYSCALL_CHMOD_E, PPME_SYSCALL_CHMOD_X},
-+#endif
-+#ifdef __NR_lchown
- 	[__NR_lchown - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_GENERIC_E, PPME_GENERIC_X},
-+#endif
- #ifdef __NR_utime
- 	[__NR_utime - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
- #endif
-@@ -131,8 +173,9 @@ const struct syscall_evt_pair g_syscall_
- #ifdef __NR_alarm
- 	[__NR_alarm - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
- #endif
-+#ifdef __NR_pause
- 	[__NR_pause - SYSCALL_TABLE_ID0] =                      {UF_USED | UF_ALWAYS_DROP, PPME_GENERIC_E, PPME_GENERIC_X},
--
-+#endif
- #ifndef __NR_socketcall
- 	[__NR_socket - SYSCALL_TABLE_ID0] =                     {UF_USED | UF_NEVER_DROP | UF_SIMPLEDRIVER_KEEP, PPME_SOCKET_SOCKET_E, PPME_SOCKET_SOCKET_X},
- 	[__NR_bind - SYSCALL_TABLE_ID0] =                       {UF_USED | UF_NEVER_DROP, PPME_SOCKET_BIND_E,  PPME_SOCKET_BIND_X},
-@@ -184,9 +227,13 @@ const struct syscall_evt_pair g_syscall_
- 	[__NR_process_vm_writev - SYSCALL_TABLE_ID0] =          {UF_USED, PPME_GENERIC_E, PPME_GENERIC_X},
- #endif
- 
-+#ifdef __NR_rename
- 	[__NR_rename - SYSCALL_TABLE_ID0] =                     {UF_USED, PPME_SYSCALL_RENAME_E, PPME_SYSCALL_RENAME_X},
-+#endif
- 	[__NR_renameat - SYSCALL_TABLE_ID0] =                   {UF_USED, PPME_SYSCALL_RENAMEAT_E, PPME_SYSCALL_RENAMEAT_X},
-+#ifdef __NR_symlink
- 	[__NR_symlink - SYSCALL_TABLE_ID0] =                    {UF_USED, PPME_SYSCALL_SYMLINK_E, PPME_SYSCALL_SYMLINK_X},
-+#endif
- 	[__NR_symlinkat - SYSCALL_TABLE_ID0] =                  {UF_USED, PPME_SYSCALL_SYMLINKAT_E, PPME_SYSCALL_SYMLINKAT_X},
- 	[__NR_sendfile - SYSCALL_TABLE_ID0] =                   {UF_USED, PPME_SYSCALL_SENDFILE_E, PPME_SYSCALL_SENDFILE_X},
- #ifdef __NR_sendfile64
-@@ -255,7 +302,9 @@ const struct syscall_evt_pair g_syscall_
- #ifdef __NR_getresgid32
- 	[__NR_getresgid32 - SYSCALL_TABLE_ID0] =                {UF_USED, PPME_SYSCALL_GETRESGID_E, PPME_SYSCALL_GETRESGID_X },
- #endif
-+#ifdef __NR_getdents
- 	[__NR_getdents - SYSCALL_TABLE_ID0] =                   {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_GETDENTS_E, PPME_SYSCALL_GETDENTS_X},
-+#endif
- 	[__NR_getdents64 - SYSCALL_TABLE_ID0] =                 {UF_USED | UF_ALWAYS_DROP, PPME_SYSCALL_GETDENTS64_E, PPME_SYSCALL_GETDENTS64_X},
- #ifdef __NR_setns
- 	[__NR_setns - SYSCALL_TABLE_ID0] =                      {UF_USED, PPME_SYSCALL_SETNS_E, PPME_SYSCALL_SETNS_X},
-@@ -298,19 +347,33 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_exit - SYSCALL_TABLE_ID0] = PPM_SC_EXIT,
- 	[__NR_read - SYSCALL_TABLE_ID0] = PPM_SC_READ,
- 	[__NR_write - SYSCALL_TABLE_ID0] = PPM_SC_WRITE,
-+#ifdef __NR_open
- 	[__NR_open - SYSCALL_TABLE_ID0] = PPM_SC_OPEN,
-+#endif
- 	[__NR_close - SYSCALL_TABLE_ID0] = PPM_SC_CLOSE,
-+#ifdef __NR_creat
- 	[__NR_creat - SYSCALL_TABLE_ID0] = PPM_SC_CREAT,
-+#endif
-+#ifdef __NR_link
- 	[__NR_link - SYSCALL_TABLE_ID0] = PPM_SC_LINK,
-+#endif
-+#ifdef __NR_unlink
- 	[__NR_unlink - SYSCALL_TABLE_ID0] = PPM_SC_UNLINK,
-+#endif
- 	[__NR_chdir - SYSCALL_TABLE_ID0] = PPM_SC_CHDIR,
- #ifdef __NR_time
- 	[__NR_time - SYSCALL_TABLE_ID0] = PPM_SC_TIME,
- #endif
-+#ifdef __NR_mknod
- 	[__NR_mknod - SYSCALL_TABLE_ID0] = PPM_SC_MKNOD,
-+#endif
-+#ifdef __NR_chmod
- 	[__NR_chmod - SYSCALL_TABLE_ID0] = PPM_SC_CHMOD,
-+#endif
- /* [__NR_lchown16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_LCHOWN16, */
-+#ifdef __NR_stat
- 	[__NR_stat - SYSCALL_TABLE_ID0] = PPM_SC_STAT,
-+#endif
- 	[__NR_lseek - SYSCALL_TABLE_ID0] = PPM_SC_LSEEK,
- 	[__NR_getpid - SYSCALL_TABLE_ID0] = PPM_SC_GETPID,
- 	[__NR_mount - SYSCALL_TABLE_ID0] = PPM_SC_MOUNT,
-@@ -322,17 +385,27 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_alarm - SYSCALL_TABLE_ID0] = PPM_SC_ALARM,
- #endif
- 	[__NR_fstat - SYSCALL_TABLE_ID0] = PPM_SC_FSTAT,
-+#ifdef __NR_pause
- 	[__NR_pause - SYSCALL_TABLE_ID0] = PPM_SC_PAUSE,
-+#endif
- #ifdef __NR_utime
- 	[__NR_utime - SYSCALL_TABLE_ID0] = PPM_SC_UTIME,
- #endif
- 	[__NR_sync - SYSCALL_TABLE_ID0] = PPM_SC_SYNC,
- 	[__NR_kill - SYSCALL_TABLE_ID0] = PPM_SC_KILL,
-+#ifdef __NR_rename
- 	[__NR_rename - SYSCALL_TABLE_ID0] = PPM_SC_RENAME,
-+#endif
-+#ifdef __NR_mkdir
- 	[__NR_mkdir - SYSCALL_TABLE_ID0] = PPM_SC_MKDIR,
-+#endif
-+#ifdef __NR_rmdir
- 	[__NR_rmdir - SYSCALL_TABLE_ID0] = PPM_SC_RMDIR,
-+#endif
- 	[__NR_dup - SYSCALL_TABLE_ID0] = PPM_SC_DUP,
-+#ifdef __NR_pipe
- 	[__NR_pipe - SYSCALL_TABLE_ID0] = PPM_SC_PIPE,
-+#endif
- 	[__NR_times - SYSCALL_TABLE_ID0] = PPM_SC_TIMES,
- 	[__NR_brk - SYSCALL_TABLE_ID0] = PPM_SC_BRK,
- /* [__NR_setgid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_SETGID16, */
-@@ -345,10 +418,16 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_setpgid - SYSCALL_TABLE_ID0] = PPM_SC_SETPGID,
- 	[__NR_umask - SYSCALL_TABLE_ID0] = PPM_SC_UMASK,
- 	[__NR_chroot - SYSCALL_TABLE_ID0] = PPM_SC_CHROOT,
-+#ifdef __NR_ustat
- 	[__NR_ustat - SYSCALL_TABLE_ID0] = PPM_SC_USTAT,
-+#endif
-+#ifdef __NR_dup2
- 	[__NR_dup2 - SYSCALL_TABLE_ID0] = PPM_SC_DUP2,
-+#endif
- 	[__NR_getppid - SYSCALL_TABLE_ID0] = PPM_SC_GETPPID,
-+#ifdef __NR_getpgrp
- 	[__NR_getpgrp - SYSCALL_TABLE_ID0] = PPM_SC_GETPGRP,
-+#endif
- 	[__NR_setsid - SYSCALL_TABLE_ID0] = PPM_SC_SETSID,
- 	[__NR_sethostname - SYSCALL_TABLE_ID0] = PPM_SC_SETHOSTNAME,
- 	[__NR_setrlimit - SYSCALL_TABLE_ID0] = PPM_SC_SETRLIMIT,
-@@ -359,10 +438,18 @@ const enum ppm_syscall_code g_syscall_co
- /* [__NR_getgroups16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_GETGROUPS16, */
- /* [__NR_setgroups16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_SETGROUPS16, */
- /* [__NR_old_select - SYSCALL_TABLE_ID0] = PPM_SC_NR_OLD_SELECT, */
-+#ifdef __NR_symlink
- 	[__NR_symlink - SYSCALL_TABLE_ID0] = PPM_SC_SYMLINK,
-+#endif
-+#ifdef __NR_lstat
- 	[__NR_lstat - SYSCALL_TABLE_ID0] = PPM_SC_LSTAT,
-+#endif
-+#ifdef __NR_readlink
- 	[__NR_readlink - SYSCALL_TABLE_ID0] = PPM_SC_READLINK,
-+#endif
-+#ifdef __NR_uselib
- 	[__NR_uselib - SYSCALL_TABLE_ID0] = PPM_SC_USELIB,
-+#endif
- 	[__NR_swapon - SYSCALL_TABLE_ID0] = PPM_SC_SWAPON,
- 	[__NR_reboot - SYSCALL_TABLE_ID0] = PPM_SC_REBOOT,
- /* [__NR_old_readdir - SYSCALL_TABLE_ID0] = PPM_SC_NR_OLD_READDIR, */
-@@ -399,12 +486,16 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_delete_module - SYSCALL_TABLE_ID0] = PPM_SC_DELETE_MODULE,
- 	[__NR_getpgid - SYSCALL_TABLE_ID0] = PPM_SC_GETPGID,
- 	[__NR_fchdir - SYSCALL_TABLE_ID0] = PPM_SC_FCHDIR,
-+#ifdef __NR_sysfs
- 	[__NR_sysfs - SYSCALL_TABLE_ID0] = PPM_SC_SYSFS,
-+#endif
- 	[__NR_personality - SYSCALL_TABLE_ID0] = PPM_SC_PERSONALITY,
- /* [__NR_setfsuid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_SETFSUID16, */
- /* [__NR_setfsgid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_SETFSGID16, */
- /* [__NR_llseek - SYSCALL_TABLE_ID0] = PPM_SC_NR_LLSEEK, */
-+#ifdef __NR_getdents
- 	[__NR_getdents - SYSCALL_TABLE_ID0] = PPM_SC_GETDENTS,
-+#endif
- #ifdef __NR_select
- 	[__NR_select - SYSCALL_TABLE_ID0] = PPM_SC_SELECT,
- #endif
-@@ -431,7 +522,9 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_mremap - SYSCALL_TABLE_ID0] = PPM_SC_MREMAP,
- /* [__NR_setresuid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_SETRESUID16, */
- /* [__NR_getresuid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_GETRESUID16, */
-+#ifdef __NR_poll
- 	[__NR_poll - SYSCALL_TABLE_ID0] = PPM_SC_POLL,
-+#endif
- /* [__NR_setresgid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_SETRESGID16, */
- /* [__NR_getresgid16 - SYSCALL_TABLE_ID0] = PPM_SC_NR_GETRESGID16, */
- 	[__NR_prctl - SYSCALL_TABLE_ID0] = PPM_SC_PRCTL,
-@@ -453,13 +546,17 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_getrlimit - SYSCALL_TABLE_ID0] = PPM_SC_GETRLIMIT,
- #endif
- /* [__NR_mmap_pgoff - SYSCALL_TABLE_ID0] = PPM_SC_NR_MMAP_PGOFF, */
-+#ifdef __NR_lchown
- 	[__NR_lchown - SYSCALL_TABLE_ID0] = PPM_SC_LCHOWN,
-+#endif
- 	[__NR_setreuid - SYSCALL_TABLE_ID0] = PPM_SC_SETREUID,
- 	[__NR_setregid - SYSCALL_TABLE_ID0] = PPM_SC_SETREGID,
- 	[__NR_getgroups - SYSCALL_TABLE_ID0] = PPM_SC_GETGROUPS,
- 	[__NR_setgroups - SYSCALL_TABLE_ID0] = PPM_SC_SETGROUPS,
- 	[__NR_fchown - SYSCALL_TABLE_ID0] = PPM_SC_FCHOWN,
-+#ifdef __NR_chown
- 	[__NR_chown - SYSCALL_TABLE_ID0] = PPM_SC_CHOWN,
-+#endif
- 	[__NR_setfsuid - SYSCALL_TABLE_ID0] = PPM_SC_SETFSUID,
- 	[__NR_setfsgid - SYSCALL_TABLE_ID0] = PPM_SC_SETFSGID,
- 	[__NR_pivot_root - SYSCALL_TABLE_ID0] = PPM_SC_PIVOT_ROOT,
-@@ -494,9 +591,13 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_io_submit - SYSCALL_TABLE_ID0] = PPM_SC_IO_SUBMIT,
- 	[__NR_io_cancel - SYSCALL_TABLE_ID0] = PPM_SC_IO_CANCEL,
- 	[__NR_exit_group - SYSCALL_TABLE_ID0] = PPM_SC_EXIT_GROUP,
-+#ifdef __NR_epoll_create
- 	[__NR_epoll_create - SYSCALL_TABLE_ID0] = PPM_SC_EPOLL_CREATE,
-+#endif
- 	[__NR_epoll_ctl - SYSCALL_TABLE_ID0] = PPM_SC_EPOLL_CTL,
-+#ifdef __NR_epoll_wait
- 	[__NR_epoll_wait - SYSCALL_TABLE_ID0] = PPM_SC_EPOLL_WAIT,
-+#endif
- 	[__NR_remap_file_pages - SYSCALL_TABLE_ID0] = PPM_SC_REMAP_FILE_PAGES,
- 	[__NR_set_tid_address - SYSCALL_TABLE_ID0] = PPM_SC_SET_TID_ADDRESS,
- 	[__NR_timer_create - SYSCALL_TABLE_ID0] = PPM_SC_TIMER_CREATE,
-@@ -509,7 +610,9 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_clock_getres - SYSCALL_TABLE_ID0] = PPM_SC_CLOCK_GETRES,
- 	[__NR_clock_nanosleep - SYSCALL_TABLE_ID0] = PPM_SC_CLOCK_NANOSLEEP,
- 	[__NR_tgkill - SYSCALL_TABLE_ID0] = PPM_SC_TGKILL,
-+#ifdef __NR_utimes
- 	[__NR_utimes - SYSCALL_TABLE_ID0] = PPM_SC_UTIMES,
-+#endif
- 	[__NR_mq_open - SYSCALL_TABLE_ID0] = PPM_SC_MQ_OPEN,
- 	[__NR_mq_unlink - SYSCALL_TABLE_ID0] = PPM_SC_MQ_UNLINK,
- 	[__NR_mq_timedsend - SYSCALL_TABLE_ID0] = PPM_SC_MQ_TIMEDSEND,
-@@ -523,14 +626,18 @@ const enum ppm_syscall_code g_syscall_co
- 	[__NR_keyctl - SYSCALL_TABLE_ID0] = PPM_SC_KEYCTL,
- 	[__NR_ioprio_set - SYSCALL_TABLE_ID0] = PPM_SC_IOPRIO_SET,
- 	[__NR_ioprio_get - SYSCALL_TABLE_ID0] = PPM_SC_IOPRIO_GET,
-+#ifdef __NR_inotify_init
- 	[__NR_inotify_init - SYSCALL_TABLE_ID0] = PPM_SC_INOTIFY_INIT,
-+#endif
- 	[__NR_inotify_add_watch - SYSCALL_TABLE_ID0] = PPM_SC_INOTIFY_ADD_WATCH,
- 	[__NR_inotify_rm_watch - SYSCALL_TABLE_ID0] = PPM_SC_INOTIFY_RM_WATCH,
- 	[__NR_openat - SYSCALL_TABLE_ID0] = PPM_SC_OPENAT,
- 	[__NR_mkdirat - SYSCALL_TABLE_ID0] = PPM_SC_MKDIRAT,
- 	[__NR_mknodat - SYSCALL_TABLE_ID0] = PPM_SC_MKNODAT,
- 	[__NR_fchownat - SYSCALL_TABLE_ID0] = PPM_SC_FCHOWNAT,
-+#ifdef __NR_futimesat
- 	[__NR_futimesat - SYSCALL_TABLE_ID0] = PPM_SC_FUTIMESAT,
-+#endif
- 	[__NR_unlinkat - SYSCALL_TABLE_ID0] = PPM_SC_UNLINKAT,
- 	[__NR_renameat - SYSCALL_TABLE_ID0] = PPM_SC_RENAMEAT,
- 	[__NR_linkat - SYSCALL_TABLE_ID0] = PPM_SC_LINKAT,
-@@ -551,9 +658,13 @@ const enum ppm_syscall_code g_syscall_co
- #endif
- 	[__NR_epoll_pwait - SYSCALL_TABLE_ID0] = PPM_SC_EPOLL_PWAIT,
- 	[__NR_utimensat - SYSCALL_TABLE_ID0] = PPM_SC_UTIMENSAT,
-+#ifdef __NR_signalfd
- 	[__NR_signalfd - SYSCALL_TABLE_ID0] = PPM_SC_SIGNALFD,
-+#endif
- 	[__NR_timerfd_create - SYSCALL_TABLE_ID0] = PPM_SC_TIMERFD_CREATE,
-+#ifdef __NR_eventfd
- 	[__NR_eventfd - SYSCALL_TABLE_ID0] = PPM_SC_EVENTFD,
-+#endif
- 	[__NR_timerfd_settime - SYSCALL_TABLE_ID0] = PPM_SC_TIMERFD_SETTIME,
- 	[__NR_timerfd_gettime - SYSCALL_TABLE_ID0] = PPM_SC_TIMERFD_GETTIME,
- 	[__NR_signalfd4 - SYSCALL_TABLE_ID0] = PPM_SC_SIGNALFD4,
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
similarity index 69%
rename from meta-oe/recipes-extended/sysdig/sysdig_git.bb
rename to meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index 3916bbd60d..4181da732f 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -18,28 +18,32 @@ JIT:powerpc = ""
 JIT:powerpc64le = ""
 JIT:powerpc64 = ""
 
-DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
+DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp \
+            tbb jq openssl elfutils protobuf protobuf-native jq-native valijson"
 RDEPENDS:${PN} = "bash"
 
-SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https \
-           file://0001-fix-build-with-LuaJIT-2.1-betas.patch \
-           file://aarch64.patch \
-           file://0001-libsinsp-Fix-a-lot-of-Werror-format-security-errors-.patch \
+SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig \
+           git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=git/falcosecurity-libs \
+           file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
           "
-SRCREV = "67833b2aca06bd9d11cff7cb29f04fbf4ef96cad"
-PV = "0.27.1"
+SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
+SRCREV_falco= "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "\
                 -DBUILD_DRIVER=OFF \
+                -DMINIMAL_BUILD=ON \
                 -DUSE_BUNDLED_DEPS=OFF \
                 -DCREATE_TEST_TARGETS=OFF \
                 -DDIR_ETC=${sysconfdir} \
                 -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
-                -DLUA_LIBRARY=libluajit-5.1.so \
+                -DFALCOSECURITY_LIBS_SOURCE_DIR=${S}/falcosecurity-libs \
+                -DVALIJSON_INCLUDE=${STAGING_INCDIR}/valijson \
 "
 
+#CMAKE_VERBOSE = "VERBOSE=1"
+
 FILES:${PN} += " \
     ${DIR_ETC}/* \
     ${datadir}/zsh/* \
@@ -54,3 +58,4 @@ COMPATIBLE_HOST:mips = "null"
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:powerpc = "null"
+COMPATIBLE_HOST:powerpc64le = "null"
-- 
2.35.1


