Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEF2C5B559
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web11.4004.1748691179989056860
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=hl8KfnHK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.86, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSUarPOzor2gjTZBdujrJikm2/2vfvVKp3iaKOBsVT0D+EDfXLiMVWXiYKNW5oSmrlrM1GjBpjBGRn6/pX4IikGTJo5FCRzrLLehzac/L818wahK0hnTCuyq8qj67scqil8d1+emxU3Gqx6IT34rU3mA56ifM32MjclA3M22mSxvfleQkjiHf9AgD6yRNUHpDuvagnoKhIXuSnfUG5AXJa03u3y9/4MlW4vpANsUeJt8xbxsk5Dwf1MRWyUHt7ltzeNAuXGwaXLoFoHhrn/Qi0RfRIR3x5tO0ruUzR/IGovjkgf4H5C+yZQicl9/Gje/ZFNTyBdT3IitsNGdE0TEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVT1GAG42P2SNywJNWNDGjnHnDqqbXWWTVVePD7GpKg=;
 b=qq74kHD/BoQKI0HXDVRdE/4rxkOLJYGFw//R/hEnP6Pi5LroggHFjNY3WQ30ufPKlwo4nvdByD7n8ofEvljWZeYcHWj5ip85cXTPb2Vj4iLCWysH+2rqBFrdPSng1p1O3MvZt6Rc7av6kaHxmI70K+CRfGsUOLyRcr2g2Gu5ymYDkrj3qzeqUUayNg63SXIbrUQbzbg6m4NZyVpoQb1FerL/B8nHSuRQsoymOMfpAnh+JBdCeEaqWEEyhyDYonY6VmOfeZ/8ER2aoivpP/ebBdLYvm++bBw9J1ED7xwNIo4JMkwTPNjT686aqPLKh8rlCWmBwma9+F5Ljt5dpuhfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVT1GAG42P2SNywJNWNDGjnHnDqqbXWWTVVePD7GpKg=;
 b=hl8KfnHKoJpDnlUSkzEzMLVDIo0/1Vxokgtmsz0FApeCkYGUp4wzDdcxtyi5r0PZRCYAXiCgumM7tDpfJWLtBGt0GcAaLxK/qrC+QJLQdUsns1QJI3jAJjjIWDllgy3uMT0st0+5NCJ7dQ8yXT5KAdFIYbbp8wrsNlStUDeSHv8=
Received: from PR2PR09CA0018.eurprd09.prod.outlook.com (2603:10a6:101:16::30)
 by AS5PR06MB8653.eurprd06.prod.outlook.com (2603:10a6:20b:672::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Sat, 31 May
 2025 11:32:56 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::18) by PR2PR09CA0018.outlook.office365.com
 (2603:10a6:101:16::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Sat,
 31 May 2025 11:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:32:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:32:53 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	jlu@pengutronix.de
CC: bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v2 4/6] signing.bbclass: add signing_get_intermediate_certs
Date: Sat, 31 May 2025 13:32:50 +0200
Message-ID: <20250531113252.3889951-5-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0918 (UTC) FILETIME=[BFAD33E0:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|AS5PR06MB8653:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed5b8474-6d6b-4092-f9e7-08dda036e378
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sJlhZBM1YQ09GhpgzZ7XkvELFutbIQbX3hhusLSlTihVf4JLhyTcsBrEDHcR?=
 =?us-ascii?Q?/2jSQe2YkQ7tkyzvoZsPgwj6AYKN9L7mE3XmCmIDuK5f/CPqaEwTglg5W/Li?=
 =?us-ascii?Q?avEkhziJeBHSvwC14PPywm4ZcIcMlVdkheiI9dmvyWlQinQiIAR1Jd4+JGIA?=
 =?us-ascii?Q?SVHbRg5Ps9QYAm/Dc5HQNPx5wbkvMb0s1LD5JKe+AVURAvyUBh+emm5dMPPW?=
 =?us-ascii?Q?nv3Kt//1VFKJxuVqS1Smhlg1rzMPrXo4Tzeizws/LBPvepLZbsawa3SX7EON?=
 =?us-ascii?Q?UhivA24SYlpX4ydIwGi6eGQhq/ROpbl9bdYeI6IFpEGoSxaXBqvr8FwkHYqE?=
 =?us-ascii?Q?0hyclcJkI1qlbI8kP3ElLk8B6Y0yc4Uv8zqivMoEHCdycy/D+/J9OBXB/iz4?=
 =?us-ascii?Q?dIcWjNKIMry4E+/KkpjcVzQm5Z2jaUwz7x6yvCvnkhKtdHg1I4GXbPMhZt4I?=
 =?us-ascii?Q?cnMxzTx1osEhUkwB5D+iiLEXQAqbD/mK8hXw0NCy28UeRVPA+KzE6H9IwWxv?=
 =?us-ascii?Q?JLj4z9ZDVkWA8oazbLReGQPotrkwbVBADIZn6prZRXGuOdJ+YUJbwyLiyD4p?=
 =?us-ascii?Q?P2ocTHfTB6V+sdWDEU/H6YgJ7IGq1Z81b9BI9gDNonylF/xgiyUzbwwfoB8W?=
 =?us-ascii?Q?Avu+ra/tNBzudLtABU0LpgRLm0cjfqdtKs+2izKiW3zGIX52Pz2GPf7yz0iG?=
 =?us-ascii?Q?zrLrEbyV/bVQc1dMXsgVhcu+204N8KFIUoywEyFfwgTkIHJ5ce15i5bI1DBt?=
 =?us-ascii?Q?FjY4bnULVNlRhxoJLRl1WqpsoxFM2yNWVAu0Ge08YbqQCubW/GCwzRR4q+P5?=
 =?us-ascii?Q?0OQlNVjvDdwSOivyZbfPCO8g0coq75YWUtl+cTdOUC+FEqHzpHh3mFdqsruL?=
 =?us-ascii?Q?dysZS3poBV556amtVFHWngJi44QXvylvwxiEHKQVex23FMmo04WL9Cf+2OTc?=
 =?us-ascii?Q?FlAdt3BcwyTiDJV5p3TJk+Cr81b0Mfa6Qq0RkVjTAhT/eqS6kAkWeKyY5c4r?=
 =?us-ascii?Q?9aNWu5Pxa4UgbvCWqJNTaof3BHoQ0n94Q3b941+ETP1IKYgGDfi+UhyOmmIk?=
 =?us-ascii?Q?1d9lcnIKb1j16uxq7JaPU0uUo6tXCnT+y64BgaC3x3nSf/B77ju0xfXRHzGa?=
 =?us-ascii?Q?VIu4UpG8rV64ofTrjReSLIqiXO0dBixovK4p64NmlT+LZEB+K9CBXcqp21/v?=
 =?us-ascii?Q?UbgAUzMhWg31aUyMDOVWWqNzaFBmnsZsNIt+SB0znw8WxmqfM6bTJRuuq75a?=
 =?us-ascii?Q?rHNRG5eHvd7l8VzcLIjx+UeP2NvyRWkZFUTYfGVGSVlYDOrrG2AODTlbFkYK?=
 =?us-ascii?Q?E+NnlE8w6H18pgaFYtx0F+NnihBx/2tvAVnf+9ImZSJ8HyUvlQm2tvUQrrd1?=
 =?us-ascii?Q?LyG01/JW6dmcAX3q3S2zMmeBNnrYirFBfHIS0J2S4mVm0O6buv/bY3unTfmD?=
 =?us-ascii?Q?R6fxZnCfTl9trmb4TsiCDND/2aA5GpOtfsf0vywvevDC32XiuWSe5ZLHWTaj?=
 =?us-ascii?Q?NLUX56CQGhuA890viK64wEBHJOK2RAR3ZkuH?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:56.1168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5b8474-6d6b-4092-f9e7-08dda036e378
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8653
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117683

Add a method that returns a list of intermediary CA roles.

When using a complex PKI structure with for example "openssl cms",
these roles can then be iterated over adding in turn a '-certificate'.
Pseudo-code example:
  for intermediate in $(signing_get_intermediate_certs 'FooBaa'); do
     signing_extract_cert_pem $intermediate $intermediate.pem
     CMD+=3D" --certificate=3D$intermediate.pem"
  done

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index ee32cc12f7..7bc3e7cb12 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -180,6 +180,27 @@ signing_has_ca() {
     return $?
 }
=20
+# signing_get_intermediate_certs <cert_name>
+#
+# return a list of role/name intermediary CA certificates for a given
+# <cert_name> by walking the chain setup with signing_import_set_ca.
+#
+# The returned list will not include the the root CA, and can
+# potentially be empty.
+#
+# To be used with SoftHSM.
+signing_get_intermediate_certs() {
+    local cert_name=3D"${1}"
+    local intermediary=3D""
+    while signing_has_ca "${cert_name}"; do
+        cert_name=3D"$(signing_get_ca ${cert_name})"
+        if signing_has_ca "${cert_name}"; then
+            intermediary=3D"${intermediary} ${cert_name}"
+        fi
+    done
+    echo "${intermediary}"
+}
+
 # signing_get_root_cert <cert_name>
 #
 # return the role/name of the CA root certificate for a given
--=20
2.34.1


