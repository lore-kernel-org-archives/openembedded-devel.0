Return-Path: <danc@opengear.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8E92B7ED16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 00:28:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=aS6I07p08HezUS4wB6xBLm7mqVu4SUH7VIUgFu0OkRVHKkZ+qGrIeYOefOZ1T0r50J06fzC0OJ7/GOtEF3uLesmaeaN6cI956XYr7HV0Qc9XD8+iEX6HnK4Te9tnvhL8KmN8oWuS77uHojwnHdqa+ww9jO+NLaIPk6N7W6bec/AmpPmW1AzR8l38lGFi/sLzRYNl1so/B7gXODIlp+8PEsdlaqmX0ykjZzuDofdUSlCH3mNS6Nqk/lHo2hIEoJIiHknactlJGSPkC3q20KekLyM4WSQG/41I5xuibMidMrmE7D2vDTiozQ6nW9Du+Mesbb0QUvD/8xcQ6spg0cF3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G5KgcIhsIsh/NacsoZzvPYo/W97bAy8ocTCfxkmMa7o=;
	b=Br/rAEljM0ThNbCTpT7ULPFF8O5HDHOuZgQ81pkfaR4f/+BGUz42AfO/Qov1PCnYe3LKLmKgdSjqm2LvWpL8dG5YlnTHFlaTEm2gEPzvcO6Rz0sL4aDaj6V0jCiGkwXxAt85iUUcF+FEbA/v88fwJgFB8RoRt5F395Lt/3Js9Beu1mP+z1Jr9u+4HlMpsFJ1RYhILj5uGd5siPfhGoiv30xGD/0Jgn+HnrNY4nyz4shbwtIHtewfB0uK7SY+Ve9h2bQWyKVLacS1pKNVhmonsFYIZsjzG52F6AZTspFs07w++2JXGYhijIF90oajUBnhVFww97XCabgNMIyIPYrcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G5KgcIhsIsh/NacsoZzvPYo/W97bAy8ocTCfxkmMa7o=;
	b=iE+zsh6M8IKTTomt4KRd0gQ1PWrupviCXH6UMiVousIE3BLU8BFYwAWnBTRLwINluDcqGx0+pn/boK7j6Ze7mTf9EEpYFBqvCMMk4NQiWHmVku5ckRE2OMGrIv5dz2GPRIMuNXrqw8Sb94SCuXUz4F+biK02HEG3zd3soT3JvW8=
Received: from SN6PR1501CA0013.namprd15.prod.outlook.com (2603:10b6:805::26)
	by SN6PR15MB2301.namprd15.prod.outlook.com (2603:10b6:805:23::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.15;
	Mon, 16 Sep 2019 00:28:27 +0000
Received: from CO1NAM04FT036.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::202) by SN6PR1501CA0013.outlook.office365.com
	(2603:10b6:805::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17 via
	Frontend Transport; Mon, 16 Sep 2019 00:28:26 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT036.mail.protection.outlook.com (10.152.91.146) with
	Microsoft SMTP Server id 15.20.2263.14 via Frontend Transport;
	Mon, 16 Sep 2019 00:28:26 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id C66B9DFC5B;
	Mon, 16 Sep 2019 10:28:23 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id ABA6444A5606; Mon, 16 Sep 2019 10:28:23 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 10:28:11 +1000
Message-Id: <20190916002811.25348-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(39830400003)(136003)(376002)(396003)(448002)(189003)(199004)(2870700001)(7636002)(6266002)(14444005)(246002)(8676002)(305945005)(36906005)(8936002)(107886003)(316002)(42186006)(51416003)(356004)(6666004)(2361001)(103686004)(50226002)(186003)(52956003)(26005)(426003)(336012)(76130400001)(36756003)(5660300002)(47776003)(2616005)(2351001)(4326008)(1076003)(70586007)(70206006)(44832011)(486006)(126002)(476003)(6916009)(478600001)(50466002)(48376002)(26826003)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR15MB2301;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d96113c-d60a-40f6-880b-08d73a3cca65
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:SN6PR15MB2301; 
X-MS-TrafficTypeDiagnostic: SN6PR15MB2301:|SN6PR15MB2301:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR15MB23013B5DEC07A30E5280B9CBB88C0@SN6PR15MB2301.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0162ACCC24
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 80WfaiDWNPMwlI0pzG1Jwra76ZPFKJu+pJdChne6J2i1cmakjnT8q+E8I4SQ4Ur3jr0VFOAzCT/hl4J2YWPfI4a2wz9beIcU3gpeBQIgeneQzjmcYncTPvlymcJHCtg+BZmQFLyXwA9OumESnzARyeJS3EBcpvDkRYqjG+P7hKg/hfae81vRidauPeVyaFfQzJlRzxA5vZcJpexxVZU7UCcHcs6SDwyYdyksvERfl8wevhP12ELc7NyKAP+uEaWuE3Gc5RMIRMCIGjH1wzTrHEZGh4nM3WBV9nMhfHS6X0KMtWH1tHRjbvnhe9XkM+FsGVR3fTdlazK+N9mE4QQgzSjJdae3vULMbetTDxkNbxmzGcApd7doaofdzNtc9pF5h7hhqMr6dtz1e2bc0tKB2RD10PHDOvY5CK3ZiwAEV64=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2019 00:28:26.0146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d96113c-d60a-40f6-880b-08d73a3cca65
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2301
Subject: [meta-oe][PATCH] lmsensors: add a PACKAGECONFIG for sensord
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
X-List-Received-Date: Mon, 16 Sep 2019 00:28:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We don't install the lmsensors-sensord subpackage in our images, but
our build process still has to build the subpackage and all its
dependencies, including rrdtool.

Adding a PACKAGECONFIG for sensord lets us entirely avoid building
rrdtool and its dependency chain, which reduces our image build process
by 141 tasks.
---
 .../lm_sensors/lmsensors-config_1.0.bb        | 23 +++++++----
 .../recipes-bsp/lm_sensors/lmsensors_3.5.0.bb | 41 ++++++++++++++-----
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
index b0091d657..b55bd5161 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
@@ -14,6 +14,9 @@ SRC_URI = "file://fancontrol \
 "
 S = "${WORKDIR}"
 
+PACKAGECONFIG ??= "sensord"
+PACKAGECONFIG[sensord] = ",,"
+
 RDEPENDS_${PN}-dev = ""
 
 do_install() {
@@ -25,27 +28,29 @@ do_install() {
     install -d ${D}${sysconfdir}/sensors.d
     install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
 
-    # Install sensord configuration file
-    install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
+    if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
+        # Install sensord configuration file
+        install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
 
-    # Install sensord.cgi script and create world-writable
-    # web-accessible sensord directory
-    install -d ${D}/www/pages/cgi-bin
-    install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
-    install -d -m a=rwxs ${D}/www/pages/sensord
+        # Install sensord.cgi script and create world-writable
+        # web-accessible sensord directory
+        install -d ${D}/www/pages/cgi-bin
+        install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
+        install -d -m a=rwxs ${D}/www/pages/sensord
+    fi
 }
 
 # libsensors configuration
 PACKAGES =+ "${PN}-libsensors"
 
 # sensord logging daemon configuration
-PACKAGES =+ "${PN}-sensord"
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)}"
 
 # fancontrol script configuration
 PACKAGES =+ "${PN}-fancontrol"
 
 # sensord web cgi support
-PACKAGES =+ "${PN}-cgi"
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-cgi', '', d)}"
 RRECOMMENDS_${PN}-cgi = "lighttpd lighttpd-module-cgi"
 RDEPENDS_${PN}-cgi = "${PN}-sensord rrdtool"
 FILES_${PN}-cgi = "/www/*"
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
index 585dc9481..ffafd17f8 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.5.0.bb
@@ -23,14 +23,26 @@ inherit update-rc.d systemd
 
 RDEPENDS_${PN}-dev = ""
 
-INITSCRIPT_PACKAGES = "${PN}-fancontrol ${PN}-sensord"
+PACKAGECONFIG ??= "sensord"
+PACKAGECONFIG[sensord] = "sensord,,rrdtool"
+
+INITSCRIPT_PACKAGES = "\
+    ${PN}-fancontrol \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
+    "
 INITSCRIPT_NAME_${PN}-fancontrol = "fancontrol"
 INITSCRIPT_NAME_${PN}-sensord = "sensord"
 INITSCRIPT_PARAMS_${PN}-fancontrol = "defaults 66"
 INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67"
 
-SYSTEMD_PACKAGES = "${PN}-sensord"
-SYSTEMD_SERVICE_${PN}-sensord = "sensord.service lm_sensors.service fancontrol.service"
+SYSTEMD_PACKAGES = "\
+    ${PN} \
+    ${PN}-fancontrol \
+    ${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord', '', d)} \
+    "
+SYSTEMD_SERVICE_${PN} = "lm_sensors.service"
+SYSTEMD_SERVICE_${PN}-fancontrol = "fancontrol.service"
+SYSTEMD_SERVICE_${PN}-sensord = "sensord.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 S = "${WORKDIR}/git"
@@ -46,13 +58,15 @@ do_compile() {
     sed -i -e 's/\$(LIBDIR)$/\$(LIBDIR) \$(LDFLAGS)/g' ${S}/Makefile
     sed -i -e 's/\$(LIBSHSONAME) -o/$(LIBSHSONAME) \$(LDFLAGS) -o/g' \
                 ${S}/lib/Module.mk
-    oe_runmake user PROG_EXTRA="sensors sensord"
+    oe_runmake user PROG_EXTRA="sensors ${PACKAGECONFIG_CONFARGS}"
 }
 
 do_install() {
     oe_runmake user_install DESTDIR=${D}
-    install -m 0755 ${S}/prog/sensord/sensord ${D}${sbindir}
-    install -m 0644 ${S}/prog/sensord/sensord.8 ${D}${mandir}/man8
+    if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
+        install -m 0755 ${S}/prog/sensord/sensord ${D}${sbindir}
+        install -m 0644 ${S}/prog/sensord/sensord.8 ${D}${mandir}/man8
+    fi
 
     # Install directory
     install -d ${D}${INIT_D_DIR}
@@ -60,12 +74,17 @@ do_install() {
     # Install fancontrol init script
     install -m 0755 ${WORKDIR}/fancontrol.init ${D}${INIT_D_DIR}/fancontrol
 
-    # Install sensord init script
-    install -m 0755 ${WORKDIR}/sensord.init ${D}${INIT_D_DIR}/sensord
+    if ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
+        # Install sensord init script
+        install -m 0755 ${WORKDIR}/sensord.init ${D}${INIT_D_DIR}/sensord
+    fi
 
     # Insall sensord service script
-    install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${S}/prog/init/*.service ${D}${systemd_system_unitdir}
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${S}/prog/init/*.service ${D}${systemd_unitdir}/system
+    if ! ${@bb.utils.contains('PACKAGECONFIG', 'sensord', 'true', 'false', d)}; then
+        rm ${D}${systemd_system_unitdir}/sensord.service
+    fi
 }
 
 RPROVIDES_${PN}-dbg += "${PN}-libsensors-dbg ${PN}-sensors-dbg ${PN}-sensord-dbg ${PN}-isatools-dbg"
@@ -89,7 +108,7 @@ PACKAGES =+ "${PN}-libsensors ${PN}-libsensors-dev ${PN}-libsensors-staticdev ${
 PACKAGES =+ "${PN}-sensors ${PN}-sensors-doc"
 
 # sensord logging daemon
-PACKAGES =+ "${PN}-sensord ${PN}-sensord-doc"
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'sensord', '${PN}-sensord ${PN}-sensord-doc', '', d)}"
 
 # fancontrol script
 PACKAGES =+ "${PN}-fancontrol ${PN}-fancontrol-doc"
-- 
2.20.1


