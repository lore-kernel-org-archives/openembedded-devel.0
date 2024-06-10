Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCE9C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 09:36:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.15531.1718012169737705539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 02:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 1C6A617CE0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:36:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.42.224]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGbRd-18P4M50; Mon, 10 Jun 2024 11:36:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] replace libdbd-mysql-perl with dbd-mariadb
Date: Mon, 10 Jun 2024 11:36:56 +0200
Message-ID: <20240610093656.2610-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1718012165-C57F9D1D-827A24A1/0/0 CLEAN NORMAL
X-TOI-MSGID: b6920fdd-0e78-43b5-9d3a-11e719809c30
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 09:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110794

libdbd-mysql-perl is broken with mariadb/gcc14 and upstream does not supp=
ort mariadb.
[https://github.com/perl5-dbi/DBD-mysql/issues/430]

Use the perl database driver that is provided by the mariadb project inst=
ead.
[https://mariadb.com/kb/en/perl-dbi]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  2 +-
 .../recipes-devtools/perl/dbd-mariadb_1.23.bb | 20 ++++++++++++++++
 .../perl/libdbd-mysql-perl_5.006.bb           | 24 -------------------
 3 files changed, 21 insertions(+), 25 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb
 delete mode 100644 meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006=
.bb

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 695965f7d..4bfa1c9ca 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -215,7 +215,7 @@ RDEPENDS:${PN}-client =3D "perl perl-module-getopt-lo=
ng perl-module-file-temp \
 RDEPENDS:${PN}-server =3D "perl perl-module-getopt-long perl-module-data=
-dumper \
     perl-module-file-basename perl-module-file-path perl-module-sys-host=
name \
     perl-module-file-copy perl-module-file-temp perl-module-posix \
-    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl lzo"
+    ${PN}-client ${PN}-setupdb libdbi-perl dbd-mariadb lzo"
 RDEPENDS:${PN}-leftovers =3D "perl perl-module-cwd perl-module-benchmark=
 perl-module-getopt-long \
     perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-m=
odule-threads \
     perl-module-threads-shared perl-module-io-socket perl-module-sys-hos=
tname perl-module-file-copy \
diff --git a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb b/meta-oe/=
recipes-devtools/perl/dbd-mariadb_1.23.bb
new file mode 100644
index 000000000..0eaf2137b
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb
@@ -0,0 +1,20 @@
+DESPCRIPTION =3D "DBD::MariaDB is the Perl5 Database Interface driver fo=
r MariaDB and MySQL databases."
+HOMEPAGE =3D "https://metacpan.org/dist/DBD-MariaDB"
+LICENSE =3D "GPL-1.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd0a06964340e5c0cde88b7af611f7=
55c"
+
+DEPENDS =3D "libdbi-perl-native libdev-checklib-perl-native libmysqlclie=
nt"
+
+SRC_URI =3D "${CPAN_MIRROR}/authors/id/P/PA/PALI/DBD-MariaDB-${PV}.tar.g=
z"
+SRC_URI[sha256sum] =3D "0d0c76c660ddd55570e48f3e2fdea8f621a69ac0ed48190e=
8cfcafcb5e9b859d"
+
+RDEPENDS:${PN} =3D "libdbi-perl"
+
+S =3D "${WORKDIR}/DBD-MariaDB-${PV}"
+
+inherit cpan
+
+RDEPENDS:${PN}-ptest +=3D " \
+	libtest-warnings-perl \
+	perl-module-test-more \
+"
diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb b/m=
eta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
deleted file mode 100644
index 919997914..000000000
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "A Perl DBI driver for MySQL"
-DESCRIPTION =3D "DBD::mysql is the Perl5 Database Interface driver for \
-the MySQL database. In other words: DBD::mysql is an interface between \
-the Perl programming language and the MySQL programming API that comes \
-with the MySQL relational database management system. Most functions \
-provided by this programming API are supported. Some rarely used \
-functions are missing, mainly because no-one ever requested them. \
-"
-HOMEPAGE =3D "https://github.com/perl5-dbi/DBD-mysql"
-
-SECTION =3D "libs"
-LICENSE =3D "Artistic-1.0 | GPL-1.0-or-later"
-DEPENDS +=3D "libdev-checklib-perl-native libdbi-perl-native libmysqlcli=
ent"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd0a06964340e5c0cde88b7af611f7=
55c"
-
-SRCREV =3D "9b5b70ea372f49fe9bc9e592dae3870596d1e3d6"
-SRC_URI =3D "git://github.com/perl5-dbi/DBD-mysql.git;protocol=3Dhttps;b=
ranch=3Dmaster"
-
-S =3D "${WORKDIR}/git"
-
-inherit cpan
-
-EXTRA_OEMAKE =3D ' CC=3D"${CC} -Wno-incompatible-pointer-types"'
--=20
2.45.1


