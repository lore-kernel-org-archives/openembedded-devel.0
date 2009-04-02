Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LpMV1-0001M0-L4
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 14:58:38 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 8D3DB189385; Thu,  2 Apr 2009 14:58:03 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Apr 2009 14:58:03 +0200
Message-Id: <1238677083-17024-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>,
	=?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] bzip2: add patch to use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Thu, 02 Apr 2009 12:58:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/bzip2/bzip2-1.0.2/ldflags.patch |   14 ++++++++++++++
 recipes/bzip2/bzip2_1.0.2.bb            |    5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 recipes/bzip2/bzip2-1.0.2/ldflags.patch

diff --git a/recipes/bzip2/bzip2-1.0.2/ldflags.patch b/recipes/bzip2/bzip=
2-1.0.2/ldflags.patch
new file mode 100644
index 0000000..c7da5bc
--- /dev/null
+++ b/recipes/bzip2/bzip2-1.0.2/ldflags.patch
@@ -0,0 +1,14 @@
+diff -urN bzip2-1.0.2.orig/Makefile-libbz2_so bzip2-1.0.2/Makefile-libbz=
2_so
+--- bzip2-1.0.2.orig/Makefile-libbz2_so	2001-12-30 02:15:59.000000000 +0=
000
++++ bzip2-1.0.2/Makefile-libbz2_so	2009-04-02 12:42:43.000000000 +0000
+@@ -20,8 +20,8 @@
+       bzlib.o
+=20
+ all: $(OBJS)
+-	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.2 $(OBJS)
+-	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.2
++	$(CC) $(LDFLAGS) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.=
0.2 $(OBJS)
++	$(CC) $(CFLAGS) $(LDFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.2
+ 	rm -f libbz2.so.1.0
+ 	ln -s libbz2.so.1.0.2 libbz2.so.1.0
+=20
diff --git a/recipes/bzip2/bzip2_1.0.2.bb b/recipes/bzip2/bzip2_1.0.2.bb
index 1e1cb8e..9e8cb20 100644
--- a/recipes/bzip2/bzip2_1.0.2.bb
+++ b/recipes/bzip2/bzip2_1.0.2.bb
@@ -1,10 +1,11 @@
 DESCRIPTION =3D "Very high-quality data compression program."
 SECTION =3D "console/utils"
-PR =3D "r1"
+PR =3D "r2"
=20
 LICENSE =3D "bzip2"
 SRC_URI =3D "ftp://sources.redhat.com/pub/bzip2/v102/bzip2-${PV}.tar.gz =
\
-	   file://installpaths.patch;patch=3D1"
+	   file://installpaths.patch;patch=3D1 \
+	   file://ldflags.patch;patch=3D1"
=20
 CFLAGS_append =3D " -fPIC -fpic -Winline -fno-strength-reduce -D_FILE_OF=
FSET_BITS=3D64"
=20
--=20
1.5.6.5



