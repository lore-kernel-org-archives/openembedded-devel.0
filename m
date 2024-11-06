Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAF8D44D78
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:22:17 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.44])
 by mx.groups.io with SMTP id smtpd.web10.46843.1730902930106845196
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 06:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=sFME+VUR;
 spf=pass (domain: arri.de, ip: 40.107.249.44, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYAjH3NkDxj6nZLLnAD9nukKbrnnUCi3H9iGPCmBvlpHeuf7ZJ5BXS8fVr3vCYXSoL0F2QcuXUtrUfTvQbG8MyvgD/P1nJf7DbCOtoyqcxtqNIxSHcOcun0dTk11dGFi2ix9XkxVa6OSZDvRW7BMF5Iz7DNY43yGf18NTVdnXOyuL6kf9HK0RjH9nTeTn2BMvXdhD2SeGyk6D1eVLPHgOd0boeuZOXVOgkLnwqgXti4LDvKaJtiaDNFoiKtw5T47n01kvzEvYfmM0vGhOOEp+iKk4fReN5VM5g0LwSUjc/hYiTUz4nSoX4q9BkR9wMAR1SxrsdJ2xMTIyp8Duo1weA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAAzetm9XoM9+YDHuQPyqHVE/FWZvwMt3PIQXhjx97E=;
 b=l/IF/0uRHNh1rKCyfbsKse0p/+tCeyils7iXt5OetFoXQLoPqqo0T/OLwspvjcTWndVsnHKxcN3qTHHE5/oj4ULXUjHVELlQQeepnL3/tcsUk0ZLHp7EMbZoEiJPdBbuT1+gIVk0Rm9XB1t4zESzx7LEfoBMe/x/sI9HtLMq2/LoDZsJp5STNwooVP3Dg8z5pmtSNugJheYIQMfhHnCRxtBdMEsZHt3PTb9uRdK6eWcIr2+aW1hky4s4wsUI9km1vwS46GUqGr/dLrXeM97o8WcohwHTKpuPUYer6laZbK14OiTcioMy9jOq0UuXuFs1mAdxViKzeLufcdiaECi+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAAzetm9XoM9+YDHuQPyqHVE/FWZvwMt3PIQXhjx97E=;
 b=sFME+VUREGK5HrJESB6sT6XKzRWu2NHyscGV4njHGEWeZRgrP5oL2w2wSs2dw2jJwGPFxrAGCPNHZelHRPxlmPJlIRXqfqjYknAmAKBO1mMQ9JDze6wq0xryv9OJADnyr4/EbZ++c1Ns/N+QlJJhr3fEV1tJopuQhsDwXl+b+Lc=
Received: from AS4P190CA0052.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::24)
 by PAXPR07MB9616.eurprd07.prod.outlook.com (2603:10a6:102:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 14:22:05 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::b6) by AS4P190CA0052.outlook.office365.com
 (2603:10a6:20b:656::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 14:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 14:22:05 +0000
Received: from N9W6SW14.arri.de (10.30.4.236) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 6 Nov
 2024 15:22:04 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] abseil-cpp: append to PACKAGES_DYNAMIC
Date: Wed, 6 Nov 2024 15:21:35 +0100
Message-ID: <20241106142135.13172-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.236]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|PAXPR07MB9616:EE_
X-MS-Office365-Filtering-Correlation-Id: 5402886b-ad20-4a37-1773-08dcfe6e63bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WlnuCwUjYz4V21C6ghBmgzIrd5aMDXmojVTx4V/tR1Q5XeSqbUHtgor3d9On?=
 =?us-ascii?Q?XPkVTO5b98speoT5CuzHx6ATtMf5x0O8q4FedfMuWXlsj3k1GKJ3iC9WrXfI?=
 =?us-ascii?Q?GVcjtMZEZqiJMR7z/mLKDusRpWvpCZiEgd2RLQfwLfwoy72pxE2tOmNLelyr?=
 =?us-ascii?Q?SM/IJZx1jI8DcDLZwGvpz8VIUmZwUX0CjJPZ6jDQRbGOO/ehGnUzy5cmW6mt?=
 =?us-ascii?Q?/1SM/ALtwvMKxiZ/Qvpsu9YqYf5LDk3shademhOM5v4KHdS7E+yZG4hbZrkf?=
 =?us-ascii?Q?fzcOxgi/iAdLWzphqjXbsZ6LGg1J8D71jLXtMxAotbCrhLeQKfIFnOYbF7IQ?=
 =?us-ascii?Q?fr7vhXlh1Wysj6NS/gozh+kkIRw2RBwcn7xSoFNsrkwC59hmjhZEF7Yu9qgW?=
 =?us-ascii?Q?PqtsmMdfaLgBikBCJsu0lDPtryqIem8539UBUc5kHRK9YrYeorydNNpqq+n+?=
 =?us-ascii?Q?ksP1O4jOXfrZoYJQRaV8Eb+ovGZPT9caAzNQUJAEPWw1RXxj8/HrF6Rpzv5Z?=
 =?us-ascii?Q?XefjKUKPWZk3bzvYITsCAF7HZZPk9LmXg7VxaB2WFpYj23YCLqh0JUt8rt7A?=
 =?us-ascii?Q?4DvwetLRKkG/q10ACx5FcdES6KZ44g9ABgOBqV43G2lpqabMVA2WTLsLsCP7?=
 =?us-ascii?Q?btZfOi/i8pPkgNOwhiocAmChm151lxaGtkO1zQildyoKBlz/OxFT15bHjE31?=
 =?us-ascii?Q?wJPgHEP59JkA1wAGFPS87grfIiXhV9RX/FbIFk75zvmaZJU5OzBJaKYIBKnO?=
 =?us-ascii?Q?pgulXfclzs1tLr6v25YJiLnkMVAgKlFcN2dd8pfrmLYfqaN0lyOfUkkJe7gz?=
 =?us-ascii?Q?dCx3rD4xOd8A+S2aO+Yd7c1gNZBe6/ZGKWT8nFhAfb9IuWdwNsdUcijpgq6K?=
 =?us-ascii?Q?sZIiIJh/TKOoGosOeqFZlo287kYLSv0raV450YOwXQNdXjP+xQ7XHpnZlNPu?=
 =?us-ascii?Q?NCXBYNObS77p2e+4KOr6coQxUvDPgLpel8KeZik37YzHNLErNcbC5OoFgxIF?=
 =?us-ascii?Q?Ka/JQtkZdMvsI9rCeEfBkrWXp5nkr3kmoVznymJHY9euyLaUt7+SjAEtocoo?=
 =?us-ascii?Q?0dNDN0XFgKWmYC50JG8yGyYLqG+AznSU0EHiDOGAWMZdzAtDTGv85eopVGQP?=
 =?us-ascii?Q?u/K8kA0DvjniMxw+znUU5lRBVu0Ga7hOy50qyreW+UWfnrQyAg3uxMhnycqB?=
 =?us-ascii?Q?4lKMRzP7PEaRGeWs+nKvxTJEJMvZBLBs6+uTmgWZzl0QSjN+VFLeNanj2l5i?=
 =?us-ascii?Q?V5jwkgdhpZGenaVdYe1qQ+OPOJDlF4XWnNLvfDtiaa//PHYTtrnoQeC3bRTM?=
 =?us-ascii?Q?9tCvCu37mH3TtlU1+L9EAHs+GYno6n0oXA2MRANdoqLMSgZYrnO8ZaZxAsIv?=
 =?us-ascii?Q?90Vws4adLlGLiYRZ201hkCpY8bVVi8ul1RyuZQWjiG55VxsDXQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:22:05.2584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5402886b-ad20-4a37-1773-08dcfe6e63bc
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB9616
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 14:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113740

PACKAGES_DYNAMIC may already contain entries (e.g. set by bitbake.conf
or the distro configuration files).

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb b=
/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
index d9634b2b049c..4bfc2100e4f7 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
@@ -28,7 +28,7 @@ EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
=20
 SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
=20
-PACKAGES_DYNAMIC =3D "^libabsl-*"
+PACKAGES_DYNAMIC +=3D "^libabsl-*"
 PACKAGES_DYNAMIC:class-native =3D ""
=20
 PACKAGESPLITFUNCS =3D+ "split_dynamic_packages"
--=20
2.43.0


