Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NPp-0002la-5H
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:11:41 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 34D6C1D363F7;
	Sun,  3 Oct 2010 14:11:23 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:11:22 +0200
Message-Id: <1286107883-10714-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1286107883-10714-1-git-send-email-ynezz@true.cz>
References: <1286107883-10714-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] lua-rs232: add new recipe
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
X-List-Received-Date: Sun, 03 Oct 2010 12:11:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua-rs232_1.0.0.bb |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lua/lua-rs232_1.0.0.bb

diff --git a/recipes/lua/lua-rs232_1.0.0.bb b/recipes/lua/lua-rs232_1.0.0=
.bb
new file mode 100644
index 0000000..c11e3ac
--- /dev/null
+++ b/recipes/lua/lua-rs232_1.0.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION =3D "Lua bindings for librs232 - library for serial communic=
ations over RS-232 (serial port)"
+HOMEPAGE =3D "http://github.com/ynezz/librs232"
+LICENSE =3D "MIT"
+
+DEPENDS +=3D "lua5.1"
+RDEPENDS_${PN} +=3D "librs232"
+
+SRC_URI =3D "git://github.com/ynezz/librs232.git;protocol=3Dgit"
+
+SRCREV =3D "ecad1e03104bc9bf348e0c5e571660f270c86421"
+S =3D "${WORKDIR}/git/"
+
+inherit autotools
+
+LUA_LIB_DIR =3D "/usr/local/lib/lua/5.1"
+LUA_LIB =3D "luars232.so"
+
+PACKAGES =3D "${PN} ${PN}-dbg"
+FILES_${PN} =3D "${LUA_LIB_DIR}/${LUA_LIB}"
+FILES_${PN}-dbg =3D "${LUA_LIB_DIR}/.debug/${LUA_LIB}"
+
+do_install_append() {
+	install -d ${D}${LUA_LIB_DIR}/.debug
+	install -m 0644 ${D}${libdir}/${LUA_LIB} ${D}${LUA_LIB_DIR}/${LUA_LIB}
+	install -m 0644 ${D}${libdir}/${LUA_LIB} ${D}${LUA_LIB_DIR}/.debug/${LU=
A_LIB}
+}
--=20
1.7.0.4



