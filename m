Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id AF6506D37C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 08:56:48 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hp15so2813705lab.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GALHRVUkbilWjKhyhFX3RViUtLHBo/H/eei4+S0zR4E=;
	b=nU5UDx0wB8t5XDK+uunLmFkp8JFI+sM4cmvgnQ/8PQyEledSr1AS00qud4LbRwH2rk
	cwGPDv7mRQtc5/touUNUir3jgNZ+dTHhI5uq8wLDBNSlGmcO4Sng4kyTAzbbZcGNa+Yz
	HLWlYaGFLm9dZhFIG0xgqSDAylvI99eL/w/kBxD7mQrl/WRSFQmAXN7xaR9XoY2YiMt9
	v9t14LFG2/Ak0wP+9b3nrUhfoXPNt69m+1LUajAMS4xHTqzy50z57HTMO7M5KY/Rzw74
	9Ju/JCqSfHqMMWYH6nN0QE5q91vs0OP57SACCvho1DddCStvuEaXS5mhWhrFVQ8mDHc3
	fHdg==
X-Received: by 10.152.120.194 with SMTP id le2mr36284lab.68.1382691409451;
	Fri, 25 Oct 2013 01:56:49 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id kx1sm5577988lac.7.2013.10.25.01.56.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Oct 2013 01:56:48 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZdCI-000121-H1; Fri, 25 Oct 2013 11:56:46 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2013 11:56:36 +0300
Message-Id: <1382691396-3929-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-oe][PATCH] lua5.1: apply lua.org patches for lua-5.1.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2013 08:56:49 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch | 18 +++++++++
 meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch | 44 ++++++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb       |  4 +-
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
 create mode 100644 meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch

diff --git a/meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
new file mode 100644
index 0000000..b64a6a2
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
@@ -0,0 +1,18 @@
+lua.org patch 1 for lua-5.1.5.
+from http://www.lua.org/bugs.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd lua-5.1.5/src/Makefile lua-5.1.5/src/Makefile
+--- lua-5.1.5/src/Makefile	2012-02-13 22:41:22.000000000 +0200
++++ lua-5.1.5/src/Makefile	2013-10-25 11:29:49.769540434 +0300
+@@ -48,7 +48,7 @@
+ a:	$(ALL_A)
+ 
+ $(LUA_A): $(CORE_O) $(LIB_O)
+-	$(AR) $@ $(CORE_O) $(LIB_O)	# DLL needs all object files
++	$(AR) $@ $(CORE_O) $(LIB_O)
+ 	$(RANLIB) $@
+ 
+ $(LUA_T): $(LUA_O) $(LUA_A)
diff --git a/meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch
new file mode 100644
index 0000000..0c48ea2
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch
@@ -0,0 +1,44 @@
+lua.org patch 2 for lua-5.1.5.
+from http://www.lua.org/bugs.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd lua-5.1.5/src/lzio.c lua-5.1.5/src/lzio.c
+--- lua-5.1.5/src/lzio.c	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/lzio.c	2013-10-25 11:32:45.773536572 +0300
+@@ -22,10 +22,14 @@
+   size_t size;
+   lua_State *L = z->L;
+   const char *buff;
++  if (z->eoz) return EOZ;
+   lua_unlock(L);
+   buff = z->reader(L, z->data, &size);
+   lua_lock(L);
+-  if (buff == NULL || size == 0) return EOZ;
++  if (buff == NULL || size == 0) {
++    z->eoz = 1;  /* avoid calling reader function next time */
++    return EOZ;
++  }
+   z->n = size - 1;
+   z->p = buff;
+   return char2int(*(z->p++));
+@@ -51,6 +55,7 @@
+   z->data = data;
+   z->n = 0;
+   z->p = NULL;
++  z->eoz = 0;
+ }
+ 
+ 
+diff -Nurd lua-5.1.5/src/lzio.h lua-5.1.5/src/lzio.h
+--- lua-5.1.5/src/lzio.h	2007-12-27 15:02:25.000000000 +0200
++++ lua-5.1.5/src/lzio.h	2013-10-25 11:31:50.301537789 +0300
+@@ -59,6 +59,7 @@
+   lua_Reader reader;
+   void* data;			/* additional data */
+   lua_State *L;			/* Lua state (for reader) */
++  int eoz;			/* true if reader has no more data */
+ };
+ 
+ 
diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
index 19fee01..f946994 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
@@ -4,12 +4,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=59bdd99bb82238f238cf5c65c21604fd"
 HOMEPAGE = "http://www.lua.org/"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "readline"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
            file://lua5.1.pc \
+           file://luaorg_1.patch \
+           file://luaorg_2.patch \
 "
 S = "${WORKDIR}/lua-${PV}"
 
-- 
1.8.4.rc3


