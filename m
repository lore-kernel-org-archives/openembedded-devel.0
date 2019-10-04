Return-Path: <danc@opengear.com>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690057.outbound.protection.outlook.com [40.107.69.57])
	by mail.openembedded.org (Postfix) with ESMTP id 403417F0D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 03:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kNEYhS6jfHLTg0tD4pGAo7PIL0T1bDGCsWZUg+6Cq6YYkFzmTOk9lyFxuZtImRMPIfPptMI6IxE2FxZryqZM2EuntVVK0YLysDYH2kda3R2Rutfig7oDRQI3VyyA6f9fuFFucnJOaeRSTIlSROOFpQxS3OEYWhLxwVaZRM6TJlmSrbOUwoX5VuXSs8lhGRsnAkJjOHLMG1dlEziFYMMJheMNmIdBdU0bJRMX6tCCzxNlTZcRN4KZrva5dUBrvxy/D+oZBqUff1g2LBapMSO0cFV5Ph96zMiNKf+JK36QHLb9+WEABtWYSwM6jliftaKUb+NmiTTRoPmqS4hOP3epCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rKEHNGv0FXxh1jYvfLxfi63ghH/2wmaYZdXWvplrBew=;
	b=jqN37FutCYVpDw3ae/fI+pr6VOkAsZcRAhBA3LWg/bZX8GlI56jtCevqj01GvATHdmUROu0SZKPrpcl/oUGxd4MM3zR5qDyNwXyL5krKmQ4ff4JzTdOA01PXfxlYe/tT6yPYULMrD1qM9BL3P1SdvyHeZZwsJtq2nJNcDQeKqoKm4q3K1hkXG1TVPhtM5XvG2wWoClD/Bq5on9tKbS9qIzewOkXM5b9/+H6C0Op6pLAdwTOGkdgI8+MYxe98Z/7/WphQO1uxX+CUwYrdWRVP+0DV6qRNfs8eOtyse7hwtabaOvydDUjT5UOVHk8oR+CewXl8iZoJFUCWLCTFYC/OOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rKEHNGv0FXxh1jYvfLxfi63ghH/2wmaYZdXWvplrBew=;
	b=G2VbHeyHL/3yzAfIuOWqj62EcthpwB41lei8ilaHbCAaYzpWC0LTH3eOejjE7YxQxvBG/PMmY31wk8a07E/gfWIvwFchLc4Re6wXKNsaA5yEgFa11Dh1gadJuEffSUywyACfBKQpmfzd+0pHVY11HVEQ3aIINM0BMxfCludzpc0=
Received: from MWHPR15CA0045.namprd15.prod.outlook.com (2603:10b6:300:ad::31)
	by CY4PR15MB1142.namprd15.prod.outlook.com (2603:10b6:903:10d::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.18;
	Fri, 4 Oct 2019 03:35:56 +0000
Received: from BN3NAM04FT055.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::206) by MWHPR15CA0045.outlook.office365.com
	(2603:10b6:300:ad::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23 via
	Frontend Transport; Fri, 4 Oct 2019 03:35:55 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT055.mail.protection.outlook.com (10.152.93.43) with Microsoft
	SMTP
	Server id 15.20.2327.20 via Frontend Transport; Fri, 4 Oct 2019 03:35:54
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 1C9B4E95C9;
	Fri,  4 Oct 2019 13:35:53 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 0114F42965A9; Fri,  4 Oct 2019 13:35:52 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Oct 2019 13:35:47 +1000
Message-Id: <20191004033547.25049-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39840400004)(136003)(396003)(346002)(376002)(448002)(189003)(199004)(50226002)(47776003)(8936002)(246002)(36756003)(48376002)(50466002)(14444005)(1076003)(76130400001)(70586007)(70206006)(478600001)(2906002)(6266002)(103686004)(4326008)(26826003)(5660300002)(107886003)(6666004)(305945005)(356004)(2616005)(426003)(336012)(186003)(2870700001)(36906005)(316002)(7636002)(8676002)(6916009)(2351001)(2361001)(126002)(476003)(486006)(44832011)(26005)(42186006)(51416003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR15MB1142;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 075c0553-28f0-4f1c-d03a-08d7487bf6b2
X-MS-TrafficTypeDiagnostic: CY4PR15MB1142:|CY4PR15MB1142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR15MB1142F92E29B9E57AE2F44E41B89E0@CY4PR15MB1142.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjQ+O/nRW7givgIfPjqHNU5ZPPAULVHYIqfM0li6EedWQPk+5Yqwqq/GOzj7UgCO1ocBIcErm7aeb1+pvDfhhs5nST+yQOO0G7fpBxJJInIy+isqLOZGk96aN1nfHVFCrzzd3+nxzXKFv4Y7Iu0ziP0wuPpJnQGWvQZ/vQt4O7ODm9qHy1JBJIwWrvayDFTO9X0sZoAsqvvMtqem5Adb+6TK14lnxtoASYq3IrBTnEGJknvuL0Bppx+jFF73hFDwxhrsswY+xlqJz/wam44nyWYiR5TSKV+jy/XBAIqZf/ZV3Ap0aIpPlCzOEx6X9eqajoCVzu15r4ef8ZHVT8od1fxZZMpycPi9v6op3tR7gIKJhgV8IqDhR22ScOK6epTgmMEilhC1Va3ajUQiI+olSEM6z8Eg/ISJXvvc9Lu7Iq0=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 03:35:54.8710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 075c0553-28f0-4f1c-d03a-08d7487bf6b2
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1142
Subject: [meta-networking][PATCH] strongswan: install dev headers
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
X-List-Received-Date: Fri, 04 Oct 2019 03:35:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

These are needed for other packages which want to link against
libstrongswan or other libraries included with Strongswan.
By default, no headers are installed.
---
 meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
index 9310a93fe..5408eed27 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
 EXTRA_OECONF = " \
         --without-lib-prefix \
+        --with-dev-headers=${includedir}/strongswan \
 "
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
@@ -48,7 +49,7 @@ RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
 FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
 FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
-FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
+FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la ${libdir}/ipsec/include/config.h"
 FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
 
 CONFFILES_${PN} = "${sysconfdir}/*.conf ${sysconfdir}/ipsec.d/*.conf ${sysconfdir}/strongswan.d/*.conf"
-- 
2.20.1


