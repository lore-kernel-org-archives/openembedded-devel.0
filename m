Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F50CE9D7F
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:56:31 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94546.1767718582088315733
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 08:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=RLLFjWg2;
 spf=pass (domain: axis.com, ip: 40.107.162.18, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqGgs8i8KRFIygXiAaXil4zb1QajmL1dege957TsV4/1wVK3gvDS6Hj27iS6Dr6sk7glfG8eoazZD27DkMMr2YkgcqoqAmXC5MMT4yqxLkDgMgs5Cm9CEkWWhQtHX3Ev52PVPBaRcBeK37PIgLGrSwclHP1+F9EMTKRFVGb7X6J8iwLSaU8YI0nYyw9sjrMzlcJMYBF14nPLpA0dWHvNiYXOXfhnJo/V2DsMFgCTSYu+gWgpkT+XVw+ISuKBdQZgxZ33NiEgI7Q1bUMGayind4wrnz1B1pVrybzpYdqUbGXiyeus8yrnQ3Lvos5GtuW0YGedpClesn1J4qF+FahgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+7/qr3nMQIMvNs6pflplYEqrgrtnaoqvqGi1My8ytQ=;
 b=U4uqo8JTK2ONrf7JNqqi7W/2qV+KK+4owegpUB0q1WV+h9aLNuKRtUTxy9Me98C/obvVCfqfEr8Byw1f7PxFxQkQiJuswunoRPd6h9c8Mr2tePNAt3xNqZvlAWYVcqZgLbyO5zLu0tTGyVUGfSCvo/2V3hk15fClYvfCZ2TJooa8Rg30A6DabHXC9NI2DYAuOiCwMzwSb+XikI2d8sIIM02Q6Ju1kECVWx+nmIaUhj2ZZ0st7VLI9A2RT1WeE6VzZg0SThjiHgGObK5ADC9/enbCjfFUtQ/j0gdPDbM6EcyxLRWLZ/zJvu81o72FjdbXAwPodYgBT5+qZx4Q+n1oKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+7/qr3nMQIMvNs6pflplYEqrgrtnaoqvqGi1My8ytQ=;
 b=RLLFjWg2tcFncxEZ+VT4/k4VOVS+5qoQQpIuXCkQMsdWWGm7AbnDWXaBts7NPjchO9u6BHqIfV/a0fLfxQ9wl74K7GaaTJkK4wYnk0UmlBuJkDNTBlFI1wHEsOwW1kuxOrV5GHdDaXu3bJCo5R57py9T9zjIdJW84KImSxhmXTo=
Received: from PA7P264CA0532.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3db::6)
 by DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 16:56:16 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:3db:cafe::2c) by PA7P264CA0532.outlook.office365.com
 (2603:10a6:102:3db::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 16:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Tue, 6 Jan 2026 16:56:15 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 6 Jan
 2026 17:56:15 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 6 Jan
 2026 17:56:15 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Tue, 6 Jan 2026 17:56:15 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 53DFE193C
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Jan 2026 17:56:15 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 4E5D1129963; Tue,  6 Jan 2026 17:56:15 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] net-snmp: Update to 5.9.5.2
Date: Tue, 6 Jan 2026 17:56:12 +0100
Message-ID: <20260106165612.255674-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|DU0PR02MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f3f79b-a88e-48ff-af59-08de4d44816f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dqyKAmk9WXAhySMjC+avKKi49c5gnvQ44rvnVVFfqg0Hm//JMxO4tYsCnLkL?=
 =?us-ascii?Q?AeO6YiOFR8kyIiAIAw7NrVzqB5cQmKznnT1LauN8huUF3oytLmbfGP1W9PH8?=
 =?us-ascii?Q?jHTTl0eLkHc/yxjazqH0PG7Ija4KCz0oNZqEDB5nMvBvdJPxrZso1HxFv6dv?=
 =?us-ascii?Q?yAIrEwbMyQhnVMh0dEz23WT9wmTTCffI8R7AvWq+qhJZRN4mjuxLKYcJJri3?=
 =?us-ascii?Q?nS09tGPL/lAZql+Wv+jvpZKMhxKcxHW9AZa/algiwmJu5gl4kAZ0uj7yM+Ab?=
 =?us-ascii?Q?GRTBK4w2KYYEjC/7AWN2AQVhTyJrWwAPpmYGzwWGQOzPTEVgDeQL8GQdDgtT?=
 =?us-ascii?Q?i0SJe71PVm5aU1KGm+ddWah5PvrRf0P5JeKL74wM3V3+2Aw2U+DyolaevG+6?=
 =?us-ascii?Q?7KKtWpgmNg95tFfAdGriDB4D1sYaeW1EVEvicdwtwIzU+RMdLpDCMhbA+SEN?=
 =?us-ascii?Q?PV5VmCvmNZKGZ6a3XQ59JpGR3h4ddkr5lmK/McWAXrK5IRwAW4UiceGcUZuC?=
 =?us-ascii?Q?7bVFOKAkyIdy7sARwNMfQnq7HbVwCWfuFDd60AOnf/B+rYTEcM5z4MKTXdoS?=
 =?us-ascii?Q?CuHQnthXkoVhOJUvgN88q+WtuwLSNYU5m04fVgk/4oZ1vMgatWZWc5B7d3yH?=
 =?us-ascii?Q?yIwmhW5TeW8i7bn1iwpkDgbjFvBrWukvq8pRlox1r6wjqZlVEQtUZN9NbdzL?=
 =?us-ascii?Q?iVDvXHLmd3DP2mS8EDN2gnCkoCzojP9NFQdizj0kzoB6eA8+ZPIkodcld8TX?=
 =?us-ascii?Q?sKMdutAPruU15YrTQ5WHSlL3XlVQPEOy3F8QIqPk0G8rVreFI6lX5cltJGA0?=
 =?us-ascii?Q?Eh9RqYlK36UgGhUdXOpn9nyTuSmL9jgBQjc11YVDLdyQ/hP3kXNkTR4sHOiK?=
 =?us-ascii?Q?frWWeSbu62bhaJ9ESV+sGK6AnK6CUd4cghp1Cu4WuF/KZt9rxfFRriXlnQJB?=
 =?us-ascii?Q?xt008bfv8G+AbQ041thypUjQRbc+XaBPyA5J4TJsJ2/wwVhpyQoVD+cCH8Rm?=
 =?us-ascii?Q?IrOEDE2zTIB/8QfJV/+wYkl823XtCSRO3zGHDYciZ7QHpi5nmHsgLQWw3npn?=
 =?us-ascii?Q?ff6T/kbHFNPWl7AeR2wduuzjgaDF26Q/0nWUUzpjdLZSslttxIzqYEMDqTPL?=
 =?us-ascii?Q?bw8AHhs+aNZfengCV0CRlLaDn7WTGqoUOYj5khzrvdZABDAEuJvA3Wzg72ma?=
 =?us-ascii?Q?UbCE08DZ3jA9133X4F/+DCghY82xQ7iafB/BPw2Ybk8HiKJOm4x3RHfklgNR?=
 =?us-ascii?Q?4cqMWtx5mGESeK5RcFIFbJwC/7dgOb1dmnEK++uNxRA3cv8rtt7X6qKbi2lZ?=
 =?us-ascii?Q?w6f64idg7OiOpEeVuckyh3uj4yv9oKyQkxv+sZHt6J6u54GJRPoX4hAVVPy7?=
 =?us-ascii?Q?R1fDmkCP5wPZj9rMEz+ycuAYX2mtLNHmSRZ9+EaxwU5pmNhFSRsSYnXZ+7/R?=
 =?us-ascii?Q?nZDPlxh0MC9Uc6TMjSI/Ot6Ygfm4Vrd0DVItU1QGd64qrJyo0WoF7wI6KiyQ?=
 =?us-ascii?Q?+DThOehXb6CK/OsJ7adROrnsO6HMm99vENyO3KnnA6MKmmEjFpTsA4rZzy2a?=
 =?us-ascii?Q?M41/RhGGy335iAHL4J4=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 16:56:15.7662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f3f79b-a88e-48ff-af59-08de4d44816f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 16:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123182

5.9.5.1:
* Only a version numbering fix.

5.9.5.2:
* Fix an issue with needing limits.h included.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../net-snmp/{net-snmp_5.9.5.bb =3D> net-snmp_5.9.5.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.9.5.bb =3D> =
net-snmp_5.9.5.2.bb} (99%)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
similarity index 99%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index f4108d9715..b7c9607b3b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -26,7 +26,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV=
}.tar.gz \
            file://0011-ac_add_search_path.m4-keep-consistent-between-32bit=
-.patch \
            file://netsnmp-swinst-crash.patch \
            "
-SRC_URI[sha256sum] =3D "07f94f06a8d681485e43eeec4f190d9bea43e1b335146d0de4=
66b6de3f3f4c5a"
+SRC_URI[sha256sum] =3D "16707719f833184a4b72835dac359ae188123b06b5e42817c0=
0790d7dc1384bf"
=20
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/net-snmp/files/ne=
t-snmp/"
 UPSTREAM_CHECK_REGEX =3D "/net-snmp/(?P<pver>\d+(\.\d+)+)/"

