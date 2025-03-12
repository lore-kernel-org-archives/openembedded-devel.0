Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2E4C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:52:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34651.1741779296158753907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 04:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516685422e=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C6viRw028315
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 04:34:56 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4rfu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 04:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkC1KHcyHdTGc4hhAWrrvZ06AMstaQmUXB9kuvSrx9r9Mc5Al0iojDfw6xrtXkFnEWE8ScDX5hYhdi3HKHBZLyw/TEzn3GvhOjbDXtq8fDehH2ErsZYnINOePxNPmgcn4IxFpdumJCxS1y2MYyG/4mlqEdu4Qbj3jgxIIhQEXWYdngQ3pBhFyP/46vFNce0gDcTTV454F9Xw4J9zXux114ILRFPwJMp8up8NQIV1M/xEPj/6BUUtGOxQZd9CCHX4ppKZNShlXapb9g4MlaAyngZACUaCf0blUtmQPGPwOcdSnMZGOBUjloVTzzRN0TbwZIEdRRdmXz+V4cIzM2LOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiCMuSSBtUg9uRRtFUQHwDyeQkl1+SFFSimo4v1fVxQ=;
 b=fQmZdGrQjHxnfJodga7sk/A/V42FqZpZC1UgCZv9wben+E8sKcozo0/EFIOE6GusDTt50WJtHsPd3lTYCbqZbrSjVRCDBp4GO/CTM/nROwZ4WMGWhRQF2K6Z2PQhuXyZPgXtfoKuTImCYXju3BPdzZq+ITOivYhctfzIWkZ2SF9giAeA2+yGeb7repRCZlRC9oLrnen9yD2WR7et+/DL9nwUZaHX7S5QnBzgE+iitryYbqM1GLudkuDJ7oky97LU08eDs3IVqx6RDKi/7FonhTRHDRED22urTzi/dCRE3A9+YYFgnuuqT/PGtd8b+MYzgt7y1mYOHJKHuw6yOtaVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 11:34:53 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 11:34:53 +0000
From: libo.chen.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2] libgpiod: fix gpiod-cxx-test failed test case
Date: Wed, 12 Mar 2025 19:34:39 +0800
Message-Id: <20250312113439.2956645-1-libo.chen.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|CY5PR11MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: f833d43a-89bf-4643-d18e-08dd6159e7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gIMbfbi1JhwQL4NNTU+aDWuEwgYzISf9/tWY09hS8PqpGt16+k4cwgIRRWvT?=
 =?us-ascii?Q?EVci8fQ4CcHhd4PcyPmNpOzaa8keJP4KOylybfygvF3yIVpsjMZCe6T6f6P+?=
 =?us-ascii?Q?exgk8qKYHGj1fXWVWjzdEnoqsKC2mgNaRxAsUt3RtD0pIldMTbUGTNDr/AwP?=
 =?us-ascii?Q?KWupqRAWOP6FZxBrMktpXD/O8oEonc/CILjGTtZvdRUV9s83k6M3+Y292oTZ?=
 =?us-ascii?Q?WsC3+2XPFikLLv6WRXImtszE/QY03KK06FoS7IJlBqphnq9Z+qkhANE+xGvW?=
 =?us-ascii?Q?lbQ7+vMbdLR8wxGTKwB/ux54gD1yS36M647hQihLMSjk9Fs2rLnjHGVVbj4H?=
 =?us-ascii?Q?EDvfPSjoH5VMTymOQR4QTdSH6eHwtCIejnqjSQ4W5f/6QGy3pNDkpN/pIsYv?=
 =?us-ascii?Q?zAOEYV64D/GnJcgixZtO3yY6xm8uqKW4Ucytxn0VX6rrz/CArATJHQ1Ilm4I?=
 =?us-ascii?Q?jUfTRupq3R4IZD50IQ95pLxJtR0sZF1MsNz/sRml9PcNiGbbS4BX+wxO5tZo?=
 =?us-ascii?Q?fwdy46C0ihORr0X+rUaaX7U+5Ig5oElb1h2N3ZNODwb/ZRWdmzhTwbkl4bAI?=
 =?us-ascii?Q?daXaKkksUASe8gkaW5S4hhy/OBxum9eqiBoKNxcAq/0VgWTU6m5AgmNfSt7b?=
 =?us-ascii?Q?zZS0yxTKcnTbKiV+prsfueqCdSISTYYtWh+kQ2jz2eYoqQGbDQSoBhfOvUNf?=
 =?us-ascii?Q?K8dxxfJrhGb4iPBqqm6q+S1yQLXTkaZ+C4kh8Frvn4bMtGtUJi+Q0FRjBsWV?=
 =?us-ascii?Q?oOj8jIUoo1ZTcfu55zhVv1G8tju3eXfQr6N3B52LejKUVk570EPA4IP7yQAx?=
 =?us-ascii?Q?CrhwD0uoOaIK0lhTBMUUmWGjpvKt/dsAB15Q5XCYvvTXG4xm5kDnHwyY94Xx?=
 =?us-ascii?Q?wbIsYeAx8LzdxVQQ1Xvk/hyztZAH1l1W+ut9+vgiji11dq/aP0Uv/vtPuy0z?=
 =?us-ascii?Q?w68gE25R2lG2VJG4ytAiV92Z3iPfvbs/h+GSNo72UVaQQIcQLTP1vHqm5CXP?=
 =?us-ascii?Q?0VArHakxtrqRXUHE4MvQSprxvC8BebCyU0tx8YJLtUvedp5ybII58Acfz5AW?=
 =?us-ascii?Q?pFM9VemZHc+jX9pZnxnN2uycaHFfszFFbP0RFMNUzfaLy6/gvixipkw0yOg/?=
 =?us-ascii?Q?Sm8+yzZganAwWmrrEa4JWu5hamEOyZ5eASuKcfMRgVghuK+F/ovpKcMU1KOt?=
 =?us-ascii?Q?dGMeUTWZEXhHJt0DValEwIYw/KnZW68+T1s/ixI15lXVdnvsRPDyZyhvOwjR?=
 =?us-ascii?Q?1bIcLkcMqsTZf4dYmBQdZEojCl7HCKLCyI+fFx0hvy+447Msw8PkvVf7j3hn?=
 =?us-ascii?Q?ZrxZYfpp/xpt4ytWnZ0EAM6Hj+EDUWhXg3ijeGDkw8FVUovFUf1ZjTM1Jqnz?=
 =?us-ascii?Q?xrX32sy9KDCDiRRLu+3ANWR3ZJgGQQ90pqZnYEZnvIoU0piIOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?owbZwSY2iUzQREc01NMLG7iyshY3oDiwu9qRsX5gHG5EaKQUx8Kkn8SlQ16L?=
 =?us-ascii?Q?Bv0g75s1dNh8YteZE0pM1XEcrgNC2c6p+R0dCQ7SyISSWZgFczZIvLcn2G0z?=
 =?us-ascii?Q?ewbI1bJBPi81OwH6U5CCn6TQbTp6D5oUlOhU1Fs3qdakbEOjGm+IzH9F+FDx?=
 =?us-ascii?Q?FmnD/BCT/1O9ov3z3/+3d0T8per74INYT9Tk74GR067QeKw+BD8MM3gVh5s2?=
 =?us-ascii?Q?roGOOoUxI2tc2kpKQuhqWawIKnMb8xX7+IUjByqUqOTSndr84yo+hpB1kDMd?=
 =?us-ascii?Q?VNiS0XahQmVliah/9PjMEWlvh7gccd8VW4J30+8dfYnuyAkpiYiBLPQ+isTl?=
 =?us-ascii?Q?xsVYHVAIiyTNqDiKhvB2KFYbS/os8Z6d48JEhoOTYuYgQA/RNk3XHDgkEKKW?=
 =?us-ascii?Q?5jn/aK61isdv+CUMikNED8Ix4U1gnNIH3BG3YUVTaRDe4nKP3WN1y2OFhtDP?=
 =?us-ascii?Q?zO+FDv0ocxXnGzjwW04Sbi6fl3aTbWycsMB8JHobzQdd0HCtSbK7ok+16+Dw?=
 =?us-ascii?Q?HNfWM1gefcqBGWHmZOJ2G69wZ3AJPBkadpZjHpxTpiOYlnvmPvMSP2JbYPlJ?=
 =?us-ascii?Q?Q6fNU/nTMYO848fwDchk3tb/mbhkKo9kR1T0RnoqpGQNHagg6m5pu15+cxh7?=
 =?us-ascii?Q?G0sb+cOJ1LRBqL271sXIh01pgVVuI+9hOGR/jAJeJBHsKS0GhhVdpBxE79l2?=
 =?us-ascii?Q?J+g3/oe8VhHbCoiM1riTuyCDs+aB5Djmz4rVwo5PYz1/2M9s3TeCvegFUsfp?=
 =?us-ascii?Q?BhEwYGzjKACPmfDEDsIKjizSPNqdau0IwH/C/wtp9TyKre7UTrs97gxO7ujO?=
 =?us-ascii?Q?vM3UL12RnjAMzy2nwmNK6WP42Cc0FsIIatG0QDtQ9kivOUixsHFXIaSSCe3/?=
 =?us-ascii?Q?yPHxSX/pXA5TP1ZpnU39wpYtcIxiRt22sYwkL2EsRfPX9FEZsDfdsu1n+wUO?=
 =?us-ascii?Q?4GceThXo7s8CFRCBkw8MdtEsuCMahoSAski20eY+32yPh5hVFqUvVj10C4ko?=
 =?us-ascii?Q?UwHDLdtaKiGqNtG2aDSWn/rHoxYI65r/aZdzu6DnkwDvGELUgZIH+ee9v765?=
 =?us-ascii?Q?FvoEnmzmHD+opHrw6erCot17Chz/J8GUjtSsjt3KeWMpHpZGQHOdseGyR3rW?=
 =?us-ascii?Q?3r8fpiKeQ+TcAwa/RBXjQNMyPcPQUoDZQnfhjrcVBpNpda0/lgH24yd3KYdY?=
 =?us-ascii?Q?cd09pEZarRDS3QyZpMoCd84A0CSJlnJz47ts3S+GHsuRpV57a5bH+F5VXNOm?=
 =?us-ascii?Q?Jq5P3lF4DSlO4mGkWvARbOYTG7vbUQeBCSMd7Ktdz4GB7sB97UEDMh3XFL8a?=
 =?us-ascii?Q?hMdsQUTRziHENveaLiPAbTKNDWZ4ezDGmnxBUpbrPQjtWVJKhYbMpt8MoKes?=
 =?us-ascii?Q?OqW334MlpU5UK9dw0hGeZ3Y3wUTdVnOJNgSpx6D9cuipPHtRgcWzlSbFqAJq?=
 =?us-ascii?Q?r1CU1+r2Yrd0yk8Pn9pjlpCSo8dAQZv5gzTII0crc36YNLdXLSnq5J9WXQi8?=
 =?us-ascii?Q?sYXZiKD60X9NzvqU2se19yxXs99Uvby47xLFjrCDedJI3sGISav8pfIQ5d8I?=
 =?us-ascii?Q?TLpOQuZeauPPWCeVPVnpqrdAR9emRCTVVMR1ebNNdRm0OIawwul1oukvKeoK?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f833d43a-89bf-4643-d18e-08dd6159e7ff
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 11:34:53.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu8+jb4Ye791cVgXgp6NOOc4V+sJ3RPk8IRnpuA+yKP4OnhWxlG+yg2C2cwJ+MEQcg5UAy9TvI+JW7ZMrG/l02+kY35g7wD5Xr+4bHJWO7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6138
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d1715f cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=8-fp0lg8t2R_pjxA5IUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-ORIG-GUID: -KkP6OWkegBtzL_uuAELDSlMobuLELSt
X-Proofpoint-GUID: -KkP6OWkegBtzL_uuAELDSlMobuLELSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120080
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 13:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115923

From: Libo Chen <libo.chen.cn@windriver.com>

Patch from:
https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3e224d885b1de54fe5510b9c5e7296260a1a4507

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 ...ts-set-direction-when-reconfiguring-.patch | 38 +++++++++++++++++++
 .../libgpiod/libgpiod_2.1.2.bb                |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch
new file mode 100644
index 0000000000..f8b94f0b99
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch
@@ -0,0 +1,38 @@
+From 8c7126b7b5dee0ed5433cf9265ccc79095d53939 Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+Date: Mon, 8 Jul 2024 11:48:27 +0200
+Subject: [PATCH] bindings: cxx: tests: set direction when reconfiguring lines
+
+Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
+without direction") made the direction setting mandatory for line config
+passed to the kernel when reconfiguring requested lines. Fix the C++ test
+case which doesn't do it and now fails due to the rest of the settings
+being ignored.
+
+Reviewed-by: Kent Gibson <warthog618@gmail.com>
+Link: https://lore.kernel.org/r/20240708094827.84986-1-brgl@bgdev.pl
+Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+Upstream-Status: Backport
+[https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3e224d885b1de54fe5510b9c5e7296260a1a4507]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ bindings/cxx/tests/tests-line-request.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
+index 9632ae0..6e29532 100644
+--- a/bindings/cxx/tests/tests-line-request.cpp
++++ b/bindings/cxx/tests/tests-line-request.cpp
+@@ -208,6 +208,7 @@ TEST_CASE("values can be read", "[line-request]")
+ 				.add_line_settings(
+ 					offs,
+ 					::gpiod::line_settings()
++						.set_direction(direction::INPUT)
+ 						.set_active_low(true))
+ 		);
+ 
+-- 
+2.44.1
+
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
index 6e4fbd2a3b..edbde0f7a7 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
+SRC_URI += "file://0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch"
+
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
 SRC_URI[sha256sum] = "7a148a5a7d1c97a1abb40474b9a392b6edd7a42fe077dfd7ff42cfba24308548"
-- 
2.34.1


