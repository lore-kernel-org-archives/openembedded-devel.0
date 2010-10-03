Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NPp-0002lb-2o
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:11:44 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 602B71D363F8;
	Sun,  3 Oct 2010 14:11:23 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:11:23 +0200
Message-Id: <1286107883-10714-4-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286107883-10714-1-git-send-email-ynezz@true.cz>
References: <1286107883-10714-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] lua-filesystem: add new recipe
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
X-List-Received-Date: Sun, 03 Oct 2010 12:11:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua-filesystem-1.5.0/makefile.patch |   23 +++++++++++++++++=
++++
 recipes/lua/lua-filesystem_1.5.0.bb             |   25 +++++++++++++++++=
++++++
 2 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lua/lua-filesystem-1.5.0/makefile.patch
 create mode 100644 recipes/lua/lua-filesystem_1.5.0.bb

diff --git a/recipes/lua/lua-filesystem-1.5.0/makefile.patch b/recipes/lu=
a/lua-filesystem-1.5.0/makefile.patch
new file mode 100644
index 0000000..64154e1
--- /dev/null
+++ b/recipes/lua/lua-filesystem-1.5.0/makefile.patch
@@ -0,0 +1,23 @@
+Index: git/config
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- git.orig/config	2010-09-25 17:50:51.000000000 +0200
++++ git/config	2010-09-25 17:51:15.000000000 +0200
+@@ -1,7 +1,7 @@
+ # Installation directories
+=20
+ # Default installation prefix
+-PREFIX=3D/usr/local
++#PREFIX=3D/usr/local
+=20
+ # System's libraries directory (where binary libraries are installed)
+ LUA_LIBDIR=3D $(PREFIX)/lib/lua/5.1
+@@ -18,7 +18,7 @@
+ # Compilation directives
+ WARN=3D -O2 -Wall -fPIC -W -Waggregate-return -Wcast-align -Wmissing-pr=
ototypes -Wnested-externs -Wshadow -Wwrite-strings -pedantic
+ INCS=3D -I$(LUA_INC)
+-CFLAGS=3D $(WARN) $(INCS)
+-CC=3D gcc
++CFLAGS=3D $(WARN) $(INCS) $(MYFLAGS)
++#CC=3D gcc
+=20
+ # $Id: config,v 1.21 2007/10/27 22:42:32 carregal Exp $
diff --git a/recipes/lua/lua-filesystem_1.5.0.bb b/recipes/lua/lua-filesy=
stem_1.5.0.bb
new file mode 100644
index 0000000..8305009
--- /dev/null
+++ b/recipes/lua/lua-filesystem_1.5.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION =3D "LuaFileSystem is a Lua library with set of functions re=
lated to file systems operations."
+LICENSE =3D "MIT"
+HOMEPAGE =3D "http://keplerproject.org/luafilesystem"
+
+DEPENDS +=3D "lua5.1"
+
+SRC_URI =3D "git://github.com/keplerproject/luafilesystem.git;protocol=3D=
git \
+           file://makefile.patch "
+
+SRCREV =3D "ae5a05deec8a3737bd6972213b5495108b6566cc"
+S =3D "${WORKDIR}/git/"
+
+LUA_LIB_DIR =3D "/usr/local/lib/lua/5.1"
+
+PACKAGES =3D "${PN} ${PN}-dbg"
+FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/lfs.so"
+FILES_${PN} =3D "${LUA_LIB_DIR}/lfs.so"
+
+EXTRA_OEMAKE =3D "PREFIX=3D'${D}/usr/local' MYFLAGS=3D'${CFLAGS} ${LDFLA=
GS}'"
+
+do_install() {
+        oe_runmake install PREFIX=3D${D}/usr/local
+        install -d ${D}/${docdir}/${PN}-${PV}
+        install -m 0644 doc/us/* ${D}/${docdir}/${PN}-${PV}
+}
--=20
1.7.0.4



