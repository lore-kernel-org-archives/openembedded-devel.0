Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E28FEA3C24
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:20:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128925.1775730041159330555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X6BoIlC7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8559158f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394GAKu4046678
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 03:20:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=AaotUDpN3O1QWAHweOi8
	alTSwbyHfxQsZjelOtciVMs=; b=X6BoIlC75Tn1umSo3HLJ0AocufeMa/rzJjf+
	D/HedZ9g1hjoBIg6LErbanYnmZwesprwWzhJoBmIjTgoVoCJssp1CYzUHAY3OTO5
	UVNigqMfGrYkV7jfjf3GbQ+BqHhuN/ZkUKKUTosGIqILr0D+87piSi1BQtaZpBmH
	BTQE/xre0XcgZp7NDep+ceK5pRJudyMYAtp2s6gvF1GVPyjlq+dolIH2jnU75rlB
	4a325Vus+NZWORQgf2KbrnvISVYwYvOzldUKd2JNGbm2nBNqCx75xnAwNtQktn1S
	Hx4vdC0Jq85irMprXV/Yi8U3nEfDcUkIKJ2Vko9eALTBOqziKA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrykwyu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 03:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTICE3it3+LkEFSRqmI+Gx77HMuOQu1gmPjqEQUroeLaYkSRi5rE89amoDbMNpVXU5lO2qkNSASj4T3d2/vNDnpOTocrpAtjKZ2CW9YMGFlJUyjsiS8zp/PcNqLRsom/MguodpqfzItSXL0hp/hI2r4/nLYiXLrUkOnUgfGd6tZjGbo8FbPala4DAd0lJzIkS5HMUFJYQiIlmJxrjaElLpib8T/6+aIr9sI8THl+3QPFk1mwgGytSmn4UGz4GRGuoe0ocS29mq0NN6M24Cs5bwN7JcsxvJKB1E+GygX5wX+8NGHEhYAwjp1UYrdzGmw1QsY8ApY+5i6qT2a61g9WtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaotUDpN3O1QWAHweOi8alTSwbyHfxQsZjelOtciVMs=;
 b=mpjUKOMBaWWnTl3MsH0BImrbaMVyuR9B7H/SbbEJmAUzDfOi+e0Nle0Ny+BDF5vx1VsTVuuVTfNFoEc7T3k/n3zFMKZwkPRdTK29WfTkY5PZRLVGzaKw1VSBJJCbBw3ZFqEy3cgffjaWKVDtD3j2Ec8NZ2gbv3QiIxBxizXsaF7yYU0DqubyMpxCMfriBidL+1rRADu4UEBhlF4oIpYSQ9TAuwBYKUenArm7BNReKZJFdnAkL88Y35PF9q6Vf88keE0DcTb6Qz0qGIekpmVe5zShp+hJromjt+GCXkD1UVSWSzL/gyYbsga1DpPNR2QJvdYaJGNbXE45tMwV2P+d5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 10:20:35 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 10:20:35 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] protobuf-c: upgrade 1.5.1 to 1.5.2
Date: Thu,  9 Apr 2026 18:19:52 +0800
Message-Id: <20260409101952.330550-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 7041a0a3-e56d-42d8-7685-08de9621a342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	VOFHpUfbBzcs7b6lEno9WmydLuGVa3Hc3hdJLyc4Bm/BF0AxT/z0K5nPjD9qhg3dr9y6rHaQfM74bLHDPpicOqLcF2SfPS8wrQQ3sS5u35FQ17zP3qxEDcFjfIn+bwuMXelbKZezZMKQPiliHzrDSQtLj5c2Hd66ahvSM+Bw1IjllN6HcqSaNf3PBw+VtnLCTvDiG+YD7Mp20X+rholgWJxISmEKX1ZsDngUsSGYqsQov7jq1dgHI4AFivtWTaQkvJ0TjPGcSPWSHiOKzg6x5c0HB3EbhqAL9Tw5J3ilxFM52K86AhKLOzob9sn+5X5jbhqhBfLvEBlCLETLfBLL7rFe9alxpZz6EQgeEeXvAkvKVpCzujfeS7lbIHPuYt91/HYEE99sQTFhV0jFljKYGuFmCbteiwylhscPQlPrEmQ1pGykMeNOdBuEUZ7GiMqkSpazgFqjWcK8Z8Pf0HpyuFexIFrHGYte1LM3wpuYw71Mr6s1OHAcyEEaaVb0XytixHkEfg+7yz5XoOKAw/1GOt9EClL9+dqsZnAcUEp8M5v8sGidac79CwfZkZuzYpRggHaVKtWfOdx6vDek+NGCUWfe7c15w7GeLFFQgCH/7wYpQ2m4DkISix8JrJzcCZMt8IjADg7ZAn4qp8fImssM0MSzoh5sfsRJ7mrOhR0tZGJJUGZFBupgfRuJT8+VNRmJDBwmNB8Kd9VfguQGz98khd8j+ao5SFOr+QXdHcl/gfgxnyYUJtVGqPXv5mc17+/b
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6RNFHGPjgK+2qMNrigNBF+AF0a7/QymAR+QdqRjvhsuDfAY/p4XysnH/EI29?=
 =?us-ascii?Q?Sn4PqEPLAveXLRym2naD9b6zKRWVWMhrgDszc584FqJgPNt/F4Vnj/Bpkpd2?=
 =?us-ascii?Q?lqpfwsCSpqzctpfVX6VPDC9w2e5jND/g07FxAklqEUszy+9aXE8xEktV+0V2?=
 =?us-ascii?Q?B8wOxTAzqMDyTzccKjOi4npJLHXG9PVIfYGj2MphAttaML68nREtJwlSm36q?=
 =?us-ascii?Q?G9rM2+S3N1CGYRuPvfRE9vImr8DMWTagG0LOLrtW6OGsdU/3/0rCqTiNNPN0?=
 =?us-ascii?Q?Qsk3HhTizBUz/KQQKDmtlD6E9tn/CA2+rQ/xIYTv7hFkBq1eFGZF5kJydDHi?=
 =?us-ascii?Q?lQHBpTdLSMsmzQ23qH7f/zHW+pitbH9Ipu4+aDYhGOtcK01T2123mC8TnUs/?=
 =?us-ascii?Q?SWJhHXKV0xQs0EEgYrebfRhh4Asa9sU+g4f8rIMUSmRcKWp4peYItQSj8E3H?=
 =?us-ascii?Q?XhoCrEpNQHxwy0bGJZM8YqYyKWmXFfjjmU0kH1ppAkZaffOxFwNTuWj0WbRj?=
 =?us-ascii?Q?L9A9hhHrhh12H2PSO5VLN93mp31UqkVPXvDiy4kjCUlIIQOajPUxBOokwhDl?=
 =?us-ascii?Q?DtSdhdcxGOdSmcyEDKEPknDEi6ki+u/oURa6Pu5GP5/6RWyg120nRZZ5BK2m?=
 =?us-ascii?Q?Q4k8rdQo6av2BjI71hCEZUzo9/WQi1bgdrxvy7JDZwMSsEp9yumcQN9QmpsT?=
 =?us-ascii?Q?II6F7gScMqGGADdMOOgZD34f0oxxcYnvxGL8rQ+8afqbnsekP8SsKI1x5Okd?=
 =?us-ascii?Q?JkSMehzj/mnHgmpO/4uT1gnOMSNkofcrCYGcSpAOKIWtnfYqlpVJYMGyEuPs?=
 =?us-ascii?Q?f9gFMdvbuNiQatQjaMGKrUNz2dbjapz7izAyf33q1nCi1AHK6NsWa9qQkW5Y?=
 =?us-ascii?Q?pf0kpRN9iU6M5KxgNh23AAwyUwNub9VHpzICiqib3DI5cwaufeVBSvkFCyHZ?=
 =?us-ascii?Q?MjmHjmNSh1mqVinJ1fHDtO9wrTS8HdMzc8n/zEy6WstsJPRvdgqtXzIptMb7?=
 =?us-ascii?Q?ns6vLC9B2uJmLcwA2eSkcrRpKrrs1X5NwbSOkGRLHP93wDnPFDypD7UTKHG8?=
 =?us-ascii?Q?SPglAFtQsPfE4SuGqg/Pn40X4wLAh6y5B6ntlhGslSjneTZKvjL7q5cLAJjA?=
 =?us-ascii?Q?5nTTCepvo/epwuLTXdbxeOUXMTEqV9yN9pYS+2gGJJMSv3DdUNzntkXuW9w0?=
 =?us-ascii?Q?QrS7rxmryk+GxV8Deb5Km+F/i3GGatZRoIGTGxAyzM6wqbmKeIhyUZyO85W/?=
 =?us-ascii?Q?v6aCYGLfZO/YIqUgqddBOtlZgHcsPaCnXpTN6AYcFmr8iVhgMN+EenakxrcK?=
 =?us-ascii?Q?cXLggRygglVTEiP5hTZ4sF863HbdwynaYhUKCdu83fAmK66BSIw476uQwIDQ?=
 =?us-ascii?Q?63leQ0p6sls61INM1AEX5TpVpoMt+D4acTxIvvMIc1who38ygAHj05u/uaIW?=
 =?us-ascii?Q?241vJ/Bkb7IGnOLfHcRzcCa6AufOpMkI/8/tDftYD7bfEt7lUwS1kiUhQtgh?=
 =?us-ascii?Q?7LnHH1ujYuVV7pjBATCxkhLPXScMunBTma4x5epw8JKJhAEfusBQZXhgJuIF?=
 =?us-ascii?Q?X4H9Lq7oBP9h9oAlLht2C2bVVPtNNhWHYXSUQjYGEb1JoVLDhQLv0s5h5cQt?=
 =?us-ascii?Q?7KyWFtR+oljRBNyxUcVcCOsdyhGTZo9ma2G1tqi3xuABtkYS1KfQprvhEqz+?=
 =?us-ascii?Q?eKrXOxbyztZffzCC/vx1iwIK7Ijxm19PRt2hfcMQH3RDQ6Weygw5ZddOpIhE?=
 =?us-ascii?Q?sEq54QLaYjN7ooYnZcAD0n9k1u6rWiU=3D?=
X-Exchange-RoutingPolicyChecked: 
	cHRVjUx0phPCUXvzKy9KIGMKYIWuXg0XapWSORicFjymqLwK6tQbBU3YtqcUT82K+fbFGleuSBMKA1ZbC5vD38jg93HqZkJWCcqapu6snuh554zc99xJU0p/GzMuTgnnzD84NGoD+KgHkKSgcASMwk4rZ7/VACQI8NLhQchUv+bl/akrroz13kCbBjxFFR9qWJyLuv8DCAbBbkiryIgMqhLy55I+XE/R+qgqt2nFV39pSh8UnZOdnB8CyRo43WqG0a7fJviJmNULuNq+LUikOJnXQ8kpydDxPP5134EdGAFF/bU3ySwfsN0ZGZGWyeCSp7XV0+9i1lGHQ7AU9TmdFw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7041a0a3-e56d-42d8-7685-08de9621a342
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:20:35.5920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJVOx8b8o7xigcw/aHxb9NZTAT3B+btltkS/xGdlb5MSXrPLbRxdod2PzmI4o6i0XZEYwCVXJOhmGvhkKV9od7WwDxdCzMapB92Ni/X6TpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
X-Proofpoint-ORIG-GUID: 7yb_4G5B9s6xLQR_gfvs_SA1zrVE1t42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA5MiBTYWx0ZWRfX3F3+oGl7JFhW
 NR3HerilN7KHK6zZD6mOeEe98heDotDFwJsfkpXIwqtcIvdLAPXQEXI7CCUpQ8X3LLH2HhH4MCm
 y38KNBB0FD/l6IZjJVMukPDE4HwLFtKJhFdZXkx7GhFwI+2amB3gvkZ1HELVu0NHYUwykNTJkb4
 i4t60UdPDUR0P4Zno7SYasGXzP4GWWduxaHfICmt9CEU4BynTy8CHOCrZMi+fc1H9+xKrDPdMT6
 Zbm8vNWv4DlBB1FExGw5QYGJ+EfUXjhnYidt2My8N8OSva9JBeNHUEDAcxHJA2Hl5jTaIf1LZlJ
 O/U4XWe8AjFEeZ332NrBk61jG0D9yccDae1nPtBmyQdP0/3DAglTOEbY64+Ema36yEDbXL8Vdti
 +Wplfeop3jUSyWMneJ+CwLMYldlq8iDH0Wef+FskSIs5msFV7sjv2I6Y+3eUqbToJtDEbopASoU
 30dsn15LSRyzfWKA1zA==
X-Proofpoint-GUID: 7yb_4G5B9s6xLQR_gfvs_SA1zrVE1t42
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d77d78 cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=Br9LfDWDAAAA:8 a=PlsyGhjiAAAA:8 a=t7CeM3EgAAAA:8 a=oJO74fz6dCEONbaOYLIA:9
 a=ES-fD_9M07-1p2amA5gm:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126149

Changes[1]:
* Chase compatibility issues with Google protobuf 30.0-rc1 by @edmonds in https://github.com/protobuf-c/protobuf-c/pull/762
* protoc-gen-c: Explicitly construct strings where needed for protobuf 30.x by @edmonds in https://github.com/protobuf-c/protobuf-c/pull/768

Remove protobuf-30.patch, this patch already included in 1.5.2

[1] https://github.com/protobuf-c/protobuf-c/compare/v1.5.1...v1.5.2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../protobuf/protobuf-c/protobuf-30.patch     | 1446 -----------------
 ...rotobuf-c_1.5.1.bb => protobuf-c_1.5.2.bb} |    3 +-
 2 files changed, 1 insertion(+), 1448 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf-30.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.5.1.bb => protobuf-c_1.5.2.bb} (94%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf-30.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf-30.patch
deleted file mode 100644
index 1aae1f17b0..0000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c/protobuf-30.patch
+++ /dev/null
@@ -1,1446 +0,0 @@
-From b28683f8027bf1e886b748b5603eb16d203b5a92 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 18:18:33 -0500
-Subject: [PATCH 01/11] protoc-gen-c/c_helpers.h: Move compat defines into new
- header file compat.h
-
-Upstream-Status: Backport [https://gitlab.archlinux.org/archlinux/packaging/packages/protobuf-c/-/blob/main/protobuf-30.patch]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- protoc-gen-c/c_field.cc           |  1 +
- protoc-gen-c/c_helpers.cc         |  1 +
- protoc-gen-c/c_helpers.h          | 10 -------
- protoc-gen-c/c_message.cc         |  1 +
- protoc-gen-c/c_primitive_field.cc |  1 +
- protoc-gen-c/compat.h             | 46 +++++++++++++++++++++++++++++++
- protoc-gen-c/main.cc              |  1 +
- 7 files changed, 51 insertions(+), 10 deletions(-)
- create mode 100644 protoc-gen-c/compat.h
-
-diff --git a/protoc-gen-c/c_field.cc b/protoc-gen-c/c_field.cc
-index 5e79967b..d6d8597e 100644
---- a/protoc-gen-c/c_field.cc
-+++ b/protoc-gen-c/c_field.cc
-@@ -74,6 +74,7 @@
- #include "c_message_field.h"
- #include "c_primitive_field.h"
- #include "c_string_field.h"
-+#include "compat.h"
- 
- namespace protobuf_c {
- 
-diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
-index 5edcf904..c38843f8 100644
---- a/protoc-gen-c/c_helpers.cc
-+++ b/protoc-gen-c/c_helpers.cc
-@@ -73,6 +73,7 @@
- #include <google/protobuf/stubs/common.h>
- 
- #include "c_helpers.h"
-+#include "compat.h"
- 
- namespace protobuf_c {
- 
-diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
-index 943676e9..e69504bb 100644
---- a/protoc-gen-c/c_helpers.h
-+++ b/protoc-gen-c/c_helpers.h
-@@ -186,16 +186,6 @@ inline int FieldSyntax(const google::protobuf::FieldDescriptor* field) {
-   return 2;
- }
- 
--// Work around changes in protobuf >= 22.x without breaking compilation against
--// older protobuf versions.
--#if GOOGLE_PROTOBUF_VERSION >= 4022000
--# define GOOGLE_ARRAYSIZE	ABSL_ARRAYSIZE
--# define GOOGLE_CHECK_EQ	ABSL_CHECK_EQ
--# define GOOGLE_CHECK_EQ	ABSL_CHECK_EQ
--# define GOOGLE_DCHECK_GE	ABSL_DCHECK_GE
--# define GOOGLE_LOG		ABSL_LOG
--#endif
--
- }  // namespace protobuf_c
- 
- #endif  // PROTOBUF_C_PROTOC_GEN_C_C_HELPERS_H__
-diff --git a/protoc-gen-c/c_message.cc b/protoc-gen-c/c_message.cc
-index d4a9a01e..46413873 100644
---- a/protoc-gen-c/c_message.cc
-+++ b/protoc-gen-c/c_message.cc
-@@ -78,6 +78,7 @@
- #include "c_extension.h"
- #include "c_helpers.h"
- #include "c_message.h"
-+#include "compat.h"
- 
- namespace protobuf_c {
- 
-diff --git a/protoc-gen-c/c_primitive_field.cc b/protoc-gen-c/c_primitive_field.cc
-index 253b00bd..588f60e6 100644
---- a/protoc-gen-c/c_primitive_field.cc
-+++ b/protoc-gen-c/c_primitive_field.cc
-@@ -67,6 +67,7 @@
- 
- #include "c_helpers.h"
- #include "c_primitive_field.h"
-+#include "compat.h"
- 
- namespace protobuf_c {
- 
-diff --git a/protoc-gen-c/compat.h b/protoc-gen-c/compat.h
-new file mode 100644
-index 00000000..2ee78281
---- /dev/null
-+++ b/protoc-gen-c/compat.h
-@@ -0,0 +1,46 @@
-+// Copyright (c) 2008-2025, Dave Benson and the protobuf-c authors.
-+// All rights reserved.
-+//
-+// Redistribution and use in source and binary forms, with or without
-+// modification, are permitted provided that the following conditions are
-+// met:
-+//
-+//     * Redistributions of source code must retain the above copyright
-+// notice, this list of conditions and the following disclaimer.
-+//
-+//     * Redistributions in binary form must reproduce the above
-+// copyright notice, this list of conditions and the following disclaimer
-+// in the documentation and/or other materials provided with the
-+// distribution.
-+//
-+// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-+// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-+// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
-+// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
-+// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
-+// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
-+// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
-+// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+
-+#ifndef PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
-+#define PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
-+
-+#if GOOGLE_PROTOBUF_VERSION >= 4022000
-+# define GOOGLE_ARRAYSIZE	ABSL_ARRAYSIZE
-+# define GOOGLE_CHECK_EQ	ABSL_CHECK_EQ
-+# define GOOGLE_DCHECK_GE	ABSL_DCHECK_GE
-+# define GOOGLE_LOG		ABSL_LOG
-+#endif
-+
-+namespace protobuf_c {
-+
-+namespace compat {
-+
-+}  // namespace compat
-+
-+}  // namespace protobuf_c
-+
-+#endif  // PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
-diff --git a/protoc-gen-c/main.cc b/protoc-gen-c/main.cc
-index 0656c113..5ab929d3 100644
---- a/protoc-gen-c/main.cc
-+++ b/protoc-gen-c/main.cc
-@@ -32,6 +32,7 @@
- 
- #include "c_generator.h"
- #include "c_helpers.h"
-+#include "compat.h"
- 
- int main(int argc, char* argv[]) {
-   protobuf_c::CGenerator c_generator;
-
-From 1678f1fba6f2d3e5c1db2817495ddcd72bd4e87b Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 20:09:03 -0500
-Subject: [PATCH 02/11] protoc-gen-c/compat.h: Add `compat::StringView` type
-
-protobuf >= 30.x replaces `const std::string&` in various APIs with
-its own string view type that may actually be a `absl::string_view`.
-Introduce our own `compat::StringView` type that we can use instead
-of `const std::string&` in order to support compiling across multiple
-protobuf versions.
----
- protoc-gen-c/compat.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/protoc-gen-c/compat.h b/protoc-gen-c/compat.h
-index 2ee78281..fe8041b5 100644
---- a/protoc-gen-c/compat.h
-+++ b/protoc-gen-c/compat.h
-@@ -28,6 +28,8 @@
- #ifndef PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
- #define PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
- 
-+#include <string>
-+
- #if GOOGLE_PROTOBUF_VERSION >= 4022000
- # define GOOGLE_ARRAYSIZE	ABSL_ARRAYSIZE
- # define GOOGLE_CHECK_EQ	ABSL_CHECK_EQ
-@@ -39,6 +41,12 @@ namespace protobuf_c {
- 
- namespace compat {
- 
-+#if GOOGLE_PROTOBUF_VERSION >= 6030000
-+typedef google::protobuf::internal::DescriptorStringView StringView;
-+#else
-+typedef const std::string& StringView;
-+#endif
-+
- }  // namespace compat
- 
- }  // namespace protobuf_c
-
-From db5252c131c82fb48ee599179b6989a577b7fbc8 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 20:13:44 -0500
-Subject: [PATCH 03/11] Remove some unused functions
-
----
- protoc-gen-c/c_helpers.cc | 64 ---------------------------------------
- protoc-gen-c/c_helpers.h  |  3 --
- 2 files changed, 67 deletions(-)
-
-diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
-index c38843f8..bbb4a615 100644
---- a/protoc-gen-c/c_helpers.cc
-+++ b/protoc-gen-c/c_helpers.cc
-@@ -90,14 +90,6 @@ namespace protobuf_c {
- #pragma warning(disable:4996)
- #endif
- 
--std::string DotsToUnderscores(const std::string& name) {
--  return StringReplace(name, ".", "_", true);
--}
--
--std::string DotsToColons(const std::string& name) {
--  return StringReplace(name, ".", "::", true);
--}
--
- std::string SimpleFtoa(float f) {
-   char buf[100];
-   snprintf(buf,sizeof(buf),"%.*g", FLT_DIG, f);
-@@ -333,11 +325,6 @@ std::string FilenameIdentifier(const std::string& filename) {
-   return result;
- }
- 
--// Return the name of the BuildDescriptors() function for a given file.
--std::string GlobalBuildDescriptorsName(const std::string& filename) {
--  return "proto_BuildDescriptors_" + FilenameIdentifier(filename);
--}
--
- std::string GetLabelName(google::protobuf::FieldDescriptor::Label label) {
-   switch (label) {
-     case google::protobuf::FieldDescriptor::LABEL_OPTIONAL: return "optional";
-@@ -392,57 +379,6 @@ WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *
-   }
- }
-     
--
--
--// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
--// XXXXXXXXX  this stuff is copied from strutils.cc !!!!   XXXXXXXXXXXXXXXXXXXXXXXXXXXXx
--// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx
--// ----------------------------------------------------------------------
--// StringReplace()
--//    Replace the "old" pattern with the "new" pattern in a string,
--//    and append the result to "res".  If replace_all is false,
--//    it only replaces the first instance of "old."
--// ----------------------------------------------------------------------
--
--void StringReplace(const std::string& s, const std::string& oldsub,
--                   const std::string& newsub, bool replace_all,
--                   std::string* res) {
--  if (oldsub.empty()) {
--    res->append(s);  // if empty, append the given string.
--    return;
--  }
--
--  std::string::size_type start_pos = 0;
--  std::string::size_type pos;
--  do {
--    pos = s.find(oldsub, start_pos);
--    if (pos == std::string::npos) {
--      break;
--    }
--    res->append(s, start_pos, pos - start_pos);
--    res->append(newsub);
--    start_pos = pos + oldsub.size();  // start searching again after the "old"
--  } while (replace_all);
--  res->append(s, start_pos, s.length() - start_pos);
--}
--
--
--// ----------------------------------------------------------------------
--// StringReplace()
--//    Give me a string and two patterns "old" and "new", and I replace
--//    the first instance of "old" in the string with "new", if it
--//    exists.  If "global" is true; call this repeatedly until it
--//    fails.  RETURN a new string, regardless of whether the replacement
--//    happened or not.
--// ----------------------------------------------------------------------
--
--std::string StringReplace(const std::string& s, const std::string& oldsub,
--                          const std::string& newsub, bool replace_all) {
--  std::string ret;
--  StringReplace(s, oldsub, newsub, replace_all, &ret);
--  return ret;
--}
--
- // ----------------------------------------------------------------------
- // SplitStringUsing()
- //    Split a string using a character delimiter. Append the components
-diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
-index e69504bb..377d4272 100644
---- a/protoc-gen-c/c_helpers.h
-+++ b/protoc-gen-c/c_helpers.h
-@@ -150,9 +150,6 @@ const char* DeclaredTypeMethodName(google::protobuf::FieldDescriptor::Type type)
- // Convert a file name into a valid identifier.
- std::string FilenameIdentifier(const std::string& filename);
- 
--// Return the name of the BuildDescriptors() function for a given file.
--std::string GlobalBuildDescriptorsName(const std::string& filename);
--
- // return 'required', 'optional', or 'repeated'
- std::string GetLabelName(google::protobuf::FieldDescriptor::Label label);
- 
-
-From bc2cb66d908f016dd3f7082c8a6ad7c58bc03412 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 20:18:05 -0500
-Subject: [PATCH 04/11] Use `compat::StringView` type across various function
- signatures
-
----
- protoc-gen-c/c_helpers.cc | 44 +++++++++++++++++++++------------------
- protoc-gen-c/c_helpers.h  | 36 ++++++++++++++++----------------
- 2 files changed, 42 insertions(+), 38 deletions(-)
-
-diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
-index bbb4a615..c759c8c2 100644
---- a/protoc-gen-c/c_helpers.cc
-+++ b/protoc-gen-c/c_helpers.cc
-@@ -96,6 +96,7 @@ std::string SimpleFtoa(float f) {
-   buf[sizeof(buf)-1] = 0;		/* should NOT be necessary */
-   return buf;
- }
-+
- std::string SimpleDtoa(double d) {
-   char buf[100];
-   snprintf(buf,sizeof(buf),"%.*g", DBL_DIG, d);
-@@ -103,7 +104,7 @@ std::string SimpleDtoa(double d) {
-   return buf;
- }
- 
--std::string CamelToUpper(const std::string &name) {
-+std::string CamelToUpper(compat::StringView name) {
-   bool was_upper = true;		// suppress initial _
-   std::string rv = "";
-   int len = name.length();
-@@ -120,7 +121,8 @@ std::string CamelToUpper(const std::string &name) {
-   }
-   return rv;
- }
--std::string CamelToLower(const std::string &name) {
-+
-+std::string CamelToLower(compat::StringView name) {
-   bool was_upper = true;		// suppress initial _
-   std::string rv = "";
-   int len = name.length();
-@@ -138,8 +140,7 @@ std::string CamelToLower(const std::string &name) {
-   return rv;
- }
- 
--
--std::string ToUpper(const std::string &name) {
-+std::string ToUpper(compat::StringView name) {
-   std::string rv = "";
-   int len = name.length();
-   for (int i = 0; i < len; i++) {
-@@ -147,7 +148,8 @@ std::string ToUpper(const std::string &name) {
-   }
-   return rv;
- }
--std::string ToLower(const std::string &name) {
-+
-+std::string ToLower(compat::StringView name) {
-   std::string rv = "";
-   int len = name.length();
-   for (int i = 0; i < len; i++) {
-@@ -155,7 +157,8 @@ std::string ToLower(const std::string &name) {
-   }
-   return rv;
- }
--std::string ToCamel(const std::string &name) {
-+
-+std::string ToCamel(compat::StringView name) {
-   std::string rv = "";
-   int len = name.length();
-   bool next_is_upper = true;
-@@ -172,7 +175,7 @@ std::string ToCamel(const std::string &name) {
-   return rv;
- }
- 
--std::string OverrideFullName(const std::string &full_name, const google::protobuf::FileDescriptor* file) {
-+std::string OverrideFullName(compat::StringView full_name, const google::protobuf::FileDescriptor* file) {
-   const ProtobufCFileOptions opt = file->options().GetExtension(pb_c_file);
-   if (!opt.has_c_package())
-     return full_name;
-@@ -184,7 +187,7 @@ std::string OverrideFullName(const std::string &full_name, const google::protobu
-   return new_name + full_name.substr(file->package().length());
- }
- 
--std::string FullNameToLower(const std::string &full_name, const google::protobuf::FileDescriptor* file) {
-+std::string FullNameToLower(compat::StringView full_name, const google::protobuf::FileDescriptor* file) {
-   std::vector<std::string> pieces;
-   SplitStringUsing(OverrideFullName(full_name, file), ".", &pieces);
-   std::string rv = "";
-@@ -195,7 +198,8 @@ std::string FullNameToLower(const std::string &full_name, const google::protobuf
-   }
-   return rv;
- }
--std::string FullNameToUpper(const std::string &full_name, const google::protobuf::FileDescriptor* file) {
-+
-+std::string FullNameToUpper(compat::StringView full_name, const google::protobuf::FileDescriptor* file) {
-   std::vector<std::string> pieces;
-   SplitStringUsing(OverrideFullName(full_name, file), ".", &pieces);
-   std::string rv = "";
-@@ -206,7 +210,8 @@ std::string FullNameToUpper(const std::string &full_name, const google::protobuf
-   }
-   return rv;
- }
--std::string FullNameToC(const std::string &full_name, const google::protobuf::FileDescriptor* file) {
-+
-+std::string FullNameToC(compat::StringView full_name, const google::protobuf::FileDescriptor* file) {
-   std::vector<std::string> pieces;
-   SplitStringUsing(OverrideFullName(full_name, file), ".", &pieces);
-   std::string rv = "";
-@@ -248,7 +253,7 @@ void PrintComment(google::protobuf::io::Printer* printer, std::string comment)
-    }
- }
- 
--std::string ConvertToSpaces(const std::string &input) {
-+std::string ConvertToSpaces(compat::StringView input) {
-   return std::string(input.size(), ' ');
- }
- 
-@@ -259,8 +264,7 @@ int compare_name_indices_by_name(const void *a, const void *b)
-   return strcmp (ni_a->name, ni_b->name);
- }
- 
--
--std::string CEscape(const std::string& src);
-+std::string CEscape(compat::StringView src);
- 
- const char* const kKeywordList[] = {
-   "and", "and_eq", "asm", "auto", "bitand", "bitor", "bool", "break", "case",
-@@ -300,7 +304,7 @@ std::string FieldDeprecated(const google::protobuf::FieldDescriptor* field) {
-   return "";
- }
- 
--std::string StripProto(const std::string& filename) {
-+std::string StripProto(compat::StringView filename) {
-   if (HasSuffixString(filename, ".protodevel")) {
-     return StripSuffixString(filename, ".protodevel");
-   } else {
-@@ -309,7 +313,7 @@ std::string StripProto(const std::string& filename) {
- }
- 
- // Convert a file name into a valid identifier.
--std::string FilenameIdentifier(const std::string& filename) {
-+std::string FilenameIdentifier(compat::StringView filename) {
-   std::string result;
-   for (unsigned i = 0; i < filename.size(); i++) {
-     if (isalnum(filename[i])) {
-@@ -335,7 +339,7 @@ std::string GetLabelName(google::protobuf::FieldDescriptor::Label label) {
- }
- 
- unsigned
--WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, const std::string &name)
-+WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name)
- {
-   std::map<std::string, std::string> vars;
-   vars["name"] = name;
-@@ -389,7 +393,7 @@ WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *
- // ----------------------------------------------------------------------
- template <typename ITR>
- static inline
--void SplitStringToIteratorUsing(const std::string& full,
-+void SplitStringToIteratorUsing(compat::StringView full,
-                                 const char* delim,
-                                 ITR& result) {
-   // Optimize the common case where delim is a single character.
-@@ -422,7 +426,7 @@ void SplitStringToIteratorUsing(const std::string& full,
-   }
- }
- 
--void SplitStringUsing(const std::string& full,
-+void SplitStringUsing(compat::StringView full,
-                       const char* delim,
-                       std::vector<std::string>* result) {
-   std::back_insert_iterator< std::vector<std::string> > it(*result);
-@@ -435,7 +439,6 @@ char* FastHexToBuffer(int i, char* buffer)
-   return buffer;
- }
- 
--
- static int CEscapeInternal(const char* src, int src_len, char* dest,
-                            int dest_len, bool use_hex) {
-   const char* src_end = src + src_len;
-@@ -478,7 +481,8 @@ static int CEscapeInternal(const char* src, int src_len, char* dest,
-   dest[used] = '\0';   // doesn't count towards return value though
-   return used;
- }
--std::string CEscape(const std::string& src) {
-+
-+std::string CEscape(compat::StringView src) {
-   const int dest_length = src.size() * 4 + 1; // Maximum possible expansion
-   std::unique_ptr<char[]> dest(new char[dest_length]);
-   const int len = CEscapeInternal(src.data(), src.size(),
-diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
-index 377d4272..ccd39ca2 100644
---- a/protoc-gen-c/c_helpers.h
-+++ b/protoc-gen-c/c_helpers.h
-@@ -73,6 +73,8 @@
- 
- #include <protobuf-c/protobuf-c.pb.h>
- 
-+#include "compat.h"
-+
- namespace protobuf_c {
- 
- // --- Borrowed from stubs. ---
-@@ -84,11 +86,10 @@ template <typename T> std::string SimpleItoa(T n) {
- 
- std::string SimpleFtoa(float f);
- std::string SimpleDtoa(double f);
--void SplitStringUsing(const std::string &str, const char *delim, std::vector<std::string> *out);
--std::string CEscape(const std::string& src);
--std::string StringReplace(const std::string& s, const std::string& oldsub, const std::string& newsub, bool replace_all);
--inline bool HasSuffixString(const std::string& str, const std::string& suffix) { return str.size() >= suffix.size() && str.compare(str.size() - suffix.size(), suffix.size(), suffix) == 0; }
--inline std::string StripSuffixString(const std::string& str, const std::string& suffix) { if (HasSuffixString(str, suffix)) { return str.substr(0, str.size() - suffix.size()); } else { return str; } }
-+void SplitStringUsing(compat::StringView str, const char *delim, std::vector<std::string> *out);
-+std::string CEscape(compat::StringView src);
-+inline bool HasSuffixString(compat::StringView str, compat::StringView suffix) { return str.size() >= suffix.size() && str.compare(str.size() - suffix.size(), suffix.size(), suffix) == 0; }
-+inline std::string StripSuffixString(compat::StringView str, compat::StringView suffix) { if (HasSuffixString(str, suffix)) { return str.substr(0, str.size() - suffix.size()); } else { return str; } }
- char* FastHexToBuffer(int i, char* buffer);
- 
- 
-@@ -110,31 +111,31 @@ inline const google::protobuf::Descriptor* FieldScope(const google::protobuf::Fi
- 
- // convert a CamelCase class name into an all uppercase affair
- // with underscores separating words, e.g. MyClass becomes MY_CLASS.
--std::string CamelToUpper(const std::string &class_name);
--std::string CamelToLower(const std::string &class_name);
-+std::string CamelToUpper(compat::StringView class_name);
-+std::string CamelToLower(compat::StringView class_name);
- 
- // lowercased, underscored name to camel case
--std::string ToCamel(const std::string &name);
-+std::string ToCamel(compat::StringView name);
- 
- // lowercase the string
--std::string ToLower(const std::string &class_name);
--std::string ToUpper(const std::string &class_name);
-+std::string ToLower(compat::StringView class_name);
-+std::string ToUpper(compat::StringView class_name);
- 
- // full_name() to lowercase with underscores
--std::string FullNameToLower(const std::string &full_name, const google::protobuf::FileDescriptor *file);
--std::string FullNameToUpper(const std::string &full_name, const google::protobuf::FileDescriptor *file);
-+std::string FullNameToLower(compat::StringView full_name, const google::protobuf::FileDescriptor *file);
-+std::string FullNameToUpper(compat::StringView full_name, const google::protobuf::FileDescriptor *file);
- 
- // full_name() to c-typename (with underscores for packages, otherwise camel case)
--std::string FullNameToC(const std::string &class_name, const google::protobuf::FileDescriptor *file);
-+std::string FullNameToC(compat::StringView class_name, const google::protobuf::FileDescriptor *file);
- 
- // Splits, indents, formats, and prints comment lines
- void PrintComment(google::protobuf::io::Printer* printer, std::string comment);
- 
- // make a string of spaces as long as input
--std::string ConvertToSpaces(const std::string &input);
-+std::string ConvertToSpaces(compat::StringView input);
- 
- // Strips ".proto" or ".protodevel" from the end of a filename.
--std::string StripProto(const std::string& filename);
-+std::string StripProto(compat::StringView filename);
- 
- // Get the C++ type name for a primitive type (e.g. "double", "::google::protobuf::int32", etc.).
- // Note:  non-built-in type names will be qualified, meaning they will start
-@@ -148,15 +149,14 @@ const char* PrimitiveTypeName(google::protobuf::FieldDescriptor::CppType type);
- const char* DeclaredTypeMethodName(google::protobuf::FieldDescriptor::Type type);
- 
- // Convert a file name into a valid identifier.
--std::string FilenameIdentifier(const std::string& filename);
-+std::string FilenameIdentifier(compat::StringView filename);
- 
- // return 'required', 'optional', or 'repeated'
- std::string GetLabelName(google::protobuf::FieldDescriptor::Label label);
- 
--
- // write IntRanges entries for a bunch of sorted values.
- // returns the number of ranges there are to bsearch.
--unsigned WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, const std::string &name);
-+unsigned WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, const int *values, compat::StringView name);
- 
- struct NameIndex
- {
-
-From 75f1c32cc429233a3726358c999009f9ea373b45 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 20:25:43 -0500
-Subject: [PATCH 05/11] Convert string views to owned strings where necessary
-
----
- protoc-gen-c/c_enum.cc       | 2 +-
- protoc-gen-c/c_enum_field.cc | 2 +-
- protoc-gen-c/c_helpers.cc    | 8 ++++----
- protoc-gen-c/c_helpers.h     | 3 +--
- 4 files changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/protoc-gen-c/c_enum.cc b/protoc-gen-c/c_enum.cc
-index 9212ab82..311e4c86 100644
---- a/protoc-gen-c/c_enum.cc
-+++ b/protoc-gen-c/c_enum.cc
-@@ -152,7 +152,7 @@ void EnumGenerator::GenerateValueInitializer(google::protobuf::io::Printer *prin
-     descriptor_->file()->options().optimize_for() ==
-     google::protobuf::FileOptions_OptimizeMode_CODE_SIZE;
-   vars["enum_value_name"] = vd->name();
--  vars["c_enum_value_name"] = FullNameToUpper(descriptor_->full_name(), descriptor_->file()) + "__" + vd->name();
-+  vars["c_enum_value_name"] = FullNameToUpper(descriptor_->full_name(), descriptor_->file()) + "__" + std::string(vd->name());
-   vars["value"] = SimpleItoa(vd->number());
-   if (optimize_code_size)
-     printer->Print(vars, "  { NULL, NULL, $value$ }, /* CODE_SIZE */\n");
-diff --git a/protoc-gen-c/c_enum_field.cc b/protoc-gen-c/c_enum_field.cc
-index 0926ae59..c3111f50 100644
---- a/protoc-gen-c/c_enum_field.cc
-+++ b/protoc-gen-c/c_enum_field.cc
-@@ -78,7 +78,7 @@ void SetEnumVariables(const google::protobuf::FieldDescriptor* descriptor,
-   (*variables)["type"] = FullNameToC(descriptor->enum_type()->full_name(), descriptor->enum_type()->file());
-   const google::protobuf::EnumValueDescriptor* default_value = descriptor->default_value_enum();
-   (*variables)["default"] = FullNameToUpper(default_value->type()->full_name(), default_value->type()->file())
--                          + "__" + default_value->name();
-+                          + "__" + std::string(default_value->name());
-   (*variables)["deprecated"] = FieldDeprecated(descriptor);
- }
- 
-diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
-index c759c8c2..1aecef93 100644
---- a/protoc-gen-c/c_helpers.cc
-+++ b/protoc-gen-c/c_helpers.cc
-@@ -178,13 +178,13 @@ std::string ToCamel(compat::StringView name) {
- std::string OverrideFullName(compat::StringView full_name, const google::protobuf::FileDescriptor* file) {
-   const ProtobufCFileOptions opt = file->options().GetExtension(pb_c_file);
-   if (!opt.has_c_package())
--    return full_name;
-+    return std::string(full_name);
- 
-   std::string new_name = opt.c_package();
-   if (file->package().empty())
-     new_name += ".";
- 
--  return new_name + full_name.substr(file->package().length());
-+  return new_name + std::string(full_name.substr(file->package().length()));
- }
- 
- std::string FullNameToLower(compat::StringView full_name, const google::protobuf::FileDescriptor* file) {
-@@ -418,10 +418,10 @@ void SplitStringToIteratorUsing(compat::StringView full,
-   while (begin_index != std::string::npos) {
-     end_index = full.find_first_of(delim, begin_index);
-     if (end_index == std::string::npos) {
--      *result++ = full.substr(begin_index);
-+      *result++ = std::string(full.substr(begin_index));
-       return;
-     }
--    *result++ = full.substr(begin_index, (end_index - begin_index));
-+    *result++ = std::string(full.substr(begin_index, (end_index - begin_index)));
-     begin_index = full.find_first_not_of(delim, end_index);
-   }
- }
-diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
-index ccd39ca2..985e4db6 100644
---- a/protoc-gen-c/c_helpers.h
-+++ b/protoc-gen-c/c_helpers.h
-@@ -89,10 +89,9 @@ std::string SimpleDtoa(double f);
- void SplitStringUsing(compat::StringView str, const char *delim, std::vector<std::string> *out);
- std::string CEscape(compat::StringView src);
- inline bool HasSuffixString(compat::StringView str, compat::StringView suffix) { return str.size() >= suffix.size() && str.compare(str.size() - suffix.size(), suffix.size(), suffix) == 0; }
--inline std::string StripSuffixString(compat::StringView str, compat::StringView suffix) { if (HasSuffixString(str, suffix)) { return str.substr(0, str.size() - suffix.size()); } else { return str; } }
-+inline std::string StripSuffixString(compat::StringView str, compat::StringView suffix) { if (HasSuffixString(str, suffix)) { return std::string(str.substr(0, str.size() - suffix.size())); } else { return std::string(str); } }
- char* FastHexToBuffer(int i, char* buffer);
- 
--
- // Get the (unqualified) name that should be used for this field in C code.
- // The name is coerced to lower-case to emulate proto1 behavior.  People
- // should be using lowercase-with-underscores style for proto field names
-
-From 0edca93db369fb84f01cc0d4e3ee4cd6c2ad7f4f Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 20:39:11 -0500
-Subject: [PATCH 06/11] Convert various uses of `const char *` to
- `compat::StringView`
-
-Also replace some uses of arrays manually allocated with new/delete with
-uses of `std::vector`.
----
- protoc-gen-c/c_enum.cc    | 35 ++++++++++++++++++-----------------
- protoc-gen-c/c_helpers.cc |  2 +-
- protoc-gen-c/c_helpers.h  |  2 +-
- protoc-gen-c/c_message.cc | 28 ++++++++++++----------------
- protoc-gen-c/c_service.cc | 19 +++++++++----------
- 5 files changed, 41 insertions(+), 45 deletions(-)
-
-diff --git a/protoc-gen-c/c_enum.cc b/protoc-gen-c/c_enum.cc
-index 311e4c86..c7839edd 100644
---- a/protoc-gen-c/c_enum.cc
-+++ b/protoc-gen-c/c_enum.cc
-@@ -142,7 +142,7 @@ struct ValueIndex
-   int value;
-   unsigned index;
-   unsigned final_index;		/* index in uniqified array of values */
--  const char *name;
-+  compat::StringView name;
- };
- void EnumGenerator::GenerateValueInitializer(google::protobuf::io::Printer *printer, int index)
- {
-@@ -176,7 +176,7 @@ static int compare_value_indices_by_name(const void *a, const void *b)
- {
-   const ValueIndex *vi_a = (const ValueIndex *) a;
-   const ValueIndex *vi_b = (const ValueIndex *) b;
--  return strcmp (vi_a->name, vi_b->name);
-+  return vi_a->name.compare(vi_b->name);
- }
- 
- void EnumGenerator::GenerateEnumDescriptor(google::protobuf::io::Printer* printer) {
-@@ -194,18 +194,20 @@ void EnumGenerator::GenerateEnumDescriptor(google::protobuf::io::Printer* printe
- 
-   // Sort by name and value, dropping duplicate values if they appear later.
-   // TODO: use a c++ paradigm for this!
--  NameIndex *name_index = new NameIndex[descriptor_->value_count()];
--  ValueIndex *value_index = new ValueIndex[descriptor_->value_count()];
--  for (int j = 0; j < descriptor_->value_count(); j++) {
-+  std::vector<ValueIndex> value_index;
-+  for (unsigned j = 0; j < descriptor_->value_count(); j++) {
-     const google::protobuf::EnumValueDescriptor *vd = descriptor_->value(j);
--    name_index[j].index = j;
--    name_index[j].name = vd->name().c_str();
--    value_index[j].index = j;
--    value_index[j].value = vd->number();
--    value_index[j].name = vd->name().c_str();
-+    value_index.push_back({
-+      .value = vd->number(),
-+      .index = j,
-+      .final_index = 0,
-+      .name = vd->name(),
-+    });
-   }
--  qsort(value_index, descriptor_->value_count(),
--	sizeof(ValueIndex), compare_value_indices_by_value_then_index);
-+  qsort(&value_index[0],
-+        value_index.size(),
-+        sizeof(ValueIndex),
-+        compare_value_indices_by_value_then_index);
- 
-   // only record unique values
-   int n_unique_values;
-@@ -275,8 +277,10 @@ void EnumGenerator::GenerateEnumDescriptor(google::protobuf::io::Printer* printe
-   vars["n_ranges"] = SimpleItoa(n_ranges);
- 
-   if (!optimize_code_size) {
--    qsort(value_index, descriptor_->value_count(),
--        sizeof(ValueIndex), compare_value_indices_by_name);
-+    qsort(&value_index[0],
-+          value_index.size(),
-+          sizeof(ValueIndex),
-+          compare_value_indices_by_name);
-     printer->Print(vars,
-         "static const ProtobufCEnumValueIndex $lcclassname$__enum_values_by_name[$value_count$] =\n"
-         "{\n");
-@@ -319,9 +323,6 @@ void EnumGenerator::GenerateEnumDescriptor(google::protobuf::io::Printer* printe
-         "  NULL,NULL,NULL,NULL   /* reserved[1234] */\n"
-         "};\n");
-   }
--
--  delete[] value_index;
--  delete[] name_index;
- }
- 
- }  // namespace protobuf_c
-diff --git a/protoc-gen-c/c_helpers.cc b/protoc-gen-c/c_helpers.cc
-index 1aecef93..dec9ce28 100644
---- a/protoc-gen-c/c_helpers.cc
-+++ b/protoc-gen-c/c_helpers.cc
-@@ -261,7 +261,7 @@ int compare_name_indices_by_name(const void *a, const void *b)
- {
-   const NameIndex *ni_a = (const NameIndex *) a;
-   const NameIndex *ni_b = (const NameIndex *) b;
--  return strcmp (ni_a->name, ni_b->name);
-+  return ni_a->name.compare(ni_b->name);
- }
- 
- std::string CEscape(compat::StringView src);
-diff --git a/protoc-gen-c/c_helpers.h b/protoc-gen-c/c_helpers.h
-index 985e4db6..69369997 100644
---- a/protoc-gen-c/c_helpers.h
-+++ b/protoc-gen-c/c_helpers.h
-@@ -160,7 +160,7 @@ unsigned WriteIntRanges(google::protobuf::io::Printer* printer, int n_values, co
- struct NameIndex
- {
-   unsigned index;
--  const char *name;
-+  compat::StringView name;
- };
- int compare_name_indices_by_name(const void*, const void*);
- 
-diff --git a/protoc-gen-c/c_message.cc b/protoc-gen-c/c_message.cc
-index 46413873..7252923c 100644
---- a/protoc-gen-c/c_message.cc
-+++ b/protoc-gen-c/c_message.cc
-@@ -567,27 +567,26 @@ GenerateMessageDescriptor(google::protobuf::io::Printer* printer, bool gen_init)
- 	"static const ProtobufCFieldDescriptor $lcclassname$__field_descriptors[$n_fields$] =\n"
- 	"{\n");
-   printer->Indent();
--  const google::protobuf::FieldDescriptor **sorted_fields = new const google::protobuf::FieldDescriptor *[descriptor_->field_count()];
-+
-+  std::vector<const google::protobuf::FieldDescriptor*> sorted_fields;
-   for (int i = 0; i < descriptor_->field_count(); i++) {
--    sorted_fields[i] = descriptor_->field(i);
-+    sorted_fields.push_back(descriptor_->field(i));
-   }
--  qsort (sorted_fields, descriptor_->field_count(),
-+  qsort(&sorted_fields[0], sorted_fields.size(),
-        sizeof(const google::protobuf::FieldDescriptor*), 
-        compare_pfields_by_number);
--  for (int i = 0; i < descriptor_->field_count(); i++) {
--    const google::protobuf::FieldDescriptor* field = sorted_fields[i];
-+  for (auto field : sorted_fields) {
-     field_generators_.get(field).GenerateDescriptorInitializer(printer);
-   }
-   printer->Outdent();
-   printer->Print(vars, "};\n");
- 
-   if (!optimize_code_size) {
--    NameIndex *field_indices = new NameIndex [descriptor_->field_count()];
--    for (int i = 0; i < descriptor_->field_count(); i++) {
--      field_indices[i].name = sorted_fields[i]->name().c_str();
--      field_indices[i].index = i;
-+    std::vector<NameIndex> field_indices;
-+    for (unsigned i = 0; i < descriptor_->field_count(); i++) {
-+      field_indices.push_back({ .index = i, .name = sorted_fields[i]->name() });
-     }
--    qsort (field_indices, descriptor_->field_count(), sizeof (NameIndex),
-+    qsort(&field_indices[0], field_indices.size(), sizeof(NameIndex),
-         compare_name_indices_by_name);
-     printer->Print(vars, "static const unsigned $lcclassname$__field_indices_by_name[] = {\n");
-     for (int i = 0; i < descriptor_->field_count(); i++) {
-@@ -596,19 +595,16 @@ GenerateMessageDescriptor(google::protobuf::io::Printer* printer, bool gen_init)
-       printer->Print(vars, "  $index$,   /* field[$index$] = $name$ */\n");
-     }
-     printer->Print("};\n");
--    delete[] field_indices;
-   }
- 
-   // create range initializers
--  int *values = new int[descriptor_->field_count()];
-+  std::vector<int> values;
-   for (int i = 0; i < descriptor_->field_count(); i++) {
--    values[i] = sorted_fields[i]->number();
-+    values.push_back(sorted_fields[i]->number());
-   }
-   int n_ranges = WriteIntRanges(printer,
--				descriptor_->field_count(), values,
-+				descriptor_->field_count(), &values[0],
- 				vars["lcclassname"] + "__number_ranges");
--  delete [] values;
--  delete [] sorted_fields;
- 
-   vars["n_ranges"] = SimpleItoa(n_ranges);
-     } else {
-diff --git a/protoc-gen-c/c_service.cc b/protoc-gen-c/c_service.cc
-index ee4d4a95..2c3ddcf3 100644
---- a/protoc-gen-c/c_service.cc
-+++ b/protoc-gen-c/c_service.cc
-@@ -184,19 +184,19 @@ void ServiceGenerator::GenerateInit(google::protobuf::io::Printer* printer)
- 		 "}\n");
- }
- 
--struct MethodIndexAndName { unsigned i; const char *name; };
-+struct MethodIndexAndName { unsigned i; compat::StringView name; };
- static int
- compare_method_index_and_name_by_name (const void *a, const void *b)
- {
-   const MethodIndexAndName *ma = (const MethodIndexAndName *) a;
-   const MethodIndexAndName *mb = (const MethodIndexAndName *) b;
--  return strcmp (ma->name, mb->name);
-+  return ma->name.compare(mb->name);
- }
- 
- void ServiceGenerator::GenerateServiceDescriptor(google::protobuf::io::Printer* printer)
- {
-   int n_methods = descriptor_->method_count();
--  MethodIndexAndName *mi_array = new MethodIndexAndName[n_methods];
-+  std::vector<MethodIndexAndName> mi_array;
- 
-   bool optimize_code_size = descriptor_->file()->options().has_optimize_for() &&
-     descriptor_->file()->options().optimize_for() ==
-@@ -205,7 +205,7 @@ void ServiceGenerator::GenerateServiceDescriptor(google::protobuf::io::Printer*
-   vars_["n_methods"] = SimpleItoa(n_methods);
-   printer->Print(vars_, "static const ProtobufCMethodDescriptor $lcfullname$__method_descriptors[$n_methods$] =\n"
-                        "{\n");
--  for (int i = 0; i < n_methods; i++) {
-+  for (unsigned i = 0; i < n_methods; i++) {
-     const google::protobuf::MethodDescriptor* method = descriptor_->method(i);
-     vars_["method"] = method->name();
-     vars_["input_descriptor"] = "&" + FullNameToLower(method->input_type()->full_name(), method->input_type()->file()) + "__descriptor";
-@@ -217,14 +217,15 @@ void ServiceGenerator::GenerateServiceDescriptor(google::protobuf::io::Printer*
-       printer->Print(vars_,
-           "  { \"$method$\", $input_descriptor$, $output_descriptor$ },\n");
-     }
--    mi_array[i].i = i;
--    mi_array[i].name = method->name().c_str();
-+    mi_array.push_back({i, method->name()});
-   }
-   printer->Print(vars_, "};\n");
- 
-   if (!optimize_code_size) {
--    qsort ((void*)mi_array, n_methods, sizeof (MethodIndexAndName),
--        compare_method_index_and_name_by_name);
-+    qsort(&mi_array[0],
-+          mi_array.size(),
-+          sizeof(MethodIndexAndName),
-+          compare_method_index_and_name_by_name);
-     printer->Print(vars_, "const unsigned $lcfullname$__method_indices_by_name[] = {\n");
-     for (int i = 0; i < n_methods; i++) {
-       vars_["i"] = SimpleItoa(mi_array[i].i);
-@@ -258,8 +259,6 @@ void ServiceGenerator::GenerateServiceDescriptor(google::protobuf::io::Printer*
-         "  $lcfullname$__method_indices_by_name\n"
-         "};\n");
-   }
--
--  delete[] mi_array;
- }
- 
- void ServiceGenerator::GenerateCallersImplementations(google::protobuf::io::Printer* printer)
-
-From ebeddac1a746393a16d9ba4cf80e3d12c3ab7d7f Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 20:56:48 -0500
-Subject: [PATCH 07/11] Fix indentation of
- MessageGenerator::GenerateMessageDescriptor()
-
----
- protoc-gen-c/c_message.cc | 321 +++++++++++++++++++-------------------
- 1 file changed, 159 insertions(+), 162 deletions(-)
-
-diff --git a/protoc-gen-c/c_message.cc b/protoc-gen-c/c_message.cc
-index 7252923c..2a3b2a2f 100644
---- a/protoc-gen-c/c_message.cc
-+++ b/protoc-gen-c/c_message.cc
-@@ -461,199 +461,196 @@ GenerateHelperFunctionDefinitions(google::protobuf::io::Printer* printer,
- 
- void MessageGenerator::
- GenerateMessageDescriptor(google::protobuf::io::Printer* printer, bool gen_init) {
--    std::map<std::string, std::string> vars;
--    vars["fullname"] = descriptor_->full_name();
--    vars["classname"] = FullNameToC(descriptor_->full_name(), descriptor_->file());
--    vars["lcclassname"] = FullNameToLower(descriptor_->full_name(), descriptor_->file());
--    vars["shortname"] = ToCamel(descriptor_->name());
--    vars["n_fields"] = SimpleItoa(descriptor_->field_count());
--    vars["packagename"] = descriptor_->file()->package();
--
--    bool optimize_code_size = descriptor_->file()->options().has_optimize_for() &&
--        descriptor_->file()->options().optimize_for() ==
--        google::protobuf::FileOptions_OptimizeMode_CODE_SIZE;
--
--    const ProtobufCMessageOptions opt =
--	    descriptor_->options().GetExtension(pb_c_msg);
--    // Override parent settings, if needed
--    if (opt.has_gen_init_helpers())
--      gen_init = opt.gen_init_helpers();
--
--    for (int i = 0; i < descriptor_->nested_type_count(); i++) {
--      nested_generators_[i]->GenerateMessageDescriptor(printer, gen_init);
--    }
-+  std::map<std::string, std::string> vars;
-+  vars["fullname"] = descriptor_->full_name();
-+  vars["classname"] = FullNameToC(descriptor_->full_name(), descriptor_->file());
-+  vars["lcclassname"] = FullNameToLower(descriptor_->full_name(), descriptor_->file());
-+  vars["shortname"] = ToCamel(descriptor_->name());
-+  vars["n_fields"] = SimpleItoa(descriptor_->field_count());
-+  vars["packagename"] = descriptor_->file()->package();
- 
--    for (int i = 0; i < descriptor_->enum_type_count(); i++) {
--      enum_generators_[i]->GenerateEnumDescriptor(printer);
--    }
-+  bool optimize_code_size = descriptor_->file()->options().has_optimize_for() &&
-+    descriptor_->file()->options().optimize_for() ==
-+      google::protobuf::FileOptions_OptimizeMode_CODE_SIZE;
- 
--    for (int i = 0; i < descriptor_->field_count(); i++) {
--      const google::protobuf::FieldDescriptor* fd = descriptor_->field(i);
--      if (fd->has_default_value()) {
--	field_generators_.get(fd).GenerateDefaultValueImplementations(printer);
--      }
--    }
-+  const ProtobufCMessageOptions opt = descriptor_->options().GetExtension(pb_c_msg);
-+  // Override parent settings, if needed
-+  if (opt.has_gen_init_helpers()) {
-+    gen_init = opt.gen_init_helpers();
-+  }
- 
--    for (int i = 0; i < descriptor_->field_count(); i++) {
--      const google::protobuf::FieldDescriptor* fd = descriptor_->field(i);
--      const ProtobufCFieldOptions opt = fd->options().GetExtension(pb_c_field);
--      if (fd->has_default_value()) {
--
--	bool already_defined = false;
--	vars["name"] = fd->name();
--	vars["lcname"] = CamelToLower(fd->name());
--	vars["maybe_static"] = "static ";
--	vars["field_dv_ctype_suffix"] = "";
--	vars["default_value"] = field_generators_.get(fd).GetDefaultValue();
--	switch (fd->cpp_type()) {
--	case google::protobuf::FieldDescriptor::CPPTYPE_INT32:
--	  vars["field_dv_ctype"] = "int32_t";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_INT64:
--	  vars["field_dv_ctype"] = "int64_t";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_UINT32:
--	  vars["field_dv_ctype"] = "uint32_t";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_UINT64:
--	  vars["field_dv_ctype"] = "uint64_t";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_FLOAT:
--	  vars["field_dv_ctype"] = "float";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_DOUBLE:
--	  vars["field_dv_ctype"] = "double";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_BOOL:
--	  vars["field_dv_ctype"] = "protobuf_c_boolean";
--	  break;
--	  
--	case google::protobuf::FieldDescriptor::CPPTYPE_MESSAGE:
--	  // NOTE: not supported by protobuf
--	  vars["maybe_static"] = "";
--	  vars["field_dv_ctype"] = "{ ... }";
--	  GOOGLE_LOG(FATAL) << "Messages can't have default values!";
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_STRING:
--	  if (fd->type() == google::protobuf::FieldDescriptor::TYPE_BYTES || opt.string_as_bytes())
--	  {
--	    vars["field_dv_ctype"] = "ProtobufCBinaryData";
--	  }
--	  else   /* STRING type */
--	  {
--	    already_defined = true;
--	    vars["maybe_static"] = "";
--	    vars["field_dv_ctype"] = "char";
--	    vars["field_dv_ctype_suffix"] = "[]";
--	  }
--	  break;
--	case google::protobuf::FieldDescriptor::CPPTYPE_ENUM:
--	  {
--	    const google::protobuf::EnumValueDescriptor* vd = fd->default_value_enum();
--	    vars["field_dv_ctype"] = FullNameToC(vd->type()->full_name(), vd->type()->file());
--	    break;
--	  }
--	default:
--	  GOOGLE_LOG(FATAL) << "Unknown CPPTYPE";
--	  break;
--	}
--	if (!already_defined)
--	  printer->Print(vars, "$maybe_static$const $field_dv_ctype$ $lcclassname$__$lcname$__default_value$field_dv_ctype_suffix$ = $default_value$;\n");
--      }
--    }
-+  for (int i = 0; i < descriptor_->nested_type_count(); i++) {
-+    nested_generators_[i]->GenerateMessageDescriptor(printer, gen_init);
-+  }
- 
--    if ( descriptor_->field_count() ) {
--  printer->Print(vars,
--	"static const ProtobufCFieldDescriptor $lcclassname$__field_descriptors[$n_fields$] =\n"
--	"{\n");
--  printer->Indent();
-+  for (int i = 0; i < descriptor_->enum_type_count(); i++) {
-+    enum_generators_[i]->GenerateEnumDescriptor(printer);
-+  }
- 
--  std::vector<const google::protobuf::FieldDescriptor*> sorted_fields;
-   for (int i = 0; i < descriptor_->field_count(); i++) {
--    sorted_fields.push_back(descriptor_->field(i));
--  }
--  qsort(&sorted_fields[0], sorted_fields.size(),
--       sizeof(const google::protobuf::FieldDescriptor*), 
--       compare_pfields_by_number);
--  for (auto field : sorted_fields) {
--    field_generators_.get(field).GenerateDescriptorInitializer(printer);
-+    const google::protobuf::FieldDescriptor* fd = descriptor_->field(i);
-+    if (fd->has_default_value()) {
-+      field_generators_.get(fd).GenerateDefaultValueImplementations(printer);
-+    }
-   }
--  printer->Outdent();
--  printer->Print(vars, "};\n");
- 
--  if (!optimize_code_size) {
--    std::vector<NameIndex> field_indices;
--    for (unsigned i = 0; i < descriptor_->field_count(); i++) {
--      field_indices.push_back({ .index = i, .name = sorted_fields[i]->name() });
-+  for (int i = 0; i < descriptor_->field_count(); i++) {
-+    const google::protobuf::FieldDescriptor* fd = descriptor_->field(i);
-+    const ProtobufCFieldOptions opt = fd->options().GetExtension(pb_c_field);
-+    if (fd->has_default_value()) {
-+      bool already_defined = false;
-+      vars["name"] = fd->name();
-+      vars["lcname"] = CamelToLower(fd->name());
-+      vars["maybe_static"] = "static ";
-+      vars["field_dv_ctype_suffix"] = "";
-+      vars["default_value"] = field_generators_.get(fd).GetDefaultValue();
-+      switch (fd->cpp_type()) {
-+      case google::protobuf::FieldDescriptor::CPPTYPE_INT32:
-+        vars["field_dv_ctype"] = "int32_t";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_INT64:
-+        vars["field_dv_ctype"] = "int64_t";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_UINT32:
-+        vars["field_dv_ctype"] = "uint32_t";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_UINT64:
-+        vars["field_dv_ctype"] = "uint64_t";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_FLOAT:
-+        vars["field_dv_ctype"] = "float";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_DOUBLE:
-+        vars["field_dv_ctype"] = "double";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_BOOL:
-+        vars["field_dv_ctype"] = "protobuf_c_boolean";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_MESSAGE:
-+        // NOTE: not supported by protobuf
-+        vars["maybe_static"] = "";
-+        vars["field_dv_ctype"] = "{ ... }";
-+        GOOGLE_LOG(FATAL) << "Messages can't have default values!";
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_STRING:
-+        if (fd->type() == google::protobuf::FieldDescriptor::TYPE_BYTES || opt.string_as_bytes()) {
-+          vars["field_dv_ctype"] = "ProtobufCBinaryData";
-+        } else {
-+          /* STRING type */
-+          already_defined = true;
-+          vars["maybe_static"] = "";
-+          vars["field_dv_ctype"] = "char";
-+          vars["field_dv_ctype_suffix"] = "[]";
-+        }
-+        break;
-+      case google::protobuf::FieldDescriptor::CPPTYPE_ENUM: {
-+        const google::protobuf::EnumValueDescriptor* vd = fd->default_value_enum();
-+        vars["field_dv_ctype"] = FullNameToC(vd->type()->full_name(), vd->type()->file());
-+        break;
-+      }
-+      default:
-+        GOOGLE_LOG(FATAL) << "Unknown CPPTYPE";
-+        break;
-+      }
-+      if (!already_defined) {
-+        printer->Print(vars, "$maybe_static$const $field_dv_ctype$ $lcclassname$__$lcname$__default_value$field_dv_ctype_suffix$ = $default_value$;\n");
-+      }
-     }
--    qsort(&field_indices[0], field_indices.size(), sizeof(NameIndex),
--        compare_name_indices_by_name);
--    printer->Print(vars, "static const unsigned $lcclassname$__field_indices_by_name[] = {\n");
-+  }
-+
-+  if (descriptor_->field_count()) {
-+    printer->Print(vars,
-+      "static const ProtobufCFieldDescriptor $lcclassname$__field_descriptors[$n_fields$] =\n"
-+      "{\n");
-+    printer->Indent();
-+
-+    std::vector<const google::protobuf::FieldDescriptor*> sorted_fields;
-     for (int i = 0; i < descriptor_->field_count(); i++) {
--      vars["index"] = SimpleItoa(field_indices[i].index);
--      vars["name"] = field_indices[i].name;
--      printer->Print(vars, "  $index$,   /* field[$index$] = $name$ */\n");
-+      sorted_fields.push_back(descriptor_->field(i));
-     }
--    printer->Print("};\n");
--  }
-+    qsort(&sorted_fields[0],
-+          sorted_fields.size(),
-+          sizeof(const google::protobuf::FieldDescriptor*),
-+          compare_pfields_by_number);
-+    for (auto field : sorted_fields) {
-+      field_generators_.get(field).GenerateDescriptorInitializer(printer);
-+    }
-+    printer->Outdent();
-+    printer->Print(vars, "};\n");
- 
--  // create range initializers
--  std::vector<int> values;
--  for (int i = 0; i < descriptor_->field_count(); i++) {
--    values.push_back(sorted_fields[i]->number());
--  }
--  int n_ranges = WriteIntRanges(printer,
--				descriptor_->field_count(), &values[0],
--				vars["lcclassname"] + "__number_ranges");
-+    if (!optimize_code_size) {
-+      std::vector<NameIndex> field_indices;
-+      for (unsigned i = 0; i < descriptor_->field_count(); i++) {
-+        field_indices.push_back({ .index = i, .name = sorted_fields[i]->name() });
-+      }
-+      qsort(&field_indices[0],
-+            field_indices.size(),
-+            sizeof(NameIndex),
-+            compare_name_indices_by_name);
-+      printer->Print(vars, "static const unsigned $lcclassname$__field_indices_by_name[] = {\n");
-+      for (int i = 0; i < descriptor_->field_count(); i++) {
-+        vars["index"] = SimpleItoa(field_indices[i].index);
-+        vars["name"] = field_indices[i].name;
-+        printer->Print(vars, "  $index$,   /* field[$index$] = $name$ */\n");
-+      }
-+      printer->Print("};\n");
-+    }
- 
--  vars["n_ranges"] = SimpleItoa(n_ranges);
--    } else {
--      /* MS compiler can't handle arrays with zero size and empty
--       * initialization list. Furthermore it is an extension of GCC only but
--       * not a standard. */
--      vars["n_ranges"] = "0";
--  printer->Print(vars,
--        "#define $lcclassname$__field_descriptors NULL\n"
--        "#define $lcclassname$__field_indices_by_name NULL\n"
--        "#define $lcclassname$__number_ranges NULL\n");
-+    // create range initializers
-+    std::vector<int> values;
-+    for (int i = 0; i < descriptor_->field_count(); i++) {
-+      values.push_back(sorted_fields[i]->number());
-     }
-+    int n_ranges = WriteIntRanges(printer,
-+                                  descriptor_->field_count(),
-+                                  &values[0],
-+                                  vars["lcclassname"] + "__number_ranges");
-+
-+    vars["n_ranges"] = SimpleItoa(n_ranges);
-+  } else {
-+    /* MS compiler can't handle arrays with zero size and empty
-+     * initialization list. Furthermore it is an extension of GCC only but
-+     * not a standard. */
-+    vars["n_ranges"] = "0";
-+    printer->Print(vars,
-+      "#define $lcclassname$__field_descriptors NULL\n"
-+      "#define $lcclassname$__field_indices_by_name NULL\n"
-+      "#define $lcclassname$__number_ranges NULL\n");
-+  }
- 
-   printer->Print(vars,
--      "const ProtobufCMessageDescriptor $lcclassname$__descriptor =\n"
--      "{\n"
--      "  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,\n");
-+    "const ProtobufCMessageDescriptor $lcclassname$__descriptor =\n"
-+    "{\n"
-+    "  PROTOBUF_C__MESSAGE_DESCRIPTOR_MAGIC,\n");
-   if (optimize_code_size) {
-     printer->Print("  NULL,NULL,NULL,NULL, /* CODE_SIZE */\n");
-   } else {
-     printer->Print(vars,
--        "  \"$fullname$\",\n"
--        "  \"$shortname$\",\n"
--        "  \"$classname$\",\n"
--        "  \"$packagename$\",\n");
-+      "  \"$fullname$\",\n"
-+      "  \"$shortname$\",\n"
-+      "  \"$classname$\",\n"
-+      "  \"$packagename$\",\n");
-   }
-   printer->Print(vars,
--      "  sizeof($classname$),\n"
--      "  $n_fields$,\n"
--      "  $lcclassname$__field_descriptors,\n");
-+    "  sizeof($classname$),\n"
-+    "  $n_fields$,\n"
-+    "  $lcclassname$__field_descriptors,\n");
-   if (optimize_code_size) {
-     printer->Print("  NULL, /* CODE_SIZE */\n");
-   } else {
--    printer->Print(vars,
--        "  $lcclassname$__field_indices_by_name,\n");
-+    printer->Print(vars, "  $lcclassname$__field_indices_by_name,\n");
-   }
-   printer->Print(vars,
--      "  $n_ranges$,"
--      "  $lcclassname$__number_ranges,\n");
-+    "  $n_ranges$,"
-+    "  $lcclassname$__number_ranges,\n");
-   if (gen_init) {
--    printer->Print(vars,
--      "  (ProtobufCMessageInit) $lcclassname$__init,\n");
-+    printer->Print(vars, "  (ProtobufCMessageInit) $lcclassname$__init,\n");
-   } else {
--    printer->Print(vars,
--      "  NULL, /* gen_init_helpers = false */\n");
-+    printer->Print(vars, "  NULL, /* gen_init_helpers = false */\n");
-   }
-   printer->Print(vars,
--      "  NULL,NULL,NULL    /* reserved[123] */\n"
--      "};\n");
-+    "  NULL,NULL,NULL    /* reserved[123] */\n"
-+    "};\n");
- }
- 
- int MessageGenerator::GetOneofUnionOrder(const google::protobuf::FieldDescriptor* fd)
-
-From c59b146aee2d97091ca2adeecd3f2741cb7f0082 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 21:10:37 -0500
-Subject: [PATCH 08/11] compat: Use absl::string_view instead of
- google::protobuf::internal::DescriptorStringView
-
-Even though google::protobuf::internal::DescriptorStringView is exposed
-in public protobuf headers, it's probably not a good idea to rely on an
-"internal" typedef.
-
-According to https://protobuf.dev/news/2024-10-02/#descriptor-apis:
-
-    v30 will update return types in descriptor (such as full_name) to be
-    absl::string_view.
-
-So `absl::string_view` is probably the right type to use here.
----
- protoc-gen-c/compat.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/protoc-gen-c/compat.h b/protoc-gen-c/compat.h
-index fe8041b5..a70cef34 100644
---- a/protoc-gen-c/compat.h
-+++ b/protoc-gen-c/compat.h
-@@ -37,12 +37,16 @@
- # define GOOGLE_LOG		ABSL_LOG
- #endif
- 
-+#if GOOGLE_PROTOBUF_VERSION >= 6030000
-+# include <absl/strings/string_view.h>
-+#endif
-+
- namespace protobuf_c {
- 
- namespace compat {
- 
- #if GOOGLE_PROTOBUF_VERSION >= 6030000
--typedef google::protobuf::internal::DescriptorStringView StringView;
-+typedef absl::string_view StringView;
- #else
- typedef const std::string& StringView;
- #endif
-
-From 9c56038fd9d3cc2552c297457d7a66efe5cbd2c7 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 21:37:30 -0500
-Subject: [PATCH 09/11] Makefile.am: Add compat.h to
- protoc_gen_c_protoc_gen_c_SOURCES
-
----
- Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 77aa9d99..26d19f16 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -102,6 +102,7 @@ protoc_gen_c_protoc_gen_c_SOURCES = \
- 	protoc-gen-c/c_service.h \
- 	protoc-gen-c/c_string_field.cc \
- 	protoc-gen-c/c_string_field.h \
-+	protoc-gen-c/compat.h \
- 	protobuf-c/protobuf-c.pb.cc \
- 	protobuf-c/protobuf-c.pb.h \
- 	protoc-gen-c/main.cc
-
-From 4ebd5cd8238d1f2ac6291b8c8925f34e16ce2123 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 21:38:07 -0500
-Subject: [PATCH 10/11] compat: Conditionalize the include of <string>
-
-It is only needed on older protobuf versions where absl::string_view is
-not being used.
----
- protoc-gen-c/compat.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/protoc-gen-c/compat.h b/protoc-gen-c/compat.h
-index a70cef34..f6ace7cb 100644
---- a/protoc-gen-c/compat.h
-+++ b/protoc-gen-c/compat.h
-@@ -28,8 +28,6 @@
- #ifndef PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
- #define PROTOBUF_C_PROTOC_GEN_C_COMPAT_H__
- 
--#include <string>
--
- #if GOOGLE_PROTOBUF_VERSION >= 4022000
- # define GOOGLE_ARRAYSIZE	ABSL_ARRAYSIZE
- # define GOOGLE_CHECK_EQ	ABSL_CHECK_EQ
-@@ -39,6 +37,8 @@
- 
- #if GOOGLE_PROTOBUF_VERSION >= 6030000
- # include <absl/strings/string_view.h>
-+#else
-+# include <string>
- #endif
- 
- namespace protobuf_c {
-
-From 9a6b35e1e6956fb5cb044910448049b7a5339244 Mon Sep 17 00:00:00 2001
-From: Robert Edmonds <edmonds@users.noreply.github.com>
-Date: Sat, 8 Feb 2025 21:44:42 -0500
-Subject: [PATCH 11/11] Cater to Microsoft Visual C++
-
-Apparently MSVC doesn't support designated initializers for some reason.
----
- protoc-gen-c/c_enum.cc    | 9 ++-------
- protoc-gen-c/c_message.cc | 2 +-
- 2 files changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/protoc-gen-c/c_enum.cc b/protoc-gen-c/c_enum.cc
-index c7839edd..1940ba9d 100644
---- a/protoc-gen-c/c_enum.cc
-+++ b/protoc-gen-c/c_enum.cc
-@@ -195,14 +195,9 @@ void EnumGenerator::GenerateEnumDescriptor(google::protobuf::io::Printer* printe
-   // Sort by name and value, dropping duplicate values if they appear later.
-   // TODO: use a c++ paradigm for this!
-   std::vector<ValueIndex> value_index;
--  for (unsigned j = 0; j < descriptor_->value_count(); j++) {
-+  for (int j = 0; j < descriptor_->value_count(); j++) {
-     const google::protobuf::EnumValueDescriptor *vd = descriptor_->value(j);
--    value_index.push_back({
--      .value = vd->number(),
--      .index = j,
--      .final_index = 0,
--      .name = vd->name(),
--    });
-+    value_index.push_back({ vd->number(), (unsigned)j, 0, vd->name() });
-   }
-   qsort(&value_index[0],
-         value_index.size(),
-diff --git a/protoc-gen-c/c_message.cc b/protoc-gen-c/c_message.cc
-index 2a3b2a2f..94889179 100644
---- a/protoc-gen-c/c_message.cc
-+++ b/protoc-gen-c/c_message.cc
-@@ -581,7 +581,7 @@ GenerateMessageDescriptor(google::protobuf::io::Printer* printer, bool gen_init)
-     if (!optimize_code_size) {
-       std::vector<NameIndex> field_indices;
-       for (unsigned i = 0; i < descriptor_->field_count(); i++) {
--        field_indices.push_back({ .index = i, .name = sorted_fields[i]->name() });
-+        field_indices.push_back({ i, sorted_fields[i]->name() });
-       }
-       qsort(&field_indices[0],
-             field_indices.size(),
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb
similarity index 94%
rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb
index 30c9e19b16..7fe514fe07 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.2.bb
@@ -13,11 +13,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd8de4f63e06b1ccc06e9f8dc5b1aa97"
 DEPENDS = "protobuf-native protobuf"
 
 SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https \
-           file://protobuf-30.patch \
 "
 SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
 
-SRCREV = "185beed28e65494be7505b30c1afeaf199e19b23"
+SRCREV = "4719fdd7760624388c2c5b9d6759eb6a47490626"
 
 
 inherit autotools pkgconfig
-- 
2.34.1


