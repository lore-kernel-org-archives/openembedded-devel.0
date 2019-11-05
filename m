Return-Path: <mns@gomspace.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10102.outbound.protection.outlook.com [40.107.1.102])
	by mail.openembedded.org (Postfix) with ESMTP id 14E2F7F938
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 12:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hhRkMqqWH7UvH47Sawz4q+mIn34kpLQFXtqZxGnn2jFNf/+ksSgulNRJazbo88w6BPeevVMOb0b5L4ZF4qBDs8i4R2d+uMkjPmpeZoOI2d4KQfoNb9/zNPSWD5XCbWrBq4gvphoo0P35iPFJeijd1MjIHpPfkEc3Qvu4x5LPr99OAh2FS6T/4ZKzasHgFi2ABGoXqH2kYvj5geZ3s6LuKpU8VLgPAyB0VfWRaX8ork5c/zfEM0C9B/WlS4hjc+A8CWK9Hx4ZXmiDtnmZPK9i+B8+PkiKWnNuXv5k5Ro/DjgX1o2JRwJ9o7rpKHZI9NFDNBprhiLK/2quY7Kpy8iJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YW8RQlC/1xo3UwpbgnO77//khZh3nxDIKyoXVHZN2QM=;
	b=dr+d/fBSHF2ISV4vT7U5Pt6lSnsBk/FovACi+tFqADHVhYom0/vRWpr/wGpOUmYr4fNrCC7LUVvLOq9iOW+O0sAH8rHqpqOlcSjtdJH/xxJm5x8NKsOXncGo9ZKqyHEW22hVS5w6dKoLLOJIjzT/H9r5XZheRh8le4AspYCsqYFbDKC76rpbhJtgP6jbxAvK1o5UIMYGrUBcwepn301elLHZUZxTP69x9xDluCKsxYVkWVnGfGlEl5G6PKhxVU3AKPHlPVceM0aJ2vTInZoGlgEj6jWdGgw8+M0e84AVluaP6dgTiXM5qAgSyjpRcBIYL/DSE65mYFiAPFRdYN4FVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YW8RQlC/1xo3UwpbgnO77//khZh3nxDIKyoXVHZN2QM=;
	b=cW5bMgdYahIjJbx264BHHm5gB0E1kKJcI48t/pjmIIgkEoZkHl8YwAomInETtD8hftZuMYPia+hwaft16WHJXYtE2r+s9nhR3GAZAzwRb9KMxjZEiVdqk/aG6FagFTsx/w8rP6o1IfUiNbyD1Lr6zbw5MzF30YgIf2Q1y2n3mmI=
Received: from HE1PR08CA0076.eurprd08.prod.outlook.com (2603:10a6:7:2a::47) by
	VI1PR08MB3440.eurprd08.prod.outlook.com (2603:10a6:803:7c::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Tue, 5 Nov 2019 12:00:52 +0000
Received: from HE1EUR01FT022.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::208) by HE1PR08CA0076.outlook.office365.com
	(2603:10a6:7:2a::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via
	Frontend Transport; Tue, 5 Nov 2019 12:00:52 +0000
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
	15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 12:00:52 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Tue, 5 Nov 2019 13:00:48 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 13:00:29 +0100
Message-ID: <20191105120031.6579-5-mns@gomspace.com>
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
	SFS:(10019020)(396003)(39840400004)(376002)(136003)(346002)(1110001)(339900001)(199004)(189003)(24433001)(5660300002)(81166006)(81156014)(50226002)(8936002)(14444005)(16586007)(76176011)(26005)(356004)(476003)(126002)(2616005)(486006)(6916009)(48376002)(1076003)(7736002)(53416004)(50466002)(305945005)(33026002)(8676002)(186003)(105606002)(40036005)(6116002)(86362001)(3846002)(2906002)(6666004)(47776003)(2351001)(4744005)(107886003)(36756003)(76130400001)(21086003)(11346002)(446003)(336012)(16526019)(316002)(26826003)(70586007)(508600001)(70206006)(4326008)(51416003)(386003)(8193001)(142933001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR08MB3440; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 338b4935-a6d6-4a10-fe7e-08d761e7ce42
X-MS-TrafficTypeDiagnostic: VI1PR08MB3440:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3440B3F3AB796A324B136667C47E0@VI1PR08MB3440.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4TQR7SaJaZKhAWX/4GROWVHPiAbpgT3gSXjDgSW1HZaqA7su7yWgqWJ8vxFdZqn7FZq5Sh14TyKmpnSnq7s+alR2fCj2nptp+/X2vIYVBTW/7xxysJwUUcLsAylebkBX6JE9ETjSelLjE7rhzjmbUNnbVm7/Kw5U87cDH6vAXzK9lAyCEEwU8Ucpj94MrHnxEVDOYjVufJ/zDC8llaQOkPKHdKghn5rCpkWeZiExhcO27qLaaw5PIuwtJydFUNYOhhn1+sGGgdoc1LBJTArE85QWwk155dNlSS8OuS/QZ0ECgyXaObeYfW/OKQKH0WLP3JS++TjgLQFNdMdP9jySgNZseFdH99ulADDe+zvEoxvc1NU8zciRwD75IxQoxwT8diGoMkFjpmvGOmX3W95b16H7ZdU6G5CDAPnTQB61LsUvMSRdgRnKWq+PqZtvpo3r
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 12:00:52.0870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 338b4935-a6d6-4a10-fe7e-08d761e7ce42
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3440
Subject: [meta-oe,thud][PATCH 4/6] libiio: bump to version 0.18+
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
X-List-Received-Date: Tue, 05 Nov 2019 12:00:55 -0000
Content-Type: text/plain

Move a few commits ahead of 0.18 in order to resolve build issue
related to static only library installation.

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 4282355f8..4e57d5b77 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,8 +4,9 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
-SRCREV = "6ecff5d46e1b12c2859f0b63a73282940e3402bb"
-PV = "0.15+git${SRCPV}"
+# v0.18 + a single commit fixing the build
+SRCREV = "5090603d01779bb1717fb0c50953330e8770550f"
+PV = "0.18+git${SRCPV}"
 
 SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
 
-- 
2.17.1


