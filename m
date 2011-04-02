Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1Q61hH-0006oQ-OY
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 16:21:04 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 39DD21D360AD;
	Sat,  2 Apr 2011 16:19:00 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2011 16:18:46 +0200
Message-Id: <1301753930-32581-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1301753930-32581-1-git-send-email-ynezz@true.cz>
References: <1301753930-32581-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Subject: [PATCH 2/6] lua-lanes: add recipe for version 2.1.0 and delete the old one
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
X-List-Received-Date: Sat, 02 Apr 2011 14:21:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm removing the old version 2.0.6, because it shouldn't have been commit=
ed
anyway. It was quite buggy and untested version.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 .../0001-fix-LanesTimer-inifinite-thread-GC.patch  |   31 ---
 recipes/lua/lua-lanes-2.0.6/makefile.patch         |  207 --------------=
------
 recipes/lua/lua-lanes-2.0.6/uclibc.patch           |   13 --
 recipes/lua/lua-lanes-2.1.0/makefile.patch         |  207 ++++++++++++++=
++++++
 recipes/lua/lua-lanes-2.1.0/uclibc.patch           |   13 ++
 recipes/lua/lua-lanes_2.0.6.bb                     |   33 ---
 recipes/lua/lua-lanes_2.1.0.bb                     |   34 ++++
 7 files changed, 254 insertions(+), 284 deletions(-)
 delete mode 100644 recipes/lua/lua-lanes-2.0.6/0001-fix-LanesTimer-inifi=
nite-thread-GC.patch
 delete mode 100644 recipes/lua/lua-lanes-2.0.6/makefile.patch
 delete mode 100644 recipes/lua/lua-lanes-2.0.6/uclibc.patch
 create mode 100644 recipes/lua/lua-lanes-2.1.0/makefile.patch
 create mode 100644 recipes/lua/lua-lanes-2.1.0/uclibc.patch
 delete mode 100644 recipes/lua/lua-lanes_2.0.6.bb
 create mode 100644 recipes/lua/lua-lanes_2.1.0.bb

diff --git a/recipes/lua/lua-lanes-2.0.6/0001-fix-LanesTimer-inifinite-th=
read-GC.patch b/recipes/lua/lua-lanes-2.0.6/0001-fix-LanesTimer-inifinite=
-thread-GC.patch
deleted file mode 100644
index 18fb36b..0000000
--- a/recipes/lua/lua-lanes-2.0.6/0001-fix-LanesTimer-inifinite-thread-GC=
.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 69583ec6fc6cd18a0248d1233193bb2407dbda04 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
-Date: Sun, 31 Oct 2010 23:02:49 +0100
-Subject: [PATCH] fix LanesTimer inifinite thread GC
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-threading.c 394: pthread_cond_destroy(ref) failed, 16 EBUSY
-
-Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
----
- src/lanes.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/lanes.c b/src/lanes.c
-index c02c540..54cfa7a 100644
---- a/src/lanes.c
-+++ b/src/lanes.c
-@@ -1559,7 +1559,7 @@ LUAG_FUNC( thread_gc ) {
-=20
-     // We can read 's->status' without locks, but not wait for it
-     //
--    if (s->status < DONE) {
-+    if (s->status < DONE && strcmp(s->threadName, "LanesTimer")) {
-         //
-         selfdestruct_add(s);
-         assert( s->selfdestruct_next );
---=20
-1.7.0.4
-
diff --git a/recipes/lua/lua-lanes-2.0.6/makefile.patch b/recipes/lua/lua=
-lanes-2.0.6/makefile.patch
deleted file mode 100644
index 6807010..0000000
--- a/recipes/lua/lua-lanes-2.0.6/makefile.patch
+++ /dev/null
@@ -1,207 +0,0 @@
-Index: lanes-2.0.6/src/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- lanes-2.0.6.orig/src/Makefile	2009-01-22 07:32:18.000000000 +0100
-+++ lanes-2.0.6/src/Makefile	2010-10-17 22:00:16.000000000 +0200
-@@ -11,123 +11,21 @@
-=20
- OBJ=3D$(SRC:.c=3D.o)
-=20
--# LuaRocks gives 'LIBFLAG' from the outside
--#
--LIBFLAG=3D-shared
--
--OPT_FLAGS=3D-O2
--    # -O0 -g
--
- LUA=3Dlua
- LUAC=3Dluac
-=20
--_SO=3D.so
--ifeq "$(findstring MINGW32,$(shell uname -s))" "MINGW32"
--  _SO=3D.dll
--endif
--
--ifeq "$(LUAROCKS)" ""
--  ifeq "$(findstring MINGW32,$(shell uname -s))" "MINGW32"
--    # MinGW MSYS on Windows
--    #
--    # - 'lua' and 'luac' expected to be on the path
--    # - %LUA_DEV% must lead to include files and libraries (Lua for Win=
dows >=3D 5.1.3.14)
--    # - %MSCVR80% must be the full pathname of 'msvcr80.dll'
--    #
--    ifeq "$(LUA_DEV)" ""
--      $(error LUA_DEV not defined - try i.e. 'make LUA_DEV=3D/c/Program=
\ Files/Lua/5.1')
--    endif
--    ifeq "$(MSVCR80)" ""
--      MSVCR80:=3D$(LUA_DEV)/install/support/Microsoft.VC80.CRT.SP1/MSVC=
R80.DLL
--      ifneq '$(shell test -f "$(MSVCR80)" && echo found)' 'found'
--        $(error MSVCR80 not defined - set it to full path of msvcr80.dl=
l')
--      endif
--      $(warning MSVCR80=3D$(MSVCR80))
--    endif
--    LUA_FLAGS:=3D-I "$(LUA_DEV)/include"
--    LUA_LIBS:=3D"$(LUA_DEV)/lua5.1.dll" -lgcc -lmsvcr80 "$(MSVCR80)"
--    LIBFLAG=3D-shared -Wl,-Map,lanes.map
--  else
--    # Autodetect LUA_FLAGS and/or LUA_LIBS
--    #
--    ifneq "$(shell which pkg-config)" ""
--      ifeq "$(shell pkg-config --exists lua5.1 && echo 1)" "1"
--        LUA_FLAGS:=3D$(shell pkg-config --cflags lua5.1)
--        LUA_LIBS:=3D$(shell pkg-config --libs lua5.1)
--          #
--          # Ubuntu: -I/usr/include/lua5.1=20
--          #         -llua5.1
--      else
--        ifeq "$(shell pkg-config --exists lua && echo 1)" "1"
--          LUA_FLAGS:=3D$(shell pkg-config --cflags lua)
--          LUA_LIBS:=3D$(shell pkg-config --libs lua)
--            #
--            # OS X fink with pkg-config:
--            #      -I/sw/include=20
--            #      -L/sw/lib -llua -lm
--        else
--          $(warning *** 'pkg-config' existed but did not know of 'lua[5=
.1]' - Good luck!)
--          LUA_FLAGS:=3D
--          LUA_LIBS:=3D-llua
--        endif
--      endif
--    else
--      # No 'pkg-config'; try defaults
--      #
--      ifeq "$(shell uname -s)" "Darwin"
--        $(warning *** Assuming 'fink' at default path)
--        LUA_FLAGS:=3D-I/sw/include
--        LUA_LIBS:=3D-L/sw/lib -llua
--      else
--        $(warning *** Assuming an arbitrary Lua installation; try insta=
lling 'pkg-config')
--        LUA_FLAGS:=3D
--        LUA_LIBS:=3D-llua
--      endif
--    endif
--  endif
--
--  ifeq "$(shell uname -s)" "Darwin"
--    # Some machines need 'MACOSX_DEPLOYMENT_TARGET=3D10.3' for using '-=
undefined dynamic_lookup'
--    # (at least PowerPC running 10.4.11); does not harm the others
--    #
--    CC =3D MACOSX_DEPLOYMENT_TARGET=3D10.3 gcc
--    LIBFLAG =3D -bundle -undefined dynamic_lookup
--  endif
-- =20
--  CFLAGS=3D-Wall -Werror $(OPT_FLAGS) $(LUA_FLAGS)
--  LIBS=3D$(LUA_LIBS)
--endif
--
- #---
--# PThread platform specifics
--#
--ifeq "$(shell uname -s)" "Linux"
--  # -D_GNU_SOURCE needed for 'pthread_mutexattr_settype'
--  CFLAGS +=3D -D_GNU_SOURCE -fPIC
--
--  # Use of -DUSE_PTHREAD_TIMEDJOIN is possible, but not recommended (sl=
ower & keeps threads
--  # unreleased somewhat longer)
--  #CFLAGS +=3D -DUSE_PTHREAD_TIMEDJOIN
--
--  LIBS +=3D -lpthread
--endif
--
--ifeq "$(shell uname -s)" "BSD"
--  LIBS +=3D -lpthread
--endif
--
--#---
--all: lua51-$(MODULE)$(_SO)
-+all: lua51-$(MODULE).so
-=20
- %.o: %.c *.h Makefile
-=20
- # Note: Don't put $(LUA_LIBS) ahead of $^; MSYS will not like that (I t=
hink)
- #
--lua51-$(MODULE)$(_SO): $(OBJ)
--	$(CC) $(LIBFLAG) $(LIBS) $^ $(LUA_LIBS) -o $@
-+lua51-$(MODULE).so: $(OBJ)
-+	$(CC) -shared -fPIC -lpthread -D_GNU_SOURCE `pkg-config --cflags --lib=
s lua5.1` $(MYFLAGS) $^ -o $@
-=20
- clean:
--	-rm -rf lua51-$(MODULE)$(_SO) *.lch *.o *.tmp *.map
-+	-rm -rf lua51-$(MODULE).so *.lch *.o *.tmp *.map
-=20
- lanes.o: keeper.lch
-=20
-@@ -139,38 +37,5 @@
- 	$(LUA) ../tools/bin2c.lua $@.tmp -o $@
- 	-rm $@.tmp
-=20
--#---
--# NSLU2 "slug" Linux ARM
--#
--nslu2:
--	$(MAKE) all CFLAGS=3D"$(CFLAGS) -I/opt/include -L/opt/lib -D_GNU_SOURC=
E -lpthread"
--
--#---
--# Cross compiling to Win32 (MinGW on OS X Intel)
--#
--# Point WIN32_LUA51 to an extraction of LuaBinaries dll8 and dev packag=
es.
--#
--# Note: Only works on platforms with same endianess (i.e. not from Powe=
rPC OS X,
--#       since 'luac' uses the host endianess)
--#
--# EXPERIMENTAL; NOT TESTED OF LATE.
--#
--MINGW_GCC=3Dmingw32-gcc
--    # i686-pc-mingw32-gcc
--
--win32: $(WIN32_LUA51)/include/lua.h
--	$(MAKE) build CC=3D$(MINGW_GCC) \
--            LUA_FLAGS=3D-I$(WIN32_LUA51)/include \
--            LUA_LIBS=3D"-L$(WIN32_LUA51) -llua51" \
--            _SO=3D.dll \
--            SO_FLAGS=3D-shared \
--            LUA=3Dlua51 \
--            LUAC=3Dluac51
--
--$(WIN32_LUA51)/include/lua.h:
--	@echo "Usage: make win32 WIN32_LUA51=3D<path of extracted LuaBinaries =
dll8 and dev packages>"
--	@echo "                  [MINGW_GCC=3D...mingw32-gcc]"
--	@false
--
--.PROXY:	all clean nslu2 win32
-+.PROXY:	all clean
-=20
-Index: lanes-2.0.6/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- lanes-2.0.6.orig/Makefile	2010-07-27 11:39:00.000000000 +0200
-+++ lanes-2.0.6/Makefile	2010-10-17 22:14:20.000000000 +0200
-@@ -32,8 +32,10 @@
- else
-   # Autodetect LUA & LUAC
-   #
--  LUA=3D$(word 1,$(shell which lua5.1) $(shell which lua51) lua)
--  LUAC=3D$(word 1,$(shell which luac5.1) $(shell which luac51) luac)
-+  #LUA=3D$(word 1,$(shell which lua5.1) $(shell which lua51) lua)
-+  #LUAC=3D$(word 1,$(shell which luac5.1) $(shell which luac51) luac)
-+  LUA=3Dlua
-+  LUAC=3Dluac
- endif
-=20
- _PREFIX=3DLUA_CPATH=3D./src/?$(_SO) LUA_PATH=3D"src/?.lua;./tests/?.lua=
"
-@@ -42,7 +44,7 @@
- all: $(_TARGET_SO)
-=20
- $(_TARGET_SO): src/*.lua src/*.c src/*.h
--	cd src && $(MAKE) LUA=3D$(LUA) LUAC=3D$(LUAC)
-+	cd src && $(MAKE) LUA=3D$(LUA) LUAC=3D$(LUAC) MYFLAGS=3D'$(MYFLAGS)'
-=20
- clean:
- 	cd src && $(MAKE) clean
-@@ -183,7 +185,7 @@
- #
- install: $(_TARGET_SO) src/lanes.lua
- 	mkdir -p $(LUA_LIBDIR) $(LUA_SHAREDIR)
--	install -m 644 $(_TARGET_SO) $(LUA_LIBDIR)
-+	install $(_TARGET_SO) $(LUA_LIBDIR)
- 	cp -p src/lanes.lua $(LUA_SHAREDIR)
-=20
-=20
diff --git a/recipes/lua/lua-lanes-2.0.6/uclibc.patch b/recipes/lua/lua-l=
anes-2.0.6/uclibc.patch
deleted file mode 100644
index b3d1f83..0000000
--- a/recipes/lua/lua-lanes-2.0.6/uclibc.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: lanes-2.0.6/src/threading.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- lanes-2.0.6.orig/src/threading.h	2010-10-10 09:35:20.000000000 +0200
-+++ lanes-2.0.6/src/threading.h	2010-10-10 09:35:32.000000000 +0200
-@@ -112,7 +112,7 @@
-   #ifdef PLATFORM_OSX
-     #define YIELD() pthread_yield_np()
-   #else
--    #define YIELD() pthread_yield()
-+    #define YIELD() sched_yield()
-   #endif
- #endif
-=20
diff --git a/recipes/lua/lua-lanes-2.1.0/makefile.patch b/recipes/lua/lua=
-lanes-2.1.0/makefile.patch
new file mode 100644
index 0000000..6807010
--- /dev/null
+++ b/recipes/lua/lua-lanes-2.1.0/makefile.patch
@@ -0,0 +1,207 @@
+Index: lanes-2.0.6/src/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lanes-2.0.6.orig/src/Makefile	2009-01-22 07:32:18.000000000 +0100
++++ lanes-2.0.6/src/Makefile	2010-10-17 22:00:16.000000000 +0200
+@@ -11,123 +11,21 @@
+=20
+ OBJ=3D$(SRC:.c=3D.o)
+=20
+-# LuaRocks gives 'LIBFLAG' from the outside
+-#
+-LIBFLAG=3D-shared
+-
+-OPT_FLAGS=3D-O2
+-    # -O0 -g
+-
+ LUA=3Dlua
+ LUAC=3Dluac
+=20
+-_SO=3D.so
+-ifeq "$(findstring MINGW32,$(shell uname -s))" "MINGW32"
+-  _SO=3D.dll
+-endif
+-
+-ifeq "$(LUAROCKS)" ""
+-  ifeq "$(findstring MINGW32,$(shell uname -s))" "MINGW32"
+-    # MinGW MSYS on Windows
+-    #
+-    # - 'lua' and 'luac' expected to be on the path
+-    # - %LUA_DEV% must lead to include files and libraries (Lua for Win=
dows >=3D 5.1.3.14)
+-    # - %MSCVR80% must be the full pathname of 'msvcr80.dll'
+-    #
+-    ifeq "$(LUA_DEV)" ""
+-      $(error LUA_DEV not defined - try i.e. 'make LUA_DEV=3D/c/Program=
\ Files/Lua/5.1')
+-    endif
+-    ifeq "$(MSVCR80)" ""
+-      MSVCR80:=3D$(LUA_DEV)/install/support/Microsoft.VC80.CRT.SP1/MSVC=
R80.DLL
+-      ifneq '$(shell test -f "$(MSVCR80)" && echo found)' 'found'
+-        $(error MSVCR80 not defined - set it to full path of msvcr80.dl=
l')
+-      endif
+-      $(warning MSVCR80=3D$(MSVCR80))
+-    endif
+-    LUA_FLAGS:=3D-I "$(LUA_DEV)/include"
+-    LUA_LIBS:=3D"$(LUA_DEV)/lua5.1.dll" -lgcc -lmsvcr80 "$(MSVCR80)"
+-    LIBFLAG=3D-shared -Wl,-Map,lanes.map
+-  else
+-    # Autodetect LUA_FLAGS and/or LUA_LIBS
+-    #
+-    ifneq "$(shell which pkg-config)" ""
+-      ifeq "$(shell pkg-config --exists lua5.1 && echo 1)" "1"
+-        LUA_FLAGS:=3D$(shell pkg-config --cflags lua5.1)
+-        LUA_LIBS:=3D$(shell pkg-config --libs lua5.1)
+-          #
+-          # Ubuntu: -I/usr/include/lua5.1=20
+-          #         -llua5.1
+-      else
+-        ifeq "$(shell pkg-config --exists lua && echo 1)" "1"
+-          LUA_FLAGS:=3D$(shell pkg-config --cflags lua)
+-          LUA_LIBS:=3D$(shell pkg-config --libs lua)
+-            #
+-            # OS X fink with pkg-config:
+-            #      -I/sw/include=20
+-            #      -L/sw/lib -llua -lm
+-        else
+-          $(warning *** 'pkg-config' existed but did not know of 'lua[5=
.1]' - Good luck!)
+-          LUA_FLAGS:=3D
+-          LUA_LIBS:=3D-llua
+-        endif
+-      endif
+-    else
+-      # No 'pkg-config'; try defaults
+-      #
+-      ifeq "$(shell uname -s)" "Darwin"
+-        $(warning *** Assuming 'fink' at default path)
+-        LUA_FLAGS:=3D-I/sw/include
+-        LUA_LIBS:=3D-L/sw/lib -llua
+-      else
+-        $(warning *** Assuming an arbitrary Lua installation; try insta=
lling 'pkg-config')
+-        LUA_FLAGS:=3D
+-        LUA_LIBS:=3D-llua
+-      endif
+-    endif
+-  endif
+-
+-  ifeq "$(shell uname -s)" "Darwin"
+-    # Some machines need 'MACOSX_DEPLOYMENT_TARGET=3D10.3' for using '-=
undefined dynamic_lookup'
+-    # (at least PowerPC running 10.4.11); does not harm the others
+-    #
+-    CC =3D MACOSX_DEPLOYMENT_TARGET=3D10.3 gcc
+-    LIBFLAG =3D -bundle -undefined dynamic_lookup
+-  endif
+- =20
+-  CFLAGS=3D-Wall -Werror $(OPT_FLAGS) $(LUA_FLAGS)
+-  LIBS=3D$(LUA_LIBS)
+-endif
+-
+ #---
+-# PThread platform specifics
+-#
+-ifeq "$(shell uname -s)" "Linux"
+-  # -D_GNU_SOURCE needed for 'pthread_mutexattr_settype'
+-  CFLAGS +=3D -D_GNU_SOURCE -fPIC
+-
+-  # Use of -DUSE_PTHREAD_TIMEDJOIN is possible, but not recommended (sl=
ower & keeps threads
+-  # unreleased somewhat longer)
+-  #CFLAGS +=3D -DUSE_PTHREAD_TIMEDJOIN
+-
+-  LIBS +=3D -lpthread
+-endif
+-
+-ifeq "$(shell uname -s)" "BSD"
+-  LIBS +=3D -lpthread
+-endif
+-
+-#---
+-all: lua51-$(MODULE)$(_SO)
++all: lua51-$(MODULE).so
+=20
+ %.o: %.c *.h Makefile
+=20
+ # Note: Don't put $(LUA_LIBS) ahead of $^; MSYS will not like that (I t=
hink)
+ #
+-lua51-$(MODULE)$(_SO): $(OBJ)
+-	$(CC) $(LIBFLAG) $(LIBS) $^ $(LUA_LIBS) -o $@
++lua51-$(MODULE).so: $(OBJ)
++	$(CC) -shared -fPIC -lpthread -D_GNU_SOURCE `pkg-config --cflags --lib=
s lua5.1` $(MYFLAGS) $^ -o $@
+=20
+ clean:
+-	-rm -rf lua51-$(MODULE)$(_SO) *.lch *.o *.tmp *.map
++	-rm -rf lua51-$(MODULE).so *.lch *.o *.tmp *.map
+=20
+ lanes.o: keeper.lch
+=20
+@@ -139,38 +37,5 @@
+ 	$(LUA) ../tools/bin2c.lua $@.tmp -o $@
+ 	-rm $@.tmp
+=20
+-#---
+-# NSLU2 "slug" Linux ARM
+-#
+-nslu2:
+-	$(MAKE) all CFLAGS=3D"$(CFLAGS) -I/opt/include -L/opt/lib -D_GNU_SOURC=
E -lpthread"
+-
+-#---
+-# Cross compiling to Win32 (MinGW on OS X Intel)
+-#
+-# Point WIN32_LUA51 to an extraction of LuaBinaries dll8 and dev packag=
es.
+-#
+-# Note: Only works on platforms with same endianess (i.e. not from Powe=
rPC OS X,
+-#       since 'luac' uses the host endianess)
+-#
+-# EXPERIMENTAL; NOT TESTED OF LATE.
+-#
+-MINGW_GCC=3Dmingw32-gcc
+-    # i686-pc-mingw32-gcc
+-
+-win32: $(WIN32_LUA51)/include/lua.h
+-	$(MAKE) build CC=3D$(MINGW_GCC) \
+-            LUA_FLAGS=3D-I$(WIN32_LUA51)/include \
+-            LUA_LIBS=3D"-L$(WIN32_LUA51) -llua51" \
+-            _SO=3D.dll \
+-            SO_FLAGS=3D-shared \
+-            LUA=3Dlua51 \
+-            LUAC=3Dluac51
+-
+-$(WIN32_LUA51)/include/lua.h:
+-	@echo "Usage: make win32 WIN32_LUA51=3D<path of extracted LuaBinaries =
dll8 and dev packages>"
+-	@echo "                  [MINGW_GCC=3D...mingw32-gcc]"
+-	@false
+-
+-.PROXY:	all clean nslu2 win32
++.PROXY:	all clean
+=20
+Index: lanes-2.0.6/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lanes-2.0.6.orig/Makefile	2010-07-27 11:39:00.000000000 +0200
++++ lanes-2.0.6/Makefile	2010-10-17 22:14:20.000000000 +0200
+@@ -32,8 +32,10 @@
+ else
+   # Autodetect LUA & LUAC
+   #
+-  LUA=3D$(word 1,$(shell which lua5.1) $(shell which lua51) lua)
+-  LUAC=3D$(word 1,$(shell which luac5.1) $(shell which luac51) luac)
++  #LUA=3D$(word 1,$(shell which lua5.1) $(shell which lua51) lua)
++  #LUAC=3D$(word 1,$(shell which luac5.1) $(shell which luac51) luac)
++  LUA=3Dlua
++  LUAC=3Dluac
+ endif
+=20
+ _PREFIX=3DLUA_CPATH=3D./src/?$(_SO) LUA_PATH=3D"src/?.lua;./tests/?.lua=
"
+@@ -42,7 +44,7 @@
+ all: $(_TARGET_SO)
+=20
+ $(_TARGET_SO): src/*.lua src/*.c src/*.h
+-	cd src && $(MAKE) LUA=3D$(LUA) LUAC=3D$(LUAC)
++	cd src && $(MAKE) LUA=3D$(LUA) LUAC=3D$(LUAC) MYFLAGS=3D'$(MYFLAGS)'
+=20
+ clean:
+ 	cd src && $(MAKE) clean
+@@ -183,7 +185,7 @@
+ #
+ install: $(_TARGET_SO) src/lanes.lua
+ 	mkdir -p $(LUA_LIBDIR) $(LUA_SHAREDIR)
+-	install -m 644 $(_TARGET_SO) $(LUA_LIBDIR)
++	install $(_TARGET_SO) $(LUA_LIBDIR)
+ 	cp -p src/lanes.lua $(LUA_SHAREDIR)
+=20
+=20
diff --git a/recipes/lua/lua-lanes-2.1.0/uclibc.patch b/recipes/lua/lua-l=
anes-2.1.0/uclibc.patch
new file mode 100644
index 0000000..b3d1f83
--- /dev/null
+++ b/recipes/lua/lua-lanes-2.1.0/uclibc.patch
@@ -0,0 +1,13 @@
+Index: lanes-2.0.6/src/threading.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lanes-2.0.6.orig/src/threading.h	2010-10-10 09:35:20.000000000 +0200
++++ lanes-2.0.6/src/threading.h	2010-10-10 09:35:32.000000000 +0200
+@@ -112,7 +112,7 @@
+   #ifdef PLATFORM_OSX
+     #define YIELD() pthread_yield_np()
+   #else
+-    #define YIELD() pthread_yield()
++    #define YIELD() sched_yield()
+   #endif
+ #endif
+=20
diff --git a/recipes/lua/lua-lanes_2.0.6.bb b/recipes/lua/lua-lanes_2.0.6=
.bb
deleted file mode 100644
index dc9a60d..0000000
--- a/recipes/lua/lua-lanes_2.0.6.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION =3D "Lua Lanes is a Lua extension library providing the poss=
ibility to run multiple Lua states in parallel."
-LICENSE =3D "MIT"
-HOMEPAGE =3D "http://kotisivu.dnainternet.net/askok/bin/lanes/index.html=
"
-
-DEPENDS +=3D "lua5.1-native"
-RDEPENDS_${PN} +=3D "lua5.1"
-
-PR =3D "r1"
-S =3D "${WORKDIR}/lanes-${PV}"
-
-SRC_URI =3D "http://luaforge.net/frs/download.php/4652/lanes-2.0.6.tgz \
-           file://makefile.patch \
-           file://0001-fix-LanesTimer-inifinite-thread-GC.patch \
-          "
-
-UCLIBC_PATCHES =3D "file://uclibc.patch"
-SRC_URI_append_libc-uclibc =3D "${UCLIBC_PATCHES}"
-
-LUA_LIB_DIR =3D  "${libdir}/lua/5.1"
-LUA_SHARE_DIR =3D "${datadir}/lua/5.1"
-
-PACKAGES =3D "${PN} ${PN}-dbg"
-FILES_${PN} =3D "${LUA_LIB_DIR}/lua51-lanes.so ${LUA_SHARE_DIR}/lanes.lu=
a"
-FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/lua51-lanes.so"
-
-EXTRA_OEMAKE =3D "MYFLAGS=3D'${CFLAGS} ${LDFLAGS}'"
-
-do_install() {
-	oe_runmake install DESTDIR=3D'${D}/usr'=20
-}
-
-SRC_URI[md5sum] =3D "1716bdf138fcc65b7069aaad864da677"
-SRC_URI[sha256sum] =3D "7b07fa1c21749981ec0addcf8e9e85acfca91efe8d3f6498=
2a6ac0bc6a615e70"
diff --git a/recipes/lua/lua-lanes_2.1.0.bb b/recipes/lua/lua-lanes_2.1.0=
.bb
new file mode 100644
index 0000000..bf5b3e6
--- /dev/null
+++ b/recipes/lua/lua-lanes_2.1.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTION =3D "Lua Lanes is a Lua extension library providing the poss=
ibility to run multiple Lua states in parallel."
+LICENSE =3D "MIT"
+HOMEPAGE =3D "http://kotisivu.dnainternet.net/askok/bin/lanes/index.html=
"
+
+DEPENDS +=3D "lua5.1-native"
+RDEPENDS_${PN} +=3D "lua5.1"
+
+PR =3D "r0"
+
+S =3D "${WORKDIR}/git/"
+SRCREV =3D "5499ec1a61be9797c57834618a49731952b1d212"
+
+SRC_URI =3D "git://github.com/LuaLanes/lanes.git;protocol=3Dgit \
+           file://makefile.patch \
+          "
+
+UCLIBC_PATCHES =3D "file://uclibc.patch"
+SRC_URI_append_libc-uclibc =3D "${UCLIBC_PATCHES}"
+
+LUA_LIB_DIR =3D  "${libdir}/lua/5.1"
+LUA_SHARE_DIR =3D "${datadir}/lua/5.1"
+
+PACKAGES =3D "${PN} ${PN}-dbg"
+FILES_${PN} =3D "${LUA_LIB_DIR}/lua51-lanes.so ${LUA_SHARE_DIR}/lanes.lu=
a"
+FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/lua51-lanes.so"
+
+EXTRA_OEMAKE =3D "MYFLAGS=3D'${CFLAGS} ${LDFLAGS}'"
+
+do_install() {
+	oe_runmake install DESTDIR=3D'${D}/usr'=20
+}
+
+SRC_URI[md5sum] =3D "1716bdf138fcc65b7069aaad864da677"
+SRC_URI[sha256sum] =3D "7b07fa1c21749981ec0addcf8e9e85acfca91efe8d3f6498=
2a6ac0bc6a615e70"
--=20
1.7.1



