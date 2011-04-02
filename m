Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1Q61hJ-0006og-6W
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 16:21:05 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id A55371D360AE;
	Sat,  2 Apr 2011 16:19:01 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2011 16:18:48 +0200
Message-Id: <1301753930-32581-5-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1301753930-32581-1-git-send-email-ynezz@true.cz>
References: <1301753930-32581-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Subject: [PATCH 4/6] lua-rs232: add recipe for version 1.0.1, remove old package and fix stripping
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
X-List-Received-Date: Sat, 02 Apr 2011 14:21:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch adds recipe for the version 1.0.1 of the package, removes the =
old
recipe and fixes the stripping of the shared library - we install the sha=
red
library with chmod 0755 now, otherwise the do_runstrip() function doesn't
strip the library and the result is, that the library is packaged unstrip=
ped.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua-rs232_1.0.0.bb |   28 ----------------------------
 recipes/lua/lua-rs232_1.0.1.bb |   28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 recipes/lua/lua-rs232_1.0.0.bb
 create mode 100644 recipes/lua/lua-rs232_1.0.1.bb

diff --git a/recipes/lua/lua-rs232_1.0.0.bb b/recipes/lua/lua-rs232_1.0.0=
.bb
deleted file mode 100644
index d8de225..0000000
--- a/recipes/lua/lua-rs232_1.0.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION =3D "Lua bindings for librs232 - library for serial communic=
ations over RS-232 (serial port)"
-HOMEPAGE =3D "http://github.com/ynezz/librs232"
-LICENSE =3D "MIT"
-
-PR =3D "r1"
-
-DEPENDS +=3D "lua5.1"
-RDEPENDS_${PN} +=3D "librs232"
-
-SRC_URI =3D "git://github.com/ynezz/librs232.git;protocol=3Dgit"
-
-SRCREV =3D "ecad1e03104bc9bf348e0c5e571660f270c86421"
-S =3D "${WORKDIR}/git/"
-
-inherit autotools
-
-LUA_LIB_DIR =3D "${libdir}/lua/5.1"
-LUA_LIB =3D "luars232.so"
-
-PACKAGES =3D "${PN} ${PN}-dbg"
-FILES_${PN} =3D "${LUA_LIB_DIR}/${LUA_LIB}"
-FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/${LUA_LIB}"
-
-do_install_append() {
-	install -d ${D}${LUA_LIB_DIR}/.debug
-	install -m 0644 ${D}${libdir}/${LUA_LIB} ${D}${LUA_LIB_DIR}/${LUA_LIB}
-	install -m 0644 ${D}${libdir}/${LUA_LIB} ${D}${LUA_LIB_DIR}/.debug/${LU=
A_LIB}
-}
diff --git a/recipes/lua/lua-rs232_1.0.1.bb b/recipes/lua/lua-rs232_1.0.1=
.bb
new file mode 100644
index 0000000..21c850d
--- /dev/null
+++ b/recipes/lua/lua-rs232_1.0.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION =3D "Lua bindings for librs232 - library for serial communic=
ations over RS-232 (serial port)"
+HOMEPAGE =3D "http://github.com/ynezz/librs232"
+LICENSE =3D "MIT"
+
+PR =3D "r1"
+
+DEPENDS +=3D "lua5.1"
+RDEPENDS_${PN} +=3D "librs232"
+
+SRC_URI =3D "git://github.com/ynezz/librs232.git;protocol=3Dgit"
+
+SRCREV =3D "cd9811207ee08f0bd83354b609c13f56e39d5f6c"
+S =3D "${WORKDIR}/git/"
+
+inherit autotools
+
+LUA_LIB_DIR =3D "${libdir}/lua/5.1"
+LUA_LIB =3D "luars232.so"
+
+PACKAGES =3D "${PN} ${PN}-dbg"
+FILES_${PN} =3D "${LUA_LIB_DIR}/${LUA_LIB}"
+FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/${LUA_LIB}"
+
+do_install_append() {
+	install -d ${D}${LUA_LIB_DIR}/.debug
+	install -m 0755 ${D}${libdir}/${LUA_LIB} ${D}${LUA_LIB_DIR}/${LUA_LIB}
+	install -m 0755 ${D}${libdir}/${LUA_LIB} ${D}${LUA_LIB_DIR}/.debug/${LU=
A_LIB}
+}
--=20
1.7.1



