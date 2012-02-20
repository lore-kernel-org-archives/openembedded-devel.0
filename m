Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RzODB-0006uU-Tk
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 09:03:06 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 59F23A627C;
	Mon, 20 Feb 2012 08:54:46 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2012 08:54:29 +0100
Message-Id: <1329724469-2002-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1329724469-2002-1-git-send-email-eric@eukrea.com>
References: <1329724469-2002-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe 2/2] lzip: add new recipe
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
X-List-Received-Date: Mon, 20 Feb 2012 08:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- this recipe is imported from oe-classic and upgrade to latest
stable version
- it was only compile tested

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-support/lzip/lzip_1.12.bb |   36 +++++++++++++++++++++++=
++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/lzip/lzip_1.12.bb

diff --git a/meta-oe/recipes-support/lzip/lzip_1.12.bb b/meta-oe/recipes-=
support/lzip/lzip_1.12.bb
new file mode 100644
index 0000000..68f9d0d
--- /dev/null
+++ b/meta-oe/recipes-support/lzip/lzip_1.12.bb
@@ -0,0 +1,36 @@
+DESCRIPTION =3D "Lzip is a lossless data compressor based on the LZMA al=
gorithm"
+HOMEPAGE =3D "http://lzip.nongnu.org/lzip.html"
+SECTION =3D "console/utils"
+LICENSE =3D "GPLv3"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
+
+SRC_URI =3D "http://download.savannah.gnu.org/releases/lzip/lzip-${PV}.t=
ar.gz"
+
+SRC_URI[md5sum] =3D "69a40172db5ce896b58d862c50fcd517"
+SRC_URI[sha256sum] =3D "eabc590d02d404dc1a1cc8e2777ed398370174b68edb2204=
3c8ca0b209dfcd27"
+
+CONFIGUREOPTS =3D "\
+    '--srcdir=3D${S}' \
+    '--prefix=3D${prefix}' \
+    '--exec-prefix=3D${exec_prefix}' \
+    '--bindir=3D${bindir}' \
+    '--datadir=3D${datadir}' \
+    '--infodir=3D${infodir}' \
+    '--sysconfdir=3D${sysconfdir}' \
+    'CXX=3D${CXX}' \
+    'CPPFLAGS=3D${CPPFLAGS}' \
+    'CXXFLAGS=3D${CXXFLAGS}' \
+    'LDFLAGS=3D${LDFLAGS}' \
+"
+EXTRA_OEMAKE =3D ""
+
+B =3D "${S}/obj"
+do_configure () {
+    ${S}/configure ${CONFIGUREOPTS}
+}
+
+do_install () {
+    oe_runmake 'DESTDIR=3D${D}' install
+}
+
+BBCLASSEXTEND +=3D "native nativesdk"
--=20
1.7.7.6



