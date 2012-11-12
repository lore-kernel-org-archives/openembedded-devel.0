Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TXxf5-00019F-Tk
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 18:19:04 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 7783A77C4C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 17:57:17 +0100 (CET)
Received: from eb-e6520.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 260474B01C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 17:57:12 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 17:57:11 +0100
Message-Id: <1352739431-26121-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mercurial-native: fix install
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
X-List-Received-Date: Mon, 12 Nov 2012 17:19:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

else host python is used leading to the following error if the host doesn=
't
have the python headers installed :
| Python headers are required to build Mercurial
| make: *** [build] Error 1

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../mercurial/mercurial-native_1.9.bb              |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb b=
/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
index facf554..41b29fb 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial-native_1.9.bb
@@ -4,7 +4,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
 DEPENDS =3D "python-native"
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz=
"
 SRC_URI[md5sum] =3D "d4842129fa2732eb6ed1180467bc32e2"
@@ -17,6 +17,10 @@ inherit native
 EXTRA_OEMAKE =3D "STAGING_LIBDIR=3D${STAGING_LIBDIR} STAGING_INCDIR=3D${=
STAGING_INCDIR} \
         BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} PREFIX=3D${prefi=
x}"
=20
+do_configure_append () {
+        sed -i -e 's:PYTHON=3Dpython:PYTHON=3D${STAGING_BINDIR_NATIVE}/p=
ython-native/python:g' ${S}/Makefile
+}
+
 do_install () {
         oe_runmake -e install-bin DESTDIR=3D${D} PREFIX=3D${prefix}
 }
--=20
1.7.7.6



