Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF272C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:51:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.10263.1651240297088937694
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rDaNuVWm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2118c21e25=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23TCf0bQ021289
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:51:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Yz8uqB9cPciGjUGOxw2vcRzCQ2CeR/jYyigV7DX3oW4=;
 b=rDaNuVWmzQPR4v9i+EW8fLhtv+qiftT5p9c3fXKSrhY3PcQKHLOdq9fst211hScl5AMg
 2hTRKeWYnz1SJkt+Pvu23Ee68+0xOU/nTdLKyhVH5/8IYAYEcLzVq4tiZdLOtkR3nsMQ
 U03Lfu63ONzpb3CAuthfLdJbRzODaBgBWUiSxwzipf3WBcIg/NzIw93eL+qisaCakTXA
 bKBXKIpDDm+U/T/26ujVZAYZzbOUgGJunVjYr2gQiBCKIgTI1MPde4Srkzqbx1/5Z6uW
 7yPfYoEf/aUykQmB4e+LeRvMsnXvs39qTVkW1rXqWeytTDclUByTZNIhFBTltJY1tGgG pg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fps57t9bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Apr 2022 06:51:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrlcAC35dPqPFme+fRbj0BSwF4P8FWLGe7fivhm35AcyUCXpLxkPtjDpURM/b8DxBC5vOmdMzCIVsgnIY8f5XmGz0ptz+h8gP6Ol3J18Z2MYIqrVuq+nr4cWxEmReraczHrUavocS6KdEM/PyeqURgmuQ9Tc3m1YWVKzvKVODORl0QKPlw3uU0Ij7Z8/AESXnX/CuvOikFBer67LZerR+Yi+1XVf0iVPYap+OXseAgDTuM95mEGH6Otgp6bhZCo7FDVgRmM7qgbqJkBfGP3pcdF/ZygcSoWBFy87QNdUws2hlZMnzMU0l05qhyN9kZ3lbLLZCYsg+cRW4YOMqvoSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz8uqB9cPciGjUGOxw2vcRzCQ2CeR/jYyigV7DX3oW4=;
 b=WO46wyWeR+mZuvNxDJB/oKUYYHTObiAUwLN0jxW32YIjTXoupip/40ABxS7P9j6xLNUn3cVoNdwZwrUbXeKYb/xyj4PRjeioGbN5ntKqLtTE4r3Pw1qBS+5kYfHO+UIs0oBvKfBkXGQUFGGy4NGz0rA1sa7ndvy0SAelGAI53u4+1em5ufU6jIUoUSqCmYpRSU2U8/MtJQsF/yq1TyRfk/d6jBWHRYnIIw9dqbDZq6YWUB8tUdt15dnigEt1PUsA4Xs8tJCoufqODyLxxiPFfP5ePXZ119Wu9Sh3WasiIJEHatJE5ziEPb5Dq3urmacwNNtMvxVl1K4221e6Z5jW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 13:51:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903%4]) with mapi id 15.20.5186.023; Fri, 29 Apr 2022
 13:51:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: inherit autotools-brokensep instead of
 autotools
Date: Fri, 29 Apr 2022 21:51:10 +0800
Message-Id: <20220429135110.3924913-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:203:b0::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf8cdabf-fa63-421f-771f-08da29e75dc6
X-MS-TrafficTypeDiagnostic: MN2PR11MB4631:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4631B151069C96ED908E8ADEF9FC9@MN2PR11MB4631.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NGGPJBv7Ukg0aKrbh19QwEOWduB+yqC1U3oqVzV/lH+hQXbtKUrH1dZDdAjNpTzS5oYxRWakkfwG1tDf64Z1rX1LWTrKLVAeVj/w5ajrsQpwEMLJVkj3ysQVZlB3hhVv/gwso91x8QEgAig9mhqa5laNBeAPIG7cZfvRyW6TrmWS3/rpCHocpg7vRwkt/0zecGeMRj0dxndnZJos74ZjbmcWNwUxEPbUCK/mmwc+/kDK76U8NxcSg0DSY+xePnannxctyRMEtxBymkDfhL+hhJO2+lug400VVAXuoqefL8otdHmGJ+OFTfnHQQub0IUPw5UmgnPI6zFuilCLQmQGgCaNgSIYKDOdEEdeBJFMoBaOYWJZsmWFjniD89UwZh7qqmZqFGe41fFgRKByjGRn2JC76CSRaEYHkq7UmDBIMLUFrbASOqhrJu3PMoYaqt1Yd/xibOl6kmCet0q4hv+9U1CqfDqM1uj6xHdcxjrySea9lnTfcioRSBZdIT7sSSTKKVgxIKuvSGCsEa2QUP5mZhAbd1QQkyq55gNGf8tVZyExnQmapftwp29U6wB8RpyPBfWy9ZQ1Pjlb93Auy6hnrpG4QFxBM2Ed+GODc71J3TYT0+RtT7wxb03o4CgdcBlCsV/WxY5TzGSxri5R0IX6PzdfefEp09gfRYJzm1L0z+/9AoeTB3oaa8y951GEvXEX5iFmDWj8CeHbvvI6nJMr3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(6486002)(6506007)(8936002)(6512007)(26005)(2906002)(508600001)(6666004)(44832011)(52116002)(86362001)(38350700002)(38100700002)(186003)(83380400001)(2616005)(1076003)(66946007)(8676002)(6916009)(36756003)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/+vDAuXlhTaNGttzAnCmiogOqqzqtBcvhs6VDXU5R/oYc+vuTMru3inuq7o/?=
 =?us-ascii?Q?HsGbemDUg8OeUielhbMxQkEucMptYVCMr8Y1jf/cPTKwojUCOF5HcEyrYNwf?=
 =?us-ascii?Q?Q0MMNC0CCSuJyA1HMkdAf9L//pWa+wKTfb6ivBqdkVUdsgixLOYL1gqZB9kQ?=
 =?us-ascii?Q?21tsZOctBBO+2zT8EWfM8Lt2aBWuln4nTMJcZTpfWq7abQnYzDLmSlCK72i3?=
 =?us-ascii?Q?xd5mBa/w+fBJNDj8o1cCibHIUbdf1yuhhfOeNuHIl7BJtH7PmXkwLIdS/Xjt?=
 =?us-ascii?Q?yYltT1cpofqnwvOXHZ3+dn8oVRy6yUGCKxDScz1uwXXEWD7f95Dv557ZclGB?=
 =?us-ascii?Q?I7nc3aDyuefHlQl/KOqHGSMk2Nfyenjx8J40SzZR/sZp3qbgHAgJEbnf9ENf?=
 =?us-ascii?Q?OSY08Gi3dGDAh8tIsxfOR0PXb37M5TPVxq1KfaRGxw7N4b6zGzdQAeqtZuX3?=
 =?us-ascii?Q?3+QCDz5QVhMo4CqVep/+xUoaIDGuK/MCGHeUYCnKdxY+j6c60jVLYP1KpVM3?=
 =?us-ascii?Q?LHFclI0D3UoWVOFGCoKtKFV+ETfKEBwtz4s/zpjteNTE2KZDeqfeVmzSQ09N?=
 =?us-ascii?Q?e7aw4DyzTufTeUuX/OcjERikxLbKzO4ZHovyl1Um8D2aZ8SpP+WH9+2Ny1l4?=
 =?us-ascii?Q?fKGkPIc+5lVoRQacuOd/j2X+hJ02DJlJMIStttk4S3a3VnzlY9N9IpMIzh0w?=
 =?us-ascii?Q?xn0igd358t/v/ysmybFriiR/SWPwDqxwqjDCXLJg6/U2e24yipLXsGBtK8zW?=
 =?us-ascii?Q?pnKacHe+m63nd/inOEwuIux7gk4ey7CPXhpqq7LxiM/6A/hwHd83wW1wPSjV?=
 =?us-ascii?Q?UMLCIf/bSz8RC6wNFuVQ2+TSTruoNRAvy0RpYYCnGNTCOFfwjZJGUhHJZ9IL?=
 =?us-ascii?Q?5F58NrV5TcljgsS80KPYVPjxzdGCdYC16rsZThW+pJlk9nPaYDyR3BrqFmSS?=
 =?us-ascii?Q?qW/LdJ9kKsYWqYhxVBXtFqBBOwSwKyohUyGDWSY9RR1Q74DugTHrl8bqtyt7?=
 =?us-ascii?Q?cm1VMP6bdc3VOleEl2wwyx55ZZdQtEdxZcBTmdDvu9q2U/0zWy/xE8oRy0mQ?=
 =?us-ascii?Q?/BHdoqd7aY2Syln/wFn1+jHA/tafxFPpyKvY6kjE22POKQrQ9LBd5FRPqcWu?=
 =?us-ascii?Q?uUurNfO4RynSee+C4IGp1DNIx3C2S91Ut7P4OlL5qlhd2EdCqGKlabELcuwk?=
 =?us-ascii?Q?2qOlwHmc2obs7fGEGOFs9GHpBPpkAWJAUmKAqkVXIVhbndCjs1am06+4hQri?=
 =?us-ascii?Q?cq1Uc+8IAYb23Vgw0ZnPwcW3R7BTiFiAbWAqK9WhcjrrtxyYQkFg3lsn5Vg5?=
 =?us-ascii?Q?9eeiQWuoo351MDTt0i9ps7DJ+Ex4XMlTEd744I2Rx3tDXH8KpowzyzRDpalU?=
 =?us-ascii?Q?3ufcSZKUOhBwjDOznsqYpbHrsNZA+KHet9ooPh+1IXFuHjX5T/rUsW7ZzmIA?=
 =?us-ascii?Q?EKq/MpCePhPyJGQ4glmt7bWTyfHs1FjcP+8+lZfksU6c9E+b6qXyv/44du/q?=
 =?us-ascii?Q?5bBT/LCf6j+Ur+osKy/aincjn6yz6ip535i6O3v9mMAYPCNf0CFTMp7oBo3K?=
 =?us-ascii?Q?ng4KoDDgPcuICcepVML9A5DVV+mM8Q4MKd4m69UC3MxzE8Miiy2EuRrbdyMq?=
 =?us-ascii?Q?yhxMT9AfCgbSWhdljVrcfyQk4HyXw9jHuoWsBYvofz/blS6r1/1iU0ga6e1A?=
 =?us-ascii?Q?KvX3XyFOonhjHu5s2ih46tZz+vRCW6DGkOmk7GSLfYDZXGiwgwIhPIHasqI2?=
 =?us-ascii?Q?8ghy90C7nw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf8cdabf-fa63-421f-771f-08da29e75dc6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:51:31.5223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P3aTpcVgK0xNUowtPz0wAE3V6gvVAP7pob7r4r+F2szknnBI4sOaKdLTgV1x9bbT7R6hEvzFEulxttomqekFxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
X-Proofpoint-GUID: S_tEtgyI0w-DZ6LfBIFJgAzYawtmlOiX
X-Proofpoint-ORIG-GUID: S_tEtgyI0w-DZ6LfBIFJgAzYawtmlOiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_06,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=777 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204290079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 13:51:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96856

There is a parallel build error in separate build directory:

| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/frr/8.2.2-r0/recipe-sysroot-native/usr/lib/clippy ../git/python/clidef.py -o isisd/isis_cli_clippy.c ../git/isisd/isis_cli.c
| Traceback (most recent call last):
|   File "../git/python/clidef.py", line 466, in <module>
|     clippy.wrdiff(
|   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/frr/8.2.2-r0/git/python/clippy/__init__.py", line 78, in wrdiff
|     with open(newname, "w") as out:
| FileNotFoundError: [Errno 2] No such file or directory: 'isisd/isis_cli_clippy.c.new-372541'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/frr/8.2.2-r0/build'
| make[1]: *** [Makefile:17386: isisd/isis_cli_clippy.c] Error 1

This is beacuse clidef.py only creates new file but doesn't check if
parent directory exists. Inherit autotools-brokensep can fix this issue
as these parent directories always exist in source directory.

Also set ac_cv_path_PERL to '/usr/bin/env perl' to avoid path too long.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index b6e180e2c..05195a3f6 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -26,7 +26,7 @@ COMPATIBLE_HOST:armv5 = "null"
 # Error: PC-relative reference to a different section
 COMPATIBLE_HOST:mips64 = "null"
 
-inherit autotools python3native pkgconfig useradd systemd
+inherit autotools-brokensep python3native pkgconfig useradd systemd
 
 DEPENDS:class-native = "bison-native elfutils-native"
 DEPENDS:class-target = "bison-native json-c readline c-ares libyang frr-native"
@@ -63,6 +63,8 @@ EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
                              --with-clippy=${RECIPE_SYSROOT_NATIVE}/usr/lib/clippy \
                             "
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+
 LDFLAGS:append:mips = " -latomic"
 LDFLAGS:append:mipsel = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
@@ -77,7 +79,7 @@ do_compile:class-native () {
 
 do_install:class-native () {
     install -d ${D}${libdir}
-    install -m 755 ${WORKDIR}/build/lib/clippy ${D}${libdir}/clippy
+    install -m 755 ${S}/lib/clippy ${D}${libdir}/clippy
 }
 
 do_install:append:class-target () {
-- 
2.25.1


