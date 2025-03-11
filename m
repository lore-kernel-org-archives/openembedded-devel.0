Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF27EC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 12:27:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5349.1741659905719833051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 19:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=516536aa6a=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B1x2no014505
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 19:25:05 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qjfme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 19:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uq1t6Cl69LiXYD4ruTReDhMQQxJFtsG/XEbJMBtOoHIDEbvCVBDM0ypp2opuhx6056zwLCUtULuEmhXK/2mLiKCm+R18gRyk4i49ct4J/+qFow6HmukEP9Rl4UsB98h8NNahV45RJOWPzVl7iZDlNt6SGSKQ867xkXIU0GWwo/HYGnUwFzk/NpFXvpehYNEhbK4yUDScG+lMzNJea8k5mMV6usTDkDDxBsT/jSVVGCHoGe9ZwL/gnyPsBMrvkENpMI/tQCjHwS6xNovRwtJXZL+OuMno1VRyfbsiLJ/MJEAj/5bs5pzyFiMBVMrLHoPdBPM3Q6wT61Vz2P8jenoesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMn7qDPkQb5htGSQD4WVtwYS3foyB/nuqampnT6kgu4=;
 b=rEO2spz8fI/zsjJITPD67QHCUoyM+FJFZToynOOhREKrXKEtIPQHVDshlu6ASXnJnkcQ5QaLWheItpqJcLbo2j42KLo03ntvXcyV96C6avqhA/HBDavUcz510rfE2yj9HrH+BvJyBevP7P8fsXj4p9ulmsKUcE4fr3cA3Wri7O9kI9gMiGZJi1csTMLedS0HkTE0Y2LgWfAtndfVMceS9rAQvJf0cyl/zxz8Ms6a8vAD41h5HKIIGCEL56u7NpTZQlMDxEoIL2XU7bhACIgocDLjcYRI1bJCR5IHqp6ci7sDtZ4MPLzrwuZJW6r3vDVPd+wUBbcVy/1arlK/ne/raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by SJ2PR11MB7669.namprd11.prod.outlook.com (2603:10b6:a03:4c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 02:25:00 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 02:25:00 +0000
From: libo.chen.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] libgpiod: fix gpiod-cxx-test failed test case
Date: Tue, 11 Mar 2025 10:24:45 +0800
Message-Id: <20250311022445.2203047-1-libo.chen.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:3:18::22) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|SJ2PR11MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4416b0-c351-4473-8a30-08dd6043ec2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zf2uWnOgwyd4+3VHJwCugqHrok8Gus5PNrjVaFI+WYvl76bC1wvdBslpJOVN?=
 =?us-ascii?Q?mG1TW6XDZPjvTJkdR//HC+qlVL9OY/kq5JeRVimUrXCJOjpBTbTHuAGT6eSc?=
 =?us-ascii?Q?y142PsBtqLqhPDrh67cXiPZSmOneAOfrQoGZj0STAQiXk1mwzY+f63EcLmob?=
 =?us-ascii?Q?ush3CQkSOf0n4eKOb1Sdpb9Vhit7DlHyKhYrtnLB3MMX3hgX4vLzyzTFuuFX?=
 =?us-ascii?Q?EQtl86v1VE8N5+1wMZh2Mc3klfUcICNGPHp+QaFRoh14oZQkEWXwID1soq4L?=
 =?us-ascii?Q?IY9apCgZ/MvzGJMH3U/CRqmYu6K0oeLXXY6xxLvZnxeSynIUd554okSuIxA0?=
 =?us-ascii?Q?bZS+5s5woZMgdzIn4g+/j+XPy3zCAVZJxO6G9BPuv01gOnRKziytxj9SYhig?=
 =?us-ascii?Q?n+Eez5BVvP7gt8OS1slyBn0d3BJyybg7Hz2KEgUp5+3i7M+x6qNm5djlVLT7?=
 =?us-ascii?Q?HhIIAae3ewjjeuCAIHqOuJXBBIPmBi+WOwaIzAvWeRkFTljXQ8whycBbUkTl?=
 =?us-ascii?Q?oO6jSRhkmpgA9zubcy/WPOGWCv8Mwtc0ZSkS3i2/HoPzAk/nMIewOS3UK2/I?=
 =?us-ascii?Q?s3WxKQKhR3K1NiQ/HSnGQTOmSmXkUN2T5bD5YTw1pmSnYAclBUncJXZE3OV9?=
 =?us-ascii?Q?J9QFDW2OYfffYnxrAaULWeyM9LcV8CphckeTnyLKhn8kI7fb2zakBKkvAcey?=
 =?us-ascii?Q?SbXNdp+QiHqo2hTmFMD0ggYT9fSLg4tJ7nyw2WUeT2g2bm1RaEhGP7STczZ4?=
 =?us-ascii?Q?OwPhWL6f9Mb7vjxU3EdFfMaMy1/sTtCYyTSh6EWQgq3rA8xlA0oagX3Uwxkp?=
 =?us-ascii?Q?TD3qNqIHOCIyFV01NPWBUl/bVMRV6kp4ar4QU34lixSJ+4re+k01UCszWaf6?=
 =?us-ascii?Q?AT/DTb8Gobmp51j9j9+AbHz1pd/f6ILBQHbOpp3OgG6awJpLvoBWUWw/U/rG?=
 =?us-ascii?Q?W9IUaRKGb7+TSogaUnJzHezCMHCXOMWH+nSahEZNWQRnStYIIh68Q/hlZkDF?=
 =?us-ascii?Q?VECIjxdKz+H4Jslv7PTMZT7k1OOjzGbH/f6lCP/xPoXDxhZZriiC9KkiCF/r?=
 =?us-ascii?Q?zxHvRlzNMUam65OX19rRU+KgGnS/k1aS4f8gb1v014vtsaSUWukZS5AEL2rp?=
 =?us-ascii?Q?UU6TzxJJdUb9oSBkvmTqralV/U968jaKMpkQRmcmkNzwYw4+9IZBScjyst+d?=
 =?us-ascii?Q?ftN4yYT5O5XTaNfQqza2MSZtOOxPPzXWYQSz+8uQAlWOnBvDyiFO7/nNCVmy?=
 =?us-ascii?Q?W4EM7lO5uwpnYTG2+VvUD6CAxBxjjNSh1AZxjewb32YgCO8FzQ9nIsHZ2IP2?=
 =?us-ascii?Q?6l0dPW1N8Y+IcGjKjlNSfbYZcJFyD+E9dOFYKTKscC2b6UjH3AC0WQ0Q6mPG?=
 =?us-ascii?Q?M6eqkSjTPhV/fW8SStMdpl3svkAcaSIu5XzF7HqkIrs0nYVWvA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xb86QBxkm8L4UfO0vIKJBmyWRqk4ClWk+GvBpQBFEhjqwyTyZvii00uYQqjX?=
 =?us-ascii?Q?/AiyAO19XiLBB+GtV+kgld1ykDH+Fvtu/3nBHT4VdofNYyP2n98eRk8Hasro?=
 =?us-ascii?Q?AuadjLlCbkJWSxWhWj3sVNtb+87xrjkmuqJvAUyj/2p1ANZtx62EDpzj1HSm?=
 =?us-ascii?Q?Yk7DtYN30R4YRdWZ0h0HhNrvkXw3FnQQzWbH1KEfQb9Bpv2jSALfvk1PuwGO?=
 =?us-ascii?Q?8D6ILKs2fmZ1MkQLRYnEWgxl1Xr6nTlT2Wb0Y8nYZXz0e5zK3FIBmFAUaP2Z?=
 =?us-ascii?Q?Y4X/aFs+KJA0j7f79sUxIzhJ+TpFDTao/kToybOwTm9aA4IkpvihI7GS/QhE?=
 =?us-ascii?Q?q2yrpc1EdKIB7jpMwgpOW7q6ovW8hSdotUUGws51WYo8GDxgsKMzwtdWUllZ?=
 =?us-ascii?Q?sj3b0bHc6JiGPLMIn9Rn4nXsMeygu1djM2LZEst/YZOSP5FVR4NvbuME7jQo?=
 =?us-ascii?Q?ztQnsdYrmdDC+xyenZr2yzues0jl/2KZjumUCESxpn7YhHIqOMo7V/vQV9Tl?=
 =?us-ascii?Q?LAo0ryeR8au4apSWE/LUPibiLIBcIwfwiX8sZx/KNKGGDr3HvWG1MPb5/HSm?=
 =?us-ascii?Q?jlGMMJBh9dkGwlymtjrGZtymfuTQRCFPrddYaAC3l6DcIdBtydYGwsC3M18/?=
 =?us-ascii?Q?GgU4KFbcFKicZE8XOOIQXCMt+ND/+8VrYfmH1WzvukDiHO6tzfFwNZ3bCaRJ?=
 =?us-ascii?Q?9Vekoe0nj5lZFbkhERX0WYW9EzBWEW16Jd9iqvkNhKzyxSnTOsr+5Fz8FxHl?=
 =?us-ascii?Q?IH3hVVfMoU5QAidKvGNVJMATBw4NpBJWXKj+oPrnvldhu6n3bYS3G3hDX40N?=
 =?us-ascii?Q?3ndZMnFks8DrU6f6qJfSG/fWZx0dR7NpenEyfOzxgR/zTulrT7JMRP3/DjuC?=
 =?us-ascii?Q?tT8xkDCdKM4oiuBp6PhLpIZnJJWauSd4RWLasCT9XGFzlOgoLWNvtzKdug2b?=
 =?us-ascii?Q?h1356BMmc1n2zhi8Fizrh4E6DA5tWdklpGg6gE3bRCfyA3iOXf2mtPtCIwXu?=
 =?us-ascii?Q?FhaH1dNKekibScm8HpbF54nfth2k4ENHd/tWhRPPNbRLNwnYCO2XccT7goMJ?=
 =?us-ascii?Q?ZmjRw+r805y5LiJww0YBUhlAigFfPiXFqENYvV2S2BLpZaYWgeoXwIWz/skL?=
 =?us-ascii?Q?ItT6QBn2aVkvyugAIPELEroWwazAwaJ57o+0dfgIHAOyxlutKy45Fx+Y9cJ3?=
 =?us-ascii?Q?DVcxoLLArdpTL4EGjdSZVHaLHdc+bdmZ4QIwQCFPf/hWTsGJUkuGBV7pL2Lf?=
 =?us-ascii?Q?3QO8d4jbDEj0y1McyukWv+3f70BGnGLAJehtfhXXbQAb5Ztm9pchN0S2zP2X?=
 =?us-ascii?Q?j07EkeqF84RNEoJfkKdaxDeIHjH+CMfE+ggtynL4uXjwn240zPvy/BLXvGZ/?=
 =?us-ascii?Q?7lIKhKeRPrJqsB/4DNsjnO+PRDNo6mJ++sofszgFmjBxOPEDFPelet7U5Yxs?=
 =?us-ascii?Q?EReBd35j8uXl8U9K1vXaCZlHBSEvOOZkpFHe2tKyBuKO81MDoIdRPFGbNfxO?=
 =?us-ascii?Q?BonJH95SUqzYOee3WwVAAwQnCuVwsB1As6BPyFmiOD/OWmiivhErRFvIUE6k?=
 =?us-ascii?Q?orWZwFv2ksiDTl1ArC7KD+a1cu/IhHQfBjXJsCxINMyhxTqXTYWzcBkExb+A?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4416b0-c351-4473-8a30-08dd6043ec2f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 02:24:59.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzx+M/xnv5+9U7KmQVovTWMcmjuflLeNiFjY+gz00RhzynVWEm8nP1bdTLUahIK58c/ZR18iLZCjHukJcUAdCVp6PL2fq5s3Mrbr/z+sjtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7669
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67cf9f00 cx=c_pps a=mEL9+5ifO1KfKUNINL6WGg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=uM-OQODG0wvb5HASnkYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: OslPvIwLKbdRp59VCB7sFT9op0-gO-3n
X-Proofpoint-ORIG-GUID: OslPvIwLKbdRp59VCB7sFT9op0-gO-3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110015
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 12:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115889

From: Libo Chen <libo.chen.cn@windriver.com>

Patch from:
https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3e224d885b1de54fe5510b9c5e7296260a1a4507

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 ...ts-set-direction-when-reconfiguring-.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
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
-- 
2.34.1


