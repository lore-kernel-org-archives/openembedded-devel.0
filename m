Return-Path: <danc@opengear.com>
X-Greylist: delayed 109512 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Feb 2019 07:15:44 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800089.outbound.protection.outlook.com [40.107.80.89])
	by mail.openembedded.org (Postfix) with ESMTP id 856477C930
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7BMse2kw5HzvAGDANMX6ehkAd9ZoSEOCQf5UM/Lq67M=;
	b=fZ3626eHefavDNi1CVvc4TcfuYBekJCaqjtRJGqcDQd0H2P/MGr0tW05wIqMnMC0A+PZBUaTNUcs3IGBsbvoMCJRKEmWA7seHcB1RiafIiIKGuQ8CnFB4XVA1SzU/+7ia9emvvgcN+8fWeiD/t6ZlXB+bQsOwurALFK+fxsDwn4=
Received: from DM5PR1501CA0015.namprd15.prod.outlook.com (2603:10b6:4:9d::28)
	by MN2PR15MB3229.namprd15.prod.outlook.com (2603:10b6:208:39::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15;
	Wed, 27 Feb 2019 05:42:51 +0000
Received: from SN1NAM04FT040.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::202) by DM5PR1501CA0015.outlook.office365.com
	(2603:10b6:4:9d::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via
	Frontend Transport; Wed, 27 Feb 2019 05:42:51 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT040.mail.protection.outlook.com (10.152.89.1) with Microsoft
	SMTP Server id 15.20.1643.11 via Frontend Transport;
	Wed, 27 Feb 2019 05:42:50 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 8B8D3DFC4D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 15:42:49 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 68D3B4295AAF; Wed, 27 Feb 2019 15:42:49 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 15:42:40 +1000
Message-ID: <20190227054240.16066-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190225061757.24421-1-dan.callaghan@opengear.com>
References: <20190225061757.24421-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39840400004)(376002)(346002)(2980300002)(448002)(189003)(199004)(36906005)(316002)(6916009)(305945005)(356004)(6666004)(7636002)(126002)(2616005)(8676002)(476003)(50226002)(26005)(11346002)(426003)(446003)(36756003)(486006)(48376002)(336012)(50466002)(2906002)(186003)(47776003)(106466001)(246002)(44832011)(8936002)(14444005)(6306002)(478600001)(85326001)(2870700001)(2351001)(5660300002)(51416003)(1076003)(90966002)(6266002)(26826003)(76176011)(42186006)(103686004)(52956003)(562404015)(19607625011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR15MB3229;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b1c4bb7-fe6f-4ab3-e60d-08d69c7669b8
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
	SRVR:MN2PR15MB3229; 
X-MS-TrafficTypeDiagnostic: MN2PR15MB3229:
X-MS-Exchange-PUrlCount: 5
X-Microsoft-Exchange-Diagnostics: 1; MN2PR15MB3229;
	20:UsmyrsM5P3EEJe5Oi4W97ImmhPdr+dC4EY6mFdeQAuwnYR7UUu2XVryxwr20v5yaZf9pFqzPwobLWo3hYKL16qa/qYq0uUx43D0/cmyNsptcF5vBPY8seYe4DjEECtHU1YLaUG4t/28aMih6Vl60v/UWCYBOo/c7qBE43ET7mtQ=
X-Microsoft-Antispam-PRVS: <MN2PR15MB3229A4F0021052DE8FC39B1DB8740@MN2PR15MB3229.namprd15.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MN2PR15MB3229;
	23:M+z95wPQPWWV1iJ2Sz84201ul1UFb+pMuXQNJGRHN?=
	=?us-ascii?Q?X3dFBy1KHGQOrXbBFTNpy0Cu5TiwW0C0eEztfsvP1nz6mq4c29e1B4sZtnjo?=
	=?us-ascii?Q?vn4B9kAcezFkNkGLja7HBh0iA7EjInhKf+6Mz/6bV7jq38da14nulraKOQHE?=
	=?us-ascii?Q?3FPkXoXycz/yeXG+Thcip6bm3B7emMN6GYIYqaXaXOVuSe5gB2GsLuqDqIX7?=
	=?us-ascii?Q?zvYw5/a5GBW5d6WD/5Z+OUN5jfqH/La9YWPW3IYRO0I73BQoTEmSJSX7lWEB?=
	=?us-ascii?Q?uhI9+ID5QMPHwqmVPY1jNhf+j0y3X/ErxQP5f96gE4eGvmg0ZZmYlbQscuTK?=
	=?us-ascii?Q?I6bdReXsCd4ICHSl4Z53JZrc0fgtIYHgkePeFY3KON+ERXJtSpuYkGu21s9Q?=
	=?us-ascii?Q?rTKvQAv4wnZhAxhNOntD0Gk4tZOQcT3JeDrroPqPFwLvSp915MrCeOkJG9ii?=
	=?us-ascii?Q?TaiMhIs+TJNT2RprtT/A9R7oEXvYNuKlrRYIL6FouSR8t24eK5zkIXc4+VUa?=
	=?us-ascii?Q?LOcGxMgXwVKsoPdBbPOzE57Z4FOSqCGsFE97CMBohRnURzPlxdtrRj7Mdn2k?=
	=?us-ascii?Q?xO0gOCPYXl5Mbn83VyEeVGU0lZnXyGTtZeNLRnQYleB+xIzCmiiVT9MLy7w3?=
	=?us-ascii?Q?+Md4KW8cUqv3Fiia2O0Aw8PUcwg6Y/5ZhJw68bVLPP+mXmemnLiP4NQFKL/I?=
	=?us-ascii?Q?cjXLfX432L74Bj26wTKopXEDz3SUTkDdjXx2E+V4Og6eeNT0RA+aRtWuQ99X?=
	=?us-ascii?Q?R1LgEBuawSovBr4jatieiVUAyP3mn+pBHJL3pYbGB1yATvdsX7/o1qqxlrjy?=
	=?us-ascii?Q?wb91a7QJ5VdtOkNQYFmP/hGnrVOs8OoPsxWQc5xUl8TYYcllbeSf364CWt3n?=
	=?us-ascii?Q?ESjQ7s+/6LUxfrheiTZv3fAdHi0RVyHmB7UsVqJA553Qm6iG/4/VKMZkqkOk?=
	=?us-ascii?Q?oKjnPpRo7l+in2/BG0ySNbjUzYJ3hsgpRSk0K/A5laOPmf2Y250Q5ZkurFJx?=
	=?us-ascii?Q?D5qeNHL3XlGxQAc4WIzDeWs7Q547zx7Ap16M8eKwSuJvIDg/FVQMm2J7bzAP?=
	=?us-ascii?Q?GDhyBsS1/NBDSdWe8V7IbgBOJtbjblYjZ/eEL/KO90Hj542vzt3c5QmOby6a?=
	=?us-ascii?Q?mS+THPRTuGMVwk3sHDOSIXTQ+4OMXmHrqdrsayouLCReTEk3xphX5QaNrPCv?=
	=?us-ascii?Q?W6ONnRF3AyidJREpGzmihFeAtR2qZhuA9Bb?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Z/blrNb7l0QgBtNkc2VwZPFt1WM21hsfqKpME8wTV5TwNzDNTIOlz/zAucjj9Aa2trvzS6Fj6/VYBVhkWKwq0x8MedSkUzDUTavBq/HWnLzZ5HlPA1arbUGlBMfG5CjocG8pOLnhZars+taG5gdv2Rlnt9Vwhf55cxgyBONpqR6GRcCeKG/PmYpvfATxJJ/5XX3b9nK/9UmpZDaBTe3Bc2IRFGSN2EFkmlfXOc3KbAv1Zq6PHZ5sGaSQ+76ssilDsl1Are0JOM6nDnfV9bxf0JRdDao1fXgXv0GBo/aFeH57w1acrk4ilaSxLKBLmWnBURVbrwQ323mISAcE6wLzclvdiWNWvTUWaAc6TSwc3BG187jZHAuJL6ohft8Fgt6HlCDsFcQfgHHwkambLIjR/i71Gu2PVODbDboOYFTZQVw=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 05:42:50.9216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1c4bb7-fe6f-4ab3-e60d-08d69c7669b8
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3229
Subject: [meta-networking][PATCH v2] firewalld: add new recipe
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
X-List-Received-Date: Wed, 27 Feb 2019 07:15:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 ...a-separate-directory-outside-the-sou.patch | 77 +++++++++++++++++
 .../firewalld/files/firewalld.init            | 48 +++++++++++
 .../firewalld/firewalld_0.6.3.bb              | 83 +++++++++++++++++++
 3 files changed, 208 insertions(+)
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
index 000000000..b31543470
--- /dev/null
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
@@ -0,0 +1,83 @@
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
+# iptables, ip6tables, ebtables, and ipset *should* be unnecessary
+# when the nftables backend is available, because nftables supersedes all of them.
+# However we still need iptables and ip6tables to be available otherwise any
+# application relying on "direct passthrough" rules (such as docker) will break.
+# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
+# the Red Hat-specific init script which we aren't using, so we disable that.
+EXTRA_OECONF = "\
+    --with-nft=${sbindir}/nft \
+    --without-ipset \
+    --with-iptables=${sbindir}/iptables \
+    --with-iptables-restore=${sbindir}/iptables-restore \
+    --with-ip6tables=${sbindir}/ip6tables \
+    --with-ip6tables-restore=${sbindir}/ip6tables-restore \
+    --without-ebtables \
+    --without-ebtables-restore \
+    --disable-sysconfig \
+"
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
+    iptables \
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


