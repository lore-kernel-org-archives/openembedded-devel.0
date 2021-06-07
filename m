Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.470.1623082088686232474
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 09:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADFE9143D
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jun 2021 09:08:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 574F33F694
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jun 2021 09:08:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] zsync: add recipe
Date: Mon,  7 Jun 2021 17:08:04 +0100
Message-Id: <20210607160804.264567-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

zsync is a tool that is similar to rsync but optimised for transfering
single large files, where you have a previous version of the file locally=
.

These qualities make it an excellent choice for transfering built images
between hosts.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../zsync/zsync/out-of-tree.patch             | 37 +++++++++++++++++++
 meta-oe/recipes-extended/zsync/zsync_0.6.2.bb | 13 +++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zsync/zsync/out-of-tree.patc=
h
 create mode 100644 meta-oe/recipes-extended/zsync/zsync_0.6.2.bb

diff --git a/meta-oe/recipes-extended/zsync/zsync/out-of-tree.patch b/met=
a-oe/recipes-extended/zsync/zsync/out-of-tree.patch
new file mode 100644
index 0000000000..b96777f0c3
--- /dev/null
+++ b/meta-oe/recipes-extended/zsync/zsync/out-of-tree.patch
@@ -0,0 +1,37 @@
+Fix out-of-tree builds and rebuilds by passing the right -I to find the =
common
+header, and disabling maintainer-mode.
+
+Upstream-Status: Pending [upstream is dead]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/configure.ac b/configure.ac
+index 87b0be1..4b7c9a2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -9,7 +9,6 @@ AC_CONFIG_MACRO_DIR([autotools])
+ AC_CANONICAL_HOST
+=20
+ AM_INIT_AUTOMAKE([dist-bzip2 no-dist-gzip foreign check-news -Woverride=
 -Wobsolete -Wportability -Wsyntax -Wunsupported])
+-AM_MAINTAINER_MODE
+=20
+ dnl --- Check for programs
+ AC_PROG_CC
+diff --git a/librcksum/Makefile.am b/librcksum/Makefile.am
+index f4fce72..47754eb 100644
+--- a/librcksum/Makefile.am
++++ b/librcksum/Makefile.am
+@@ -1,4 +1,4 @@
+-
++AM_CPPFLAGS =3D "-I$(top_srcdir)"
+=20
+ noinst_LIBRARIES =3D librcksum.a
+=20
+diff --git a/libzsync/Makefile.am b/libzsync/Makefile.am
+index 0a6ae85..33a5951 100644
+--- a/libzsync/Makefile.am
++++ b/libzsync/Makefile.am
+@@ -1,3 +1,4 @@
++AM_CPPFLAGS =3D "-I$(top_srcdir)"
+=20
+ noinst_LIBRARIES =3D libzsync.a
+=20
diff --git a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb b/meta-oe/reci=
pes-extended/zsync/zsync_0.6.2.bb
new file mode 100644
index 0000000000..c61e26309d
--- /dev/null
+++ b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "File transfer tool optimised for large files"
+HOMEPAGE =3D "http://zsync.moria.org.uk/"
+
+LICENSE =3D "Artistic-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D71c0ac4d86266533509aa0825b8d3=
23c"
+
+SRC_URI =3D "http://zsync.moria.org.uk/download/${BP}.tar.bz2 \
+           file://out-of-tree.patch"
+SRC_URI[sha256sum] =3D "0b9d53433387aa4f04634a6c63a5efa8203070f2298af72a=
705f9be3dda65af2"
+
+inherit autotools
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

