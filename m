Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32B9C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:41:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.69.1646844107916321748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=IJK9msri;
 spf=pass (domain: nxp.com, ip: 40.107.20.50, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFo/mfbULExRgCFlTi0LEBIzkqEkzihhr1hgg4Zu07hQYuhPmmh7x4OOGGFg+HJpu2YC27KvqWeXOl9DS92m/0zq9cOstL12PkIByEIVRi+1Z6JNjPW5u2t5Ax5AyTMRC8KMF9eiF+gsDBYSgKFP9hDPNC70InLjOSD2Gn8k/TNi09kfHXHFjYMS0SEmdPztmaFfsGVvKMfV7zJ6sUtczShJrGN4gISZc8emtlde1C1ZfiePtx/UXpxTeH9+UvisEOI23goQPbrmt5n92sD+vDjLVeXUBLvWPY/044FmQMf8RZNBTVtJRmmc59668MZUOiNq95th65wto4L5nAisxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLt4QgXDd5VVY81ZMO14ga9fAqmh/cZA3bMnEC+h9+M=;
 b=Cas/Qza5b69wV0jRjgyIUEwryoHiw8SPBfhkrHRPjP8YCn7/gQ9C/NJ7amnIXdUkZ0vmmNDSPnUKwiuEoESenoyQskhS0AQnKY5kZEdNfQf5YWbeWdXRfTcVgRO4FCgTHjtGCOvwlb7cwmGE6YwnvLXUaiInP6vb9TQ9KTkNv//IxH9km6NR3DYabovmix4btgjSLZeUwPh10gJLhWsh7s6uSXG9nuFZWp7tIE/+soXR3NdyROhSxvVYPRiqoAB3lbv1e9UPosova2LFk0Z9+llKHes23iqkpQRjglIwA6K4jyztrelTVD1mhT1WbAWOh15V5hA8M5kzdp7FpHhf2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLt4QgXDd5VVY81ZMO14ga9fAqmh/cZA3bMnEC+h9+M=;
 b=IJK9msri04XLKb6qusGSgFuZ8w/u0GpWDXbtmzG58kzgRItB2AOEY7CihfQfMvMoMKAljLZy1mTk2uIwNcFauNbs49icVDl5N/j9202WCqGI3I15B3BwQ8JdU10KcE9UeV3BKejsAmUgPNa2JAhvpXGP9zRaTb7NAMxlaq9b0ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8)
 by AS8PR04MB8342.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 16:41:44 +0000
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::61fc:ae5f:4961:246c]) by GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::61fc:ae5f:4961:246c%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 16:41:44 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-devel][PATCH] Revert "python3-pybind11: Override pip install
 variables"
Date: Wed,  9 Mar 2022 10:41:17 -0600
Message-ID: <20220309164117.3542334-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To GV1PR04MB9053.eurprd04.prod.outlook.com
 (2603:10a6:150:1c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06aff320-bde9-42a7-664e-08da01ebb1ee
X-MS-TrafficTypeDiagnostic: AS8PR04MB8342:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB83423AD66B4931B069D6540EE20A9@AS8PR04MB8342.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H2b3xjYTsfue3BkNihP5dXvSnVgl3kmpjtqysKV/0RcU2YEmNm1KyTNo7N4STcd4ybiOhYXlKnEEU4QyIfqK8MVBiXv3S36rz+WfWlIriomi+7h3Mqpek4/P6HHLwCE2dc4aAP9kkZt22r3Bee1A2Wu1fDy4Ycijz+cwZSSnVZQa2yQNy44SnkpXo+camGRigLitRPQeIzlxkAyxcr0/5qF0vw2k1gygaYfy70WaqmTgGRf0f9q0tvZ8r2G8G+YpMvw8acYHhApdBJFcoj/gOlmusFr1ToJ8EDLubexhFpi88MYgtM1HNT+OKovbApW4D275lIBwjTA3VJSebIxfSEjnEY8XQ9QAXZgGSjpSnaCdttGoRUYb9STzTr5FsuWStOsoySE8Z6QQft+Ln6CRcMkeXze4xrN1gJREiUIcnBA1K+cmw4VwkqTYimwJW5w0brFpFVAJYvImU3c+sJjEjfaq5VbW6CnIGXazINtVDW6Gny221c2hZzxfnVm4idrCZhCe7/G6bmK0rfnuXPiNfkbaZTTkXytSlwieGOzc4SeivrJiqPACitB1GjGsaPEQfOyedJb/ppmPOMVzTP8cGSH9iLZJkFO3Q9QSzmv3Pag72RE1C6ZWTXC4StuwTkhlK8P2BsDkQ8zayoU6ojLTpzOJ11NXFfbqw8GxNsZMoJi9DB+KWJ24X+sn1p9uke/NtCInmP7UQauZmWeoxNZxDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(5660300002)(26005)(498600001)(2906002)(1076003)(4744005)(2616005)(86362001)(6486002)(83380400001)(38350700002)(38100700002)(44832011)(52116002)(6506007)(6512007)(186003)(66946007)(8676002)(8936002)(4326008)(66476007)(36756003)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?76f85YLyEKteE2wDOcI4OhaakfH1aCrCJ93W2xrTfbxsW1c1R8dHUBryBuBj?=
 =?us-ascii?Q?yZYpmxnV4IsIAXsuGVEeGzEjgNUUW3R7Gf8ZS4H7SW8OnJPW6fmkw7URUS2G?=
 =?us-ascii?Q?SBeU2UNjy9lfeOz6Nfm2gddsOPPSRhMIS8sOBR3yxu9UkQDkpqNEuipsvj3d?=
 =?us-ascii?Q?ee+XZksVCBXa+J7ZX5PakOA7uyxYmK2mniudRnLhwYK1xowpP3w3Wae+ETMJ?=
 =?us-ascii?Q?Fmbnnb4ywwANMjbDTUFZm06R9zeVsSl/eGvJCQNF8ZbLfNSo77V3AZElQ4N1?=
 =?us-ascii?Q?t+5wHvfXMoo4AdLguBnxLsWN8N0J2ZhmXS4XL2MlTT8oGh62EloUvr3T/e4b?=
 =?us-ascii?Q?0KhcLcVoXk1rNkB7gV0u7h2FVk+d8kW0NqslsijIQadlKM9KY3ECztP9gBTe?=
 =?us-ascii?Q?UvaHOAjUrMG/V2DItAXhlWvwPdlOd/boQngi0KEmZ9ERqTD/i5r08hf0EFsz?=
 =?us-ascii?Q?bjHXkd4Sgu0M6gpzXCjGexaSdBg/D9kCb91so3Pgi3VjbFvPM5dKnDGrD326?=
 =?us-ascii?Q?PzvVZ/vwtctvjC462xpYD5WV06PeEFhpb4JwXqzWKw4sIwQqzQ6cKnAcF5M3?=
 =?us-ascii?Q?HxZQyWWbnawlNESsEHtHonHqI/4uOzN//jkCu0Dz4qaYwqNIB5ulE8WMYKRE?=
 =?us-ascii?Q?BiqFFiAhI975LZYgWe72FBw9KUkL/49ibbxAQvrStrW9ZcsIN7oRDaRAsOmN?=
 =?us-ascii?Q?soqXT+U0TIoS1kkkA1CyqUSrIX7hiEKUUCz+1j7wb4YLS8gRAykXghLCXePx?=
 =?us-ascii?Q?msquSQ/FMOOP0hiPQhtotFs8PgbDzdURt28cxAEeiyAXgaCPYV79qTu4rbYU?=
 =?us-ascii?Q?Ha1lGSK5/2ez92cLJlTC6Kk7v4As7FwrzhcztWlBH3tlX5cf1POTmXb0Sord?=
 =?us-ascii?Q?fGA4Y3x9Nh3terIhf58tFyYO6V8Jkpc873ICy8P/RQGUss+TNmGtNLeFvmIB?=
 =?us-ascii?Q?GdRu3asnw156AgeYYij+JmveuZ3ucqUOUnaWsOuB4Gu2FSc+SQfL8Kt9I9cZ?=
 =?us-ascii?Q?TFng+j6k4UFUA7z2lgb7lZmVn1ULNNhrupqMwnBU6hIk2DPDVoUxgsoVFwws?=
 =?us-ascii?Q?ihSil56JBhwdWdTGZwBQXvtsgV3fmn5Rk0Fg+i+3HBbUGo9Okl967e1VXQZq?=
 =?us-ascii?Q?9l3AQHT/zk7fkscaodMKCNKwebZhhoELDPraIhCUvXbUYDkEReUCx1uhveL6?=
 =?us-ascii?Q?MVvKyHPExd9L/KJw2+316WS/9RkKHMGhRfdKGa94X74m2ii986zv7nW9r+rb?=
 =?us-ascii?Q?jmD4PV4/KTV6eCXjuqQlykn/mxU3VtdReTQ41M3ITr3ohi1/jnITiz5pqnQT?=
 =?us-ascii?Q?B1RafzDNpFiEdzXulo3AZUkD06MrE3qk+jLI7ieew8hIdBsRZ77/uR4FGV4S?=
 =?us-ascii?Q?pF1D+FpBS0kZnHS7hyBnoUxIcw3Y5HRhUb6FVoryCH1egb5dXkaRefrb33vV?=
 =?us-ascii?Q?o6bCzU65TQdxLiKTWSGDcFJ4mTYDTvTWT9UcoSYNUtsl2QD9fZysVmkNRZ6m?=
 =?us-ascii?Q?gQdEHs8yGungrEIgngi82/J6IkLZ0pI8tSdH+7Y8oBSeFtvsGBo9CFQwC0Om?=
 =?us-ascii?Q?BwtfmOWU82ddU97XSfbrP+lXVipnVWEFqhQuCTKHqERIa+4iSskfhcnQK5A+?=
 =?us-ascii?Q?zQ/63PpYPKMqGJ8dMTBxjKA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06aff320-bde9-42a7-664e-08da01ebb1ee
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:41:44.4385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wRvAkT3etTS5WkDmlhnGpJMnEjT5wfF50JklpZ74e6kMzoFimQGpUuybEM0s/T7ReTiecCqzd8cyKU/SLndeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8342
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 16:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95906

The default values are now correct, so no need to override.

This reverts commit 2f4a34cb1e3c46a1da110ac49d6cc5bac3d392e9.
---
 meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb =
b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
index 4d94e2033..dfacb41f1 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.8.1.bb
@@ -19,9 +19,6 @@ EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
=20
 inherit cmake setuptools3 python3native
=20
-PIP_INSTALL_DIST_PATH =3D "${S}/dist"
-PIP_INSTALL_PACKAGE =3D "pybind11"
-
 do_configure() {
 	cmake_do_configure
 }
--=20
2.25.1


