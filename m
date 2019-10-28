Return-Path: <mns@gomspace.com>
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70137.outbound.protection.outlook.com [40.107.7.137])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1BD7FA45
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 15:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=C2p3KBW/yVvDQ4fi16eZIq3G0FfeBAFhPJFRYPgsZlqx3NMkozXCx0RRUXAmzrzMBtokx3NAlMGLpKtoBjy/95+NLe/+IFpDEia6+rC7Blmm+GcXjRWGFjVJW0wAYhRS3eM3H1AxvtHiKhyguOzneuIwUtu19hnVFubc15pZUBgPhViVSVPHOBYCj2wOIgkT2OAICQ84Drjbd/QTOD05TQK5Fq9cGEdSlp5qebiWxMuGoeEoINKvsg0c6ZZkYju9VyMVA9GcO5WKxIDvvfQu8ELShQ/UtW2jBPhjGVbn1GOGh4RkH9chpmKNcXYx5u1Otz5lcvfkA92kdw2O0CQXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QgjPRY4P9rTuQCouKyT2aL9v0wCWX6zcRvcs+bN1kz0=;
	b=Rwu/enykj0N6w3oNQaN8g1bkfFV6fjMXp1eTiU1zLcM4I506YknAHm2uZ4hvpfV6CQliAEjPPNK/aezyVb/kjOeBbmCPgR/+5GmabuKRanT7Fq4Q4mQtHFZcVZVmkn6xK+B3Nj41/KIaelB6IpKNn2UUJ5lfkhH9dpBLNtMImzQs6Cah6sICil5da2he+oW+VmuZXEoPMsSHPZbZd4HK/M+zWwxaSxxpWCDhoPdcHSoxX0dy1VLONQA6WWPUXcC5ccAbqEqSoayaoDZIdTyFDUHGjXapbvD26Fc8vrx/NumX2M5846N96yRsNFTwGh2qbhZlysHNsEz/Cm9905fFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QgjPRY4P9rTuQCouKyT2aL9v0wCWX6zcRvcs+bN1kz0=;
	b=wfy2TSJuXPkyX7HcY12DFO4VaSWbfIuTrxxuViHz9fpbRcn3O/HyrUN2P0pHcRztkG3moouWa7j/TrwyADPC7pPQXbXA6upTM4pfYhZhh0ijKmDDjqiVX0K12SnrGVkHSv2OuPQCavqwnAO6xpiTk/MtIB2AjHHa4YDz+Zm7LGU=
Received: from DB6PR0801CA0060.eurprd08.prod.outlook.com (2603:10a6:4:2b::28)
	by AM4PR0802MB2145.eurprd08.prod.outlook.com (2603:10a6:200:5d::7)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.25;
	Mon, 28 Oct 2019 15:27:33 +0000
Received: from DB5EUR01FT044.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e02::203) by DB6PR0801CA0060.outlook.office365.com
	(2603:10a6:4:2b::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via
	Frontend Transport; Mon, 28 Oct 2019 15:27:33 +0000
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
	DB5EUR01FT044.mail.protection.outlook.com (10.152.4.182) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2387.20 via Frontend Transport; Mon, 28 Oct 2019 15:27:33 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Mon, 28 Oct 2019 16:27:32 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Oct 2019 16:27:22 +0100
Message-ID: <20191028152722.31428-1-mns@gomspace.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.8.211]
X-ClientProxiedBy: Ex01.gomspace.lan (10.0.1.60) To Ex01.gomspace.lan
	(10.0.1.60)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(136003)(39840400004)(346002)(396003)(376002)(1110001)(339900001)(189003)(199004)(2906002)(316002)(40036005)(3846002)(50466002)(36756003)(126002)(48376002)(16586007)(6116002)(476003)(305945005)(6916009)(2616005)(7736002)(105606002)(26826003)(14444005)(47776003)(50226002)(51416003)(508600001)(70206006)(70586007)(86362001)(107886003)(4326008)(356004)(6666004)(53416004)(33026002)(5660300002)(336012)(1076003)(386003)(8676002)(81156014)(21086003)(81166006)(8936002)(186003)(26005)(16526019)(76130400001)(2351001)(486006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0802MB2145; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 935909fe-3527-4e9c-1edd-08d75bbb5a8c
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2145:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB21451CCCF671C4EACEFDDE10C4660@AM4PR0802MB2145.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-Forefront-PRVS: 0204F0BDE2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+A4g6dOlNunzA03cD2DvcrxxBnaHDetJ/wiCf1u8ZrWO48Sf3ba1DuO+elRErxOlalml4K2eothzexeg5GIoBDRPpHrDMEwr2fAgdaoCSPuxkVl1lTXvpQBIP7TySDPAmB6OnT6cYqhWAbzbkZrLvnNF7YQKqpcwKqklNzn1ATr7GqpGv+hJxPzSFQv9EUq01mehFwAD3a/PJfgHLblxjspBisZGiAFOc795eE/VuMf/6wnrPKRK2lbdnnbmdOa9BK0VRYC0rkC6vZmMutw1VjZGnk7vaY2qKNgIOqi6RL5gcSLxhevKejQq+KjEWvl+A4gkQXt+/rNnxY1u9mdKP5CInJEv6E7vQoUFN6HhiSpQLt+kRMUb0fpCp+aA5igPfhF+sXyYB2Nc4wEKvC+3/lQaJgMD1s0gk/sG7q6pxc9W0NwZ2DjVA/wmPcUI0wt
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2019 15:27:33.1478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935909fe-3527-4e9c-1edd-08d75bbb5a8c
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2145
Cc: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] libiio: Conditionally inherit distutils3-base
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
X-List-Received-Date: Mon, 28 Oct 2019 15:27:34 -0000
Content-Type: text/plain

 * inherit only when PACKAGECONFIG indicates Python bindings is build

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index e6e0eaef8..027e4d5e5 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-inherit cmake python3native systemd distutils3-base
+inherit cmake python3native systemd
 
 DEPENDS = " \
     flex-native bison-native libaio \
@@ -30,6 +30,8 @@ PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
 PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
 PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
 
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distutils3-base', '', d)}
+
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
 RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
-- 
2.17.1


