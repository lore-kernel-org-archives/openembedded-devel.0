Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E5EC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:49:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7319.1678283382213446801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JwgAcBBW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24318e24f8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328AmgjY017287
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Mar 2023 05:49:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=BYEAPUX/Y12rNFyV+N0vYcNZHy6HADhWM1InC02kHSc=;
 b=JwgAcBBWmiJ/u9tEbS2ppxnxAvNMvvUFZ4CxpD6F/f2OXYWur5EISupCggj7zGmLWuO2
 w+ANKQpeRcUMfzRrWDr4ZpJl0YNepNorC8PjeckhQ/IGLGkKe/GxkubFJTHykKkiK5XV
 aatK1oC/Ssk/XTc3UnGpkzgqIUFBVizhnbCHvyaXk34/f70GxGmxCtrJrYMXdnlYTlMt
 eRWQAgWWlulMKhO1iTORiSM2KmG/9M6ZB8rWQ6CN83S2SFAdIJxhe5aKUAJ+es1ivw7p
 JykuLE/OtqCh63rTUM6AX6BV77WElAQAfbAhXKO7zx2duoeBKzNaDYUf20QwSwicER70 gw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6ffd0h59-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 05:49:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0vj8Zc3oqQGJ+et7337GUtBwXL+vUx4a5jOYrd+re9U77bU/H74EGMD+rmlGBYq1DII00uphjd8QaCxMnTczBVs3X3QP5oItTQ6UZu8ZMFMgQ0uYfgVGKmrBbPyYdC1x3iuxpUBWk3oHfn3bmgScSOuywmp+uK7/ar2fPy9YnFyvE3u2BecEgaTzjsV/3ROQD592U5d0CSiagJs1y4Z0h4dw62jzCwzHKh4hXq1nd5qNpghu/6OKZTxFsfg5/jBA1LBJbNtSqILefnLcGKNfXa4w+QL/tguhkO5kOanCdk4jwwFEgtF3Z0b49eTlEvL0B6VIwnSRuXEt0/sbFHvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYEAPUX/Y12rNFyV+N0vYcNZHy6HADhWM1InC02kHSc=;
 b=ayjJks20aY8CYa2cXlv2jTbgWrfPmo+PJJJuKpm/4TTmtvrrVmADFvO+o0RRqqyLra6CFTGjgJI34sNDmWEQJipTrY+3aa0dAxE/XUrYqYRtYteLpkjZn2BK8tjnQ7rZISAhUKyoUNbJAJeSqpvrVeDHoxgwnkfwTeyWnCGTGnQrLRsXI2hUPF4PdHFXqc38rE0ceITc62jT/ZlHhwnfLIXxTCLyycrt53tTTX2BsTXwKsyYkNDDGgiEieYJXTX1v08m5LcHvFb+nrGgvUx486SQpCn4MQIxkhLo1uhzYizvwPsFQS5aqsUffpihratNXuZAsueSsqyfo7R5lPSgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 13:49:38 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%4]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 13:49:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] frr: support more arches
Date: Wed,  8 Mar 2023 21:49:23 +0800
Message-Id: <20230308134923.783985-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308134923.783985-1-yi.zhao@windriver.com>
References: <20230308134923.783985-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 06930053-11e6-4490-f03c-08db1fdbf55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TfUmgWiSct9n463H+Y1rqNpcLCRUDhnJ2cNuEb2lULesV/eQTu32iYT4ADg9Vv/pmJp0JCvCGmkF5HDcyv640H/hnl7WoDc5jCRvwfpiHA3T6+mM09sRlN2BL7vKg3eNSSBzzc4C/3mrxwhqVBZdzWfMhHnkLwR1vBHz8ERzygDP/GDYdU2G/g+85eXXElbtOBa3rSa0ZzXCaD0z6Q9MV4VDVPHL+TfLyZ7M5kLyxJ9TCW9EzDRNqwumd0G0UdH1CxIhpETv7X0to8ftmHhWj2cEpAilrkqdmMOa66tcmLMAE7aWDkBRkprvk/+/j9nk3osohJWgEkD9k4HZwVkuLvq9lbk0AudvJGKNywq4F62gpqZy0F0YGbPuerksTQQ+8sACiQFgLYByh8T6jOROn5bT5n48SeuDsoJQ6nhWZpJCLZTZsXeeEEm1gHyxa5Lppu1H0fvqHqS6CsH0fMY5LZiOxvkcw3eQm5rubLwz7tYB/jExbnUz9BDWEj0myzRfUydmlg5q+c419SZFCpMnwzpTui1RbNQxGMv8y2CpulViMMtYOXs1x9yOj8LNMb4WzPow3cCwhw5uHXEF8OdRiypA6sdgEnXhlAGdKODxJ5V65PmXQdd8k3O3klVNOTseok7gJUiLizzNGQsLxOMoui2Lf/cgRIjWalg08MMyEMDWOoLc0e0YMyGSXaTuG7tq0hLPFbKJl4OlGKlqRhAYcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(39850400004)(346002)(136003)(451199018)(66476007)(66946007)(66556008)(8676002)(44832011)(6916009)(2616005)(6666004)(6486002)(36756003)(5660300002)(52116002)(83380400001)(316002)(86362001)(8936002)(38100700002)(478600001)(38350700002)(186003)(2906002)(41300700001)(26005)(1076003)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3CC+19M4H0h5skxTQpiBOxz6+RpvfB9PX/SFaVHInWXsp1YqCfFW3gSOW/Su?=
 =?us-ascii?Q?sZ7D0Oz1QZ89U18HG6s40yuydi6Y95f/Q1Rm1XO51AGpEMf7wol79BsVZl+D?=
 =?us-ascii?Q?6HH15CmXaLZquWHOO8Q8+HufeUICRaLz4+DO5nm/zaGYDjsDno2BI8mT7KbO?=
 =?us-ascii?Q?MND98M9T0TlpdRqWBykgjgL4mzbgYm2Ms7Agn1TjUXrcIlWB5rVTSJ8jOxSy?=
 =?us-ascii?Q?a8UE5N1P3rA53Z07MQJttZbj8VFkqRIm/36aOYDQ5a5cWwKlB1M6Q6aUo4Y8?=
 =?us-ascii?Q?uENlePphSHygEAsWDZMPyvMoujExbFQpC7ehE2Ssd1YHiqueIkWMaJ+Jdf27?=
 =?us-ascii?Q?sKD0q4QeUx1rNKT1YBFKc8IQoHTutQLkxd+Vw5ZQh+55oVXB9q8agmY+buRV?=
 =?us-ascii?Q?ZX56fjbwDifep2c0/jlZ6A/wFX+2ddH+SfJQsBFEkFLIQqinys7EFn4p7BOy?=
 =?us-ascii?Q?urcCqopd3mpTf5dIhx2EhVaZPP0Gro4VUUzfBck95iA2S9VuhipTxNO0b6CF?=
 =?us-ascii?Q?d+V/QkTSWWLIVtC5R7O/JiJlHPhNQVgxkqEibHZzy4QF/ivbMstaXkHsK7ba?=
 =?us-ascii?Q?2xfg+BQ9GvBVwG+csupYyY4P4UAsEE+Io3OJdP2xdzdbHZja75XIHtrJ7DLz?=
 =?us-ascii?Q?XjDvaRHgpPvV5RYn7ISfPe1uA9GhRlnRcsw5BIUtLgaRjjCkhHdPUefNsDI6?=
 =?us-ascii?Q?b3gK7cAu3ui5N4iNDF0G8lzfCISsVadE6lmjhfB1zjaA9ueQ4jtrN7vlq/S1?=
 =?us-ascii?Q?1tjvC9bc8yh1rLNAtjYVuBAudjtGJuz/l9AGUr0bjKYon3mBa3GbXknPdlYU?=
 =?us-ascii?Q?SUEwSNHMGHgw6H1kul4p5vK4acY1kj3k3mDgrCu2GoWIFsq4kZuxHo0bocEj?=
 =?us-ascii?Q?J/MASNilDpusMlGnt/jxliQnBZkTpEae+Kzw5SMv0DrnQBxBKZt8oxvS62AF?=
 =?us-ascii?Q?z92+3DX7IB65kK403ZSlgsoC1w9hK3F8m0Q9wRMzU4U839U/KGY3nU9vE4fb?=
 =?us-ascii?Q?ncZEZclboxdLYzpDJWy8FSbEOxytDOk3Run17q+ZgTrusoaNdcwstdQqy5EO?=
 =?us-ascii?Q?vHXsLj8DchNnLITDeaQInHTWqZkSOFei3C/u/o19E3eSMlyS+OEyq3ENYxJq?=
 =?us-ascii?Q?c9wBxgyUqDexQ31HSpIJG6283mccIV/c97g8U7leMghqEiKYGJra6uwtmhZU?=
 =?us-ascii?Q?0OrukgmvIZCOUoXgkWr7nTBFrbq6T1lw9VCM7SZWtn1LDtIsIPpTmXXzuSYZ?=
 =?us-ascii?Q?2ekUhccBwWK+20CuoTISUx2OFkNaSvN3UXNqX6fR7oocjLvIno69RWwJQ5za?=
 =?us-ascii?Q?4ya8OKUH5Myp7ZH26R0GiYOmw7h0jetpS41iTcZgBZtbc7nPJN3nOssoezqE?=
 =?us-ascii?Q?ObX9eM1lFiXkHIbFyiCM0LtmsUISZSLnf9x7/oESNUgj9KgD/stSH66At/Gh?=
 =?us-ascii?Q?gPtUOVAH2yikWaAGpzVTMLnMk2EKs2zvSy8th8t2yfcFUms56BH4A5TqszJd?=
 =?us-ascii?Q?CLSHm4MNEr+yx1WFJqdWTiO7HJWsHifKo6A846LJFL2bS2pfkO97bcQoBdzK?=
 =?us-ascii?Q?6YzVP+tUpULi4X3aiJnh6bofAmyf8xoqdYXnXb38ypsjdQg3pHMx/0WE2KSv?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06930053-11e6-4490-f03c-08db1fdbf55f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 13:49:38.1341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fTTUfkkooOb94fLl3f07ELf6ISC0E4rBdMZGbffqYpzpTGQUGRkUS7EPPjnWtQ+IWhFXvrCseHwEzzGp3jI8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-Proofpoint-GUID: JQlUm8XuGvSCefHg9nqWHw_0bY_2NdcN
X-Proofpoint-ORIG-GUID: JQlUm8XuGvSCefHg9nqWHw_0bY_2NdcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_08,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=546
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101423

Now frr can support more arches as libyang can be built on all arches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr_8.4.2.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
index e5082e2e6..d01d895a8 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.2.bb
@@ -20,15 +20,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-# Due to libyang not supported on these arches:
-COMPATIBLE_HOST:riscv32 = "null"
-COMPATIBLE_HOST:riscv64 = "null"
-COMPATIBLE_HOST:armv5 = "null"
-
-# Fail to build on mips64 with error:
-# Error: PC-relative reference to a different section
-COMPATIBLE_HOST:mips64 = "null"
-
 inherit autotools-brokensep python3native pkgconfig useradd systemd
 
 DEPENDS:class-native = "bison-native elfutils-native"
@@ -71,6 +62,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 LDFLAGS:append:mips = " -latomic"
 LDFLAGS:append:mipsel = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
+LDFLAGS:append:riscv32 = " -latomic"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
-- 
2.25.1


