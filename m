Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D65C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 15:04:16 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.40])
 by mx.groups.io with SMTP id smtpd.web11.7240.1655219045679697031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 08:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=s70eMPGi;
 spf=pass (domain: kpit.com, ip: 40.107.239.40,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIxMF82PA0Kl0+cUkNIHPdnXJUG+qNoflyQfZImHSe6yUDLBVv3TMWUD7bZt5TpIlmsgtvseLW3bwiWEh1hf3XVVag1Bu8dQKpTD3fclL5OE7Qe6a7tp+OKt+AazQ+xZnZCNeNMP8xEQ89kT8xwpECOEt//96uavm+9vU0H9/bJZYlUzECwLOoBORvL03UFqVrhE/ZfOlKd1Hwm4tmiose64ZDOr2lz2snl+B1ZPo8oUahdnAkNGB13XuzrjctOmS27VXuPlII9MKEvzFFiqExtQd/SdT4K7AonSLhO/kZ+cNt94W38K0hnyGucFmTlTd0aC5rkwZKrvPnCohav8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82Ly+/sSMQ+vD7uNTjYb7qWHwi5VxT1xIJssVQbGYgY=;
 b=S6lEtMZuVY5EmmnXWDcuel/441o7ASbHhtIk0SLWwb2jKQii8x2kZrGAq0HDdXITftauCzj6NNxH5L2Pv6uhRlKa8kCzxI2x0jz7Lus7FkMoB/GAziBqPOGLn0Nm6w5lTXGENj3RmNSemZMGTgOg7889rjw6KPyBe1Y7IQb3BQ+uunRVDbcQeRXzPCB8kZ3xOc6tlQ82NSX9483hvpU10f48akjaYVuDaqhDIJBX7z7Ep23auhS1/7jsZg8IhiotdyOhSE9DBBvwLDxDYloFOvh0DD96W2fKbOuAnhre/MZOyko1SMk8U20mgxXN8/A1qyObAoiIow7PvDaDUvZOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82Ly+/sSMQ+vD7uNTjYb7qWHwi5VxT1xIJssVQbGYgY=;
 b=s70eMPGiWND+iWIIsoWN2PETsVH/s0yf5AehyTI0X26GXPQ4/4mVdjpJmqFVCpfLXujjKGmNJILo9/bT7Vwh7QmEG+QGF9COuPcN4N7sNe2cNyOBQ+sJKeZdO+/Da9UZPQP+fxaMpoN0ZSgZ+U7GLiPIK2i0V4J+/hrHridOVHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAXPR01MB2270.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:51::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 15:03:56 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 15:03:55 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [oe][meta-oe][dunfell][PATCH] iperf: Set CVE_PRODUCT to
 "iperf_project:iperf"
Date: Tue, 14 Jun 2022 17:03:25 +0200
Message-Id: <20220614150325.18753-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c81d8f16-8c4b-4fc6-bc8e-08da4e171a22
X-MS-TrafficTypeDiagnostic: MAXPR01MB2270:EE_
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB227032A45B00928E17307D7B8EAA9@MAXPR01MB2270.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VMFcQEZJyXUxJ/OVRCBcLr+9+GPD5FbSBsX4vAXY5OnC9aF2nO/xopLisFvXeYF4JMAk4f6bSlk4qGdGGTSdI5MO2N8al6BY8E/tL7prFRgatC39Z28acBdpZJyoabBvxSIGhsVvKk66EBuN1g4BHNzfkkGOsqCfDtrGCW/udZ+ucZwcaeYFgmA3DEux0dbSXN4372o8oSyn5dw2beI6M9isscvN1jND4+NrV8OgDgTR3qQKRRZVPLeIEPqkTP/MAYXarGzsa2eOwdeU2RfWObRRJgy0hAohcbKBgvrR7PkRrSu7SFuyOqA+5Fep8UAK+Tr7d04JSlEw/l3gO9uSuLAibKJ1m6jvCUjCXPA7JE6akzZmCagj0GdIBbZcPfkXSQBF3hXpZR0qrtic7kFME1qKWpd/eCXrxUj82vT3WhaYqZM6ML3R2bhE+r2iT6OMrnUwSYmj+4s7HSluCJEy9baHSdqx/dc1mrhH8M0YpDc9NYudyIB1Nds6vzaq7bN9BqS6QXe7xGfziKg98fO/PUBbdZcb/2GfEoOIhXv9gU5WZCTJEjVnkOs6tRjWUdYj7IPh2G4KnrHsCI47NsWikvZ5GqUFrXh1EQ6iBRkVDE8WTIBerBVMiW/4IKzLZQomR2moBS/XXlbcYRu72GlLLJrPGKWzQT1WIbn1j37RGv0jYYCrc9HNlUsOxJ24b5awC2ciJbc9MJQuamx/5xZ9823LA3viu6ad6JiMGa5xn7+Z031U8q0DOUMOWZfsBwhYcw6CxqAB0Qo3YHxsdE4slIXG5orP83ZhuOhyEFF/5jI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(186003)(66946007)(66476007)(66556008)(508600001)(4326008)(8676002)(5660300002)(8936002)(6512007)(86362001)(6486002)(966005)(26005)(2906002)(316002)(38100700002)(36756003)(52116002)(1076003)(6916009)(38350700002)(2616005)(6666004)(6506007)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8qRhSy9sdGwn/sRegT4MMbXZ2Ldt7fGi/aAT5hV/sBBYC/RtYsr9f1t45N/K?=
 =?us-ascii?Q?fs3+AmKBESblfvhvi0ODYXprQg9AzpXCDr9myvQpTWA/7HCO/6Ag2Kqk6b0T?=
 =?us-ascii?Q?EDnHNWFkrQm9nLF9dunUwoPeTVnYfwy2hFkRWFAuYssSBU8jCOLOy2Xiqjga?=
 =?us-ascii?Q?QYvxNtHVjbEd0N6LOxiLKJU+HVvOB0Zc8GZwXOFD1vR+6FXhx8nfRR2DKRAc?=
 =?us-ascii?Q?xuM9+hZnXxfVrJwvf5MH3LkS2jcVhRAlGhxCgq1Nn/iI3xR+mcCHCWFmDKZV?=
 =?us-ascii?Q?zmvoN9BWzAhCKnw2ms4QImgv/N6WWyaTYpjAoiZEeX6Yf5mBk2YVNrsa7Cw4?=
 =?us-ascii?Q?e4OOKk8Hbw/RDuPzRStYxIKADHTeeDk0LuRBdScgVYy5Cn7FNO06iWz3t2ZP?=
 =?us-ascii?Q?O0QQzNG6CKJR2MOqOKlKLA4tGYC5rP8V5pkKtxHE8KYFMhfeaiJ93pKOq9+e?=
 =?us-ascii?Q?zuNz2nXcYdBSQCU0jf1pRCQS/6n5W4zbMvDZgciod5/lULwRRTc7GdGOsYI7?=
 =?us-ascii?Q?o7dt7y1ZQVqR3X8Hg6mOST2SvGOyLNsA3NYeMcGsHTOy9TAwGvuu65CJF8Oh?=
 =?us-ascii?Q?gRusVX80cNISWSGicGHv8ECFW/hz0DtY8YNFbyurWDHXaTXKfQVMVT27OIbM?=
 =?us-ascii?Q?4xKxg+YsWUNMJBymAZsyMA5G9HHty0k3ghKj+KInIgUvkDuYSb3/NcRwtw3w?=
 =?us-ascii?Q?tGxq5EmJwFL0N8trODtGwO/koRCrgCUmOrnCF5vrvMaRLEq4fk7tFrwKRdVd?=
 =?us-ascii?Q?Or3lsHFRRCmrHv1g5ME+td1XHjlJjjIPJgHneCw4vnGVa05yvurXbCUCFRa3?=
 =?us-ascii?Q?UIQ9kJvvHlaUDuhDPNI2186DEYuPvQUJdWPpKBXetD2PcK/OihztkuMpUlix?=
 =?us-ascii?Q?zxIIoL7zaE8KNWxJxx0+fdf35fE/oEqL8bYp36ENW6M9dzy8DoqhbkAD4AW8?=
 =?us-ascii?Q?J/nhGChPcPEF1wGALuNR1Wkc7AILMImfj6LCFpPaxMXhHFIIAqOBPdGgSMEe?=
 =?us-ascii?Q?YK/NfH387a8nB1enZtyWU+prKMgyvJNfAqw8ImBvij+ItfB6eoamVwj2dsuj?=
 =?us-ascii?Q?kmkt04WL1kl4Ai+9wSzq4pjALK6k5nQBNfZCUzXK2O5sZqZ/mhfn1wSTURZw?=
 =?us-ascii?Q?REYxL2rsT84qDXkHGFhysNtItA+Z1utM+QYZ70tmfre0elARIuLdrlpaTJiy?=
 =?us-ascii?Q?PgtrwyRAr7sLA8jMz1lVJGUSRa/gh0ZdfN/ZmYrZvHEsnM/3ziCQI4axIlBN?=
 =?us-ascii?Q?4j1sgftjPloX1qQbR5Hypaq9Xd/OnN0/UJufbmXEwECkOfCcMGtL0g1Y/ys0?=
 =?us-ascii?Q?163SfUSQ0ETnAJuRgs8sCrc5Ldv0aYBOAi7UDSWdesUbXY2Jg7+JgOdvEVTN?=
 =?us-ascii?Q?EawiHZb8EdL1rKfc1t3eVR0cgjF6oZOXKSZznhyhKx3nquyOJ/u82xarOQDO?=
 =?us-ascii?Q?v254VG1C/DUeqXQAQaADeW6dajoTyDSAVS8X8W1KXzH8XW29rDh9bgrDAw+3?=
 =?us-ascii?Q?DxnnnwLFBwwut+PSwGGrRFawcWJ8v8pE5WUmiJHhgx8NXB9PJN8SX8YPBBsk?=
 =?us-ascii?Q?nEkkop31Z8lkYp2jHFtRC0lWk1T6FNdISPeFXvSqpNpKEsSodKgt1ueALxkm?=
 =?us-ascii?Q?PaQEW8bkWB3pK87qLFpKcjr1RqrCHFZE658FzlflnZzOo3uJPmM/f2YPnjrg?=
 =?us-ascii?Q?PL0BBaTBVz6N8i3VORUV12cf5pllfg32fUelx7MXiC2uSNeRvsFRA4GX0W5l?=
 =?us-ascii?Q?wOHli5Wo7Q=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c81d8f16-8c4b-4fc6-bc8e-08da4e171a22
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 15:03:55.7607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fzw+hW8nkus0jDGUb9axlgCJgFPNEtxT7qqmABnGnbcDixuT30M+rXgHLQbWbft1eamh0rXZl7vf15TjVXB0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2270
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 15:04:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97516

Set CVE_PRODUCT as 'iperf_project:iperf' for iperf2 and iperf3
recipes, cve-check class is setting default CVE_PRODUCT to
'iperf2' and 'iperf3' respectively which ignores the iperf
CVEs from NVD Database.

Reference:
CVE-2016-4303
Link: https://nvd.nist.gov/vuln/detail/CVE-2016-4303

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb | 2 ++
 meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 4a520e3be..86e5fef53 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -19,3 +19,5 @@ EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+CVE_PRODUCT = "iperf_project:iperf"
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
index 8536de351..b7ffb029a 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb
@@ -28,3 +28,5 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 CFLAGS += "-D_GNU_SOURCE"
 
 EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}${prefix}"
+
+CVE_PRODUCT = "iperf_project:iperf"
-- 
2.17.1


