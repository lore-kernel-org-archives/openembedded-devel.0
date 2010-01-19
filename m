Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NXJ0g-0005lQ-4R
	for openembedded-devel@openembedded.org; Tue, 19 Jan 2010 19:41:05 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id EA0BD1D36075;
	Tue, 19 Jan 2010 19:38:42 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 19:38:46 +0100
Message-Id: <1263926326-31162-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <20100119135245.GF18793@ibawizard.net>
References: <20100119135245.GF18793@ibawizard.net>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] xinput_calibrator: switch to autotools
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
X-List-Received-Date: Tue, 19 Jan 2010 18:41:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 ...01-switch-to-autotools-based-build-system.patch |  162 ++++++++++++++=
++++++
 .../use-proper-compiler.patch                      |   20 ---
 .../xinput-calibrator/xinput-calibrator_0.5.0.bb   |    7 +-
 3 files changed, 166 insertions(+), 23 deletions(-)
 create mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5.0/000=
1-switch-to-autotools-based-build-system.patch
 delete mode 100644 recipes/xinput-calibrator/xinput-calibrator-0.5.0/use=
-proper-compiler.patch

diff --git a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/0001-switc=
h-to-autotools-based-build-system.patch b/recipes/xinput-calibrator/xinpu=
t-calibrator-0.5.0/0001-switch-to-autotools-based-build-system.patch
new file mode 100644
index 0000000..adec403
--- /dev/null
+++ b/recipes/xinput-calibrator/xinput-calibrator-0.5.0/0001-switch-to-au=
totools-based-build-system.patch
@@ -0,0 +1,162 @@
+From 1a85be450fba4585c64b3178316603a5ad7dd4e6 Mon Sep 17 00:00:00 2001
+From: =3D?utf-8?q?Petr=3D20=3DC5=3DA0tetiar?=3D <ynezz@true.cz>
+Date: Tue, 19 Jan 2010 18:59:52 +0100
+Subject: [PATCH] switch to autotools based build system
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf-8
+Content-Transfer-Encoding: 8bit
+
+This patch autotoolize xinput_calibrator for easier (cross)compiling.
+
+Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
+---
+ Makefile     |   11 -----------
+ Makefile.am  |   41 +++++++++++++++++++++++++++++++++++++++++
+ autogen.sh   |   12 ++++++++++++
+ configure.ac |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 102 insertions(+), 11 deletions(-)
+ delete mode 100644 Makefile
+ create mode 100644 Makefile.am
+ create mode 100755 autogen.sh
+ create mode 100644 configure.ac
+
+diff --git a/Makefile b/Makefile
+deleted file mode 100644
+index c6eabed..0000000
+--- a/Makefile
++++ /dev/null
+@@ -1,11 +0,0 @@
+-all: x11 gtkmm
+-
+-x11: main_x11.cpp gui_x11.cpp
+-	g++ -Wall main_x11.cpp -lX11 -lXi -o xinput_calibrator.x11
+-	cp xinput_calibrator.x11 xinput_calibrator
+-
+-gtkmm: main_gtkmm.cpp gui_gtkmm.cpp
+-	g++ -Wall main_gtkmm.cpp `pkg-config --cflags --libs gtkmm-2.4` -o xin=
put_calibrator.gtkmm
+-
+-clean:
+-	rm -f xinput_calibrator xinput_calibrator.x11 xinput_calibrator.gtkmm
+diff --git a/Makefile.am b/Makefile.am
+new file mode 100644
+index 0000000..ef8f531
+--- /dev/null
++++ b/Makefile.am
+@@ -0,0 +1,41 @@
++#
++# Copyright (c) 2010 Petr Stetiar <ynezz@true.cz>
++#
++# Permission is hereby granted, free of charge, to any person
++# obtaining a copy of this software and associated documentation
++# files (the "Software"), to deal in the Software without
++# restriction, including without limitation the rights to use,
++# copy, modify, merge, publish, distribute, sublicense, and/or sell
++# copies of the Software, and to permit persons to whom the
++# Software is furnished to do so, subject to the following
++# conditions:
++#=20
++# The above copyright notice and this permission notice shall be
++# included in all copies or substantial portions of the Software.
++#=20
++# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++# OTHER DEALINGS IN THE SOFTWARE.
++#
++
++#AM_CFLAGS =3D -Wall -ansi -pedantic -W -Wmissing-prototypes -Wmissing-=
declarations -Werror -std=3Dgnu99
++
++if BUILD_GTKMM
++bin_PROGRAMS =3D xinput_calibrator_x11 xinput_calibrator_gtkmm
++xinput_calibrator_gtkmm_SOURCES =3D main_gtkmm.cpp
++xinput_calibrator_gtkmm_CXXFLAGS =3D $(GTKMM_CFLAGS)
++xinput_calibrator_gtkmm_LDADD =3D $(GTKMM_LIBS)
++else
++bin_PROGRAMS =3D xinput_calibrator_x11
++endif
++
++xinput_calibrator_x11_LDADD =3D $(XORG_LIBS)
++xinput_calibrator_x11_CFLAGS =3D $(XORG_CFLAGS)
++xinput_calibrator_x11_SOURCES =3D main_x11.cpp
++
++EXTRA_DIST =3D autogen.sh
+diff --git a/autogen.sh b/autogen.sh
+new file mode 100755
+index 0000000..904cd67
+--- /dev/null
++++ b/autogen.sh
+@@ -0,0 +1,12 @@
++#! /bin/sh
++
++srcdir=3D`dirname $0`
++test -z "$srcdir" && srcdir=3D.
++
++ORIGDIR=3D`pwd`
++cd $srcdir
++
++autoreconf -v --install || exit 1
++cd $ORIGDIR || exit $?
++
++$srcdir/configure --enable-maintainer-mode "$@"
+diff --git a/configure.ac b/configure.ac
+new file mode 100644
+index 0000000..13257b4
+--- /dev/null
++++ b/configure.ac
+@@ -0,0 +1,49 @@
++#
++# Copyright (c) 2010 Petr Stetiar <ynezz@true.cz>
++#
++# Permission is hereby granted, free of charge, to any person
++# obtaining a copy of this software and associated documentation
++# files (the "Software"), to deal in the Software without
++# restriction, including without limitation the rights to use,
++# copy, modify, merge, publish, distribute, sublicense, and/or sell
++# copies of the Software, and to permit persons to whom the
++# Software is furnished to do so, subject to the following
++# conditions:
++#=20
++# The above copyright notice and this permission notice shall be
++# included in all copies or substantial portions of the Software.
++#=20
++# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++# OTHER DEALINGS IN THE SOFTWARE.
++#
++
++AC_PREREQ([2.57])
++AC_INIT(xinput_calibrator,[0.5.0], [http://github.com/tias/xinput_calib=
rator])
++AM_INIT_AUTOMAKE([foreign dist-bzip2])
++AM_MAINTAINER_MODE
++
++AC_PROG_CC
++AC_PROG_CXX
++AC_PROG_INSTALL
++
++AC_ARG_ENABLE([gtkmm], AS_HELP_STRING([--enable-gtkmm], [Enable GTKMM G=
UI]))
++AS_IF([test "x$enable_gtkmm" =3D "xyes"], [
++	PKG_CHECK_MODULES(GTKMM, [gtkmm-2.4])
++	AC_SUBST(GTKMM_CFLAGS)
++	AC_SUBST(GTKMM_LIBS)
++])
++
++AM_CONDITIONAL([BUILD_GTKMM], [test "x$enable_gtkmm" =3D "xyes"])
++
++PKG_CHECK_MODULES(XORG, [x11 xi])
++AC_SUBST(XORG_CFLAGS)
++AC_SUBST(XORG_LIBS)
++
++AC_CONFIG_FILES(Makefile)
++AC_OUTPUT
+--=20
+1.6.0.4
+
diff --git a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/use-proper=
-compiler.patch b/recipes/xinput-calibrator/xinput-calibrator-0.5.0/use-p=
roper-compiler.patch
deleted file mode 100644
index a7912fb..0000000
--- a/recipes/xinput-calibrator/xinput-calibrator-0.5.0/use-proper-compil=
er.patch
+++ /dev/null
@@ -1,20 +0,0 @@
----
- Makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- git.orig/Makefile
-+++ git/Makefile
-@@ -1,11 +1,11 @@
- all: x11 gtkmm
-=20
- x11: main_x11.cpp gui_x11.cpp
--	g++ -Wall main_x11.cpp -lX11 -lXi -o xinput_calibrator.x11
-+	$(CXX) $(CFLAGS) $(LDFLAGS) -Wall main_x11.cpp -lX11 -lXi -o xinput_ca=
librator.x11
- 	cp xinput_calibrator.x11 xinput_calibrator
-=20
- gtkmm: main_gtkmm.cpp gui_gtkmm.cpp
--	g++ -Wall main_gtkmm.cpp `pkg-config --cflags --libs gtkmm-2.4` -o xin=
put_calibrator.gtkmm
-+	$(CXX) $(CFLAGS) $(LDFLAGS) -Wall main_gtkmm.cpp `pkg-config --cflags =
--libs gtkmm-2.4` -o xinput_calibrator.gtkmm
-=20
- clean:
- 	rm -f xinput_calibrator xinput_calibrator.x11 xinput_calibrator.gtkmm
diff --git a/recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb b/recip=
es/xinput-calibrator/xinput-calibrator_0.5.0.bb
index 59a2856..2d69247 100644
--- a/recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb
+++ b/recipes/xinput-calibrator/xinput-calibrator_0.5.0.bb
@@ -2,12 +2,13 @@ DEPENDS =3D "virtual/libx11 libxi"
=20
 SRCREV  =3D "6af268f1b435f7bdd83335092ddc684054df2110"
 SRC_URI =3D "git://github.com/tias/xinput_calibrator.git;protocol=3Dgit =
\
-           file://use-proper-compiler.patch;patch=3D1"
+           file://0001-switch-to-autotools-based-build-system.patch;patc=
h=3D1"
=20
+PR =3D "r1"
+inherit autotools
 S =3D "${WORKDIR}/git/"
-EXTRA_OEMAKE =3D "x11"
=20
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 xinput_calibrator ${D}${bindir}
+	install -m 0755 xinput_calibrator_x11 ${D}${bindir}/xinput_calibrator
 }
--=20
1.6.0.4



