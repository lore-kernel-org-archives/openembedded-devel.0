Return-Path: <dominik.peklo@rode.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AB2C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 06:59:20 +0000 (UTC)
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (AUS01-SY4-obe.outbound.protection.outlook.com [40.107.107.137])
 by mx.groups.io with SMTP id smtpd.web08.7890.1648105154255005684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 23:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@rode.com
 header.s=selector1 header.b=xZhEJR8M;
 spf=pass (domain: rode.com, ip: 40.107.107.137,
 mailfrom: dominik.peklo@rode.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiw410aCaz3gt82bYdEefU2S5VvX2H1o8HBBQKbyvlEev3nm2KlDX81ZyrnwDSVobEKX/BNTuy0Cl9JwbTg8kAemWXxGLuicYNW3Abz9d1HLQ7CeliZFsvcWPVWNba7tbTna0eukgJb4VnPloEP1gKJiyZiUWiB9x86pnRLClVIliTYAszxO580uJQel1X76nXQfLDX4g1IkKrsQT42SszVmww0QiRwXpzwIH2ly8iDN32a4dq7KWNPZAl9FIXvNeU/TnFpo9YHK81OdGMiy7GigaZ/N/Z+tQD7Pu541sfGYeXGtZHymCGYN+49JIyD94kOx2UgYPLvsd4UF7yG6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmGVx+cDtT7T9JQWs5WXlhO6itX6f4N/gaICFfjbtTg=;
 b=Ny6Jl01WVdp3FCsfxJVPOfjqtuDV9VdvJfAO1yQobESOK+svtsX7QDUvbIlaK2TKcyuc7f8gyy13Uzp35Ilg/8M2eiKMfN8z7zOZmMjQS0ixECPqw8NrdkSaGU2aU5F+QNJdyu0CgBdcjS30xwXTJai4N/6VsbALVuzyhty7JLBXWeCDgCAEehw5ymTnqeIhpBirDF98bcMJGBDYAeERnbzXvY9TwbbS+WSQvaDutrMgk+M+hwFBzRzo0sEvGgKm2Wq6ednc6N3ig9DLPxEtvRV6OOe8oMmQM8qX4lGiscxlKGScnPUkIQA+pUWvhYtrdkulcdr12dBaqbD3LgYjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rode.com; dmarc=pass action=none header.from=rode.com;
 dkim=pass header.d=rode.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rode.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmGVx+cDtT7T9JQWs5WXlhO6itX6f4N/gaICFfjbtTg=;
 b=xZhEJR8Mq7Aulp3JKRuz4tcO/hlaKF6LNucXHmBLxj9j9DtkOgkphT5U2TArdaH4nAACcP9BEZfvrvottyBECff+Rr8kjWI+3RjvNDnBBw4C1y461kukTvsKraZoNd6S/SNZCmlQ4Y7dKxtXcuYfUghuvm1il2oG376AUh1pyHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rode.com;
Received: from SYAPR01MB2654.ausprd01.prod.outlook.com (2603:10c6:1:d::23) by
 ME2PR01MB2996.ausprd01.prod.outlook.com (2603:10c6:201:24::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18; Thu, 24 Mar 2022 06:59:08 +0000
Received: from SYAPR01MB2654.ausprd01.prod.outlook.com
 ([fe80::b87c:9921:dd97:7d1e]) by SYAPR01MB2654.ausprd01.prod.outlook.com
 ([fe80::b87c:9921:dd97:7d1e%7]) with mapi id 15.20.5081.023; Thu, 24 Mar 2022
 06:59:08 +0000
From: Dominik Peklo <dominik.peklo@rode.com>
To: openembedded-devel@lists.openembedded.org
CC: Dominik Peklo <dominik.peklo@rode.com>
Subject: [meta-python][dunfell][PATCH] python3-fasteners: fix typo in RDEPENDS
Date: Thu, 24 Mar 2022 17:58:11 +1100
Message-ID: <20220324065811.2785011-1-dominik.peklo@rode.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0112.ausprd01.prod.outlook.com
 (2603:10c6:10:1::28) To SYAPR01MB2654.ausprd01.prod.outlook.com
 (2603:10c6:1:d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb885fc7-4a5a-4284-294a-08da0d63caec
X-MS-TrafficTypeDiagnostic: ME2PR01MB2996:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: 
	<ME2PR01MB29961AC5D8D84A4E6439ED7299199@ME2PR01MB2996.ausprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	stmDuvW2G2h0tqnFEGVHMnS9nBquCIgQD7ouzhkgljSN1PqJ5V7sabVd3pR0RGqVd2BHkyN1kquiz4HmL0657i1H+gBys/2nNdhgH5wkaXjjrFCrYmJ/XwnyFTwgnVbtnSL3YO9KtF2p+it0T5fa2A8Kg8plLuwmWBPkOZL37asuQ6SB/sr573gxztw6sLEO8tm5z+yYlRDWZbzH74slv/7cOWKENAh0pQ2Cc6wGj5QMEyUAcae+wrV+aofoVpqy9Huz2/eJRen15j4dtorh7qblMxBza8oeuaXM1sftYGwKccMFveqDR5f1EkqN+mrLV6P8KOpUDlhUybL5U2rHv/DiWpm8W/DkDZx+bgt98o6KHE8cxnvlx9FZeCGDhRLaZQkuuTNAomhdZJMfwfjpTebmFHDl7+H7iLcHWbMS8AssBifJuN5eu6zgY8ut02gAar2vWkPQc9Lc5LUX0iyuZUG6pUlKVif/2MfWQeWDZ9vKWhdru0uAO8XNKSo8QOlulI24zZEFiigQi6yV4QlW1Yi6K1VLlgjv+jZtCsKgKjpXjGqQuLOUldTdR2ffzLi7dxt5bUXSq9Ay/6VVz8WU90NqQiW7I/KN+4R0H8W7WxQ1+szAh4mDE8M99eJ64nbs+j9JjxjpdDBBZyNc++c7zjWXNiJpiMV/FjB2JBD0Zv20cyxEk4CsHwPmQyUBaWoPFw3S5jXkY66y+PoDF5L+ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYAPR01MB2654.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(83380400001)(1076003)(316002)(36756003)(6916009)(66556008)(66476007)(4326008)(66946007)(8676002)(6486002)(508600001)(2616005)(107886003)(86362001)(4744005)(6666004)(5660300002)(8936002)(38350700002)(38100700002)(52116002)(6512007)(6506007)(2906002)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XkidGtZ0AedhKQzBhpzEclCso6NMHV1ovovLLwoYiYx9+um8OkLHreeYU2Cx?=
 =?us-ascii?Q?eqpNYwvY/MNOH2msic2wc00eEZ+9Sr1JWSKjlflJeVs3HjoX4JDQDl7kqscJ?=
 =?us-ascii?Q?aPtvWhUSLaB67gjZZyD2BWD+Z+Ht15FqYN5aSUhfBY5GaM46L9aooxv2znqI?=
 =?us-ascii?Q?an7M0h9ETP9wfiBj359QtdNBQOeZgmGKT+hYI07vLjggew7DPSj+K08G6cVO?=
 =?us-ascii?Q?mlX12UM/D/aXkioky2C4FL1t9sYnq3z6siTNXOs3/RmIaMMLnqMgFSr1vahz?=
 =?us-ascii?Q?btBCvEqtO85pi3mexQzK8k8CZOHFBKjgUACcval1+tz+t0Bgm4MMnwWfMTdH?=
 =?us-ascii?Q?Nh3GzbEKHZK2RBQysVMhpcLNSQyRLwNy0YgLbfP/JtCKYK25dgs7DY6ROWAH?=
 =?us-ascii?Q?vD/uGj6N1DcovDkvlLejQhhPbhWWTBeP8/8szXzeVctz9ut5oZ0E0VMciIDz?=
 =?us-ascii?Q?mAgXuKhUdT/5gdKAl6WoiO46mCq0axEVNM4y08uhSR5AwGG72aSxTU72lgVZ?=
 =?us-ascii?Q?4zZe+jS+jsCKiERNwJD3AtOC1W/7ClyenD4fSpOQ13MXtlI2peg77WLI+Z4r?=
 =?us-ascii?Q?Q65l6YooYJE2BY6Lm5cdP/LNsdpAMWqVYXobx7CUYjBuj0sGEekNSvMIffbM?=
 =?us-ascii?Q?wcqV+T4xKPMKE4It8yzFFwNo+GLeda1XCFGppVlfWK4NI9vknRXJVK6uQgDj?=
 =?us-ascii?Q?cgx558hpK8IN6pBVolrwT2T11VbnLKPPrKuIM+Kii3IySM2e8lzUxZYmDOYQ?=
 =?us-ascii?Q?oRPW78jjkvD6BayWVc8e8zFHOZxMw88T+c74BB0swxP+LsXQYAKkIHZrTPYq?=
 =?us-ascii?Q?DSAuCF4sW3a+FW6+vl/AcH8Q6qOvmoESeswMbVLo/Ql8lId3c/4VK9WfzJ8t?=
 =?us-ascii?Q?65pEeJ7Hf2+sWmz03aOq9HrtWwFGYpDv3JzMheTNo4wn9bBH3Yew0ECLDdun?=
 =?us-ascii?Q?SsQErYxybxnMI4gpr3XPkQG78OOvxM+avhKDW3oAaFmHfupZERqZ+hI0I3Kw?=
 =?us-ascii?Q?CTDgbb3XZW+fm5yaUsVrrkmA34mLvM811Y6H99pdeApMkt4HhAkwn5vJiSAr?=
 =?us-ascii?Q?DkG2zgBxktRKO7ZlvrBV3nnBrqNA9INWTAChVUPPX5XEaaiNRZ86bpKGO5QL?=
 =?us-ascii?Q?FxylEX5nTsyAkQe5tg5NYlYb6BSm7GNm34SA1JulBapCAV/f+0tQf2qpI+AY?=
 =?us-ascii?Q?omI/jnPPcFI7301uBhcu1tNh1A1OIVJdOJXrhaqCY0PH41j1+feO5mH/1GZR?=
 =?us-ascii?Q?BWfoMp3aU2CrwvPqIkvqwNWpxg5wX/60bf/yuLnHt6SBCxBMVDbAN5c9cZyQ?=
 =?us-ascii?Q?s7B3aSTEdjihkmo2U0GV790+P1mNFxV7brATgIi3211MbyEnEvru0t40ca0F?=
 =?us-ascii?Q?QDRw6V9tntvunWhQiSCXDLivm+vjuLUS6wK2IcduSQi6Z6B0SldfL8xfcbtK?=
 =?us-ascii?Q?bHIYEGcd/INlsRZ0vWzwb79HJpNFjoKINGj8VsFYKR6Lz98QzoOEuJ7t73jc?=
 =?us-ascii?Q?9jNJPlHSDGfg9zIoVhd2xgxsVdnrM91ZBVpYcQh4e9ReeUrR/1EuINwPQyMz?=
 =?us-ascii?Q?yeiieU3+vQRSRgEgLHAfzWTXt/o91wSgd6rZV/eJxDSj0cITE2afudkeLjsC?=
 =?us-ascii?Q?B0jpAzfgwowCJ23jXRt9MdRWSfqwHJElVqkYaIRPfcUjux0yjTWCOen7Ii3E?=
 =?us-ascii?Q?VcpXVBdxk8REgWg1i2ULnHqRE+KxTokDwpI6F31C6vKDtXKEkgaY6zauoNPo?=
 =?us-ascii?Q?/zqqKO93uHvTFjo/FGS5Yjv88VjTcV8=3D?=
X-OriginatorOrg: rode.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb885fc7-4a5a-4284-294a-08da0d63caec
X-MS-Exchange-CrossTenant-AuthSource: SYAPR01MB2654.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 06:59:08.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3ecc23c2-7633-418d-b998-abc25a5941c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 L54zU81VJEU5NUiiEeAkaesx/b6XadEP5HKyvANVrStEMwuSZeOzDjw7tnXE+A/b5xpRmcsZZ5pmsXb19xSQ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB2996
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 06:59:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96181

The RDEPENDS statement contained syntax error - using colon instead
of underscore.

Signed-off-by: Dominik Peklo <dominik.peklo@rode.com>
---
 meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.b=
b b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
index 1ba2c6f20..7ebaa4590 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "b1ab4e5adfbc28681ce44b3024421c4f567=
e705cc3963c732bf1cba334
=20
 inherit pypi setuptools3
=20
-RDEPENDS:${PN} +=3D "\
+RDEPENDS_${PN} +=3D "\
     ${PYTHON_PN}-logging \
     ${PYTHON_PN}-fcntl \
 "
--=20
2.25.1


