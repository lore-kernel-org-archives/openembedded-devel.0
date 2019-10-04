Return-Path: <danc@opengear.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 641037F26C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 03:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=HhZrK1+Cky/IT6WC5H+Nq5NVSf+29+CLPO9EQYzNkdYcXFNAk9PVG5gTeCl6ZRgn0TCh16JXVDaACSOdEHUsaTvEAaOiHACMPgWID8P0NIvoy0hOV9Jc4xCwu5eerXYe8/oqFTzvDbAhxXm/e4Vjl/kATL6JSU2RMa+Ax4R0Nq6581+Yv8B/+Q8eNcWHDwBalhomE3Qbk1D+9DUF85mj2yvQOVt9g6mdkyaTDbSMc9bDSpl8rU9u0rBxlMEySo42setUH3gblnAvQoPf4OX9EOXas+RsSt0W399uB9z7lk/umHBIWlwxn/1tlHy0f8TjzZa7vmurodLBcDxWXIdk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bMU3X/RZAVOCyzvSmSn0Kr8z5O+CNemOP8VLCDMf1Nw=;
	b=cKE/ZIbqdEYgtnoxS2Z1bpR/J2pRCHLJ3bb4tkemzOpbAYbuWNf3KgtBHEfyqKaDcVqS96mQFTDjrg3M/VeByslj97a7FSwErrOnBw0VupaAtpzCOnCbdEHKhyG9q2wgboTNDIL6TGlrH7XsjfAAQNTV/KgQDf0+HfhklPQMMrXMMP/F0Jw8GRZ+lrJLHuCyBmj1SgMJ4yEJDqZLoGUpOh0CTH7tsb98S/+CRTCgTAzQaaNUZZMRE1TzbKXKMH+75d9muaTLhsDAR5jQ+MjWQD+Wz788mY2DzSZd/V+2izwoUkXOQgPW6eVendUHpR/fjPDynFx4qVv9seM+Fw7pYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bMU3X/RZAVOCyzvSmSn0Kr8z5O+CNemOP8VLCDMf1Nw=;
	b=pmWw38uIKjatyVfJBPui5EM9nAbJ2bpF2+FKk/lbM9ahXVRKd2yo0oByHsAanNwmfWcK9SB8ySEpJ/0XnMfGG4Ln1I9mzMrMB9JEZaJjZTspOYiSfFwLdOhYQfad+vYKiail8Rn4yNMWUVeLXolis+GOmZTkw1aTC8EEbe6iyNk=
Received: from SN6PR15CA0002.namprd15.prod.outlook.com (2603:10b6:805:16::15)
	by BN7PR15MB2258.namprd15.prod.outlook.com (2603:10b6:406:83::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20;
	Fri, 4 Oct 2019 03:12:34 +0000
Received: from SN1NAM04FT050.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::206) by SN6PR15CA0002.outlook.office365.com
	(2603:10b6:805:16::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.15 via
	Frontend Transport; Fri, 4 Oct 2019 03:12:34 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT050.mail.protection.outlook.com (10.152.89.157) with
	Microsoft SMTP
	Server id 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 03:12:33
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id CA1B7E95C9;
	Fri,  4 Oct 2019 13:12:30 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id B9CBD42965A9; Fri,  4 Oct 2019 13:12:30 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Oct 2019 13:12:26 +1000
Message-Id: <20191004031226.30034-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAMKF1srXJ6OA4sUCqJVOoAC7inNGS38UwWgY7TAdEPdMdj5nJg@mail.gmail.com>
References: <CAMKF1srXJ6OA4sUCqJVOoAC7inNGS38UwWgY7TAdEPdMdj5nJg@mail.gmail.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39840400004)(448002)(189003)(199004)(356004)(6666004)(51416003)(14444005)(7110500001)(76130400001)(70206006)(426003)(5660300002)(2906002)(1076003)(44832011)(36906005)(336012)(42186006)(486006)(316002)(476003)(103686004)(70586007)(15650500001)(2420400007)(36756003)(126002)(8676002)(26005)(446003)(26826003)(8936002)(2870700001)(478600001)(47776003)(246002)(2351001)(305945005)(7636002)(186003)(6916009)(76176011)(6266002)(11346002)(107886003)(48376002)(4326008)(2361001)(50466002)(6306002)(50226002)(2616005)(562404015)(19607625011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR15MB2258;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 288a1484-b4e8-497d-3f21-08d74878b36c
X-MS-TrafficTypeDiagnostic: BN7PR15MB2258:|BN7PR15MB2258:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR15MB225821F19AFD8527A217A855B89E0@BN7PR15MB2258.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtKRW2EsvRmddCU9gbXVFfoDRzDdEMHpOV8YCAEuND4WZyAtyTHvpDIUw7JaSnXzugGeuR8IwNMgBmdpugg9iBhvnSA0MmKu6g92ev2IDUOqT+j1yRFC7DOkf1a34rqfCSovR0I8uL2JFDHSpkHiclpMluhz6EWNC/mUwdeCTlldzKV/bge1o2MfJOM3vGPYtdn+zjWtLJoGvT8o+MsEmCpqH71PBQ4wSom7961Xg1k+n39ZSBDev//xWaWOdTny0H9eDNI9+ziGFjYCp11Pr4bpIwwZihTix/v++Q++C2VGsAuRx+Thbk0KCa+6LUy+Svs8LpOAyCTOIcZ5yXRFu8WQCDA5Hvsv6P0RTvoJxvFfeb34mLsMUwSLAxBFO2rY8g9sL6ABKsF5f5cRU5gdutnusMz9miLPuzITGarcYu4+R1ovCJ8G8sGhEQSck20aGprew1eg0rIf+SPFVHBhdg==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 03:12:33.5642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288a1484-b4e8-497d-3f21-08d74878b36c
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2258
Subject: [meta-networking][PATCH v3] firewalld: update to 0.7.1
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
X-List-Received-Date: Fri, 04 Oct 2019 03:12:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 ...a-separate-directory-outside-the-sou.patch | 68 -------------------
 ...{firewalld_0.6.4.bb => firewalld_0.7.1.bb} | 17 +++--
 2 files changed, 10 insertions(+), 75 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.6.4.bb => firewalld_0.7.1.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
deleted file mode 100644
index 28d590242..000000000
--- a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-firewalld: fix building in a separate directory outside the source tree
-
-Upstream-Status: Accepted [https://github.com/firewalld/firewalld/pull/456]
-Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
-
---- a/config/Makefile.am
-+++ b/config/Makefile.am
-@@ -377,11 +377,11 @@ install-config:
- 	$(MKDIR_P) $(DESTDIR)$(sconfdir)/zones
- 	$(MKDIR_P) $(DESTDIR)$(sconfdir)/helpers
- 	$(MKDIR_P) $(DESTDIR)$(prefixlibdir)
--	cp -r icmptypes $(DESTDIR)$(prefixlibdir)
--	cp -r ipsets $(DESTDIR)$(prefixlibdir)
--	cp -r services $(DESTDIR)$(prefixlibdir)
--	cp -r zones $(DESTDIR)$(prefixlibdir)
--	cp -r helpers $(DESTDIR)$(prefixlibdir)
-+	cp -r $(srcdir)/icmptypes $(DESTDIR)$(prefixlibdir)
-+	cp -r $(srcdir)/ipsets $(DESTDIR)$(prefixlibdir)
-+	cp -r $(srcdir)/services $(DESTDIR)$(prefixlibdir)
-+	cp -r $(srcdir)/zones $(DESTDIR)$(prefixlibdir)
-+	cp -r $(srcdir)/helpers $(DESTDIR)$(prefixlibdir)
- 
- uninstall-config:
- 	rmdir $(DESTDIR)$(sconfdir)/icmptypes
---- a/doc/xml/Makefile.am
-+++ b/doc/xml/Makefile.am
-@@ -69,7 +69,8 @@ edit = sed \
- 	-e 's|\@PREFIX\@|$(prefix)|' \
- 	-e 's|\@SYSCONFDIR\@|$(sysconfdir)|' \
- 	-e 's|\@PACKAGE_STRING\@|$(PACKAGE_STRING)|' \
--	-e 's|\@IFCFGDIR\@|$(IFCFGDIR)|'
-+	-e 's|\@IFCFGDIR\@|$(IFCFGDIR)|' \
-+	-e 's|@SRCDIR@|$(srcdir)|'
- 
- transform-man.xsl: transform-man.xsl.in
- 	$(edit) $< >$@
---- a/doc/xml/firewall-cmd.xml.in
-+++ b/doc/xml/firewall-cmd.xml.in
-@@ -1,10 +1,10 @@
- <?xml version="1.0" encoding="utf-8"?>
- <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
- [
--<!ENTITY authors SYSTEM "authors.xml">
--<!ENTITY seealso SYSTEM "seealso.xml">
--<!ENTITY notes SYSTEM "notes.xml">
--<!ENTITY errorcodes SYSTEM "errorcodes.xml">
-+<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
-+<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
-+<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
-+<!ENTITY errorcodes SYSTEM "@SRCDIR@/errorcodes.xml">
- ]>
- 
- <!--
---- a/doc/xml/firewalld.xml.in
-+++ b/doc/xml/firewalld.xml.in
-@@ -1,9 +1,9 @@
- <?xml version="1.0" encoding="utf-8"?>
- <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
- [
--<!ENTITY authors SYSTEM "authors.xml">
--<!ENTITY seealso SYSTEM "seealso.xml">
--<!ENTITY notes SYSTEM "notes.xml">
-+<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
-+<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
-+<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
- ]>
- 
- <!--
diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
index d9d5cad75..fab27f1ee 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
@@ -6,20 +6,20 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
-           file://0001-fix-building-in-a-separate-directory-outside-the-sou.patch \
            file://firewalld.init \
 "
-SRC_URI[md5sum] = "e63bdd65a4d2f6338f60b31e91bb5525"
-SRC_URI[sha256sum] = "5a82a72fd9ad4cbbfb805bae615faa9b91a27855245de0fef3bcb06439394852"
+SRC_URI[md5sum] = "32c16df3f6cc859d0df627baf5ee8401"
+SRC_URI[sha256sum] = "88bc63a011209ac046fb5d7bfc73ddcc0bc616ddf3013bbb6bf1a421cb497f76"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
-# xmlto-native is needed to populate /etc/xml/catalog.xml in the sysroot so that xsltproc finds the docbook xslt
-DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheets-native xmlto-native"
+DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheets-native"
 
 inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_unitdir}/system/,--disable-systemd"
+PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd"
+
+PACKAGES += "${PN}-zsh-completion"
 
 # iptables, ip6tables, ebtables, and ipset *should* be unnecessary
 # when the nftables backend is available, because nftables supersedes all of them.
@@ -37,10 +37,11 @@ EXTRA_OECONF = "\
     --without-ebtables \
     --without-ebtables-restore \
     --disable-sysconfig \
+    --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog \
 "
 
 INITSCRIPT_NAME = "firewalld"
-SYSTEMD_SERVICE = "firewalld.service"
+SYSTEMD_SERVICE_${PN} = "firewalld.service"
 
 do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -65,9 +66,11 @@ do_install_append() {
 
 FILES_${PN} += "\
     ${PYTHON_SITEPACKAGES_DIR}/firewall \
+    ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
     ${datadir}/metainfo \
 "
+FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 RDEPENDS_${PN} = "\
     nftables \
-- 
2.20.1


