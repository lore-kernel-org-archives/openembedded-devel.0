Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P5Bop-0006qf-3Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:25:09 +0200
Received: by mail-pz0-f47.google.com with SMTP id 28so153178pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=LTSdMwJtEtIXxdc7liP7nMew9QChL2waACM3CZLCMjk=;
	b=blIZlUKLCFOXsCL1NVaDgTTUl3dBpao2JKAdDSoSRcjwdZR0Xl51yZNxfqhFA5fen5
	MlA9emk/q02yQ5Gh1EBjsdgH6jfEll+nddFYPy2lLrTfgJiMYCwfjHSzNV0X3walRUUT
	e2bbYVAoI3J/TGLGlpni/ZO6qG2hJ67S8+XKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=kLk/fki3nb3d43aU7aoo7wHmmdVX7n/IHLZHI0Hz4ev/OhC+Qbvi20sQOGx9XaaBFz
	+GQ+fVjLmnuZLoku6/ldX9XfP1HrLkCiYe6TF45GkdVYKVigajDfUlU0uF6bxCjZeLnJ
	ROLL0iHfVn6dX8e6cvTPUTHPxKl92t9QmIWWk=
Received: by 10.114.110.2 with SMTP id i2mr6541258wac.193.1286778282140;
	Sun, 10 Oct 2010 23:24:42 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p4sm6999558wal.3.2010.10.10.23.24.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 23:24:41 -0700 (PDT)
Message-ID: <4CB2ADA2.7080600@gmail.com>
Date: Mon, 11 Oct 2010 16:54:34 +1030
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
Subject: [PATCH] lua, lua-gtk2: move to obsolete.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:25:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Lua fails to build. There are newer recipes (lua5.1) in tree, only
lua-gtk2 uses this old recipe and nothing uses lua-gtk2.

mipsel-oe-linux-gcc -march=mips32 -o ../../bin/luac -L/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib -Wl,-rpath-link,/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib -Wl,-O1  -Wl,-E luac.o print.o lopcodes.o -L../../lib -llua -llualib -lm -ldl -lreadline
luac.o: In function `strip':
luac.c:(.text+0xa8): undefined reference to `luaM_realloc'
luac.c:(.text+0xc4): undefined reference to `luaM_realloc'
luac.c:(.text+0xdc): undefined reference to `luaM_realloc'
luac.o: In function `main':
luac.c:(.text+0x3f8): undefined reference to `lua_open'
luac.c:(.text+0x438): undefined reference to `lua_tostring'
luac.c:(.text+0x4cc): undefined reference to `luaM_realloc'
luac.c:(.text+0x4f4): undefined reference to `luaM_realloc'
collect2: ld returned 1 exit status
make[1]: *** [../../bin/luac] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch   |  352 --------------------
 recipes/lua/lua-gtk2_0.3.bb                        |   27 --
 recipes/lua/lua_5.0.2.bb                           |   18 -
 .../lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch       |  352 ++++++++++++++++++++
 recipes/obsolete/lua/lua-gtk2_0.3.bb               |   27 ++
 recipes/obsolete/lua/lua_5.0.2.bb                  |   18 +
 6 files changed, 397 insertions(+), 397 deletions(-)
 delete mode 100644 recipes/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch
 delete mode 100644 recipes/lua/lua-gtk2_0.3.bb
 delete mode 100644 recipes/lua/lua_5.0.2.bb
 create mode 100644 recipes/obsolete/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch
 create mode 100644 recipes/obsolete/lua/lua-gtk2_0.3.bb
 create mode 100644 recipes/obsolete/lua/lua_5.0.2.bb

diff --git a/recipes/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch b/recipes/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch
deleted file mode 100644
index 1115b6f..0000000
--- a/recipes/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch
+++ /dev/null
@@ -1,352 +0,0 @@
-diff -NbBur lua-gtk2-0.3_orig/configure lua-gtk2-0.3/configure
---- lua-gtk2-0.3_orig/configure	2005-08-16 19:32:07.000000000 +0200
-+++ lua-gtk2-0.3/configure	2006-05-14 02:52:39.000000000 +0200
-@@ -2,25 +2,19 @@
- 
- # examine system
- 
--CFLAGS="$(pkg-config gtk+-2.0 --cflags) $(pkg-config lua50 --cflags) -I build-linux -I src"
-+CFLAGS="-g -Wall -DLINUX -Os -fomit-frame-pointer -Wall $(pkg-config gtk+-2.0 --cflags) $(pkg-config lua50 --cflags) -I build-linux -I src"
- VERSION="0.3"
--
--if which gcc-4.0 > /dev/null; then
--	GCC=gcc-4.0
--elif which gcc > /dev/null; then
--	GCC=gcc
--else
--	@echo "No GCC found."
--	exit 1
--fi
--
--if true; then
--	CFLAGS2="-DLINUX"
--	LIBS="" # -lgtk-x11-2.0"
--else
--	CFLAGS2="-DWIN32"
--	LIBS=""
--fi
-+PREFIX="/usr/local"
-+GCC=arm-linux-gcc
-+HGCC=gcc
-+
-+#if true; then
-+#	CFLAGS2="-DLINUX"
-+#	LIBS="" # -lgtk-x11-2.0"
-+#else
-+#	CFLAGS2="-DWIN32"
-+#	LIBS=""
-+#fi
- 
- 
- # build makefile
-@@ -28,13 +22,14 @@
- cat > Makefile <<EOF
- # automatically generated makefile
- 
--# CFLAGS	:=-DLINUX -Os -fomit-frame-pointer -Wall $CFLAGS
-+#CFLAGS	:= \-DLINUX -Os -fomit-frame-pointer -Wall $CFLAGS
- # CFLAGS	:=-DLINUX -O2 -fomit-frame-pointer -Wall $CFLAGS
--CFLAGS	:=$CFLAGS2 -g -Wall $CFLAGS
-+CFLAGS	=$CFLAGS 
- HASH	:=hash2
- ODIR	:=build-linux/
- VERSION	:=$VERSION
- CC	:=$GCC
-+HGCC	:=$HGCC
- 
- all: \${ODIR}libluagtk2.so \${ODIR}main
- 
-@@ -46,6 +41,8 @@
- 	@\${CC} -shared -o \$@ $^ /usr/lib/libffi.a $LIBS
- 
- \${ODIR}generate: \${ODIR}generate.o \${ODIR}\${HASH}.o
-+	@echo \$@
-+	@\${HGCC} -Wall -c -g -o \$@ $^
- 
- \${ODIR}main.o: src/main.c
- 	@echo \$@
-@@ -99,9 +96,9 @@
- 	rm -f \${ODIR}file2c \${ODIR}override.luac \${ODIR}main
- 
- install: all
--	mkdir -p ~/.lua50
--	cp gtk2.lua ~/.lua50
--	ln -sf \$(PWD)/build-linux/libluagtk2.so ~/.lua50
-+	install -d \$(DESTDIR)/\$(PREFIX)/lib/lua50
-+	install gtk2.lua \$(DESTDIR)/\$(PREFIX)/lib/lua50
-+	install \$(PWD)/build-linux/libluagtk2.so \$(DESTDIR)/\$(PREFIX)/lib/lua50
- 
- tar:
- 	(cd ..; ln -s lua-gtk2 lua-gtk2-\${VERSION}; tar czvhf lua-gtk2-\${VERSION}.tar.gz \\
-diff -NbBur lua-gtk2-0.3_orig/configure_orig lua-gtk2-0.3/configure_orig
---- lua-gtk2-0.3_orig/configure_orig	1970-01-01 01:00:00.000000000 +0100
-+++ lua-gtk2-0.3/configure_orig	2006-05-13 18:22:03.000000000 +0200
-@@ -0,0 +1,114 @@
-+#! /bin/sh
-+
-+# examine system
-+
-+CFLAGS="$(pkg-config gtk+-2.0 --cflags) $(pkg-config lua50 --cflags) -I build-linux -I src"
-+VERSION="0.3"
-+
-+if which gcc-4.0 > /dev/null; then
-+	GCC=gcc-4.0
-+elif which gcc > /dev/null; then
-+	GCC=gcc
-+else
-+	@echo "No GCC found."
-+	exit 1
-+fi
-+
-+if true; then
-+	CFLAGS2="-DLINUX"
-+	LIBS="" # -lgtk-x11-2.0"
-+else
-+	CFLAGS2="-DWIN32"
-+	LIBS=""
-+fi
-+
-+
-+# build makefile
-+
-+cat > Makefile <<EOF
-+# automatically generated makefile
-+
-+# CFLAGS	:=-DLINUX -Os -fomit-frame-pointer -Wall $CFLAGS
-+# CFLAGS	:=-DLINUX -O2 -fomit-frame-pointer -Wall $CFLAGS
-+CFLAGS	:=$CFLAGS2 -g -Wall $CFLAGS
-+HASH	:=hash2
-+ODIR	:=build-linux/
-+VERSION	:=$VERSION
-+CC	:=$GCC
-+
-+all: \${ODIR}libluagtk2.so \${ODIR}main
-+
-+Makefile: configure
-+	./configure
-+
-+\${ODIR}libluagtk2.so: \${ODIR}libluagtk2.o \${ODIR}\${HASH}.o \${ODIR}hash.o \${ODIR}_funclist.o \${ODIR}_structlist.o \${ODIR}_enumlist.o \${ODIR}_override.o
-+	@echo \$@
-+	@\${CC} -shared -o \$@ $^ /usr/lib/libffi.a $LIBS
-+
-+\${ODIR}generate: \${ODIR}generate.o \${ODIR}\${HASH}.o
-+
-+\${ODIR}main.o: src/main.c
-+	@echo \$@
-+	@\${CC} -Wall -c -g -o \$@ $^ -I /usr/include/lua50
-+
-+\${ODIR}main: \${ODIR}main.o
-+	@echo \$@
-+	@\${CC} -o \$@ $^ -llua50 -llualib50
-+
-+\${ODIR}libluagtk2.o: src/libluagtk2.c \${ODIR}_typelist.c src/structinfo.h src/hash.h
-+
-+\${ODIR}_funclist.c: data/gtkdata.funcs \${ODIR}generate
-+	@echo \$@
-+	@\${ODIR}generate -s 4096 -o \$@ -p funclist_ -d $<
-+
-+\${ODIR}_structlist.c: data/gtkdata.structs.c
-+	cp -f \$< \$@
-+
-+\${ODIR}_typelist.c: data/gtkdata.types.c
-+	cp -f \$< \$@
-+
-+\${ODIR}_enumlist.c: data/gtkdata.enums src/extra_enum
-+	@echo \$@
-+	@cat $^ | \${ODIR}generate -s 1201 -o \$@ -p enumlist_ -d -f -
-+
-+\${ODIR}_override.c: \${ODIR}override.luac \${ODIR}file2c
-+	@echo \$@
-+	@\${ODIR}file2c < \$^ > \$@
-+	
-+data/gtkdata.structs.c:
-+	(cd data; ../script/gen-list.pl)
-+
-+build-linux/%.o: build-linux/%.c
-+	@echo \$@
-+	@\${CC} \${CFLAGS} -c -o \$@ \$<
-+
-+build-linux/%.o: src/%.c
-+	@echo \$@
-+	@\${CC} \${CFLAGS} -c -o \$@ \$<
-+
-+build-linux/%.s: src/%.c
-+	@echo \$@
-+	@\${CC} \${CFLAGS} -S -o \$@ \$<
-+
-+build-linux/%.luac: src/%.lua
-+	@echo \$@
-+	@luac -s -o \$@ \$<
-+
-+clean:
-+	rm -f \${ODIR}libluagtk2.so \${ODIR}generate \${ODIR}_*.c \${ODIR}*.o
-+	rm -f \${ODIR}file2c \${ODIR}override.luac \${ODIR}main
-+
-+install: all
-+	mkdir -p ~/.lua50
-+	cp gtk2.lua ~/.lua50
-+	ln -sf \$(PWD)/build-linux/libluagtk2.so ~/.lua50
-+
-+tar:
-+	(cd ..; ln -s lua-gtk2 lua-gtk2-\${VERSION}; tar czvhf lua-gtk2-\${VERSION}.tar.gz \\
-+	lua-gtk2-\${VERSION} --exclude old --exclude "build-*" --exclude foreign --exclude lua50 \\
-+	--exclude test-dll; rm lua-gtk2-\${VERSION})
-+
-+EOF
-+
-+mkdir -p build-linux build-win32
-+
-diff -NbBur lua-gtk2-0.3_orig/gtk2.lua lua-gtk2-0.3/gtk2.lua
---- lua-gtk2-0.3_orig/gtk2.lua	2005-08-16 19:26:14.000000000 +0200
-+++ lua-gtk2-0.3/gtk2.lua	1970-01-01 01:00:00.000000000 +0100
-@@ -1,16 +0,0 @@
--
---- if compiled in, _gtk is set.
--if _gtk == nil then
--
--	local init, err = loadlib(os.getenv("HOME") .. "/.lua50/libluagtk2.so",
--		"luaopen_gtk2")
--	if err then
--	    print(err)
--	    return
--	end
--	gtk = init()
--
--else
--	gtk = _gtk
--end
--
-diff -NbBur lua-gtk2-0.3_orig/gtk2.lua.in lua-gtk2-0.3/gtk2.lua.in
---- lua-gtk2-0.3_orig/gtk2.lua.in	1970-01-01 01:00:00.000000000 +0100
-+++ lua-gtk2-0.3/gtk2.lua.in	2006-05-15 01:20:24.000000000 +0200
-@@ -0,0 +1,16 @@
-+
-+-- if compiled in, _gtk is set.
-+if _gtk == nil then
-+
-+	local init, err = loadlib("PREFIX/lib/lua50/libluagtk2.so",
-+		"luaopen_gtk2")
-+	if err then
-+	    print(err)
-+	    return
-+	end
-+	gtk = init()
-+
-+else
-+	gtk = _gtk
-+end
-+
-diff -NbBur lua-gtk2-0.3_orig/Makefile lua-gtk2-0.3/Makefile
---- lua-gtk2-0.3_orig/Makefile	2005-08-16 19:32:08.000000000 +0200
-+++ lua-gtk2-0.3/Makefile	2006-05-16 03:09:41.000000000 +0200
-@@ -1,31 +1,46 @@
- # automatically generated makefile
- 
--# CFLAGS	:=-DLINUX -Os -fomit-frame-pointer -Wall -DXTHREADS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include   -I/usr/include//lua50   -I build-linux -I src
--# CFLAGS	:=-DLINUX -O2 -fomit-frame-pointer -Wall -DXTHREADS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include   -I/usr/include//lua50   -I build-linux -I src
--CFLAGS	:=-DLINUX -g -Wall -DXTHREADS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include   -I/usr/include//lua50   -I build-linux -I src
-+PACKAGE_CFLAGS	=-g -Wall -DLINUX -Os -fomit-frame-pointer -Wall -DXTHREADS -DXUSE_MTSAFE_API `pkg-config --cflags gtk+-2.0`
- HASH	:=hash2
- ODIR	:=build-linux/
- VERSION	:=0.3
--CC	:=gcc-4.0
-+CC	:=arm-linux-gcc
-+HGCC	:=gcc
-+PREFIX  := /usr/local
-+LIBDIR  := $(PREFIX)/lib/
- 
--all: ${ODIR}libluagtk2.so ${ODIR}main
-+all: ${ODIR}libluagtk2.so ${ODIR}main gtk2.lua
- 
--Makefile: configure
--	./configure
-+%.lua %.lua.in:
-+	sed 's:PREFIX:$(PREFIX):' < '$@.in' > $@
- 
- ${ODIR}libluagtk2.so: ${ODIR}libluagtk2.o ${ODIR}${HASH}.o ${ODIR}hash.o ${ODIR}_funclist.o ${ODIR}_structlist.o ${ODIR}_enumlist.o ${ODIR}_override.o
- 	@echo $@
--	@${CC} -shared -o $@ $^ /usr/lib/libffi.a 
-+	@${CC} -shared -o $@ $^ ${LIBDIR}/libffi.a 
- 
--${ODIR}generate: ${ODIR}generate.o ${ODIR}${HASH}.o
-+${ODIR}file2c:
-+	@echo $@
-+	@${HGCC} -o $@ src/file2c.c
-+	
-+${ODIR}generate.o:
-+	@echo $@
-+	@${HGCC} -c -o $@ src/generate.c
-+
-+${ODIR}${HASH}_host.o:
-+	@echo $@
-+	@${HGCC} -c -o $@ src/${HASH}.c
-+
-+${ODIR}generate: ${ODIR}generate.o ${ODIR}${HASH}_host.o
-+	@echo $@
-+	@${HGCC} -Wall -g -o $@ $^
- 
- ${ODIR}main.o: src/main.c
- 	@echo $@
--	@${CC} -Wall -c -g -o $@ $^ -I /usr/include/lua50
-+	@${HGCC} $(CFLAGS) -Wall -c -g -o $@ $^ -I /usr/include/lua50
- 
- ${ODIR}main: ${ODIR}main.o
- 	@echo $@
--	@${CC} -o $@ $^ -llua50 -llualib50
-+	@${HGCC} $(CFLAGS) $(PACKAGE_CFLAGS) -o $@ $^ -llua -llualib
- 
- ${ODIR}libluagtk2.o: src/libluagtk2.c ${ODIR}_typelist.c src/structinfo.h src/hash.h
- 
-@@ -52,15 +67,15 @@
- 
- build-linux/%.o: build-linux/%.c
- 	@echo $@
--	@${CC} ${CFLAGS} -c -o $@ $<
-+	@${CC} $(PACKAGE_CFLAGS) $(CFLAGS) -c -o $@ $<
- 
- build-linux/%.o: src/%.c
- 	@echo $@
--	@${CC} ${CFLAGS} -c -o $@ $<
-+	@${CC} $(PACKAGE_CFLAGS) $(CFLAGS) -c -o $@ $<
- 
- build-linux/%.s: src/%.c
- 	@echo $@
--	@${CC} ${CFLAGS} -S -o $@ $<
-+	@${CC} $(PACKAGE_CFLAGS) $(CFLAGS) -S -o $@ $<
- 
- build-linux/%.luac: src/%.lua
- 	@echo $@
-@@ -68,12 +83,13 @@
- 
- clean:
- 	rm -f ${ODIR}libluagtk2.so ${ODIR}generate ${ODIR}_*.c ${ODIR}*.o
--	rm -f ${ODIR}file2c ${ODIR}override.luac ${ODIR}main
-+	rm -f ${ODIR}file2c ${ODIR}override.luac ${ODIR}main gtk2.lua
- 
- install: all
--	mkdir -p ~/.lua50
--	cp gtk2.lua ~/.lua50
--	ln -sf $(PWD)/build-linux/libluagtk2.so ~/.lua50
-+	install -d $(DESTDIR)/$(PREFIX)/share/lua
-+	install gtk2.lua $(DESTDIR)/$(PREFIX)/share/lua
-+	install -d $(DESTDIR)/$(PREFIX)/lib/lua50
-+	install $(PWD)/build-linux/libluagtk2.so $(DESTDIR)/$(PREFIX)/lib/lua50
- 
- tar:
- 	(cd ..; ln -s lua-gtk2 lua-gtk2-${VERSION}; tar czvhf lua-gtk2-${VERSION}.tar.gz \
-diff -NbBur lua-gtk2-0.3_orig/src/libluagtk2.c lua-gtk2-0.3/src/libluagtk2.c
---- lua-gtk2-0.3_orig/src/libluagtk2.c	2005-08-16 18:22:00.000000000 +0200
-+++ lua-gtk2-0.3/src/libluagtk2.c	2006-05-15 01:31:09.000000000 +0200
-@@ -27,9 +27,9 @@
- 
- static const char *dll_list[] = {
- #ifdef LINUX
--    "/usr/lib/libgtk-x11-2.0.so",
--    "/usr/lib/libgdk-x11-2.0.so",
--    "/usr/lib/libpango-1.0.so",
-+    "/usr/lib/libgtk-x11-2.0.so.0",
-+    "/usr/lib/libgdk-x11-2.0.so.0",
-+    "/usr/lib/libpango-1.0.so.0",
- #endif
- #ifdef WIN32
-     "C:/GTK/bin/libgtk-win32-2.0-0.dll",
diff --git a/recipes/lua/lua-gtk2_0.3.bb b/recipes/lua/lua-gtk2_0.3.bb
deleted file mode 100644
index 355ef93..0000000
--- a/recipes/lua/lua-gtk2_0.3.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "GTK bindings for LUA"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "GPLv2"
-DEPENDS = "gtk+ lua-native perl-native readline libffi"
-RDEPENDS_${PN} = "lua"
-PR = "r1"
-
-inherit gpe
-
-SRC_URI = "http://luaforge.net/frs/download.php/989/${P}.tar.gz \
-	file://lua-gtk2-0.3_fixbuild.patch"
-
-FILES_${PN} =  "${datadir}/lua   ${libdir}/lua50"
-
-CFLAGS_append = " -I '${S}/build-linux' -I src -DLINUX -I${STAGING_INCDIR} -L${STAGING_LIBDIR} -L${STAGING_LIBDIR_NATIVE}"
-
-do_compile () {
-	oe_runmake PREFIX='${prefix}' HGCC='${BUILD_CC}' LIBDIR='${STAGING_LIBDIR}' ODIR='build-linux/' CFLAGS='${CFLAGS}'
-}
-
-do_configure_append () {
-	cd ${S} && mkdir build-linux
-}
-
-SRC_URI[md5sum] = "a2788c45d60ef8ce30168811d7e72334"
-SRC_URI[sha256sum] = "b3dd85e34b22cf757eafb6ef15c5505d5ec5e71803caef4b69ddc7fd5d46fabe"
diff --git a/recipes/lua/lua_5.0.2.bb b/recipes/lua/lua_5.0.2.bb
deleted file mode 100644
index e23ed89..0000000
--- a/recipes/lua/lua_5.0.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require lua.inc
-
-DEPENDS += "readline"
-PR = "r5"
-SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
-	   file://debian.patch \
-	   file://make.patch \
-	   file://advanced-readline.patch"
-#	   http://lua-users.org/files/wiki_insecure/power_patches/5.0/advanced-readline.patch"
-S = "${WORKDIR}/lua-${PV}"
-
-require lua-build.inc
-inherit binconfig
-NATIVE_INSTALL_WORKS = 1
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "dea74646b7e5c621fef7174df83c34b1"
-SRC_URI[sha256sum] = "a6c85d85f912e1c321723084389d63dee7660b81b8292452b190ea7190dd73bc"
diff --git a/recipes/obsolete/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch b/recipes/obsolete/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch
new file mode 100644
index 0000000..1115b6f
--- /dev/null
+++ b/recipes/obsolete/lua/lua-gtk2/lua-gtk2-0.3_fixbuild.patch
@@ -0,0 +1,352 @@
+diff -NbBur lua-gtk2-0.3_orig/configure lua-gtk2-0.3/configure
+--- lua-gtk2-0.3_orig/configure	2005-08-16 19:32:07.000000000 +0200
++++ lua-gtk2-0.3/configure	2006-05-14 02:52:39.000000000 +0200
+@@ -2,25 +2,19 @@
+ 
+ # examine system
+ 
+-CFLAGS="$(pkg-config gtk+-2.0 --cflags) $(pkg-config lua50 --cflags) -I build-linux -I src"
++CFLAGS="-g -Wall -DLINUX -Os -fomit-frame-pointer -Wall $(pkg-config gtk+-2.0 --cflags) $(pkg-config lua50 --cflags) -I build-linux -I src"
+ VERSION="0.3"
+-
+-if which gcc-4.0 > /dev/null; then
+-	GCC=gcc-4.0
+-elif which gcc > /dev/null; then
+-	GCC=gcc
+-else
+-	@echo "No GCC found."
+-	exit 1
+-fi
+-
+-if true; then
+-	CFLAGS2="-DLINUX"
+-	LIBS="" # -lgtk-x11-2.0"
+-else
+-	CFLAGS2="-DWIN32"
+-	LIBS=""
+-fi
++PREFIX="/usr/local"
++GCC=arm-linux-gcc
++HGCC=gcc
++
++#if true; then
++#	CFLAGS2="-DLINUX"
++#	LIBS="" # -lgtk-x11-2.0"
++#else
++#	CFLAGS2="-DWIN32"
++#	LIBS=""
++#fi
+ 
+ 
+ # build makefile
+@@ -28,13 +22,14 @@
+ cat > Makefile <<EOF
+ # automatically generated makefile
+ 
+-# CFLAGS	:=-DLINUX -Os -fomit-frame-pointer -Wall $CFLAGS
++#CFLAGS	:= \-DLINUX -Os -fomit-frame-pointer -Wall $CFLAGS
+ # CFLAGS	:=-DLINUX -O2 -fomit-frame-pointer -Wall $CFLAGS
+-CFLAGS	:=$CFLAGS2 -g -Wall $CFLAGS
++CFLAGS	=$CFLAGS 
+ HASH	:=hash2
+ ODIR	:=build-linux/
+ VERSION	:=$VERSION
+ CC	:=$GCC
++HGCC	:=$HGCC
+ 
+ all: \${ODIR}libluagtk2.so \${ODIR}main
+ 
+@@ -46,6 +41,8 @@
+ 	@\${CC} -shared -o \$@ $^ /usr/lib/libffi.a $LIBS
+ 
+ \${ODIR}generate: \${ODIR}generate.o \${ODIR}\${HASH}.o
++	@echo \$@
++	@\${HGCC} -Wall -c -g -o \$@ $^
+ 
+ \${ODIR}main.o: src/main.c
+ 	@echo \$@
+@@ -99,9 +96,9 @@
+ 	rm -f \${ODIR}file2c \${ODIR}override.luac \${ODIR}main
+ 
+ install: all
+-	mkdir -p ~/.lua50
+-	cp gtk2.lua ~/.lua50
+-	ln -sf \$(PWD)/build-linux/libluagtk2.so ~/.lua50
++	install -d \$(DESTDIR)/\$(PREFIX)/lib/lua50
++	install gtk2.lua \$(DESTDIR)/\$(PREFIX)/lib/lua50
++	install \$(PWD)/build-linux/libluagtk2.so \$(DESTDIR)/\$(PREFIX)/lib/lua50
+ 
+ tar:
+ 	(cd ..; ln -s lua-gtk2 lua-gtk2-\${VERSION}; tar czvhf lua-gtk2-\${VERSION}.tar.gz \\
+diff -NbBur lua-gtk2-0.3_orig/configure_orig lua-gtk2-0.3/configure_orig
+--- lua-gtk2-0.3_orig/configure_orig	1970-01-01 01:00:00.000000000 +0100
++++ lua-gtk2-0.3/configure_orig	2006-05-13 18:22:03.000000000 +0200
+@@ -0,0 +1,114 @@
++#! /bin/sh
++
++# examine system
++
++CFLAGS="$(pkg-config gtk+-2.0 --cflags) $(pkg-config lua50 --cflags) -I build-linux -I src"
++VERSION="0.3"
++
++if which gcc-4.0 > /dev/null; then
++	GCC=gcc-4.0
++elif which gcc > /dev/null; then
++	GCC=gcc
++else
++	@echo "No GCC found."
++	exit 1
++fi
++
++if true; then
++	CFLAGS2="-DLINUX"
++	LIBS="" # -lgtk-x11-2.0"
++else
++	CFLAGS2="-DWIN32"
++	LIBS=""
++fi
++
++
++# build makefile
++
++cat > Makefile <<EOF
++# automatically generated makefile
++
++# CFLAGS	:=-DLINUX -Os -fomit-frame-pointer -Wall $CFLAGS
++# CFLAGS	:=-DLINUX -O2 -fomit-frame-pointer -Wall $CFLAGS
++CFLAGS	:=$CFLAGS2 -g -Wall $CFLAGS
++HASH	:=hash2
++ODIR	:=build-linux/
++VERSION	:=$VERSION
++CC	:=$GCC
++
++all: \${ODIR}libluagtk2.so \${ODIR}main
++
++Makefile: configure
++	./configure
++
++\${ODIR}libluagtk2.so: \${ODIR}libluagtk2.o \${ODIR}\${HASH}.o \${ODIR}hash.o \${ODIR}_funclist.o \${ODIR}_structlist.o \${ODIR}_enumlist.o \${ODIR}_override.o
++	@echo \$@
++	@\${CC} -shared -o \$@ $^ /usr/lib/libffi.a $LIBS
++
++\${ODIR}generate: \${ODIR}generate.o \${ODIR}\${HASH}.o
++
++\${ODIR}main.o: src/main.c
++	@echo \$@
++	@\${CC} -Wall -c -g -o \$@ $^ -I /usr/include/lua50
++
++\${ODIR}main: \${ODIR}main.o
++	@echo \$@
++	@\${CC} -o \$@ $^ -llua50 -llualib50
++
++\${ODIR}libluagtk2.o: src/libluagtk2.c \${ODIR}_typelist.c src/structinfo.h src/hash.h
++
++\${ODIR}_funclist.c: data/gtkdata.funcs \${ODIR}generate
++	@echo \$@
++	@\${ODIR}generate -s 4096 -o \$@ -p funclist_ -d $<
++
++\${ODIR}_structlist.c: data/gtkdata.structs.c
++	cp -f \$< \$@
++
++\${ODIR}_typelist.c: data/gtkdata.types.c
++	cp -f \$< \$@
++
++\${ODIR}_enumlist.c: data/gtkdata.enums src/extra_enum
++	@echo \$@
++	@cat $^ | \${ODIR}generate -s 1201 -o \$@ -p enumlist_ -d -f -
++
++\${ODIR}_override.c: \${ODIR}override.luac \${ODIR}file2c
++	@echo \$@
++	@\${ODIR}file2c < \$^ > \$@
++	
++data/gtkdata.structs.c:
++	(cd data; ../script/gen-list.pl)
++
++build-linux/%.o: build-linux/%.c
++	@echo \$@
++	@\${CC} \${CFLAGS} -c -o \$@ \$<
++
++build-linux/%.o: src/%.c
++	@echo \$@
++	@\${CC} \${CFLAGS} -c -o \$@ \$<
++
++build-linux/%.s: src/%.c
++	@echo \$@
++	@\${CC} \${CFLAGS} -S -o \$@ \$<
++
++build-linux/%.luac: src/%.lua
++	@echo \$@
++	@luac -s -o \$@ \$<
++
++clean:
++	rm -f \${ODIR}libluagtk2.so \${ODIR}generate \${ODIR}_*.c \${ODIR}*.o
++	rm -f \${ODIR}file2c \${ODIR}override.luac \${ODIR}main
++
++install: all
++	mkdir -p ~/.lua50
++	cp gtk2.lua ~/.lua50
++	ln -sf \$(PWD)/build-linux/libluagtk2.so ~/.lua50
++
++tar:
++	(cd ..; ln -s lua-gtk2 lua-gtk2-\${VERSION}; tar czvhf lua-gtk2-\${VERSION}.tar.gz \\
++	lua-gtk2-\${VERSION} --exclude old --exclude "build-*" --exclude foreign --exclude lua50 \\
++	--exclude test-dll; rm lua-gtk2-\${VERSION})
++
++EOF
++
++mkdir -p build-linux build-win32
++
+diff -NbBur lua-gtk2-0.3_orig/gtk2.lua lua-gtk2-0.3/gtk2.lua
+--- lua-gtk2-0.3_orig/gtk2.lua	2005-08-16 19:26:14.000000000 +0200
++++ lua-gtk2-0.3/gtk2.lua	1970-01-01 01:00:00.000000000 +0100
+@@ -1,16 +0,0 @@
+-
+--- if compiled in, _gtk is set.
+-if _gtk == nil then
+-
+-	local init, err = loadlib(os.getenv("HOME") .. "/.lua50/libluagtk2.so",
+-		"luaopen_gtk2")
+-	if err then
+-	    print(err)
+-	    return
+-	end
+-	gtk = init()
+-
+-else
+-	gtk = _gtk
+-end
+-
+diff -NbBur lua-gtk2-0.3_orig/gtk2.lua.in lua-gtk2-0.3/gtk2.lua.in
+--- lua-gtk2-0.3_orig/gtk2.lua.in	1970-01-01 01:00:00.000000000 +0100
++++ lua-gtk2-0.3/gtk2.lua.in	2006-05-15 01:20:24.000000000 +0200
+@@ -0,0 +1,16 @@
++
++-- if compiled in, _gtk is set.
++if _gtk == nil then
++
++	local init, err = loadlib("PREFIX/lib/lua50/libluagtk2.so",
++		"luaopen_gtk2")
++	if err then
++	    print(err)
++	    return
++	end
++	gtk = init()
++
++else
++	gtk = _gtk
++end
++
+diff -NbBur lua-gtk2-0.3_orig/Makefile lua-gtk2-0.3/Makefile
+--- lua-gtk2-0.3_orig/Makefile	2005-08-16 19:32:08.000000000 +0200
++++ lua-gtk2-0.3/Makefile	2006-05-16 03:09:41.000000000 +0200
+@@ -1,31 +1,46 @@
+ # automatically generated makefile
+ 
+-# CFLAGS	:=-DLINUX -Os -fomit-frame-pointer -Wall -DXTHREADS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include   -I/usr/include//lua50   -I build-linux -I src
+-# CFLAGS	:=-DLINUX -O2 -fomit-frame-pointer -Wall -DXTHREADS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include   -I/usr/include//lua50   -I build-linux -I src
+-CFLAGS	:=-DLINUX -g -Wall -DXTHREADS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/X11R6/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include   -I/usr/include//lua50   -I build-linux -I src
++PACKAGE_CFLAGS	=-g -Wall -DLINUX -Os -fomit-frame-pointer -Wall -DXTHREADS -DXUSE_MTSAFE_API `pkg-config --cflags gtk+-2.0`
+ HASH	:=hash2
+ ODIR	:=build-linux/
+ VERSION	:=0.3
+-CC	:=gcc-4.0
++CC	:=arm-linux-gcc
++HGCC	:=gcc
++PREFIX  := /usr/local
++LIBDIR  := $(PREFIX)/lib/
+ 
+-all: ${ODIR}libluagtk2.so ${ODIR}main
++all: ${ODIR}libluagtk2.so ${ODIR}main gtk2.lua
+ 
+-Makefile: configure
+-	./configure
++%.lua %.lua.in:
++	sed 's:PREFIX:$(PREFIX):' < '$@.in' > $@
+ 
+ ${ODIR}libluagtk2.so: ${ODIR}libluagtk2.o ${ODIR}${HASH}.o ${ODIR}hash.o ${ODIR}_funclist.o ${ODIR}_structlist.o ${ODIR}_enumlist.o ${ODIR}_override.o
+ 	@echo $@
+-	@${CC} -shared -o $@ $^ /usr/lib/libffi.a 
++	@${CC} -shared -o $@ $^ ${LIBDIR}/libffi.a 
+ 
+-${ODIR}generate: ${ODIR}generate.o ${ODIR}${HASH}.o
++${ODIR}file2c:
++	@echo $@
++	@${HGCC} -o $@ src/file2c.c
++	
++${ODIR}generate.o:
++	@echo $@
++	@${HGCC} -c -o $@ src/generate.c
++
++${ODIR}${HASH}_host.o:
++	@echo $@
++	@${HGCC} -c -o $@ src/${HASH}.c
++
++${ODIR}generate: ${ODIR}generate.o ${ODIR}${HASH}_host.o
++	@echo $@
++	@${HGCC} -Wall -g -o $@ $^
+ 
+ ${ODIR}main.o: src/main.c
+ 	@echo $@
+-	@${CC} -Wall -c -g -o $@ $^ -I /usr/include/lua50
++	@${HGCC} $(CFLAGS) -Wall -c -g -o $@ $^ -I /usr/include/lua50
+ 
+ ${ODIR}main: ${ODIR}main.o
+ 	@echo $@
+-	@${CC} -o $@ $^ -llua50 -llualib50
++	@${HGCC} $(CFLAGS) $(PACKAGE_CFLAGS) -o $@ $^ -llua -llualib
+ 
+ ${ODIR}libluagtk2.o: src/libluagtk2.c ${ODIR}_typelist.c src/structinfo.h src/hash.h
+ 
+@@ -52,15 +67,15 @@
+ 
+ build-linux/%.o: build-linux/%.c
+ 	@echo $@
+-	@${CC} ${CFLAGS} -c -o $@ $<
++	@${CC} $(PACKAGE_CFLAGS) $(CFLAGS) -c -o $@ $<
+ 
+ build-linux/%.o: src/%.c
+ 	@echo $@
+-	@${CC} ${CFLAGS} -c -o $@ $<
++	@${CC} $(PACKAGE_CFLAGS) $(CFLAGS) -c -o $@ $<
+ 
+ build-linux/%.s: src/%.c
+ 	@echo $@
+-	@${CC} ${CFLAGS} -S -o $@ $<
++	@${CC} $(PACKAGE_CFLAGS) $(CFLAGS) -S -o $@ $<
+ 
+ build-linux/%.luac: src/%.lua
+ 	@echo $@
+@@ -68,12 +83,13 @@
+ 
+ clean:
+ 	rm -f ${ODIR}libluagtk2.so ${ODIR}generate ${ODIR}_*.c ${ODIR}*.o
+-	rm -f ${ODIR}file2c ${ODIR}override.luac ${ODIR}main
++	rm -f ${ODIR}file2c ${ODIR}override.luac ${ODIR}main gtk2.lua
+ 
+ install: all
+-	mkdir -p ~/.lua50
+-	cp gtk2.lua ~/.lua50
+-	ln -sf $(PWD)/build-linux/libluagtk2.so ~/.lua50
++	install -d $(DESTDIR)/$(PREFIX)/share/lua
++	install gtk2.lua $(DESTDIR)/$(PREFIX)/share/lua
++	install -d $(DESTDIR)/$(PREFIX)/lib/lua50
++	install $(PWD)/build-linux/libluagtk2.so $(DESTDIR)/$(PREFIX)/lib/lua50
+ 
+ tar:
+ 	(cd ..; ln -s lua-gtk2 lua-gtk2-${VERSION}; tar czvhf lua-gtk2-${VERSION}.tar.gz \
+diff -NbBur lua-gtk2-0.3_orig/src/libluagtk2.c lua-gtk2-0.3/src/libluagtk2.c
+--- lua-gtk2-0.3_orig/src/libluagtk2.c	2005-08-16 18:22:00.000000000 +0200
++++ lua-gtk2-0.3/src/libluagtk2.c	2006-05-15 01:31:09.000000000 +0200
+@@ -27,9 +27,9 @@
+ 
+ static const char *dll_list[] = {
+ #ifdef LINUX
+-    "/usr/lib/libgtk-x11-2.0.so",
+-    "/usr/lib/libgdk-x11-2.0.so",
+-    "/usr/lib/libpango-1.0.so",
++    "/usr/lib/libgtk-x11-2.0.so.0",
++    "/usr/lib/libgdk-x11-2.0.so.0",
++    "/usr/lib/libpango-1.0.so.0",
+ #endif
+ #ifdef WIN32
+     "C:/GTK/bin/libgtk-win32-2.0-0.dll",
diff --git a/recipes/obsolete/lua/lua-gtk2_0.3.bb b/recipes/obsolete/lua/lua-gtk2_0.3.bb
new file mode 100644
index 0000000..355ef93
--- /dev/null
+++ b/recipes/obsolete/lua/lua-gtk2_0.3.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "GTK bindings for LUA"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "gtk+ lua-native perl-native readline libffi"
+RDEPENDS_${PN} = "lua"
+PR = "r1"
+
+inherit gpe
+
+SRC_URI = "http://luaforge.net/frs/download.php/989/${P}.tar.gz \
+	file://lua-gtk2-0.3_fixbuild.patch"
+
+FILES_${PN} =  "${datadir}/lua   ${libdir}/lua50"
+
+CFLAGS_append = " -I '${S}/build-linux' -I src -DLINUX -I${STAGING_INCDIR} -L${STAGING_LIBDIR} -L${STAGING_LIBDIR_NATIVE}"
+
+do_compile () {
+	oe_runmake PREFIX='${prefix}' HGCC='${BUILD_CC}' LIBDIR='${STAGING_LIBDIR}' ODIR='build-linux/' CFLAGS='${CFLAGS}'
+}
+
+do_configure_append () {
+	cd ${S} && mkdir build-linux
+}
+
+SRC_URI[md5sum] = "a2788c45d60ef8ce30168811d7e72334"
+SRC_URI[sha256sum] = "b3dd85e34b22cf757eafb6ef15c5505d5ec5e71803caef4b69ddc7fd5d46fabe"
diff --git a/recipes/obsolete/lua/lua_5.0.2.bb b/recipes/obsolete/lua/lua_5.0.2.bb
new file mode 100644
index 0000000..e23ed89
--- /dev/null
+++ b/recipes/obsolete/lua/lua_5.0.2.bb
@@ -0,0 +1,18 @@
+require lua.inc
+
+DEPENDS += "readline"
+PR = "r5"
+SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
+	   file://debian.patch \
+	   file://make.patch \
+	   file://advanced-readline.patch"
+#	   http://lua-users.org/files/wiki_insecure/power_patches/5.0/advanced-readline.patch"
+S = "${WORKDIR}/lua-${PV}"
+
+require lua-build.inc
+inherit binconfig
+NATIVE_INSTALL_WORKS = 1
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "dea74646b7e5c621fef7174df83c34b1"
+SRC_URI[sha256sum] = "a6c85d85f912e1c321723084389d63dee7660b81b8292452b190ea7190dd73bc"
-- 
1.7.1



