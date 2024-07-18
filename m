Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F9FC3DA5D
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 01:25:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5699.1721265897795867124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 18:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79291c7a7b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I0eZTp007256
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:24:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc812k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:24:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbNtQu2Ij0x+JV4n9JQl3UiT0lLPPmqBd7ueW+/1nm2gytyw1x2dWtCtD6Ak7E3drwnKLqBqn64nITRmAyYjaXW/a6AM3ZZOHgAfUf1PRjNKUsckqmyjg95zve/Ds0VKkHkvgi89yGCzXi1OufuVx+92qVm1xML6AHGfySX8ttW/dAPj22apTAt0KjG/KZpvWnB576Ydx4g/653V0tIzf2E2Twef378OR7BoD+SyPkoyzGnc7G+NoTXoPWIp2qYZtpdFO02go0QDqLAshFCfYbY4QJh8hoBddUNSeNWCH1VLxyA/+psgcLf4g9ixnYE40MsGzte08ffqriLnLiC9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7UpXwEx8zmtN/mnge8I1plxZiMjRjEYsEzLS9oaMwk=;
 b=fjkM8Y4GeNEPocetqRCv0Co8MIjaWNnOAEO3HNwapTWrX0xBJXVrMZUBOh6H2DMst2U5Kcw0BUtFLAY1L5NdPw6OSVxcRbmOY4fPx52QXxyLrBvzq7TRn6y/WNBGBVJszOMKHrpCPh6ZB5RDkzSzM8fQrM41yaTC5CZIyxtPx+/gYUkzDVvmfAQycthKsi8VflHerqKFA0IV/CvwRaUuUaB/QzRu79ufPOc3BgN3vm7B10muA5WU4AJH9/m8cEzAUr1a+4OEmvel1hWei6SH3snnMJz+i5ByfWHVWUGCBJ68RF8hOkXVCgaIAXQ7JSb6fvN/GY0a9XsFZVqeAHc+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Thu, 18 Jul 2024 01:24:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 01:24:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 1.0.9 -> 1.1.0
Date: Thu, 18 Jul 2024 09:24:42 +0800
Message-Id: <20240718012442.2618295-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718012442.2618295-1-yi.zhao@windriver.com>
References: <20240718012442.2618295-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b7be37-9213-4023-29d2-08dca6c86d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ETwEbqgFG5ZkTuqp+ticV6TH1nzzCuaVhJ7lUXdHjSInTR9g2u7ruB2ZNx57?=
 =?us-ascii?Q?lmIPONSnUUiDXLgUJ0rdAnJyFghU22nHWbknefwq4fJjZTRHeOQFozHROUGx?=
 =?us-ascii?Q?cbmRhGMSjz6EhuxdWH2/8PYRm5OMGG7ER3zpNSveT0z9YqIIFpKTwpCjMxGJ?=
 =?us-ascii?Q?NHrrPgRdXo8p2n9GaOIeZQCVSNXNuoUZVoA6NBAFqDdizqE2kGFuYleEI9Qh?=
 =?us-ascii?Q?+sNlIy4Iahlld4naYzvSEr8Oqz1VwzUN/IA8juwEBVMW0DshEb/ZEGd+8mAb?=
 =?us-ascii?Q?zw7R/iTwPJcta3hjnX54eYEO4wspXggzA2fvPti37VgzPTBDb4G668PflyUm?=
 =?us-ascii?Q?bR9cYfvMultmGOQOcHHc7EoSCM6CO4y7k8lyUdNCPu3HkG8AR/MiEIjxbbKJ?=
 =?us-ascii?Q?JtIEZvP0DOoN1mro4H2xT40Br87h8N5mo99kXoBB7ib9mMlkRidhN5TKVu03?=
 =?us-ascii?Q?TeXkQjZxbbnBNGCazRC7J7cnzoYpp6XzNF/7StnAVZ9R0S4r7N/hJpuG/fk0?=
 =?us-ascii?Q?lmPZPaZTZS9L9Jf1LBCNdbjgpdaTuyQ9bOgZZYovw679psdrKco2wXoLbsZa?=
 =?us-ascii?Q?PhDY5BRiovM3nFPP+bNuliucju/sVic8LOsAr77166KTEliXs1wTMM/usZWv?=
 =?us-ascii?Q?3rPAiJHo/Lt6039qN37HB1yUMRwnemOSNwfPWUNGr5wo6nWcjkAVGJlXD7M8?=
 =?us-ascii?Q?Sg8iScZtxINi3zVGK5YFFs1zzBKbhvNOT2ywfOmQSylapzborB6jTYEV9Tn+?=
 =?us-ascii?Q?eS6xyIUVV/55K9RwDXIxhLV5nKjGb7c0EGalHCWkhdaWFoJm+JaJi1SyO2IQ?=
 =?us-ascii?Q?slZ/8gv48tpooN8Zied3FaVcP2rWuY7lIYMUJbkPN9BDd6voWOj/u3JUJB4/?=
 =?us-ascii?Q?dUl/ahWzjtj9/IEu6LU/JqDCDycadtPuA3Cszy7rqWGVfsMLnSTCty4awpp5?=
 =?us-ascii?Q?IdfutFyKSSpPPcnSmLs2N9dTt4EAOPxDNpjVI9EgfWMYXwqHXM2qhsE7kUx8?=
 =?us-ascii?Q?ugiito481MyJiBkwRIbX0xNDs0HbsRC7ykn69v33heMphT+yTKuaqUvtp5mZ?=
 =?us-ascii?Q?7fsP+hqh9DSfCbkoIbnGNWS7a9vwYZDUqOVCf6Tki5YhVO5uGZVcRUZkh8Jr?=
 =?us-ascii?Q?fgTbTpGYtHEufYkQZb51b6uM1Q39f1srQgEl9M2Pdxc6SysjO2PU+O/AR5bb?=
 =?us-ascii?Q?nwLh06qwALdiLLv7AiTgNLIC3/ngBNhZQAJcStAnrkwq5ow+ykk84/T45H9X?=
 =?us-ascii?Q?g18zcYfMF7LvKsuehAvpKXwIozdQaSM/k5h7gTjMOp9DkqqpKf8v1C050nAG?=
 =?us-ascii?Q?tq57x81yZrRasiDZvgaj8Ns90mKHvdqjv9GpCyCJSMcDJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BoSH6whlEaBv2v5tQN/KptgTpMhEKi56cgMjlGpJd1QjftfmmfKhpHl2eQFZ?=
 =?us-ascii?Q?nJL8NYsnfvE6TI25GZGdToHM6IdB7NbAbzgLcr6nBeHcSLsc6eEfYeWuaC8W?=
 =?us-ascii?Q?zvC0K88eMLOqqtR5Ad29SycVKkbqgASrWrlPDgvl0c0t+ew/Vgl7dAZaB/iS?=
 =?us-ascii?Q?O5T/8pIqH69l5JH9IfZxSDXVFWP1vlXnyq30nYA+v0ZDwJMZxKze3nutXTbn?=
 =?us-ascii?Q?x0facwK7vS/AwFhAUzSeZ5N9iCJCOmtWeuFdw6uG304kFP35w6GpPuvs/c1P?=
 =?us-ascii?Q?0qUv/OIm2jy6IoRJkL+QH1mUdgPcRYQ9ziRt1GlC2nThfxkcUau1+obC3E8O?=
 =?us-ascii?Q?5hztLD5MGfhrNrrFNNV1Nj3fYAg949pWR6xc4FyXEzjwS70n+jUNHXIz3fRy?=
 =?us-ascii?Q?snsBcM8t0//U1rT1XZIWhoK5QMSzT9g3QBJTePE4PfoAz7J+GdJlZ07bgTb/?=
 =?us-ascii?Q?W88KZRRYvEhAhQlO1zE022+ICE3MUED/NTe/GdBefzLFO0b4Y+CT1p70+JxF?=
 =?us-ascii?Q?RGzssNzvqDdnOtnZ0iL2Gs/LeDlqymjnk2yRibJvNEDpMz/WEdEdP8Z1jzKD?=
 =?us-ascii?Q?6sWKGOGundC1WeHIFDit5xkVXlacDnvc7k55CAWNgnDOZKlY5y5kVcOKMTqN?=
 =?us-ascii?Q?4E6v6KtAHp741YGgxS+pxE6fZG2vF0LZltVS+a/K12zex98VZ+CUr+z6ZF1m?=
 =?us-ascii?Q?1gDUHm/rwnx8N9PHY48FQvLlyjt0rb+1mqaYnQOnY36hBmPS2ZEGzBusoCFn?=
 =?us-ascii?Q?PinJDjyvU7Fg6a3mB/3nbluX6P5s9SRv8FWXNcs2JNQoVwbcbJf3UjWEAk/0?=
 =?us-ascii?Q?PU+Ik9l80ecWCLmxHEWUFRm84MlyQINxtSxNlsJuK+0FrlLiNYte2dL6Qmyp?=
 =?us-ascii?Q?b5uGvuMVJt3g5PxVRgYjemy8VdHuKjDcW6n+dXOU2NuVV5j4PQ+TPaH9sEO9?=
 =?us-ascii?Q?ToS7KD5Sdp5klFJGt+ZUJgYBJL5ISNqjtEip8zWAonXiUbVUim8kM2q29Qep?=
 =?us-ascii?Q?AS/aGl+jb/qddoVspGONNc7GdWhIZcxixU2no0hOM7FKGdYxQ+WY9feJexhp?=
 =?us-ascii?Q?VDq0GR0x0xdqYqyeff5KEXbUvHHa5YtSrKWPenBEFJiWuK82MOI/ORr7pm1h?=
 =?us-ascii?Q?UMkJvS4MJitPqd4ks53pHjNm8QtAyrKjQcjRJ2/3VZnEnxvJ55jV94mCDBXB?=
 =?us-ascii?Q?CDWUbQnG/os1hhzrFCOqxeU5XWp5rNuLRz71s1XXJJP1KewqMXX4Yt5FIqif?=
 =?us-ascii?Q?ayOov4c50XnO7em9rHqXm3zWw5g5sBuP6VJLdzmDhC1IKFvSrwcA5HPFbOBX?=
 =?us-ascii?Q?wL61Az3Osbav9XiZTZGbLDtDZLH9MEcBIGnQrQ5Vokt5EUew16OOfW46x1az?=
 =?us-ascii?Q?P35yCX+pO0uPUi2TffX0QE+W1wIt8/JdQdsh7blkT4qRMN0NPIJaS3S5vfiw?=
 =?us-ascii?Q?SNyHo7na2xD01cOOuZJGrJNkvr9OKQVX71yv10ndZrgzFvM8wUWiXe50pGDO?=
 =?us-ascii?Q?rncFxWKv6vOzl+8Ko8ST8N2IsAdkhnt3BDZLxdZoASnD5x58mZXF6vLKP6ed?=
 =?us-ascii?Q?3M9FpZrQywPeZuFD5tZKFZ2e4SK0ZTUxfNIF1upW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b7be37-9213-4023-29d2-08dca6c86d86
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 01:24:54.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6atu/uZ+1vQxrspJEDp+LbWAzG5hI0heeDsnedgfcG1Qf+q0zP1QP9dPRvwfX/usGW9HkJx9y1IdEufwy520g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
X-Proofpoint-GUID: 2DLjuznZb5T2yUAEXRihUQfigd_UyfKN
X-Proofpoint-ORIG-GUID: 2DLjuznZb5T2yUAEXRihUQfigd_UyfKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 01:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111388

ChangeLog:
https://www.netfilter.org/projects/nftables/files/changes-nftables-1.1.0.txt

* Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...sets-reset_command_0-for-current-ker.patch | 53 -------------------
 ...-secmark-tests-if-kernel-does-not-su.patch | 46 ----------------
 .../{nftables_1.0.9.bb => nftables_1.1.0.bb}  |  4 +-
 3 files changed, 1 insertion(+), 102 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.9.bb => nftables_1.1.0.bb} (94%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch b/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch
deleted file mode 100644
index 164182bb1..000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7a6089a400a573b9a4fd92f29c00a6be7b8ef269 Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Thu, 2 Nov 2023 16:02:14 +0100
-Subject: [PATCH] tests: shell: Fix sets/reset_command_0 for current kernels
-
-Since kernel commit 4c90bba60c26 ("netfilter: nf_tables: do not refresh
-timeout when resetting element"), element reset won't touch expiry
-anymore. Invert the one check to make sure it remains unaltered, drop
-the other testing behaviour for per-element timeouts.
-
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-
-Upstream-Status: Backport
-[https://git.netfilter.org/nftables/commit/?id=7a6089a400a573b9a4fd92f29c00a6be7b8ef269]
-
-Signed-off-by: William Lyu <William.Lyu@windriver.com>
----
- tests/shell/testcases/sets/reset_command_0 | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/tests/shell/testcases/sets/reset_command_0 b/tests/shell/testcases/sets/reset_command_0
-index e663dac8..d38ddb3f 100755
---- a/tests/shell/testcases/sets/reset_command_0
-+++ b/tests/shell/testcases/sets/reset_command_0
-@@ -44,10 +44,10 @@ elem='element t s { 1.0.0.1 . udp . 53 }'
- 	grep 'elements = ' | drop_seconds | uniq | wc -l) == 1 ]]
- echo OK
- 
--echo -n "counters and expiry are reset: "
-+echo -n "counters are reset, expiry left alone: "
- NEW=$($NFT "get $elem")
- grep -q 'counter packets 0 bytes 0' <<< "$NEW"
--[[ $(expires_minutes <<< "$NEW") -gt 20 ]]
-+[[ $(expires_minutes <<< "$NEW") -lt 20 ]]
- echo OK
- 
- echo -n "get map elem matches reset map elem: "
-@@ -80,12 +80,6 @@ OUT=$($NFT reset map t m)
- $DIFF -u <(echo "$EXP") <(echo "$OUT")
- echo OK
- 
--echo -n "reset command respects per-element timeout: "
--VAL=$($NFT get element t s '{ 2.0.0.2 . tcp . 22 }' | expires_minutes)
--[[ $VAL -lt 15 ]]	# custom timeout applies
--[[ $VAL -gt 10 ]]	# expires was reset
--echo OK
--
- echo -n "remaining elements are reset: "
- OUT=$($NFT list ruleset)
- grep -q '2.0.0.2 . tcp . 22 counter packets 0 bytes 0' <<< "$OUT"
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch b/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch
deleted file mode 100644
index 2a966ab44..000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fff913c1eefbc84eb2d9c52038ef29fe881e9ee9 Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Tue, 21 Nov 2023 21:16:38 +0100
-Subject: [PATCH] tests: shell: skip secmark tests if kernel does not support
- it
-
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-Upstream-Status: Backport
-[https://git.netfilter.org/nftables/commit/?id=fff913c1eefbc84eb2d9c52038ef29fe881e9ee9]
-
-Signed-off-by: William Lyu <William.Lyu@windriver.com>
----
- tests/shell/features/secmark.nft                | 7 +++++++
- tests/shell/testcases/json/0005secmark_objref_0 | 1 +
- 2 files changed, 8 insertions(+)
- create mode 100644 tests/shell/features/secmark.nft
-
-diff --git a/tests/shell/features/secmark.nft b/tests/shell/features/secmark.nft
-new file mode 100644
-index 00000000..ccbb572f
---- /dev/null
-+++ b/tests/shell/features/secmark.nft
-@@ -0,0 +1,7 @@
-+# fb961945457f ("netfilter: nf_tables: add SECMARK support")
-+# v4.20-rc1~14^2~125^2~5
-+table inet x {
-+	secmark ssh_server {
-+		"system_u:object_r:ssh_server_packet_t:s0"
-+	}
-+}
-diff --git a/tests/shell/testcases/json/0005secmark_objref_0 b/tests/shell/testcases/json/0005secmark_objref_0
-index 992d1b00..5c44f093 100755
---- a/tests/shell/testcases/json/0005secmark_objref_0
-+++ b/tests/shell/testcases/json/0005secmark_objref_0
-@@ -1,6 +1,7 @@
- #!/bin/bash
- 
- # NFT_TEST_REQUIRES(NFT_TEST_HAVE_json)
-+# NFT_TEST_REQUIRES(NFT_TEST_HAVE_secmark)
- 
- set -e
- 
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
similarity index 94%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
index 17f00ffd4..1dfaad494 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.0.bb
@@ -12,11 +12,9 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
-           file://0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch \
-           file://0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "a3c304cd9ba061239ee0474f9afb938a9bb99d89b960246f66f0c3a0a85e14cd"
+SRC_URI[sha256sum] = "ef3373294886c5b607ee7be82c56a25bc04e75f802f8e8adcd55aac91eb0aa24"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.25.1


