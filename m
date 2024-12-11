Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F839E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 06:43:53 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.143])
 by mx.groups.io with SMTP id smtpd.web10.4800.1733899423161930537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 22:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gomspace.com header.s=selector2 header.b=azpjioPu;
 spf=pass (domain: gomspace.com, ip: 52.101.66.143, mailfrom: mns@gomspace.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6dRWxRyI8aDmtz1WC6qmqb+2lbYYaO80iW4fJtHEAPWsy0XUSpID4wmSFF7BLhm0oJI6RXHfRFzmOcTtZmV1sZG++zIP8FCAdv3H0sMyV+gHYbULcYMQE/3/TcMKS4N+9Ga+QOHEPFQsuxGVCnCxonKKIo0BSt0iSTnXav1zOYi3T+SnPBnPWuTHiFc2hi3wHkY3gAr9QzSFIMyEtXyOcQdHQ0wU70vj78npDe9YVyXjtbY3Ibs81jySlUmSjIJxI14KdQBt4IWc0wBWy+wXoXyXLJErgo4BMjgxo2Xfrfw7HScmV0oe/iDBRR9mfBVb937qY6neNfFbwqzirSxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atgsiy/mjtIfN2PcG2+5aavu0d1UfXOUFa6oqyPFbEo=;
 b=Lv5hxZxB2nriqGG4OpwzYCaPwQjnvD7u3iCDxCARhqMSChwvrBzN7c2bRdb4rQxqQPpRdVn3Wl8LdKjQ488q+UB8mRaKbHMrTGtFaMMTSTzGjB26Yx3jw2A8HruLPhiccN1evwbJ1R5yHT85wZONiuPD4UfUOhcFEAKKKPulK2sHW54vQSbh7tUjBcPXrQFCcQJDbXr7Bv/iNBVg963WDTd1lAKeOkGxFhHuyzEewLBWoqiBuVX6iPn7ngyo4iuvkRrsQpAyM0WdDxvXwjhX1hT7SHrK7AztogLzMelfstsnsYXZTjGxLLa88nyzx9kXxHwDC7MR/LOI1xh2J5KoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 79.171.149.170) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gomspace.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=gomspace.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atgsiy/mjtIfN2PcG2+5aavu0d1UfXOUFa6oqyPFbEo=;
 b=azpjioPu7F/dav6X0/MhOXlcW1oAJYIXwvxgdDWCuvoUlk2mwdPzJBqA7Y0R1P6Euon0hTmPOqPybxyVn1654rLlP6jTrQBfGzYItPW88KSnJaGQUFVy/mabF79eozw0BWvrJZQ+UIIdNybLphNgVd4ohXRPpBacXyGBS7FKS7A=
Received: from DB8PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:10:be::24)
 by GV1PR08MB7377.eurprd08.prod.outlook.com (2603:10a6:150:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 06:43:37 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::d) by DB8PR03CA0011.outlook.office365.com
 (2603:10a6:10:be::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 06:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 79.171.149.170)
 smtp.mailfrom=gomspace.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=gomspace.com;
Received-SPF: Pass (protection.outlook.com: domain of gomspace.com designates
 79.171.149.170 as permitted sender) receiver=protection.outlook.com;
 client-ip=79.171.149.170; helo=webmail.gomspace.com; pr=C
Received: from webmail.gomspace.com (79.171.149.170) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Wed, 11 Dec 2024 06:43:36 +0000
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 11 Dec 2024 07:43:35 +0100
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 11 Dec 2024 07:43:35 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH] pps-tools: backport a patch to fix prints
Date: Wed, 11 Dec 2024 07:42:18 +0100
Message-ID: <20241211064218.1725520-1-mns@gomspace.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:6, sv:1733885206, ts:1733899416
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|GV1PR08MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a986f6-9b9d-4966-83e2-08dd19af23c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CN02q/pD0aLQq6hiuRN7zYWbT7KrDn+frvdwizp7sJJx2bEllkOlK9f3QoU8?=
 =?us-ascii?Q?0+vOS2Pm3BSkrckFHcSw7heFkKXhJVqvRnJhdB0eE26fetM2Uwncq7oxg6ub?=
 =?us-ascii?Q?yWKzQgtd6ZaPw4Di2z3NjBxIxHv3k3DDw4xRdPPYPbOmsJRSIYDQT8Nr0svn?=
 =?us-ascii?Q?FGWirymIl8MSE5cQd3/SbOwMmk0K5A8zaFdNc1RCw/AaFL1pnAQ3cZ24lCEf?=
 =?us-ascii?Q?RkSWVdyLwrojBGR40PG+BPUHruJdfct0FOqmSwHR+KDjAYBVcCf+BimZhGgP?=
 =?us-ascii?Q?LnTmAVIEiA3qOkpMc5YFyn829iCsRggXaYgRSYNn1EGM616TjXEHrEcIzrXR?=
 =?us-ascii?Q?NrVs0xTz1JZ0XArBYIkvSEeOhcEhcLP2rfzAy3niyFA4ASyEzkoigLmRHWGA?=
 =?us-ascii?Q?lh7sn5FJyNYu0gaPQ36BC46IHGslq5au4SuJMOknnZwd6kU8TRoK+NZ6Pz2G?=
 =?us-ascii?Q?NBMGjJx00WIcWYHHmn/cgj3MeV+kNmC9QUzTEe4cBU+4yhKxIh806mhP5wPc?=
 =?us-ascii?Q?L763XrKVQZLRiou9slBx36RTM/fiOteG2Uy83aYbubkpy/DNuhjgdxZGApBI?=
 =?us-ascii?Q?4Z9CLX2pwgNPeu4DpKrCDiq058cj2+vGTyZ1U2+ODxxAxpyNu7eYkt4h2wzS?=
 =?us-ascii?Q?saiWTJ/aPi0SgRL/x+9HSdksgrlGZdYoYOU7ipgWxHdkarxla47Z0txjYRfA?=
 =?us-ascii?Q?PlKNibMlNlGA7H8ktme0FbjJ6mbzTnP/MxpvScspQ7skfka2icFXPeURSt1g?=
 =?us-ascii?Q?jGYYS1vZKAgPhzedB2Z3pew76bwtptzoiH/77TjGAjxWSUEVloYAQebj0H5p?=
 =?us-ascii?Q?H4nTaDthmAEb4zMhB1wbG6yyM5qT3meDhz5sZ6VKIFEUmgwgSYPtrJr47m3p?=
 =?us-ascii?Q?ykKQGw0eJTu8PdNYWEjpr0rDOmZnalflsQs5bOlaDZlPL4PX6W4SngaFLx77?=
 =?us-ascii?Q?epwe1sBkB2CMIDI19d5tNLbRfY5QuDB4HMrplqWOjiXTqqf0qinhWQUYzAWN?=
 =?us-ascii?Q?Fl7TJC59ko3IQAaa20XYFvkFFUmUEft3SZDZk0ZlujLI+xvpzsyZVeKbjJNB?=
 =?us-ascii?Q?7NT0BeNBYcST/XlqGoo7+zWGpgyRQYvz0fINiPxQpak5aeWJ/3DLtCBbPWjt?=
 =?us-ascii?Q?RvYHkHxMZJ9C+gwvthVciQq6XXabuSn5zgTrU/psyttLHsJGd3OGoMK6+4Im?=
 =?us-ascii?Q?1DjB0uN0wQts5LrBjIY+H2Eo7KNJeiZRxRSCEu9UAgOpIP61Ak1J80MEYDO4?=
 =?us-ascii?Q?BTzurYUsJ4JSg9XaQGBCuzDbjf06467UWEHwvcTnhccKgP9gCIcx4215Qv4b?=
 =?us-ascii?Q?XmW7vaG+HgqwmA0zmF7chp7yAAxMpuKRwrC4r3gH3IxlYLIU4hjblHG6p+T3?=
 =?us-ascii?Q?MCQbXGayuI3/d95hVZSvmiGKk4XbkN5gFUTkdwhz2p2U7K0WSNwoxG4r8sP9?=
 =?us-ascii?Q?yCsoy5p1dx4XsrTgHyjtvVtaoYURetuv?=
X-Forefront-Antispam-Report: 
	CIP:79.171.149.170;CTRY:DK;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:webmail.gomspace.com;PTR:webmail.gomspace.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 06:43:36.5880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a986f6-9b9d-4966-83e2-08dd19af23c6
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;Ip=[79.171.149.170];Helo=[webmail.gomspace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7377
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 06:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114268

Patch reported issue observed on ARM32 based HW during bump
from Langdale to Scarthgap

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 ...-Use-lld-in-printf-for-64-bit-time_t.patch | 59 +++++++++++++++++++
 .../pps-tools/pps-tools_1.0.3.bb              |  4 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/pps-tools/pps-tools/0001-Use-ll=
d-in-printf-for-64-bit-time_t.patch

diff --git a/meta-oe/recipes-support/pps-tools/pps-tools/0001-Use-lld-in-pr=
intf-for-64-bit-time_t.patch b/meta-oe/recipes-support/pps-tools/pps-tools/=
0001-Use-lld-in-printf-for-64-bit-time_t.patch
new file mode 100644
index 000000000..058217d68
--- /dev/null
+++ b/meta-oe/recipes-support/pps-tools/pps-tools/0001-Use-lld-in-printf-fo=
r-64-bit-time_t.patch
@@ -0,0 +1,59 @@
+From 6faed0a3b41fba4619fe4598a2834dfb4d2be7e4 Mon Sep 17 00:00:00 2001
+From: Matt Merhar <mattmerhar@protonmail.com>
+Date: Fri, 10 Nov 2023 17:21:51 -0500
+Subject: [PATCH] Use %lld in printf for 64-bit time_t
+
+musl 1.2.0 switched to use 64-bit time_t everywhere, including 32-bit
+architectures, causing garbage values to be printed from ppswatch and
+ppstest.
+
+Use the correct format string for the affected printf statements and
+explicitly cast to long long to avoid potential compatibility issues
+with 32-bit glibc.
+
+Upstream-Status: Backport [https://github.com/redlab-i/pps-tools/commit/6f=
aed0a3b41fba4619fe4598a2834dfb4d2be7e4]
+
+Signed-off-by: Matt Merhar <mattmerhar@protonmail.com>
+---
+ ppstest.c  | 8 ++++----
+ ppswatch.c | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/ppstest.c b/ppstest.c
+index 0370794..c375a09 100644
+--- a/ppstest.c
++++ b/ppstest.c
+@@ -110,13 +110,13 @@ retry:
+ 	}
+=20
+ 	printf("source %d - "
+-	       "assert %ld.%09ld, sequence: %ld - "
+-	       "clear  %ld.%09ld, sequence: %ld\n",
++	       "assert %lld.%09ld, sequence: %ld - "
++	       "clear  %lld.%09ld, sequence: %ld\n",
+ 	       i,
+-	       infobuf.assert_timestamp.tv_sec,
++	       (long long)infobuf.assert_timestamp.tv_sec,
+ 	       infobuf.assert_timestamp.tv_nsec,
+ 	       infobuf.assert_sequence,
+-	       infobuf.clear_timestamp.tv_sec,
++	       (long long)infobuf.clear_timestamp.tv_sec,
+ 	       infobuf.clear_timestamp.tv_nsec, infobuf.clear_sequence);
+ 	fflush(stdout);
+=20
+diff --git a/ppswatch.c b/ppswatch.c
+index 5c6202b..15d7a77 100644
+--- a/ppswatch.c
++++ b/ppswatch.c
+@@ -148,7 +148,7 @@ int fetch_source(pps_handle_t handle, int avail_mode)
+ 	if (max_divergence < div)
+ 		max_divergence =3D div;
+ 	if (div >=3D margin) {
+-		printf("timestamp: %ld, sequence: %ld, offset: % 6ld\n", ts.tv_sec, seq=
, ts.tv_nsec);
++		printf("timestamp: %lld, sequence: %ld, offset: % 6ld\n", (long long)ts=
.tv_sec, seq, ts.tv_nsec);
+ 		fflush(stdout);
+ 		overflows++;
+ 		curr_unsync++;
+--=20
+2.47.1
+
diff --git a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb b/meta-oe=
/recipes-support/pps-tools/pps-tools_1.0.3.bb
index 65c06c1bd..34b4bbf75 100644
--- a/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
+++ b/meta-oe/recipes-support/pps-tools/pps-tools_1.0.3.bb
@@ -5,7 +5,9 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
=20
 SRCREV =3D "c50cb7183e252b47308fa22f420e0a877277aa29"
-SRC_URI =3D "git://github.com/ago/pps-tools.git;branch=3Dmaster;protocol=
=3Dhttps"
+SRC_URI =3D "git://github.com/ago/pps-tools.git;branch=3Dmaster;protocol=
=3Dhttps \
+           file://0001-Use-lld-in-printf-for-64-bit-time_t.patch \
+           "
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.43.2


________________________
This email was scanned by Bitdefender

