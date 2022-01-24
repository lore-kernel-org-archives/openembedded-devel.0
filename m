Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A22CC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 12:48:45 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.49])
 by mx.groups.io with SMTP id smtpd.web09.3108.1643028523716815088
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 04:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=vjyB3TWj;
 spf=pass (domain: kpit.com, ip: 40.107.138.49,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHdQYbQSMYa8bkkiHVtaM4WolRypModseZqmUmT9dKyF66yh7V10EfSXnGjBKI6/Wg3fKtstkpdvayOh6ZiJ4sNcae9WSJBQvGeMUWVT+Lxdb2KB/+5RA9bZZPHD111Rzjj2mnyvElpybfVMqkgMjiXqQjRmu2f+cMY73ggkw3oBLu+5GzwM/YWPuqshkh3P8pzMyXOb/SbapsA4ItEbgeZQlISQeKYX25MYQz2cwUdrzChYhLP9B+FqtO0AzGxaJumhopZkuA9VVL57Tk/03/rIEzALuIWDGmonRabzt9C2w19EcsJMX2PFN5/LvKGK3dzaqa+JhlZmvDGphZDB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXrUG63tyCciX48npbXBrLTydukwD+NTLx6icrTFhsA=;
 b=b/ddMuqWFkspR6QUo52YjEVpzl5DTo94UIlrjUVHjk3Bu8eR9PtRj7m5oKl7k7k1wZ8mdL0G/Qc2DmoIOnnfgQfacCuuatPIXSetJlM/aEEwznXVelhawS4cHPn19rRWs2yfUbgusGyhPaojmENXTTvkRN7Tjtl2Eyr77aMvAtTZRQfd/68h7EzoBq+dZQ3ga/+/ScqM7mzoFdQHlEmr9NZ4Hnmwb+JzZ6zycDbz96bdUL9IjuKcxl21orQF6W67Vxj6F/BG7EeiNTW6tzhtEfBlrVumq9IW5HLgr5d5eYbhUQaq2JyDpRmrCgyUgufSRcjpw6c9RVFigE4duqS30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXrUG63tyCciX48npbXBrLTydukwD+NTLx6icrTFhsA=;
 b=vjyB3TWjB0YSr8jbvEaLTxQvvc72eqbPheAayQFWYdQITuMJ95nBjvrV8udLE5CYe775rlA0yrzYqguqUv4HuHOa3101viBAXdGXpxWfWltKtxGDiK1DDJMbO7ytD8OCWq4gn8sk2dtiGPv3NVLvfd+AslnniK7j9v+QJj1kRVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAXPR01MB3087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 12:48:34 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9c99:7763:21f1:a5d4]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9c99:7763:21f1:a5d4%9]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 12:48:33 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Akash Hadke <hadkeakash4@gmail.com>
Subject: [meta-networking][dunfell][PATCH] tcpreplay: Add fix for
 CVE-2020-24265 and CVE-2020-24266
Date: Mon, 24 Jan 2022 18:18:17 +0530
Message-Id: <1643028497-28135-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::23) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7512a90-0d59-4c40-4a19-08d9df37d459
X-MS-TrafficTypeDiagnostic: MAXPR01MB3087:EE_
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB3087C51DBF0A4464AE2FC9DF8E5E9@MAXPR01MB3087.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:103;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VFwhT/mqQboi6tOkZkODwIg2sXFdccN6GNeqFzkBxRxMa2K28yIQmhYPU9E3CykXYTNYd6Yh3aAznpWfNzqt6f5YZQkp7ealevD3l5XQqfcVcbxpZRJxj8S2RwHoJS/GY3n0DKPyY8szSyd+j1tqc0Chx0DLTT10LwUpIm891+V99xmhM/tlFyJey7++vdU54cMRM1WvbUHgVfFWxN1TBtUG0+2NzJMRt2GFsCd/fLq+tj4QlU7tYhi6aX+IlJQhqISZKSRv38F0u5TdyK3HRamO//s46V2BtZ07nzJkxZExZbzi7ZbPAuG4dbQDEsC/V3xrtzdWvxH5ccytuKEbnqFKBVbgiwC4c08N8X3a0odj/wYhATwApAIkW4hEnZ8l/XHgGef1q5wqGyFtoqMi24uoon080eZx8K394oPsZw1ZQjps0ERqC2oCgY0Ov0fwcxuuY2YhjQi4iq4TBPfgBJMcKGEdDaURCiIlo5uW04k94lOPX/wbrg7QmllUYatnx3gMm1rTVdrQePSEjdjapUmkd356cANGwi9Uz1CKr+iS/N5ik72zWoMISdDXD8qFBUGQ3Kv6YACUkmZNwSWY5tBHek8VSCs1HuNPlgpHKtwDGx7uGF7kbnKvpp2S+RNMmNkofvrvqy4q9bojh8zd2Mnoeo30ZD1yJMLDe5hgNtgVrblR+5R9ihSJe3MtbkXeiFyZRviW/4UDaliGSF3JsWU8k4gz98bOzUu9TD+qgZ1BC4h7Plqtscdw4LVFoZeECmxl7qsV9/vh8w1Zsip43w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(66476007)(8676002)(2616005)(186003)(6512007)(66556008)(5660300002)(4326008)(36756003)(52116002)(86362001)(6666004)(316002)(44832011)(66946007)(2906002)(508600001)(38100700002)(8936002)(6506007)(83380400001)(966005)(19627235002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/zjC4x5u+yxmrUCJjYhopHIkgL6fnjypgAWwQreUVQH+i3XERbkQugpP1DrD?=
 =?us-ascii?Q?fQ8KfM2RXmbkzusWT4aohsVkssh/ixn1qDJ+WzpMlCp6RuC15xaXc/IyEcCJ?=
 =?us-ascii?Q?KHVtZPLJI5CEm6bSbhva2hdMmC+xQ9/mjISip3dbk/26R4DrBT7O8SFGL/LK?=
 =?us-ascii?Q?/00uE93RG5jq8rbyiM7YClDxt0pkM4r2txnPGdSDZo7new1fVQok6m/6TN5A?=
 =?us-ascii?Q?gVByQlHFzIoDeDFPi3uWpVnG+BCS//pU+vZJsNSNVTtmZaQvQkpOrALv6wN+?=
 =?us-ascii?Q?WBprYqT9vrZeBujkxi4ujpB32t0wpxh4lvpmxH9zyjJmCJr6CBaeinkU1l/g?=
 =?us-ascii?Q?PNF7okUV6rjRa8YSpYV8QBFLnimR4NY+pUvbeewfCJXDPB7GjY2ycQ/1eBYq?=
 =?us-ascii?Q?AUKx2wEmN3kdITk++gmm9BwD54mTAycgulYv1aAhQb/SEg88MOFs5WWt7EoN?=
 =?us-ascii?Q?fCSYcKGeERhB+FBvPmRonovA4rp4Y4xD3Jg+6rexm7yFTHQdTjLtwmdmSGmT?=
 =?us-ascii?Q?YLpLNYUWk0b7g4xi7ih1bU3pGB0td1taudwbu7DJOAmMHLqO5mqoqvl3W49P?=
 =?us-ascii?Q?M5SOPoH+WTNRdA59EuZyJoAn0w0gwcQ9ZJQT38CD+DdoOgR/mfq7OQaw35yp?=
 =?us-ascii?Q?hsYPlJMjbx1pU0/U1AhU6ZYg99RFTUz0B9TLfNe0l40RwXbjq5OmXGr63L5N?=
 =?us-ascii?Q?02nnj1ibZR9z9qwzKgYIU4GCTf2hQZpj1uPsyyThjCN/2YWKDQHdbQUmJ/61?=
 =?us-ascii?Q?ceqG2TrhJIq751C8JOWrWUCLUo/fMrdBSiAi1wg8u9MrP2b8WEo/w9r7OvC+?=
 =?us-ascii?Q?ftdpLArlBZ1LcYhOfTQjMtSqXqRHLOTj11TPpoYqJZErPv3VO1GU5/Ii/cOo?=
 =?us-ascii?Q?pX7DaNJQzFRbfwU5kS2eYcPacZeLSFXztHmC0+aans4VdBbHzP172rV/dU3s?=
 =?us-ascii?Q?eIHe6JKjSJ/N1jNbwBbmn9h/rGf2OYTspDGK05j7P7+y7nyRWEHtaS61XnIy?=
 =?us-ascii?Q?h3caMiTrkBPRAjsr0jH9u7O9h88yZpQl3olecSTUzKnHJc5y7Tgn/zCF8Rb/?=
 =?us-ascii?Q?DmpmrDJblsmmD0aRMvJ3H3eu0offZaUNhMBqWaCKae3dtGbE+ChEh+vyFUuR?=
 =?us-ascii?Q?DzzdVABsENH4rqA8gqlta3n4224xpzHmZmg4MBINmTan43zyUdsH1JyWGHDM?=
 =?us-ascii?Q?a6fPuU4bCCCTi2KG8gzp68iqjEd502mK+KcNKLJV11gtGB6vLUjj5nCegQP7?=
 =?us-ascii?Q?0S+U1cngFGT8XuOL9J3KA4b+ou/dwI2WDbzPICJqsuIns1o4Pv9/WUo2/dcL?=
 =?us-ascii?Q?ldB6J/aQgWbtxUQx6s0zREXgQjf2G3tqeiJWMDuQQZ4xE2u12FgBXZ+eBBE1?=
 =?us-ascii?Q?+mEkMiEpsm+OraiRfjdlKtl2iME+Tjdd4Puw2bxLX9I9za2gYT2459lUyIIX?=
 =?us-ascii?Q?ZsB4HiyFnEXVQ/gXWA7vzW/fuzf7G9hW26k0Gb4m09BNIHthnBiigjk/xlg7?=
 =?us-ascii?Q?FVx8zaEZyyho7vLj0NjbPjKBGPoPRqe0HLJrLeJKrk4sCtvLo4EZ+w97XiA7?=
 =?us-ascii?Q?cPuS8Ll/SpDmvPAMoKxoiXcFbu2ct7oosObjgCQSr7s3rKXltwp2LQFv0yyb?=
 =?us-ascii?Q?+kqqaa1bKWkRsQmnspEaf5gmSUqIbJCpIKSnOY2TxaQejtE82XnjR+xDp8Nt?=
 =?us-ascii?Q?KjLUdbNiL9vJ1slse+B21N/CR54=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7512a90-0d59-4c40-4a19-08d9df37d459
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 12:48:33.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yuVt3l5jAELHR0BoSaQZJXv9YX8pphwiGtQSOPpGWKBivc3LBYa9HxrHdkdswROVAZIiYaPaLU2ququsi2BT+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 12:48:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95032

Add below patch to fix CVE-2020-24265 and CVE-2020-24266
CVE-2020-24265-and-CVE-2020-24266.patch
Link: https://github.com/appneta/tcpreplay/commit/d3110859064b15408dbca1294dc7e31c2208504d

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 .../files/CVE-2020-24265-and-CVE-2020-24266.patch  | 37 ++++++++++++++++++++++
 .../recipes-support/tcpreplay/tcpreplay_4.3.3.bb   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch

diff --git a/meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch b/meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch
new file mode 100644
index 0000000..3ca9a83
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch
@@ -0,0 +1,37 @@
+From d3110859064b15408dbca1294dc7e31c2208504d Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Mon, 3 Aug 2020 08:26:38 +0200
+Subject: [PATCH] fix heap-buffer-overflow when DLT_JUNIPER_ETHER
+
+The test logic on datalen was inverted.
+
+Processing truncated packats should now raise a warning like the
+following:
+  Warning: <pcap> was captured using a snaplen of 4 bytes.  This may mean you have truncated packets.
+
+Fixes #616 #617
+
+CVE: CVE-2020-24265
+CVE: CVE-2020-24266
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/d3110859064b15408dbca1294dc7e31c2208504d]
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+ src/common/get.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/get.c b/src/common/get.c
+index f9ee92d3..0517bf0a 100644
+--- a/src/common/get.c
++++ b/src/common/get.c
+@@ -178,7 +178,7 @@ get_l2len(const u_char *pktdata, const int datalen, const int datalink)
+         break;
+ 
+     case DLT_JUNIPER_ETHER:
+-        if (datalen >= 5) {
++        if (datalen < 5) {
+             l2_len = -1;
+             break;
+         }
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
index 39be950..557d323 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
@@ -6,7 +6,8 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
-SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
+SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
+           file://CVE-2020-24265-and-CVE-2020-24266.patch"
 
 SRC_URI[md5sum] = "53b52bf64f0b6b9443428e657b37bc6b"
 SRC_URI[sha256sum] = "ed2402caa9434ff5c74b2e7b31178c73e7c7c5c4ea1e1d0e2e39a7dc46958fde"
-- 
2.7.4


