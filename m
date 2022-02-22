Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1F5C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:50:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8236.1645498251914895685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 18:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46F2D40C2E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-kPOfM7WH_s
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3132D40C5D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E1292174769;
	Mon, 21 Feb 2022 21:50:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 3/4] meta-openembedded: rename PNBLACKLIST to SKIP_RECIPE
Date: Tue, 22 Feb 2022 02:50:47 +0000
Message-Id: <20220222025048.2826709-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222025048.2826709-1-denis@denix.org>
References: <20220222025048.2826709-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 02:50:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95432

Part of inclusive language changes.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb          | 2 +-
 meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb           | 2 +-
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 +-
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb      | 2 +-
 meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb                 | 2 +-
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb   | 2 +-
 meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb            | 2 +-
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb        | 2 +-
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb         | 2 +-
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb              | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0=
.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.=
bb
index 48b32eb7e..c45cbcd92 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -69,4 +69,4 @@ RDEPENDS:${PN}-server +=3D "tcp-wrappers xinetd rpcbind=
"
=20
 # http://errors.yoctoproject.org/Errors/Details/186962/
 COMPATIBLE_HOST:libc-musl =3D 'null'
-PNBLACKLIST[netkit-rusers] ?=3D "Fails to build rup.c:51:10: fatal error=
: rstat.h: No such file or directory"
+SKIP_RECIPE[netkit-rusers] ?=3D "Fails to build rup.c:51:10: fatal error=
: rstat.h: No such file or directory"
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb b/meta=
-networking/recipes-support/drbd/drbd_9.0.24-1.bb
index 3ce63c457..05d42c75e 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
@@ -21,4 +21,4 @@ do_install () {
     oe_runmake install DESTDIR=3D"${D}"
 }
=20
-PNBLACKLIST[drbd] ?=3D "Needs coccinelle to build with SPAAS"
+SKIP_RECIPE[drbd] ?=3D "Needs coccinelle to build with SPAAS"
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_gi=
t.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 28def7b48..cc6053ba9 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -36,4 +36,4 @@ FILES:${PN}-dbg +=3D "${libexecdir}/lowpan-tools/.debug=
/"
 PACKAGES =3D+ "${PN}-python"
 FILES:${PN}-python =3D "${libdir}/python*"
=20
-PNBLACKLIST[lowpan-tools] ?=3D "WARNING these tools are deprecated! Use =
wpan-tools instead"
+SKIP_RECIPE[lowpan-tools] ?=3D "WARNING these tools are deprecated! Use =
wpan-tools instead"
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index be131cd26..b0e7475bd 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -76,4 +76,4 @@ INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
=20
 # see https://github.com/libhugetlbfs/libhugetlbfs/issues/52
-PNBLACKLIST[libhugetlbfs] ?=3D "Needs porting to glibc 2.34+"
+SKIP_RECIPE[libhugetlbfs] ?=3D "Needs porting to glibc 2.34+"
diff --git a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb b/meta-oe/re=
cipes-dbs/mysql/mysql-python_1.2.5.bb
index 43fc69073..cd4658651 100644
--- a/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "811040b647e5d5686f84db415efd697=
e6250008b112b6909ba77ac059e
=20
 S =3D "${WORKDIR}/${SRCNAME}-${PV}"
=20
-PNBLACKLIST[mysql-python] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE=
_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read h=
ttps://www.python.org/doc/sunset-python-2/ https://python3statement.org/ =
and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRA=
TE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[mysql-python] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE=
_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read h=
ttps://www.python.org/doc/sunset-python-2/ https://python3statement.org/ =
and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRA=
TE_TO_PYTHON3 to "yes"', d)}"
=20
 inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setu=
ptools", "", d)}
=20
diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.b=
b b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 88c83f102..ddb93a040 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -37,4 +37,4 @@ RDEPENDS:${PN} +=3D " \
 "
=20
 BBCLASSEXTEND =3D "nativesdk"
-PNBLACKLIST[dnf-plugin-tui] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES'=
, 'package_rpm', '', 'does not build correctly without package_rpm in PAC=
KAGE_CLASSES', d)}"
+SKIP_RECIPE[dnf-plugin-tui] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES'=
, 'package_rpm', '', 'does not build correctly without package_rpm in PAC=
KAGE_CLASSES', d)}"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb b/meta-=
oe/recipes-extended/cfengine/cfengine_3.15.0.bb
index 60c5ab381..05d3a1e23 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
@@ -10,7 +10,7 @@ its lifecycle. CFEngine takes systems from Build to Dep=
loy, Manage and Audit."
=20
 HOMEPAGE =3D "http://cfengine.com"
=20
-PNBLACKLIST[cfengine] ?=3D "Needs porting to openssl 3.x"
+SKIP_RECIPE[cfengine] ?=3D "Needs porting to openssl 3.x"
=20
 LICENSE =3D "GPLv3"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D233aa25e53983237cf0bd4c238af2=
55f"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/m=
eta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 850ed4f5f..24271eb2b 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -7,7 +7,7 @@ SECTION =3D "System/Management"
=20
 inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setu=
ptools", "", d)}
=20
-PNBLACKLIST[openlmi-tools] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRAT=
E_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read =
https://www.python.org/doc/sunset-python-2/ https://python3statement.org/=
 and if you really have to temporarily use this, then set I_SWEAR_TO_MIGR=
ATE_TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[openlmi-tools] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRAT=
E_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read =
https://www.python.org/doc/sunset-python-2/ https://python3statement.org/=
 and if you really have to temporarily use this, then set I_SWEAR_TO_MIGR=
ATE_TO_PYTHON3 to "yes"', d)}"
=20
 DEPENDS =3D "python-native python-pywbem-native python-m2crypto python-p=
ywbem"
=20
diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb b/me=
ta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
index eea231a2e..331e00fb8 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.2.bb
@@ -27,5 +27,5 @@ BBCLASSEXTEND =3D "nativesdk"
=20
 FILES:${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/ ${sy=
sconfdir}/dnfdragora ${sysconfdir}/xdg"
=20
-PNBLACKLIST[dnfdragora] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'p=
ackage_rpm', '', 'does not build correctly without package_rpm in PACKAGE=
_CLASSES', d)}"
+SKIP_RECIPE[dnfdragora] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'p=
ackage_rpm', '', 'does not build correctly without package_rpm in PACKAGE=
_CLASSES', d)}"
=20
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe=
/recipes-support/lio-utils/lio-utils_4.1.bb
index 108d65298..15acdf51a 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -55,7 +55,7 @@ do_install() {
     install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start=
.sh
 }
=20
-PNBLACKLIST[lio-utils] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO=
_PYTHON3', 'yes', '', 'python2 is out of support for long time, read http=
s://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and=
 if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_=
TO_PYTHON3 to "yes"', d)}"
+SKIP_RECIPE[lio-utils] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO=
_PYTHON3', 'yes', '', 'python2 is out of support for long time, read http=
s://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and=
 if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_=
TO_PYTHON3 to "yes"', d)}"
=20
 RDEPENDS:${PN} +=3D "python-stringold python-subprocess python-shell \
     python-datetime python-textutils python-crypt python-netclient pytho=
n-email \
--=20
2.25.1


