Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P7aBJ-0003MS-35
	for openembedded-devel@openembedded.org; Sun, 17 Oct 2010 22:50:13 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id B110D1D360EE;
	Sun, 17 Oct 2010 22:49:36 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 22:49:42 +0200
Message-Id: <1287348584-11948-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287344571-13760-1-git-send-email-ynezz@true.cz>
References: <1287344571-13760-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2 1/3] lua5.1: use standard prefix for Lua libraries
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
X-List-Received-Date: Sun, 17 Oct 2010 20:50:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In default configuration Lua uses wrong /usr/local/{lib,share} in it's
module/script search path. This patch change it to the usage of the stand=
ard
/usr/{lib,share} directories.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua5.1_5.1.4.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/lua/lua5.1_5.1.4.bb b/recipes/lua/lua5.1_5.1.4.bb
index ba2f8b9..e3d56fd 100644
--- a/recipes/lua/lua5.1_5.1.4.bb
+++ b/recipes/lua/lua5.1_5.1.4.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 HOMEPAGE =3D "http://www.lua.org/"
=20
 DEPENDS +=3D "readline"
-PR =3D "r7"
+PR =3D "r8"
 SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
            file://lua5.1.pc \
@@ -20,6 +20,10 @@ SRC_URI_append_linux-uclibceabi =3D "${UCLIBC_PATCHES}=
"
 TARGET_CC_ARCH +=3D " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -DLUA_USE_LIN=
UX -fPIC' MYLDFLAGS=3D'${LDFLAGS}'"
=20
+do_configure_prepend() {                                                =
                                                                         =
           =20
+	sed -i -e s:/usr/local:${prefix}:g src/luaconf.h
+}
+
 do_compile () {
 	cp ${WORKDIR}/lua5.1.pc ${S}/
 	oe_runmake linux
--=20
1.7.0.4



