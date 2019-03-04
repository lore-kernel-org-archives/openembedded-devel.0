Return-Path: <danc@opengear.com>
X-Greylist: delayed 3492 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Mar 2019 10:00:15 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
	by mail.openembedded.org (Postfix) with ESMTP id 156EA60290
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Ki70IGSykMvSKHhU59H8qKw+6xnT/Iz0yOF/po+v1xM=;
	b=f24zzreObzm/BlwwGKN6E9JOSNsn8vHOhOx+pigIlOdcnf/WxcNYunq1Bs5gNCVsCpAKt/6iPvD8mByCEMegGb6dQgbPFl3gbNfMtlGdtIbm7OA7Ewr5CTsiPgidSWCaKSzRaQNz4GbaYYp5pvryIc7RtY+AIeFjldDnO1x9ynM=
Received: from DM5PR15CA0046.namprd15.prod.outlook.com (2603:10b6:4:4b::32) by
	BN8PR15MB2675.namprd15.prod.outlook.com (2603:10b6:408:ca::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.16; Mon, 4 Mar 2019 01:30:36 +0000
Received: from BN3NAM04FT064.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::206) by DM5PR15CA0046.outlook.office365.com
	(2603:10b6:4:4b::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1665.15 via
	Frontend Transport; Mon, 4 Mar 2019 01:30:35 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT064.mail.protection.outlook.com (10.152.93.138) with
	Microsoft SMTP
	Server id 15.20.1643.11 via Frontend Transport; Mon, 4 Mar 2019 01:30:35
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 9B154DFC4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 11:30:33 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 8C2284295AAF; Mon,  4 Mar 2019 11:30:33 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Mar 2019 11:30:30 +1000
Message-ID: <20190304013030.24036-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190227054240.16066-1-dan.callaghan@opengear.com>
References: <20190227054240.16066-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(136003)(376002)(39830400003)(2980300002)(448002)(199004)(189003)(50466002)(336012)(48376002)(446003)(1076003)(486006)(126002)(26005)(11346002)(476003)(426003)(2616005)(44832011)(8936002)(8676002)(6266002)(186003)(5660300002)(246002)(103686004)(356004)(36756003)(76176011)(305945005)(478600001)(26826003)(85326001)(47776003)(51416003)(52956003)(36906005)(6916009)(7636002)(2351001)(50226002)(42186006)(316002)(106466001)(90966002)(2906002)(2870700001)(14444005)(6306002)(562404015)(19607625011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB2675;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb8ec37-23be-4e8a-8994-08d6a041002e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
	SRVR:BN8PR15MB2675; 
X-MS-TrafficTypeDiagnostic: BN8PR15MB2675:
X-MS-Exchange-PUrlCount: 5
X-Microsoft-Exchange-Diagnostics: 1; BN8PR15MB2675;
	20:IYDUAjVi1A5kJB96YvXO+0GrB4ZkBPUcCP71FnUIELGseH6+LenTSzD4+/cmNbvnT9lLEzQYKWE2VKLnmx/G7XTT1JeQ6z37jReT5xXSWb9Rvh7eHjYJK/5zTFge1IKUE3Oifb28VNzlf9JBnsPWOwOMBtMeL7hERgpOcA98Iec=
X-Microsoft-Antispam-PRVS: <BN8PR15MB267563C2EECC672553ABA578B8710@BN8PR15MB2675.namprd15.prod.outlook.com>
X-Forefront-PRVS: 09669DB681
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN8PR15MB2675;
	23:0NK5kH7Hwn78l/WY2Gaocd4dxv+Z9JZF0TrPRMMFD?=
	=?us-ascii?Q?wHfncIIpGUEl6Zvfq/DkKvHjKQcwXJUA74JNk6NhXZMySmAGC2/0h6eqXaHS?=
	=?us-ascii?Q?4d9inUOXarvRBeS2ByxP+FkSjXw+ZLs0AZArAbOiwD9qJTLtqGlAQi7K4JWK?=
	=?us-ascii?Q?BGi80Lx1w9x8VpM0PcS8ENSwZ2QzqcvXiGyJmYnq+wACX+SkKqfpB1rBSlp3?=
	=?us-ascii?Q?b35F4X+yOtA9BP3gAAuC0J4tc3dtPf5HW6qABKnecOO8DA5SjtIePBdBwm9X?=
	=?us-ascii?Q?yL9SN/4uW4e+EzTw/QfWoE3QfWcf9GFBXYw/7cwXLemnM6NKU9IMBO5+VJcG?=
	=?us-ascii?Q?9LfHh1iHCt2ByCWzaCDBsmSUfdGsMersM6it06DmD+GrmMFgoSiTTWCakquK?=
	=?us-ascii?Q?sXxKRxS7Ea/NB84qFi9oKovVEpYpicSsV6xzpUBNcABUvSSynkTNphHrdN4/?=
	=?us-ascii?Q?grwtD5NQOw451fcMwLV5HnaGs6M8GUQD7HQ5uAMyWlts2V7iTrwAwQxar/pw?=
	=?us-ascii?Q?CiIIfyZ8HS3xXYptiOWp3OhWBBNbkcW8O4FcEk49YTq7/QjODLJA5vJj7G5k?=
	=?us-ascii?Q?SXH/5niN3JuypcE6mVSaESQisj6IRIaaVKN/yWHExN2GRjxVRSInLt8NiQLP?=
	=?us-ascii?Q?C08EdyDwhE3/CkF9GXlrxwct4Ny78AX5IgYEebWG+QbLNZCDVTHgEmELu8Dm?=
	=?us-ascii?Q?onGW6F58qk+SrndUFRyew4HTzjhgxSsuMPCfyfp50nGCtVsdfhPbJQQl8OzK?=
	=?us-ascii?Q?2brIXZL+Qd5DNpMTTZ7eVrRLlWewFVae1aMABNI2E4gf5YDk9DQbwdqcc0VG?=
	=?us-ascii?Q?iaHmnZjYOrKkeMqVfOiJwyyCeQynz7G87MQ2wlhEIdYxjWJ+2PKzik1kZnqZ?=
	=?us-ascii?Q?p35PrdSD0HmeGbQjvWxu1yfCaMydz8Gu/exOpyp0N4uuLaUJPrJOFGxYAJtY?=
	=?us-ascii?Q?9f0DgWq1c84HRGxqoymWQnqsAiv/mG8cPbkmg8WupriTljt4ENMXV1PmYjBQ?=
	=?us-ascii?Q?9FTM0xmFT+5btqhLYZKyyeows0S3mVfD4ahpNJcmF0HqZFv4ZPqPbPUd/5NF?=
	=?us-ascii?Q?yBZyEFWfpnJRRI6BUIeI0IWCOy8alu4Ry3SpE/q3Xmh8kRW+wVZ/lQM4cEEd?=
	=?us-ascii?Q?0j+e5/EmksYJ/G43rJ1zVKe1z6Q9Io/hayu+joj1jvttIL1pmlV8Vf83272I?=
	=?us-ascii?Q?r5UqFEbecI0tTygUDy3RWhYf5hhvTDwxW30?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: aH0UTI1q1vl+Wt5QUqmo9fX3DtnEqIZoEKgeA8O0Ec+Zwib7Iw7mnasHaxpXDJL49LEgif/1hslEL4JfBgYx3bC6lcNc/NfnJsLHhxKnClCErypXLV4uiTA7HWS7bxVchYBvCLmgLa/Nu1TvGCsrXeKDtNsX/mfMghRgIQgDpLmfWNzXnzaTqTxHgaYTMVMXm509VdNafIHyGvwn2v9FkXJk+QNU95kF28nrDqyVSw1XkH/ylHcaPfAvX7OV4lWQVT3a2OBXMMQ8i1fP1Cd43jctM/c6YSWFMHXR3ULKuj1wBpAPkFGKOat64uE0e7ScxeZd2EKxvwLqQdo36iCgBCH5zT35woqlQGCecmphVmSo8ytmM3qlVLuXvvlTjmd3qgpOdgJMpTeejTJkkPJlSN8bQcQIg9YXMUBdNctMl0k=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2019 01:30:35.1268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb8ec37-23be-4e8a-8994-08d6a041002e
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB2675
Subject: [meta-networking][PATCH v3] firewalld: add new recipe
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
X-List-Received-Date: Mon, 04 Mar 2019 10:00:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 ...a-separate-directory-outside-the-sou.patch | 77 +++++++++++++++++
 .../firewalld/files/firewalld.init            | 48 +++++++++++
 .../firewalld/firewalld_0.6.3.bb              | 84 +++++++++++++++++++
 3 files changed, 209 insertions(+)
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
index 000000000..e999fa7a5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
@@ -0,0 +1,84 @@
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
+PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_unitdir}/system/,--disable-systemd"
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
+SYSTEMD_SERVICE = "firewalld.service"
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


