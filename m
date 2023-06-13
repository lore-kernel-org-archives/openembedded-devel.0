Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA5AC77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 07:23:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7910.1686641001901154672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 00:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qBUjKdtH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5528db4042=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35D5eCIX015923
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 00:23:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+aVPnzEUQOP9mHjbYwF6tD45PXxek1QDCvw0x80RNgg=;
 b=qBUjKdtH43nQ50PqDSJjo37KRpMBuLH7nPbf9AYSapemMRvdghfu34jPKTQHklMjV4WO
 cFd+FDfVo82IEPJhRJA9f5RZjxxpo0P2OjKWLbnEnzqsCi1FI5wXG10CZh+ZHV+K7ip9
 6QeOvy4dM24RgMs3HbKXdtDpOZqVpVLO5WldOntrCHjTGL2AOjCVQXyBaNC1TboydtPl
 PdNT1yaO9s4uEJn31y3hd2KEbWwLN6YpvtpbSKTePJoETHPK7c5kHkzqbha6Wj7idVZR
 We4zapQk3FuklCWgxFcWLjnfim/I4FIjJ7YZizd65BqbiwjCbEVjx9aADTdZyuTDLucK HQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphj4mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 00:23:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2UEJ4SOOxoMNfXK4nG1R1yZaVkmTt3OqsZ4niwWOnVEvyo+ZMeqHJ92OAs9xntS85n6rMZyNejXZiWk+FsL9YQor8bIRktLkkxbM0WQozA1tfKLHyn+rsfEEkay2MbmN3xpIcQ3S1Kt74MGgRKEYuW8/bbvR34Ldz8zGZgqY8vKiB8ESpJHSbgn0cQiaDtHg2eXVuKpJJwoOz7yUHmvv46cNDsCj/4d/QV3To6AuJEnir5TdTX75tHxCHHUmXbeTT1VVRO9PkGPVUUP4AqXPSO8yIvb8EJ5C4u4QYpbhP5jomeQbwUevaPSphdQ8UtrBfvzV3w+PK5HszCy7swFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aVPnzEUQOP9mHjbYwF6tD45PXxek1QDCvw0x80RNgg=;
 b=RLdcnV8i73CYjROCyk/AGYv1rgMlLuqbT9lawFZUCDlJooUandY4m8axHAvK2isfHg/yd8sVCRyugrRUBjNvOJJNR1NyOEf1IkupzCTbjvlXwkwkJDXe+vvowZ11WAQ0Q1HA38je/qnIrNT63K8J/++E9gJaasoT39ZLQ/vo6zaUZfccRvIHqWYFs5QE4EUbqkqbZzm44rcWgWRJbA7OkKtITFBp1ab5VHc8a5xITSptM6ly6Ajs6b0r9LbT0V1j6vNHhzI6snrTR4pJYiAgSusiDG7+mTEGYTpHcTCInVfvpaQ5sjQc4VqTkNrkvQFMWZQwAc9Dg9Qijeouxk4ThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 07:23:17 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 07:23:17 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][master][mickledore][langdale][kirkstone][PATCH] redis: use the files path correctly
Date: Tue, 13 Jun 2023 00:23:03 -0700
Message-Id: <20230613072303.3170646-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 127724a1-1407-42ae-e330-08db6bdf0e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YHcIrck3jkfsVSh3OJfE1Qvu78Icgr8cp9wBsSG+ktF0/vCmFXGERqYlL0Lh8iGRkZ+kxwaaQPUreOGHiK7yA6GOSNEWNmw38KRA7xajkBjD6yyJYvf63GG+n9oENFX/a+Qo1sXqZ/cm9J6OXbrj8HVvM2EaOd1JEI6CHdxL0xJTC7vcnKPwaZkpoPaLja+tdAJxFn4pJp2jydLo4LIcIWccszBBtrAiRT6Uu5AXtku1W7ZDY0oKajrtEZKKQVSYz8nDcVi+avyBfQQzUIRXJFNXT+ogPuTM9Ut/p45Ee52uMptXT+bUHbEb/Bpb9Utmsho+PfuL8fOorwwxQlPhcXiCNl8aNeaLKjZYEMdnX3bgNA42XIODE1rEM+CxXCabXeNsl3oKG0OPMh9WstGvQ8Jk0DKdtYiLNCuV4UPU7vllxgq3sAF92MTw+z5Iq2kUD127POQHmEWOqyHxkI7xT/oja4UKkDdQVKa1fD37FJ2VQ1w0+0nZA++b2tG1DjLNeJxXG0HWL+zGeDojhlV5zHSGe+pJ5MgUBJndpiavcXT+mfwhSjm8mSl6mL6wf2F4MoNvM4hSngBjidEXXJh4CIPdRJcbF10M2AZWDopK8Jw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(136003)(366004)(346002)(451199021)(36756003)(26005)(1076003)(6512007)(186003)(9686003)(5660300002)(6506007)(41300700001)(83380400001)(478600001)(8676002)(19627235002)(6666004)(316002)(66476007)(66946007)(66556008)(8936002)(6486002)(38350700002)(52116002)(86362001)(6916009)(2906002)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LKkeITRNIljCuKR4YlyHWuCqifeN2Y2AP5c1mh+fG+YEGp5/RLDq/BpR3R3T?=
 =?us-ascii?Q?wTb18tZVqrn6ybdCVQ1vUwkWy5JgXsYOGSbTYOSnu3H2xFZYYXhEdsmFdYuf?=
 =?us-ascii?Q?y2evoko4SIuPDbgMgsAgb+1rI0p2gQIZaocC6exCMEQQQsvkSTOAvSN/2pRz?=
 =?us-ascii?Q?0JC7HOX3BNJywJWVYgd6iT4YPvgxEdfb0zogik8qjyKTRHdgOwvmBorkOyxZ?=
 =?us-ascii?Q?Q7+ij1nPvje6BVkDTt24HApv9ZRqmA4Y1isF2HTv9pi48S69PX1H9kMik11/?=
 =?us-ascii?Q?PDS4ieqmBQvqEtEjnw3IYpIHxgpeBVoXE1uwOecptEC0/vYKnZzdxUuKvGeQ?=
 =?us-ascii?Q?W4jJ+yPae2kO1u264auyMu/8LLresEvsCW6+diMHE/INIW4ahynss2+l1M89?=
 =?us-ascii?Q?Bxle6rMvkPrpfi2OxVC+bMl1zIA/f6F/eiZAFLso4stgwkIzvOthiYt2uXHI?=
 =?us-ascii?Q?ztQ2/Wfa2U+9tkNAyKCfWls0vPidGJ6UUpbFd3pEGTck4hkZs/zCuppBLuuv?=
 =?us-ascii?Q?GhtXuneTFyeJIQ1aT0CYhuubweq09K1W4DgIaBpQ2gc6rZpDRJYpGPR0PCah?=
 =?us-ascii?Q?VfrL7fDQ+VyEaqRgFoAfc8uXjlkgSsOYf7QmPSW79KNclFwSSwWQd+tlEcVQ?=
 =?us-ascii?Q?Hv+uZb+rpQt5qRw4M/PerX/b/dqVbFDR0dz6XxqHT25J8GtbiQ0ZzfqwK/LC?=
 =?us-ascii?Q?/nWTduXVRZaZSJRg5DqbANExOGn2zba4istBd1EmRykItztejhEvMbiMmp+W?=
 =?us-ascii?Q?xImqXNJ306SuMgwXXB+cl14FkIS1cj9B+iG8kbswIsz2I2d29m4r2xImg9+w?=
 =?us-ascii?Q?ww8Sgv7xIWlBBBFEfVHBbqH5B9m1QYx7cxYQ3bbFH9cHjHlZIQbBxuHQORxN?=
 =?us-ascii?Q?afFmQ1hqhB9Q8qdbeWflBO8ucM3z1j53NxpPkT4xPs2uvxwRjpIo6hGbyGm0?=
 =?us-ascii?Q?K914caiPARAlgVRNd4gvvwNPb4mqIvZwiadmIaaDXYddKQQLGqBLXxO8qdjD?=
 =?us-ascii?Q?88zkZqkYAUIku7AWHbCtRtocqtBi3Yls6XxxAdl2LS0t7J3K9R0qKEBvu9/R?=
 =?us-ascii?Q?eCanWcbebDmjL8EwUTqGHzJMf6wELPtIgcEuj+pyzEC5tuyHcaxX9algvSrt?=
 =?us-ascii?Q?PdQBiOxgp8iy5U48HoKqAUat72KWOyIoIjWsjmK5aPilVnfZWYbKWSytejX0?=
 =?us-ascii?Q?OtBN+hF1YN99SaVax6aZ4Y27osF4DheJFcMxgZRfRi+18HcSEH1bReVYlhHw?=
 =?us-ascii?Q?6D2Fk2lPBKocdd26QxgEHX9Plu3B8KBSNnX1zMAHi4dtgXDrcibMGPBuw2v7?=
 =?us-ascii?Q?p41lCDZQXVCraKnEiKPmZBcWpW8p0h78OWO4W+/SD6W9mlqRzVcnJH8oVuIF?=
 =?us-ascii?Q?N7zrpm9Fh1ygouqlPAa+yT4w44FpJ7yZrYHxvPhRcTdQ5jop1E77bww0Mi0a?=
 =?us-ascii?Q?z4pFoC1ZOXE5QOl//Y7Cf4aHYkfwu/uEtGzOsZkgQ4wqpwGd0I4AHi89MqB+?=
 =?us-ascii?Q?tSZYoolIUt9M/RdjHsbFDEXRl/CMx2D9oDIgXDSRjO8lPkzsIsfdfxR41kE4?=
 =?us-ascii?Q?dSv3eJeo6PQwlUIdI9MYzXCwdUO2x6MXW0vFECBA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127724a1-1407-42ae-e330-08db6bdf0e5d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:23:16.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TG17KlP2at9BHqWv3alPxr3ZOoLS59Mh9T8c3bLUd3AsMUcVIfJynxquUcf9idPN7vs5L2xCK8Hn1nCPzf5fow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
X-Proofpoint-ORIG-GUID: Y8EOKLCxR_LGr1s7Y70VE7R1yLdEQ_8Y
X-Proofpoint-GUID: Y8EOKLCxR_LGr1s7Y70VE7R1yLdEQ_8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=898
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 07:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103262

From: Chen Qi <Qi.Chen@windriver.com>

Recipes are not expected to set FILESPATH directly, they are
expected to use FILESEXTRAPATH.

I can see the seting of FILESPATH in this recipe only wants to
find redis-7 specific patches and files. This could be easily
achieved by using redis-7.0.11/ directory to hold all those files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch                      | 0
 .../0006-Define-correct-gregs-for-RISCV32.patch                 | 0
 .../redis/{redis-7 => redis-7.0.11}/GNU_SOURCE-7.patch          | 0
 .../hiredis-use-default-CC-if-it-is-set.patch                   | 0
 .../redis/{redis-7 => redis-7.0.11}/init-redis-server           | 0
 .../lua-update-Makefile-to-use-environment-build-setting.patch  | 0
 .../redis/{redis-7 => redis-7.0.11}/oe-use-libc-malloc.patch    | 0
 .../recipes-extended/redis/{redis-7 => redis-7.0.11}/redis.conf | 0
 .../redis/{redis-7 => redis-7.0.11}/redis.service               | 0
 meta-oe/recipes-extended/redis/redis_7.0.11.bb                  | 2 --
 10 files changed, 2 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7 => redis-7.0.11}/redis.service (100%)

diff --git a/meta-oe/recipes-extended/redis/redis-7/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.11/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.11/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.11/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.11/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.0.11/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.0.11/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.11/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.11/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7/redis.conf b/meta-oe/recipes-extended/redis/redis-7.0.11/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.0.11/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7/redis.service b/meta-oe/recipes-extended/redis/redis-7.0.11/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.0.11/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.11.bb b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
index 4626044781..0fdbfe94bd 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
@@ -6,8 +6,6 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ffdd6c926faaece928cf9d9640132d2"
 DEPENDS = "readline lua ncurses"
 
-FILESPATH =. "${FILE_DIRNAME}/${BPN}-7:"
-
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
            file://init-redis-server \
-- 
2.40.0


