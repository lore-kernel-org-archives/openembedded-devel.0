Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pc4AR-00068w-8R for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 23:55:19 +0100
Received: from f053039058.adsl.alicedsl.de ([78.53.39.58]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pc4A0-0000M3-CP for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 22:54:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 09 Jan 2011 23:54:51 +0100
Message-ID: <1294613691.4036.76.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [PATCH] vdr: update to 1.7.16 from 1.7.10
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
X-List-Received-Date: Sun, 09 Jan 2011 22:55:19 -0000
X-Groupsio-MsgNum: 27848
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ycc648TWwI6DRtiaTcMh"

--=-ycc648TWwI6DRtiaTcMh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Mon, 12 Jul 2010 21:32:52 +0200

Several of Hennig=E2=80=99s patches were applied upstream and are not neces=
sary anymore.

=E2=80=A2 `recipes/vdr/files/cplusplus.patch`: replaced by `recipes/vdr/vdr=
-1.7.16/0002-tools.h-include-stdarg.h.patch`
  1. `canonicalize_file_name()` is available in uClibc now.
  2. Deprecated C headers will remain in VDR instead of C++ headers [1].
=E2=80=A2 `recipes/vdr/files/disable_plugin.patch`: removed, since ncurses =
is found correctly now.
=E2=80=A2 `recipes/vdr/files/fixpaths.patch`: removed, since `INCLUDES` is =
not overwritten anymore since VDR 1.7.15 [2] and options can be passed from=
 outside since 1.7.13 [3].
=E2=80=A2 `recipes/vdr/files/libintl.patch` =E2=86=92 `recipes/vdr/vdr-1.7.=
16/0003-uclibc-Add-lintl-to-LIBS.patch`
  1. Still needed. I do not know how to fix this upstream.
=E2=80=A2 `recipes/vdr/vdr-1.7.10/linkerflags.patch` =E2=86=92 `recipes/vdr=
/vdr-1.7.16/0001-Makefile-Pass-LDFLAGS.patch`
  1. Still needed and extended to cover all places to get rid of `ERROR: QA=
 Issue with libvdr-svcsvr: No GNU_HASH in the elf binary:`. This patch will=
 not be needed anymore in 1.7.17 [4].

Since 1.7.x are development releases and no users of VDR in OE are known to=
 me simply replace 1.7.10 by 1.7.16.

This recipes is build tested for `MACHINE =3D "beagleboard"` with `angstrom=
-2008.1`, `angstrom-2010.x`, `minimal`, `minimal-uclibc`.

[1] http://www.linuxtv.org/pipermail/vdr/2010-December/024034.html
[2] http://www.linuxtv.org/pipermail/vdr/2010-April/022831.html
[3] http://www.linuxtv.org/pipermail/vdr/2010-February/022333.html
[4] http://www.linuxtv.org/pipermail/vdr/2010-December/024096.html

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/vdr/files/cplusplus.patch                  |   54 ------
 recipes/vdr/files/disable_plugin.patch             |   18 --
 recipes/vdr/files/fixpaths.patch                   |   11 --
 recipes/vdr/files/libintl.patch                    |   13 --
 recipes/vdr/vdr-1.7.10/linkerflags.patch           |  186 ----------------=
----
 .../vdr-1.7.16/0001-Makefile-Pass-LDFLAGS.patch    |  148 ++++++++++++++++
 .../vdr-1.7.16/0002-tools.h-include-stdarg.h.patch |   73 ++++++++
 .../vdr-1.7.16/0003-uclibc-Add-lintl-to-LIBS.patch |   27 +++
 recipes/vdr/vdr.inc                                |    2 +-
 recipes/vdr/{vdr_1.7.10.bb =3D> vdr_1.7.16.bb}       |   20 +--
 10 files changed, 258 insertions(+), 294 deletions(-)
 delete mode 100644 recipes/vdr/files/cplusplus.patch
 delete mode 100644 recipes/vdr/files/disable_plugin.patch
 delete mode 100644 recipes/vdr/files/fixpaths.patch
 delete mode 100644 recipes/vdr/files/libintl.patch
 delete mode 100644 recipes/vdr/vdr-1.7.10/linkerflags.patch
 create mode 100644 recipes/vdr/vdr-1.7.16/0001-Makefile-Pass-LDFLAGS.patch
 create mode 100644 recipes/vdr/vdr-1.7.16/0002-tools.h-include-stdarg.h.pa=
tch
 create mode 100644 recipes/vdr/vdr-1.7.16/0003-uclibc-Add-lintl-to-LIBS.pa=
tch
 rename recipes/vdr/{vdr_1.7.10.bb =3D> vdr_1.7.16.bb} (59%)

diff --git a/recipes/vdr/files/cplusplus.patch b/recipes/vdr/files/cplusplu=
s.patch
deleted file mode 100644
index 74e4731..0000000
--- a/recipes/vdr/files/cplusplus.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-Index: vdr-1.7.10/tools.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/tools.c	2010-01-03 16:34:41.162295450 +0100
-+++ vdr-1.7.10/tools.c	2010-01-03 17:07:03.318358420 +0100
-@@ -8,9 +8,12 @@
-  */
-=20
- #include "tools.h"
--#include <ctype.h>
-+#include <cctype>
- #include <dirent.h>
--#include <errno.h>
-+#include <cerrno>
-+#include <cstdarg>
-+#include <ctime>
-+
- extern "C" {
- #ifdef boolean
- #define HAVE_BOOLEAN
-@@ -18,11 +21,10 @@
- #include <jpeglib.h>
- #undef boolean
- }
--#include <stdarg.h>
-+
- #include <stdlib.h>
- #include <sys/time.h>
- #include <sys/vfs.h>
--#include <time.h>
- #include <unistd.h>
- #include <utime.h>
- #include "i18n.h"
-@@ -484,7 +486,7 @@
- {
-   if (!FileName)
-      return NULL;
--  char *TargetName =3D canonicalize_file_name(FileName);
-+  char *TargetName =3D realpath(FileName,NULL);
-   if (!TargetName) {
-      if (errno =3D=3D ENOENT) // file doesn't exist
-         TargetName =3D strdup(FileName);
-Index: vdr-1.7.10/tools.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/tools.h	2010-01-03 16:30:20.441906815 +0100
-+++ vdr-1.7.10/tools.h	2010-01-03 16:30:57.168575048 +0100
-@@ -24,6 +24,8 @@
- #include <sys/stat.h>
- #include <sys/types.h>
-=20
-+#include <cstdarg>
-+
- typedef unsigned char uchar;
-=20
- extern int SysLogLevel;
diff --git a/recipes/vdr/files/disable_plugin.patch b/recipes/vdr/files/dis=
able_plugin.patch
deleted file mode 100644
index 80cf236..0000000
--- a/recipes/vdr/files/disable_plugin.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: vdr-1.7.10/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/Makefile	2010-01-03 18:19:12.915007986 +0100
-+++ vdr-1.7.10/Makefile	2010-01-03 18:29:47.598277455 +0100
-@@ -142,11 +142,12 @@
- 	noapiv=3D"";\
- 	for i in `ls $(PLUGINDIR)/src | grep -v '[^a-z0-9]'`; do\
- 	    echo "Plugin $$i:";\
--	    if ! grep -q "\$$(LIBDIR)/.*\$$(APIVERSION)" "$(PLUGINDIR)/src/$$i/M=
akefile" ; then\
-+	    if ! grep -q "\$$(LIBDIR)/.*\$$(APIVERSION)" "$(PLUGINDIR)/src/$$i/M=
akefile";  then \
- 	       echo "ERROR: plugin $$i doesn't honor APIVERSION - not compiled!"=
;\
- 	       noapiv=3D"$$noapiv $$i";\
- 	       continue;\
- 	       fi;\
-+	    if [ "$$i" =3D "skincurses" ]; then echo; echo "*** $$i plugin disba=
bled "; echo; continue; fi;\
- 	    $(MAKE) -C "$(PLUGINDIR)/src/$$i" all || failed=3D"$$failed $$i";\
- 	    done;\
- 	if [ -n "$$noapiv" ] ; then echo; echo "*** plugins without APIVERSION:$=
$noapiv"; echo; fi;\
diff --git a/recipes/vdr/files/fixpaths.patch b/recipes/vdr/files/fixpaths.=
patch
deleted file mode 100644
index 418f2d9..0000000
--- a/recipes/vdr/files/fixpaths.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- vdr/Makefile~fixpaths	2009-10-18 15:59:25.000000000 +0200
-+++ vdr/Makefile	2009-12-13 12:28:22.000000000 +0100
-@@ -21,7 +21,7 @@
- BINDIR   =3D $(PREFIX)/bin
- LOCDIR   =3D ./locale
- LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
--INCLUDES =3D -I/usr/include/freetype2
-+INCLUDES =3D ${CFLAGS}
-=20
- PLUGINDIR=3D ./PLUGINS
- PLUGINLIBDIR=3D $(PLUGINDIR)/lib
diff --git a/recipes/vdr/files/libintl.patch b/recipes/vdr/files/libintl.pa=
tch
deleted file mode 100644
index 57b2581..0000000
--- a/recipes/vdr/files/libintl.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: vdr-1.7.10/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/Makefile	2010-01-07 22:02:32.000000000 +0100
-+++ vdr-1.7.10/Makefile	2010-01-07 22:03:01.803824516 +0100
-@@ -20,7 +20,7 @@
- MANDIR   =3D $(PREFIX)/share/man
- BINDIR   =3D $(PREFIX)/bin
- LOCDIR   =3D ./locale
--LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig ${L=
DFLAGS}
-+LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig -li=
ntl ${LDFLAGS}
- INCLUDES =3D ${CFLAGS}
-=20
- PLUGINDIR=3D ./PLUGINS
diff --git a/recipes/vdr/vdr-1.7.10/linkerflags.patch b/recipes/vdr/vdr-1.7=
.10/linkerflags.patch
deleted file mode 100644
index 63c4477..0000000
--- a/recipes/vdr/vdr-1.7.10/linkerflags.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-Index: vdr-1.7.10/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/Makefile	2010-01-07 22:01:54.000000000 +0100
-+++ vdr-1.7.10/Makefile	2010-01-07 22:02:32.167165564 +0100
-@@ -20,7 +20,7 @@
- MANDIR   =3D $(PREFIX)/share/man
- BINDIR   =3D $(PREFIX)/bin
- LOCDIR   =3D ./locale
--LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
-+LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig ${L=
DFLAGS}
- INCLUDES =3D ${CFLAGS}
-=20
- PLUGINDIR=3D ./PLUGINS
-Index: vdr-1.7.10/PLUGINS/src/hello/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/hello/Makefile	2010-01-07 22:01:07.0000000=
00 +0100
-+++ vdr-1.7.10/PLUGINS/src/hello/Makefile	2010-01-07 22:02:02.240496954 +0=
100
-@@ -19,6 +19,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -95,7 +96,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/osddemo/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/osddemo/Makefile	2010-01-07 22:01:07.00000=
0000 +0100
-+++ vdr-1.7.10/PLUGINS/src/osddemo/Makefile	2010-01-07 22:02:02.240496954 =
+0100
-@@ -17,6 +17,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -68,7 +69,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/pictures/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/pictures/Makefile	2010-01-07 22:01:07.0000=
00000 +0100
-+++ vdr-1.7.10/PLUGINS/src/pictures/Makefile	2010-01-07 22:02:02.240496954=
 +0100
-@@ -19,6 +19,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -95,7 +96,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/servicedemo/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:01:07.0=
00000000 +0100
-+++ vdr-1.7.10/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:02:02.240496=
954 +0100
-@@ -19,6 +19,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -70,11 +71,11 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN1).so: $(PLUGIN1).o
--	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- libvdr-$(PLUGIN2).so: $(PLUGIN2).o
--	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/skincurses/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/skincurses/Makefile	2010-01-07 22:01:07.00=
0000000 +0100
-+++ vdr-1.7.10/PLUGINS/src/skincurses/Makefile	2010-01-07 22:02:02.2404969=
54 +0100
-@@ -19,6 +19,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -95,7 +96,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/sky/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/sky/Makefile	2010-01-07 22:01:07.000000000=
 +0100
-+++ vdr-1.7.10/PLUGINS/src/sky/Makefile	2010-01-07 22:02:02.240496954 +010=
0
-@@ -17,6 +17,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -68,7 +69,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/status/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/status/Makefile	2010-01-07 22:01:07.000000=
000 +0100
-+++ vdr-1.7.10/PLUGINS/src/status/Makefile	2010-01-07 22:02:02.240496954 +=
0100
-@@ -17,6 +17,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -68,7 +69,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
-Index: vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- vdr-1.7.10.orig/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:01:07.000=
000000 +0100
-+++ vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:02:02.24049695=
4 +0100
-@@ -17,6 +17,7 @@
-=20
- CXX      ?=3D g++
- CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
-+LIBS     ?=3D ${LDFLAGS}
-=20
- ### The directory environment:
-=20
-@@ -68,7 +69,7 @@
- ### Targets:
-=20
- libvdr-$(PLUGIN).so: $(OBJS)
--	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
-+	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
- 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
-=20
- dist: clean
diff --git a/recipes/vdr/vdr-1.7.16/0001-Makefile-Pass-LDFLAGS.patch b/reci=
pes/vdr/vdr-1.7.16/0001-Makefile-Pass-LDFLAGS.patch
new file mode 100644
index 0000000..2b28e54
--- /dev/null
+++ b/recipes/vdr/vdr-1.7.16/0001-Makefile-Pass-LDFLAGS.patch
@@ -0,0 +1,148 @@
+From 165a0d93a39a3b25583b6cd3e0d429cd0995cc63 Mon Sep 17 00:00:00 2001
+From: Paul Menzel <paulepanter@users.sourceforge.net>
+Date: Sun, 12 Dec 2010 18:19:42 +0100
+Subject: [PATCH 1/3] Makefile: Pass `LDFLAGS`.
+
+Some distributions pass special flags to the linker [1][2]. Respect those =
by using `LDFLAGS`.
+
+[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/vdr/vd=
r-1.7.10/linkerflags.patch
+[2] http://www.linuxtv.org/pipermail/vdr/2010-September/023623.html
+
+Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
+---
+ Makefile                         |    2 +-
+ PLUGINS/src/dvbsddevice/Makefile |    2 +-
+ PLUGINS/src/hello/Makefile       |    2 +-
+ PLUGINS/src/osddemo/Makefile     |    2 +-
+ PLUGINS/src/pictures/Makefile    |    2 +-
+ PLUGINS/src/servicedemo/Makefile |    4 ++--
+ PLUGINS/src/skincurses/Makefile  |    2 +-
+ PLUGINS/src/status/Makefile      |    2 +-
+ PLUGINS/src/svdrpdemo/Makefile   |    2 +-
+ 9 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 26f54ea..48e3309 100644
+--- a/Makefile
++++ b/Makefile
+@@ -95,7 +95,7 @@ $(DEPFILE): Makefile
+ # The main program:
+=20
+ vdr: $(OBJS) $(SILIB)
+-	$(CXX) $(CXXFLAGS) -rdynamic $(OBJS) $(LIBS) $(LIBDIRS) $(SILIB) -o vdr
++	$(CXX) $(CXXFLAGS) -rdynamic $(LDFLAGS) $(OBJS) $(LIBS) $(LIBDIRS) $(SIL=
IB) -o vdr
+=20
+ # The libsi library:
+=20
+diff --git a/PLUGINS/src/dvbsddevice/Makefile b/PLUGINS/src/dvbsddevice/Ma=
kefile
+index 32d0f50..afc801b 100644
+--- a/PLUGINS/src/dvbsddevice/Makefile
++++ b/PLUGINS/src/dvbsddevice/Makefile
+@@ -99,7 +99,7 @@ i18n: $(I18Nmsgs) $(I18Npot)
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/hello/Makefile b/PLUGINS/src/hello/Makefile
+index a5703f6..9e51cf7 100644
+--- a/PLUGINS/src/hello/Makefile
++++ b/PLUGINS/src/hello/Makefile
+@@ -99,7 +99,7 @@ i18n: $(I18Nmsgs)
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/osddemo/Makefile b/PLUGINS/src/osddemo/Makefile
+index d9ed4c5..eb98160 100644
+--- a/PLUGINS/src/osddemo/Makefile
++++ b/PLUGINS/src/osddemo/Makefile
+@@ -72,7 +72,7 @@ $(DEPFILE): Makefile
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/pictures/Makefile b/PLUGINS/src/pictures/Makefile
+index 19c6fc6..a573363 100644
+--- a/PLUGINS/src/pictures/Makefile
++++ b/PLUGINS/src/pictures/Makefile
+@@ -99,7 +99,7 @@ i18n: $(I18Nmsgs) $(I18Npot)
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/servicedemo/Makefile b/PLUGINS/src/servicedemo/Ma=
kefile
+index 18bfd26..8cba989 100644
+--- a/PLUGINS/src/servicedemo/Makefile
++++ b/PLUGINS/src/servicedemo/Makefile
+@@ -74,11 +74,11 @@ $(DEPFILE): Makefile
+ ### Targets:
+=20
+ libvdr-$(PLUGIN1).so: $(PLUGIN1).o
+-	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(PLUGIN1).o -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ libvdr-$(PLUGIN2).so: $(PLUGIN2).o
+-	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(PLUGIN2).o -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/skincurses/Makefile b/PLUGINS/src/skincurses/Make=
file
+index 080c3e6..e1e3ae6 100644
+--- a/PLUGINS/src/skincurses/Makefile
++++ b/PLUGINS/src/skincurses/Makefile
+@@ -99,7 +99,7 @@ i18n: $(I18Nmsgs) $(I18Npot)
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -lncursesw -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/status/Makefile b/PLUGINS/src/status/Makefile
+index 556a09e..fa59016 100644
+--- a/PLUGINS/src/status/Makefile
++++ b/PLUGINS/src/status/Makefile
+@@ -72,7 +72,7 @@ $(DEPFILE): Makefile
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+diff --git a/PLUGINS/src/svdrpdemo/Makefile b/PLUGINS/src/svdrpdemo/Makefi=
le
+index 4a803c6..1101634 100644
+--- a/PLUGINS/src/svdrpdemo/Makefile
++++ b/PLUGINS/src/svdrpdemo/Makefile
+@@ -72,7 +72,7 @@ $(DEPFILE): Makefile
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) $(LDFLAGS) -shared $(OBJS) -o $@
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+--=20
+1.7.2.3
+
diff --git a/recipes/vdr/vdr-1.7.16/0002-tools.h-include-stdarg.h.patch b/r=
ecipes/vdr/vdr-1.7.16/0002-tools.h-include-stdarg.h.patch
new file mode 100644
index 0000000..e8abed1
--- /dev/null
+++ b/recipes/vdr/vdr-1.7.16/0002-tools.h-include-stdarg.h.patch
@@ -0,0 +1,73 @@
+From e5d29ca595564b939fc9fee43c08788f477df218 Mon Sep 17 00:00:00 2001
+From: Paul Menzel <paulepanter@users.sourceforge.net>
+Date: Sun, 12 Dec 2010 19:21:25 +0100
+Subject: [PATCH 2/3] tools.h: include `stdarg.h`
+
+In recent compilers headers need to be included explicitely.
+
+NOTE: package vdr-1.7.16-r0: task do_distribute_sources: Succeeded
+ERROR: TaskFailed event exception, aborting
+ERROR: Build of /home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb do_co=
mpile failed
+ERROR: Task 11 (/home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb, do_c=
ompile) failed with 256
+ERROR: Function do_compile failed
+NOTE: Task failed: ('function do_compile failed', '/home/paul/oe/build-min=
imal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/vdr-1.7.16-r=
0/temp/log.do_compile.8011')
+ERROR: Logfile of failure stored in: /home/paul/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/vdr-1.7.16-r0/temp/log.do_=
compile.8011
+Log data follows:
+| NOTE: make -j4 -e MAKEFLAGS=3D INCLUDES=3D-I/home/paul/oe/build-minimal-=
uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi/usr/include/f=
reetype2
+| arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/home/paul/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os -fpermissive -fvisibility-inlines-hidden -c -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DREMOTE_KBD -DLIRC_DEVICE=
=3D\"/dev/lircd\" -DRCU_DEVICE=3D\"/dev/ttyS1\" -D_GNU_SOURCE -DVIDEODIR=3D=
\"/video\" -DCONFDIR=3D\"/video\" -DPLUGINDIR=3D\"./PLUGINS/lib\" -DLOCDIR=
=3D\"./locale\" -I/home/paul/oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/armv7a-oe-linux-uclibceabi/usr/include/freetype2 audio.c
+| arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/home/paul/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os -fpermissive -fvisibility-inlines-hidden -c -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DREMOTE_KBD -DLIRC_DEVICE=
=3D\"/dev/lircd\" -DRCU_DEVICE=3D\"/dev/ttyS1\" -D_GNU_SOURCE -DVIDEODIR=3D=
\"/video\" -DCONFDIR=3D\"/video\" -DPLUGINDIR=3D\"./PLUGINS/lib\" -DLOCDIR=
=3D\"./locale\" -I/home/paul/oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/armv7a-oe-linux-uclibceabi/usr/include/freetype2 channels.c
+| arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/home/paul/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os -fpermissive -fvisibility-inlines-hidden -c -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DREMOTE_KBD -DLIRC_DEVICE=
=3D\"/dev/lircd\" -DRCU_DEVICE=3D\"/dev/ttyS1\" -D_GNU_SOURCE -DVIDEODIR=3D=
\"/video\" -DCONFDIR=3D\"/video\" -DPLUGINDIR=3D\"./PLUGINS/lib\" -DLOCDIR=
=3D\"./locale\" -I/home/paul/oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/armv7a-oe-linux-uclibceabi/usr/include/freetype2 ci.c
+| arm-oe-linux-uclibceabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/home/paul/o=
e/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibcea=
bi/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-regi=
sters -Os -fpermissive -fvisibility-inlines-hidden -c -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DREMOTE_KBD -DLIRC_DEVICE=
=3D\"/dev/lircd\" -DRCU_DEVICE=3D\"/dev/ttyS1\" -D_GNU_SOURCE -DVIDEODIR=3D=
\"/video\" -DCONFDIR=3D\"/video\" -DPLUGINDIR=3D\"./PLUGINS/lib\" -DLOCDIR=
=3D\"./locale\" -I/home/paul/oe/build-minimal-uclibc/minimal-uclibc-dev/sys=
roots/armv7a-oe-linux-uclibceabi/usr/include/freetype2 config.c
+| In file included from i18n.h:14:0,
+|                  from config.h:19,
+|                  from channels.h:13,
+|                  from ci.h:15,
+|                  from ci.c:10:
+| tools.h:176:43: error: 'va_list' has not been declared
+| In file included from audio.h:14:0,
+|                  from audio.c:10:
+| tools.h:176:43: error: 'va_list' has not been declared
+| In file included from i18n.h:14:0,
+|                  from config.h:19,
+|                  from config.c:10:
+| tools.h:176:43: error: 'va_list' has not been declared
+| In file included from i18n.h:14:0,
+|                  from config.h:19,
+|                  from channels.h:13,
+|                  from channels.c:10:
+| tools.h:176:43: error: 'va_list' has not been declared
+| make: *** [audio.o] Error 1
+| make: *** Waiting for unfinished jobs....
+| make: *** [config.o] Error 1
+| make: *** [channels.o] Error 1
+| make: *** [ci.o] Error 1
+| FATAL: oe_runmake failed
+| ERROR: Function do_compile failed
+NOTE: package vdr-1.7.16-r0: task do_compile: Failed
+ERROR: TaskFailed event exception, aborting
+ERROR: Build of /home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb do_co=
mpile failed
+ERROR: Task 11 (/home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb, do_c=
ompile) failed with 256
+ERROR: '/home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb' failed
+ERROR: '/home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb' failed
+ERROR: '/home/paul/oe/openembedded/recipes/vdr/vdr_1.7.16.bb' failed
+
+Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
+---
+ tools.h |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/tools.h b/tools.h
+index 95c35ff..1fbe005 100644
+--- a/tools.h
++++ b/tools.h
+@@ -17,6 +17,7 @@
+ #include <iconv.h>
+ #include <math.h>
+ #include <poll.h>
++#include <stdarg.h>
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <stdio.h>
+--=20
+1.7.2.3
+
diff --git a/recipes/vdr/vdr-1.7.16/0003-uclibc-Add-lintl-to-LIBS.patch b/r=
ecipes/vdr/vdr-1.7.16/0003-uclibc-Add-lintl-to-LIBS.patch
new file mode 100644
index 0000000..38adc74
--- /dev/null
+++ b/recipes/vdr/vdr-1.7.16/0003-uclibc-Add-lintl-to-LIBS.patch
@@ -0,0 +1,27 @@
+From bf85fc2fd74a3615649ba62dd3e3d36a32d40c72 Mon Sep 17 00:00:00 2001
+From: Paul Menzel <paulepanter@users.sourceforge.net>
+Date: Wed, 14 Jul 2010 20:19:39 +0200
+Subject: [PATCH 3/3] uclibc: Add `-lintl` to `LIBS`.
+
+
+Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 48e3309..e12e2b2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,7 @@ PREFIX  ?=3D /usr/local
+ MANDIR   =3D $(PREFIX)/share/man
+ BINDIR   =3D $(PREFIX)/bin
+ LOCDIR   =3D ./locale
+-LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
++LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig -li=
ntl
+ INCLUDES ?=3D -I/usr/include/freetype2
+=20
+ PLUGINDIR=3D ./PLUGINS
+--=20
+1.7.2.3
+
diff --git a/recipes/vdr/vdr.inc b/recipes/vdr/vdr.inc
index 1077af9..7af81ad 100644
--- a/recipes/vdr/vdr.inc
+++ b/recipes/vdr/vdr.inc
@@ -3,6 +3,6 @@ HOMEPAGE =3D "http://www.tvdr.de"
 SECTION =3D "console/multimedia"
 LICENSE =3D "GPLv2"
 AUTHOR =3D "Klaus Schmidinger"
-DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl"
+DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl ncurs=
es"
=20
 SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2"
diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.16.bb
similarity index 59%
rename from recipes/vdr/vdr_1.7.10.bb
rename to recipes/vdr/vdr_1.7.16.bb
index 8cc5757..12632ef 100644
--- a/recipes/vdr/vdr_1.7.10.bb
+++ b/recipes/vdr/vdr_1.7.16.bb
@@ -1,16 +1,14 @@
 require vdr.inc
-PR =3D "r3"
+PR =3D "r0"
=20
-SRC_URI +=3D " file://fixpaths.patch \
-           file://cplusplus.patch \
-           file://disable_plugin.patch \
-           file://linkerflags.patch \
-          "
+SRC_URI +=3D "file://0001-Makefile-Pass-LDFLAGS.patch \
+            file://0002-tools.h-include-stdarg.h.patch \
+           "
=20
-SRC_URI_append_linux-uclibceabi =3D " file://libintl.patch "
-SRC_URI_append_uclinux-uclibc =3D " file://libintl.patch "
+SRC_URI_append_linux-uclibceabi =3D " file://0003-uclibc-Add-lintl-to-LIBS=
.patch "
+SRC_URI_append_uclinux-uclibc =3D " file://0003-uclibc-Add-lintl-to-LIBS.p=
atch "
=20
-CFLAGS_append +=3D " -I${STAGING_INCDIR}/freetype2"
+EXTRA_OEMAKE +=3D "INCLUDES=3D-I${STAGING_INCDIR}/freetype2"
=20
 PLUGINDIR =3D "${libdir}/vdr/plugins"
=20
@@ -34,5 +32,5 @@ python populate_packages_prepend () {
 FILES_${PN} =3D "${bindir}/* /var/lib/vdr/conf/* ${sysconfdir}/*"
 FILES_${PN}-dbg +=3D "${PLUGINDIR}/.debug/*"
=20
-SRC_URI[md5sum] =3D "c74ee966baca1c47ed6b9e2be3d1639b"
-SRC_URI[sha256sum] =3D "165bfcd811ef92cab50d11a88a76c481e105689438929414d2=
7edfacfb312f52"
+SRC_URI[md5sum] =3D "d5cc4bf87e73385a843f5de4763639f0"
+SRC_URI[sha256sum] =3D "f760d196c6f976043774f6ad9ba1af956d24ad456f8b2fea7d=
d6a73d38c96e95"
--=20
1.7.2.3

--=-ycc648TWwI6DRtiaTcMh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0qPLsACgkQPX1aK2wOHVjeXgCfcgG7vAMq2YafhA5JSZkYIg6i
GbcAniHh31EgTbvyDbRe02rZyLUKpkw5
=4jNw
-----END PGP SIGNATURE-----

--=-ycc648TWwI6DRtiaTcMh--
