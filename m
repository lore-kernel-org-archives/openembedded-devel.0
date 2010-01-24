Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ2Sj-0003td-Vq for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 14:25:13 +0100
Received: from g229060220.adsl.alicedsl.de ([92.229.60.220]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZ2QW-0001P0-KZ for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 13:22:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jan 2010 14:22:51 +0100
Message-ID: <1264339371.3810.74.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH][RESEND] vdr: Put common information in separate file and require it in the recipe.
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
X-List-Received-Date: Sun, 24 Jan 2010 13:25:14 -0000
X-Groupsio-MsgNum: 16157
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0P/mj/U+G465kRZmD/6f"

--=-0P/mj/U+G465kRZmD/6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=80=A2 Some information in a recipe apply to all versions of a program. =
Factor them out into an extra file and include/require this in each recipe =
as seen in a lot of other programs/packages/recipes in OE.

=E2=80=A2 VDR=E2=80=99s plugins often change and therefore put patches to t=
hem in version dependent folder.

This hopefully lessens the effort to add new versions.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/vdr/files/linkerflags.patch      |  186 --------------------------=
----
 recipes/vdr/vdr-1.7.10/linkerflags.patch |  186 ++++++++++++++++++++++++++=
++++
 recipes/vdr/vdr.inc                      |    8 ++
 recipes/vdr/vdr_1.7.10.bb                |   13 +--
 4 files changed, 197 insertions(+), 196 deletions(-)
 delete mode 100644 recipes/vdr/files/linkerflags.patch
 create mode 100644 recipes/vdr/vdr-1.7.10/linkerflags.patch
 create mode 100644 recipes/vdr/vdr.inc

diff --git a/recipes/vdr/files/linkerflags.patch b/recipes/vdr/files/linker=
flags.patch
deleted file mode 100644
index 63c4477..0000000
--- a/recipes/vdr/files/linkerflags.patch
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
diff --git a/recipes/vdr/vdr-1.7.10/linkerflags.patch b/recipes/vdr/vdr-1.7=
.10/linkerflags.patch
new file mode 100644
index 0000000..63c4477
--- /dev/null
+++ b/recipes/vdr/vdr-1.7.10/linkerflags.patch
@@ -0,0 +1,186 @@
+Index: vdr-1.7.10/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/Makefile	2010-01-07 22:01:54.000000000 +0100
++++ vdr-1.7.10/Makefile	2010-01-07 22:02:32.167165564 +0100
+@@ -20,7 +20,7 @@
+ MANDIR   =3D $(PREFIX)/share/man
+ BINDIR   =3D $(PREFIX)/bin
+ LOCDIR   =3D ./locale
+-LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
++LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig ${L=
DFLAGS}
+ INCLUDES =3D ${CFLAGS}
+=20
+ PLUGINDIR=3D ./PLUGINS
+Index: vdr-1.7.10/PLUGINS/src/hello/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/hello/Makefile	2010-01-07 22:01:07.0000000=
00 +0100
++++ vdr-1.7.10/PLUGINS/src/hello/Makefile	2010-01-07 22:02:02.240496954 +0=
100
+@@ -19,6 +19,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -95,7 +96,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/osddemo/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/osddemo/Makefile	2010-01-07 22:01:07.00000=
0000 +0100
++++ vdr-1.7.10/PLUGINS/src/osddemo/Makefile	2010-01-07 22:02:02.240496954 =
+0100
+@@ -17,6 +17,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -68,7 +69,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/pictures/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/pictures/Makefile	2010-01-07 22:01:07.0000=
00000 +0100
++++ vdr-1.7.10/PLUGINS/src/pictures/Makefile	2010-01-07 22:02:02.240496954=
 +0100
+@@ -19,6 +19,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -95,7 +96,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/servicedemo/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:01:07.0=
00000000 +0100
++++ vdr-1.7.10/PLUGINS/src/servicedemo/Makefile	2010-01-07 22:02:02.240496=
954 +0100
+@@ -19,6 +19,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -70,11 +71,11 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN1).so: $(PLUGIN1).o
+-	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@
++	$(CXX) $(CXXFLAGS) -shared $(PLUGIN1).o -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ libvdr-$(PLUGIN2).so: $(PLUGIN2).o
+-	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@
++	$(CXX) $(CXXFLAGS) -shared $(PLUGIN2).o -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/skincurses/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/skincurses/Makefile	2010-01-07 22:01:07.00=
0000000 +0100
++++ vdr-1.7.10/PLUGINS/src/skincurses/Makefile	2010-01-07 22:02:02.2404969=
54 +0100
+@@ -19,6 +19,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -95,7 +96,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -lncursesw -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/sky/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/sky/Makefile	2010-01-07 22:01:07.000000000=
 +0100
++++ vdr-1.7.10/PLUGINS/src/sky/Makefile	2010-01-07 22:02:02.240496954 +010=
0
+@@ -17,6 +17,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -68,7 +69,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/status/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/status/Makefile	2010-01-07 22:01:07.000000=
000 +0100
++++ vdr-1.7.10/PLUGINS/src/status/Makefile	2010-01-07 22:02:02.240496954 +=
0100
+@@ -17,6 +17,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -68,7 +69,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
+Index: vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- vdr-1.7.10.orig/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:01:07.000=
000000 +0100
++++ vdr-1.7.10/PLUGINS/src/svdrpdemo/Makefile	2010-01-07 22:02:02.24049695=
4 +0100
+@@ -17,6 +17,7 @@
+=20
+ CXX      ?=3D g++
+ CXXFLAGS ?=3D -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
++LIBS     ?=3D ${LDFLAGS}
+=20
+ ### The directory environment:
+=20
+@@ -68,7 +69,7 @@
+ ### Targets:
+=20
+ libvdr-$(PLUGIN).so: $(OBJS)
+-	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@
++	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $@ $(LIBS)
+ 	@cp --remove-destination $@ $(LIBDIR)/$@.$(APIVERSION)
+=20
+ dist: clean
diff --git a/recipes/vdr/vdr.inc b/recipes/vdr/vdr.inc
new file mode 100644
index 0000000..2e8cf40
--- /dev/null
+++ b/recipes/vdr/vdr.inc
@@ -0,0 +1,8 @@
+DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver progr=
am using Linux and DVB technologies. It allows one to record MPEG2 streams,=
 as well as output the stream to TV. It is also possible to watch DVDs (har=
dware accelerated) with some comfort and use an IR remote control."
+AUTHOR =3D "Klaus Schmidinger"
+LICENSE =3D "GPLv2"
+HOMEPAGE =3D "http://www.tvdr.de"
+
+DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl"
+
+SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2"
diff --git a/recipes/vdr/vdr_1.7.10.bb b/recipes/vdr/vdr_1.7.10.bb
index a8fa82c..69ca012 100644
--- a/recipes/vdr/vdr_1.7.10.bb
+++ b/recipes/vdr/vdr_1.7.10.bb
@@ -1,13 +1,7 @@
-DESCRIPTION =3D "Video Disk Recorder (VDR) is a digital sat-receiver progr=
am using Linux and DVB technologies. It allows one to record MPEG2 streams,=
 as well as output the stream to TV. It is also possible to watch DVDs (har=
dware accelerated) with some comfort and use an IR remote control."
-AUTHOR =3D "Klaus Schmidinger"
-LICENSE =3D "GPLv2"
-HOMEPAGE =3D "http://www.tvdr.de"
+require vdr.inc
 PR =3D "r2"
=20
-DEPENDS =3D "fontconfig freetype gettext libcap jpeg virtual/libintl"
-
-SRC_URI =3D "ftp://ftp.tvdr.de/vdr/Developer/${P}.tar.bz2 \
-           file://fixpaths.patch;patch=3D1 \
+SRC_URI +=3D " file://fixpaths.patch;patch=3D1 \
            file://cplusplus.patch;patch=3D1 \
            file://disable_plugin.patch;patch=3D1 \
            file://linkerflags.patch;patch=3D1 \
@@ -27,7 +21,7 @@ do_install () {
                  'VIDEODIR=3D/var/lib/vdr/video' \
                  'PLUGINLIBDIR=3D${PLUGINDIR}' \
                  'LOCDIR=3D${datadir}/locale' \
-                 install=20
+                 install
 }
=20
 PACKAGES_DYNAMIC +=3D "vdr-plugin-*"
@@ -39,4 +33,3 @@ python populate_packages_prepend () {
=20
 FILES_${PN} =3D "${bindir}/* /var/lib/vdr/conf/* ${sysconfdir}/*"
 FILES_${PN}-dbg +=3D "${PLUGINDIR}/.debug/*"
-
--=20
1.6.6


--=-0P/mj/U+G465kRZmD/6f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktcSaoACgkQPX1aK2wOHVhthwCfUW6+hw4llXXKSk/RLYQ1hjrx
qt0AniMJx/u+2zuapqkn2XVfOkCnIwyu
=ytDc
-----END PGP SIGNATURE-----

--=-0P/mj/U+G465kRZmD/6f--
