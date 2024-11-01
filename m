Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDBFE6B24E
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:05:44 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.45])
 by mx.groups.io with SMTP id smtpd.web10.36187.1730462738532377412
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UbNFzZ0R;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.104.45, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGUbq9CdDXe4KozLErN43P3xqdIYE8HEVuj1rN9IWIF78p6R3WD6iodrjzM+2O5YxrbLTZNOFB8kIy3PWWmOiZ/kMzAw97al+bh12Tq2wqDVrRfGDHPqB0aQBNAYF3OBKi55d2EVOAMd7MKGUHFPQlhLc3rfcnMt3CH+uquTh5xrKOHhEHSLemy1ExIov9wXnCgkRD+0nc2xLpRzBU9uLffa1u7NzfqbkIcnbZDMBBezKAWQdo/P2BYfqZYcUUgECucbJ2rZH6n2gVUkpLny6zPxVG4M4ZKLjXfO8ZHtcdMXNy2TZQsh1cJKiY2Ddxfq3lhfcOeOQe6+4VlvgqqXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA3KnHRDWyZGcxzcj/db/wtY3vjLRlcEjereaASIW10=;
 b=Q0mGHWNPUwmlN3eIutH99gUPIKMaCVsZD2gZo0r2462lsUY3Jf41dnLivmgfwIVtBRnyr4FOOsp+c9MlTs+7Euoigtw7zwULCzPVdPuTiEKQaeIMkqab4IztjSguEIW7Pns4Bs3b3SZPsWQwhRAhA3Y6f0OqWX292Vvvjn9xDJc1J1rx965XER7rMyx6Hu1l601V49Ux9Abyq5NqKUMuVU7JAnSSAjulAxlgZbtCkT8jWAYwfCmZlDLgSfpScSbQ7SObKv5xEXPYMa0LPjefPiirGVkb1I15skvxFVvReFETevLu+u/UqmPZSFS6+HLUzslFrv4qz3rMNJOPTcSjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA3KnHRDWyZGcxzcj/db/wtY3vjLRlcEjereaASIW10=;
 b=UbNFzZ0RkWdsiqrD68l05XP/u3ozQB03nVlw15Q//cEK+hvUEViQ0QPjdn8XyHaefvX7OEDd+TfPUVXwuoPHGmU8YMpHFsDJetbcTxlobt35fVvRQnkJeGZJ4ylpejBLxMjDRZFkXFfdHW1V+0J8kqfTJf3eVwcVQ8ZjDg1zeec=
Received: from DB9PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::13) by PR3PR06MB7002.eurprd06.prod.outlook.com
 (2603:10a6:102:8f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 12:05:35 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com (2603:10a6:10:1d8::4)
 by DB9PR01CA0008.outlook.office365.com (2603:10a6:10:1d8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.23 via Frontend Transport; Fri, 1 Nov 2024 12:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 12:05:34 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 1 Nov 2024 13:05:34 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1] signing.bbclass: add label length check
Date: Fri,  1 Nov 2024 13:05:14 +0100
Message-ID: <20241101120514.185668-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
References: <20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 01 Nov 2024 12:05:34.0221 (UTC) FILETIME=[5AF273D0:01DB2C56]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|PR3PR06MB7002:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3575512-f256-4352-b5f5-08dcfa6d7d95
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sd7NI56RYEvZ7ay2nENG5eRXMzRZVehQVa4PHUsNaaxbgsqfNO9Xmk7GAnee?=
 =?us-ascii?Q?GK8C+YdraEIGZC5pTENMOtIeUoPg90FGX36EkVcWOtG4lVaEW4piIglb1+vw?=
 =?us-ascii?Q?FXo6NCtro0tD7phaclWJzDH2vpmforgV4MbS5n1JtzDrFYN+hyZY7lzoHuk0?=
 =?us-ascii?Q?pFyqyjVRsKAFGiDs9dglvkLO8tIBRPVbUnhgCKvmBt7k2MAaZBI452e4D+nJ?=
 =?us-ascii?Q?Z8TyzQnH66Zrk6r3bxRoyySkHPzmePf36LocPD16ka7ex+7w4Y2SIeeKme+N?=
 =?us-ascii?Q?Ppelkr3YrsxhTQ+ME+23xNZzLfHtRIfOC+UlKgZrxn3Te8vlEQHlf5rWEa68?=
 =?us-ascii?Q?RzwUTKx5JKyPG1l2KgTy4pYWmNSmk5H2O1ILHiHlnVfrtgiNCzfYZCmMv/QQ?=
 =?us-ascii?Q?ZxtJ0lVQF4IXvYygOBcLr6k+9CFceFyGp9vqIiqE23oxH6QEzFt8rP5Dfsr1?=
 =?us-ascii?Q?iBc9eDbcjUsG20ga6HQIsbG2ZIDhiqE4hhGskyAOY4y2LROSIZvE/dDkUTFQ?=
 =?us-ascii?Q?zkRpJkCt82T7fCxgvtyf8vSPqiKLbKfxet1u/zkVIncgIHJspi7otL8qMRf/?=
 =?us-ascii?Q?dYXI+W/u1P3wk5YUT1WHe5mryoQ3CbEaG6MOLC3U8lEnck86W7+iI5glqA43?=
 =?us-ascii?Q?sCPSG0IQK5yTv9qyUumBMyFKsdmY5uUaK2zBoPyqrcNNSEr3ZPsEtZLDQLcp?=
 =?us-ascii?Q?n8P7AKkOy1FqvlHuGXK03D8OFWOvOR2aAyi0NEgBpbn/JkWdVEhUy9GjyJug?=
 =?us-ascii?Q?oQbW5L0YFaan+Bxb0AgM/9ZNHfM8bb1Th1mTI1HFqJDXiiqcl1LNnrTAvNbZ?=
 =?us-ascii?Q?LqnejikxtWKjKZOT8R7itziac9SJowYADNx6DlL3hVb9dqzQnsqBg+Xod/gO?=
 =?us-ascii?Q?+MbOZ3a0UF6Ii+aT2eDT3R86jF2LNtxUdyyPL/6qSh+tS1mjjRPkfRqMeN4T?=
 =?us-ascii?Q?CuEE1vtHO51QcOZD6WSvfvsM9b0shyP+0VpvoKbeB33Zfy7g3Sc0Uh1206rA?=
 =?us-ascii?Q?oH8Y7Z7qQEdEV+jB8LKNI6arCewZD26XTJbsLxOs1XcusE8tmbODjsMJk3JF?=
 =?us-ascii?Q?vnHXPnn4garfJL4A1cVcdp/oqUucjnxpiv6EVT/jgs7KWY4D+qLAvDBiTgbC?=
 =?us-ascii?Q?h8qSRNZfVdxuk72hl/4/gNzsz+EZW18cdFcuBfliX2BESn4oK2C/KBNovGCS?=
 =?us-ascii?Q?4Z9w/XVq4721I1M7s/4/GwwWfz2FWX0CUlOAXk3YFeb1li4KXyAGEBFD7Oeu?=
 =?us-ascii?Q?s9mLbHrSLwvd+d9z5bDDqKCYq/Ys0UtDWEAukdioZLIejJnjMqeQw7MOAGET?=
 =?us-ascii?Q?cl2AlhA1oInhUzxEGwHF6e0mGJG3NL79jFHZ3bYUMHjiNda48hyngPpm1Ozc?=
 =?us-ascii?Q?4RKlUKJcK3GURjZ61GjIh/5NtZMSD88crUQuLUjf1Q6ZWFrcZQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:05:34.4485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3575512-f256-4352-b5f5-08dcfa6d7d95
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7002
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113383

Add a (more helpful) error message in case the Package-Name exceeds a
certain length which would have the softhsm tools error out.

The $PN is used as 'label' in the softhsm, which is a
"CK_UTF8CHAR paddedLabel[32]" in softhsm2-util.cpp,
so it must not be longer.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index f52d861b7..3e662ff73 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -92,6 +92,11 @@ signing_pkcs11_tool() {
 }
=20
 signing_import_prepare() {
+    # the $PN is used as 'label' in the softhsm, which is a "CK_UTF8CHAR
+    # paddedLabel[32]" in softhsm2-util.cpp, so it must not be longer.
+    LEN=3D$(echo -n ${PN} | wc -c)
+    test $LEN -le 32 || bbfatal "PN must not have a length greater than 32=
 chars."
+
     export _SIGNING_ENV_FILE_=3D"${B}/meta-signing.env"
     rm -f "$_SIGNING_ENV_FILE_"
=20
--=20
2.34.1


