Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jlaine@waffle.bolloretelecom.eu>) id 1LpcAk-0006GR-8X
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 07:42:37 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 576995FF20;
	Fri,  3 Apr 2009 07:40:03 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 800BA5FF2F;
	Fri,  3 Apr 2009 07:40:01 +0200 (CEST)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 459EA5FF20;
	Fri,  3 Apr 2009 07:40:01 +0200 (CEST)
Received: from blini.bolloretelecom.eu (localhost [127.0.0.1])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id F1AD523E1D;
	Fri,  3 Apr 2009 07:40:00 +0200 (CEST)
Received: from blini.bolloretelecom.eu (localhost [127.0.0.1])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 4EA2423E36;
	Fri,  3 Apr 2009 07:39:58 +0200 (CEST)
Received: from waffle.bolloretelecom.eu (waffle.bolloretelecom.eu
	[192.168.95.233])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 24FE123E1D;
	Fri,  3 Apr 2009 07:39:58 +0200 (CEST)
Received: by waffle.bolloretelecom.eu (Postfix, from userid 10000)
	id 32F10FFDE; Fri,  3 Apr 2009 07:39:54 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Apr 2009 07:39:54 +0200
Message-Id: <1238737194-32521-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jlaine@waffle.bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] qt4-tools-native: set LFLAGS to pick up zlib from staging
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
X-List-Received-Date: Fri, 03 Apr 2009 05:42:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/qt4/files/configure-lflags.patch |   13 +++++++++++++
 recipes/qt4/qt4-tools-native.inc         |    3 ++-
 recipes/qt4/qt4-tools-native_4.4.3.bb    |    2 +-
 recipes/qt4/qt4-tools-native_4.5.0.bb    |    2 +-
 4 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 recipes/qt4/files/configure-lflags.patch

diff --git a/recipes/qt4/files/configure-lflags.patch b/recipes/qt4/files=
/configure-lflags.patch
new file mode 100644
index 0000000..df19549
--- /dev/null
+++ b/recipes/qt4/files/configure-lflags.patch
@@ -0,0 +1,13 @@
+Index: qtopia-core-opensource-src-4.3.3/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14 08:53:51.=
000000000 +0000
++++ qtopia-core-opensource-src-4.3.3/configure	2008-01-14 08:54:07.00000=
0000 +0000
+@@ -447,7 +447,7 @@
+ # initalize variables
+ #----------------------------------------------------------------------=
---------
+=20
+-SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS"
++SYSTEM_VARIABLES=3D"CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
+ for varname in $SYSTEM_VARIABLES; do
+     cmd=3D`echo \
+ 'if [ -n "\$'${varname}'" ]; then
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-nat=
ive.inc
index fe2f94a..df5afd3 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -8,6 +8,7 @@ LICENSE =3D "GPL"
 inherit native
=20
 SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensou=
rce-src-${PV}.tar.bz2 \
+           file://configure-lflags.patch;patch=3D1 \
            file://qt-config.patch;patch=3D1 \
            file://g++.conf \
            file://linux.conf"
@@ -29,7 +30,7 @@ EXTRA_OECONF =3D "-prefix ${prefix} \
 EXTRA_OEMAKE =3D " "
=20
 do_configure() {
-    echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qt failed=
. EXTRA_OECONF was ${EXTRA_OECONF}"
+    echo yes | LFLAGS=3D"-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA=
_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
=20
 TOBUILD =3D "\
diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tool=
s-native_4.4.3.bb
index 8a8d46f..ef86db4 100644
--- a/recipes/qt4/qt4-tools-native_4.4.3.bb
+++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
@@ -1,2 +1,2 @@
 require qt4-tools-native.inc
-PR =3D "r2"
+PR =3D "r3"
diff --git a/recipes/qt4/qt4-tools-native_4.5.0.bb b/recipes/qt4/qt4-tool=
s-native_4.5.0.bb
index 6e5474b..ab63314 100644
--- a/recipes/qt4/qt4-tools-native_4.5.0.bb
+++ b/recipes/qt4/qt4-tools-native_4.5.0.bb
@@ -1,5 +1,5 @@
 require qt4-tools-native.inc
-PR =3D "r0"
+PR =3D "r1"
=20
 DEFAULT_PREFERENCE =3D "-1"
 TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
--=20
1.5.6.5


