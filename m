Received: from [212.27.42.3] (helo=smtp3-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1LqmvJ-0007h8-OD
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 13:23:32 +0200
Received: from smtp3-g21.free.fr (localhost [127.0.0.1])
	by smtp3-g21.free.fr (Postfix) with ESMTP id B9F0881805D;
	Mon,  6 Apr 2009 13:20:37 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C9C3F81806D;
	Mon,  6 Apr 2009 13:20:34 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 120B61840D9; Mon,  6 Apr 2009 13:20:36 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 13:20:36 +0200
Message-Id: <1239016836-30285-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.3
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] tcp-wrappers: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 11:23:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags |   43 +++++++++++++++++++=
++++++
 recipes/tcp-wrappers/tcp-wrappers_7.6.bb      |    3 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags

diff --git a/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags b/recipes/tcp-=
wrappers/tcp-wrappers-7.6/ldflags
new file mode 100644
index 0000000..2e89765
--- /dev/null
+++ b/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags
@@ -0,0 +1,43 @@
+Index: tcp_wrappers_7.6.orig/Makefile
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- tcp_wrappers_7.6.orig.orig/Makefile	2009-04-06 10:55:47.000000000 +0=
000
++++ tcp_wrappers_7.6.orig/Makefile	2009-04-06 10:57:04.000000000 +0000
+@@ -748,31 +748,31 @@
+=20
+ $(SHLIB): $(SHLIB_OBJ)
+ 	rm -f $(SHLIB)
+-	$(CC) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
++	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
+ 	ln -sf $(notdir $(SHLIB)) $(SHLIBSOMAJ)
+ 	ln -sf $(notdir $(SHLIBSOMAJ)) $(SHLIBSO)
+=20
+ tcpd:	tcpd.o $(SHLIB)
+-	$(CC) $(CFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ tcpd.o $(SHLIBFLAGS)
+=20
+ miscd:	miscd.o $(LIB)
+-	$(CC) $(CFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ miscd.o $(LIB) $(LIBS)
+=20
+ safe_finger: safe_finger.o $(SHLIB)
+-	$(CC) $(CFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ safe_finger.o $(SHLIBFLAGS)
+=20
+ TCPDMATCH_OBJ =3D tcpdmatch.o fakelog.o inetcf.o scaffold.o
+=20
+ tcpdmatch: $(TCPDMATCH_OBJ) $(SHLIB)
+-	$(CC) $(CFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TCPDMATCH_OBJ) $(SHLIBFLAGS)
+=20
+ try-from: try-from.o fakelog.o $(SHLIB)
+-	$(CC) $(CFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ try-from.o fakelog.o $(SHLIBFLAGS)
+=20
+ TCPDCHK_OBJ =3D tcpdchk.o fakelog.o inetcf.o scaffold.o
+=20
+ tcpdchk: $(TCPDCHK_OBJ) $(SHLIB)
+-	$(CC) $(CFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(TCPDCHK_OBJ) $(SHLIBFLAGS)
+=20
+ shar:	$(KIT)
+ 	@shar $(KIT)
diff --git a/recipes/tcp-wrappers/tcp-wrappers_7.6.bb b/recipes/tcp-wrapp=
ers/tcp-wrappers_7.6.bb
index a047c55..1f1afc1 100644
--- a/recipes/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/recipes/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Tools for monitoring and filtering incom=
ing requests for tcp \
 LICENSE =3D "tcp-wrappers"
 PRIORITY =3D "optional"
 SECTION =3D "console/network"
-PR =3D"r2"
+PR =3D"r3"
=20
=20
 PACKAGES =3D "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp=
-wrappers-doc"
@@ -35,6 +35,7 @@ SRC_URI =3D "ftp://ftp.porcupine.org/pub/security/tcp_w=
rappers_${PV}.tar.gz \
            file://siglongjmp;patch=3D1 \
            file://size_t;patch=3D1 \
            file://tcpdchk_libwrapped;patch=3D1 \
+           file://ldflags;patch=3D1 \
            \
            file://try-from.8 \
            file://safe_finger.8"
--=20
1.6.2.1



