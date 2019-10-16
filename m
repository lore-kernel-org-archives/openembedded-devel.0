Return-Path: <mns@gomspace.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130104.outbound.protection.outlook.com [40.107.13.104])
	by mail.openembedded.org (Postfix) with ESMTP id 8CED07F4A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 11:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Ke2HEFLuAeo29Bdm8q3beIuY+opaKH9kct91PfI+S3mQhA4YUJ81otMVr28+JAXg9NCoVBlTKYcVMkhWTGAuzf4veeaE76tewNnxIPlf2DCgdKjso3e8rsqdQ4vZc68BDdoeGvCUFru+Fjhw0UtVGX1CKjYPt8xtQk2haB0PaVN67QC/QNXrP0b34Vwq+yAHhz708hqTeclkYDYBlYl0sY1XX0NL1rVlYjPBYVHMX7M4POhfbFnTnuhvn5aK/GX4GwUkuuK6stPc1cs2O8EyHcYRd8s2K368hnKm0F55uzWGDTzbnCk0yBXlYXTzLPmodpC3nhh0YcwhHump049gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TnBIYOMBJtjSLz8qBuhzZ1QCThLCfk5V82re3xBi9Ek=;
	b=b7eymKahr0EknzwTlqZIpZT+C0Y9ulnuCPbW5x/eLzxE6JQDTABszWdCswV/cRut3yGiT0x9s/6kBb8UOT0gym57Pad+TZhheIvvswdqFDWadbSffj8ynxGnXn4YxGo4ZCxSm4H3fAGHn0mSyX53VnYNcmRK+Z9DkNVYjTIsO+2NBF5PytaHtGnWVswqGwwAFfOS4qUGPel8KJYSWeH+f0LIr4aSPDlB8oZdIJQgk9bQnzme+atQfV8Kl1smeiGwl0PkgFuUQYagCAIxwSCef/qsShowh5fiT6OuMo41hGEQcVi2ZPAThPNHteNAlzsLSx8bsPHW5ge1HJmBbU4w6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TnBIYOMBJtjSLz8qBuhzZ1QCThLCfk5V82re3xBi9Ek=;
	b=SKgOUTr0YL7OT1ig3sA/2VJD3OkYWLduAIVyD1JICfDXPmFJBdkdVJpf7BuwfRrHL03/PX4fdEYZbuLhJZ/6qAeRAsAKfg/hytdwg6qCz+PVHjWFkXKl+56MCg4fWel4orVntUqOclzpvFPSmsPdqYw4wGaw2KyAlFpc1D0XZJw=
Received: from VE1PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:803:104::18)
	by DB7PR08MB3356.eurprd08.prod.outlook.com (2603:10a6:5:1c::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21;
	Wed, 16 Oct 2019 11:01:15 +0000
Received: from HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e1f::200) by VE1PR08CA0005.outlook.office365.com
	(2603:10a6:803:104::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Wed, 16 Oct 2019 11:01:15 +0000
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
	15.20.2347.16 via Frontend Transport; Wed, 16 Oct 2019 11:01:14 +0000
Received: from dell.gomspace.lan (10.0.8.211) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Wed, 16 Oct 2019 13:01:12 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Oct 2019 13:00:57 +0200
Message-ID: <20191016110057.11406-3-mns@gomspace.com>
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
	SFS:(10019020)(39840400004)(376002)(346002)(396003)(136003)(1110001)(339900001)(199004)(189003)(24433001)(7736002)(305945005)(50226002)(316002)(33026002)(6916009)(5660300002)(86362001)(16586007)(76130400001)(4744005)(508600001)(26826003)(70206006)(40036005)(70586007)(48376002)(81166006)(47776003)(1076003)(8676002)(81156014)(8936002)(6116002)(6666004)(356004)(14444005)(11346002)(105606002)(53416004)(486006)(2906002)(336012)(126002)(446003)(4326008)(3846002)(36756003)(2351001)(21086003)(50466002)(2616005)(476003)(107886003)(16526019)(26005)(386003)(76176011)(186003)(51416003)(8193001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR08MB3356; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04866d84-fcff-4976-ff8e-08d7522829d9
X-MS-TrafficTypeDiagnostic: DB7PR08MB3356:
X-Microsoft-Antispam-PRVS: <DB7PR08MB335614FD9797BB90D4F34CA1C4920@DB7PR08MB3356.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7uJs5E39UNuPeMciENv8tydj8aG6lEJszVZQ5JB5yf+hmyJ4QVYbEDGopaBrLiOPj0c+keKthfAbL3UZm5Np4nCcUCE+N0j/pRW/prBHPh9oTGqVWn2RY43uwn/pI2DehBiEkLi6+I1SQxFRMbkb0XxIQgUOrByVsFetXv4SEemVfW6+kYVozjFACL42lSuZhJDLf2ck9lYf/ELynVdsZD7WE66dUSU5JXnwckwVT1laEyswl8+JvZmm6qkNU7mdJDqRQGC8Gxpy6UqEi8FvuuuoqWv6L6FU6Pc+qRyeer2fJluBCBGIREDIihrgp47wfa+VLrgmBHstL+WGEKoUScdVjwb5Nr52kIsQx16ANH8mByU83Tx4dI93UAPZgip0H9DJ+x+jmhBHwWYOxlN0sMa/hrQwx2F89Ed1TcTXm20=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 11:01:14.9365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04866d84-fcff-4976-ff8e-08d7522829d9
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3356
Cc: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH 3/3] libiio: bump to version 0.18+
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
X-List-Received-Date: Wed, 16 Oct 2019 11:01:17 -0000
Content-Type: text/plain

Move a few commits ahead of 0.18 in order to resolve build issue
related to static only library installation.

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
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


