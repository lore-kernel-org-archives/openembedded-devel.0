Return-Path: <mns@gomspace.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150121.outbound.protection.outlook.com [40.107.15.121])
	by mail.openembedded.org (Postfix) with ESMTP id 01F757F45A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=a+aGzzuf8drB6N0Kkv/Tnf3Xw1JtABncKSduXLgU9HMtmB7CkKzuSZRPRCjOBKJUGkzwxwhJN5gQpQCtgvNmCCjOgVhhDVp3+JJVdPTZzPXP1mdBqARbKMQUpCj5vyhtiWMCXq0yuH6S1DMNljUE8bFvqdlsl/xS3Eq0ngEPm5VripASJ1kCTVWiN9WYg53wMgewekfLxlOCTiVoxJ+XiWD2ahgoQ74Yhx5U5aUAEvff64zBJKlZLyzzW4ZWwEd9vV3Qc2Zff/AUvxVNSgRJ59X+m9mTJ2GUhwjApJoKl9nNgDoIAfGAbrwDhyRPM8a9nP91J7+HVKZidnoPKo0VNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SYCm7MhO8ITMdMCOb3lw1D2nYyEKvBOhhCNfkWICziY=;
	b=AvP7sr8OD6S7LuRa1pRmcR6yYzWGVvdQhfdpAFsRRVmZzUH7pnYU8SaJwU7Rfe3b8CVbDznqcNEzIgp26hhPAmOgRAkKcL5YvmPchnAJb3xFjdIbIgoBsLxMmDL/mTybpTeLHqQpIrJLNfwyh64AObFmst48FUTQvX38+n2k1OnlIH49zH0rd9pS3mo9UxWtvY1Xd1Boagg81FrbQ+V/G1zR9SM0oNpkp2mIyw0+HaU0g/fCjCD9txetLLq9T72fhyNDLN4IJKpWQ5YYWY+co90GCCTgFn38quivQ7yrfmI1h1m5Ecisf3+UEYE5zffxhEV6DORFzCpViMRo5Redcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SYCm7MhO8ITMdMCOb3lw1D2nYyEKvBOhhCNfkWICziY=;
	b=vTmLCjmZ68ubmNOiPe5YyHIb63+e/YwlzrEEx9RjnU6ei3+ZDFDIMkw91yBk9pX/MFcME/7Y5eXoUo42wfCK9VJRAM2EnLEcDzX+pN2O9mH3eUyGDdAy2zz7JYHiPGrl12KuydmRcOp8qMBddqvFtFiqTI8xyVF6s3bt/MKZtw0=
Received: from VE1PR08CA0011.eurprd08.prod.outlook.com (2603:10a6:803:104::24)
	by DB6PR08MB2807.eurprd08.prod.outlook.com (2603:10a6:6:19::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18;
	Wed, 16 Oct 2019 11:01:14 +0000
Received: from HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::209) by VE1PR08CA0011.outlook.office365.com
	(2603:10a6:803:104::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Wed, 16 Oct 2019 11:01:13 +0000
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
	HE1EUR01FT026.mail.protection.outlook.com (10.152.0.158) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2347.16 via Frontend Transport; Wed, 16 Oct 2019 11:01:11 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Wed, 16 Oct 2019 13:01:11 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Oct 2019 13:00:56 +0200
Message-ID: <20191016110057.11406-2-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016110057.11406-1-mns@gomspace.com>
References: <20191016110057.11406-1-mns@gomspace.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(396003)(376002)(136003)(39840400004)(346002)(1110001)(339900001)(199004)(189003)(6916009)(1076003)(16586007)(53416004)(316002)(105606002)(33026002)(48376002)(2351001)(6666004)(356004)(76176011)(51416003)(70586007)(70206006)(336012)(36756003)(81156014)(81166006)(4326008)(50226002)(21086003)(7736002)(47776003)(508600001)(8676002)(26826003)(50466002)(16526019)(26005)(8936002)(386003)(5660300002)(40036005)(186003)(476003)(107886003)(486006)(126002)(2906002)(86362001)(76130400001)(446003)(11346002)(3846002)(2616005)(6116002)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR08MB2807; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64481e02-4250-420c-87f3-08d7522828cd
X-MS-TrafficTypeDiagnostic: DB6PR08MB2807:
X-Microsoft-Antispam-PRVS: <DB6PR08MB2807766641FAFD39301EFCDBC4920@DB6PR08MB2807.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8kWQdvlLl9im4vQ4z0LljkmCsZJYREwRS65MqAGA4y0gfVc23S2xQqwBGwlcE7D/l/pHqc/vnVSgLf7Yc29HQbr+8vuuuWV5watUBNbXouKsCURhhQOOt4h1AbXqW79IXEKlwRYLCZpfJEZJOl/4uAL7fJfRNHkDRTliBXUfWA4XgXJe8ifZ7LbntO0klMQxyx5tXw+9YY+U0EWLngXFReCH0uwYbETznC9MFUXTQikfpm7ooB5M96bL62UR2aOHYsOjZzVtGCiLSQIgHdU0VOH6+9mEXazD5NakHQ7T0Mi8Nen4xneqogx/TGCvA0Ri/QGU8hanSg/UUr2wAMhoZ7dYGSEvQYCOOTYcray6kVuzYq7mogLiiYchMMzdAg1FtQIlNou/5C+lzapDLXNS+QutyW/Oi8EUY8y5g3T9Rhk=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 11:01:11.6769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64481e02-4250-420c-87f3-08d7522828cd
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2807
Cc: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH 2/3] libiio: allow python3 bindings to be built
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
X-List-Received-Date: Wed, 16 Oct 2019 11:01:15 -0000
Content-Type: text/plain

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
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


