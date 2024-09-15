Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC64C35FE8
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 12:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.113927.1726404740741167398
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FCYMsd018016
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1s1y6-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeNuqf7qeVWWFGQAQzur1ObmxxOV8sQi7Du1rvCToQcF6YwKULIBBvlYedkHtmjzeWD89GQHisvzRzR8jaXOyG9T67q/gFPSVPdXG3883aUfzLudlUpil6USUgAcXu4n1QNC3N91j+0i/WCjmJKdw/Yn52wAMPVVrUawIcCTi7Iv+Sy1cs5Zpw0D1G3Jv0t614gub9HExf0isfPBaK5zKXNvbbclwHZcI14XZuvLD0YhREvmgEFv6nOHGa69lu+DikQ71q+JdgHdCVik46MnF8GKF35GbID+7xoDE62pzWRPOQlfS3Etnw1DeFpLwAN2l3F/mL55RhqDBT3pUVcYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqbKIqYx/z3CY4yOZA7yd6xnI2X34RiMfwq4KifJR4o=;
 b=Bq7PdP3Fwox4xrSt7Xr0ExMpL7t1A6nV9G5sO2gRmSZYh7n9P+vk4zBrQY+iRDf2mBiGsHsvn8kAwOOhf1+LPdYzbrP090pHLJo4zoa16/porLZtkK8OySNBhQi0k5v/A1/Kn7fmfoCsaGQ88C12MXuWo8a5Z2YPBzoyhuSRVLDFX8YBD9gbLL+hZAdaZGy1VnEyWiGC4KcKsz2HOLTB6270Rma8MksW1EoS3/+cWqmGB3YfE1zRzMnrIb6XLWSKcj4MDzVWzlqLhB8cyzAjv7jkbh7OXB7za9CwkJDR7gf+3E/0be2xGAWjVctKlr9XmKiXWQsSpSGSz7Upv6zFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:52:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:52:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] debootstrap: upgrade 1.0.132 -> 1.0.137
Date: Sun, 15 Sep 2024 20:51:53 +0800
Message-Id: <20240915125153.2940806-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240915125153.2940806-1-yi.zhao@windriver.com>
References: <20240915125153.2940806-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b4743d-16ca-4567-1f68-08dcd58538df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z5Dmuj5SvACAvynydZxVf9Y10kaeptffBpwJImpK/Di59VHkOt9Ef5ABr1NB?=
 =?us-ascii?Q?gCnQMb9dWudIjWK/s8JFk/bx/IfGvOsxTLrJLBBQtffM0SqUd5zheBznjHyn?=
 =?us-ascii?Q?mmDlwEjG3j/rUS2dZ4YW3hS9zY30tJeEQajUqzTWgT/vkLdoXOqd1r6Hqfwu?=
 =?us-ascii?Q?lKhnkyU7lgfUnOAHqWM2QW8Q1gkna1BFr61nbPJ4SYwDLNdGINM/e+xcYMz2?=
 =?us-ascii?Q?Fq7/mCCNufdfxGQUgphiymKEykmuvaByocP5rzpc4zUCJWI9TRti6HivQPjM?=
 =?us-ascii?Q?6pgBSQAnX/FczoLHO4qHxeY7+P+LoT+jBiPx0VTBI1FKRTvCOapXMXTliTMr?=
 =?us-ascii?Q?gDryQCaYjA9KijmjN4ded4VSu9Cw/2unKC+LdORT0lrMNE5Hqb947D5xWVLZ?=
 =?us-ascii?Q?+5tdr0N/3TQddL04OU65c4Br3vP8J7kYqpEXkn/oEkAfSO6OHSbgYhvlsh50?=
 =?us-ascii?Q?MV0UlUdrn3NNTI6sFzlEPdyAWXJ92FOkyAJbISs1iZQVegMBGf6j7FBv5gR2?=
 =?us-ascii?Q?rx7+/03XSAHIVk3CcWvCWErZ6pRQlw9SExmcT9tmvTCdmiSfxWwBiOxHAViw?=
 =?us-ascii?Q?bw9vO4MHd+JpIsrTRAiBzmnffp4fcvzDSpIha+QiWJ2UTKmC9cXzD4qG/ko1?=
 =?us-ascii?Q?8Q82n+N1D5pOlElKwF6ZncN4aB4uyudpGKwYIaggOw5cT/fCYi83h1Qm8yCO?=
 =?us-ascii?Q?o7Gg7Pz43W7LFFx8UzLFR881ikYE8XsunNPuYwcHnfPzrY8FN4L+iQazMaZU?=
 =?us-ascii?Q?eBWv8uRIJhpLBYCuVMvOpvE3nd9IyiF6X+3UP9JbE8L43LzgYzLzx1rxM1l0?=
 =?us-ascii?Q?Z+WS0z16tvvon77KLeiNUhdqFYQj299WP2AU6/ABFpltA6kYBOdr/cYPQ5HM?=
 =?us-ascii?Q?cmnx9853tby2zxZbbbGqiaDhRY3gmMhIQ+6bAAV7zCdWhQ7Wr0Kh2/lI4ePZ?=
 =?us-ascii?Q?ElRzXfNAqOuHZtwVLi3wdRkoKCXMd40OuvrRpWhzChRjad0z6pbDb510dqNI?=
 =?us-ascii?Q?gU33lB7PZj+dXeEn5WXON2/NLJl4uxN3CcY0eI2XdvlOI/sPKu7of4+oPwOr?=
 =?us-ascii?Q?2dTEffzQHiOQB77bLCAFifTFjUjeymlgE4Hn0S/34xkMzhFIwaOcah0EVudr?=
 =?us-ascii?Q?VATzwE21Xwt7IA2atyJzlzr5xjZec3+I43qTAtOsl2GRL6uwQKSP+98gTUUr?=
 =?us-ascii?Q?Yjeen/YTPs/eeDJsEnVOLV+R3IVyvCwoWyFvIlSiYkXBJhS33N5ZPjn1xU9d?=
 =?us-ascii?Q?P2UO/K2mwhPE2MK4YUNzXQTNItMUMXPW+o2QAEMnWXvWSplyCdB1xasoOkAm?=
 =?us-ascii?Q?Hw8qCheVVGkEY6GET1vaaiIW6tbhh5hLqlgAfmypN9Uy3+6OopifFsG1kF71?=
 =?us-ascii?Q?wc2nRIaYBWJU+DnVtcsyX8IgeJdylTJpocYZ816OCORmi22rKzWbx0m8NK0+?=
 =?us-ascii?Q?ZDj1j8uQt94=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IfdKdPbH68Prc1c7G+h3BzmAf+7fvqYVVrHEBnJ8SUZoeWRWWrkA1nU8boTU?=
 =?us-ascii?Q?Afy+u9QkLiNevfi909Co7AtDHJuvC4O+4O4FWadH4uxC97kZwvu+0Aw31fwi?=
 =?us-ascii?Q?Gh2dUUHiCn0cJoGbzI+dM5D+3weXmPxKJRcUTb/4eGAcBX2WL4jgHUfKXsQW?=
 =?us-ascii?Q?6RkC20k59xLLa3uKX7cCa0K0BydPqbwS9FRa2cwcMh1zQMHF/DQrVF1uRZrZ?=
 =?us-ascii?Q?bgclVi3sYtPGp33sY0hZjBTIGivPiMdhoRyAaCV/c++upOiPlTKVBYU2Jxel?=
 =?us-ascii?Q?l7h1nu8F5JG+96+vWTsyB8FzEN3BCFvylNn4EkGOFlQZtiSuYNtQ8bCwqq64?=
 =?us-ascii?Q?+TmWUaEtpwu02/hAB76+ZHfVigtwRPJy9EtbYuHnmSWyFx7SjgrdvKNUOCMC?=
 =?us-ascii?Q?DeKCWAY5R33pDpO/nKL1nDEImtvN/C+eWZLbmQ5VB+HyAB+f1hcWoaCz5xM6?=
 =?us-ascii?Q?F12Id7DJkq7d3IWWXMrLkzYT9vGDRODjjHl9lRmyq/jcwGQugbyqAeh3vW70?=
 =?us-ascii?Q?9e0LezrIpaq/+6UDbKRdI+P457v+WHTAYeVKX1JxKH1vJCeYUJrc1elFIZbL?=
 =?us-ascii?Q?XKArIaw2fYxvYvrVF1cX/9KgXaDLZxvxylsK7NUHoHBYPoQzVcR9IJALGxWX?=
 =?us-ascii?Q?Kki5i3GaeZmWY20GD5yXVrdNyTGSlxJNf72d7QKnCrKyhRnUY8qTTVX6k6o6?=
 =?us-ascii?Q?qrxyfvxamEFOHcKEkatbZ+roy35slQuCfb6+FZdHYOnygOdRoWymMRING1rs?=
 =?us-ascii?Q?xUKD4YjKQh15PQW0cM/n8aDbtu2ut6kBVNPL8zLSFcUJKFCgxXO3vFVmZ3KU?=
 =?us-ascii?Q?9L/sL5+ItxHdK1xnnuSkB7nVaV6bFNYV8OIyJqrQaHZQAu/vG8jd05gECIUR?=
 =?us-ascii?Q?HWY6X+dgz2tu/d+hmuYExqN4x08zFZkB7YpAOJgFjP8em/XF2rrCk6o0kz8T?=
 =?us-ascii?Q?iFRfFQgQhQoGGYI+NOk+hM0g6StHU3oDal/6E3VKb1x82hZ7e4gNq61ftpby?=
 =?us-ascii?Q?sG8XDDrWul8DJhdMdk85XYNp8m9pJm11ywvcxznHXx7Wcet1Q2Ha/ogn/tJz?=
 =?us-ascii?Q?wJojDxdmgpt6Z3Q8d8Mm0/wlP3II1GAZQMAAfdoZZLvzPkA7bcjtUWPdM6s9?=
 =?us-ascii?Q?PBSjOXk4lZXtkbBqSb13JYh1SkfiLLmSeOF4aoByJU4//p5goNfGLedwAXw+?=
 =?us-ascii?Q?F7jCkuCRcMK60HzNkEhpv2D/ux/ThqlEYR4sJeryUHt3Lc6C8lo27yX/SbfX?=
 =?us-ascii?Q?mQtreFyczdb/GQ4RNf1+JRay7AkzV/ALh8Xv+b44kfXEjuadI8ZgWXaop8fY?=
 =?us-ascii?Q?pmSO/9QQkDPwivupacmLkNhnfm7PHaVG8XAPj84GBhhCYclJkdbG32Pm2DRY?=
 =?us-ascii?Q?Y052j8VB7rU8TxchC9yhSWl1DnmdbiIVGhrTgPmTLBxsC68M1xYN3Lh7eqlj?=
 =?us-ascii?Q?ck1/JoMhx9eTFKkmV7jZLlvoAp2wgHqTcF9kqJFZ+77PLaqjwuKYFHH9G4xb?=
 =?us-ascii?Q?GNysRhqtaJYCoDxKDZhOpd7Y2717MWdXuRfQAW6/J1foLHPvqTepGmb4xTbU?=
 =?us-ascii?Q?WHz9VguKzA69jZdYoMi5/GvdEH3m/SwSaYliNv2o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b4743d-16ca-4567-1f68-08dcd58538df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:52:14.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6HavN02gfuSLVRDXH9Yizhci3tp6oqMDU2D5vL143kxSIt+eEVdlN223OyHwfRAHw0ZIEoQJ/S21o9NNbbFVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66e6d883 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=3cwXC-BSH5rauHzdvMsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -LcYXP5SHLL5kBCCwAaDz2ZBqjt9BNHX
X-Proofpoint-ORIG-GUID: -LcYXP5SHLL5kBCCwAaDz2ZBqjt9BNHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_04,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409150098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112298

ChangeLog:
https://salsa.debian.org/installer-team/debootstrap/-/blob/1.0.137/debian/changelog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...rt-to-override-usr-sbin-and-usr-share.patch | 18 ++++++++----------
 ...support-to-override-usr-bin-arch-test.patch | 12 ++++++------
 ...o-not-hardcode-the-full-path-of-dpkg.patch} |  8 ++++----
 ...strap_1.0.132.bb => debootstrap_1.0.137.bb} |  6 +++---
 4 files changed, 21 insertions(+), 23 deletions(-)
 rename meta-oe/recipes-devtools/debootstrap/debootstrap/{0001-do-not-hardcode-the-full-path-of-dpkg.patch => 0003-do-not-hardcode-the-full-path-of-dpkg.patch} (87%)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.132.bb => debootstrap_1.0.137.bb} (71%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
index 12dd23810..faa66e026 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
@@ -1,20 +1,20 @@
-From 87d0174e8d56e7458dc94f05f82ab7a67a5cf7d0 Mon Sep 17 00:00:00 2001
+From 6c8b0a3f9c09a7a135d95ff18038bcba22e87b86 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:06:05 +0800
-Subject: [PATCH 1/2] support to override /usr/sbin and /usr/share
+Subject: [PATCH] support to override /usr/sbin and /usr/share
 
 Upstream-Status: Submitted [https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
+ Makefile | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 8516803..a2d8c00 100644
+index 21a9a39..649f465 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -5,14 +5,16 @@ all:
+@@ -5,13 +5,15 @@ all:
  
  clean:
  
@@ -28,14 +28,12 @@ index 8516803..a2d8c00 100644
 +	mkdir -p $(DESTDIR)$(sbindir)
  
  	cp -a scripts/* $(DSDIR)/scripts/
- 	install -o root -g root -m 0644 functions $(DSDIR)/
+ 	install -m 0644 functions $(DSDIR)/
  
 -	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)/usr/sbin/debootstrap
--	chown root:root $(DESTDIR)/usr/sbin/debootstrap
 -	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
 +	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)$(sbindir)/debootstrap
-+	chown root:root $(DESTDIR)$(sbindir)/debootstrap
 +	chmod 0755 $(DESTDIR)$(sbindir)/debootstrap
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
index 69329df4e..5de65779d 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-override-usr-bin-arch-test.patch
@@ -1,7 +1,7 @@
-From f0420b201f2fb5286ccf5657faa6b38cd2680e10 Mon Sep 17 00:00:00 2001
+From 3fee46c7e50f432fbd5c97c60b918d71c91f1adc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:08:06 +0800
-Subject: [PATCH 2/2] support to override /usr/bin/arch-test
+Subject: [PATCH] support to override /usr/bin/arch-test
 
 Upstream-Status: Submitted [https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/55]
 
@@ -11,12 +11,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/debootstrap b/debootstrap
-index 9b9e58d..a3cf3af 100755
+index 552c8d6..11a9465 100755
 --- a/debootstrap
 +++ b/debootstrap
 @@ -51,6 +51,10 @@ INRELEASE_PATH=""
+ 
  DEF_MIRROR="http://deb.debian.org/debian"
- DEF_HTTPS_MIRROR="https://deb.debian.org/debian"
  
 +if [ -z "$ARCH_TEST" ]; then
 +	ARCH_TEST="/usr/bin/arch-test"
@@ -25,7 +25,7 @@ index 9b9e58d..a3cf3af 100755
  # set $CONTAINER
  detect_container
  
-@@ -645,12 +649,12 @@ fi
+@@ -661,12 +665,12 @@ fi
  
  ###########################################################################
  
@@ -43,5 +43,5 @@ index 9b9e58d..a3cf3af 100755
  		ret=3
  	fi
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
similarity index 87%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch
rename to meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
index 2a5f23316..5cd1ce88a 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode-the-full-path-of-dpkg.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
@@ -1,4 +1,4 @@
-From e735fb23f46f0c3c7a1144ba6b4050bfc0015a05 Mon Sep 17 00:00:00 2001
+From e92554e57b4aae242cb0416025883ccc2c539d2a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 2 Jun 2021 13:34:35 +0800
 Subject: [PATCH] do not hardcode the full path of dpkg
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debootstrap b/debootstrap
-index a3cf3af..5e96c3e 100755
+index 11a9465..17ab05a 100755
 --- a/debootstrap
 +++ b/debootstrap
-@@ -538,7 +538,7 @@ fi
+@@ -551,7 +551,7 @@ fi
  
  if in_path dpkg && \
       dpkg --print-architecture >/dev/null 2>&1; then
@@ -29,5 +29,5 @@ index a3cf3af..5e96c3e 100755
       udpkg --print-architecture >/dev/null 2>&1; then
  	HOST_ARCH=$(/usr/bin/udpkg --print-architecture)
 -- 
-2.27.0
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
similarity index 71%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
index c28a51749..d4783b354 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
@@ -2,16 +2,16 @@ SUMMARY = "Install a Debian system into a subdirectory"
 HOMEPAGE = "https://wiki.debian.org/Debootstrap"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=1e68ced6e1689d4cd9dac75ff5225608"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7b45429ef05610abf91ac199fdb3a6e"
 
 SRC_URI  = "\
     ${DEBIAN_MIRROR}/main/d/debootstrap/debootstrap_${PV}.tar.gz \
     file://0001-support-to-override-usr-sbin-and-usr-share.patch \
     file://0002-support-to-override-usr-bin-arch-test.patch \
-    file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
+    file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "d963a465314ac0e8fd5392573def042e6663e8edf3d08ace4bbd0d27ee8431f7"
+SRC_URI[sha256sum] = "666927457ee4b0b3e68e55a0efbf3fb69189610b7abbd534017d7032cb3ae833"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.25.1


