Return-Path: <Paul.Vaduva@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 06134771C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 08:55:59 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 3 Feb 2016
	09:55:56 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4538)	id 576EB28BA23;
	Wed,  3 Feb 2016 09:55:56 +0100 (CET)
From: Paul Vaduva <Paul.Vaduva@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Feb 2016 09:55:44 +0100
Message-ID: <1454489752-52888-1-git-send-email-Paul.Vaduva@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: Paul.Vaduva@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe][PATCHv2 1/1] lua: Added ptest for lua
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
X-List-Received-Date: Wed, 03 Feb 2016 08:56:02 -0000
Content-Type: text/plain

Signed-off-by: Andreas Sundstr
Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Paul Vaduva <Paul.Vaduva@enea.com>
---
 meta-oe/recipes-devtools/lua/lua/run-ptest | 19 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.2.bb  | 23 +++++++++++++++++------
 2 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/lua/lua/run-ptest

diff --git a/meta-oe/recipes-devtools/lua/lua/run-ptest b/meta-oe/recipes-devtools/lua/lua/run-ptest
new file mode 100644
index 0000000..8e085e1
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+cd test
+lua -e"_U=true" all.lua > lua-test.tmp
+
+echo "--- test output ---"
+cat lua-test.tmp
+echo ""
+echo ""
+echo "--- ptest result ---"
+
+grep "final OK \!\!\!" lua-test.tmp > /dev/null
+if [ $? -eq 0 ]; then
+   echo "PASS: lua"
+else
+   echo "FAIL: lua"
+fi
+
+rm -f lua-test.tmp
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
index 3fe8c3f..e193c60 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
@@ -1,20 +1,27 @@
 DESCRIPTION = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=68fc2aa2b751a37ff265524ddf026d7f"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=318;endline=352;md5=68fc2aa2b751a37ff265524ddf026d7f \
+                    "
 HOMEPAGE = "http://www.lua.org/"
 
 PR = "r0"
 
 DEPENDS = "readline"
-SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
+SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc \
-"
+           "
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', \ 
+           'http://www.lua.org/tests/lua-${PV}-tests.tar.gz;name=tarballtest \
+            file://run-ptest \
+           ', '', d)}"
 
-SRC_URI[md5sum] = "33278c2ab5ee3c1a875be8d55c1ca2a1"
-SRC_URI[sha256sum] = "c740c7bb23a936944e1cc63b7c3c5351a8976d7867c5252c8854f7b2af9da68f"
+SRC_URI[tarballsrc.md5sum] = "33278c2ab5ee3c1a875be8d55c1ca2a1"
+SRC_URI[tarballsrc.sha256sum] = "c740c7bb23a936944e1cc63b7c3c5351a8976d7867c5252c8854f7b2af9da68f"
+SRC_URI[tarballtest.md5sum] = "a2b7ab1b8ff82a0145376e233ef30a4a"
+SRC_URI[tarballtest.sha256sum] = "56909863a3713dee3709b3dbd0c868237e4f5c9ea1744f5bf0ba8bafa6c4ed32"
 
-inherit pkgconfig binconfig
+inherit pkgconfig binconfig ptest
 
 UCLIBC_PATCHES += "file://uclibc-pthread.patch"
 SRC_URI_append_libc-uclibc = "${UCLIBC_PATCHES}"
@@ -46,4 +53,8 @@ do_install () {
     rmdir ${D}${datadir}/lua
 }
 
+do_install_ptest () {
+        cp -a ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
+}
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


