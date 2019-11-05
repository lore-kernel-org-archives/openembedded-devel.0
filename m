Return-Path: <mns@gomspace.com>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30097.outbound.protection.outlook.com [40.107.3.97])
	by mail.openembedded.org (Postfix) with ESMTP id 662827F873
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GIuF7ssQtdAek8bHW6UR9a3dDiS0Z48tGdCdoQEcoNPyysmQp+3KYI25GJXTvUwDyEhZwf7vmIh1HdjEK4qYf+EyTGYfQIJD8QqrzE8hArVLjuQxHyKW050O8QzIJMqCSxrg07clLZxuWyewxCl2MM4ZzUIJAQm4rdik6cBsOdIJFb3OZNPREVbS4dW7T/qz3uzzqMxKzHzRXneo2IqZ3Tmxh9Yoltm2y0/T6dYfDr7hgAWWYv4YW3teusCQUvtPG1gSFVIomYje6MaBDuMDOj52GM6k2TfFMfxzvJ+LjB5srVxAjU4/ZflUswHxAN5B6k5PtcrIK78ZYTQ2dii4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gl+DuAHG5KTG+UxekH59LNHeGWQ4YOw8AZ8ktUA2PdA=;
	b=DEDSIqaUVfumcY4tBTvjBrI0CGPirqahp70GIStCYNFy0BIPqAcgkUQf9YgY+iIYv0OiEKSGzsjS5mdyMvYOuUovFdaZUwbrtu06IrCMKtxctfEcUisAYlMFTciNBeb8RFdkbI+CB0XImqlKJ7SOUiLp8x+U05yb6orO4l/X+wI7vg6fI4rqGs/Gu0KXfs2AJOMaMFp4EBtpsTgv/uOkIxGHXQlrmgRLDN9ZCeWK4VQufzJM18ZXIF/+qrMUebb8mZtlvDFwPLjDGOlvFxYkociTNC3U/rr7g+DGQhai5mbqlLpSop/KL1xwVrBE8cJ1RbEGu/SzsD1TOqdFDa/asw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gl+DuAHG5KTG+UxekH59LNHeGWQ4YOw8AZ8ktUA2PdA=;
	b=somWbyRtcuKSapKPOg8L4stn8mqyrzLOC7oIYOByRKhmD+jsrNewkywQYOnOXPmPcSSq1MnOLVn1e82dZnpD0A3yVclN5Ojn6RJHMoNMLhFTWcqhWifiKw1IdS/srAqmzyijeOzFAmri5uKTh7hwZz0O6WRsZW41f+mibKE8UPg=
Received: from HE1PR08CA0078.eurprd08.prod.outlook.com (2603:10a6:7:2a::49) by
	VE1PR08MB5040.eurprd08.prod.outlook.com (2603:10a6:803:114::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24;
	Tue, 5 Nov 2019 12:00:50 +0000
Received: from HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::206) by HE1PR08CA0078.outlook.office365.com
	(2603:10a6:7:2a::49) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.24 via
	Frontend Transport; Tue, 5 Nov 2019 12:00:50 +0000
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
	15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 12:00:49 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 5 Nov 2019 13:00:47 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 13:00:26 +0100
Message-ID: <20191105120031.6579-2-mns@gomspace.com>
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
	SFS:(10019020)(376002)(346002)(396003)(39840400004)(136003)(1110001)(339900001)(199004)(189003)(7736002)(105606002)(70586007)(47776003)(5660300002)(476003)(50226002)(356004)(508600001)(8676002)(81156014)(8936002)(26826003)(386003)(11346002)(70206006)(53416004)(126002)(6916009)(50466002)(6116002)(3846002)(81166006)(446003)(305945005)(51416003)(86362001)(16586007)(76176011)(2906002)(6666004)(486006)(76130400001)(336012)(2616005)(48376002)(316002)(186003)(1076003)(21086003)(36756003)(33026002)(16526019)(2351001)(26005)(4744005)(40036005)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VE1PR08MB5040; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0edf1ef1-963f-43e4-7d7f-08d761e7cce8
X-MS-TrafficTypeDiagnostic: VE1PR08MB5040:
X-Microsoft-Antispam-PRVS: <VE1PR08MB50406386B2188CD2C8926435C47E0@VE1PR08MB5040.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30pk0mTCNiEiQAiEQbLnFZtZP+7SgSCTEiFE1SNdkBIz5UOVV/E0WUMsu3t1DtRbZX5Pik67ovYX9lBsEjAua3isjk4QNn4PHLH+o0HrgK7Nh/QQRLrJEfPEffzt5VA2mGFFonvHNf/xT3K62BS5PZPSfY1OSyCh+xrleRL5ckWhEyaPT88ivc5sojTixkHctC+wwGhNmtZ4GCGscjJ5KzSJchhJgYgRxDCDFwZyPdDCx6drfsfgkSVYbW276mgxxWLJmup3EZPYDBbLrlfLRTFld8F3npaL3F2no79uQ1NRxkGWTFnVxRLl98MzdHIctiabZr/0cXaxXDHc8Q82zNJZtp8ho/BKKzu1Bj4mwUIP5NE73sgMSiosv/XSzc3Rx8PDvnDtvJkorPG+DZX42DmKn2n1XNnGqA0owG72jNTZ5cHDnNIy2uUBF6Cf1XgT
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 12:00:49.8171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edf1ef1-963f-43e4-7d7f-08d761e7cce8
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5040
Subject: [meta-oe,thud][PATCH 1/6] Bump libiio version to 0.15
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
X-List-Received-Date: Tue, 05 Nov 2019 12:00:54 -0000
Content-Type: text/plain

From: Nicholas Pillitteri <nicholas.pillitteri@jhuapl.edu>

---
 meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index fa6f4c2ca..cc0efccf9 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,8 +4,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "fa82974d8bd1fded78e630ab71a7ded1b11d0e33"
-PV = "0.14+git${SRCPV}"
+SRCREV = "6ecff5d46e1b12c2859f0b63a73282940e3402bb"
+PV = "0.15+git${SRCPV}"
 
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
-- 
2.17.1


