Return-Path: <mns@gomspace.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00099.outbound.protection.outlook.com [40.107.0.99])
	by mail.openembedded.org (Postfix) with ESMTP id DC1B17F873
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:00:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hcWS8Kg8RNdBUMp8hST/QWGDqADOORZJRZ3INNHQF849aLXyjGSqALIWwCl63pBNUXqeRzRinqigPMdbCDvlrLbTPIRphIRyfQjv6tZOf7+jXWmaLy7kgjHc2mF0BLVBJqkQgS84QbNkAnAJRuffMQWV78/q5ANWRasNcnFKhY3ZrBrfZeaEkyXN/eqTzX2/y7Q/Jx38yvDKrgHNt5qMtHZ0qw64q0m/2L4KJ87/IhoNDzPfhvJi4HAFHzWZrmTIRiH1Ux9bd9V8jlHY1eKzS1SWODSk28ITF1gi3uR5yNKyMSiAeTJfLIpo3l3CMfykudlDU/jZycENd9zzp6mP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RcEVDNk7NCzfrq/XKenf4ZG6WazIyvGrpECwp7tzLHY=;
	b=KMAVB0eRANnA/7lwnqkr+Fiw0Ot2rYhG3KvT9DoJZvGNKGj0t0xmjgrD5LB755EZPboP5gIYlxg/vwStT/6LcdMNzem7lr4GigsYhdB7cxNmW32EnKBi16ONRct9/eTJlNaqhs3dALQ39GfVrh7b+94ZG0VOU/kKmElMJPU95pYAnfp55/a8bS5UioMotETbB/ns+sx1pDYRDfZ39xnJSJJJF5JHgP6Sc3RE8gBo/RxA725kI9ha2r7BuV+iNb99No1es0EcYr0VBJffJmY+U2Mg0jH2PLr3ILHdZ4pME7v9H7cmdg3Xu3pGMtbXoBBAXhnPCwEX/O/ThvbwSvpZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RcEVDNk7NCzfrq/XKenf4ZG6WazIyvGrpECwp7tzLHY=;
	b=pUWDEPcO4XY9eiAUrBs4BTl0AVUII4ODpQqPicV7CfJZPengP0Y02ajNM51hXhywtEJuTRVSt7yL55urTd7hRObdE1ngkqHmxFBPQiPOZDkHnMpvP4U3RqIoOU22IVAwbMwQiUXHc39f9G2lI4WLeOnGPb6FGoCQvxj1WXNOye8=
Received: from HE1PR08CA0078.eurprd08.prod.outlook.com (2603:10a6:7:2a::49) by
	HE1PR0802MB2316.eurprd08.prod.outlook.com (2603:10a6:3:cb::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Tue, 5 Nov 2019 12:00:51 +0000
Received: from HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::206) by HE1PR08CA0078.outlook.office365.com
	(2603:10a6:7:2a::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.24 via
	Frontend Transport; Tue, 5 Nov 2019 12:00:51 +0000
Authentication-Results: spf=fail (sender IP is 79.171.149.172)
	smtp.mailfrom=gomspace.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=gomspace.com;
Received-SPF: Fail (protection.outlook.com: domain of gomspace.com does not
	designate 79.171.149.172 as permitted sender)
	receiver=protection.outlook.com; client-ip=79.171.149.172;
	helo=gomspace.com; 
Received: from gomspace.com (79.171.149.172) by
	HE1EUR01FT022.mail.protection.outlook.com (10.152.0.165) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 12:00:51 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 5 Nov 2019 13:00:47 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 13:00:28 +0100
Message-ID: <20191105120031.6579-4-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105120031.6579-1-mns@gomspace.com>
References: <20191105120031.6579-1-mns@gomspace.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39840400004)(346002)(376002)(1110001)(339900001)(189003)(199004)(8676002)(81156014)(76130400001)(81166006)(476003)(26826003)(86362001)(508600001)(47776003)(126002)(11346002)(446003)(2616005)(486006)(36756003)(21086003)(8936002)(305945005)(48376002)(316002)(336012)(16526019)(186003)(6666004)(356004)(386003)(76176011)(26005)(50466002)(3846002)(6916009)(33026002)(7736002)(2906002)(50226002)(70206006)(51416003)(16586007)(40036005)(4326008)(5660300002)(2351001)(1076003)(53416004)(107886003)(6116002)(105606002)(70586007)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0802MB2316; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4086bece-b776-4b5e-2e0a-08d761e7cdf6
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2316:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB231617F796C6A104C83FB2D5C47E0@HE1PR0802MB2316.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z103m0DvZ/rqnS7X+jecs1Y/ClA+q3OViejT0bq+Pa0SOu3Kc0CYHx66p8O2uPJ/ryYvVrspYDGkE1fRuKJ8VsJr1L/vB+6l3wnJ8j9xDadWH9SZ6ZpiOcQTG3bktcKhmZ4eaMOHbtxXDYpLGGWl/BEVC4x/lN42n9ZV2Rp4L5oopLGZVxTekZvhQjI4UxH5RCUJ30FcltgZIS6pcaEaXa95UKgKJs5sWWNNTploREJqDdQoXhTCkLuedUIj856szE/CbS6hYjIU8PUh4nX9cSsvqAfEHa0Zy5opk0Y3fZlEIy/R88yYGrM0u/c7Y5tuzRySlSkKCHpHyp09BXZf4V6HUGeu3mpMS66vuUuoHOvlivPi/csgqWd/vcZ0FldWWPg0plM9Mm9uIzLIxveSle6zHSA6nYbx8rIjSgYMJkv620lQMLrPXnK8ve93uoSh
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 12:00:51.5856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4086bece-b776-4b5e-2e0a-08d761e7cdf6
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2316
Subject: [meta-oe, thud][PATCH 3/6] libiio: allow python3 bindings to be built
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
X-List-Received-Date: Tue, 05 Nov 2019 12:00:52 -0000
Content-Type: text/plain

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 5d422520b..4282355f8 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-inherit cmake pythonnative systemd
+inherit cmake python3native systemd
 
 DEPENDS = " \
     flex-native bison-native libaio \
@@ -29,16 +29,16 @@ PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
 PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
 PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
 
-PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
+PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
-RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
+RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
 
 FILES_${PN}-iiod = " \
     ${sbindir}/iiod \
     ${systemd_system_unitdir}/iiod.service \
 "
 FILES_${PN}-tests = "${bindir}"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-${PYTHON_PN} = "${PYTHON_SITEPACKAGES_DIR}"
 
 SYSTEMD_PACKAGES = "${PN}-iiod"
 SYSTEMD_SERVICE_${PN}-iiod = "iiod.service"
-- 
2.17.1


