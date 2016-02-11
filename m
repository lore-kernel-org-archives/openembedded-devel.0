Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC09731F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 10:12:58 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id D9ABF42A940;
	Thu, 11 Feb 2016 11:12:56 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-devel@lists.openembedded.org,
	Li xin <lixin.fnst@cn.fujitsu.com>, Kang Kai <kai.kang@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 11 Feb 2016 11:12:50 +0100
Message-Id: <1455185571-22165-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] lua: use PV for generating Version in lua.pc
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
X-List-Received-Date: Thu, 11 Feb 2016 10:12:59 -0000

Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
Version in pkg-config metadata file. Instead of bumping the Version
field in lua.pc make sure that we are future proof and update the field
automatically with value of ${PV}.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta-oe/recipes-devtools/lua/lua/lua.pc    | 11 -----------
 meta-oe/recipes-devtools/lua/lua/lua.pc.in | 11 +++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.2.bb  |  4 +++-
 3 files changed, 14 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lua/lua/lua.pc
 create mode 100644 meta-oe/recipes-devtools/lua/lua/lua.pc.in

diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc b/meta-oe/recipes-devtools/lua/lua/lua.pc
deleted file mode 100644
index e6f8b6f096dbcf578665699d2e3570dd22088d40..0000000000000000000000000000000000000000
--- a/meta-oe/recipes-devtools/lua/lua/lua.pc
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=/usr
-libdir=${prefix}/lib
-includedir=${prefix}/include
-
-Name: Lua
-Description: Lua language engine
-Version: 5.2.2
-Requires:
-Libs: -L${libdir} -llua
-Libs.private: -lm
-Cflags: -I${includedir}
diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc.in b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
new file mode 100644
index 0000000000000000000000000000000000000000..fe220160374a2a7261ed9ada91d0c8f9969bf3b6
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/lua.pc.in
@@ -0,0 +1,11 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+Name: Lua
+Description: Lua language engine
+Version: @VERSION@
+Requires:
+Libs: -L${libdir} -llua
+Libs.private: -lm
+Cflags: -I${includedir}
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
index 3fe8c3fe88ec3f1159738c6b5e421bc987df176d..7d25cf8cbda973c0707e55a34b0df33cd6e7a4ab 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
@@ -8,7 +8,7 @@ PR = "r0"
 
 DEPENDS = "readline"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
-           file://lua.pc \
+           file://lua.pc.in \
 "
 
 SRC_URI[md5sum] = "33278c2ab5ee3c1a875be8d55c1ca2a1"
@@ -41,6 +41,8 @@ do_install () {
         'INSTALL_CMOD=${D}${libdir}/lua/5.3' \
         install
     install -d ${D}${libdir}/pkgconfig
+
+    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
     install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
     rmdir ${D}${datadir}/lua/5.3
     rmdir ${D}${datadir}/lua
-- 
2.5.0


