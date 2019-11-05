Return-Path: <mns@gomspace.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00121.outbound.protection.outlook.com [40.107.0.121])
	by mail.openembedded.org (Postfix) with ESMTP id 2B8817F889
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=h1hyApNuHzVdr20fQL0ZwaJt9BYAbZqcZWWhwg44lPuPcawnAlb3vbwU70uDnRurG8njRAYKGFqoUqM2cQXsHrDz1PfxB4eor+NxcoyGyUX5XK5tJkrsaqSq+3WkJOHrI/bBfZ+edIEAEJ790BHBs1rdaMdSIjguzS9RYLiWEW51tgGw98McI2h+pDZ/eVgv+RSdLspV7NPDw8njWGxv6GFtcmSfK4gASD0N4QbyDFF2ClWnw5bdD47Pz0pq2QlpKW8tanFiaUwo1FiosdUCx2fCPaD/LcVzqtbaXUTXcTgVIQqjijWHeH7UETEGLfSAcpyNN2zEjkhtQv5soo/ciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=00CnC9bHkohuIpOIOkwGrEzlca3ypk7AfIlYV9dSdAo=;
	b=OInBtZPPj59WQs74132b1lmxzb88Mv48VO8RCfn6PxRxDWFW1NoJCoRllOZa5nsnCzbyGUueZhzm5Zt2TXN3T44922hxXU0geIebR0rT6pfAdtIIjCM0u1wdzfTQiruRnH9R82zg5s+mNGZoVGo2Qo9qNRZXUt89UNO7o6DAgRxs2WwCYOk3AdM9XAnodKONKdLZ6DbwPMOg3uXWUB4PKlhREVwzHdJXRgFArBw8SuoBYhcxrZQXgvF2rLPUAuWMtA70u1AMwBGsHeToRNtLp3IGtaglaS3YGKqHL3K1t3nBEuSNxYJDai+a53r8ZObICzLP3i5WdTbTtW2Eke2Mwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=00CnC9bHkohuIpOIOkwGrEzlca3ypk7AfIlYV9dSdAo=;
	b=Ov138aRwEulx+2NETKudwk9M63/4+x/c3MMQt/dD7TaPPqnc+XWGwMDAmRehXkzTR7RCEuitZj+jfjRLxOeqaB4+x2YV8FOUvsV4Qh1vdmTHvomU8LHELMEyQOtkxTmSCiqMtCwECSEYnTeoRRImX2E162fBafzpgZWaZeh6RIo=
Received: from HE1PR08CA0072.eurprd08.prod.outlook.com (2603:10a6:7:2a::43) by
	AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20;
	Tue, 5 Nov 2019 12:00:51 +0000
Received: from HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::208) by HE1PR08CA0072.outlook.office365.com
	(2603:10a6:7:2a::43) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via
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
	15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 12:00:50 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 5 Nov 2019 13:00:47 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 13:00:27 +0100
Message-ID: <20191105120031.6579-3-mns@gomspace.com>
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
	SFS:(10019020)(396003)(39840400004)(376002)(136003)(346002)(1110001)(339900001)(189003)(199004)(33026002)(70586007)(70206006)(305945005)(7736002)(21086003)(2351001)(5660300002)(508600001)(107886003)(26826003)(4326008)(76130400001)(6916009)(11346002)(2616005)(86362001)(356004)(6666004)(186003)(36756003)(81166006)(316002)(16586007)(53416004)(486006)(126002)(476003)(81156014)(8936002)(105606002)(2906002)(47776003)(50226002)(16526019)(386003)(336012)(76176011)(48376002)(1076003)(8676002)(51416003)(50466002)(3846002)(6116002)(446003)(26005)(40036005)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR08MB5413; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d371ecac-8510-419c-a190-08d761e7cd85
X-MS-TrafficTypeDiagnostic: AM7PR08MB5413:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5413DFE0C90C040325A37AFDC47E0@AM7PR08MB5413.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bUHdxpmUGU/eHzbuzbfayJlmck+v5bGivc/gVPXUqqKgPnqxMyVDAovMvFetvmBDnkoVA5yrByhttDzMZGw2ETA8v5SulaTV3jpI7u/WWqUyUOlou2R4X5Xt4DLIHGW6W6W8t9f2hsXvOFeKvhXe/lolUYeOB8IxrOdsHhYuR760UHrnP0653MldzJbWpj/xZnGrGr80smilAp1K+P4syumwo4EJPDh1GhKWxWxeNdmRRTzV9EKRPlLOK0nrWZXITtKjaaRhICSTflrgsgNdqYApSudI55xDkoOF59pILDK3TpdccnBFJCc34zN67xm0A/r9U9uQx9uorVR6IWcwkDo2KFPCc9n2pZZUqkOTQbqvY8yJAv3qR3RIksa1Tl+26Z/Mis6T5HPqnSwVVsmb+YjVC3IFml+PZarICSSuTgoOrNhKKaTj1guFleHPQv0q
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 12:00:50.8410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d371ecac-8510-419c-a190-08d761e7cd85
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
Subject: [meta-oe, thud][PATCH 2/6] Revert "libiio: fix build of python bindins"
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

This reverts commit b0caf1fb82b90a6b123ba4463a8405568eda0389.

 * bindings are build through the variant 'libiio-python' and is not
   intended installed as part of just 'libiio'

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index cc0efccf9..5d422520b 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -24,11 +24,10 @@ EXTRA_OECMAKE = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
 "
 
-PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"
+PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
 
 PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
 PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
-PACKAGECONFIG[PYTHON_BINDINGS] = ",,python"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
 
-- 
2.17.1


