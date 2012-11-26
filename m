Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Td3M7-0005kg-As
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 19:24:31 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 10D41A625E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 19:10:17 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 19:10:14 +0100
Message-Id: <1353953415-2602-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libdbi: import from OE-classic and update to latest 0.8.4
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
X-List-Received-Date: Mon, 26 Nov 2012 18:24:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-support/libdbi/libdbi-drivers.inc  | 51 ++++++++++++++++=
++++++
 .../libdbi/libdbi-drivers_0.8.3-1.bb               |  6 +++
 meta-oe/recipes-support/libdbi/libdbi.inc          | 17 ++++++++
 meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb     |  6 +++
 4 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-support/libdbi/libdbi-drivers.inc
 create mode 100644 meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1=
.bb
 create mode 100644 meta-oe/recipes-support/libdbi/libdbi.inc
 create mode 100644 meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb

diff --git a/meta-oe/recipes-support/libdbi/libdbi-drivers.inc b/meta-oe/=
recipes-support/libdbi/libdbi-drivers.inc
new file mode 100644
index 0000000..b509532
--- /dev/null
+++ b/meta-oe/recipes-support/libdbi/libdbi-drivers.inc
@@ -0,0 +1,51 @@
+# libdbi-drivers OE build file
+# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Re=
served
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION =3D "Database Drivers for libdbi"
+HOMEPAGE =3D "http://libdbi-drivers.sourceforge.net/"
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
+SECTION =3D "libs"
+
+PROVIDES =3D "libdbd-sqlite"
+DEPENDS =3D "libdbi sqlite sqlite3 mysql5 postgresql"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/libdbi-drivers/libdbi-drivers-${PV}.t=
ar.gz"
+
+inherit autotools
+
+PACKAGES +=3D "libdbd-sqlite3 libdbd-sqlite libdbd-pgsql libdbd-mysql"
+
+EXTRA_OECONF =3D "--with-dbi-incdir=3D${STAGING_INCDIR} \
+                --with-dbi-libdir=3D${STAGING_LIBDIR} \
+                --with-sqlite \
+                --with-sqlite3 \
+                --with-pgsql \
+                --with-mysql \
+                --with-sqlite-libdir=3D${STAGING_LIBDIR} \
+                --with-sqlite-incdir=3D${STAGING_INCDIR} \
+                --with-sqlite3-incdir=3D${STAGING_INCDIR} \
+                --with-sqlite3-libdir=3D${STAGING_LIBDIR} \
+                --with-mysql-incdir=3D${STAGING_INCDIR} \
+                --with-mysql-libdir=3D${STAGING_LIBDIR} \
+                --with-pgsql-incdir=3D${STAGING_INCDIR} \
+                --with-pgsql-libdir=3D${STAGING_LIBDIR} \
+                --disable-docs"
+
+FILES_${PN}-dbg +=3D " ${libdir}/dbd/.debug/*.so"
+FILES_${PN}-dev +=3D " ${libdir}/dbd/*.la"
+FILES_${PN}-staticdev +=3D " ${libdir}/dbd/*.a"
+
+DESCRIPTION_libdbd-sqlite =3D "SQLite database driver for libdbi"
+FILES_libdbd-sqlite =3D "${libdir}/dbd/libdbdsqlite.so"
+
+DESCRIPTION_libdbd-sqlite3 =3D  "SQLite3 database driver for libdbi"
+FILES_libdbd-sqlite3 =3D "${libdir}/dbd/libdbdsqlite3.so"
+
+DESCRIPTION_libdbd-mysql =3D "MySQL4 database driver for libdbi"
+FILES_libdbd-mysql =3D "${libdir}/dbd/libdbdmysql.so"
+
+DESCRIPTION_libdbd-psql =3D "Postgres SQL database driver for libdbi"
+FILES_libdbd-pgsql =3D "${libdir}/dbd/libdbdpgsql.so"
+
diff --git a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb b/m=
eta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
new file mode 100644
index 0000000..97bc3ea
--- /dev/null
+++ b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
@@ -0,0 +1,6 @@
+require ${PN}.inc
+
+PR =3D "r0"
+
+SRC_URI[md5sum] =3D "4de79b323162a5a7652b65b608eca6cd"
+SRC_URI[sha256sum] =3D "4ab9944398ce769c0deeb64d2f73555c67bc25ccd2ade1cc=
f552226c7b2acf72"
diff --git a/meta-oe/recipes-support/libdbi/libdbi.inc b/meta-oe/recipes-=
support/libdbi/libdbi.inc
new file mode 100644
index 0000000..cea2838
--- /dev/null
+++ b/meta-oe/recipes-support/libdbi/libdbi.inc
@@ -0,0 +1,17 @@
+# libdbi OE build file
+# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Re=
served
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION =3D "Database Independent Abstraction Layer for C"
+HOMEPAGE =3D "http://libdbi.sourceforge.net/"
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
+SECTION =3D "libs"
+
+INC_PR =3D "r0"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/libdbi/libdbi-${PV}.tar.gz"
+
+inherit autotools
+
+EXTRA_OECONF =3D "--disable-docs"
diff --git a/meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb b/meta-oe/rec=
ipes-support/libdbi/libdbi_0.8.4.bb
new file mode 100644
index 0000000..aee0099
--- /dev/null
+++ b/meta-oe/recipes-support/libdbi/libdbi_0.8.4.bb
@@ -0,0 +1,6 @@
+require ${PN}.inc
+
+PR =3D "${INC_PR}.0"
+
+SRC_URI[md5sum] =3D "c5f15407ef7b07ba854cd8c9b15b88ff"
+SRC_URI[sha256sum] =3D "ef38db616f0752ccb09b8ba2eac471722369b8ded50b153c=
25e238cac2c8de99"
--=20
1.7.11.7



