Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC540C7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:49:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9407.1686649786337080007
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JKI+YHE4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5528db4042=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35D9Ha2u024627
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 02:49:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=iRZzUl1iXTgyO2q6ROYa6c6D2maywwbxACi0T0sy/4Q=;
 b=JKI+YHE4DUhSzy+4ObIxRW4J0Dj8heNdSOHA94bQ2gEe/OFaAYZ38vviCz9Ns9uKMJb7
 bzL2O74/0OuxF/LjJqg+gJ3MGaGTIeHX4pxKDTv7HIjy/Dqjc95Dp4xBTndZNsIPyCcI
 DoAM5zQZijA9mATWbKBehigiwkzG/FmMbAPdFeiLuCq4NTJBRlN8IkyqXQFQgmoiyadq
 5/tCPQkByXA55wk22qBYyvmQ1lxHlNU+GPUyOLE1S/mEKl2gHukzvXsR2S+R0OGyzhoo
 8JxUJ/EwG+WGDP09zodsgyzZgML/cvoZmcczI3QBRUBP0zKye73s+8k9OHpY1pmMwdGA dA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphj92q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 02:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7Mg6EDZCgY4LJrV7zoGPQANTiy2RZweJzlh0pEzFAE9uEKAvWRRMPZz1qjuXaoevoCdQsHyjN4wUM0HR4yh24jVzxd8YHwIEmb9tUenLf7b4fGrm/4qBjqtL2gH75ZodxUAMrmYvV+rEbWmOzbuc1lryfzLrK5u5N4Ic93SjKy37XdLk5crWoFeROizcgvllPMH5O6NTJUkOcM4mjJFJj6eAS3PNxcJVrlXyVKp57Np23GoNvBZhRsCmQWiYWARetQdNTSQEozn3TYC6Hw3Ez72JGuIiGtM+v1SZrjy5KUOsiZuwSyV/e5bKw/KZihxjN+six34x4iMZE/6vCv2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRZzUl1iXTgyO2q6ROYa6c6D2maywwbxACi0T0sy/4Q=;
 b=lZWa8E1jZgkC6fzhLBVc991X39DPnvmj8sTcLn8oNL6my5Hy3TZBOQKN3E3/3IaLSOja0i1QwSYKPKHjoXps10QtA5Q9g6gWz4aWfbwWK3pJLMQqddS3cza2SBlPKxRnIlO75c6pNYCjWKXOID9SQ4eq8H2SKq46sMy9fJgBcOgknAduvseHHtZHFdoS4yjH177dJYatABNDE1L6yEw/UIV156fsV3wvEWbAh5kuzoFPg0FJApEZB9gD1VPOD0DWxse58pGjh5VLx/z9KLgBSAJ8vs1S2TBTfXrwfiVdenpuJfotTWnT78wk/9/WZe6Dx40N2ct6pLez2ZydWqq/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB8233.namprd11.prod.outlook.com (2603:10b6:610:183::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Tue, 13 Jun
 2023 09:49:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 09:49:41 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][master][mickledore][langdale][kirkstone][PATCH V2]  redis: use the files path correctly
Date: Tue, 13 Jun 2023 02:49:31 -0700
Message-Id: <20230613094931.3531249-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcb797f-0a29-42d3-bd82-08db6bf382a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QXKSXjIwTDc86PPkt79G0MsHvS0TYFCzbieA46lbXZ40F9TqdyIIB8jowybXvo9ZlSfkZrsAbFOVdn07ALyTZAAyZNh754ZPa875GjvQPzCykPlG/kfvg5ntyXXFWtI9v110ri+aFtTxNlcQiPcYd8ohgwbxleANeQ3DnnCclmxcPU2dykgZKNiB6uhtIJPmGo0G+8EdQuzxTFm4az91BSZM3317OkFNfrmhL3CmzESr2+kJFDj6Gs0jUP+E5BuV773o21K/DrQeqjX+pM6bMiwW5sQkQOlT9gRa9J9QROm1IBCqhJFRZrXxzHtE8NvF0xNRvlLwZFmjM6wOVFp1uIGd9heqBbBV9bT1nwer1PT922lREuiE6ArRLsAXMUkEOfYdC5aTwnd+qBC+T9jV0uwk2ceXc4RDj6dtKWIOIJB7iTBBY1hp8mxF1Ffj1lROVWe/Jhk6ZQkQsiK1kqzAiWgKRTC2r70ZAEwcvOtD/GY1GWe6WNUioGJfiOYbx6o4IQL4i6I4b91hgoXR1FZsjL1BZ5SFouCFKmQ3cauQeDeFL4nX7Z4sHKCBk69PrWSridI4PsKJ7miFXaQqQ/K15MIspixpVWSdKat1UQs7ZqI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(451199021)(19627235002)(478600001)(66476007)(38100700002)(8936002)(8676002)(6916009)(66556008)(316002)(41300700001)(38350700002)(2616005)(66946007)(186003)(52116002)(6486002)(6506007)(6666004)(26005)(1076003)(9686003)(83380400001)(6512007)(86362001)(5660300002)(2906002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XQbs9KS+Cd9U8M5IvwPY7LjA8mTp7ZYYdxtMV2uRLXVnEWq81scJvCKneINK?=
 =?us-ascii?Q?9I6eVWJwfFA4HWVEZiU+bVW3Xk9DjofGTUmsJN4xFm8JfNlU2CX+YIZseU/T?=
 =?us-ascii?Q?a92y5ncJf1NZFKNn1rv1WBWPx83d8gjBptaBShXQAUWZLX/rfYQLlkeM3lx1?=
 =?us-ascii?Q?e2EmHcMpDrCqrVfWUqH9Vc+HPJ7RDyYYZRxizeiokaWZfareh6cj50bi/izH?=
 =?us-ascii?Q?7/+qIssRyBjSKCupgPGfR5+jGpOctTkp9VpC50CtlUb4FfkczJqGHdINrmib?=
 =?us-ascii?Q?pDNhs4dbwBVO6uh7zAejBaAVll/yFF1TMHk/l7w0jD17HRXR0/TCzMgrYPmG?=
 =?us-ascii?Q?T0nGPXsBPvzW4I+2YgbGfpAIPG8uTz/WABYUyXGZySbbkMlL+prfenx0K/Pf?=
 =?us-ascii?Q?M+gV5atmyAoEuPrjTx820IgJAxasHLF9Th8s7JK+4/hZeJSwUbUMGD70Gh8S?=
 =?us-ascii?Q?GLqlic5mCgh/dtuoVgjjubMyCiGVDahHSzx9V8TKLu7DB6ts6+ryK6z7q12P?=
 =?us-ascii?Q?vUu9w2YAe5Jdk9f5v6+yznVXNq7otl7ycurXEH52f5sVOnMCFY93OFcHwi8c?=
 =?us-ascii?Q?Wwn4BFFKjJGfu2vUskZDqrg1ze1mdNAQeYxYBlHvznadt3IZ7Lzs3D5kB0U5?=
 =?us-ascii?Q?GVIVgn0gJ2pUs4bS9WNLzta866IWPcXkXxkyla9ERlGvy5EenBWwsQKl0SH5?=
 =?us-ascii?Q?lByCPi0I2AOY5otQPrgyExGCw85K5gc9sjzXLcycRQs+JPpscsKeTFmCr8UK?=
 =?us-ascii?Q?OJxxVkGaslHTfBIUh9gIVG1qI7I9wHmlXL+Ac7dhrvY0a3NhDuVJPQqF3OKG?=
 =?us-ascii?Q?mCgP7eMKOULfSSMdG3NQgJjjZQDU4wZ5aCSVfJAPwzT3VG1s0jEtwICDunJs?=
 =?us-ascii?Q?rbExyZCrNGTo4lY/R/Oqqk6fjKsQm9Y+RBAgx5ynbh4FQWPwblQ9mNhPjkBa?=
 =?us-ascii?Q?OUD/xntd9qMChycHLSSYt8UJrNbNp0b8AcBOhNK6g8SMbYpmPcZIOHXHXhkL?=
 =?us-ascii?Q?t7lGu6PN1FhE7SqGJmpHdIWwM6eAo10Lt6sYYe4sIpbqPilxrUP8Bi/1aHjs?=
 =?us-ascii?Q?soRscC90or+PRmPI89m7ekZHNasj/FbKX27pM3PUPKWMM/Bx5ZBQWiAKn7IH?=
 =?us-ascii?Q?Oe0ho/8brR8iOHrmQYFQw6qOUTdMaQTbeChV1dOG/ncnbigQrZlbRVquV8fB?=
 =?us-ascii?Q?FRaRLxudxXCWxlhhUpmgWWyK+bZR0gttmC1Yp5Z4MfhgZYp+ux7KTN0Wnn9y?=
 =?us-ascii?Q?mKgDgV01VzTThfdPeUTTddXpWI4A8nLjSJqS3Tz+wK1MKZgMvVOE3kpumtwj?=
 =?us-ascii?Q?3uhR+1SZ4OVjfhYLeBGy8r7RWS8V1O7O8or2mk7MiQR4azKs2eQ1DxYbqZ7k?=
 =?us-ascii?Q?+LavpITR+Fq8MLS8nhbQS/vepXDryOxWG60cRsXuNKjUaFdW3+Hd3enW7dUW?=
 =?us-ascii?Q?FOu2DIsv4wAiQX1Ki7hQf2QOWk0UjRG+xE7bVrQYGGAGqUL5PP2/0bwn9Go0?=
 =?us-ascii?Q?Sg9RSFaM31/bnpYJfBDN+XYpNntxbvcYfEP2A/w6KuAVVehv0RBjIH/ZX2/a?=
 =?us-ascii?Q?sILfn2QAaKxu8wggcIKf18vYfxXAGKYK2Ll9kzcUv626Y3X+x4CcN4Gg5dxv?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcb797f-0a29-42d3-bd82-08db6bf382a6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:49:41.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdCpadt/RGB/qIRWBuLx2e4ZbrzDtN1JCsYJ9Xv/IhqJguI09xfYkl73wfeZm3TDu+Ccg7C7sTMuUMAFfr17/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8233
X-Proofpoint-ORIG-GUID: pza5L81-agSqdyX4JXg30Brfjlg2shH7
X-Proofpoint-GUID: pza5L81-agSqdyX4JXg30Brfjlg2shH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=864
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 09:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103266

From: Chen Qi <Qi.Chen@windriver.com>

Recipes are not expected to set FILESPATH directly, they are
expected to use FILESEXTRAPATH.

I can see the seting of FILESPATH in this recipe only wants to
find redis-7 specific patches and files. This could be easily achieved by
using redis-7.0.11/ directory to hold all those files.

Using FILESPATH in this way removes the possibility of overriding
some files (e.g., the redis service file) from other layers via
FILESEXTRAPATH:prepend, which is kind of a common practice and is
actually working for basically all other recipes.

This is because we have:
meta/classes-global/base.bbclass:FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
And FILESEXTRAPATH is handled in base_set_filespath.

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


