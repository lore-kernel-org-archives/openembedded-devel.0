Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605F8C5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.13])
 by mx.groups.io with SMTP id smtpd.web11.4008.1748691180812374804
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=L9JhCvLf;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.72.13, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQkY97AOjvh8is/3N5y0zbnTRFUgd8ZOSg33a9sFFysC9J48IrhTU/SZYilQ5xe1gyoMPgD/AAwvMRnbz2/UPd6yXQq3xdR3Ak42QxJxRqvMpZBMyOaEIa/acoOVFzJvSgTa2+MFAidEVy5z5iNrZ5TtdxMXS2MYYon2Z97BgWKnw9Kk5/VtzD71cvKfaeupKoCc48n+kVegyn8LoxxrhMDj4dlIx+CVW5AH1XyhKF4NYKvYakVjb5PaFEhoxwaps2q2hG3/MKf06+fYyuwSCUVefKQmu+T2UWJfU9oBAOXzC3qcWX/g4n9R1nfDrGCpjZQxH39+ffEeu+IXth0ESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlvLtB2K3pwhNYzH2Xrgbdu4qMF3FZijhBj2GGJNu6Q=;
 b=NI3vAcqmzo7BQm7+lvapyVrITHzCSkSf8oVORnix2w8v3C0qlcr0zJaoXKtsBZi/07LwETgEvhrwEhxmerT/VPvG/AW/qw/QVjaan1Y6YbYeu7Jy+HB1xPhUg1hUGC58xVYIK3SFSXkbCd5hITRQQVXxFUL1a3lOGrJZ4DAm5xS1vIQp0mO2PGNWvtFvgUdOqOc6K0XOe3wIRC2xOBYwz8HhyIhreVZ1g6MdoAtIPUhM09t5YtRpkCEk3ej/dYgWpygNvrZyTbIZUHB4G+e7aRWXTLxtEH8jf7kDzACF2gF8cyEzhVOWfH4s9pQ9SOPLk9X9OgOw1LUjBW1meCTQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlvLtB2K3pwhNYzH2Xrgbdu4qMF3FZijhBj2GGJNu6Q=;
 b=L9JhCvLf9ThwegIoY1hOiNPX+QM9JAfbM1EMwyHoJe7suohphp5wFpWRyE4lCI6pKPi1YMNCskIteZCO/11W2QfhhLwWS6BTBOt0DZs1xThVMv+h/VnIR/1AN0c+8e2MRrQ35BuNIpCfxKm0Y7scGsS+4MeyCD9GHKTsDAdrqKY=
Received: from PR2PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:101:16::27)
 by AM8PR06MB6914.eurprd06.prod.outlook.com (2603:10a6:20b:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Sat, 31 May
 2025 11:32:55 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::e9) by PR2PR09CA0015.outlook.office365.com
 (2603:10a6:101:16::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Sat,
 31 May 2025 11:32:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:32:55 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:32:53 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	jlu@pengutronix.de
CC: bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v2 3/6] signing.bbclass: add get_root_cert
Date: Sat, 31 May 2025 13:32:49 +0200
Message-ID: <20250531113252.3889951-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0918 (UTC) FILETIME=[BFAD33E0:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|AM8PR06MB6914:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3781d15b-6a43-4cf0-1131-08dda036e342
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dx6eH2NENhOuAsUWr59JAbZ8Lk005jHRlbi364tUZ4xcVQLRStoLPihnyEWa?=
 =?us-ascii?Q?YrhudjxabnQ8UmyTODz70QQqjXbn+AolNpZxE1rUpgxwT30oyZuNWAJqn+Uf?=
 =?us-ascii?Q?hcefWE8hp1TtUbGu06rpqp7FucKk1tQ08lOy4ZI2C/MLxnK9J5uMQpPfCw+0?=
 =?us-ascii?Q?2iKjBEyjWvBNRclgTYRh4H+vfvCSjUIrTvVLS9fo+YLXguylHHKDqD/khx+t?=
 =?us-ascii?Q?tawZ3FEeujA7h4YHjvJ/OuKAtAvAFj2THEnPjLsLWij6deMkOd1KT9NmDgig?=
 =?us-ascii?Q?LWgt7Df6tbb1h4PQ0mE2Ipzfe2KxfCHXX99xPWBWAVW/8Vqbho2rLUbrrVW3?=
 =?us-ascii?Q?bWjU5uz/7SVO3kwfkLite8u9/bUcDH6zPaObeb0i/55VeNwuB1xKRAtMdRhz?=
 =?us-ascii?Q?lAf/GW1Ickm1y/cyPfFl1mA6uMC9PQHQvPzhvIyziX0K8dDFgnYHj4GStajw?=
 =?us-ascii?Q?byNG7eqN982mV33/nJCw20V79cpyMq9gMD8xq8fmq0nDu9UGQvivNMSyB/DL?=
 =?us-ascii?Q?/HrJCetwMtB5XsCVlfuWaaQWHgtEtawkJ8CLADBaTzsOIzPvuF1YDPjogfwB?=
 =?us-ascii?Q?BmX2/sgteVh7IdJmXom0MsEv7fpCpWqDz+vgXR3xQDevqmfhk1RWPY/Uw+tP?=
 =?us-ascii?Q?c6A9MyAUimJ42YlZ42SzEk8NRWDPAgNWARIpuABQeLQqyD3T3bu1pKxzP9si?=
 =?us-ascii?Q?AKbw95qf2rHk7VQ6jbhBvLhAkbOm6afrTGFVFa0ygnPTRTcPAE5qWZtyYMRO?=
 =?us-ascii?Q?yke2vXQ3tSnEuB00IHa4yDDrhGjaQvUEipcjMXhAFrZ+79hjVUFWAzcz26pb?=
 =?us-ascii?Q?6VmRYuguck68E4stQvRFjdKGLMrdb62e+JTutcKK1ttcMwT9RoHYzyma61CJ?=
 =?us-ascii?Q?gSpCKYZzdQP9UDzTC5HepZy2XSRm1v1vdyUbCNUtftsjk5wO1afgnnNvoQj7?=
 =?us-ascii?Q?l5gN5jbYa0oNIuc5sL/6msiGfk59YzHZh9qFQ6aOcoiRBTVXFM1+HkP8eXgc?=
 =?us-ascii?Q?LGMMZuzoVHHcEu+KzZVkSucdx2zeNZ0spapU0bzShtt/irRurHRC2O2vl0Yk?=
 =?us-ascii?Q?7nzJduv/mkfaOzjJimeYEJxWfdwkVJl+x7WXo5ZyKF6bOdLgLqHCAyf7dV8/?=
 =?us-ascii?Q?pLf1eKP/QIxCB3NZ+HYfurBHzMtYPzAxGkadzS38M+YPe23RbBo2UOuFg8Nj?=
 =?us-ascii?Q?FPb0OFCqSfYIbXdvvq0c1PhOvHdgzNjYMwhRj4wXAUqlrOjTeBvunV1qOSdY?=
 =?us-ascii?Q?hV+L7DM3o3LvpXtPf/0YSO0mI7S2JhhMl+8EsXxSCI1O9zkaa4j9BISkVauU?=
 =?us-ascii?Q?CHl2alfF5mQa3O0z6vslfjB3cWrIuGVDXpA902erSCovkk+xf7s0Xx7Os+8q?=
 =?us-ascii?Q?uoGxiv+lKw7pK1E1DuEEFZfw4U4M5luZ9bdp99FDb7gPHw/75Nql5XiYBjwY?=
 =?us-ascii?Q?Uf49L9yawBeBVTWvlAqU1q93hkPC/AQMI2/BvID+OVSWmbarp5a9CDm8O13R?=
 =?us-ascii?Q?hX4HsYXnWwJZlL8VmcO7sXJVpf91xFBYhhYm?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:55.7573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3781d15b-6a43-4cf0-1131-08dda036e342
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6914
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117688

Add a helper method to retrieve the root CA certificate for a given
role, by walking the chain that has been setup with
signing_import_set_ca up to the last element - which is the root.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 5992a75be7..ee32cc12f7 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -180,6 +180,22 @@ signing_has_ca() {
     return $?
 }
=20
+# signing_get_root_cert <cert_name>
+#
+# return the role/name of the CA root certificate for a given
+# <cert_name>, by walking the chain setup with signing_import_set_ca
+# all the way to the last in line that doesn't have a CA set - which
+# would be the root.
+#
+# To be used with SoftHSM.
+signing_get_root_cert() {
+    local cert_name=3D"${1}"
+    while signing_has_ca "${cert_name}"; do
+        cert_name=3D"$(signing_get_ca ${cert_name})"
+    done
+    echo "${cert_name}"
+}
+
 # signing_import_cert_chain_from_pem <role> <pem>
 #
 # Import a certificate *chain* from a PEM file to a role.
--=20
2.34.1


