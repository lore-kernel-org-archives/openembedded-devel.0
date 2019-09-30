Return-Path: <danc@opengear.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760048.outbound.protection.outlook.com [40.107.76.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0C16A7ED40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 22:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=csi2b/uLHwzw8hB6ZR37uDK+DEe9rJl9975z2tMQKpZ6ebESNIUQ7rO7cE/BFPJ3xXai7+cSqy60R5S5W240oNZ+YrhEjeHeLebf/Yq58rMHCuoD+gAg0sJcO0jrh7b+n9+IPfE7Ij6NO7A1JwrmznSQfUP7V0sCMCcq97Egov/lSUkD3bNED0iFtlqcdvQQfynPp4oqOXENSKaAHxrCHn8wxUbpXeSZyMk+pg2a844KCq4a9PPzUOc66QwH1e4jkTrSmti8wfEF0ONkyMmS1+jW1iNnT/9IFEHWs0639GyFWFTCfK9I75+m0m16eGzIyd1DcCrY1+FvgtpeFEwiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I5CySu+Laq8VUWK7QEynArE/j/MOLwBxkHqtsu9h3PY=;
	b=IwgMUrMCXPETp2wTczB0k/FgBHKd8w13Kx37bhuAQYpK2bfV0nREzvR1lCeRo0iy3nXN2UdARE+plLCt665J2+h+xcYy6MefjEkp5O1a/TK03kHuejuHa4E0VG80Mj7Fb4VMzJjVFU1VasxqbpRZ1Jrt3j3c0ORZWyMw+3D726WgPQ/rWjgdtHa7tpUGI+hQZVQERBn7B4cK88st6vzzmfSaO/x/gnHU760kH6UmdNUFBAnAi3aBomLcBmztBdL8S1RvGtXZcT2Ri47icq/etSSZHqSTQEkKVcd28mKT9GGrscAUvFldG8CpdDBPX4SbXNuH/qaFEUcAccRi1dtTxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I5CySu+Laq8VUWK7QEynArE/j/MOLwBxkHqtsu9h3PY=;
	b=OXTaZXJ8Yq7d7r3krgMegmp4mkAuJ7ki+dgmdg0SN7wW5RIBtwFrxY0H5zVCTAyWo3froHOO4NuM93AaHHW6ASa0YL0s0WRMCSuQFWmCHXooNAILHHB472lFCz0GTNWnnKzqbv/0gUeODWwC3itfQv5656cYZgbM0uLR1RGcNww=
Received: from DM5PR15CA0036.namprd15.prod.outlook.com (2603:10b6:4:4b::22) by
	CH2PR15MB3654.namprd15.prod.outlook.com (2603:10b6:610:e::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Mon, 30 Sep 2019 22:11:36 +0000
Received: from SN1NAM04FT030.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::205) by DM5PR15CA0036.outlook.office365.com
	(2603:10b6:4:4b::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via
	Frontend Transport; Mon, 30 Sep 2019 22:11:35 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT030.mail.protection.outlook.com (10.152.88.150) with
	Microsoft SMTP Server id 15.20.2305.15 via Frontend Transport;
	Mon, 30 Sep 2019 22:11:35 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 33701DEB09;
	Tue,  1 Oct 2019 08:11:33 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 1134C40EA957; Tue,  1 Oct 2019 08:11:33 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Oct 2019 08:11:19 +1000
Message-Id: <20190930221119.30225-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAMKF1sqbBYpZn9a8CnG8Nc+4PWXTtGCZFEes=Ntxzq9_VZt==Q@mail.gmail.com>
References: <CAMKF1sqbBYpZn9a8CnG8Nc+4PWXTtGCZFEes=Ntxzq9_VZt==Q@mail.gmail.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(376002)(39840400004)(346002)(396003)(448002)(189003)(199004)(336012)(103686004)(2420400007)(47776003)(15650500001)(1076003)(2870700001)(7110500001)(50226002)(44832011)(426003)(6306002)(486006)(6916009)(446003)(126002)(476003)(11346002)(2616005)(14444005)(50466002)(26826003)(6266002)(76130400001)(107886003)(5660300002)(8936002)(36906005)(48376002)(4326008)(186003)(6666004)(26005)(478600001)(2351001)(42186006)(70586007)(76176011)(246002)(70206006)(2361001)(7636002)(305945005)(8676002)(356004)(36756003)(316002)(51416003)(2906002)(562404015)(19607625011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR15MB3654;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5870b28f-4181-4b88-7218-08d745f3289c
X-MS-TrafficTypeDiagnostic: CH2PR15MB3654:|CH2PR15MB3654:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR15MB3654A33CD3B64A2074DE9AC7B8820@CH2PR15MB3654.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUXWA8Fivf+q2tBK59QjJK4zjEX+y5lGniscV0EfqEMrJhDdfEQ3gyWmN18oc1ALEQm4r7Jug75xc6oNtAOyqlAvkvBhLFh/Ud7gqgYpJf1eapTb+pGQUOgCUsZMK0uEBAO/IrcTf7OIuGHS5DtPZjPG4KmaHVoSAfxxXT757zMMI77Qc4mrmEGd6ogtWssbs58gTKGw6H3l6H5stl3U6eEU89OmtQ642aJsMu+ffpD9mtAsbDb7mviqBUmZ1rOzHVM8eiglFyB4nR/TkE/Hkc9gD1AoYkk4XM39jsnMBtz9ilIBivtRU0162XkzWgyOOwQ8aQ6KbUa4WQPmQT4WDYte3uK32KyPlAneYrlX8338Rs1PrXXc4plCSdKKkLc6/IL2AKS6FLYrySjLg3iUSSxctkwyXTI5HEdNdl4CERQVnv9l3inmDrcj4hG4ZFXZv4UYZxOIgVHoukCC/SdazA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 22:11:35.2852 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5870b28f-4181-4b88-7218-08d745f3289c
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3654
Subject: [meta-networking][PATCH v2] firewalld: update to 0.7.1
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
X-List-Received-Date: Mon, 30 Sep 2019 22:11:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 ...a-separate-directory-outside-the-sou.patch | 68 -------------------
 ...{firewalld_0.6.4.bb => firewalld_0.7.1.bb} | 14 ++--
 2 files changed, 9 insertions(+), 73 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.6.4.bb => firewalld_0.7.1.bb} (87%)

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
similarity index 87%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
index d9d5cad75..ad11ec5c3 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
@@ -6,11 +6,10 @@ LICENSE = "GPLv2+"
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
 # xmlto-native is needed to populate /etc/xml/catalog.xml in the sysroot so that xsltproc finds the docbook xslt
@@ -19,7 +18,9 @@ DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheet
 inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_unitdir}/system/,--disable-systemd"
+PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd"
+
+PACKAGES += "${PN}-zsh-completion"
 
 # iptables, ip6tables, ebtables, and ipset *should* be unnecessary
 # when the nftables backend is available, because nftables supersedes all of them.
@@ -37,10 +38,11 @@ EXTRA_OECONF = "\
     --without-ebtables \
     --without-ebtables-restore \
     --disable-sysconfig \
+    --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml \
 "
 
 INITSCRIPT_NAME = "firewalld"
-SYSTEMD_SERVICE = "firewalld.service"
+SYSTEMD_SERVICE_${PN} = "firewalld.service"
 
 do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -65,9 +67,11 @@ do_install_append() {
 
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


