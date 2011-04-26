Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEfkd-0004yO-Gh
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 12:44:23 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QAfaes029386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 26 Apr 2011 12:41:37 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 12:41:36 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 12:41:34 +0200
Message-Id: <1303814494-9623-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.cvg.de id
	p3QAfaes029386
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>,
	=?UTF-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [PATCH] tcp-wrappers: place LIBS after object files
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
X-List-Received-Date: Tue, 26 Apr 2011 10:44:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

This fixes builds with '-Wl,-as-needed'. Patch changes the previous
'ldflags.patch' files instead of adding a new one.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 .../tcp-wrappers/tcp-wrappers-7.6/ldflags.patch    |   22 ++++++++++++++=
+----
 1 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch b/recipe=
s/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
index 2e89765..cac8615 100644
--- a/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
+++ b/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
@@ -1,13 +1,25 @@
-Index: tcp_wrappers_7.6.orig/Makefile
+Index: tcp_wrappers_7.6/Makefile
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- tcp_wrappers_7.6.orig.orig/Makefile	2009-04-06 10:55:47.000000000 +0=
000
-+++ tcp_wrappers_7.6.orig/Makefile	2009-04-06 10:57:04.000000000 +0000
-@@ -748,31 +748,31 @@
+--- tcp_wrappers_7.6.orig/Makefile
++++ tcp_wrappers_7.6/Makefile
+@@ -724,9 +724,9 @@ SHLIBSOMAJ	=3D shared/libwrap.so.$(SOMAJOR
+ SHLIBSO		=3D shared/libwrap.so
+ SHLIBFLAGS	=3D -Lshared -lwrap
+=20
+-SHLINKFLAGS =3D -shared -Xlinker -soname -Xlinker libwrap.so.$(SOMAJOR)=
 -lc $(LIBS)
++SHLINKFLAGS =3D -shared -Xlinker -soname -Xlinker libwrap.so.$(SOMAJOR)
+ SHCFLAGS =3D -fPIC -shared -D_REENTRANT
+-SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ));
++SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ))
+=20
+ all other: config-check tcpd tcpdmatch try-from safe_finger tcpdchk $(L=
IB)
+=20
+@@ -748,31 +748,31 @@ $(LIB):	$(LIB_OBJ)
 =20
  $(SHLIB): $(SHLIB_OBJ)
  	rm -f $(SHLIB)
 -	$(CC) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
-+	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
++	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ) $(LIBS)
  	ln -sf $(notdir $(SHLIB)) $(SHLIBSOMAJ)
  	ln -sf $(notdir $(SHLIBSOMAJ)) $(SHLIBSO)
 =20
--=20
1.7.4.4



