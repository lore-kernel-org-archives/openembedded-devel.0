Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P7tlm-0006OD-8z
	for openembedded-devel@openembedded.org; Mon, 18 Oct 2010 19:45:17 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 938551D360EE;
	Mon, 18 Oct 2010 19:44:24 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 19:44:26 +0200
Message-Id: <1287423866-25886-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287348584-11948-2-git-send-email-ynezz@true.cz>
References: <1287348584-11948-2-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] lua-filesystem: use standard prefix for Lua libraries
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
X-List-Received-Date: Mon, 18 Oct 2010 17:45:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua-filesystem_1.5.0.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/lua/lua-filesystem_1.5.0.bb b/recipes/lua/lua-filesy=
stem_1.5.0.bb
index 8305009..cb5767b 100644
--- a/recipes/lua/lua-filesystem_1.5.0.bb
+++ b/recipes/lua/lua-filesystem_1.5.0.bb
@@ -2,6 +2,8 @@ DESCRIPTION =3D "LuaFileSystem is a Lua library with set =
of functions related to f
 LICENSE =3D "MIT"
 HOMEPAGE =3D "http://keplerproject.org/luafilesystem"
=20
+PR =3D "r1"
+
 DEPENDS +=3D "lua5.1"
=20
 SRC_URI =3D "git://github.com/keplerproject/luafilesystem.git;protocol=3D=
git \
@@ -10,16 +12,16 @@ SRC_URI =3D "git://github.com/keplerproject/luafilesy=
stem.git;protocol=3Dgit \
 SRCREV =3D "ae5a05deec8a3737bd6972213b5495108b6566cc"
 S =3D "${WORKDIR}/git/"
=20
-LUA_LIB_DIR =3D "/usr/local/lib/lua/5.1"
+LUA_LIB_DIR =3D  "${libdir}/lua/5.1"
=20
 PACKAGES =3D "${PN} ${PN}-dbg"
 FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/lfs.so"
 FILES_${PN} =3D "${LUA_LIB_DIR}/lfs.so"
=20
-EXTRA_OEMAKE =3D "PREFIX=3D'${D}/usr/local' MYFLAGS=3D'${CFLAGS} ${LDFLA=
GS}'"
+EXTRA_OEMAKE =3D "PREFIX=3D'${D}/${prefix}' MYFLAGS=3D'${CFLAGS} ${LDFLA=
GS}'"
=20
 do_install() {
-        oe_runmake install PREFIX=3D${D}/usr/local
+        oe_runmake install PREFIX=3D${D}/${prefix}
         install -d ${D}/${docdir}/${PN}-${PV}
         install -m 0644 doc/us/* ${D}/${docdir}/${PN}-${PV}
 }
--=20
1.7.0.4



