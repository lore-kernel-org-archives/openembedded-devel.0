Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800108.outbound.protection.outlook.com [40.107.80.108])
	by mail.openembedded.org (Postfix) with ESMTP id C45B87F7A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KRgf9YeC5VLEyr2RJonykym95frF+NEei81ToAWjxQbUl82RgMBLaA9jyGEKBho8yfeDjhISF4xgpCM6PA6+f29YHCUFrb/wjZggn7mbumqSGLomGQJHSA30RYx+NDOlheKQXQmcWjVDJ5/sRmRwVFvrc9x3Pxy5YmAvjJPi+6EhzHriPeZURkEUabBNKDdobj2MRfrWDgrMP7eIMCi1Q9z0YfOiKC5B5CKu2Ag7M7YJIdvUstVC5OX6j7w4JZgd8iK3+iHh2+h3x2tuVzwLRRsAlFnKPKniPy7e6CCK51KfWKIxV78L6IzbrESXKRKZQYBR1zD4aOPnVyjWf/6JCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mvIS4t45m9NwbHhgutzJTW5osVWizeis7Qrw/txzqnQ=;
	b=ktpZPpiD5cqoKAcUV29Jx30KTmVCjqIaWCeFSuQOYeH+1PLmhUttnd/iwODR4WmPRnQzQmyXVjONiLFSbUGMVqjdgnAa1qw8iZ1QvkgTC/0f0lEBtNlzAq/sVWi1imL8Twdx+qhyWWVZAypFkVQBUYcifm5/LeKYynBEgNjc3SWrycwZsvO38clYqyRrmC9Jn40BE7VICa2a6PxkCEYgVfoFv5I6K/eVGRqroMaoSgW5iravnO1Ap5D45F3T3bGh88bBxEqrtNMOvkCxKjUEjLrjzLExN7JxmwtDwbJKN54qCUsfie05Ngwkg3NeiV6rjBmFQVywdbO6GLrbm+4FBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mvIS4t45m9NwbHhgutzJTW5osVWizeis7Qrw/txzqnQ=;
	b=gnNOzcyj8u1r9VW+0ylqHXGnEVnI7dCkhXhsKNqBi1CJ1gtxVB20z9tKUVL4LRgRxwWUhEfv02T5e/xr+v9Ke20Ur4DKLRn8JoMnhkmSZFWA1TTu92859RZYwON/VC6K1W4QZVIyj/4HNDUAX8NWUvsB9juDQzcD+kwE3hPWgS8=
Received: from BYAPR04CA0031.namprd04.prod.outlook.com (2603:10b6:a03:40::44)
	by BYAPR04MB6102.namprd04.prod.outlook.com (2603:10b6:a03:e8::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20;
	Thu, 31 Oct 2019 16:15:34 +0000
Received: from SN1NAM01FT025.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e40::201) by BYAPR04CA0031.outlook.office365.com
	(2603:10b6:a03:40::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.21 via
	Frontend Transport; Thu, 31 Oct 2019 16:15:34 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	SN1NAM01FT025.mail.protection.outlook.com (10.152.65.210) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.28 via Frontend Transport; Thu, 31 Oct 2019 16:15:33 +0000
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1466.3; Thu, 31 Oct 2019 11:15:32 -0500
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 31 Oct 2019 11:15:32 -0500
Received: from ola-ght37x2-bionic.ad.garmin.com (10.5.84.15) by
	smtp.garmin.com (10.5.144.12) with Microsoft SMTP Server id 15.1.1779.2
	via Frontend Transport; Thu, 31 Oct 2019 11:15:32 -0500
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 11:15:27 -0500
Message-ID: <20191031161527.5794-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25014.000
X-TM-AS-Result: No-0.504800-8.000000-10
X-TMASE-MatchedRID: IaTkbnUEhzTNGaPYFjg9zs9R/UqWnLW42gp+A6golzYHZBaLwEXlKDI3
	NdfFmGpMfS0Ip2eEHnzmEN83F06F6/oLR4+zsDTt9xS3mVzWUuCMx6OO8+QGvjymoZJKR6fj8g1
	pUWOZcGiF5Gx3SBAAP3hd00RAog8kKQgLB7oRao6H+wfh9VLsitdkPv7muhpYCMJgNQAYkxoN7H
	AfHnFV9Z5GYDWqos2y9s/r/x5RpLjAmqkoMKWEeHmGvpUtLk3QVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.504800-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25014.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(44832011)(246002)(2616005)(4326008)(336012)(86362001)(6916009)(5660300002)(107886003)(7696005)(51416003)(2906002)(8936002)(50466002)(1076003)(48376002)(36756003)(8676002)(4744005)(50226002)(126002)(476003)(486006)(2351001)(426003)(186003)(26005)(478600001)(106002)(76130400001)(356004)(6666004)(316002)(305945005)(70586007)(54906003)(2870700001)(47776003)(7636002)(26826003)(70206006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6102;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4b6b3f6-9ae1-4c57-34e6-08d75e1d8eaf
X-MS-TrafficTypeDiagnostic: BYAPR04MB6102:
X-Microsoft-Antispam-PRVS: <BYAPR04MB610243787F89E1B25A70FF8FFF630@BYAPR04MB6102.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdzsrXgxr6nwnY5iD5QA5nbDJrlTRne6DzMA0o81G2Yc7oTw3g0QScWACu/ayhr3tsQwVdGrLMB4wT5tcAawMeisivm30pgcdO24zCuM/+mKbLm+Xh708nJh1zzzLBQBH4iD/6vpI6K93xqRZhoJHIAElwR2rwDgX36ljtvXFxQAy1z21+0JI9I0d3mF9oqqYYdcwkEgAVdODlgqLudokW6yl8E+cBYoovN8eZR2nDit7cqGBbdXsNqGO3oINBkYG3SsaHaxMVeD3T+gowxP7OLJSg/IfGgYgGE/ZNNJwae+ACgYEi0nNjqYIbUZ0TehFmwMCJZpo4vzxRJZHIlrpHxV4dQW0dnZ0sFrANzBw9jvOJyVZfowHV9sbyNjHxN+i6/lm9QT76zDc0HXptt2rMxRCD1Sn88jZh2SNTNlV7asQkyfCPHQIoOjPO0ok/hL
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 16:15:33.6113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b6b3f6-9ae1-4c57-34e6-08d75e1d8eaf
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6102
Subject: [meta-python][morty][PATCH] python-ipaddress: add native and nativesdk
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
X-List-Received-Date: Thu, 31 Oct 2019 16:15:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

(cherry picked from commit a541eb88e4dabf506ff2b6c07e7ca19d34a316d7)

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
index 1e97ef7c5..3de8870ae 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "1e27b62aa20f5b6fc200b2bdbf0d0847"
 SRC_URI[sha256sum] = "5a3182b322a706525c46282ca6f064d27a02cffbd449f9f47416f1dc96aa71b0"
 
 inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0


