Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P5BoK-0006qf-3H
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:24:39 +0200
Received: by pzk28 with SMTP id 28so153178pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=U/zQIJoGLh8hj+QHjLsRqSV+o/39Ehpsarp5p4Am1Ro=;
	b=OamCf8JX0Tgk+nWaDL+4KMHA+da4CCfkuCD7w05QC9VSOZwoIUAdThddj7xhIovuO8
	WthQLze2LECcGb0VHoi+iP04Escca+eAPjkSJOcq4tZ2W9ptxbT4k+DD9L2qX0zlOPB6
	kTw3SQjjjUcuK+yh1LYHXcJwDRJASm0cneND8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=Hic4V+EU5n0wTFgEuVhYPeHPTRG6ZcJCDlPSAw0c4OqG5t+2G4yFr17/8ZL8tducC8
	8XjnqVk65FNCyDakQzbn0IOy/6zWdBlB5Ga8l2gDZq1fZqjxZQLTKEMJWHE9TSHgKCD1
	A9QIdxjHiWGDslSZqsDCuAF1e85Df5nWnN0UI=
Received: by 10.143.13.18 with SMTP id q18mr4649957wfi.404.1286778248716;
	Sun, 10 Oct 2010 23:24:08 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id q13sm7784358wfc.5.2010.10.10.23.24.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 23:24:07 -0700 (PDT)
Message-ID: <4CB2AD81.4020501@gmail.com>
Date: Mon, 11 Oct 2010 16:54:01 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ion: move to obsolete.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Oct 2010 06:24:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This recipe has been marked BROKEN for 5 years or so.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/ion/ion3/201_fix-paths.diff             |   93 ------------------
 recipes/ion/ion3/202_fix-menus.diff             |   49 ----------
 recipes/ion/ion3/203_fix-kludges.diff           |   15 ---
 recipes/ion/ion3/204_fix-bindings.diff          |   11 --
 recipes/ion/ion3/205_ion-lock.diff              |  118 -----------------------
 recipes/ion/ion3/206_use-xterm.diff             |   10 --
 recipes/ion/ion3/cross.patch                    |   49 ----------
 recipes/ion/ion3/luaconfig.patch                |   27 -----
 recipes/ion/ion3_0.0+ds20041104.bb              |   37 -------
 recipes/obsolete/ion/ion3/201_fix-paths.diff    |   93 ++++++++++++++++++
 recipes/obsolete/ion/ion3/202_fix-menus.diff    |   49 ++++++++++
 recipes/obsolete/ion/ion3/203_fix-kludges.diff  |   15 +++
 recipes/obsolete/ion/ion3/204_fix-bindings.diff |   11 ++
 recipes/obsolete/ion/ion3/205_ion-lock.diff     |  118 +++++++++++++++++++++++
 recipes/obsolete/ion/ion3/206_use-xterm.diff    |   10 ++
 recipes/obsolete/ion/ion3/cross.patch           |   49 ++++++++++
 recipes/obsolete/ion/ion3/luaconfig.patch       |   27 +++++
 recipes/obsolete/ion/ion3_0.0+ds20041104.bb     |   37 +++++++
 18 files changed, 409 insertions(+), 409 deletions(-)
 delete mode 100644 recipes/ion/ion3/201_fix-paths.diff
 delete mode 100644 recipes/ion/ion3/202_fix-menus.diff
 delete mode 100644 recipes/ion/ion3/203_fix-kludges.diff
 delete mode 100644 recipes/ion/ion3/204_fix-bindings.diff
 delete mode 100644 recipes/ion/ion3/205_ion-lock.diff
 delete mode 100644 recipes/ion/ion3/206_use-xterm.diff
 delete mode 100644 recipes/ion/ion3/cross.patch
 delete mode 100644 recipes/ion/ion3/luaconfig.patch
 delete mode 100644 recipes/ion/ion3_0.0+ds20041104.bb
 create mode 100644 recipes/obsolete/ion/ion3/201_fix-paths.diff
 create mode 100644 recipes/obsolete/ion/ion3/202_fix-menus.diff
 create mode 100644 recipes/obsolete/ion/ion3/203_fix-kludges.diff
 create mode 100644 recipes/obsolete/ion/ion3/204_fix-bindings.diff
 create mode 100644 recipes/obsolete/ion/ion3/205_ion-lock.diff
 create mode 100644 recipes/obsolete/ion/ion3/206_use-xterm.diff
 create mode 100644 recipes/obsolete/ion/ion3/cross.patch
 create mode 100644 recipes/obsolete/ion/ion3/luaconfig.patch
 create mode 100644 recipes/obsolete/ion/ion3_0.0+ds20041104.bb

diff --git a/recipes/ion/ion3/201_fix-paths.diff b/recipes/ion/ion3/201_fix-paths.diff
deleted file mode 100644
index 014e667..0000000
--- a/recipes/ion/ion3/201_fix-paths.diff
+++ /dev/null
@@ -1,93 +0,0 @@
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- ion-3ds-20041104/system.mk~201fix-paths
-+++ ion-3ds-20041104/system.mk
-@@ -7,7 +7,7 @@
- ## Installation paths
- ##
- 
--PREFIX=/usr/local
-+PREFIX=/usr
- 
- # Unless you are creating a package conforming to some OS's standards, you
- # probably do not want to modify the following directories:
-@@ -15,7 +15,7 @@
- # Main binaries
- BINDIR=$(PREFIX)/bin
- # Configuration .lua files
--ETCDIR=$(PREFIX)/etc/ion3
-+ETCDIR=/etc/X11/ion3
- # Some .lua files and ion-* shell scripts
- SHAREDIR=$(PREFIX)/share/ion3
- # Manual pages
-@@ -27,11 +27,11 @@
- # Nothing at the moment
- LIBDIR=$(PREFIX)/lib
- # Modules
--MODULEDIR=$(LIBDIR)/ion3/mod
-+MODULEDIR=$(LIBDIR)/ion3
- # Compiled Lua source code
- LCDIR=$(LIBDIR)/ion3/lc
- # ion-completefile (does not belong in SHAREDIR being a binary file)
--EXTRABINDIR=$(LIBDIR)/ion3/bin
-+EXTRABINDIR=$(LIBDIR)/ion3
- # For ion-completeman system-wide cache
- VARDIR=/var/cache/ion3
- # Message catalogs
-@@ -56,18 +56,18 @@
- 
- # If you have installed Lua 5.0 from the official tarball without changing
- # paths, this should do it.
--LUA_DIR=/usr/local
--LUA_LIBS = -L$(LUA_DIR)/lib -llua -llualib
--LUA_INCLUDES = -I$(LUA_DIR)/include
--LUA=$(LUA_DIR)/bin/lua
--LUAC=$(LUA_DIR)/bin/luac
-+#LUA_DIR=/usr/local
-+#LUA_LIBS = -L$(LUA_DIR)/lib -llua -llualib
-+#LUA_INCLUDES = -I$(LUA_DIR)/include
-+#LUA=$(LUA_DIR)/bin/lua
-+#LUAC=$(LUA_DIR)/bin/luac
- 
- # If you are using the Debian packages, the following settings should be
- # what you want.
--#LUA_LIBS=`lua-config50 --libs`
--#LUA_INCLUDES=`lua-config50 --include`
--#LUA=lua50
--#LUAC=luac50
-+LUA_LIBS=`lua-config --libs`
-+LUA_INCLUDES=`lua-config --include`
-+LUA=lua
-+LUAC=luac
- 
- 
- ##
-@@ -107,7 +107,7 @@
- # asprintf and vasprintf in the c library. (gnu libc has.)
- # If HAS_SYSTEM_ASPRINTF is not defined, an implementation
- # in sprintf_2.2/ is used.
--#HAS_SYSTEM_ASPRINTF=1
-+HAS_SYSTEM_ASPRINTF=1
- 
- 
- # If you're on an archaic system (such as relatively recent *BSD releases)
-@@ -139,14 +139,14 @@
- 
- #C89_SOURCE=-ansi
- 
--#POSIX_SOURCE=-D_POSIX_SOURCE
-+POSIX_SOURCE=-D_POSIX_SOURCE
- 
- # Most systems
--#XOPEN_SOURCE=-D_XOPEN_SOURCE -D_XOPEN_SOURCE_EXTENDED
-+XOPEN_SOURCE=-D_XOPEN_SOURCE -D_XOPEN_SOURCE_EXTENDED
- # SunOS, (Irix)
- #XOPEN_SOURCE=-D__EXTENSIONS__
- 
--#C99_SOURCE=-std=c99 -DCF_HAS_VA_COPY
-+C99_SOURCE=-std=c99 -DCF_HAS_VA_COPY
- 
- # The -DCF_HAS_VA_COPY option should allow for some optimisations, and 
- # in some cases simply defining
diff --git a/recipes/ion/ion3/202_fix-menus.diff b/recipes/ion/ion3/202_fix-menus.diff
deleted file mode 100644
index 9991315..0000000
--- a/recipes/ion/ion3/202_fix-menus.diff
+++ /dev/null
@@ -1,49 +0,0 @@
---- ion3-20041104.orig/etc/cfg_menus.lua	2004-09-28 14:58:49.000000000 +0000
-+++ ion3-20041104/etc/cfg_menus.lua	2004-11-27 22:37:01.000000000 +0000
-@@ -6,18 +6,21 @@
- -- Main menu
- defmenu("mainmenu", {
-     submenu("Programs",         "appmenu"),
--    menuentry("Lock screen",    "ioncore.exec_on(_, 'xlock')"),
-+    menuentry("Lock screen",
-+              "ioncore.exec_on(_, ioncore.lookup_script('ion-lock'))"),
-     menuentry("Help",           "mod_query.query_man(_)"),
-     menuentry("About Ion",      "mod_query.show_about_ion(_)"),
-     submenu("Styles",           "stylemenu"),
-+    submenu("Debian",           "Debian"),
-     submenu("Session",          "sessionmenu"),
- })
- 
- 
- -- Application menu
- defmenu("appmenu", {
--    menuentry("XTerm",          "ioncore.exec_on(_, 'xterm')"),
--    menuentry("Mozilla Firefox","ioncore.exec_on(_, 'firefox')"),
-+    menuentry("Terminal",       "ioncore.exec_on(_, 'x-terminal-emulator')"),
-+    menuentry("Browser",        "ioncore.exec_on(_, 'sensible-browser')"),
-+
-     menuentry("Run...",         "mod_query.query_exec(_)"),
- })
- 
-@@ -26,7 +29,7 @@
- defmenu("sessionmenu", {
-     menuentry("Save",           "ioncore.snapshot()"),
-     menuentry("Restart",        "ioncore.restart()"),
--    menuentry("Restart PWM",    "ioncore.restart_other('pwm')"),
-+    menuentry("Restart PWM3",    "ioncore.restart_other('pwm3')"),
-     menuentry("Restart TWM",    "ioncore.restart_other('twm')"),
-     menuentry("Exit",           "ioncore.shutdown()"),
- })
-@@ -44,3 +47,12 @@
-     menuentry("Window info",    "mod_query.show_clientwin(_, _sub)",
-                                 "_sub:WClientWin"),
- })
-+
-+-- Auto-generated Debian menu definitions
-+if os.execute("test -x /usr/bin/update-menus") == 0 then
-+    if ioncore.is_i18n() then
-+        dopath("debian-menu-i18n")
-+    else
-+        dopath("debian-menu")
-+    end
-+end
diff --git a/recipes/ion/ion3/203_fix-kludges.diff b/recipes/ion/ion3/203_fix-kludges.diff
deleted file mode 100644
index 3efef50..0000000
--- a/recipes/ion/ion3/203_fix-kludges.diff
+++ /dev/null
@@ -1,15 +0,0 @@
---- ion3-20041104.orig/etc/cfg_kludges.lua	2004-07-28 01:17:34.000000000 +0000
-+++ ion3-20041104/etc/cfg_kludges.lua	2004-11-27 22:39:50.000000000 +0000
-@@ -17,6 +17,12 @@
-     transient_mode = "current",
- }
- 
-+defwinprop{
-+    class = "Evolution-mail",
-+    instance = "evolution-mail",
-+    transient_mode = "current"
-+}
-+
- -- You might want to enable these if you really must use XMMS. 
- --[[
- defwinprop{
diff --git a/recipes/ion/ion3/204_fix-bindings.diff b/recipes/ion/ion3/204_fix-bindings.diff
deleted file mode 100644
index 7e317fa..0000000
--- a/recipes/ion/ion3/204_fix-bindings.diff
+++ /dev/null
@@ -1,11 +0,0 @@
---- ion3-20041104.orig/etc/cfg_bindings.lua	2004-10-05 09:03:31.000000000 +0000
-+++ ion3-20041104/etc/cfg_bindings.lua	2004-11-27 23:06:00.000000000 +0000
-@@ -52,7 +52,7 @@
-     kpress(MOD1.."F1", "ioncore.show_manual()"),
-     
-     bdoc("Run a terminal emulator."),
--    kpress(MOD2.."F2", "ioncore.exec_on(_, 'xterm')"),
-+    kpress(MOD2.."F2", "ioncore.exec_on(_, 'x-terminal-emulator')"),
-     
-     bdoc("Create a new workspace of chosen default type."),
-     kpress(MOD1.."F9", "ioncore.create_ws(_)"),
diff --git a/recipes/ion/ion3/205_ion-lock.diff b/recipes/ion/ion3/205_ion-lock.diff
deleted file mode 100644
index bbd25dd..0000000
--- a/recipes/ion/ion3/205_ion-lock.diff
+++ /dev/null
@@ -1,118 +0,0 @@
---- ion-3ds-20041104.orig/mod_dock/README.dock	2003-12-23 21:13:07.000000000 +0000
-+++ ion-3ds-20041104/mod_dock/README.dock	2004-12-05 15:52:30.000000000 +0000
-@@ -7,19 +7,18 @@
- 
- INTRODUCTION
- 
--	This module provides a dock for the Ion window manager. It is designed
--	to work with ion-devel-20031211.
-+	This module provides a dock for the Ion window manager.
- 
- 	Features:
- 	- supports most dockapps
- 	- configurable layout
- 	- configurable dockapp order
- 	- supports shaped dockapps
--	- uses ion-devel's drawing engine
-+	- uses ion's drawing engine
- 
- DEPENDENCIES
- 
--	ion-devel-20031211
-+	ion3
- 
- INSTALLATION
- 
-@@ -32,19 +31,20 @@
- 	3. Either run (as root)
- 		# make install
- 	   or (as yourself),
--		$ mkdir -p ~/.ion2/lib
--		$ cp .libs/dock.* ~/.ion2/lib
-+		$ mkdir -p ~/.ion3/lib
-+		$ cp .libs/dock.* ~/.ion3/lib
- 
--	4. Copy the configuration files to your ~/.ion2 directory:
--		$ cp dock.lua dock-draw.lua ~/.ion2 
-+
-+	4. Copy the configuration files to your ~/.ion3 directory:
-+		$ cp dock.lua dock-draw.lua ~/.ion3
- 	   Edit dock.lua and dock-draw.lua to suit your preferences.
- 
--	5. Add load_module("dock") to ~/.ion2/ion.lua.
-+	5. Add load_module("dock") to ~/.ion3/ion.lua.
- 
--	6. Add include("dock-draw.lua") near the end of ~/.ion2/draw.lua,
-+	6. Add include("dock-draw.lua") near the end of ~/.ion3/draw.lua,
- 	   before gr_refresh().
- 
--	7. (Re)start ion-devel.
-+	7. (Re)start ion3.
- 
- CONFIGURATION
- 
-@@ -53,7 +53,7 @@
- KNOWN BUGS
- 
- 	Not all dockapps dock. This is because dockapps use a variety of methods
--	to signal that they are dockapps and ion-devel-dock doesn't yet
-+	to signal that they are dockapps and the dock doesn't yet
- 	recognise all of them. If your favourite dockapp does not work then
- 	please inform the author (email address at top of file).
- 
-@@ -62,13 +62,13 @@
- 	- gkrellm2 can have the wrong shape if it is started after the dock
- 	  module is loaded.
- 
--	- wmxmms needs a winprop{...}. See the example dock.lua. ion-devel
-+	- wmxmms needs a winprop{...}. See the example dock.lua. Ion
- 	  complains: Client window "wmxmms" has broken transient_for hint.
- 	  ("Extended WM hints" multi-parent brain damage?).
- 
- IMPLEMENTATION NOTES
- 
--	If you would like to help improve ion-devel-dock then the following
-+	If you would like to help improve the dock then the following
- 	notes might be useful.
- 
- 	You should use folding in your editor when you edit/view the source
-@@ -76,8 +76,8 @@
- 	folds. VIM and Emacs both support folding.
- 
- 	Dockapps use a variety of methods to signal to the window manager that
--	they are a dockapp. ion-devel automatically detects some (see
--	manage_clientwin() in ioncore/clientwin.c), and ion-devel-dock detects
-+	they are a dockapp. Ion automatically detects some (see
-+	manage_clientwin() in ioncore/clientwin.c), and the dock detects
- 	some others (see dock_clientwin_is_dockapp() in dock.c).  Adding more
- 	dockapp types will require editing these functions and possibly writing
- 	type-specific management code.
-@@ -94,7 +94,7 @@
- 	sequence of events is as follows:
- 	1. gkrellm2 starts and gets added to the dock with is initial geom.
- 	2. gkrellm2 grows as it loads plugins.
--	3. ion-devel-dock allocates more space to gkrellm2 and requests
-+	3. The dock allocates more space to gkrellm2 and requests
- 	   gkrellm2's new shape, but gkrellm2 reports its old shape.
- 	4. Further requests to gkrellm2 return is new (actual) shape, but by
- 	    now it's too late...
---- ion-3ds-20041104.orig/utils/Makefile	2004-08-02 03:31:27.000000000 +0000
-+++ ion-3ds-20041104/utils/Makefile	2004-12-05 15:55:19.000000000 +0000
-@@ -12,7 +12,7 @@
- INSTALL_SUBDIRS=$(SUBDIRS)
- 
- SHELLSCRIPTS = ion-edit ion-man ion-runinxterm ion-ssh ion-view \
--	       ion-completeman
-+	       ion-completeman ion-lock
- 
- TARGETS=ion-ssh ion-man ion-completeman
- 
---- ion-3ds-20041104.orig/utils/ion-lock	1970-01-01 00:00:00.000000000 +0000
-+++ ion-3ds-20041104/utils/ion-lock	2004-12-05 15:55:55.000000000 +0000
-@@ -0,0 +1,6 @@
-+#!/bin/sh
-+if xscreensaver-command -version >/dev/null 2>&1; then
-+	exec xscreensaver-command -lock
-+else
-+	exec xlock
-+fi
diff --git a/recipes/ion/ion3/206_use-xterm.diff b/recipes/ion/ion3/206_use-xterm.diff
deleted file mode 100644
index f1b37d6..0000000
--- a/recipes/ion/ion3/206_use-xterm.diff
+++ /dev/null
@@ -1,10 +0,0 @@
---- ion-3ds-20041104.orig/utils/ion-runinxterm	2003-05-30 21:17:53.000000000 +0000
-+++ ion-3ds-20041104/utils/ion-runinxterm	2004-12-05 15:57:53.000000000 +0000
-@@ -1,6 +1,6 @@
- #!/bin/sh
- 
--test "$XTERMCMD" || XTERMCMD="xterm"
-+test "$XTERMCMD" || XTERMCMD="x-terminal-emulator"
- 
- if test $# -lt 1; then
- 	echo error
diff --git a/recipes/ion/ion3/cross.patch b/recipes/ion/ion3/cross.patch
deleted file mode 100644
index 9a23618..0000000
--- a/recipes/ion/ion3/cross.patch
+++ /dev/null
@@ -1,49 +0,0 @@
---- tmp/work/arm-linux/ion3-0.0+ds20041104-r0/ion-3ds-20041104/configure.ac	2004-11-04 08:55:55.000000000 -0600
-+++ ion-3ds-20041104/configure.ac	2004-12-28 13:47:05.000000000 -0600
-@@ -74,26 +74,7 @@
-                                the -i18n command line option])])
- 
- if test "x$enable_Xutf8" = xyes; then
--    AC_MSG_CHECKING([for Xutf8*])
--    save_CFLAGS="$CFLAGS"
--    CFLAGS="$CFLAGS $X_CFLAGS"
--    AC_RUN_IFELSE([AC_LANG_SOURCE([[
--#include <X11/Xlib.h>
--
--int main()
--{
--#ifdef X_HAVE_UTF8_STRING
--    exit(0);
--#else
--    exit(1);
--#endif
--}
--                  ]])],
--                  [AC_MSG_RESULT([yes])
--                   _DCF_DE_USE_XUTF8="-DCF_DE_USE_XUTF8"],
--                  [AC_MSG_RESULT([no])
--                   exit 1])
--    CFLAGS="$save_CFLAGS"
-+	AC_CHECK_DECLS ([ X_HAVE_UTF8_STRING ], _DCF_DE_USE_XUTF8="-DCF_DE_USE_XUTF8", , [[#include <X11/Xlib.h>]])
- fi
- 
- dnl }}}
-@@ -263,7 +250,8 @@
- ]])],
-               [AC_MSG_RESULT([yes])],
-               [AC_MSG_RESULT([no])
--               exit 1])
-+               exit 1],
-+              [AC_MSG_RESULT([crosscompiling, assuming yes])])
- CFLAGS="$save_CFLAGS"
- LIBS="$save_LIBS"
- dnl }}}
-@@ -334,7 +322,7 @@
- AC_MSG_CHECKING([for va_copy])
- save_CFLAGS="$CFLAGS"
- CFLAGS="$CFLAGS $C99_SOURCE"
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
-+AC_LINK_IFELSE([AC_LANG_SOURCE([[
- 
- #include <stdarg.h>
- #include <stdlib.h>
diff --git a/recipes/ion/ion3/luaconfig.patch b/recipes/ion/ion3/luaconfig.patch
deleted file mode 100644
index 9018f6a..0000000
--- a/recipes/ion/ion3/luaconfig.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- tmp/work/arm-linux/ion3-0.0+ds20041104-r0/ion-3ds-20041104/configure.ac	2004-11-04 08:55:55.000000000 -0600
-+++ ion-3ds-20041104/configure.ac	2004-12-28 13:47:05.000000000 -0600
-@@ -204,11 +185,15 @@
- fi
- dnl }}}
- 
-+AC_PATH_PROG([LUACONFIG], [lua$with_lua_suffix-config], [], [$lua_search_path])
-+
- dnl LUA_INCLUDES {{{
- if test "x$with_lua_includes" != x; then
-     LUA_INCLUDES="-I$with_lua_includes"
- elif test "x$with_lua_prefix" != x; then
-     LUA_INCLUDES="-I$with_lua_prefix/include"
-+elif test "x$LUACONFIG" != x; then
-+	LUA_INCLUDES="`lua-config --includes`"
- fi
- save_CFLAGS="$CFLAGS"
- CFLAGS="$CFLAGS $LUA_INCLUDES"
-@@ -221,6 +206,8 @@
-     LUA_LIBS="-L$with_lua_libraries"
- elif test "x$with_lua" != x; then
-     LUA_LIBS="-L$with_lua_prefix/lib"
-+elif test "x$LUACONFIG" != x; then
-+	LUA_LIBS="`lua-config --libs`"
- fi
- AC_CHECK_LIB([lua$with_lua_suffix],
-              [lua_open],
diff --git a/recipes/ion/ion3_0.0+ds20041104.bb b/recipes/ion/ion3_0.0+ds20041104.bb
deleted file mode 100644
index 9a5850a..0000000
--- a/recipes/ion/ion3_0.0+ds20041104.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-BROKEN = "1"
-# is unfetchable now - upstream updated to 20050728
-
-DEPENDS += "lua-native lua virtual/libx11 libxext"
-DESCRIPTION = "Ion is a tiling tabbed window manager designed with keyboard \
-users in mind."
-HOMEPAGE = "http://modeemi.fi/~tuomov/ion/"
-LICENSE = "LGPL"
-PROVIDES += "ion"
-SECTION = "x11/wm"
-SNAPDATE = "${@(bb.data.getVar('PV', d, 1) or '')[-8:]}"
-
-# Currently excluded from world builds due to requiring a full libX11
-# rather than diet.
-BROKEN = "1"
-
-SRC_URI = "http://modeemi.fi/~tuomov/ion/dl/ion-3ds-${SNAPDATE}.tar.gz \
-	   file://201_fix-paths.diff \
-	   file://202_fix-menus.diff \
-	   file://203_fix-kludges.diff \
-	   file://204_fix-bindings.diff \
-	   file://205_ion-lock.diff \
-	   file://206_use-xterm.diff \
-	   file://luaconfig.patch \
-	   file://cross.patch"
-S = "${WORKDIR}/ion-3ds-${SNAPDATE}"
-
-EXTRA_OECONF += "--disable-xinerama --disable-xfree86-textprop-bug-workaround \
-		 --disable-Xutf8 --disable-sun-fix-remap --enable-shared \
-		 --with-lua-prefix=${STAGING_BINDIR_NATIVE}/.. \
-		 --x-libraries=${STAGING_LIBDIR} \
-		 --x-includes=${STAGING_INCDIR}"
-
-inherit autotools
-
-SRC_URI[md5sum] = "e187a0ca83642afddf3b21898b683ced"
-SRC_URI[sha256sum] = "b47388c35922bc0f3419a2b059c77b80fee1c5b6d0ffcde7442c854fac6e90d6"
diff --git a/recipes/obsolete/ion/ion3/201_fix-paths.diff b/recipes/obsolete/ion/ion3/201_fix-paths.diff
new file mode 100644
index 0000000..014e667
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/201_fix-paths.diff
@@ -0,0 +1,93 @@
+#
+# Patch managed by http://www.holgerschurig.de/patcher.html
+#
+
+--- ion-3ds-20041104/system.mk~201fix-paths
++++ ion-3ds-20041104/system.mk
+@@ -7,7 +7,7 @@
+ ## Installation paths
+ ##
+ 
+-PREFIX=/usr/local
++PREFIX=/usr
+ 
+ # Unless you are creating a package conforming to some OS's standards, you
+ # probably do not want to modify the following directories:
+@@ -15,7 +15,7 @@
+ # Main binaries
+ BINDIR=$(PREFIX)/bin
+ # Configuration .lua files
+-ETCDIR=$(PREFIX)/etc/ion3
++ETCDIR=/etc/X11/ion3
+ # Some .lua files and ion-* shell scripts
+ SHAREDIR=$(PREFIX)/share/ion3
+ # Manual pages
+@@ -27,11 +27,11 @@
+ # Nothing at the moment
+ LIBDIR=$(PREFIX)/lib
+ # Modules
+-MODULEDIR=$(LIBDIR)/ion3/mod
++MODULEDIR=$(LIBDIR)/ion3
+ # Compiled Lua source code
+ LCDIR=$(LIBDIR)/ion3/lc
+ # ion-completefile (does not belong in SHAREDIR being a binary file)
+-EXTRABINDIR=$(LIBDIR)/ion3/bin
++EXTRABINDIR=$(LIBDIR)/ion3
+ # For ion-completeman system-wide cache
+ VARDIR=/var/cache/ion3
+ # Message catalogs
+@@ -56,18 +56,18 @@
+ 
+ # If you have installed Lua 5.0 from the official tarball without changing
+ # paths, this should do it.
+-LUA_DIR=/usr/local
+-LUA_LIBS = -L$(LUA_DIR)/lib -llua -llualib
+-LUA_INCLUDES = -I$(LUA_DIR)/include
+-LUA=$(LUA_DIR)/bin/lua
+-LUAC=$(LUA_DIR)/bin/luac
++#LUA_DIR=/usr/local
++#LUA_LIBS = -L$(LUA_DIR)/lib -llua -llualib
++#LUA_INCLUDES = -I$(LUA_DIR)/include
++#LUA=$(LUA_DIR)/bin/lua
++#LUAC=$(LUA_DIR)/bin/luac
+ 
+ # If you are using the Debian packages, the following settings should be
+ # what you want.
+-#LUA_LIBS=`lua-config50 --libs`
+-#LUA_INCLUDES=`lua-config50 --include`
+-#LUA=lua50
+-#LUAC=luac50
++LUA_LIBS=`lua-config --libs`
++LUA_INCLUDES=`lua-config --include`
++LUA=lua
++LUAC=luac
+ 
+ 
+ ##
+@@ -107,7 +107,7 @@
+ # asprintf and vasprintf in the c library. (gnu libc has.)
+ # If HAS_SYSTEM_ASPRINTF is not defined, an implementation
+ # in sprintf_2.2/ is used.
+-#HAS_SYSTEM_ASPRINTF=1
++HAS_SYSTEM_ASPRINTF=1
+ 
+ 
+ # If you're on an archaic system (such as relatively recent *BSD releases)
+@@ -139,14 +139,14 @@
+ 
+ #C89_SOURCE=-ansi
+ 
+-#POSIX_SOURCE=-D_POSIX_SOURCE
++POSIX_SOURCE=-D_POSIX_SOURCE
+ 
+ # Most systems
+-#XOPEN_SOURCE=-D_XOPEN_SOURCE -D_XOPEN_SOURCE_EXTENDED
++XOPEN_SOURCE=-D_XOPEN_SOURCE -D_XOPEN_SOURCE_EXTENDED
+ # SunOS, (Irix)
+ #XOPEN_SOURCE=-D__EXTENSIONS__
+ 
+-#C99_SOURCE=-std=c99 -DCF_HAS_VA_COPY
++C99_SOURCE=-std=c99 -DCF_HAS_VA_COPY
+ 
+ # The -DCF_HAS_VA_COPY option should allow for some optimisations, and 
+ # in some cases simply defining
diff --git a/recipes/obsolete/ion/ion3/202_fix-menus.diff b/recipes/obsolete/ion/ion3/202_fix-menus.diff
new file mode 100644
index 0000000..9991315
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/202_fix-menus.diff
@@ -0,0 +1,49 @@
+--- ion3-20041104.orig/etc/cfg_menus.lua	2004-09-28 14:58:49.000000000 +0000
++++ ion3-20041104/etc/cfg_menus.lua	2004-11-27 22:37:01.000000000 +0000
+@@ -6,18 +6,21 @@
+ -- Main menu
+ defmenu("mainmenu", {
+     submenu("Programs",         "appmenu"),
+-    menuentry("Lock screen",    "ioncore.exec_on(_, 'xlock')"),
++    menuentry("Lock screen",
++              "ioncore.exec_on(_, ioncore.lookup_script('ion-lock'))"),
+     menuentry("Help",           "mod_query.query_man(_)"),
+     menuentry("About Ion",      "mod_query.show_about_ion(_)"),
+     submenu("Styles",           "stylemenu"),
++    submenu("Debian",           "Debian"),
+     submenu("Session",          "sessionmenu"),
+ })
+ 
+ 
+ -- Application menu
+ defmenu("appmenu", {
+-    menuentry("XTerm",          "ioncore.exec_on(_, 'xterm')"),
+-    menuentry("Mozilla Firefox","ioncore.exec_on(_, 'firefox')"),
++    menuentry("Terminal",       "ioncore.exec_on(_, 'x-terminal-emulator')"),
++    menuentry("Browser",        "ioncore.exec_on(_, 'sensible-browser')"),
++
+     menuentry("Run...",         "mod_query.query_exec(_)"),
+ })
+ 
+@@ -26,7 +29,7 @@
+ defmenu("sessionmenu", {
+     menuentry("Save",           "ioncore.snapshot()"),
+     menuentry("Restart",        "ioncore.restart()"),
+-    menuentry("Restart PWM",    "ioncore.restart_other('pwm')"),
++    menuentry("Restart PWM3",    "ioncore.restart_other('pwm3')"),
+     menuentry("Restart TWM",    "ioncore.restart_other('twm')"),
+     menuentry("Exit",           "ioncore.shutdown()"),
+ })
+@@ -44,3 +47,12 @@
+     menuentry("Window info",    "mod_query.show_clientwin(_, _sub)",
+                                 "_sub:WClientWin"),
+ })
++
++-- Auto-generated Debian menu definitions
++if os.execute("test -x /usr/bin/update-menus") == 0 then
++    if ioncore.is_i18n() then
++        dopath("debian-menu-i18n")
++    else
++        dopath("debian-menu")
++    end
++end
diff --git a/recipes/obsolete/ion/ion3/203_fix-kludges.diff b/recipes/obsolete/ion/ion3/203_fix-kludges.diff
new file mode 100644
index 0000000..3efef50
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/203_fix-kludges.diff
@@ -0,0 +1,15 @@
+--- ion3-20041104.orig/etc/cfg_kludges.lua	2004-07-28 01:17:34.000000000 +0000
++++ ion3-20041104/etc/cfg_kludges.lua	2004-11-27 22:39:50.000000000 +0000
+@@ -17,6 +17,12 @@
+     transient_mode = "current",
+ }
+ 
++defwinprop{
++    class = "Evolution-mail",
++    instance = "evolution-mail",
++    transient_mode = "current"
++}
++
+ -- You might want to enable these if you really must use XMMS. 
+ --[[
+ defwinprop{
diff --git a/recipes/obsolete/ion/ion3/204_fix-bindings.diff b/recipes/obsolete/ion/ion3/204_fix-bindings.diff
new file mode 100644
index 0000000..7e317fa
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/204_fix-bindings.diff
@@ -0,0 +1,11 @@
+--- ion3-20041104.orig/etc/cfg_bindings.lua	2004-10-05 09:03:31.000000000 +0000
++++ ion3-20041104/etc/cfg_bindings.lua	2004-11-27 23:06:00.000000000 +0000
+@@ -52,7 +52,7 @@
+     kpress(MOD1.."F1", "ioncore.show_manual()"),
+     
+     bdoc("Run a terminal emulator."),
+-    kpress(MOD2.."F2", "ioncore.exec_on(_, 'xterm')"),
++    kpress(MOD2.."F2", "ioncore.exec_on(_, 'x-terminal-emulator')"),
+     
+     bdoc("Create a new workspace of chosen default type."),
+     kpress(MOD1.."F9", "ioncore.create_ws(_)"),
diff --git a/recipes/obsolete/ion/ion3/205_ion-lock.diff b/recipes/obsolete/ion/ion3/205_ion-lock.diff
new file mode 100644
index 0000000..bbd25dd
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/205_ion-lock.diff
@@ -0,0 +1,118 @@
+--- ion-3ds-20041104.orig/mod_dock/README.dock	2003-12-23 21:13:07.000000000 +0000
++++ ion-3ds-20041104/mod_dock/README.dock	2004-12-05 15:52:30.000000000 +0000
+@@ -7,19 +7,18 @@
+ 
+ INTRODUCTION
+ 
+-	This module provides a dock for the Ion window manager. It is designed
+-	to work with ion-devel-20031211.
++	This module provides a dock for the Ion window manager.
+ 
+ 	Features:
+ 	- supports most dockapps
+ 	- configurable layout
+ 	- configurable dockapp order
+ 	- supports shaped dockapps
+-	- uses ion-devel's drawing engine
++	- uses ion's drawing engine
+ 
+ DEPENDENCIES
+ 
+-	ion-devel-20031211
++	ion3
+ 
+ INSTALLATION
+ 
+@@ -32,19 +31,20 @@
+ 	3. Either run (as root)
+ 		# make install
+ 	   or (as yourself),
+-		$ mkdir -p ~/.ion2/lib
+-		$ cp .libs/dock.* ~/.ion2/lib
++		$ mkdir -p ~/.ion3/lib
++		$ cp .libs/dock.* ~/.ion3/lib
+ 
+-	4. Copy the configuration files to your ~/.ion2 directory:
+-		$ cp dock.lua dock-draw.lua ~/.ion2 
++
++	4. Copy the configuration files to your ~/.ion3 directory:
++		$ cp dock.lua dock-draw.lua ~/.ion3
+ 	   Edit dock.lua and dock-draw.lua to suit your preferences.
+ 
+-	5. Add load_module("dock") to ~/.ion2/ion.lua.
++	5. Add load_module("dock") to ~/.ion3/ion.lua.
+ 
+-	6. Add include("dock-draw.lua") near the end of ~/.ion2/draw.lua,
++	6. Add include("dock-draw.lua") near the end of ~/.ion3/draw.lua,
+ 	   before gr_refresh().
+ 
+-	7. (Re)start ion-devel.
++	7. (Re)start ion3.
+ 
+ CONFIGURATION
+ 
+@@ -53,7 +53,7 @@
+ KNOWN BUGS
+ 
+ 	Not all dockapps dock. This is because dockapps use a variety of methods
+-	to signal that they are dockapps and ion-devel-dock doesn't yet
++	to signal that they are dockapps and the dock doesn't yet
+ 	recognise all of them. If your favourite dockapp does not work then
+ 	please inform the author (email address at top of file).
+ 
+@@ -62,13 +62,13 @@
+ 	- gkrellm2 can have the wrong shape if it is started after the dock
+ 	  module is loaded.
+ 
+-	- wmxmms needs a winprop{...}. See the example dock.lua. ion-devel
++	- wmxmms needs a winprop{...}. See the example dock.lua. Ion
+ 	  complains: Client window "wmxmms" has broken transient_for hint.
+ 	  ("Extended WM hints" multi-parent brain damage?).
+ 
+ IMPLEMENTATION NOTES
+ 
+-	If you would like to help improve ion-devel-dock then the following
++	If you would like to help improve the dock then the following
+ 	notes might be useful.
+ 
+ 	You should use folding in your editor when you edit/view the source
+@@ -76,8 +76,8 @@
+ 	folds. VIM and Emacs both support folding.
+ 
+ 	Dockapps use a variety of methods to signal to the window manager that
+-	they are a dockapp. ion-devel automatically detects some (see
+-	manage_clientwin() in ioncore/clientwin.c), and ion-devel-dock detects
++	they are a dockapp. Ion automatically detects some (see
++	manage_clientwin() in ioncore/clientwin.c), and the dock detects
+ 	some others (see dock_clientwin_is_dockapp() in dock.c).  Adding more
+ 	dockapp types will require editing these functions and possibly writing
+ 	type-specific management code.
+@@ -94,7 +94,7 @@
+ 	sequence of events is as follows:
+ 	1. gkrellm2 starts and gets added to the dock with is initial geom.
+ 	2. gkrellm2 grows as it loads plugins.
+-	3. ion-devel-dock allocates more space to gkrellm2 and requests
++	3. The dock allocates more space to gkrellm2 and requests
+ 	   gkrellm2's new shape, but gkrellm2 reports its old shape.
+ 	4. Further requests to gkrellm2 return is new (actual) shape, but by
+ 	    now it's too late...
+--- ion-3ds-20041104.orig/utils/Makefile	2004-08-02 03:31:27.000000000 +0000
++++ ion-3ds-20041104/utils/Makefile	2004-12-05 15:55:19.000000000 +0000
+@@ -12,7 +12,7 @@
+ INSTALL_SUBDIRS=$(SUBDIRS)
+ 
+ SHELLSCRIPTS = ion-edit ion-man ion-runinxterm ion-ssh ion-view \
+-	       ion-completeman
++	       ion-completeman ion-lock
+ 
+ TARGETS=ion-ssh ion-man ion-completeman
+ 
+--- ion-3ds-20041104.orig/utils/ion-lock	1970-01-01 00:00:00.000000000 +0000
++++ ion-3ds-20041104/utils/ion-lock	2004-12-05 15:55:55.000000000 +0000
+@@ -0,0 +1,6 @@
++#!/bin/sh
++if xscreensaver-command -version >/dev/null 2>&1; then
++	exec xscreensaver-command -lock
++else
++	exec xlock
++fi
diff --git a/recipes/obsolete/ion/ion3/206_use-xterm.diff b/recipes/obsolete/ion/ion3/206_use-xterm.diff
new file mode 100644
index 0000000..f1b37d6
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/206_use-xterm.diff
@@ -0,0 +1,10 @@
+--- ion-3ds-20041104.orig/utils/ion-runinxterm	2003-05-30 21:17:53.000000000 +0000
++++ ion-3ds-20041104/utils/ion-runinxterm	2004-12-05 15:57:53.000000000 +0000
+@@ -1,6 +1,6 @@
+ #!/bin/sh
+ 
+-test "$XTERMCMD" || XTERMCMD="xterm"
++test "$XTERMCMD" || XTERMCMD="x-terminal-emulator"
+ 
+ if test $# -lt 1; then
+ 	echo error
diff --git a/recipes/obsolete/ion/ion3/cross.patch b/recipes/obsolete/ion/ion3/cross.patch
new file mode 100644
index 0000000..9a23618
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/cross.patch
@@ -0,0 +1,49 @@
+--- tmp/work/arm-linux/ion3-0.0+ds20041104-r0/ion-3ds-20041104/configure.ac	2004-11-04 08:55:55.000000000 -0600
++++ ion-3ds-20041104/configure.ac	2004-12-28 13:47:05.000000000 -0600
+@@ -74,26 +74,7 @@
+                                the -i18n command line option])])
+ 
+ if test "x$enable_Xutf8" = xyes; then
+-    AC_MSG_CHECKING([for Xutf8*])
+-    save_CFLAGS="$CFLAGS"
+-    CFLAGS="$CFLAGS $X_CFLAGS"
+-    AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <X11/Xlib.h>
+-
+-int main()
+-{
+-#ifdef X_HAVE_UTF8_STRING
+-    exit(0);
+-#else
+-    exit(1);
+-#endif
+-}
+-                  ]])],
+-                  [AC_MSG_RESULT([yes])
+-                   _DCF_DE_USE_XUTF8="-DCF_DE_USE_XUTF8"],
+-                  [AC_MSG_RESULT([no])
+-                   exit 1])
+-    CFLAGS="$save_CFLAGS"
++	AC_CHECK_DECLS ([ X_HAVE_UTF8_STRING ], _DCF_DE_USE_XUTF8="-DCF_DE_USE_XUTF8", , [[#include <X11/Xlib.h>]])
+ fi
+ 
+ dnl }}}
+@@ -263,7 +250,8 @@
+ ]])],
+               [AC_MSG_RESULT([yes])],
+               [AC_MSG_RESULT([no])
+-               exit 1])
++               exit 1],
++              [AC_MSG_RESULT([crosscompiling, assuming yes])])
+ CFLAGS="$save_CFLAGS"
+ LIBS="$save_LIBS"
+ dnl }}}
+@@ -334,7 +322,7 @@
+ AC_MSG_CHECKING([for va_copy])
+ save_CFLAGS="$CFLAGS"
+ CFLAGS="$CFLAGS $C99_SOURCE"
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
++AC_LINK_IFELSE([AC_LANG_SOURCE([[
+ 
+ #include <stdarg.h>
+ #include <stdlib.h>
diff --git a/recipes/obsolete/ion/ion3/luaconfig.patch b/recipes/obsolete/ion/ion3/luaconfig.patch
new file mode 100644
index 0000000..9018f6a
--- /dev/null
+++ b/recipes/obsolete/ion/ion3/luaconfig.patch
@@ -0,0 +1,27 @@
+--- tmp/work/arm-linux/ion3-0.0+ds20041104-r0/ion-3ds-20041104/configure.ac	2004-11-04 08:55:55.000000000 -0600
++++ ion-3ds-20041104/configure.ac	2004-12-28 13:47:05.000000000 -0600
+@@ -204,11 +185,15 @@
+ fi
+ dnl }}}
+ 
++AC_PATH_PROG([LUACONFIG], [lua$with_lua_suffix-config], [], [$lua_search_path])
++
+ dnl LUA_INCLUDES {{{
+ if test "x$with_lua_includes" != x; then
+     LUA_INCLUDES="-I$with_lua_includes"
+ elif test "x$with_lua_prefix" != x; then
+     LUA_INCLUDES="-I$with_lua_prefix/include"
++elif test "x$LUACONFIG" != x; then
++	LUA_INCLUDES="`lua-config --includes`"
+ fi
+ save_CFLAGS="$CFLAGS"
+ CFLAGS="$CFLAGS $LUA_INCLUDES"
+@@ -221,6 +206,8 @@
+     LUA_LIBS="-L$with_lua_libraries"
+ elif test "x$with_lua" != x; then
+     LUA_LIBS="-L$with_lua_prefix/lib"
++elif test "x$LUACONFIG" != x; then
++	LUA_LIBS="`lua-config --libs`"
+ fi
+ AC_CHECK_LIB([lua$with_lua_suffix],
+              [lua_open],
diff --git a/recipes/obsolete/ion/ion3_0.0+ds20041104.bb b/recipes/obsolete/ion/ion3_0.0+ds20041104.bb
new file mode 100644
index 0000000..9a5850a
--- /dev/null
+++ b/recipes/obsolete/ion/ion3_0.0+ds20041104.bb
@@ -0,0 +1,37 @@
+BROKEN = "1"
+# is unfetchable now - upstream updated to 20050728
+
+DEPENDS += "lua-native lua virtual/libx11 libxext"
+DESCRIPTION = "Ion is a tiling tabbed window manager designed with keyboard \
+users in mind."
+HOMEPAGE = "http://modeemi.fi/~tuomov/ion/"
+LICENSE = "LGPL"
+PROVIDES += "ion"
+SECTION = "x11/wm"
+SNAPDATE = "${@(bb.data.getVar('PV', d, 1) or '')[-8:]}"
+
+# Currently excluded from world builds due to requiring a full libX11
+# rather than diet.
+BROKEN = "1"
+
+SRC_URI = "http://modeemi.fi/~tuomov/ion/dl/ion-3ds-${SNAPDATE}.tar.gz \
+	   file://201_fix-paths.diff \
+	   file://202_fix-menus.diff \
+	   file://203_fix-kludges.diff \
+	   file://204_fix-bindings.diff \
+	   file://205_ion-lock.diff \
+	   file://206_use-xterm.diff \
+	   file://luaconfig.patch \
+	   file://cross.patch"
+S = "${WORKDIR}/ion-3ds-${SNAPDATE}"
+
+EXTRA_OECONF += "--disable-xinerama --disable-xfree86-textprop-bug-workaround \
+		 --disable-Xutf8 --disable-sun-fix-remap --enable-shared \
+		 --with-lua-prefix=${STAGING_BINDIR_NATIVE}/.. \
+		 --x-libraries=${STAGING_LIBDIR} \
+		 --x-includes=${STAGING_INCDIR}"
+
+inherit autotools
+
+SRC_URI[md5sum] = "e187a0ca83642afddf3b21898b683ced"
+SRC_URI[sha256sum] = "b47388c35922bc0f3419a2b059c77b80fee1c5b6d0ffcde7442c854fac6e90d6"
-- 
1.7.1



