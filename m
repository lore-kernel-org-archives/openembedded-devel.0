Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A90427F50E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:20:31 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v17so6355868wml.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9aspXpLFnMjst1bSf9RtuZq1cfpAzTvAt/9v2UV8ZSk=;
	b=LIAKxRqvXaHceEPU9rVfTsOqi99zvd9CLtwY1q0J5sH/94aa0iB7LyvqfskZ/bYjke
	7sozxP5ra9yjups487vOaJgyVWrV3U7cds5xJ5oaWuNpXlVQeg/QBpFxhQa5EK40ViGB
	TkFzVUwxnjQN3lNK9WH5akGcx7ME02PaU8cAAl6MGXs/xE9ipbKcTxPzN0f9K/v/QzqZ
	J0Wr6dMU7GjpKqnWFMFTwxjf++v2DH9562OuHr4Kge2EveiCkr+V9KOumdvBJiWbTywY
	dlD5FEEgmkkQKuKBqeviuMz+H8UEXseCUTLj22zoVbXAQ1cnAiCH9Lhy0GIRFBxif3Jx
	gYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9aspXpLFnMjst1bSf9RtuZq1cfpAzTvAt/9v2UV8ZSk=;
	b=pz6pR+sP3aXIugps35PfLaN9cT4Oud+oBfYFO9LmNPMH4pVd82Jc6nxWSvqJyCRmDI
	wqKr+H1pUKNa74fyywijwZ76+le41IZy+VqB77lvcQXAPqyHMxTZ51O88EnfKEAA1Yww
	gXfVURRMlaoNsf3SWANICx/+0gYhBcK69ZwLnLcY+AU9htaGU77TLv++9gU4jJ2Oihwg
	uYhqkQJU4TqH4MLs0rA1uPmODFChnVAh8NTNZtKFeu78hH+WjnkAJrN7tmnlD81evCo1
	NnWTloUZ9SnM+u7kgkX66kpgTzCb4ZFT/kXtpU7X6NZQyH/JS0dpGqksEdbSnge5Pre4
	vEUg==
X-Gm-Message-State: APjAAAXsQtusTpVnkHIHWwxHj1jHfT47Y6gWHbAz6xCY0Oy79C8huzAW
	vZwUtsGRksh9wUpwZ9SJ9SPSCaOXBms=
X-Google-Smtp-Source: APXvYqwDNPhvzX3GE8ZWFUxr2EjdYZvSDa6jTF6YBqv4vIUywC5suqr4ZAh67/iJ/vEpU2fPOeeH6A==
X-Received: by 2002:a1c:20d8:: with SMTP id g207mr7259926wmg.79.1570706432069; 
	Thu, 10 Oct 2019 04:20:32 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q3sm6232426wru.33.2019.10.10.04.20.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:20:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:20:25 +0200
Message-Id: <20191010112025.4090-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lua: change a hard readline dependency into an optional one
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
X-List-Received-Date: Thu, 10 Oct 2019 11:20:32 -0000

This requires patching the source code, as readline is hardcoded
in there.

The rationale is to allow disabling the dependency on a gplv3
component (readline) where that license is blacklisted.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ilding-lua-without-readline-on-Linux.patch | 59 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.5.bb     |  9 ++-
 2 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch

diff --git a/meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch b/meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
new file mode 100644
index 000000000..e76790086
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/0001-Allow-building-lua-without-readline-on-Linux.patch
@@ -0,0 +1,59 @@
+From 601ef636fc4dfb2af3e7fda88d8ea1c1d92affe4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 Oct 2019 17:54:15 +0200
+Subject: [PATCH] Allow building lua without readline on Linux
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile      | 2 +-
+ src/Makefile  | 3 +++
+ src/luaconf.h | 5 +++++
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 119110d..9f6df45 100644
+--- a/Makefile
++++ b/Makefile
+@@ -36,7 +36,7 @@ RM= rm -f
+ # == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======
+ 
+ # Convenience platforms targets.
+-PLATS= aix bsd c89 freebsd generic linux macosx mingw posix solaris
++PLATS= aix bsd c89 freebsd generic linux linux-no-readline macosx mingw posix solaris
+ 
+ # What to install.
+ TO_BIN= lua luac
+diff --git a/src/Makefile b/src/Makefile
+index 64c78f7..5c0428a 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -109,6 +109,9 @@ generic: $(ALL)
+ linux:
+ 	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl -lreadline"
+ 
++linux-no-readline:
++	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX_NO_READLINE" SYSLIBS="-Wl,-E -ldl"
++
+ macosx:
+ 	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX" SYSLIBS="-lreadline"
+ 
+diff --git a/src/luaconf.h b/src/luaconf.h
+index 9eeeea6..d71ca25 100644
+--- a/src/luaconf.h
++++ b/src/luaconf.h
+@@ -64,6 +64,11 @@
+ #define LUA_USE_READLINE	/* needs some extra libraries */
+ #endif
+ 
++#if defined(LUA_USE_LINUX_NO_READLINE)
++#define LUA_USE_POSIX
++#define LUA_USE_DLOPEN		/* needs an extra library: -ldl */
++#endif
++
+ 
+ #if defined(LUA_USE_MACOSX)
+ #define LUA_USE_POSIX
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
index 265e2519e..ae41e627f 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.5.bb
@@ -4,9 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=60aa5cfdbd40086501778d9b6ebf29ee"
 HOMEPAGE = "http://www.lua.org/"
 
-DEPENDS = "readline"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
+           file://0001-Allow-building-lua-without-readline-on-Linux.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
@@ -24,18 +24,21 @@ SRC_URI[tarballtest.sha256sum] = "b80771238271c72565e5a1183292ef31bd7166414cd0d4
 
 inherit pkgconfig binconfig ptest
 
+PACKAGECONFIG ??= "readline"
+PACKAGECONFIG[readline] = ",,readline"
+
 UCLIBC_PATCHES += "file://uclibc-pthread.patch"
 SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
 
 TARGET_CC_ARCH += " -fPIC ${LDFLAGS}"
-EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -DLUA_USE_LINUX -fPIC' MYLDFLAGS='${LDFLAGS}'"
+EXTRA_OEMAKE = "'CC=${CC} -fPIC' 'MYCFLAGS=${CFLAGS} -fPIC' MYLDFLAGS='${LDFLAGS}'"
 
 do_configure_prepend() {
     sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
 }
 
 do_compile () {
-    oe_runmake linux
+    oe_runmake ${@bb.utils.contains('PACKAGECONFIG', 'readline', 'linux', 'linux-no-readline', d)}
 }
 
 do_install () {
-- 
2.17.1


