Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA2AC61CE5
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.34])
 by mx.groups.io with SMTP id smtpd.web10.4120.1748691179956723909
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=THY75B0z;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.162.34, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Apfvb/DNTSBk1XrXm5Ms0cjBW85T2Fcy4z5OvmyWuE4Bi5s47V/TaG/pIkx8NoFMEtpSIGDbbsDpcxV9JWtEKhXGJoAt5fJXbzaj4JuriFt7nYF6fnj9L4cV/Rx1UBMy9RpJpTnVY7iYXVa4z8hXWE23BcFJFir5a4rAoLYWl6+f0tiGj+tJf9yNiI/6IdkM8IGBnwOli8BbfZ0qfQnRcmfjIrU4MiJE6TIAtHyeMbDWXW5XhG5SMcc2Y6//LGwLHsGCKtKEErBpiAIDIo3TVEw6KeEVUY64OUHSJwyC7RY9vRU0PSxi/bW2i9AtQxnqxSlT321vDCFw8E2nMKmBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMgSw78zTIaLBUvrxW3C7gosnREPIY1y5xa9U9p5nXI=;
 b=jdZcZOUkBZJiCZxZ3lW3fKNQioUAJ5PTxvSKTFerEUE4r1cTA09QWT2Fy5Jz6sxD8sBeWPAunfr2oMqzjJcjybYxtlyYunmYQIx7n4nGRs/ZvngJHfPZxt5ezddLssOspwt9JOb3acQUgNe3WiTB67rsUL3Roe6/JA9zWzVPviF0KF/uB0YrRBpspg9kmcMUr6gsaHSgX9ywwKkhFyH1zQj5K4za48KCyMQHCMItCwHgGh11T/mcanZiBDRQ47kiA2lFPIywvwLHBg+aLyiME72c73XhriqHqisE9cTDxhVg5Q+2wplDoKTrMycIRkhN52U8AgUCEhd6OD4hZ9wxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMgSw78zTIaLBUvrxW3C7gosnREPIY1y5xa9U9p5nXI=;
 b=THY75B0zQk5G4TITtgUu9R8d7kImz3Rkpq+M9kUBxgA4nhyk6i+x+8wvm3NnAtNN/BC7HcqcmDPn/9WcAgx+BzL0z1LYicTeHuSXhOWowFfA/ivjJS13LCm366OY8Q62XphCG0HNbtgYJAOEzy/zM5kyto8ZmMWIHsQ42X92K60=
Received: from PR2PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:101:16::13)
 by GV2PR06MB9875.eurprd06.prod.outlook.com (2603:10a6:150:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Sat, 31 May
 2025 11:32:55 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::d2) by PR2PR09CA0001.outlook.office365.com
 (2603:10a6:101:16::13) with Microsoft SMTP Server (version=TLS1_3,
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
Subject: [meta-oe][PATCH v2 2/6] signing.bbclass: add set|get|has_ca functions
Date: Sat, 31 May 2025 13:32:48 +0200
Message-ID: <20250531113252.3889951-3-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0871 (UTC) FILETIME=[BFA607F0:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|GV2PR06MB9875:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: caed934f-1bac-46c1-8da1-08dda036e2e0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?khS7VIaPqRPsHXMI9Qn42BSlzQfYsPk9ZO0XBoHNmvwN7Rgb3BF6AAnzbxsD?=
 =?us-ascii?Q?Tim3jV+aCVdL07GyHLugLtLqRTzrBtC3l23ni38QPDbg99gFp/AMVdJiZ/XE?=
 =?us-ascii?Q?tiEW5qG51um3tT7xDK20lCvAS3II/fhPG45pRH5zjlZ7RiM4W9ncXT11tgyg?=
 =?us-ascii?Q?KYYLfk1f1OaPDAJ/ZMevF2gUVs3EHz2lgcJ0VKhPvTvNIBiBvc+7dogOCwJt?=
 =?us-ascii?Q?evN3L7yickoCbGkdc98SXfDJQY/THaETQ6e8wzH1DsipIImXxiNFHwFnagcu?=
 =?us-ascii?Q?pKP7zGLlPYUwBMpts2yZD5Mo606rAKPVBhKppSSicMAa2K9pFwAIcqgbhHQB?=
 =?us-ascii?Q?Mmw9d9tC0Cz+XAK4DH77saTv4M5oD0ygq5iYtG3NmEXE3UnztupOgvUQBUCy?=
 =?us-ascii?Q?4nY2B9BmAEgSP+03VfjwLZk98TVSbH4YOLCRMQ+GAFlb6VY+0XcbJLWH7LYe?=
 =?us-ascii?Q?t2K5aZEGBmywOPqgKAtW6fDXeypY38+vDw1YX/ppgbuadN6dxvKQxUUmQiQJ?=
 =?us-ascii?Q?3jjv1G13XZ4N8BhPsX96zZuwf2LdBTdPpnLQIxYQOiqzEy0Eo55epxZocSf/?=
 =?us-ascii?Q?gzLTHIOXwa+qXTV18bz9In34XoDmoSB1R3uQ2SH+jdGkIzOQ01eebdQvBDLv?=
 =?us-ascii?Q?lwA7FSqY/+5FKIwnCwOgxTulryfmWlJN3y3hSSij5wAihWnYW4/h/sHI7VuS?=
 =?us-ascii?Q?Gudp9BE8OWzCAnKNCDuLM5gn/tYMktHvYshP5eYaVL9VxYBC3RJGwZEoQl+i?=
 =?us-ascii?Q?Xjq0MJjgUrqvfzCU5AkxbMPmO7Q+jSlWmoJIO1frsivde8yCebbIVHYjY3IE?=
 =?us-ascii?Q?4IrSW2DoQ495IBXg55eBohb/pRKQVTTTXhAK5Gd249q+LljMV3MXlEs4+oKn?=
 =?us-ascii?Q?n+Cksmq0SFYt+MBrvcTPxXLTgQMD1dD3uJq7RwGmRZzc3dWf6n/BbIN2UpnW?=
 =?us-ascii?Q?8heK11UcQ3VmmRCtOsi5j4JbFvA3f7oLoZgmy/WMIkE6Q2Njb3a/w1FCrw9e?=
 =?us-ascii?Q?cixe0IyaiLf8w++OPaogRUd3XBpcgsAKDTUOSdz9q7W88h4fE5cCs4/y2As2?=
 =?us-ascii?Q?tmAC2JhyHTSL6pA9DJDfBTUSzGxebZqrRtyWpsy4JlAC5uGCi8yuYRKyqAnf?=
 =?us-ascii?Q?ENCyBStVzEJHiH4TWU3yJ4aNilD0I+CUHp/h9ul0f/JwxTcwoZPT6/MaY4BX?=
 =?us-ascii?Q?WQXB5b60jcNwhUI7VSVibZdUN5GWTwvDG263RUMe1y7NS9BkvQUS+uALV0OF?=
 =?us-ascii?Q?HEYnEiu8blobENKUDZFfFy0xUicmtysyeOmI7Ktze/zJTaO0ZicRvRNuF3Tm?=
 =?us-ascii?Q?JRpskz7JZ1/nRc1AzbnANHJTwTHbzX7VGozQKKKWLH9DMLSqYsCqbN7HWCAW?=
 =?us-ascii?Q?ik/YfHYc01tBHDXOAKnLKgLIfN4HhAd/G7Wd9iKOYayWf0gego1AaIaSu4cY?=
 =?us-ascii?Q?s21EZHZ4WBrk0OqW3BLhn+XueuKTPyLDvenw/4mldhSUCh02DOUbFT0mSnSk?=
 =?us-ascii?Q?KWQ1330OccYUalspek880q9H9ti62l2CMOmN?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:55.1168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caed934f-1bac-46c1-8da1-08dda036e2e0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR06MB9875
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117684

Add a mechanism to establish a (metadata) link between roles, in the
form of a new 'ca' variable.  Which is intended to point from one role
to another, to preserve the leaf->intermediary certificate relation.

With this additional mechanism, it would be now possible to import a
complex PKI tree of certificates (either just the certificates, or
both cert+key where available); and then later during usage of one
role, reconstruct the verification chain from the leaf, through
multiple intermediary, and up to the root role.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 36 ++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index c768371151..5992a75be7 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -145,9 +145,43 @@ signing_import_cert_from_der() {
     signing_pkcs11_tool --type cert --write-object "${der}" --label "${cer=
t_name}"
 }
=20
-# signing_import_cert_chain_from_pem <role> <pem>
+# signing_import_set_ca <cert_name> <ca_cert_name>
+#
+# Link the certificate from <cert_name> to its issuer stored in
+# <ca_cert_name> By walking this linked list a CA-chain can later be
+# reconstructed from the involed roles.
+signing_import_set_ca() {
+    local cert_name=3D"${1}"
+    local ca_cert_name=3D"${2}"
+
+    echo "_SIGNING_CA_${cert_name}_=3D\"${ca_cert_name}\"" >> $_SIGNING_EN=
V_FILE_
+    echo "added link from ${cert_name} to ${ca_cert_name}"
+}
+
+# signing_get_ca <cert_name>
 #
+# returns the <ca_cert_name> that has been set previously through
+# signing_import_set_ca; or the empty string if none was set
+signing_get_ca() {
+    local cert_name=3D"${1}"
=20
+    eval local ca_cert_name=3D"\$_SIGNING_CA_${cert_name}_"
+    echo "$ca_cert_name"
+}
+
+# signing_has_ca <cert_name>
+#
+# check if the cert_name links to another cert_name that is its
+# certificate authority/issuer.
+signing_has_ca() {
+    local ca_cert_name=3D"$(signing_get_ca ${1})"
+
+    test -n "$ca_cert_name"
+    return $?
+}
+
+# signing_import_cert_chain_from_pem <role> <pem>
+#
 # Import a certificate *chain* from a PEM file to a role.
 # (e.g. multiple ones concatenated in one file)
 #
--=20
2.34.1


