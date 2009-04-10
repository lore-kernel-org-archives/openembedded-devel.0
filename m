Received: from [212.27.42.3] (helo=smtp3-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1LsAot-0001gQ-4N
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 09:06:44 +0200
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 06668818089;
	Fri, 10 Apr 2009 09:03:18 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 0EDB381807F;
	Fri, 10 Apr 2009 09:03:15 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 0C60C1841EE; Fri, 10 Apr 2009 09:03:20 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Apr 2009 09:03:20 +0200
Message-Id: <1239347000-27123-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.3
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] ppp: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Fri, 10 Apr 2009 07:06:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/ppp/ppp-2.4.3/ldflags.patch |  120 +++++++++++++++++++++++++++++=
++++++
 recipes/ppp/ppp_2.4.3.bb            |    3 +-
 2 files changed, 122 insertions(+), 1 deletions(-)
 create mode 100644 recipes/ppp/ppp-2.4.3/ldflags.patch

diff --git a/recipes/ppp/ppp-2.4.3/ldflags.patch b/recipes/ppp/ppp-2.4.3/=
ldflags.patch
new file mode 100644
index 0000000..202c7f3
--- /dev/null
+++ b/recipes/ppp/ppp-2.4.3/ldflags.patch
@@ -0,0 +1,120 @@
+Index: ppp-2.4.3/chat/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/chat/Makefile.linux	2009-04-08 10:00:38.000000000 +02=
00
++++ ppp-2.4.3/chat/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
+@@ -18,7 +18,7 @@
+ all:	chat
+=20
+ chat:	chat.o
+-	$(CC) -o chat chat.o
++	$(CC) $(LDFLAGS) -o chat chat.o
+=20
+ chat.o:	chat.c
+ 	$(CC) -c $(CFLAGS) -o chat.o chat.c
+Index: ppp-2.4.3/pppd/plugins/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/pppd/plugins/Makefile.linux	2009-04-08 10:00:38.00000=
0000 +0200
++++ ppp-2.4.3/pppd/plugins/Makefile.linux	2009-04-08 10:03:54.000000000 =
+0200
+@@ -1,6 +1,5 @@
+ COPTS	=3D -O2 -g
+ CFLAGS	=3D $(COPTS) -I.. -I../../include -fPIC
+-LDFLAGS	=3D -shared
+ INSTALL	=3D install
+=20
+ DESTDIR =3D @DESTDIR@
+@@ -22,7 +21,7 @@
+ 	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all; done
+=20
+ %.so: %.c
+-	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^
++	$(CC) -o $@ $(LDFLAGS) -shared $(CFLAGS) $^
+=20
+ VERSION =3D $(shell awk -F '"' '/VERSION/ { print $$2; }' ../patchlevel=
.h)
+=20
+Index: ppp-2.4.3/pppd/plugins/pppoatm/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/pppd/plugins/pppoatm/Makefile.linux	2009-04-08 10:00:=
38.000000000 +0200
++++ ppp-2.4.3/pppd/plugins/pppoatm/Makefile.linux	2009-04-08 10:03:15.00=
0000000 +0200
+@@ -1,6 +1,5 @@
+ COPTS	=3D -O2 -g
+ CFLAGS	=3D $(COPTS) -I../.. -I../../../include -fPIC
+-LDFLAGS	=3D -shared
+ INSTALL	=3D install
+=20
+ #**********************************************************************=
*
+@@ -32,7 +31,7 @@
+ all: $(PLUGIN)
+=20
+ $(PLUGIN): $(PLUGIN_OBJS)
+-	$(CC) $(CFLAGS) -o $@ -shared $^ $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ -shared $^ $(LIBS)
+=20
+ install: all
+ 	$(INSTALL) -d -m 755 $(LIBDIR)
+Index: ppp-2.4.3/pppd/plugins/radius/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/pppd/plugins/radius/Makefile.linux	2009-04-08 10:00:3=
8.000000000 +0200
++++ ppp-2.4.3/pppd/plugins/radius/Makefile.linux	2009-04-08 10:01:16.000=
000000 +0200
+@@ -43,13 +43,13 @@
+ 	$(INSTALL) -m 444 pppd-radattr.8 $(MANDIR)
+=20
+ radius.so: radius.o libradiusclient.a
+-	$(CC) -o radius.so -shared radius.o libradiusclient.a
++	$(CC) $(LDFLAGS) -o radius.so -shared radius.o libradiusclient.a
+=20
+ radattr.so: radattr.o
+-	$(CC) -o radattr.so -shared radattr.o
++	$(CC) $(LDFLAGS) -o radattr.so -shared radattr.o
+=20
+ radrealms.so: radrealms.o
+-	$(CC) -o radrealms.so -shared radrealms.o
++	$(CC) $(LDFLAGS) -o radrealms.so -shared radrealms.o
+=20
+ CLIENTOBJS =3D avpair.o buildreq.o config.o dict.o ip_util.o \
+ 	clientid.o sendserver.o lock.o util.o md5.o
+Index: ppp-2.4.3/pppd/plugins/rp-pppoe/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/pppd/plugins/rp-pppoe/Makefile.linux	2009-04-08 10:00=
:38.000000000 +0200
++++ ppp-2.4.3/pppd/plugins/rp-pppoe/Makefile.linux	2009-04-08 10:01:16.0=
00000000 +0200
+@@ -29,13 +29,13 @@
+ all: rp-pppoe.so pppoe-discovery
+=20
+ pppoe-discovery: libplugin.a pppoe-discovery.o
+-	$(CC) -o pppoe-discovery pppoe-discovery.o libplugin.a
++	$(CC) $(LDFLAGS) -o pppoe-discovery pppoe-discovery.o libplugin.a
+=20
+ pppoe-discovery.o: pppoe-discovery.c
+ 	$(CC) $(CFLAGS) '-DVERSION=3D"$(VERSION)"' -c -o pppoe-discovery.o ppp=
oe-discovery.c
+=20
+ rp-pppoe.so: libplugin.a plugin.o
+-	$(CC) -o rp-pppoe.so -shared plugin.o libplugin.a
++	$(CC) $(LDFLAGS) -o rp-pppoe.so -shared plugin.o libplugin.a
+=20
+ install: all
+ 	$(INSTALL) -d -m 755 $(LIBDIR)
+Index: ppp-2.4.3/pppdump/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/pppdump/Makefile.linux	2009-04-08 10:00:38.000000000 =
+0200
++++ ppp-2.4.3/pppdump/Makefile.linux	2009-04-08 10:01:16.000000000 +0200
+@@ -10,7 +10,7 @@
+ all:	pppdump
+=20
+ pppdump: $(OBJS)
+-	$(CC) -o pppdump $(OBJS)
++	$(CC) $(LDFLAGS) -o pppdump $(OBJS)
+=20
+ clean:
+ 	rm -f pppdump $(OBJS) *~
+Index: ppp-2.4.3/pppstats/Makefile.linux
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- ppp-2.4.3.orig/pppstats/Makefile.linux	2009-04-08 10:00:38.000000000=
 +0200
++++ ppp-2.4.3/pppstats/Makefile.linux	2009-04-08 10:01:16.000000000 +020=
0
+@@ -26,7 +26,7 @@
+ 	$(INSTALL) -c -m 444 pppstats.8 $(MANDIR)
+=20
+ pppstats: $(PPPSTATSRCS)
+-	$(CC) $(CFLAGS) -o pppstats pppstats.c $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o pppstats pppstats.c $(LIBS)
+=20
+ clean:
+ 	rm -f pppstats *~ #* core
diff --git a/recipes/ppp/ppp_2.4.3.bb b/recipes/ppp/ppp_2.4.3.bb
index f09dcac..295a3fb 100644
--- a/recipes/ppp/ppp_2.4.3.bb
+++ b/recipes/ppp/ppp_2.4.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Point-to-Point Protocol (PPP) daemon"
 HOMEPAGE =3D "http://samba.org/ppp/"
 DEPENDS =3D "libpcap"
 LICENSE =3D "BSD GPLv2"
-PR =3D "r4"
+PR =3D "r5"
=20
 SRC_URI =3D "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
         file://ppp-2.4.3-mppe-mppc-1.1.patch;patch=3D1 \
@@ -14,6 +14,7 @@ SRC_URI =3D "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar=
.gz \
 	file://pppoatm-makefile.patch;patch=3D1 \
 	file://enable-ipv6.patch;patch=3D1 \
 	file://makefile-remove-hard-usr-reference.patch;patch=3D1 \
+	file://ldflags.patch;patch=3D1 \
 	file://pon \
 	file://poff \
 	file://init \
--=20
1.6.2.1



