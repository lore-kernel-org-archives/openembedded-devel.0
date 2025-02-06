Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCF9C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:50:36 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.58])
 by mx.groups.io with SMTP id smtpd.web10.47953.1738864234745253620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 09:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=VfTsza1G;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.58, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdtDz69zvh/RRFkNRVmRXNiszLExU5FcsO2QtiRLMmUqSx/8LJzd3UXC9noSjIpgqBJlWzB4rqWYDnknehVh7mQiUuTQkuhTG6GUvkvkx7F0tzPK+NClf5JxWsdO8QzbuRxU5DqkP/FIwvxVgC/VkKvFZ+Tfq4wGqWSF4PMvU4aL3ze+aAtkVcFVKQCQ5rBxLdzFoxlgAyc22zmHtaiii6Y6iBG5ZZxQqH+/5yUPbgT1GXGNdqO84+7WoXElMq6ntek4ehwl3cF5Ohis/8hyahs43oIPBkq9yWGr3eNFGgmIq8Qi4ZB0gshGhviStzjTwNl6YYIC0EJ5kTzghdKK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2rrL+6eIgqeDeWjuEuiDX2YjuwlWF9q0ZJM/ihYnFA=;
 b=mwGohWm67b727s8ALMdu31eHp+cxRA93rFEh5Z+TX1QoMUIU19ezGRuerMf6m1Hyl3D7HmyXsAwEfJiqwANGz7+utrqLcwvgvLi/6IxdRNTiC4FQDPdkWHMIQyZIRQ/DrmXAx4rvp/Ip89ycZrhurRx9w5jU0dp91EvgYAAxg29uWp5iq6qNZetyofyrFYBCgI8izU64b3SMpoI/7x1PbZyNzosVVYyzaUOeWSxmoQdhv4aXjnxjBHIk9dVDwzXGtoncBpt4QU6ib4CCK7DNPJ62zhsA7R23qWS9RPtEon8hcJLTdJQ+aA4cBnncSziOgFGv2FVfhEynInspoayJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2rrL+6eIgqeDeWjuEuiDX2YjuwlWF9q0ZJM/ihYnFA=;
 b=VfTsza1GJSPPg1FNGHowED52H48JGbgdYqfM/Equ96HTXkmxgIdpp5c2LmMAVqvBEZtcJtA67mOLhOOTti6SmBYN2Us27PsG1hwH7IgDu8duiAf+FY1y6ItiizThm05OLg9RFxjCYjRiY1y6lRdmASEKk+SXhjNHO1QWFPK4DH0xDOChqCCv1GMuDqSZ8vZcTVFRPhLtutLjB/TCzj4anQdWe7qf1vLginOegt+iCsQEJ8PJ9TVm61Ig7c1FlY7aItHHFRWtTS1+1OYw4LV314VToNXxi6NbqF9A8YEcgwTJWxGQcOXxAGJVZtEgiLJilGtFwMMHUqPNlRBlupEa8Q==
Received: from CH0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:610:e5::35)
 by DS0PR12MB7899.namprd12.prod.outlook.com (2603:10b6:8:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 17:50:27 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::58) by CH0PR03CA0270.outlook.office365.com
 (2603:10b6:610:e5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 17:50:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 17:50:27 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Feb 2025 10:49:58 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [meta-oe][scarthgap][PATCH] poco: fix branch: master => poco-1.12.5
Date: Thu, 6 Feb 2025 12:49:06 -0500
Message-ID: <20250206174906.1763440-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DS0PR12MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be7244c-7db8-4cf6-716d-08dd46d6bdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l2SVR2Uay8jZDFoFrq1D4qkEipiTdMzQbPBc3dzZkMcWFxionx7ZnvcySOTx?=
 =?us-ascii?Q?JLvPupyxhT6H6yvFKT+3n0Xrw24xFAmfElXscYrieDEz/6Ln69QM9gkCzKKE?=
 =?us-ascii?Q?1giN1OrhIhAr15RIUOMw/02oLeG3IfGKV3NwIgIs1jEYL5Nkhm242QX1MtN2?=
 =?us-ascii?Q?w1vPj6hbb6d2+N8n7W0jV0Bk3vrx6YJDqmzqGK7Hlxxi4WkPh0t93MBFuXxO?=
 =?us-ascii?Q?45iLEMc+7LELD6cUm9M//1I4wLkumhboHrKwvk7C/Qvfq0FlXlMhpDNTwi95?=
 =?us-ascii?Q?xIsZEhRbW+Gbvha6mlcJPp6e7w/lSi9HEeQ2vfmk5DvDFCjK4SrID5sU/KUZ?=
 =?us-ascii?Q?Hgk/ce4HEvkkAR4Wch4wOHoA3lvHS3fSv3JCDpC/+J6olapKmCY2XGXldhw1?=
 =?us-ascii?Q?EaNP+yPlHppMpZmvxGcTO1wxn/xM68KH9hmsG9yqyKzO6mbaD4jRP1xdU2ke?=
 =?us-ascii?Q?afSPiwyKE240qdEa1I7XmB6GinZGb83DWIEktglXaSqO3E1QjBRFi4GZ/Czu?=
 =?us-ascii?Q?A5xSVmF2bD91Iin/Oot1zDxjamDKJnola5wVtUirqLf4wrowHDio/wwGmREp?=
 =?us-ascii?Q?TFKjjtKfyOsmi0ubp0N2HO3hMSgsOn/FwLZJUhWTEoprV9bekUhsmhpsghY5?=
 =?us-ascii?Q?WyGEBTXSfOp2glccFdYRBreX2Zw+4iiKxzpunw+9B7OXLHk4ezuRTyhIy9mL?=
 =?us-ascii?Q?hDWIneC+E58sXZPVTGw8+SLPUxPzPdP4YxLWhywHN6Zn5Hmrk9CXrCgxNZ/9?=
 =?us-ascii?Q?wP3ZISR8fGZnHC1lw2rqaFXQx5fjH0YSc/YB/x0zcs5bnf6vo4eTCo9kDdVy?=
 =?us-ascii?Q?OwDu6Dx+ySYez6ZLX1Ltp8jqxUh3WbTc+eTXQSQFkSnmgMVqGj3mB2sDgj/q?=
 =?us-ascii?Q?RUYI63ziTW+yvt7OSA+72HI1DMMEnxxaZogU7qted73dQO0kp+LCAGcBZAXf?=
 =?us-ascii?Q?ljddySzPP6FhZi/e1Z9u/2i4Judwrj1r1087LE/nQtdAjwd8C4iJw3iFU3oV?=
 =?us-ascii?Q?HsYFGdfjZsGOuFwSPT8G3TqpapHEvS/n/Z1sh+gYW0E9lmWjbzN8+DfcekP5?=
 =?us-ascii?Q?OBb+v0pWRoQs31ckS8QT33rVqBZNwSpL1WYkmKBw67GnHosRf3fGPLmH7h9Z?=
 =?us-ascii?Q?FLBoGjF0yPT3GLJeDt9Y3u7WW8XYR4UkP/P/uFO9He4ieSgLAqScTNjcxjjM?=
 =?us-ascii?Q?4Yg/tWSeG7d1zjazvp0DEgnqLOeY3EQFBgRFZqiJNLGQgXSSONYYcFlAQsxS?=
 =?us-ascii?Q?XXkTA+zIe8ZpQQKU/3uEs4jEFnUzrrD/kHm2rqy6wORFAgEBwUIZ/JgjfTPv?=
 =?us-ascii?Q?EM954qGQBOqdZjAz2LHzy7Uv7EvlhVCmLWajxOnpJpV4QzLt5fHGYpEU1kWU?=
 =?us-ascii?Q?s+UrEub+Y2YXN5WfZR9Kru4CJygP+6LtSNdRDS9y4zlro+w9A4mxCsc+V4n/?=
 =?us-ascii?Q?+pFSmsPEa11UGrzmuwFSie0ng77kzt2U6l9lqkC2aEOGBxcTbI9LYg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:50:27.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be7244c-7db8-4cf6-716d-08dd46d6bdac
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7899
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 17:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115292

From: Chris Laplante <chris.laplante@agilent.com>

Upstream renamed branch to 'main', however this commit isn't found on
main. Thankfully the poco-1.12.5 branch exists.

This patch is not suitable for 'master' on meta-oe because it uses a
newer version of poco, which *is* on 'main' branch.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta-oe/recipes-support/poco/poco_1.12.5p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb b/meta-oe/recipe=
s-support/poco/poco_1.12.5p2.bb
index a0bb0b5d96..dc6e65b994 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.5p2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4267f48fc738f503=
80cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS =3D "libpcre2 zlib"
=20
-SRC_URI =3D "git://github.com/pocoproject/poco.git;branch=3Dmaster;protoco=
l=3Dhttps \
+SRC_URI =3D "git://github.com/pocoproject/poco.git;branch=3Dpoco-1.12.5;pr=
otocol=3Dhttps \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch=
 \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.pat=
ch \
            file://run-ptest \
--=20
2.43.0


