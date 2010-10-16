Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P72lx-0002zO-Dp
	for openembedded-devel@openembedded.org; Sat, 16 Oct 2010 11:09:50 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 2D59F1D3616D;
	Sat, 16 Oct 2010 11:09:18 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 11:09:20 +0200
Message-Id: <1287220160-25176-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] lua5.1: link to libpthread when using uclibc
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
X-List-Received-Date: Sat, 16 Oct 2010 09:09:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When the Lua modules are linked with pthreads, loading them crashes Lua. =
It's
some bug in pthread_create() in uclibc. Anyway, linking Lua against pthre=
ad
fixes this issue.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/lua/lua5.1/uclibc-pthread.patch |   13 +++++++++++++
 recipes/lua/lua5.1_5.1.4.bb             |    9 +++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 recipes/lua/lua5.1/uclibc-pthread.patch

diff --git a/recipes/lua/lua5.1/uclibc-pthread.patch b/recipes/lua/lua5.1=
/uclibc-pthread.patch
new file mode 100644
index 0000000..0555e81
--- /dev/null
+++ b/recipes/lua/lua5.1/uclibc-pthread.patch
@@ -0,0 +1,13 @@
+Index: lua-5.1.4/src/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- lua-5.1.4.orig/src/Makefile	2010-10-16 09:51:52.000000000 +0200
++++ lua-5.1.4/src/Makefile	2010-10-16 09:52:15.000000000 +0200
+@@ -12,7 +12,7 @@
+ AR=3D ar rcu
+ RANLIB=3D ranlib
+ RM=3D rm -f
+-LIBS=3D -lm $(MYLIBS)
++LIBS=3D -lm -lpthread $(MYLIBS)
+=20
+ MYCFLAGS=3D
+ MYLDFLAGS=3D
diff --git a/recipes/lua/lua5.1_5.1.4.bb b/recipes/lua/lua5.1_5.1.4.bb
index 75b48f4..ba2f8b9 100644
--- a/recipes/lua/lua5.1_5.1.4.bb
+++ b/recipes/lua/lua5.1_5.1.4.bb
@@ -4,14 +4,19 @@ LICENSE =3D "MIT"
 HOMEPAGE =3D "http://www.lua.org/"
=20
 DEPENDS +=3D "readline"
-PR =3D "r6"
+PR =3D "r7"
 SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
-           file://lua5.1.pc"
+           file://lua5.1.pc \
+          "
 S =3D "${WORKDIR}/lua-${PV}"
=20
 inherit pkgconfig binconfig
=20
+UCLIBC_PATCHES +=3D "file://uclibc-pthread.patch"
+SRC_URI_append_linux-uclibc =3D "${UCLIBC_PATCHES}"
+SRC_URI_append_linux-uclibceabi =3D "${UCLIBC_PATCHES}"
+
 TARGET_CC_ARCH +=3D " -fPIC ${LDFLAGS}"
 EXTRA_OEMAKE =3D "'CC=3D${CC} -fPIC' 'MYCFLAGS=3D${CFLAGS} -DLUA_USE_LIN=
UX -fPIC' MYLDFLAGS=3D'${LDFLAGS}'"
=20
--=20
1.7.0.4



