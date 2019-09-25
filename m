Return-Path: <danc@opengear.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
	by mail.openembedded.org (Postfix) with ESMTP id 678547E21C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:35:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dBtP+Y+LkmKKJ9dD0VTWshnwd8AubpxOvO0Uv9gNgRS5F+JfeBL9kwhSEcs5/oTyhItoPZmVWhcT5ro+EpZJIFzdBt+zUDKqhs5jtGdIkN8su7yfkhVrTxagVV2klfgXXUw013G4eepwcMrczLMt8XsaMMBNJmUcRXyDhC/Tq3KIGxfPqiXRrEoqXL2ik5E5oKNYg1TCgX5xCzRnHVBPU8aXQvZkjVOQfUECJSy5TgMRaw1WJ8shurxIFBzYvHyDHISgcpBCB0witcmwmy8D6+hQkVEzPt+TV3yWn3yMjz2YqgTpn/Cf1iTMBXATJJ5fysQADKrsdt4NUhKikZic+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9CP7pAVySJGphg8HsWv8wY3JmiRpqnSMa7GxfovIV3w=;
	b=XhQox+AAB6Gq/2fqd5mNSrPwhZHaGlLFdQl2yJVw5f+F9yZNLjuD/et/mgmyVcs6ovnVUsnLy4Xwh7K/eCTSRkwqB9DSsEk3bZH03I5Rx26J2lfbdCAOYShhO4ov5o5pHasnA5EesrwfuXgUQu4ir3xuwvjD4FlkCV5+E1JafXCAGrp1c+gwWVS6izu0XiCA79jH8xTQVCMuWm9YBb8NjUw1OT4IXGWXlRcz/tak0rQZV9MlVk1VfkOa30+tAthTg+Yy3UstYuMgA+HAbsFqwgCDtV7NALJ7nlwqAGhfwPJCLoUffJ51Rizt2nhNxTpUWFQfmNy6fIo4a7JtphA1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9CP7pAVySJGphg8HsWv8wY3JmiRpqnSMa7GxfovIV3w=;
	b=KtqMN7jhqqLVaEJWygLk29lmG+VCoPhtmJTeFhEfxaMpMV59relbLE4iTZEz74NaOTreRKZGpH5/RUpVszZArXr5ANFoVzSyNNYv2Bg7O0bQZXeUfOJeqFJgozuoDvbGAX1AEP1Qaqq84WqI2tLMGWvDhyylqg3epkxz2Nvu4R4=
Received: from CO1PR15CA0096.namprd15.prod.outlook.com (2603:10b6:101:21::16)
	by SN6PR15MB2304.namprd15.prod.outlook.com (2603:10b6:805:23::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25;
	Wed, 25 Sep 2019 07:35:59 +0000
Received: from CO1NAM04FT052.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::201) by CO1PR15CA0096.outlook.office365.com
	(2603:10b6:101:21::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via
	Frontend Transport; Wed, 25 Sep 2019 07:35:58 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT052.mail.protection.outlook.com (10.152.91.24) with Microsoft
	SMTP Server id 15.20.2284.20 via Frontend Transport;
	Wed, 25 Sep 2019 07:35:56 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id B5221E746A;
	Wed, 25 Sep 2019 17:35:53 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 9800F42965A9; Wed, 25 Sep 2019 17:35:53 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Sep 2019 17:35:51 +1000
Message-Id: <20190925073551.8311-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(39840400004)(136003)(346002)(376002)(448002)(199004)(189003)(42186006)(14444005)(36906005)(316002)(70586007)(2351001)(2361001)(76130400001)(486006)(26005)(48376002)(6306002)(186003)(50226002)(7636002)(7110500001)(4326008)(15650500001)(2420400007)(305945005)(478600001)(26826003)(36756003)(70206006)(50466002)(8676002)(107886003)(103686004)(6266002)(5660300002)(51416003)(44832011)(8936002)(6916009)(2906002)(476003)(126002)(1076003)(426003)(2870700001)(356004)(47776003)(336012)(2616005)(246002)(562404015)(19607625011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR15MB2304;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd33e9d0-a201-42ed-4576-08d7418b0118
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328);
	SRVR:SN6PR15MB2304; 
X-MS-TrafficTypeDiagnostic: SN6PR15MB2304:|SN6PR15MB2304:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR15MB230483FCE5023A5AB75F3A4CB8870@SN6PR15MB2304.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01713B2841
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xRn6doMni6oSycLDZIlxTr7e5a64IKt92Ny4Vd5q8sWHQctpJ3jMvvk9GEUlWYCIBiJ0C0T3RSX9YzSLSsZ3XfgSbOvBn80bwGqv+2Zu8pZqtHhKJVNQATX4XnqTmg84wxBmzGDJXnqyqlM00RBs60BEUqNm8PHSBmi+X5RESSxztv0MdkFGs2NO/JbBVDjSn3ixr5YhABim6PQcwo/GTOCTYqmqVPFE2ll+9Ep1CbSkh+eye8PNVXdD6b02ScIVA4eLEj6FjV3vaWDt3H0UCUEiweQTQjiP8jq9ovLliosrkasaEBfYztUZoQmAeM79gmXk86nuHcUhmkua4WhMqxBf4l9jbMLDIB5I7bQgY3jorxnTJdlFB6SeZE6FBHE4LbC36ctFiejFMsbidyWejeBnnqM6S0XhFX5NEXanMBAQfX5/Veel3P/elLEVf3uKGtaKi51JOwDJEAL7XQAqBw==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2019 07:35:56.6408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd33e9d0-a201-42ed-4576-08d7418b0118
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2304
Subject: [meta-networking][PATCH] firewalld: update to 0.7.1
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
X-List-Received-Date: Wed, 25 Sep 2019 07:35:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

---
 ...a-separate-directory-outside-the-sou.patch | 68 -------------------
 ...{firewalld_0.6.4.bb => firewalld_0.7.1.bb} | 13 ++--
 2 files changed, 8 insertions(+), 73 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.6.4.bb => firewalld_0.7.1.bb} (88%)

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
similarity index 88%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
index 5955072f1..15567f636 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.7.1.bb
@@ -5,11 +5,10 @@ LICENSE = "GPLv2+"
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
@@ -18,7 +17,9 @@ DEPENDS = "intltool-native glib-2.0-native libxslt-native docbook-xsl-stylesheet
 inherit gettext autotools bash-completion python3native gsettings systemd update-rc.d
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_unitdir}/system/,--disable-systemd"
+PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd"
+
+PACKAGES += "${PN}-zsh-completion"
 
 # iptables, ip6tables, ebtables, and ipset *should* be unnecessary
 # when the nftables backend is available, because nftables supersedes all of them.
@@ -39,7 +40,7 @@ EXTRA_OECONF = "\
 "
 
 INITSCRIPT_NAME = "firewalld"
-SYSTEMD_SERVICE = "firewalld.service"
+SYSTEMD_SERVICE_${PN} = "firewalld.service"
 
 do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -64,9 +65,11 @@ do_install_append() {
 
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


