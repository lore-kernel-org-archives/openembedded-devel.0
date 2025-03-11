Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7307C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:55:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10972.1741704896799489164
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 07:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5165a5991f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B5OfHU029094
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:54:56 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27baxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:54:56 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BEsth7025853
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:54:55 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j27baxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 07:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrjgIOsbE7Rzjm5f0/9HIQ2nLxCwzZW1G7gdNMMvL6Lk+FdpVwx2cMTKGcrIEmHu2MW8o/AH5UcR4FpPsiC8Xnumph/UmA8OQQ3rVwpXvhUHREileSa5Hqe8HR3GadkYYTBNXvEXmiiO+nKYaUcBot2JWCThPvd4EFPpqWOytVXvf5xq/p++IQ4T0SE+SnLaQ2GWrazoseEdwznZjpqZSDxAC2RsI9F5F/ffLfuMLvi4wdf9ZGRCUWW5WhbbP1OEB8U5515TYPfeHnf4fgQfCnFEow/e2MWnz8q9U0F+0c5nv/3zBqLIs+tY6ZAxtRl6uEoTGvR3XxF8CJlXZWYRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hox5TTm1eBccqwqElP2B87M5/n2zts81pJf0uHUlyBE=;
 b=eA+5DynMlaYSYvaSmyUOOLYqhKw70QgOLM3V8RVWpIZVcvCqT0ttmc+inRc67oMPG/VrqUCzNuLJVhXShwEwgn1/0ElnFoMRzZ/Vzxboyq53rbQxnZb3M7ZEr2kdb6IrvnMfpb1Y6c18nkQFVdpKDZUFR10MG+W/1BH+aUy1XVG2NMRgzFFM9O7r0BMH9ukHesZWZ+2D7+2qAlyaMYbmARyYdtYbr6aXgjIku8ghokafHxfVfUBAWpcK3uObUZHLeZDvS6z1+/5C2Y/Iv012cB/PpeEP6o2dH52xnqGgKOyMrrdi9bknWpGAtL7GWjviouDjr1t4e9A4Y1GBjlw//Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB8122.namprd11.prod.outlook.com (2603:10b6:510:235::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:54:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:54:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, skandigraun@gmail.com
Subject: [meta-oe][PATCH v2] hiredis: set rdepends on virtual-redis
Date: Tue, 11 Mar 2025 22:54:27 +0800
Message-Id: <20250311145427.777080-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0260.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: de0a3a6e-b2d3-458c-4441-08dd60acad6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mMd7ez9ycgdNT0TIvhzwWaO9u249wUt5UdApjkELp7H9CMriMJn38enpSrZh?=
 =?us-ascii?Q?U+bXZgUF0+RNYrAZpNzBLRg9hUIPD1mAPuticorQdBFdq3BybcPp9+wNx96B?=
 =?us-ascii?Q?3AXNGWNlQVsRSJGdoFe207ApMgWHQhiKwfPvht+BjyMst/KhooTYbZH/7udu?=
 =?us-ascii?Q?8XDaVYocNZgayFQGXFCYxTDuB5h2ngY2MR05YDz7UGtWiQlI4AB9LZmDltNg?=
 =?us-ascii?Q?eUuSfXjdt209xbA+FYc3ABRuINNgJkjEbliQd9u4iHCfBvFHwudV8NOjHF32?=
 =?us-ascii?Q?Vw3Wj7UokSypUS5uNSXnRUT3YjuTg0ejk1GY+/td1+NGRaUOxPScMxRi7gT6?=
 =?us-ascii?Q?+0x+mzJHEskekGIaob57EM6MeyAc9C+f3dimE++uJwXNkGIauBA+AIl80yuX?=
 =?us-ascii?Q?RKgqDOcGkzOMrXB4mVFg4LxACVhRgLDf5RbX2a8Z+ALx3avgXB5sl3fKm2m8?=
 =?us-ascii?Q?tCVKr3dq0uwTz+OgQ6z05uS8/S487EYrYFZSkKJxA55VsBHRMFxkusP9hRBK?=
 =?us-ascii?Q?IfFimZRVM+RiNxA+1zTI3E3HjywOHgd8A0EePrsaX7FqY5BufQ+AxvlJbKo8?=
 =?us-ascii?Q?++jVuuumO3hmXCySNGMCT4pXXgNgZTeEW0KepFHZWQw+jNrSwWkFjaOSbNnY?=
 =?us-ascii?Q?yea3Z91Y2wf8wTOFDXdLZhZgO5Pa4NXMpjogpljy3OMjPrBKk9PVH85eLP2b?=
 =?us-ascii?Q?+vYVQ7E+N9bKvVRYxVxdy0Zyljy8HDJInQqklZtLmIpJ3qK1eZf1Rq5okOiT?=
 =?us-ascii?Q?ah8FMl0BCSt5FtJGUkGo6caV6sf502oMAvIxSqQNgw580v5wVQcZpXOxC8e7?=
 =?us-ascii?Q?qQ6dAINEwZTI1c1wyQ2N8CVWkZyEGMwyYXyKDnIcEO2uDtwtQljrnqKPjQH7?=
 =?us-ascii?Q?+enyu010vn9FBEkgvji5a94AHrNOD0TDvnMFygn0UaHWrjuYdxcEGXEdwTrI?=
 =?us-ascii?Q?uHa9mlfsPO8w/YsY7PerSnTRdCajut7qIS8yDHMNAyLKuyxUWh0lpC8tz/KX?=
 =?us-ascii?Q?9p9NSMcNen9L1/vwZsSz7zggK2eeMWMoCWqyfOf5lIzWmc4jvzIJDcTFVa8C?=
 =?us-ascii?Q?WgOjBwA2kGFdPU7oLUcSpiZ1gRd4dUYkL3G/WLgvFSUTjzfidUihJwRu4m9B?=
 =?us-ascii?Q?AQ4CkAD/tMpJUY3o2UHtxdoGWshYK8mB8zRcmMz1S5mfN6pntPR3arX/GNk2?=
 =?us-ascii?Q?pMCGUpYryEdeZeOgApLlglELoa+q5J+YrFkLP5IUtpKnRC6t8vicMDWFK7Bm?=
 =?us-ascii?Q?2d9FhQcDJudJp/XDgh99m7XF+5prfecIk3kvdDMcXRk4VT2XsQO6Eh6tZDNA?=
 =?us-ascii?Q?8y9g3UewUi9jrvc+73s1KNJLn4/Nzv0G95GmhWOwUHj+9Y3laBeULXGdOZgB?=
 =?us-ascii?Q?2eN2UcDdO60ipHQBx4AwSy/QaH/4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lOtmoV8rLmTg/vl+t6o0Uwq86lM5v8kIAPahnNJKije8sCRIstC0Yjz495Rl?=
 =?us-ascii?Q?56aVnGQooXpaoE33Mm8S6+VAIxN07NyJzXXS9fIFUxW3WhHvjemLOShepQTA?=
 =?us-ascii?Q?eqnwQsJIKMu5Tr7W3BUw6xAG1epkzrB4npZ/tBSy+IN3NcaYNvZXoQ71PfVN?=
 =?us-ascii?Q?pfV+bW6mz/fGcecimDDBxRX+0P5VMuz/vQ6Ze8URIhdNeweqpnUfqiGycKC7?=
 =?us-ascii?Q?VgQUCrjFFH8TEBNQ2t8O8X7ulPS1GHBBs38cKFrqfKgIiXW9LTwvhzlUjzd+?=
 =?us-ascii?Q?zgJBYtAEXVvYOWzxS0BUdsLIb31Y7jJbdarSDHLaD7BzkuBqcXO1Hx361mX1?=
 =?us-ascii?Q?WqaBkEgjxNk3KMmEWj2LXaVE2JcWxYiX/OiJIKrV+7nmGz7UBsGEO6Fr/Qma?=
 =?us-ascii?Q?cSBlLPzUBTcKtPHb6VNI+SxykDCLY2QFByFRuRgoG6qJ+yvqqsJWSX6PZCbj?=
 =?us-ascii?Q?bTExnaCSlGSdyuR+AMt5W1qqLnblqgMKG6dsAbY15/DeQNMN0xvAZobeZFmS?=
 =?us-ascii?Q?BgP3y1RFgL51NoTPTw2Y+Usv4knhZoHpLFhzk2fzicMIuAwYILWmXKWxJAvB?=
 =?us-ascii?Q?Nc0CdadsGnQK8Z1aFIX5Gy0xFwJEVjuoBkSVgqz76ySc7sEMy/5DwFmSeiqY?=
 =?us-ascii?Q?WrzrhIo+MTxQ0gWk5r2GgxTYGsdQWe16fB4gB5mKyp2WBikwCpEPnujphrb1?=
 =?us-ascii?Q?w4EPm0yaOwXJ03lyxsNpMtuq25TFd/WAVISTgbAWPhW5J176akYFjbvBKvI8?=
 =?us-ascii?Q?9ihKId/OcyTaA4N6WIEEFIDn/26VOnLP3Xl1U7y4iord2cNP6bArRvzhOFie?=
 =?us-ascii?Q?J5/8W3oXXBhK6ACohXq43BxAFFqi4Q81JT/xPgJRU4CpyPtRt7NoBiGkBr0g?=
 =?us-ascii?Q?2o0p6ZJS6hDquASsh5MwzJNGKZnrGvUhr82QmbcpQgi0CKeW6IxLC/fvtP4E?=
 =?us-ascii?Q?/uxopfQtIzYXUbwj/yRS0s4/tGvkiMwdovUBy0tdbFZZpJBsHAEsAMd/IwU0?=
 =?us-ascii?Q?S2/qugfByukJWBhoGFonQuNDpP7HTQKNQyIW+B45tIhn3oifupLi7ryRY5wq?=
 =?us-ascii?Q?R2e4MgIqhr5ja5U00SuDE6B0zL2IXSr5puRms/OMBrfKSVihjwDh9BwVJIhq?=
 =?us-ascii?Q?7ueBOrWL5ZcqwbSjN42UtUKP37I3Xyrlj3ZYY6lZTdda9m4aX/lcg3uJ6JKG?=
 =?us-ascii?Q?XLCsCh47HkI7EIbNWy8+kOFK3j7n9/7rv91b9k41prjdUZqmSqOsypkStTr+?=
 =?us-ascii?Q?irP4WsXv5SxCxJsnUns0+xAPv7vfqKYYBbFthp9b0v8YPPjKVqpdzOk3A6km?=
 =?us-ascii?Q?qrJTKKZ/r2TS+soGp8H8tPwKRmbnMNK+mI0GyAr/dx7ZycsoY3zN2qi6mH0e?=
 =?us-ascii?Q?As8awUCubQIYmqTumrnk2n0hNEACiZx7QhZ1hdLFn+ACj6KftEbjhGqSQ7LK?=
 =?us-ascii?Q?J7sfxoP+QfMo3Rgoc24bWzHV9nB1wjq9PFE2bPGWxa945+37I8rQGQ95eEB8?=
 =?us-ascii?Q?FbqiwFuIGfnVNJp57HL/UhlhHmdeWWgA0W9pHSmeE1a5WV6ahp186kULEXYB?=
 =?us-ascii?Q?P4GL//ghz+6yzm+cjk1YOOuh+J7XmMu7X4dDcl8Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0a3a6e-b2d3-458c-4441-08dd60acad6e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:54:51.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jF2n2QC4eOkAhFxawzjYopK5JeH+bqPGSBsWkB/jAfkhIxh9VsORtNq9IUTCCPP/9Uo/9uZMyHNuQc0oLNnUiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8122
X-Proofpoint-ORIG-GUID: mQFZdS8qcH0OuIl0hq7TGAcm_IhRe0Pq
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67d04ec0 cx=c_pps a=mbHLYBybxRkByWxHAZWYkg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=7UKGVgRVAAAA:8 a=t7CeM3EgAAAA:8 a=wZr8i6qeT7nPttk82tIA:9 a=8Ox4Rr8FuIIqx5qz5MW0:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IKKFxSan9kfCok0Q1e3iDWh3PGDWGN5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=918 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503110093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 14:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115892

Now hiredis can be used not only with Redis, but also with Valkey, an
open source key/value datastore that is fully compatible with Redis. As
Redis changed its license, many users have switched to Valkey. Add
RPROVIDES virtual-redis in both redis and valkey, and set it as the
runtime dependency of hiredis.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/conf/layer.conf                           | 1 +
 meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb | 2 +-
 meta-oe/recipes-extended/redis/redis_7.2.7.bb     | 2 ++
 meta-oe/recipes-extended/valkey/valkey_8.0.2.bb   | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index b75a3ccaf9..d3fd49cf6b 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -60,6 +60,7 @@ PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 PREFERRED_PROVIDER_coreutils = "coreutils"
 PREFERRED_PROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
 PREFERRED_RPROVIDER_virtual-opencl-icd ?= "opencl-icd-loader"
+PREFERRED_RPROVIDER_virtual-redis ?= "redis"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   fbset-modes \
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
index d081242736..dfabbb91a6 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
@@ -35,5 +35,5 @@ do_install_ptest() {
 
 FILES:${PN}-dev += "${datadir}/hiredis_ssl ${prefix}/build"
 
-RDEPENDS:${PN} = "redis"
+RDEPENDS:${PN} = "virtual-redis"
 RDEPENDS:${PN}-ptest = "${@bb.utils.contains('PACKAGECONFIG', 'testssl', 'openssl-bin', '', d)}"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.7.bb b/meta-oe/recipes-extended/redis/redis_7.2.7.bb
index 4f768acd1d..7efdebd905 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.7.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5"
 
+RPROVIDES:${PN} = "virtual-redis"
+
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb b/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
index 5f05f227c6..af56e54590 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.0.2.bb
@@ -21,6 +21,8 @@ SRCREV = "d6a2f561e2751d4ab246ad084e4fa185526fa479"
 
 S = "${WORKDIR}/git"
 
+RPROVIDES:${PN} = "virtual-redis"
+
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
-- 
2.34.1


