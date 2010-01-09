Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTcL6-0000WN-OE for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 15:30:56 +0100
Received: from g225139141.adsl.alicedsl.de ([92.225.139.141]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NTcJ5-0003oS-Dr for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 14:28:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 09 Jan 2010 15:28:55 +0100
Message-ID: <1263047335.14620.17.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Put common information in separate file and require it in the recipe.
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
X-List-Received-Date: Sat, 09 Jan 2010 14:30:56 -0000
X-Groupsio-MsgNum: 15495
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-//o/hbfwKoi5FFVFbNfe"

--=-//o/hbfwKoi5FFVFbNfe
Content-Type: multipart/mixed; boundary="=-OnNzpjVUf8RmOFuydYgo"

--=-OnNzpjVUf8RmOFuydYgo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE developers,


could this please be checked in. I build tested it and it saw no
differences.

The patch is also attached.


Thanks,

Paul

---
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
1.6.5.7

--=-OnNzpjVUf8RmOFuydYgo
Content-Disposition: attachment;
	filename*0=0001-Put-common-information-in-separate-file-and-require-.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-Put-common-information-in-separate-file-and-require-.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSBmOTUyNjJiZGQzNTk4MDdmM2RlYjEwYjdhODg3YmVmZTZkMGNmOTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGF1bCBNZW56ZWwgPHBhdWxlcGFudGVyQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4NCkRhdGU6IFNhdCwgOSBKYW4gMjAxMCAxMjoxMTo0MCArMDEwMA0KU3ViamVj
dDogW1BBVENIIDEvMl0gUHV0IGNvbW1vbiBpbmZvcm1hdGlvbiBpbiBzZXBhcmF0ZSBmaWxlIGFu
ZCByZXF1aXJlIGl0IGluIHRoZSByZWNpcGUuDQoNClRoaXMgaG9wZWZ1bGx5IGxlc3NlbnMgdGhl
IGVmZm9ydCB0byBhZGQgbmV3IHZlcnNpb25zLg0KDQpTaWduZWQtb2ZmLWJ5OiBQYXVsIE1lbnpl
bCA8cGF1bGVwYW50ZXJAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KLS0tDQogcmVjaXBlcy92ZHIv
ZmlsZXMvbGlua2VyZmxhZ3MucGF0Y2ggICAgICB8ICAxODYgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQogcmVjaXBlcy92ZHIvdmRyLTEuNy4xMC9saW5rZXJmbGFncy5wYXRjaCB8ICAx
ODYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogcmVjaXBlcy92ZHIvdmRyLmluYyAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIDggKysNCiByZWNpcGVzL3Zkci92ZHJfMS43LjEwLmJi
ICAgICAgICAgICAgICAgIHwgICAxMyArLS0NCiA0IGZpbGVzIGNoYW5nZWQsIDE5NyBpbnNlcnRp
b25zKCspLCAxOTYgZGVsZXRpb25zKC0pDQogZGVsZXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvdmRy
L2ZpbGVzL2xpbmtlcmZsYWdzLnBhdGNoDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvdmRy
L3Zkci0xLjcuMTAvbGlua2VyZmxhZ3MucGF0Y2gNCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmVjaXBl
cy92ZHIvdmRyLmluYw0KDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy92ZHIvZmlsZXMvbGlua2VyZmxh
Z3MucGF0Y2ggYi9yZWNpcGVzL3Zkci9maWxlcy9saW5rZXJmbGFncy5wYXRjaA0KZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0DQppbmRleCA2M2M0NDc3Li4wMDAwMDAwDQotLS0gYS9yZWNpcGVzL3Zk
ci9maWxlcy9saW5rZXJmbGFncy5wYXRjaA0KKysrIC9kZXYvbnVsbA0KQEAgLTEsMTg2ICswLDAg
QEANCi1JbmRleDogdmRyLTEuNy4xMC9NYWtlZmlsZQ0KLT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCi0tLS0gdmRyLTEu
Ny4xMC5vcmlnL01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6MDE6NTQuMDAwMDAwMDAwICswMTAwDQot
KysrIHZkci0xLjcuMTAvTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMjozMi4xNjcxNjU1NjQgKzAx
MDANCi1AQCAtMjAsNyArMjAsNyBAQA0KLSBNQU5ESVIgICA9ICQoUFJFRklYKS9zaGFyZS9tYW4N
Ci0gQklORElSICAgPSAkKFBSRUZJWCkvYmluDQotIExPQ0RJUiAgID0gLi9sb2NhbGUNCi0tTElC
UyAgICAgPSAtbGpwZWcgLWxwdGhyZWFkIC1sZGwgLWxjYXAgLWxydCAtbGZyZWV0eXBlIC1sZm9u
dGNvbmZpZw0KLStMSUJTICAgICA9IC1sanBlZyAtbHB0aHJlYWQgLWxkbCAtbGNhcCAtbHJ0IC1s
ZnJlZXR5cGUgLWxmb250Y29uZmlnICR7TERGTEFHU30NCi0gSU5DTFVERVMgPSAke0NGTEFHU30N
Ci0gDQotIFBMVUdJTkRJUj0gLi9QTFVHSU5TDQotSW5kZXg6IHZkci0xLjcuMTAvUExVR0lOUy9z
cmMvaGVsbG8vTWFrZWZpbGUNCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIHZkci0xLjcuMTAub3JpZy9QTFVH
SU5TL3NyYy9oZWxsby9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEw
MA0KLSsrKyB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL2hlbGxvL01ha2VmaWxlCTIwMTAtMDEtMDcg
MjI6MDI6MDIuMjQwNDk2OTU0ICswMTAwDQotQEAgLTE5LDYgKzE5LDcgQEANCi0gDQotIENYWCAg
ICAgID89IGcrKw0KLSBDWFhGTEFHUyA/PSAtZlBJQyAtZyAtTzIgLVdhbGwgLVdvdmVybG9hZGVk
LXZpcnR1YWwgLVduby1wYXJlbnRoZXNlcw0KLStMSUJTICAgICA/PSAke0xERkxBR1N9DQotIA0K
LSAjIyMgVGhlIGRpcmVjdG9yeSBlbnZpcm9ubWVudDoNCi0gDQotQEAgLTk1LDcgKzk2LDcgQEAN
Ci0gIyMjIFRhcmdldHM6DQotIA0KLSBsaWJ2ZHItJChQTFVHSU4pLnNvOiAkKE9CSlMpDQotLQkk
KENYWCkgJChDWFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRADQotKwkkKENYWCkgJChDWFhG
TEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRAICQoTElCUykNCi0gCUBjcCAtLXJlbW92ZS1kZXN0
aW5hdGlvbiAkQCAkKExJQkRJUikvJEAuJChBUElWRVJTSU9OKQ0KLSANCi0gZGlzdDogY2xlYW4N
Ci1JbmRleDogdmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9vc2RkZW1vL01ha2VmaWxlDQotPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KLS0tLSB2ZHItMS43LjEwLm9yaWcvUExVR0lOUy9zcmMvb3NkZGVtby9NYWtlZmlsZQky
MDEwLTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEwMA0KLSsrKyB2ZHItMS43LjEwL1BMVUdJ
TlMvc3JjL29zZGRlbW8vTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMjowMi4yNDA0OTY5NTQgKzAx
MDANCi1AQCAtMTcsNiArMTcsNyBAQA0KLSANCi0gQ1hYICAgICAgPz0gZysrDQotIENYWEZMQUdT
ID89IC1mUElDIC1nIC1PMiAtV2FsbCAtV292ZXJsb2FkZWQtdmlydHVhbCAtV25vLXBhcmVudGhl
c2VzDQotK0xJQlMgICAgID89ICR7TERGTEFHU30NCi0gDQotICMjIyBUaGUgZGlyZWN0b3J5IGVu
dmlyb25tZW50Og0KLSANCi1AQCAtNjgsNyArNjksNyBAQA0KLSAjIyMgVGFyZ2V0czoNCi0gDQot
IGxpYnZkci0kKFBMVUdJTikuc286ICQoT0JKUykNCi0tCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hh
cmVkICQoT0JKUykgLW8gJEANCi0rCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hhcmVkICQoT0JKUykg
LW8gJEAgJChMSUJTKQ0KLSAJQGNwIC0tcmVtb3ZlLWRlc3RpbmF0aW9uICRAICQoTElCRElSKS8k
QC4kKEFQSVZFUlNJT04pDQotIA0KLSBkaXN0OiBjbGVhbg0KLUluZGV4OiB2ZHItMS43LjEwL1BM
VUdJTlMvc3JjL3BpY3R1cmVzL01ha2VmaWxlDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KLS0tLSB2ZHItMS43LjEw
Lm9yaWcvUExVR0lOUy9zcmMvcGljdHVyZXMvTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMTowNy4w
MDAwMDAwMDAgKzAxMDANCi0rKysgdmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9waWN0dXJlcy9NYWtl
ZmlsZQkyMDEwLTAxLTA3IDIyOjAyOjAyLjI0MDQ5Njk1NCArMDEwMA0KLUBAIC0xOSw2ICsxOSw3
IEBADQotIA0KLSBDWFggICAgICA/PSBnKysNCi0gQ1hYRkxBR1MgPz0gLWZQSUMgLWcgLU8yIC1X
YWxsIC1Xb3ZlcmxvYWRlZC12aXJ0dWFsIC1Xbm8tcGFyZW50aGVzZXMNCi0rTElCUyAgICAgPz0g
JHtMREZMQUdTfQ0KLSANCi0gIyMjIFRoZSBkaXJlY3RvcnkgZW52aXJvbm1lbnQ6DQotIA0KLUBA
IC05NSw3ICs5Niw3IEBADQotICMjIyBUYXJnZXRzOg0KLSANCi0gbGlidmRyLSQoUExVR0lOKS5z
bzogJChPQkpTKQ0KLS0JJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChPQkpTKSAtbyAkQA0K
LSsJJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChPQkpTKSAtbyAkQCAkKExJQlMpDQotIAlA
Y3AgLS1yZW1vdmUtZGVzdGluYXRpb24gJEAgJChMSUJESVIpLyRALiQoQVBJVkVSU0lPTikNCi0g
DQotIGRpc3Q6IGNsZWFuDQotSW5kZXg6IHZkci0xLjcuMTAvUExVR0lOUy9zcmMvc2VydmljZWRl
bW8vTWFrZWZpbGUNCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQotLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3Ny
Yy9zZXJ2aWNlZGVtby9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEw
MA0KLSsrKyB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL3NlcnZpY2VkZW1vL01ha2VmaWxlCTIwMTAt
MDEtMDcgMjI6MDI6MDIuMjQwNDk2OTU0ICswMTAwDQotQEAgLTE5LDYgKzE5LDcgQEANCi0gDQot
IENYWCAgICAgID89IGcrKw0KLSBDWFhGTEFHUyA/PSAtZlBJQyAtZyAtTzIgLVdhbGwgLVdvdmVy
bG9hZGVkLXZpcnR1YWwgLVduby1wYXJlbnRoZXNlcw0KLStMSUJTICAgICA/PSAke0xERkxBR1N9
DQotIA0KLSAjIyMgVGhlIGRpcmVjdG9yeSBlbnZpcm9ubWVudDoNCi0gDQotQEAgLTcwLDExICs3
MSwxMSBAQA0KLSAjIyMgVGFyZ2V0czoNCi0gDQotIGxpYnZkci0kKFBMVUdJTjEpLnNvOiAkKFBM
VUdJTjEpLm8NCi0tCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hhcmVkICQoUExVR0lOMSkubyAtbyAk
QA0KLSsJJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChQTFVHSU4xKS5vIC1vICRAICQoTElC
UykNCi0gCUBjcCAtLXJlbW92ZS1kZXN0aW5hdGlvbiAkQCAkKExJQkRJUikvJEAuJChBUElWRVJT
SU9OKQ0KLSANCi0gbGlidmRyLSQoUExVR0lOMikuc286ICQoUExVR0lOMikubw0KLS0JJChDWFgp
ICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChQTFVHSU4yKS5vIC1vICRADQotKwkkKENYWCkgJChDWFhG
TEFHUykgLXNoYXJlZCAkKFBMVUdJTjIpLm8gLW8gJEAgJChMSUJTKQ0KLSAJQGNwIC0tcmVtb3Zl
LWRlc3RpbmF0aW9uICRAICQoTElCRElSKS8kQC4kKEFQSVZFUlNJT04pDQotIA0KLSBkaXN0OiBj
bGVhbg0KLUluZGV4OiB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL3NraW5jdXJzZXMvTWFrZWZpbGUN
Ci09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQotLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3NyYy9za2luY3Vyc2Vz
L01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6MDE6MDcuMDAwMDAwMDAwICswMTAwDQotKysrIHZkci0x
LjcuMTAvUExVR0lOUy9zcmMvc2tpbmN1cnNlcy9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAyOjAy
LjI0MDQ5Njk1NCArMDEwMA0KLUBAIC0xOSw2ICsxOSw3IEBADQotIA0KLSBDWFggICAgICA/PSBn
KysNCi0gQ1hYRkxBR1MgPz0gLWZQSUMgLWcgLU8yIC1XYWxsIC1Xb3ZlcmxvYWRlZC12aXJ0dWFs
IC1Xbm8tcGFyZW50aGVzZXMNCi0rTElCUyAgICAgPz0gJHtMREZMQUdTfQ0KLSANCi0gIyMjIFRo
ZSBkaXJlY3RvcnkgZW52aXJvbm1lbnQ6DQotIA0KLUBAIC05NSw3ICs5Niw3IEBADQotICMjIyBU
YXJnZXRzOg0KLSANCi0gbGlidmRyLSQoUExVR0lOKS5zbzogJChPQkpTKQ0KLS0JJChDWFgpICQo
Q1hYRkxBR1MpIC1zaGFyZWQgJChPQkpTKSAtbG5jdXJzZXN3IC1vICRADQotKwkkKENYWCkgJChD
WFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1sbmN1cnNlc3cgLW8gJEAgJChMSUJTKQ0KLSAJQGNw
IC0tcmVtb3ZlLWRlc3RpbmF0aW9uICRAICQoTElCRElSKS8kQC4kKEFQSVZFUlNJT04pDQotIA0K
LSBkaXN0OiBjbGVhbg0KLUluZGV4OiB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL3NreS9NYWtlZmls
ZQ0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCi0tLS0gdmRyLTEuNy4xMC5vcmlnL1BMVUdJTlMvc3JjL3NreS9NYWtl
ZmlsZQkyMDEwLTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEwMA0KLSsrKyB2ZHItMS43LjEw
L1BMVUdJTlMvc3JjL3NreS9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAyOjAyLjI0MDQ5Njk1NCAr
MDEwMA0KLUBAIC0xNyw2ICsxNyw3IEBADQotIA0KLSBDWFggICAgICA/PSBnKysNCi0gQ1hYRkxB
R1MgPz0gLWZQSUMgLWcgLU8yIC1XYWxsIC1Xb3ZlcmxvYWRlZC12aXJ0dWFsIC1Xbm8tcGFyZW50
aGVzZXMNCi0rTElCUyAgICAgPz0gJHtMREZMQUdTfQ0KLSANCi0gIyMjIFRoZSBkaXJlY3Rvcnkg
ZW52aXJvbm1lbnQ6DQotIA0KLUBAIC02OCw3ICs2OSw3IEBADQotICMjIyBUYXJnZXRzOg0KLSAN
Ci0gbGlidmRyLSQoUExVR0lOKS5zbzogJChPQkpTKQ0KLS0JJChDWFgpICQoQ1hYRkxBR1MpIC1z
aGFyZWQgJChPQkpTKSAtbyAkQA0KLSsJJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChPQkpT
KSAtbyAkQCAkKExJQlMpDQotIAlAY3AgLS1yZW1vdmUtZGVzdGluYXRpb24gJEAgJChMSUJESVIp
LyRALiQoQVBJVkVSU0lPTikNCi0gDQotIGRpc3Q6IGNsZWFuDQotSW5kZXg6IHZkci0xLjcuMTAv
UExVR0lOUy9zcmMvc3RhdHVzL01ha2VmaWxlDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KLS0tLSB2ZHItMS43LjEw
Lm9yaWcvUExVR0lOUy9zcmMvc3RhdHVzL01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6MDE6MDcuMDAw
MDAwMDAwICswMTAwDQotKysrIHZkci0xLjcuMTAvUExVR0lOUy9zcmMvc3RhdHVzL01ha2VmaWxl
CTIwMTAtMDEtMDcgMjI6MDI6MDIuMjQwNDk2OTU0ICswMTAwDQotQEAgLTE3LDYgKzE3LDcgQEAN
Ci0gDQotIENYWCAgICAgID89IGcrKw0KLSBDWFhGTEFHUyA/PSAtZlBJQyAtZyAtTzIgLVdhbGwg
LVdvdmVybG9hZGVkLXZpcnR1YWwgLVduby1wYXJlbnRoZXNlcw0KLStMSUJTICAgICA/PSAke0xE
RkxBR1N9DQotIA0KLSAjIyMgVGhlIGRpcmVjdG9yeSBlbnZpcm9ubWVudDoNCi0gDQotQEAgLTY4
LDcgKzY5LDcgQEANCi0gIyMjIFRhcmdldHM6DQotIA0KLSBsaWJ2ZHItJChQTFVHSU4pLnNvOiAk
KE9CSlMpDQotLQkkKENYWCkgJChDWFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRADQotKwkk
KENYWCkgJChDWFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRAICQoTElCUykNCi0gCUBjcCAt
LXJlbW92ZS1kZXN0aW5hdGlvbiAkQCAkKExJQkRJUikvJEAuJChBUElWRVJTSU9OKQ0KLSANCi0g
ZGlzdDogY2xlYW4NCi1JbmRleDogdmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9zdmRycGRlbW8vTWFr
ZWZpbGUNCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQotLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3NyYy9zdmRy
cGRlbW8vTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMTowNy4wMDAwMDAwMDAgKzAxMDANCi0rKysg
dmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9zdmRycGRlbW8vTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjow
MjowMi4yNDA0OTY5NTQgKzAxMDANCi1AQCAtMTcsNiArMTcsNyBAQA0KLSANCi0gQ1hYICAgICAg
Pz0gZysrDQotIENYWEZMQUdTID89IC1mUElDIC1nIC1PMiAtV2FsbCAtV292ZXJsb2FkZWQtdmly
dHVhbCAtV25vLXBhcmVudGhlc2VzDQotK0xJQlMgICAgID89ICR7TERGTEFHU30NCi0gDQotICMj
IyBUaGUgZGlyZWN0b3J5IGVudmlyb25tZW50Og0KLSANCi1AQCAtNjgsNyArNjksNyBAQA0KLSAj
IyMgVGFyZ2V0czoNCi0gDQotIGxpYnZkci0kKFBMVUdJTikuc286ICQoT0JKUykNCi0tCSQoQ1hY
KSAkKENYWEZMQUdTKSAtc2hhcmVkICQoT0JKUykgLW8gJEANCi0rCSQoQ1hYKSAkKENYWEZMQUdT
KSAtc2hhcmVkICQoT0JKUykgLW8gJEAgJChMSUJTKQ0KLSAJQGNwIC0tcmVtb3ZlLWRlc3RpbmF0
aW9uICRAICQoTElCRElSKS8kQC4kKEFQSVZFUlNJT04pDQotIA0KLSBkaXN0OiBjbGVhbg0KZGlm
ZiAtLWdpdCBhL3JlY2lwZXMvdmRyL3Zkci0xLjcuMTAvbGlua2VyZmxhZ3MucGF0Y2ggYi9yZWNp
cGVzL3Zkci92ZHItMS43LjEwL2xpbmtlcmZsYWdzLnBhdGNoDQpuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KaW5kZXggMDAwMDAwMC4uNjNjNDQ3Nw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvcmVjaXBlcy92
ZHIvdmRyLTEuNy4xMC9saW5rZXJmbGFncy5wYXRjaA0KQEAgLTAsMCArMSwxODYgQEANCitJbmRl
eDogdmRyLTEuNy4xMC9NYWtlZmlsZQ0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCistLS0gdmRyLTEuNy4xMC5vcmln
L01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6MDE6NTQuMDAwMDAwMDAwICswMTAwDQorKysrIHZkci0x
LjcuMTAvTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMjozMi4xNjcxNjU1NjQgKzAxMDANCitAQCAt
MjAsNyArMjAsNyBAQA0KKyBNQU5ESVIgICA9ICQoUFJFRklYKS9zaGFyZS9tYW4NCisgQklORElS
ICAgPSAkKFBSRUZJWCkvYmluDQorIExPQ0RJUiAgID0gLi9sb2NhbGUNCistTElCUyAgICAgPSAt
bGpwZWcgLWxwdGhyZWFkIC1sZGwgLWxjYXAgLWxydCAtbGZyZWV0eXBlIC1sZm9udGNvbmZpZw0K
KytMSUJTICAgICA9IC1sanBlZyAtbHB0aHJlYWQgLWxkbCAtbGNhcCAtbHJ0IC1sZnJlZXR5cGUg
LWxmb250Y29uZmlnICR7TERGTEFHU30NCisgSU5DTFVERVMgPSAke0NGTEFHU30NCisgDQorIFBM
VUdJTkRJUj0gLi9QTFVHSU5TDQorSW5kZXg6IHZkci0xLjcuMTAvUExVR0lOUy9zcmMvaGVsbG8v
TWFrZWZpbGUNCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQorLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3NyYy9o
ZWxsby9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEwMA0KKysrKyB2
ZHItMS43LjEwL1BMVUdJTlMvc3JjL2hlbGxvL01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6MDI6MDIu
MjQwNDk2OTU0ICswMTAwDQorQEAgLTE5LDYgKzE5LDcgQEANCisgDQorIENYWCAgICAgID89IGcr
Kw0KKyBDWFhGTEFHUyA/PSAtZlBJQyAtZyAtTzIgLVdhbGwgLVdvdmVybG9hZGVkLXZpcnR1YWwg
LVduby1wYXJlbnRoZXNlcw0KKytMSUJTICAgICA/PSAke0xERkxBR1N9DQorIA0KKyAjIyMgVGhl
IGRpcmVjdG9yeSBlbnZpcm9ubWVudDoNCisgDQorQEAgLTk1LDcgKzk2LDcgQEANCisgIyMjIFRh
cmdldHM6DQorIA0KKyBsaWJ2ZHItJChQTFVHSU4pLnNvOiAkKE9CSlMpDQorLQkkKENYWCkgJChD
WFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRADQorKwkkKENYWCkgJChDWFhGTEFHUykgLXNo
YXJlZCAkKE9CSlMpIC1vICRAICQoTElCUykNCisgCUBjcCAtLXJlbW92ZS1kZXN0aW5hdGlvbiAk
QCAkKExJQkRJUikvJEAuJChBUElWRVJTSU9OKQ0KKyANCisgZGlzdDogY2xlYW4NCitJbmRleDog
dmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9vc2RkZW1vL01ha2VmaWxlDQorPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KKy0t
LSB2ZHItMS43LjEwLm9yaWcvUExVR0lOUy9zcmMvb3NkZGVtby9NYWtlZmlsZQkyMDEwLTAxLTA3
IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEwMA0KKysrKyB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL29z
ZGRlbW8vTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMjowMi4yNDA0OTY5NTQgKzAxMDANCitAQCAt
MTcsNiArMTcsNyBAQA0KKyANCisgQ1hYICAgICAgPz0gZysrDQorIENYWEZMQUdTID89IC1mUElD
IC1nIC1PMiAtV2FsbCAtV292ZXJsb2FkZWQtdmlydHVhbCAtV25vLXBhcmVudGhlc2VzDQorK0xJ
QlMgICAgID89ICR7TERGTEFHU30NCisgDQorICMjIyBUaGUgZGlyZWN0b3J5IGVudmlyb25tZW50
Og0KKyANCitAQCAtNjgsNyArNjksNyBAQA0KKyAjIyMgVGFyZ2V0czoNCisgDQorIGxpYnZkci0k
KFBMVUdJTikuc286ICQoT0JKUykNCistCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hhcmVkICQoT0JK
UykgLW8gJEANCisrCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hhcmVkICQoT0JKUykgLW8gJEAgJChM
SUJTKQ0KKyAJQGNwIC0tcmVtb3ZlLWRlc3RpbmF0aW9uICRAICQoTElCRElSKS8kQC4kKEFQSVZF
UlNJT04pDQorIA0KKyBkaXN0OiBjbGVhbg0KK0luZGV4OiB2ZHItMS43LjEwL1BMVUdJTlMvc3Jj
L3BpY3R1cmVzL01ha2VmaWxlDQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KKy0tLSB2ZHItMS43LjEwLm9yaWcvUExV
R0lOUy9zcmMvcGljdHVyZXMvTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMTowNy4wMDAwMDAwMDAg
KzAxMDANCisrKysgdmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9waWN0dXJlcy9NYWtlZmlsZQkyMDEw
LTAxLTA3IDIyOjAyOjAyLjI0MDQ5Njk1NCArMDEwMA0KK0BAIC0xOSw2ICsxOSw3IEBADQorIA0K
KyBDWFggICAgICA/PSBnKysNCisgQ1hYRkxBR1MgPz0gLWZQSUMgLWcgLU8yIC1XYWxsIC1Xb3Zl
cmxvYWRlZC12aXJ0dWFsIC1Xbm8tcGFyZW50aGVzZXMNCisrTElCUyAgICAgPz0gJHtMREZMQUdT
fQ0KKyANCisgIyMjIFRoZSBkaXJlY3RvcnkgZW52aXJvbm1lbnQ6DQorIA0KK0BAIC05NSw3ICs5
Niw3IEBADQorICMjIyBUYXJnZXRzOg0KKyANCisgbGlidmRyLSQoUExVR0lOKS5zbzogJChPQkpT
KQ0KKy0JJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChPQkpTKSAtbyAkQA0KKysJJChDWFgp
ICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChPQkpTKSAtbyAkQCAkKExJQlMpDQorIAlAY3AgLS1yZW1v
dmUtZGVzdGluYXRpb24gJEAgJChMSUJESVIpLyRALiQoQVBJVkVSU0lPTikNCisgDQorIGRpc3Q6
IGNsZWFuDQorSW5kZXg6IHZkci0xLjcuMTAvUExVR0lOUy9zcmMvc2VydmljZWRlbW8vTWFrZWZp
bGUNCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQorLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3NyYy9zZXJ2aWNl
ZGVtby9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEwMA0KKysrKyB2
ZHItMS43LjEwL1BMVUdJTlMvc3JjL3NlcnZpY2VkZW1vL01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6
MDI6MDIuMjQwNDk2OTU0ICswMTAwDQorQEAgLTE5LDYgKzE5LDcgQEANCisgDQorIENYWCAgICAg
ID89IGcrKw0KKyBDWFhGTEFHUyA/PSAtZlBJQyAtZyAtTzIgLVdhbGwgLVdvdmVybG9hZGVkLXZp
cnR1YWwgLVduby1wYXJlbnRoZXNlcw0KKytMSUJTICAgICA/PSAke0xERkxBR1N9DQorIA0KKyAj
IyMgVGhlIGRpcmVjdG9yeSBlbnZpcm9ubWVudDoNCisgDQorQEAgLTcwLDExICs3MSwxMSBAQA0K
KyAjIyMgVGFyZ2V0czoNCisgDQorIGxpYnZkci0kKFBMVUdJTjEpLnNvOiAkKFBMVUdJTjEpLm8N
CistCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hhcmVkICQoUExVR0lOMSkubyAtbyAkQA0KKysJJChD
WFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChQTFVHSU4xKS5vIC1vICRAICQoTElCUykNCisgCUBj
cCAtLXJlbW92ZS1kZXN0aW5hdGlvbiAkQCAkKExJQkRJUikvJEAuJChBUElWRVJTSU9OKQ0KKyAN
CisgbGlidmRyLSQoUExVR0lOMikuc286ICQoUExVR0lOMikubw0KKy0JJChDWFgpICQoQ1hYRkxB
R1MpIC1zaGFyZWQgJChQTFVHSU4yKS5vIC1vICRADQorKwkkKENYWCkgJChDWFhGTEFHUykgLXNo
YXJlZCAkKFBMVUdJTjIpLm8gLW8gJEAgJChMSUJTKQ0KKyAJQGNwIC0tcmVtb3ZlLWRlc3RpbmF0
aW9uICRAICQoTElCRElSKS8kQC4kKEFQSVZFUlNJT04pDQorIA0KKyBkaXN0OiBjbGVhbg0KK0lu
ZGV4OiB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL3NraW5jdXJzZXMvTWFrZWZpbGUNCis9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQorLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3NyYy9za2luY3Vyc2VzL01ha2VmaWxl
CTIwMTAtMDEtMDcgMjI6MDE6MDcuMDAwMDAwMDAwICswMTAwDQorKysrIHZkci0xLjcuMTAvUExV
R0lOUy9zcmMvc2tpbmN1cnNlcy9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAyOjAyLjI0MDQ5Njk1
NCArMDEwMA0KK0BAIC0xOSw2ICsxOSw3IEBADQorIA0KKyBDWFggICAgICA/PSBnKysNCisgQ1hY
RkxBR1MgPz0gLWZQSUMgLWcgLU8yIC1XYWxsIC1Xb3ZlcmxvYWRlZC12aXJ0dWFsIC1Xbm8tcGFy
ZW50aGVzZXMNCisrTElCUyAgICAgPz0gJHtMREZMQUdTfQ0KKyANCisgIyMjIFRoZSBkaXJlY3Rv
cnkgZW52aXJvbm1lbnQ6DQorIA0KK0BAIC05NSw3ICs5Niw3IEBADQorICMjIyBUYXJnZXRzOg0K
KyANCisgbGlidmRyLSQoUExVR0lOKS5zbzogJChPQkpTKQ0KKy0JJChDWFgpICQoQ1hYRkxBR1Mp
IC1zaGFyZWQgJChPQkpTKSAtbG5jdXJzZXN3IC1vICRADQorKwkkKENYWCkgJChDWFhGTEFHUykg
LXNoYXJlZCAkKE9CSlMpIC1sbmN1cnNlc3cgLW8gJEAgJChMSUJTKQ0KKyAJQGNwIC0tcmVtb3Zl
LWRlc3RpbmF0aW9uICRAICQoTElCRElSKS8kQC4kKEFQSVZFUlNJT04pDQorIA0KKyBkaXN0OiBj
bGVhbg0KK0luZGV4OiB2ZHItMS43LjEwL1BMVUdJTlMvc3JjL3NreS9NYWtlZmlsZQ0KKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCistLS0gdmRyLTEuNy4xMC5vcmlnL1BMVUdJTlMvc3JjL3NreS9NYWtlZmlsZQkyMDEw
LTAxLTA3IDIyOjAxOjA3LjAwMDAwMDAwMCArMDEwMA0KKysrKyB2ZHItMS43LjEwL1BMVUdJTlMv
c3JjL3NreS9NYWtlZmlsZQkyMDEwLTAxLTA3IDIyOjAyOjAyLjI0MDQ5Njk1NCArMDEwMA0KK0BA
IC0xNyw2ICsxNyw3IEBADQorIA0KKyBDWFggICAgICA/PSBnKysNCisgQ1hYRkxBR1MgPz0gLWZQ
SUMgLWcgLU8yIC1XYWxsIC1Xb3ZlcmxvYWRlZC12aXJ0dWFsIC1Xbm8tcGFyZW50aGVzZXMNCisr
TElCUyAgICAgPz0gJHtMREZMQUdTfQ0KKyANCisgIyMjIFRoZSBkaXJlY3RvcnkgZW52aXJvbm1l
bnQ6DQorIA0KK0BAIC02OCw3ICs2OSw3IEBADQorICMjIyBUYXJnZXRzOg0KKyANCisgbGlidmRy
LSQoUExVR0lOKS5zbzogJChPQkpTKQ0KKy0JJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChP
QkpTKSAtbyAkQA0KKysJJChDWFgpICQoQ1hYRkxBR1MpIC1zaGFyZWQgJChPQkpTKSAtbyAkQCAk
KExJQlMpDQorIAlAY3AgLS1yZW1vdmUtZGVzdGluYXRpb24gJEAgJChMSUJESVIpLyRALiQoQVBJ
VkVSU0lPTikNCisgDQorIGRpc3Q6IGNsZWFuDQorSW5kZXg6IHZkci0xLjcuMTAvUExVR0lOUy9z
cmMvc3RhdHVzL01ha2VmaWxlDQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KKy0tLSB2ZHItMS43LjEwLm9yaWcvUExV
R0lOUy9zcmMvc3RhdHVzL01ha2VmaWxlCTIwMTAtMDEtMDcgMjI6MDE6MDcuMDAwMDAwMDAwICsw
MTAwDQorKysrIHZkci0xLjcuMTAvUExVR0lOUy9zcmMvc3RhdHVzL01ha2VmaWxlCTIwMTAtMDEt
MDcgMjI6MDI6MDIuMjQwNDk2OTU0ICswMTAwDQorQEAgLTE3LDYgKzE3LDcgQEANCisgDQorIENY
WCAgICAgID89IGcrKw0KKyBDWFhGTEFHUyA/PSAtZlBJQyAtZyAtTzIgLVdhbGwgLVdvdmVybG9h
ZGVkLXZpcnR1YWwgLVduby1wYXJlbnRoZXNlcw0KKytMSUJTICAgICA/PSAke0xERkxBR1N9DQor
IA0KKyAjIyMgVGhlIGRpcmVjdG9yeSBlbnZpcm9ubWVudDoNCisgDQorQEAgLTY4LDcgKzY5LDcg
QEANCisgIyMjIFRhcmdldHM6DQorIA0KKyBsaWJ2ZHItJChQTFVHSU4pLnNvOiAkKE9CSlMpDQor
LQkkKENYWCkgJChDWFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRADQorKwkkKENYWCkgJChD
WFhGTEFHUykgLXNoYXJlZCAkKE9CSlMpIC1vICRAICQoTElCUykNCisgCUBjcCAtLXJlbW92ZS1k
ZXN0aW5hdGlvbiAkQCAkKExJQkRJUikvJEAuJChBUElWRVJTSU9OKQ0KKyANCisgZGlzdDogY2xl
YW4NCitJbmRleDogdmRyLTEuNy4xMC9QTFVHSU5TL3NyYy9zdmRycGRlbW8vTWFrZWZpbGUNCis9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQorLS0tIHZkci0xLjcuMTAub3JpZy9QTFVHSU5TL3NyYy9zdmRycGRlbW8vTWFr
ZWZpbGUJMjAxMC0wMS0wNyAyMjowMTowNy4wMDAwMDAwMDAgKzAxMDANCisrKysgdmRyLTEuNy4x
MC9QTFVHSU5TL3NyYy9zdmRycGRlbW8vTWFrZWZpbGUJMjAxMC0wMS0wNyAyMjowMjowMi4yNDA0
OTY5NTQgKzAxMDANCitAQCAtMTcsNiArMTcsNyBAQA0KKyANCisgQ1hYICAgICAgPz0gZysrDQor
IENYWEZMQUdTID89IC1mUElDIC1nIC1PMiAtV2FsbCAtV292ZXJsb2FkZWQtdmlydHVhbCAtV25v
LXBhcmVudGhlc2VzDQorK0xJQlMgICAgID89ICR7TERGTEFHU30NCisgDQorICMjIyBUaGUgZGly
ZWN0b3J5IGVudmlyb25tZW50Og0KKyANCitAQCAtNjgsNyArNjksNyBAQA0KKyAjIyMgVGFyZ2V0
czoNCisgDQorIGxpYnZkci0kKFBMVUdJTikuc286ICQoT0JKUykNCistCSQoQ1hYKSAkKENYWEZM
QUdTKSAtc2hhcmVkICQoT0JKUykgLW8gJEANCisrCSQoQ1hYKSAkKENYWEZMQUdTKSAtc2hhcmVk
ICQoT0JKUykgLW8gJEAgJChMSUJTKQ0KKyAJQGNwIC0tcmVtb3ZlLWRlc3RpbmF0aW9uICRAICQo
TElCRElSKS8kQC4kKEFQSVZFUlNJT04pDQorIA0KKyBkaXN0OiBjbGVhbg0KZGlmZiAtLWdpdCBh
L3JlY2lwZXMvdmRyL3Zkci5pbmMgYi9yZWNpcGVzL3Zkci92ZHIuaW5jDQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uMmU4Y2Y0MA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvcmVj
aXBlcy92ZHIvdmRyLmluYw0KQEAgLTAsMCArMSw4IEBADQorREVTQ1JJUFRJT04gPSAiVmlkZW8g
RGlzayBSZWNvcmRlciAoVkRSKSBpcyBhIGRpZ2l0YWwgc2F0LXJlY2VpdmVyIHByb2dyYW0gdXNp
bmcgTGludXggYW5kIERWQiB0ZWNobm9sb2dpZXMuIEl0IGFsbG93cyBvbmUgdG8gcmVjb3JkIE1Q
RUcyIHN0cmVhbXMsIGFzIHdlbGwgYXMgb3V0cHV0IHRoZSBzdHJlYW0gdG8gVFYuIEl0IGlzIGFs
c28gcG9zc2libGUgdG8gd2F0Y2ggRFZEcyAoaGFyZHdhcmUgYWNjZWxlcmF0ZWQpIHdpdGggc29t
ZSBjb21mb3J0IGFuZCB1c2UgYW4gSVIgcmVtb3RlIGNvbnRyb2wuIg0KK0FVVEhPUiA9ICJLbGF1
cyBTY2htaWRpbmdlciINCitMSUNFTlNFID0gIkdQTHYyIg0KK0hPTUVQQUdFID0gImh0dHA6Ly93
d3cudHZkci5kZSINCisNCitERVBFTkRTID0gImZvbnRjb25maWcgZnJlZXR5cGUgZ2V0dGV4dCBs
aWJjYXAganBlZyB2aXJ0dWFsL2xpYmludGwiDQorDQorU1JDX1VSSSA9ICJmdHA6Ly9mdHAudHZk
ci5kZS92ZHIvRGV2ZWxvcGVyLyR7UH0udGFyLmJ6MiINCmRpZmYgLS1naXQgYS9yZWNpcGVzL3Zk
ci92ZHJfMS43LjEwLmJiIGIvcmVjaXBlcy92ZHIvdmRyXzEuNy4xMC5iYg0KaW5kZXggYThmYTgy
Yy4uNjljYTAxMiAxMDA2NDQNCi0tLSBhL3JlY2lwZXMvdmRyL3Zkcl8xLjcuMTAuYmINCisrKyBi
L3JlY2lwZXMvdmRyL3Zkcl8xLjcuMTAuYmINCkBAIC0xLDEzICsxLDcgQEANCi1ERVNDUklQVElP
TiA9ICJWaWRlbyBEaXNrIFJlY29yZGVyIChWRFIpIGlzIGEgZGlnaXRhbCBzYXQtcmVjZWl2ZXIg
cHJvZ3JhbSB1c2luZyBMaW51eCBhbmQgRFZCIHRlY2hub2xvZ2llcy4gSXQgYWxsb3dzIG9uZSB0
byByZWNvcmQgTVBFRzIgc3RyZWFtcywgYXMgd2VsbCBhcyBvdXRwdXQgdGhlIHN0cmVhbSB0byBU
Vi4gSXQgaXMgYWxzbyBwb3NzaWJsZSB0byB3YXRjaCBEVkRzIChoYXJkd2FyZSBhY2NlbGVyYXRl
ZCkgd2l0aCBzb21lIGNvbWZvcnQgYW5kIHVzZSBhbiBJUiByZW1vdGUgY29udHJvbC4iDQotQVVU
SE9SID0gIktsYXVzIFNjaG1pZGluZ2VyIg0KLUxJQ0VOU0UgPSAiR1BMdjIiDQotSE9NRVBBR0Ug
PSAiaHR0cDovL3d3dy50dmRyLmRlIg0KK3JlcXVpcmUgdmRyLmluYw0KIFBSID0gInIyIg0KIA0K
LURFUEVORFMgPSAiZm9udGNvbmZpZyBmcmVldHlwZSBnZXR0ZXh0IGxpYmNhcCBqcGVnIHZpcnR1
YWwvbGliaW50bCINCi0NCi1TUkNfVVJJID0gImZ0cDovL2Z0cC50dmRyLmRlL3Zkci9EZXZlbG9w
ZXIvJHtQfS50YXIuYnoyIFwNCi0gICAgICAgICAgIGZpbGU6Ly9maXhwYXRocy5wYXRjaDtwYXRj
aD0xIFwNCitTUkNfVVJJICs9ICIgZmlsZTovL2ZpeHBhdGhzLnBhdGNoO3BhdGNoPTEgXA0KICAg
ICAgICAgICAgZmlsZTovL2NwbHVzcGx1cy5wYXRjaDtwYXRjaD0xIFwNCiAgICAgICAgICAgIGZp
bGU6Ly9kaXNhYmxlX3BsdWdpbi5wYXRjaDtwYXRjaD0xIFwNCiAgICAgICAgICAgIGZpbGU6Ly9s
aW5rZXJmbGFncy5wYXRjaDtwYXRjaD0xIFwNCkBAIC0yNyw3ICsyMSw3IEBAIGRvX2luc3RhbGwg
KCkgew0KICAgICAgICAgICAgICAgICAgJ1ZJREVPRElSPS92YXIvbGliL3Zkci92aWRlbycgXA0K
ICAgICAgICAgICAgICAgICAgJ1BMVUdJTkxJQkRJUj0ke1BMVUdJTkRJUn0nIFwNCiAgICAgICAg
ICAgICAgICAgICdMT0NESVI9JHtkYXRhZGlyfS9sb2NhbGUnIFwNCi0gICAgICAgICAgICAgICAg
IGluc3RhbGwgDQorICAgICAgICAgICAgICAgICBpbnN0YWxsDQogfQ0KIA0KIFBBQ0tBR0VTX0RZ
TkFNSUMgKz0gInZkci1wbHVnaW4tKiINCkBAIC0zOSw0ICszMywzIEBAIHB5dGhvbiBwb3B1bGF0
ZV9wYWNrYWdlc19wcmVwZW5kICgpIHsNCiANCiBGSUxFU18ke1BOfSA9ICIke2JpbmRpcn0vKiAv
dmFyL2xpYi92ZHIvY29uZi8qICR7c3lzY29uZmRpcn0vKiINCiBGSUxFU18ke1BOfS1kYmcgKz0g
IiR7UExVR0lORElSfS8uZGVidWcvKiINCi0NCi0tIA0KMS42LjUuNw0KDQo=

--=-OnNzpjVUf8RmOFuydYgo--

--=-//o/hbfwKoi5FFVFbNfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktIkqYACgkQPX1aK2wOHVgcnwCfaoSmJHi2Ca+pzYdlyAcSP6To
RPEAn22wxkluLctuDLrZKy74WlWg9Tu0
=Crxh
-----END PGP SIGNATURE-----

--=-//o/hbfwKoi5FFVFbNfe--
