Return-Path: <Paul.Vaduva@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7D6B177202
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:50:14 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 13:50:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4538)	id 8BC9228BA23;
	Fri, 29 Jan 2016 13:50:14 +0100 (CET)
From: Paul Vaduva <Paul.Vaduva@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jan 2016 13:50:09 +0100
Message-ID: <1454071809-2040-2-git-send-email-Paul.Vaduva@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454071809-2040-1-git-send-email-Paul.Vaduva@enea.com>
References: <1454071809-2040-1-git-send-email-Paul.Vaduva@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: Paul.Vaduva@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe][PATCHv1 1/1] lua: Added ptest for lua
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
X-List-Received-Date: Fri, 29 Jan 2016 12:50:15 -0000
Content-Type: text/plain

This was added using a special recipe (lua-test_5.3.2.bb) so that we will
not download the Lua test suites when not building with ptest.

Signed-off-by: Andreas Sundstr
Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Paul Vaduva <Paul.Vaduva@enea.com>
---
 meta-oe/recipes-devtools/lua/lua-test/run-ptest | 19 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb  | 22 ++++++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.2.bb       |  3 +++
 3 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua-test/run-ptest
 create mode 100644 meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb

diff --git a/meta-oe/recipes-devtools/lua/lua-test/run-ptest b/meta-oe/recipes-devtools/lua/lua-test/run-ptest
new file mode 100644
index 0000000..8e085e1
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua-test/run-ptest
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
diff --git a/meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb
new file mode 100644
index 0000000..877df8e
--- /dev/null
+++ b/meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Lua test suites"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+HOMEPAGE = "http://www.lua.org/"
+
+DEPENDS = "lua"
+SRC_URI = "http://www.lua.org/tests/lua-${PV}-tests.tar.gz \
+           file://lua-test.patch \
+           file://run-ptest \
+"
+
+S = "${WORKDIR}/lua-${PV}-tests"
+
+SRC_URI[md5sum] = "a3dabd30e5a364c87191b0c1e6f64178"
+SRC_URI[sha256sum] = "07c1071c66d9cb4dc80200ed430fc21ebbbccf1f55148b87eb0b9522932e4eb6"
+
+inherit ptest
+
+do_install_ptest () {
+    cp -a ${S} ${D}${PTEST_PATH}/test
+}
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
index 3fe8c3f..4ee3b1a 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
@@ -7,6 +7,9 @@ HOMEPAGE = "http://www.lua.org/"
 PR = "r0"
 
 DEPENDS = "readline"
+PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
+ALLOW_EMPTY_lua-ptest = "1"
+RDEPENDS_lua-ptest_class-target = "lua-test-ptest"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://lua.pc \
 "
-- 
1.9.1


