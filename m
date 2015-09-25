Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0137.outbound.protection.outlook.com [157.56.110.137])
	by mail.openembedded.org (Postfix) with ESMTP id ADEE176FF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 10:36:57 +0000 (UTC)
Received: from BLUPR03CA002.namprd03.prod.outlook.com (10.255.124.19) by
	BN3PR03MB1368.namprd03.prod.outlook.com (10.163.34.154) with Microsoft
	SMTP Server (TLS) id 15.1.274.16; Fri, 25 Sep 2015 10:03:46 +0000
Received: from BY2FFO11FD045.protection.gbl (10.255.124.4) by
	BLUPR03CA002.outlook.office365.com (10.255.124.19) with Microsoft SMTP
	Server (TLS) id 15.1.280.20 via Frontend Transport;
	Fri, 25 Sep 2015 10:03:46 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD045.mail.protection.outlook.com (10.1.15.177) with Microsoft
	SMTP Server (TLS) id 15.1.274.4 via Frontend Transport;
	Fri, 25 Sep 2015 10:03:46 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t8PA3h0X013404; Fri, 25 Sep 2015 03:03:44 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Sep 2015 18:08:32 +0800
Message-ID: <1443175712-28134-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 2.4.3
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD045;
	1:CMSahsdls1mofYboVnN8pI6QSSd8ovM9w9QYoSwrySOiqRsxbllNmoW0T2pqN4qYfTSNDtIkx1VIu69CKn89liBe2QiUzm13bwYUL+eLPL2WGLJZIIr3usbiXxQ0eb+dNc9kkKQwysVEuAlaaUrcrm0UaULifJVLn/pD47R+5JeJVgwpVLjyVR8628C8gDx04+iAZAFkmZHCS/PaYScZOMqYUDYgr1mn19yLabzd6+Y5V4Xj8mn4LzQkXzZ1Nx6fuYO5UG7zDTNCaA9TXHtGdYpAO+CCJAk+JRQ/lGCGR9wtiF0PqVo5JTWglK7AQNoTJEwC2H9fPdgfIDbWHrC9xGIw51ze3EWliPcgjiN5NehYVd8wbv4qmRCaQrW5fQHdgLqnjHp+alygRqmKlawRhg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(6806005)(86362001)(36756003)(5007970100001)(189998001)(50986999)(50466002)(47776003)(110136002)(92566002)(46102003)(48376002)(107886002)(5001960100002)(87936001)(106466001)(81156007)(68736005)(104016004)(85426001)(97736004)(5003940100001)(77156002)(77096005)(62966003)(450100001)(19580395003)(229853001)(19580405001)(11100500001)(105606002)(64706001)(50226001)(5001860100001)(33646002)(5001830100001)(2351001)(4001540100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1368;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1368;
	2:L1H1VNgdYqpwa1i/WGAgpEsIqtbAcPkSNLtcnmHa613UPku5JVzz/Plf9Mdh0Ekp2MvbLLfa1gl57v193dPQTUJJbriKTpR44sFo68ZD+sMReHJXchotfG5BvORbmhG5H01ihKkLdTfm43grpFynrEuGINxUFctiHvY6syPWw0w=;
	3:IBZL994+YFpCB+HOe103yLw6l9XQUzQd6MAu7XAM6TyMw+3cHLNGI0e1cM74nIL/JrpVeGg3pUuvMqtTNARn3njm+Q4E6o6Vf95dCJS5dJjFJBEH6qkoIu44Nbe+K+h6qogDVnnRWcgGtnh6xF4y5sH70LZZdxGvrcE6tlautedw6KDemQVVSYHPS4bH4tTYHnJ5LpFIdrKiz6xgKR4bwxJRbO4MkrR7S0Gc6MfF9BA=;
	25:/YAoLpuJ5fDVwpzDx8Z7o5a8hv3VMXcu567D4YGoL0Z1Bb75u16aHF/vWgTz9vWTMqPlDhirYXCdjlSQ3VuEbWvW14CaICr0HF0QxHMMGopgsTR4lsA4L4cOAYgLjcG7avo8Oy6e06SJdGcWL2+jy8ZrNdbRRF2pCrZ6jdDcyIQGIVjFTlQC18bYVsXU+YOORpvVgN5gDktcnijWMi0y2uejxK/F6idnSnfsCQnifhQtl2J+PcyX4Sw4vLSlGo3sC5/BHzMy0CtWdp1f96YaAw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1368;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1368;
	20:6whupZsxWRtMzmJnNfYU2YZwHalzJHTOeEv7eq2oBstlVbyao7ioLXsaPEv4S12bE8clmz8vP3j6g5uFgrp+bhTqKrEtQ5H8E/SAD9JclsESZWDrWPgPF3FlFuRH3owlH6zY5h8DX0gKzuTe3ql3QKKtYgT7Cx0HGSe/92JnbWt17JDs9PfCoZck7NEQOL8npRUHB1NMMxDfnId0uo1ECH1jCgSuRJJUMFvtD70lgLx7US0JKIS9kjlKxeBXGURsRW697bWmdT5nU8CNd4K2OXMv4Tc/mltP8O+UmMFsO7sUFfFnjDFm25NUn5LYCJMHTgCzYE1lL2z7XBgqqOtDiUGpVGKomr+D7GxhDzZv+Rw=;
	4:HQyEq4RzSFqllIAljqOVL9ZLkiqt0vskTylVw4MUwRq1Oq21yshkLHQ/oVuVpWN3AsQ1koPu2dE1mBXW60js73O+FhsQ9YpM5wV8tESNrZCilIgvp1cOk0CGYt074MLRn2mT+Z7wvsbhvfg3g8HLxQ6XrF/YJ78RRFi0XGOq4TgTCsK+lV0acYYLHFR0YTqGI5rigI/cxDttAfqHez+tXrngxo+VVJo9KQTCFrqiYGe44/b7OLjHoyfpI8p8tbIvm9JtHf65Kxp/F8FRg2lD/a8Zfl0XUhIerxAhnSuL+V1AHZ82saJT+F4Vii6WSRTDLC/8rZUetWny6EoOwBSeESQFooJ2ZgcEwCVrI6Hqs+s=
X-Microsoft-Antispam-PRVS: <BN3PR03MB136880A5AA4B766F7BFBD18DE4420@BN3PR03MB1368.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001);
	SRVR:BN3PR03MB1368; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1368; 
X-Forefront-PRVS: 07106EF9B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1368;
	23:txrvsFpRrezrs6PxvnRquqYyZSKtBuOd49fGya6iN?=
	=?us-ascii?Q?e2cmOh1eJWqn+ZznUWGpfB3IvtBNykUdvrsHGKRoc8aqsJ+IE2G9/f77RTxS?=
	=?us-ascii?Q?vtjwBrYs4RiBYmTfQ6pNCsTJ66FJmsP9W2sqqf9zOI2q1RA/LPnNtzKcWx7W?=
	=?us-ascii?Q?N39qqs+EF0+s+B4TuYeo1kIchII/CXwRboaFU6vLCzzbihekD8nKkjcSt/t5?=
	=?us-ascii?Q?xa2i89C4pMqXSKYEYb5zk/VDRbDeMMgnDkiCXdv4eYILDqEotA783tVxnYib?=
	=?us-ascii?Q?Y5KcDIkks1nVfpv3H1S7ldR1dHQTmPdTWhKHA4a7CsfSBSgqfnTiTTyiSb2W?=
	=?us-ascii?Q?KczntzuBRFLrkaZAfW/tbzpt9VaXcOHFgU3AA221yWtjnVu2tm/UEpOtVUam?=
	=?us-ascii?Q?1hZlLfw2V32Xags8ooZLCU7ZgmnSkqnkIosMhYH3RWNkB9MQxKVBxkK6SpKm?=
	=?us-ascii?Q?KJ1FLK/5bq0PPjlZguEojXOSmk+fPXDyQBr6hIIck0mnnM9gyNonRIFY9Xwo?=
	=?us-ascii?Q?zsomgjOd0rWlpV5iyak13IBs0LnwacTUTb35WHZtWbY/gByL8dxizXznJkaa?=
	=?us-ascii?Q?0qChDolqujO1l86VE/8ko++kC0F/YK/CvV/F6mi+3BdsGlpz7+7maMFYdfpo?=
	=?us-ascii?Q?RhByulOK4nQLEfOCkENVsf4HqcTfz6faVqXd/CL+fyzo9j9jSpsRZXxatHZm?=
	=?us-ascii?Q?cU1bn779eUdVpfFFuUcLBX2Pba3OCT/Z54iw1sokvcQrSYiUl4jUnIxBJGmM?=
	=?us-ascii?Q?sV1nWJq7gbcZpvd3i4QdhHnp+Pvsz27aKfEqfXXyoUQhUH/2eBrQHW6vSSuB?=
	=?us-ascii?Q?ScIgDZlM1YomMVc0EeE1ZQbCEkkpOFxf9DiKHcp7NU2pjCt58TxxM/aDIRPB?=
	=?us-ascii?Q?1iUeMusBpSzrZ7hDsUIrN6vjVW0C68+ghYBBD9SAqCpQQ9WOsatTfmi6AFR+?=
	=?us-ascii?Q?XT4aKkIQd54XVdON9B0jo6711LIo/bXPLSteywYq5JoyjPFOVIegQait9GTD?=
	=?us-ascii?Q?kMp0KdHrn/F+Ij1eb1qexm5ac5vm11PaKr5ufb5vzoTFK5q6jc+J98B6V4ia?=
	=?us-ascii?Q?3pqbxPKqrzk/frrLhMgYd85Tl4cC6bL5sYur+vWlXhjuvbFHSEMyClyDR0d7?=
	=?us-ascii?Q?DSfcEE2UH3/t4EMe3rsuM51Jb2kmHo/Dzr4pu6d3k0yndU8QfUgy7HQmiqLH?=
	=?us-ascii?Q?v6RADePFOjL4ekaGEcR2MAhSvrdoPXk4lL2bzA9b/DX/ObciG2A9px5f06TT?=
	=?us-ascii?Q?QwDs/u2a4FpMeZeEHc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1368;
	5:r2LK4+jxgJikQLTl+CcdvVL9rI4cg6RTbOkJtVsN05D0dvob1SLDRvtSSKOSskThnQ3TZ9dI901h68/GRB1ouVZN9JCNknJE9Co/jjHIGZRIUGSGtoMjDFdoFW1H1aMWt24E4sT040xwgoWBrQMIpA==;
	24:sSZ7BUt0A/AiTh0pBlc7dvTw+nyy74qRRWlAT1Y7++xITGXt8SywGiH3G2A3G7yg3QNjrIbOWozbli5nQXToqUVzNQoCG8jbeiUnPpnQvYE=;
	20:YtTIYcnKn1vKW8i6lcTiJi3h/PZ6NRIhh4ithyRhSd0aaH2HQeRGsB5fr1IG6asZIFZQSJ/V1jaHi1iqDj5ASQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2015 10:03:46.4863 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1368
Subject: [meta-oe][PATCH v2] lvm2: make sure services files are installed in systemd_unitdir folder
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Sep 2015 10:36:59 -0000
Content-Type: text/plain

Make sure the services files are installed in ${D}/${systemd_system_unitdir},
fixed the following build error:
| sed: can't read .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service: No such file or directory
|   sed -i -e 's:/usr/bin/true:/bin/true:g' .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index cc70246..ac9434c 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -40,7 +40,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
     sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        oe_runmake 'DESTDIR=${D}' install install_systemd_units
+        oe_runmake 'DESTDIR=${D}' systemd_unit_dir=${D}/${systemd_system_unitdir} install install_systemd_units
         sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
     else
         oe_runmake 'DESTDIR=${D}' install install_initscripts
-- 
2.4.3


