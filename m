Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0sVQ-0007on-FU
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:03:48 +0200
Received: by qyk9 with SMTP id 9so3717167qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=5+H+vFKKTdCYvcfuVZLtGixhZzmTmq1GPwi+xixSNqM=;
	b=n/EQbMuz3YoSO7pu0DTQuR6aTJ+CzBfnu0A1YfYF1wdf5LfWSGB11T8pyZeHmgF7KZ
	jjb7YS5sjdoCaWr0ru62auDlKOgDC+1Jm1paeiXFDO8n3r06EBqasLuh+BFqPl7qcftU
	XQhH+U6skF+8u33i4oW8baCmRtRATC4eZLf4Y=
Received: by 10.229.67.95 with SMTP id q31mr1615082qci.228.1315303124262; Tue,
	06 Sep 2011 02:58:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Tue, 6 Sep 2011 02:58:24 -0700 (PDT)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 6 Sep 2011 11:58:24 +0200
Message-ID: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:03:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
---
 recipes/binutils/binutils-cross-sdk_2.21.1.bb |    2 ++
 recipes/binutils/binutils-cross-sdk_2.21.bb   |    2 --
 recipes/binutils/binutils-cross_2.21.1.bb     |    2 ++
 recipes/binutils/binutils-cross_2.21.bb       |    2 --
 recipes/binutils/binutils_2.21.1.bb           |   21 +++++++++++++++++++++
 recipes/binutils/binutils_2.21.bb             |   21 ---------------------
 6 files changed, 25 insertions(+), 25 deletions(-)
 create mode 100644 recipes/binutils/binutils-cross-sdk_2.21.1.bb
 delete mode 100644 recipes/binutils/binutils-cross-sdk_2.21.bb
 create mode 100644 recipes/binutils/binutils-cross_2.21.1.bb
 delete mode 100644 recipes/binutils/binutils-cross_2.21.bb
 create mode 100644 recipes/binutils/binutils_2.21.1.bb
 delete mode 100644 recipes/binutils/binutils_2.21.bb

diff --git a/recipes/binutils/binutils-cross-sdk_2.21.1.bbb/recipes/binutil=
s/
binutils-cross-sdk_2.21.1.bb
new file mode 100644
index 0000000..f509566
--- /dev/null
+++ b/recipes/binutils/binutils-cross-sdk_2.21.1.bb
@@ -0,0 +1,2 @@
+require binutils_${PV}.bb
+require binutils-cross-sdk.inc
diff --git a/recipes/binutils/binutils-cross-sdk_2.21.bb b/recipes/binutils=
/
binutils-cross-sdk_2.21.bb
deleted file mode 100644
index f509566..0000000
--- a/recipes/binutils/binutils-cross-sdk_2.21.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require binutils_${PV}.bb
-require binutils-cross-sdk.inc
diff --git a/recipes/binutils/binutils-cross_2.21.1.bb b/recipes/binutils/
binutils-cross_2.21.1.bb
new file mode 100644
index 0000000..01d99db
--- /dev/null
+++ b/recipes/binutils/binutils-cross_2.21.1.bb
@@ -0,0 +1,2 @@
+require binutils_${PV}.bb
+require binutils-cross.inc
diff --git a/recipes/binutils/binutils-cross_2.21.bb b/recipes/binutils/
binutils-cross_2.21.bb
deleted file mode 100644
index 01d99db..0000000
--- a/recipes/binutils/binutils-cross_2.21.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require binutils_${PV}.bb
-require binutils-cross.inc
diff --git a/recipes/binutils/binutils_2.21.1.bb b/recipes/binutils/
binutils_2.21.1.bb
new file mode 100644
index 0000000..88c33d1
--- /dev/null
+++ b/recipes/binutils/binutils_2.21.1.bb
@@ -0,0 +1,21 @@
+require binutils.inc
+PR =3D "${INC_PR}.3"
+LICENSE =3D "GPLv3"
+
+SRC_URI =3D "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
+     file://binutils-uclibc-100-uclibc-conf.patch \
+     file://110-arm-eabi-conf.patch \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
+     file://binutils-uclibc-300-006_better_file_error.patch \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
+     file://binutils-uclibc-gas-needs-libm.patch \
+     file://fix-clone-conflicts.patch \
+
${@['','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSRO=
OT',
d, 1) =3D=3D 'yes']} \
+     file://binutils-2.19.1-ld-sysroot.patch \
+     "
+SRC_URI[md5sum] =3D "bde820eac53fa3a8d8696667418557ad"
+SRC_URI[sha256sum] =3D
"cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"
+
+FILES_${PN}-symlinks +=3D "${bindir}/elfedit"
+# When we enable gold this might need to be make conditional
+FILES_${PN}-symlinks +=3D "${bindir}/ld.bfd"
diff --git a/recipes/binutils/binutils_2.21.bb b/recipes/binutils/
binutils_2.21.bb
deleted file mode 100644
index df044aa..0000000
--- a/recipes/binutils/binutils_2.21.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require binutils.inc
-PR =3D "${INC_PR}.3"
-LICENSE =3D "GPLv3"
-
-SRC_URI =3D "${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://binutils-uclibc-gas-needs-libm.patch \
-     file://fix-clone-conflicts.patch \
-
${@['','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_SYSRO=
OT',
d, 1) =3D=3D 'yes']} \
-     file://binutils-2.19.1-ld-sysroot.patch \
-     "
-SRC_URI[md5sum] =3D "c84c5acc9d266f1a7044b51c85a823f5"
-SRC_URI[sha256sum] =3D
"60abec5bf448eb930a5a15acb8712612377dc8bcfb13dfd5131228f70561d0c7"
-
-FILES_${PN}-symlinks +=3D "${bindir}/elfedit"
-# When we enable gold this might need to be make conditional
-FILES_${PN}-symlinks +=3D "${bindir}/ld.bfd"
--=20
1.7.4.1

