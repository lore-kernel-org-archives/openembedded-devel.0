Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqnq1-0005oc-ON
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 14:22:09 +0200
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 80352D481AE;
	Mon,  6 Apr 2009 14:19:12 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 9A325D480A3;
	Mon,  6 Apr 2009 14:19:10 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 03D0A1840D9; Mon,  6 Apr 2009 14:19:13 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 14:19:13 +0200
Message-Id: <1239020353-6991-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] pth: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 12:22:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/pth/files/ldflags.patch |   16 ++++++++++++++++
 recipes/pth/pth_2.0.2.bb        |    3 ++-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 recipes/pth/files/ldflags.patch

diff --git a/recipes/pth/files/ldflags.patch b/recipes/pth/files/ldflags.=
patch
new file mode 100644
index 0000000..9537ca8
--- /dev/null
+++ b/recipes/pth/files/ldflags.patch
@@ -0,0 +1,16 @@
+diff -urN pth-2.0.2.orig/Makefile.in pth-2.0.2/Makefile.in
+--- pth-2.0.2.orig/Makefile.in	2004-07-13 10:48:10.000000000 +0000
++++ pth-2.0.2/Makefile.in	2009-04-06 12:12:37.000000000 +0000
+@@ -168,10 +168,10 @@
+=20
+ #   build the static and possibly shared libraries
+ libpth.la: $(LOBJS)
+-	$(LIBTOOL) --mode=3Dlink --quiet $(CC) -o libpth.la $(LOBJS) \
++	$(LIBTOOL) --mode=3Dlink --quiet $(CC) $(LDFLAGS) -o libpth.la $(LOBJS=
) \
+ 	-rpath $(libdir) -version-info `$(SHTOOL) version -lc -dlibtool $(_VER=
SION_FILE)`
+ libpthread.la: pthread.lo $(LOBJS)
+-	$(LIBTOOL) --mode=3Dlink --quiet $(CC) -o libpthread.la pthread.lo $(L=
OBJS) \
++	$(LIBTOOL) --mode=3Dlink --quiet $(CC) $(LDFLAGS) -o libpthread.la pth=
read.lo $(LOBJS) \
+ 	-rpath $(libdir) -version-info `$(SHTOOL) version -lc -dlibtool $(_VER=
SION_FILE)`
+=20
+ #   build the manual pages
diff --git a/recipes/pth/pth_2.0.2.bb b/recipes/pth/pth_2.0.2.bb
index 81b8a71..2583e03 100644
--- a/recipes/pth/pth_2.0.2.bb
+++ b/recipes/pth/pth_2.0.2.bb
@@ -2,10 +2,11 @@ DESCRIPTION =3D "GNU Portable Threads"
 SECTION =3D "libs"
 PRIORITY =3D "optional"
 LICENSE =3D "GPL LGPL FDL"
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
 	   file://m4-warning.patch;patch=3D1 \
+	   file://ldflags.patch;patch=3D1 \
 	  "
=20
 PARALLEL_MAKE=3D""
--=20
1.6.2.1



