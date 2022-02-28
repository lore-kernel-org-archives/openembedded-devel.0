Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58140C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 18:30:23 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web11.1222.1646073022289618379
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 10:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=qUpMOhFY;
 spf=pass (domain: nxp.com, ip: 40.107.6.64, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gECfdUnoesmVr6UrBQiGxXQC1XWTru2r9+gd0cN+w13CbYT48Z5zc8S/6vBSIw4dX2KbUtRqLWTGcNVVezwyodcs2FhZQgnG2e74fvJFmJ7dygPAazcpK45eeC6VnAWiRnt3WtVj24ooJwR0SijL9ayyq4ThagfhazbvNdLYy8g35Nrort8irwMYGmFuulOrSlh34I6aFUS/ryFLeruyAw8Eu9fxlmuZb3HZcGZ4JkfryFX7RQ1LCuzzjiMyQVI4k3cyJCL7UXGfIBi5+TO9cO2f9B5eWzeKYhnvgKyfJqRYZitujZUC+kcM9S5y6ne/HY9rIk0fRPwWeyjrWsnOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDgJ7BUCkxefWz04Otx/gKAhGyGR4bHfhkPCEch1sO0=;
 b=U+tLYgqPT4eyorvEX0WBYl1j0zWiNEU5RfoCNOu4m4l01yMOfuKjPSyWIe9BGSW0oa0NlJUguiQcElXfQxInfzjqM2pJ2IJ9mUU2nx6A+0gwfJ71O5zZBn299zV2MVMUhtnK4/eg8ItYkKu17EQTi/UmyApRewR2GkRWqL/kb9B4AiGsnN/agdsUCtuU2X5vTm8us9W5WO3s0aW3imggsWW0mIrJTUiDVxDnPji57mLouN/Uk619RnhCiQ95r3NmhVh0J5qEdmzvueyNQke7LbtGOP65Pdpgd9ZOqOZ4vMJEM4bEwC7AduzGfb3iWjRMqJHJtPtfnqW0wnqGCHdSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDgJ7BUCkxefWz04Otx/gKAhGyGR4bHfhkPCEch1sO0=;
 b=qUpMOhFYqnyBVQSsTaNA/Z93CSQEPoSii+l9kFSKV4xHCkxwfT++2h2hJSg/sKNIGebhdE/7qeahGTUsAyQwT1FA7OljnuF7o0kQDfeaVlMBw9GCmZ9/StjG+R7pjW+cDwNtdjbCTqPFPvqo2p1/ARcndeEfxSinjyWOdwSTKR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8)
 by DB7PR04MB4250.eurprd04.prod.outlook.com (2603:10a6:5:27::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 18:30:18 +0000
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::3405:802:f8a:2ab8]) by GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::3405:802:f8a:2ab8%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 18:30:18 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-python][PATCH] python3-pybind11: Override pip install variables
Date: Mon, 28 Feb 2022 12:29:56 -0600
Message-ID: <20220228182956.2955678-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To GV1PR04MB9053.eurprd04.prod.outlook.com
 (2603:10a6:150:1c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97953e47-067e-405a-8d08-08d9fae85eb3
X-MS-TrafficTypeDiagnostic: DB7PR04MB4250:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB425031610DD30F15F5429B73E2019@DB7PR04MB4250.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kAXF8+EGvuu/6hpbMycApYS+2iWaZXGRHq+uGGn2KxIgwJijqPIXkc3cGWt9O9wrSfmfuwG8pZ6l3ulvsxiYlMyYvIacIgtsiDqZGgA7IoP4jF3JSlpNPyos6f3jvhyALROw0KA3KvtU2ZVYxfIqRQgpsvIxKgWbFF9tnPc+q56PvRPijYigxVHtx75K5DzCz2Jb0MqaDyq10EyAiPcGIKQXg+LRWd8EUvx3p74lrqQ86x4lloYZ0qczhPPD6hUU38P+Cc5OdGPj3L8WSb40Sy+pG2MyrnLbfwP9EtvF7KdRzPymRdzfRIzdivFOZ6Ysie3m6jer/XoZWL6bZpVnLpKFsDI6J4iii/gkJvrDmdiqxopq1ieR+Nc+xUqQnOGyTiJuDHIEOwKCt+7aWIPQ6+T1bsnnqh9PPXwAUvYY0DbjL1cGXh/SD7EY6TKsmBZe7OQiR3/EPmHF1MXZLx8cV8SDXjpPtGuuGSJVnY2zMHUR45JKQinMi+SpOMth0pm3WI5sMXysH5RAu+OVmMySfgpzv5QyY1DRGoMdSyY61VLCAkcpOJprMOLEh9U19aBL7R0c0Ggk5XsMUKAsXauPc6U0ceWt9snxQmWD/mSOY+hLSHfsNV4nWHATttOei8a5Teh6xvLuTWm/3AvRQxCD+4G1Xd0lPSD3u+4UuzuAWYo4D2g7jODA6dhNrIAheMjlexaBYjPmDtP6aEPSP2YpsQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(52116002)(6666004)(6512007)(6506007)(6916009)(508600001)(6486002)(38100700002)(38350700002)(4744005)(36756003)(44832011)(8936002)(2616005)(4326008)(2906002)(8676002)(5660300002)(1076003)(26005)(186003)(66556008)(66476007)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EJjlu+w/c+lVlsKd8l1i9UDGcKerDQole2Iyk9NJMxWY6VKXWVadWYlE8K2f?=
 =?us-ascii?Q?TiVatb37KWa28ERr9n9WOP2mGSUvJolLzHnVnpMKNifqQbuIEHjp8EM+TgZP?=
 =?us-ascii?Q?SvGDVCRUMqbpXPiQT+aYJPIcu5Xa4/uy2QGyJ7agcq1P2MEWLEX17o+retTk?=
 =?us-ascii?Q?HmI+luUyMNXPYcXpnZ6Fm/32wR2Hto9RopxgHGieAmYdB/g2+hwWE14JP6wc?=
 =?us-ascii?Q?GYQihV9mTQCS9LkEPLHi6uU4dof7hEr2zWEUbA90d59p6V9yb5e1Du5PQ2LJ?=
 =?us-ascii?Q?MNOTuDyfCTEti+kxCMUItlZ8PA1tfoTCLRRaxTXQrQI7jDOq+53SlPHSFafu?=
 =?us-ascii?Q?80mAskeYSIwis9MONnLzxTwHRb6UGChSeC5jqgQaqnP3PPxSHnKhwqQqwAZX?=
 =?us-ascii?Q?tbDBgzEU1VAqKatSAndD1MGGMZR0g3tDRg5+JXRrTJ1T5dcxPPBdiZ0YLibX?=
 =?us-ascii?Q?aTMzDffMsKrzaDuM1aVSqUbCQzV0o1WP1FZmxC+aivEEQd8jgbKg40A5uhET?=
 =?us-ascii?Q?2Bo8DtJdHRvAgBYZj6R5DLB3UHjOEtIAelee9bqk6TaaP+v0KHIP1+gNtQ2T?=
 =?us-ascii?Q?Ibxe4sHQVn4ecIKAoBcMzZVyfR3+GBhULTeutdBUbkWY1Q3xaQ2k+0+weO5w?=
 =?us-ascii?Q?mBVgVs2AtPpYTC+8jsJatLZ8xdxrrCH1HsHW76DBhF7k/GiuwOYGWXUoUXrB?=
 =?us-ascii?Q?Vz3m7Bsv7B694WqfX2apYxAxNxamkK82W5amXWdV53MQ1/McrCMn13AhNOU8?=
 =?us-ascii?Q?eSJ2AWGTSbNSIwMTFfKBSLdAVzNSc0TADF5AAdRAh9/cdTn1sYQdhArKWsct?=
 =?us-ascii?Q?dTrR2DG0i9/GRmu2CSGTu4Z5Ivi7SsyuU0h376l05M9zKgGvnropiARfJ/Q7?=
 =?us-ascii?Q?a2h4BVHjEw0+N9A7/nhloQTZC4zH7t8RDWZOcbEjpqlISWsgFAaZyjQ7gzxz?=
 =?us-ascii?Q?VH2BT9V6yYvodb0KYnzCRoOjRQMwD6F5v+eW7BJCBezOTy8YHy/tDlQnOGj1?=
 =?us-ascii?Q?JUECs0RqxwqTexHyKLuxTnMqwWLvK+6cC5SGUapjhMkNka3Wo84wt9oHNlEQ?=
 =?us-ascii?Q?AoCnyHu153wZgByhC0/VaiTWqDlLnCHB/JZsRfbMJnnTt+qlMTwbiq5au7vN?=
 =?us-ascii?Q?qByXSCl2bZhSHfvbtMWNQFunLlJFhc+Av23claFH+mLbmIF0yjWYmjgzkttP?=
 =?us-ascii?Q?pUasz4JTru+pfXq+7liPFMbFUpXqNKsOrzoEy5SbUI3O4JhBBVYrQEudqvQh?=
 =?us-ascii?Q?8IBHzUfJIhNSqDuHrtZV0PfK0Qq2IvesBw5SJfy+25dgoJ4CTtBlNqZCyzkM?=
 =?us-ascii?Q?ZyxpKuUvpa4IgaM74jU/+nT7B/IOIiYMcFoedxPemJDeGn0TPmdlpL0Q+Hlr?=
 =?us-ascii?Q?d5keaTdFZDy6kmXgxGnov2t0jGD9C4WYGmxQQRw2NoAtGl5i/IK/v8sy9w+V?=
 =?us-ascii?Q?wWfEkR6RgD4tbQtKRBhUpdMVu0s5NqmcPxHidwSAMn7XYgT/9RczDrrVkzvL?=
 =?us-ascii?Q?ahVb7xnl0iOyuVZYlwErucNCVxRtmqjm0hJ6Cg9OBYpRXl2Fbd4woBD7jVjD?=
 =?us-ascii?Q?2g5T+CKYLrtXhAInEzqqoDkTJx6DqF8OsgZ9HQVPQDyTk0Rpsyf1uMEVMAKS?=
 =?us-ascii?Q?fRYJPcYJ6hHfZ+kGrmNui2E=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97953e47-067e-405a-8d08-08d9fae85eb3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 18:30:18.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E2gKgYMqsFc8B2tgMrem7lylEAXhd7kF9Eb66bqyl1JkYkU5t2rcTx+h1WCA8i+6V7EY7Ygg5gY8/htmWthMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4250
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 18:30:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95592

Fix the pip install variables since the default values don't work
here.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb =
b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index dfacb41f1..4d94e2033 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -19,6 +19,9 @@ EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
=20
 inherit cmake setuptools3 python3native
=20
+PIP_INSTALL_DIST_PATH =3D "${S}/dist"
+PIP_INSTALL_PACKAGE =3D "pybind11"
+
 do_configure() {
 	cmake_do_configure
 }
--=20
2.25.1


