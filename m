Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBAFC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 10:41:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48502.1703155284816091257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 02:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 479722F4
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 02:42:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A45563F5A1
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 02:41:23 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] lemon: upgrade to 3.44.2
Date: Thu, 21 Dec 2023 10:41:21 +0000
Message-Id: <20231221104121.1083134-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107707

From: Ross Burton <ross.burton@arm.com>

Lemon is packaged as part of sqlite, and sqlite 3.7.3 was released back
in 2010[1].

As the small source tarballs no longer include the tools, fetch the
sqlite github mirror instead.

Don't bother installing a pretty minimal manpage, as very few projects
use lemon (sqlite itself, and libpbnjson).

[1] https://www.sqlite.org/releaselog/3_7_3.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/lemon/files/lemon.1  | 63 -------------------
 meta-oe/recipes-devtools/lemon/lemon.inc      | 25 --------
 .../recipes-devtools/lemon/lemon_3.44.2.bb    | 24 +++++++
 meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb |  7 ---
 4 files changed, 24 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lemon/files/lemon.1
 delete mode 100644 meta-oe/recipes-devtools/lemon/lemon.inc
 create mode 100644 meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
 delete mode 100644 meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb

diff --git a/meta-oe/recipes-devtools/lemon/files/lemon.1 b/meta-oe/recip=
es-devtools/lemon/files/lemon.1
deleted file mode 100644
index 914ee07013..0000000000
--- a/meta-oe/recipes-devtools/lemon/files/lemon.1
+++ /dev/null
@@ -1,63 +0,0 @@
-.Dd 2002-10-04
-.Dt LEMON 1
-.Os "Debian GNU/Linux"
-.\" Manual page created by Guus Sliepen <guus@debian.org>
-.Sh NAME
-.Nm lemon
-.Nd The Lemon Parser Generator
-.Sh SYNOPSIS
-.Nm
-.Op Fl bcgmqsx
-.Ar input
-.Sh DESCRIPTION
-.Nm
-is an LALR(1) parser generator for C or C++.
-It does the same job as bison and yacc.
-But=20
-.Nm
-is not another bison or yacc clone.
-It uses a different grammar syntax which is designed to reduce the numbe=
r of coding errors.
-.Nm
-also uses a more sophisticated parsing engine that is faster than yacc a=
nd bison
-and which is both reentrant and thread-safe.
-Furthermore,=20
-.Nm
-implements features that can be used to eliminate resource leaks,
-making is suitable for use in long-running programs such as graphical us=
er interfaces or embedded controllers.
-.Pp
-.Nm
-will read the grammer from
-.Ar input
-and write out a parser for that grammar in the C language.
-.Sh OPTIONS
-.Bl -tag -width indent
-.It Fl b
-Print only the basis in report.
-.It Fl c
-Don't compress the action table.
-.It Fl g
-Print grammar without actions.
-.It Fl m
-Output a makeheaders compatible file.
-.It Fl q
-(Quiet) Don't print the report file.
-.It Fl s
-Print parser stats to standard output.
-.It Fl x
-Print the version number.
-.El
-.Sh FILES
-.Bl -tag -width indent
-.It Pa /usr/share/lemon/lempar.c
-Driver template for the
-.Nm
-parser generator.
-.El
-.Sh AUTHOR
-.Nm
-has been written by
-.An D. Richard Hipp Aq drh@hwaci.com .
-.Pp
-This manual page was written by
-.An Guus Sliepen Aq guus@debian.org
-for the Debian GNU/Linux system.
diff --git a/meta-oe/recipes-devtools/lemon/lemon.inc b/meta-oe/recipes-d=
evtools/lemon/lemon.inc
deleted file mode 100644
index 57b9fb710e..0000000000
--- a/meta-oe/recipes-devtools/lemon/lemon.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "The Lemon Parser Generator"
-HOMEPAGE =3D "http://www.hwaci.com/sw/lemon/"
-LICENSE =3D "PD"
-SECTION =3D "devel"
-
-SRC_URI =3D "http://www.sqlite.org/sqlite-${PV}.tar.gz \
-           file://lemon.1"
-
-S =3D "${WORKDIR}/sqlite-${PV}/tool"
-
-do_compile() {
-    ${CC} ${CFLAGS} lemon.c -c -o lemon.o
-    ${CCLD} ${LDFLAGS} lemon.o -o lemon
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 lemon ${D}${bindir}
-    install -m 0644 lempar.c ${D}${bindir}
-    install -d ${D}${mandir}/man1
-    install -m 0644 ${WORKDIR}/lemon.1 ${D}${mandir}/man1/
-}
-
-BBCLASSEXTEND =3D "native"
-
diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb b/meta-oe/rec=
ipes-devtools/lemon/lemon_3.44.2.bb
new file mode 100644
index 0000000000..2904a454dc
--- /dev/null
+++ b/meta-oe/recipes-devtools/lemon/lemon_3.44.2.bb
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "The Lemon Parser Generator"
+HOMEPAGE =3D "https://sqlite.org/src/file/doc/lemon.html"
+LICENSE =3D "PD"
+SECTION =3D "devel"
+
+LIC_FILES_CHKSUM =3D "file://tool/lemon.c;endline=3D8;md5=3Dc7551a78fa3f=
decd96d1ad6761d205ee"
+
+SRC_URI =3D "git://github.com/sqlite/sqlite;protocol=3Dhttps;branch=3Dbr=
anch-3.44"
+
+SRCREV =3D "c8f9803dc32bfee78a9ca2b1abbe39499729219b"
+
+S =3D "${WORKDIR}/git"
+
+do_compile() {
+    ${CC} ${CFLAGS} ${LDFLAGS} tool/lemon.c -o lemon
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 lemon ${D}${bindir}
+    install -m 0644 tool/lempar.c ${D}${bindir}
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb b/meta-oe/reci=
pes-devtools/lemon/lemon_3.7.3.bb
deleted file mode 100644
index 354db17e6e..0000000000
--- a/meta-oe/recipes-devtools/lemon/lemon_3.7.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require lemon.inc
-
-LIC_FILES_CHKSUM =3D "file://lemon.c;endline=3D8;md5=3Dc7551a78fa3fdecd9=
6d1ad6761d205ee"
-
-SRC_URI[md5sum] =3D "5437978aae90350cf984993091e0d695"
-SRC_URI[sha256sum] =3D "dbf352e8fbb74829f5e7a88f9f6ceeb80a709537f668c36e=
4b6cdfb271309ef6"
-
--=20
2.34.1


