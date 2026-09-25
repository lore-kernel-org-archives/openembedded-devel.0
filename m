Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D05C98328
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:44:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6135.1790336683674481949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yiCxyy+s;
 spf=pass (domain: est.tech, ip: 52.101.65.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY6Er5SQSsTM0gIY2G4IDPI7xJVGd89Odt6gimgv75qxJedLFQREcsT67fdBF+fjqlg+IruIdrBxWYp+mkNzCY9RGohuTCabtp5s2oBhSo2rRbxgdjAtAmsuEoq0W9LOhh9r2R31LiTs0JEAnNxCYqj1TDDrrxHECgoyZGoJ068G/ceD++GE1R8xiwER5IssDCDJB+B1CE4TDyuR6Shw97xvx3qASPaopWQ0yYGULK/WEx8h3T7GaYCi0R2vxsqybc59LwCqzMKKJSVjuUZrMzc8qgg93ZW30bPu1/nLmiSsaGZuiQ2YqzsO6vBz7D/kBTsrQlbStXaNZF+Fjo9oXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXY7qTAuTxEDHdtEeakBswby0sVj4jjm/5fqjxMWE2k=;
 b=RAf0kxuPQucrp3N2vYL5tEKkFZYEuAF+qW1lvucwZ8/7I/ruAimUahQb0lFsZ4YOYVthcQzHLDJWy/+qyUdBQ45qsz64cNYlP84O7ADcZdv6zWTTrsGJMBJdBoxp3adfCl1gjxM4HCI4zPTXqL69dCgfgwGOSooLA3d7cDWMd9rPWmmDfeIv7EKd6RJX3t6t2VWLVIJB1xA5Z3rlGhQ+3wl+K/PmQ1TSqHAu2V023lxxVRmznrX4E/slX4Z/TzAZoHZM1Nn85GSgPWIki5gcpocKlZgl1MY05VI5ZxbiKFya2V8Yz4SWxIxebpahFzGJCev/4aMhVGHk36EZpSAx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXY7qTAuTxEDHdtEeakBswby0sVj4jjm/5fqjxMWE2k=;
 b=yiCxyy+stISVF7/sx3Kry+AN0AFR4EWONv48kQ4q0G54C6gOC4o6Cr3oD810xY9prsPfXKvMm9NqMJFzF4AW4liF4a5sgckS1tXdwbfCHQ6jIccvyDkh980zb9V1eb0lOa81R33Kn5nHlbnQUlyI9au9g7BzNve0oHxMGH6MzKJpCh0gaoaHy6atYN2Yq3PYTGZDbdKhOMG20ZLZEueOGb8VxPUeJyZV9azEOgCrHCPkPPBcIYfTd6CFa0PTNXCWLcJb8WXTgn9pzQDfviQv9/zBsCxGTZokbN6JCKAupV5NMrTtq1C0gQjKg9PmgHdCRYCzydFG5YQ3roPn8BgjTA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2984.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:44:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:44:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 2/4] libnetfilter-queue: add repo.or.cz as premirror
Date: Fri, 25 Sep 2026 13:44:25 +0200
Message-ID: <20260925114427.2889-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
References: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2984:EE_
X-MS-Office365-Filtering-Correlation-Id: 21765815-5d3e-4acb-dc27-08df1afa6107
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|3023799007|6133799003|56012099006|18002099003|22082099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 5SOS3cr0XLeo+0NLF+7JQyfEQ8Jav1Msr5tLncN4lOv8cog7GmdVVjk1+KDzm5WVcSYtsq80Qvns3nyi1Wat68eZeqkLWDLXx641+czt3GGdAQxw8cl0f3DniTfilCwLDSgEy1BlFyZ0NRF3bzIixVBQ3VFGwucAc7/cguOqRhaHIZMy17k1odb0MaArvC/3jbB6snXDIm9nBTRJyK1CRjX27OyZn1HxcttH8wq2qKhxClgmf8fTzPyrMBblImJaSLra2eavhDxK/0w8ON3rHS7x53grdlUFz90EDSOV+YKeVzIvpV/VfJngD6Tr401jixdhxH8nU+gcUC6J7DEpc48alZPZkK+2GcE1IP6vUbFGEHgr4QM5dvz2tCJH/AcYOD3spS8uemJMrsDd/a7HS9cs/ICZU+PPApFjX6TujaRCP6N13KRz420QCMV3PzhzMeDiwovtv67yKsgqy2PYPYqQ8c5Yb1T6oBGErb3uLjcuGEVzFeZ5+FWY5szDEOaWPVBY/BfipQH7zfPXPILXQBHNZHWjIGWgkmEVaYfqvc1YnFYU73cu+hiqD4eN2uOO9v0Dinba73DmB49dnisMq1+kmdpkILwndnCQagTtBr1tsjVfvEKmS6WQcM/Ic6Sr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAwqT+lcqjdf5aoZuMQgVoypEL/oqvOBqVUg8dOou/f77BTYg77Q0wgBSZao?=
 =?us-ascii?Q?Z+CUB7g6L7x8v0dC/jW7b2Dq0IslOy1nm2k9OGUeoRekvEvgihNZcCiebOb8?=
 =?us-ascii?Q?6D/0sAo3kJ5473WaamRfqLNo8QsE21d6zZMCS2kG8Oj6KQ781zJktIfpODiD?=
 =?us-ascii?Q?k5yjk66dSZkAhfoYTUgyARUKfc60YcSdwdFDrpD//XFo3UDbE2Ox5QdO5vlv?=
 =?us-ascii?Q?8y5ZsRrIfDlgbaJimMQUja1V1ZuiqmqjVXMjY+XoyaDQwf8c3VSEY03ENMK8?=
 =?us-ascii?Q?KwXkWb1yHb1tpdOUB9rycXJb9pB43VvZw7WO5RRJ55vo7hJ369EwoMAqm97B?=
 =?us-ascii?Q?OWElK67bScuatQPayGer7yfcT1zcdGjllzEXw5l+taQwAn/sisLVGEyReidq?=
 =?us-ascii?Q?Lm1SAUH8cVBO9g/FgdKzMtRZpNYK3LXCxJiaMDrcDwytbQ0j2akLAFRoT24P?=
 =?us-ascii?Q?BPn3/7EPUICHI3i/ufg4JqMpYa7aYAdUMmPfo6BmVhZhyX5lKs1AWelwzvK8?=
 =?us-ascii?Q?5DagQEYstgGF31v5bwFEmGx4E3TUCJO1hfXkXPRQAXfbdtvb9TPYYoK13Ydh?=
 =?us-ascii?Q?vnbdAUk/pErymmktvq07MkppQ/wKgFHroKeLtdiJ7ZalSKbN4a4Tt+U15NPV?=
 =?us-ascii?Q?3CH6QTefN4XkgWp5X+fj2LxLLtnwFOYb5+U4lCsz+0y5qEynAhJy2JYzbS5T?=
 =?us-ascii?Q?ZCwcU8742ZJb9xnuBwfT6ytagXwnZolqY6hsa2P9SIhx6ACNUOj4Y0lA6LVB?=
 =?us-ascii?Q?RqyYl5ED1f0S074A+hbSRhabytOYR0eU+RTKOjWHMMEEp7hQScVVYHFAeHZd?=
 =?us-ascii?Q?u5i2sQ6qfAMAOkNTi0eYqxGWCe07vsGQ4o88hhDruPPVcWic7MMJuVYZF8Ld?=
 =?us-ascii?Q?uJcnoK7C/dLLMulkRFqG/XyjgBvKhuOd5flqJa1hKlTFlsYLCRcMVRUT+DAz?=
 =?us-ascii?Q?dkwXFWOFAjIvA6ewDhPetIuCHxz6J5SAuqWkaBI8JHmt5Y7fCwY3Gp5v9HoO?=
 =?us-ascii?Q?BySDc3rzKlwheb9m2Masod+paBltzXtRjkY1RcZ+NllcpfIgDiZLI2ZIg2Ft?=
 =?us-ascii?Q?v1320xidX/TgqLCAiO8C3pXw+D3/dzCjybJ44u+9amGJcApRXFjvbnj+ne57?=
 =?us-ascii?Q?mldcRecQA+x9WInbrIx1SCW66PaUKRkrhQTMUtZ7Ms48lejwnjy9uI9+fkOS?=
 =?us-ascii?Q?hmtzLBlQcQy3r+55IQO34HVuMdnhRhyZ1p7z97Rv4EdhlRY762PMLVSpL6hm?=
 =?us-ascii?Q?5yVAyaSkqR7ua/+nlfyN2AL+q1t3sIT5Y9T3YCmNOGtnL+M7SAY5AO/4J2wS?=
 =?us-ascii?Q?63wlP+7xOvEkNk3UcH8C957bpMn9bGhg2baINCvYScdbu6xPJxWCMvB4Ns12?=
 =?us-ascii?Q?0/8/I6r++ywGcBsaIp0q2H6+bfTlB6HZfqeFG0ia3+fN5o2csK5N/I0lIma+?=
 =?us-ascii?Q?spnQOsL8mXm7HEUT0SQSWfu3ORoiCCEYDCJmk5mv+QFiUaeStnet+7wYQoHs?=
 =?us-ascii?Q?OBzi3gdHNnlhNYrPXITHRSlS2jjzxd9v2t2qcIIrBhXmJ4chBVaGsP8R+fBF?=
 =?us-ascii?Q?cmd3Yvf+JEsv5oaTTC5cWOs80Kc83iqVmbyFpabQk04UxecdjLLVCeshYyBT?=
 =?us-ascii?Q?3+zWy9BuQbvbFrPe5ZWvZrIuxCPOctB2hmMsJTflXfTUK5aTYinTchYtUMt7?=
 =?us-ascii?Q?QnM36KoBiaI3N3hwbG7XJwD6yigMIHrYk78xWGvrGDe6K7REzs+/LXgbzcpV?=
 =?us-ascii?Q?opLqxzn9FA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 21765815-5d3e-4acb-dc27-08df1afa6107
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:44:38.3465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ns2XivuuyYx1VCCn+CwHAp8B9wZ0C0hdzyFEwwIDh0W8l9AxD/r9JQinnMl1F5xKju+HJ4wH/8vN021hQ/CI3I4F34o8twdG9TPW4LEglU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2984
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 11:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130297

netfilter now offers an official mirror at repo.or.cz. Add it as a premirro=
r.

See https://www.netfilter.org/mirrors.html#git

Link: https://lore.kernel.org/netfilter-devel/arVpqySeeTQ7ZA06@orbyte.nwl.c=
c/
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue=
_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_=
1.0.5.bb
index ccaa80f5ff..6c8731b4cd 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.=
bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.=
bb
@@ -11,6 +11,9 @@ SRCREV =3D "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
 SRC_URI =3D "git://git.netfilter.org/libnetfilter_queue;branch=3Dmaster \
            "
=20
+# See https://www.netfilter.org/mirrors.html#git
+PREMIRRORS:append =3D " git://git.netfilter.org/libnetfilter_queue git://r=
epo.or.cz/libnetfilter_queue.git;protocol=3Dhttps"
+
=20
 inherit autotools pkgconfig
=20

