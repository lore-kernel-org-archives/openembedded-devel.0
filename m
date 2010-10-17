Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P7Z8g-0003tY-D4
	for openembedded-devel@openembedded.org; Sun, 17 Oct 2010 21:43:27 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 01D671D3616D;
	Sun, 17 Oct 2010 21:42:50 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Oct 2010 21:42:49 +0200
Message-Id: <1287344571-13760-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287344571-13760-1-git-send-email-ynezz@true.cz>
References: <1287344571-13760-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] lua5.1: use standard prefix for Lua libraries
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
X-List-Received-Date: Sun, 17 Oct 2010 19:43:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In default configuration Lua uses wrong /usr/local/{lib,share} in it's
module/script search path. This patch change it to the usage of the stand=
ard
/usr/{lib,share} directories.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua5.1/no-usr-local.patch |   13 +++++++++++++
 recipes/lua/lua5.1_5.1.4.bb           |    3 ++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/lua/lua5.1/no-usr-local.patch

diff --git a/recipes/lua/lua5.1/no-usr-local.patch b/recipes/lua/lua5.1/n=
o-usr-local.patch
new file mode 100644
index 0000000..bc253ef
--- /dev/null
+++ b/recipes/lua/lua5.1/no-usr-local.patch
@@ -0,0 +1,13 @@
+Index: lua-5.1.4/src/luaconf.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/luaconf.h	2010-10-17 21:13:01.000000000 +0200
++++ lua-5.1.4/src/luaconf.h	2010-10-17 21:13:17.000000000 +0200
+@@ -95,7 +95,7 @@
+ 	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
+=20
+ #else
+-#define LUA_ROOT	"/usr/local/"
++#define LUA_ROOT	"/usr/"
+ #define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
+ #define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
+ #define LUA_PATH_DEFAULT  \
diff --git a/recipes/lua/lua5.1_5.1.4.bb b/recipes/lua/lua5.1_5.1.4.bb
index ba2f8b9..3d269c2 100644
--- a/recipes/lua/lua5.1_5.1.4.bb
+++ b/recipes/lua/lua5.1_5.1.4.bb
@@ -4,9 +4,10 @@ LICENSE =3D "MIT"
 HOMEPAGE =3D "http://www.lua.org/"
=20
 DEPENDS +=3D "readline"
-PR =3D "r7"
+PR =3D "r8"
 SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
+           file://no-usr-local.patch \
            file://lua5.1.pc \
           "
 S =3D "${WORKDIR}/lua-${PV}"
--=20
1.7.0.4



