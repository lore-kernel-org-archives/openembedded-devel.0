Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpNQ0-0008AT-8G
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 15:57:36 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id B843F189361; Thu,  2 Apr 2009 15:57:25 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 15:57:25 +0200
Message-Id: <1238680645-11567-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	=?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] openssl-0.9.8j: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 13:57:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/openssl/openssl-0.9.8j/oe-ldflags.patch |   21 +++++++++++++++++=
++++
 recipes/openssl/openssl_0.9.8j.bb               |    7 +++++--
 2 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 recipes/openssl/openssl-0.9.8j/oe-ldflags.patch

diff --git a/recipes/openssl/openssl-0.9.8j/oe-ldflags.patch b/recipes/op=
enssl/openssl-0.9.8j/oe-ldflags.patch
new file mode 100644
index 0000000..3a2fae6
--- /dev/null
+++ b/recipes/openssl/openssl-0.9.8j/oe-ldflags.patch
@@ -0,0 +1,21 @@
+diff -urN openssl-0.9.8j.orig/Makefile.shared openssl-0.9.8j/Makefile.sh=
ared
+--- openssl-0.9.8j.orig/Makefile.shared	2008-09-17 15:56:40.000000000 +0=
000
++++ openssl-0.9.8j/Makefile.shared	2009-04-02 13:44:48.000000000 +0000
+@@ -90,7 +90,7 @@
+ LINK_APP=3D	\
+   ( $(SET_X);   \
+     LIBDEPS=3D"$${LIBDEPS:-$(LIBDEPS)}"; \
+-    LDCMD=3D"$${LDCMD:-$(CC)}"; LDFLAGS=3D"$${LDFLAGS:-$(CFLAGS)}"; \
++    LDCMD=3D"$${LDCMD:-$(CC)}"; LDFLAGS=3D"$(OE_LDFLAGS) $${LDFLAGS:-$(=
CFLAGS)}"; \
+     LIBPATH=3D`for x in $$LIBDEPS; do if echo $$x | grep '^ *-L' > /dev=
/null 2>&1; then echo $$x | sed -e 's/^ *-L//'; fi; done | uniq`; \
+     LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
+     LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
+@@ -100,7 +100,7 @@
+   ( $(SET_X);   \
+     LIBDEPS=3D"$${LIBDEPS:-$(LIBDEPS)}"; \
+     SHAREDCMD=3D"$${SHAREDCMD:-$(CC)}"; \
+-    SHAREDFLAGS=3D"$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
++    SHAREDFLAGS=3D"$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDF=
LAGS)}"; \
+     LIBPATH=3D`for x in $$LIBDEPS; do if echo $$x | grep '^ *-L' > /dev=
/null 2>&1; then echo $$x | sed -e 's/^ *-L//'; fi; done | uniq`; \
+     LIBPATH=3D`echo $$LIBPATH | sed -e 's/ /:/g'`; \
+     LD_LIBRARY_PATH=3D$$LIBPATH:$$LD_LIBRARY_PATH \
diff --git a/recipes/openssl/openssl_0.9.8j.bb b/recipes/openssl/openssl_=
0.9.8j.bb
index d40fb48..21450d2 100644
--- a/recipes/openssl/openssl_0.9.8j.bb
+++ b/recipes/openssl/openssl_0.9.8j.bb
@@ -2,10 +2,13 @@ inherit pkgconfig
=20
 require openssl.inc
=20
-PR =3D "r1"
+PR =3D "r2"
+
+export OE_LDFLAGS=3D"${LDFLAGS}"
=20
 SRC_URI +=3D "file://configure-targets.patch;patch=3D1 \
             file://shared-libs.patch;patch=3D1 \
-            file://debian.patch;patch=3D1"
+            file://debian.patch;patch=3D1 \
+            file://oe-ldflags.patch;patch=3D1"
=20
 PARALLEL_MAKE =3D ""
--=20
1.5.6.5



