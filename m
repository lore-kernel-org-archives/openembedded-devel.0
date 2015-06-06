Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 687CA72491
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jun 2015 01:48:23 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so49329142qkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jun 2015 18:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=BQH5S7Mtma/Ve6TnCdpHoILU+fwK734sqTTb8bAbPn4=;
	b=RvoHSC9Gt5M71JjYHsnk4UxM0rMjk9wZI5uRmJT8CWZd9kstZtcxAiahLR1FL+gYMa
	BFvMRS6TjEBn7yWJ55fFZvLO5UFHUXFfXmsuy3M+I7E1N3yKr2iq/ydwJ7VcY28Zf9y7
	GWJKjoVZKUzOurWSddUYPATLyMIt0WH5f0W0Aj4fdmx2lUZ3hjf49ggoqA3AYPRt26Fr
	xfURmiSlWDK9RBSNFLvyfMButlMQgPIM+t9dR1pnrRZoqkD6Lgex8vWKpPhFBN3Y8Yi4
	cw9KGy2NrmeWlF41YYVvtD9oDEsPc+D5zt4v0b9JQF5AtoH8RfSFOV8j5t+tc4Q1T2Lv
	IkKA==
X-Received: by 10.55.25.134 with SMTP id 6mr12268534qkz.13.1433555304815;
	Fri, 05 Jun 2015 18:48:24 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	i197sm4759590qhc.36.2015.06.05.18.48.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Jun 2015 18:48:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jun 2015 18:48:18 -0700
Message-Id: <1433555298-20087-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] redis: update to version 3.0.2
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
X-List-Received-Date: Sat, 06 Jun 2015 01:48:27 -0000

This includes CVE-2015-4335.
LICENSE checksum changed do to copyright update.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../hiredis-use-default-CC-if-it-is-set.patch      | 15 +++----
 ...Makefile-to-use-environment-build-setting.patch | 47 +++++++++++++++-------
 .../redis/redis/oe-use-libc-malloc.patch           | 11 ++---
 .../redis/{redis_2.6.9.bb => redis_3.0.2.bb}       | 11 ++---
 4 files changed, 52 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_2.6.9.bb => redis_3.0.2.bb} (72%)

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
index 8135fc2..f9f1c0d 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
@@ -7,16 +7,20 @@ Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
+
+Update to work with 3.0.x
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
 ---
  deps/hiredis/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 16b8767..0b27c82 100644
+Index: deps/hiredis/Makefile
+===================================================================
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -11,7 +11,7 @@ HIREDIS_MAJOR=0
- HIREDIS_MINOR=10
+@@ -24,7 +24,7 @@ endef
+ export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
@@ -24,6 +28,3 @@ index 16b8767..0b27c82 100644
  OPTIMIZATION?=-O3
  WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
  DEBUG?= -g -ggdb
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
index c4d1bc4..7e62ae1 100644
--- a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -7,14 +7,19 @@ OE-specific parameters, instead of overriding all of these simply use
 the ones that are already passed in. Also configure for only Linux...
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
+
+Updated to work with 3.0.x
+
+Signed-off-by: Armin Kuster <akust808@gmail.com>
+
 ---
  deps/lua/src/Makefile | 18 +++++++-----------
  1 file changed, 7 insertions(+), 11 deletions(-)
 
-diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile
-index 77d6a48..888d0da 100644
---- a/deps/lua/src/Makefile
-+++ b/deps/lua/src/Makefile
+Index: redis-3.0.2/deps/lua/src/Makefile
+===================================================================
+--- redis-3.0.2.orig/deps/lua/src/Makefile
++++ redis-3.0.2/deps/lua/src/Makefile
 @@ -5,18 +5,14 @@
  # == CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =======================
  
@@ -22,7 +27,7 @@ index 77d6a48..888d0da 100644
 -PLAT= none
 +PLAT= linux
  
--CC= gcc
+-CC?= gcc
 -CFLAGS= -O2 -Wall $(MYCFLAGS)
 -AR= ar rcu
 -RANLIB= ranlib
@@ -40,15 +45,27 @@ index 77d6a48..888d0da 100644
  
  # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
  
-@@ -48,7 +44,7 @@ o:	$(ALL_O)
- a:	$(ALL_A)
+Index: redis-3.0.2/deps/Makefile
+===================================================================
+--- redis-3.0.2.orig/deps/Makefile
++++ redis-3.0.2/deps/Makefile
+@@ -63,7 +63,6 @@ LUA_LDFLAGS+= $(LDFLAGS)
+ # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
+ # challenging to cross-compile lua (and redis).  These defines make it easier
+ # to fit redis into cross-compilation environments, which typically set AR.
+-AR=ar
+ ARFLAGS=rcu
  
- $(LUA_A): $(CORE_O) $(LIB_O)
--	$(AR) $@ $?
-+	$(AR) rcu $@ $?
- 	$(RANLIB) $@
+ lua: .make-prerequisites
+Index: redis-3.0.2/deps/lua/Makefile
+===================================================================
+--- redis-3.0.2.orig/deps/lua/Makefile
++++ redis-3.0.2/deps/lua/Makefile
+@@ -33,7 +33,6 @@ INSTALL_DATA= $(INSTALL) -m 0644
+ 
+ # Utilities.
+ MKDIR= mkdir -p
+-RANLIB= ranlib
+ 
+ # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
  
- $(LUA_T): $(LUA_O) $(LUA_A)
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
index b89c871..b768a77 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -10,12 +10,16 @@ Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
+
+Update to work with 3.0.x
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index 204a271..91b307d 100644
+Index: src/Makefile
+===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -28,6 +32,3 @@ index 204a271..91b307d 100644
  OPTIMIZATION?=-O2
  DEPENDENCY_TARGETS=hiredis linenoise lua
  
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-extended/redis/redis_2.6.9.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
similarity index 72%
rename from meta-oe/recipes-extended/redis/redis_2.6.9.bb
rename to meta-oe/recipes-extended/redis/redis_3.0.2.bb
index 8f00975..e439431 100644
--- a/meta-oe/recipes-extended/redis/redis_2.6.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -3,9 +3,10 @@ DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM="file://COPYING;md5=673e0ac66aac758f8f2140c6fc7947d2"
+LIC_FILES_CHKSUM="file://COPYING;md5=3c01b49fed4df1a79843688fa3f7b9d6"
 
-SRC_URI = "http://redis.googlecode.com/files/redis-${PV}.tar.gz \
+DEPENDS = ""
+SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
@@ -13,13 +14,13 @@ SRC_URI = "http://redis.googlecode.com/files/redis-${PV}.tar.gz \
            file://init-redis-server \
 "
 
-inherit update-rc.d
+inherit autotools-brokensep update-rc.d
 
 INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
-SRC_URI[md5sum] = "5093fb7c5f763e828c857daf260665bc"
-SRC_URI[sha256sum] = "4d967eff2038aebea33875d17e85ed67179df6505df68529a622f7836d1c7489"
+SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
+SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
 
 do_install() {
     export PREFIX=${D}/${prefix}
-- 
2.3.5


