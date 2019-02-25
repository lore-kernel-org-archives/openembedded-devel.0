Return-Path: <danc@opengear.com>
X-Greylist: delayed 21695 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Feb 2019 04:51:26 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
	by mail.openembedded.org (Postfix) with ESMTP id E53BC7C84A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L7UtIpDmtLXhHDEqp5vUg6cA3fP0AwnURs8uGTtTkPQ=;
	b=xOeLXsKX6oHhDnk+L9PH2D5JNdtodHfffDYC+05pfSBUnF7nqo6v+GDz8umMuHzAg+jn8WqN5BmeM1GqO8tonnvzFK21vO0G8Aei5upLTL5usu0/sGHf+1psulkUXuH5SFTwAoyZXDzsAXm9g6w/skcdPfiKDC8hUKUIx1r3+94=
Received: from MWHPR15CA0060.namprd15.prod.outlook.com (2603:10b6:301:4c::22)
	by BN8PR15MB3219.namprd15.prod.outlook.com (2603:10b6:408:75::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.18;
	Mon, 25 Feb 2019 06:18:16 +0000
Received: from CO1NAM04FT050.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::203) by MWHPR15CA0060.outlook.office365.com
	(2603:10b6:301:4c::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.15 via
	Frontend Transport; Mon, 25 Feb 2019 06:18:15 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT050.mail.protection.outlook.com (10.152.91.145) with
	Microsoft SMTP Server id 15.20.1643.11 via Frontend Transport;
	Mon, 25 Feb 2019 06:18:15 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id C3A67DFC4D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:18:13 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id A049E4448FB8; Mon, 25 Feb 2019 16:18:13 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 16:17:57 +1000
Message-ID: <20190225061757.24421-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39830400003)(396003)(136003)(346002)(376002)(2980300002)(448002)(199004)(189003)(2870700001)(50226002)(6266002)(486006)(44832011)(126002)(2616005)(476003)(8936002)(1076003)(26826003)(6306002)(6916009)(106466001)(51416003)(2351001)(85326001)(478600001)(47776003)(2906002)(336012)(316002)(48376002)(6666004)(356004)(36756003)(52956003)(42186006)(8676002)(90966002)(5660300002)(305945005)(36906005)(7636002)(14444005)(186003)(103686004)(246002)(50466002)(426003)(26005)(562404015)(19607625011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB3219;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28fa3729-c730-4ef1-c25d-08d69ae90718
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060);
	SRVR:BN8PR15MB3219; 
X-MS-TrafficTypeDiagnostic: BN8PR15MB3219:
X-MS-Exchange-PUrlCount: 5
X-Microsoft-Exchange-Diagnostics: 1; BN8PR15MB3219;
	20:Gv43mk4BZWUzWZGoj/t/vV4ZZ4uFKRM8dXYhE2s4P/P7pmT3jZLvLnHDOYQD/qYcXWAicN3Nmi9sKsb94Kqig2EfiUtXiw9WvJgon2FYIgVo+s/0GZKk9mFv2eN7PyQb6HETv7rR4krSq+WqixR6wNq3yk/BNw8+sh26cd9ZwQk=
X-Microsoft-Antispam-PRVS: <BN8PR15MB3219C0E59431871D5681DE23B87A0@BN8PR15MB3219.namprd15.prod.outlook.com>
X-Forefront-PRVS: 095972DF2F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN8PR15MB3219;
	23:OvItIg414a8vdfoSxdDzAaoW/BaoCNOOSeGor5KKb?=
	=?us-ascii?Q?tZUq4/+2vPlyBwtIZMWWQLfnRiLIYJ9Yeaqh50K7u/a7OCe7uO6QGK24wZmZ?=
	=?us-ascii?Q?SfaDP2hAkynymydeixQak9lvjUZ7dvIcBh0d5AAipBOrH+VbKAttplnparTb?=
	=?us-ascii?Q?F++nEm0q2H5qyL1VlPHpSQZYKLC+emjw973OtojazzmSfaPkbDUkNfFjxVuY?=
	=?us-ascii?Q?fxdBJl0xTkCsin6QFCNn1s3iPSQ8rvwMmJoqaKBMsUezLQmM5dVMZ5BobI0b?=
	=?us-ascii?Q?iAt5vPRzP1na8on1qUMxDWlA+so0C/Bg2sqEdviHLD5pgrTSjPBxlPwJ4liY?=
	=?us-ascii?Q?U9g8hpsPmqmXwhtd8MpgekMLSi3guEx888qF2ITGZrUGajLtko9/6GePzW/b?=
	=?us-ascii?Q?rC70VrBzdh+XDxtRA4QZmqPontCTNIicPNUus6QfKov/WzT2Di+Fo2rP5e9d?=
	=?us-ascii?Q?cOYQQRQaPwWyIrfOT3yA5SIBlndlq6nHyI640aRPgeiUB5XascAs9VEZ6TOK?=
	=?us-ascii?Q?SQppoBOz03rm62a3YLJeSlVimw9NnUjQb2DCI0B9YfEnx2DXnhq/NrAQp8BN?=
	=?us-ascii?Q?g6808ySXfoTtbwGDlW8kx2BOXawa8y3FkLSw/MgqiiUGgcXqzEj0ILOIansC?=
	=?us-ascii?Q?be0CWzPPgs66Q8ozcE5JoeO/wt0VteyqeyRfNPGiWSQ53Xl+ty/W/Xa11Guc?=
	=?us-ascii?Q?o7tmA9VI4EDQsnjuVTkZ7BGfW3a9XDRGtIGKGLpvambLZD53u9NNkcg6K92P?=
	=?us-ascii?Q?We70Xs0KENpIfREI5+hTwRNcuXILBWlqXJzknloa7MJdnSqnDZYnh5L/dL67?=
	=?us-ascii?Q?4SRcVl1t4Fw+vxQJPUWCpXqxAeLrwJjOI2U8yufvfEUreq+Mko83mBLTtkig?=
	=?us-ascii?Q?Jt0g38Bo1FFTDJLoYui3LK0zeckwN9FjlHI7d+gmS/b38mo/jSbmi/Nw4EUf?=
	=?us-ascii?Q?jNkdOMDkqjSX/hnZc0yX1A5k277nhzoVaqZt/xjLEHEY5yd8UGhVh31RLZ1M?=
	=?us-ascii?Q?oEae91t0uW0BnQY5MLFFN5imtqGamOwv69NGJQhn+HaPwqsctt4ONy/tYHs7?=
	=?us-ascii?Q?wcw91iAah2iIb3tNel7aq/JLF9hwbGjDVIS1Wp1Yr7koxjnqJtw8bY4ZbvHX?=
	=?us-ascii?Q?D0SPF3rQ5b87tUldU6wnr06OBA7WZU3Mm1AaDuUwALrDKH1mz0SoQ=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Xf+HVSbB8EchI7ttoeHDQ6SAKpfqPjTOLoTqUghePYtmI99BAR2sDzaTank38UUFLlfzaFh9Hb61D3PxpfllbQQt4xCxgo5vo4P7tDytgRZ1N5STKmEp2qZgNBID0To/WFHVl/JnkMTxnfUe3mDG/vLp+37LYQYtnvpxOrLmYVjmnrhj6YolIz08gRM153uGV4NPtOR9e9BQNmuOOhfL30Uwk3CJ68orKXvkQvcGxWg2dfOaPT/64HHQIzN+HHl0J3osYWgwINU0FAjRX8GpfqG0OeMIOcYOGtTbPBG8/2vdAmB5EEaqcfOx73Zsd73aD7EAiIbjHogNdFlj/DJyM3aFhEmSACLO736AJO1NHOUQhdO1QkFothu4B0BSNKYBDI5ah7IHaUFbA4L9xhcatTSIuDwYYHJQYZ8DITzLLq4=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2019 06:18:15.2411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fa3729-c730-4ef1-c25d-08d69ae90718
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3219
Subject: [meta-networking][PATCH] firewalld: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 04:51:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 ...a-separate-directory-outside-the-sou.patch | 77 +++++++++++++++++++
 .../firewalld/files/firewalld.init            | 48 ++++++++++++
 .../firewalld/firewalld_0.6.3.bb              | 68 ++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
 create mode 100644 meta-networking/recipes-connectivity/firewalld/files/firewalld.init
 create mode 100644 meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb

diff --git a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
new file mode 100644
index 000000000..3f34ff2e4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
@@ -0,0 +1,77 @@
+firewalld: fix building in a separate directory outside the source tree
+
+Upstream-Status: Submitted [https://github.com/firewalld/firewalld/pull/456]
+Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
+
+diff --git a/config/Makefile.am b/config/Makefile.am
+index 7048d2ee..5270d408 100644
+--- a/config/Makefile.am
++++ b/config/Makefile.am
+@@ -377,11 +377,11 @@ install-config:
+ 	$(MKDIR_P) $(DESTDIR)$(sconfdir)/zones
+ 	$(MKDIR_P) $(DESTDIR)$(sconfdir)/helpers
+ 	$(MKDIR_P) $(DESTDIR)$(prefixlibdir)
+-	cp -r icmptypes $(DESTDIR)$(prefixlibdir)
+-	cp -r ipsets $(DESTDIR)$(prefixlibdir)
+-	cp -r services $(DESTDIR)$(prefixlibdir)
+-	cp -r zones $(DESTDIR)$(prefixlibdir)
+-	cp -r helpers $(DESTDIR)$(prefixlibdir)
++	cp -r $(srcdir)/icmptypes $(DESTDIR)$(prefixlibdir)
++	cp -r $(srcdir)/ipsets $(DESTDIR)$(prefixlibdir)
++	cp -r $(srcdir)/services $(DESTDIR)$(prefixlibdir)
++	cp -r $(srcdir)/zones $(DESTDIR)$(prefixlibdir)
++	cp -r $(srcdir)/helpers $(DESTDIR)$(prefixlibdir)
+ 
+ uninstall-config:
+ 	rmdir $(DESTDIR)$(sconfdir)/icmptypes
+diff --git a/doc/xml/Makefile.am b/doc/xml/Makefile.am
+index 8c93ab9c..d0313e3e 100644
+--- a/doc/xml/Makefile.am
++++ b/doc/xml/Makefile.am
+@@ -69,7 +69,8 @@ edit = sed \
+ 	-e 's|\@PREFIX\@|$(prefix)|' \
+ 	-e 's|\@SYSCONFDIR\@|$(sysconfdir)|' \
+ 	-e 's|\@PACKAGE_STRING\@|$(PACKAGE_STRING)|' \
+-	-e 's|\@IFCFGDIR\@|$(IFCFGDIR)|'
++	-e 's|\@IFCFGDIR\@|$(IFCFGDIR)|' \
++	-e 's|@SRCDIR@|$(srcdir)|'
+ 
+ transform-man.xsl: transform-man.xsl.in
+ 	$(edit) $< >$@
+diff --git a/doc/xml/firewall-cmd.xml.in b/doc/xml/firewall-cmd.xml.in
+index c2606553..24d77858 100644
+--- a/doc/xml/firewall-cmd.xml.in
++++ b/doc/xml/firewall-cmd.xml.in
+@@ -1,9 +1,9 @@
+ <?xml version="1.0" encoding="utf-8"?>
+ <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
+ [
+-<!ENTITY authors SYSTEM "authors.xml">
+-<!ENTITY seealso SYSTEM "seealso.xml">
+-<!ENTITY notes SYSTEM "notes.xml">
++<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
++<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
++<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
+ <!ENTITY errorcodes SYSTEM "errorcodes.xml">
+ ]>
+ 
+diff --git a/doc/xml/firewalld.xml.in b/doc/xml/firewalld.xml.in
+index de802059..3d319b04 100644
+--- a/doc/xml/firewalld.xml.in
++++ b/doc/xml/firewalld.xml.in
+@@ -1,9 +1,9 @@
+ <?xml version="1.0" encoding="utf-8"?>
+ <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
+ [
+-<!ENTITY authors SYSTEM "authors.xml">
+-<!ENTITY seealso SYSTEM "seealso.xml">
+-<!ENTITY notes SYSTEM "notes.xml">
++<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
++<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
++<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
+ ]>
+ 
+ <!--
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-connectivity/firewalld/files/firewalld.init b/meta-networking/recipes-connectivity/firewalld/files/firewalld.init
new file mode 100644
index 000000000..08e8930b9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/firewalld/files/firewalld.init
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides: firewalld
+# Required-Start: $syslog $local_fs messagebus
+# Required-Stop: 
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: 
+# Description: 
+### END INIT INFO
+
+. /etc/init.d/functions
+
+firewalld=/usr/sbin/firewalld
+pidfile=/var/run/firewalld.pid
+
+case "$1" in
+    start)
+        echo -n "Starting firewalld: "
+        start-stop-daemon --start --quiet --exec $firewalld
+        echo "."
+        ;;
+    stop)
+        echo -n "Stopping firewalld: "
+        start-stop-daemon --stop --quiet --pidfile $pidfile
+        echo "."
+        ;;
+    restart)
+        echo -n "Stopping firewalld: "
+        start-stop-daemon --stop --quiet --pidfile $pidfile
+        echo "."
+        echo -n "Starting firewalld: "
+        start-stop-daemon --start --quiet --exec $firewalld
+        echo "."
+        ;;
+    reload)
+        echo -n "Reloading firewalld: "
+        firewall-cmd --reload
+        echo "."
+        ;;
+    status)
+        firewall-cmd --state
+        ;;
+    *)
+        echo "Usage: /etc/init.d/firewalld {start|stop|restart|reload|status}" >&2
+        exit 1
+esac
diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
new file mode 100644
index 000000000..6526b1e91
--- /dev/null
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
@@ -0,0 +1,68 @@
+SUMMARY = "Dynamic firewall daemon with a D-Bus interface"
+HOMEPAGE = "https://firewalld.org/"
+BUGTRACKER = "https://github.com/firewalld/firewalld/issues"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://github.com/firewalld/firewalld/archive/v${PV}.tar.gz \
+           file://firewalld.init \
+           file://0001-fix-building-in-a-separate-directory-outside-the-sou.patch \
+"
+SRC_URI[md5sum] = "5ef954d9b6b244ffeabcd226be1867a0"
+SRC_URI[sha256sum] = "039ad56ea6d6553aadf33243ea5b39802d73519e46a89c80c648b2bd1ec78aeb"
+
+# glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
+# xmlto-native is needed to populate /etc/xml/catalog.xml in the sysroot so that xsltproc finds the docbook xslt
+DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheets-native xmlto-native"
+
+inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd"
+
+# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
+# the Red Hat-specific init script which we aren't using, so disable it
+EXTRA_OECONF = "--with-nft=${sbindir}/nft --disable-sysconfig"
+
+INITSCRIPT_NAME = "firewalld"
+
+do_install_append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        :
+    else
+        # firewalld ships an init script but it contains Red Hat-isms, replace it with our own
+        rm -rf ${D}${sysconfdir}/rc.d/
+        install -d ${D}${sysconfdir}/init.d
+        install -m0755 ${WORKDIR}/firewalld.init ${D}${sysconfdir}/init.d/firewalld
+    fi
+
+    # We ran ./configure with PYTHON pointed at the binary inside $STAGING_BINDIR_NATIVE
+    # so now we need to fix up any references to point at the proper path in the image.
+    # This hack is also in distutils.bbclass, but firewalld doesn't use distutils/setuptools.
+    if [ ${PN} != "${BPN}-native" ]; then
+        sed -i -e s:${STAGING_BINDIR_NATIVE}/python3-native/python3:${bindir}/python3:g \
+            ${D}${bindir}/* ${D}${sbindir}/* ${D}${sysconfdir}/firewalld/*.xml
+    fi
+    sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g \
+        ${D}${bindir}/* ${D}${sbindir}/* ${D}${sysconfdir}/firewalld/*.xml
+}
+
+FILES_${PN} += "\
+    ${PYTHON_SITEPACKAGES_DIR}/firewall \
+    ${datadir}/polkit-1 \
+    ${datadir}/metainfo \
+"
+
+RDEPENDS_${PN} = "\
+    nftables \
+    python3-core \
+    python3-io \
+    python3-fcntl \
+    python3-shell \
+    python3-syslog \
+    python3-xml \
+    python3-dbus \
+    python3-slip-dbus \
+    python3-decorator \
+    python3-pygobject \
+"
-- 
2.20.1


