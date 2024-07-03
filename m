Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B44C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 08:49:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46726.1719996573312670396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7914ac32be=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4636o58c031059
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Jul 2024 01:49:33 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402hsg3cyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 01:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhF1T4PjZXgi+8wt9/D5qoKlDqs5TPdUWzDDy7N+YZP+uksTZAypQgfBgS6atY/YVWhwbs5WgmozDuGrLA2GCqSq+kyG+E6SY4P+OqNsSdAWygQ61h+eQ647XhMBTe8BVEu4EUD1K6EG9QScBwd+kqZzjBtvidIznl65/ONSrqFj+i/00Uy9cJhV4WUBC97ES/+/1w7Af6JsjGt4mrcwkI80HpA94WKvDeXk9xsI2yRfxMTOKBWt+djivIX58nh4AO9ksNY+F9s4/W+o6G21VhGVl/a79g5QHQj/0spDbHbI7Y9zg0jLg9Wh2E2aaOZPYCySIQt/O1OaqdivyxogEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlIlop/uvNKVZRAzNRyh6cNFiv+UG34LVi1Xk7tFNDY=;
 b=YaqTPyD8ueTc7BRZT8zpJHfVKl/5IHP44QKJA8AFRZBv5/B/OTJAZmlUG6Q1n2HD7cclst6U53mbJsCI6jRsnFe+gxN4/lKZKqrtc38GE8WWH10kCdDcknRZrv+lU4za5RMkycDaUz1ax36TbRYElcRv+ZmfMHyIOV/m+MRBF161BJtCRvsFFVoRn1J+mNcUt/iiCYCG9s5cLaLqLn7kjkEleGpUWPca8TJFYai51iBE+qsvQso8oAajywKHtZSNrbuFvodNQydlpSNVMEOASJw/mrEbJjCjc7gQGVbT2zkm2GVDqOBDFWTt7a3vcnbvGVjMzJqKeK2vfvIWZgiUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.23; Wed, 3 Jul 2024 08:49:31 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 08:49:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] packagegroup-xfce-extended: fix typo of gobject-introspection-data feature
Date: Wed,  3 Jul 2024 16:49:19 +0800
Message-Id: <20240703084919.2696189-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH0PR11MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd57c86-552e-414c-f8fd-08dc9b3d0df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sDx3bKlYEbbrrwuiiKiVWUddVq0dojmzUvG+hEZvbVJCGu7pY+swhA8yaFAb?=
 =?us-ascii?Q?7IPa2+xOxEqFfH9Mr3BAu7zCG9yAws2KQ4ijHdA+9Dttik85S4mLPI+w6aCo?=
 =?us-ascii?Q?mVCHpqfkSr0x14oB3bq+zkJxAdZhheJF6/xKXxj07EMfaXgvR5ETmwyAocoT?=
 =?us-ascii?Q?h1LQHLbgNY9nFOMYDb6BFcn53v8h7dDupbiQWxNmptsAfHpR8nJDo8BPqV05?=
 =?us-ascii?Q?6y2TmGCgb34igjlE0jUsN9n1lOjz/1xnjlhtCLSFvrcpD509KSpifMdxge+S?=
 =?us-ascii?Q?+pbrdRsPkqO5Ej0PiNtGQceLuCd+DrJ2BQqhNvIMtXbbKzXPBW8puumQYsGt?=
 =?us-ascii?Q?VmJh9zBHr/LFtkYVxufsU0vawfb7dBzWU5oZs4Pi2KPSp0xAJ07K764csk73?=
 =?us-ascii?Q?dtSfDKd13gnBYmcFYiTsjzQ3LZcFLgfApEaT4QkdBmn5nROtno89ylvft8o/?=
 =?us-ascii?Q?07cmD5gpfof5KZ+5KJLKocr1WpDc38z5LyWhtsdmrFieq/YIFBaUrudYGRT3?=
 =?us-ascii?Q?CoaooXv2U8Ztrs+p96XEN+OHTfNmugA2bUe+FQqPmj+YpXCh955Psae7NcH6?=
 =?us-ascii?Q?mdjJ7JZUCrA7MAiH8sTScm42VfixavfSInkFtpEFxY5iTQwZyZzRzjhMr0OB?=
 =?us-ascii?Q?8pVMDmxxrpfN6QrQtAQN82zRjpB7UOgSqs8PO8iQlzy4SQayETUYVvGwKWHj?=
 =?us-ascii?Q?u1sqPynjh/Hmr3FwYngKJVuXpbdUzKEpy4uAO+uL9nR6j/a4FmhDZagOcgBb?=
 =?us-ascii?Q?L0Y4KFYNk1mHr4VQZRbUicm7aGyzeCCk1nQJ9MUvv8mwFRvMD9lPWsfKlCdF?=
 =?us-ascii?Q?/kmW2tDVLEEXJI+lSnfeGIudNbgYeJ3tIzY+LFNxVzn67dKDHmP6TR7GjrfT?=
 =?us-ascii?Q?asBQqu1OgjscALmH3mqZXcS47tmo5bhufMv0KA+l8VSDcp57h102V3j0XZ/K?=
 =?us-ascii?Q?XgLfkdEZRJqiTGpls4fCv5ntdl5ISDAxYLt6PViz6PhgnEwKYVbBG3PF7aJm?=
 =?us-ascii?Q?oU1hsUj56NMz4AUaNTFY3QHbx3mA8STegmyePVZMMX8Z+nd016Tzgb01Q3wO?=
 =?us-ascii?Q?t+3Hycbzt4B4BHD42SDKlosc5L2RgZvJbgkjJPodFuVctuAZ/4/sbSUK2okv?=
 =?us-ascii?Q?ZkeshVvU3shn/v1Nk7bYM8ijzcisjTRsFwmRU5AIE5RynzjkVcEJF6lxUlCp?=
 =?us-ascii?Q?tdCKWzgRR9Vx6m9DeqVxui7nEoaCNBnYts63dxAjfGYnAOTqdskar0I3TJC7?=
 =?us-ascii?Q?nXJTqtbA3+7cF2uCJJiG8iOT8aHfDwZLRoUV679PDrmSRfYkXjXAKowj64d8?=
 =?us-ascii?Q?DjS4fLaZE4P06f61Z83v7QE10yHDTmd+0oSChtmbATxR84KOlWCAjjstRgFb?=
 =?us-ascii?Q?uhDQFrFe2HQMbtrygZUNc02qm/vsb0ClIQKLqqr1WaeDiYBKNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BPVsjjvig1oxtErJlFFCKgn4G4gR52rmfdCBQexyHnlQg1Ead9HTNxitMB5S?=
 =?us-ascii?Q?5SaL+vVqojqc1Rjo/6zqwfEjhBlgXz8X1h2ZvRAZKAhWn9vbSLrttSKej2yL?=
 =?us-ascii?Q?oyk8Yvws48gaiOOUmnaUF6rffPt/NuKjNGO6c1zOUm8Odnp6+DKXd73KFmq4?=
 =?us-ascii?Q?EQoavfbTCqxNUYaIac2YvtdD4/yzy8mP4zsR5RuZ9i5e7sLe4GwKJfRUac1s?=
 =?us-ascii?Q?a4A2dGEwN82JIaPUvFdxrk+/L3YwYPkK2Q92sjqlJZesWyYYpewKFn2EZBgA?=
 =?us-ascii?Q?1QVwU8eVZifBuPpAYVZVo+QDGi3/iz5ZI1N7yd9Gqxc6SnqO3jZpOqdFHKrr?=
 =?us-ascii?Q?TFHsdXCbRyPhQ135tneasNhx5BvJvmQepHy4Bg2yxVeyeCiuQduEto8GY45i?=
 =?us-ascii?Q?0NxX09wc5hF5MENSsp2KCCatZqQs+TuPXsFR54HsTZYx+j8+CUgDbEvHL8xn?=
 =?us-ascii?Q?7+SYrNz19tAS4zjBpKsQ24jv8R4QXpu4c5eJRXIJ3JAxsZd/on9fITpkwHvd?=
 =?us-ascii?Q?FRWSdbz/bmcaNYqD7JQNLehB6YeJAJ4DNngHQVTONlbfT/O9aEyA9GCOB8Cv?=
 =?us-ascii?Q?bqV2cpnYNGYZQgGSht2AQnHsjYMKok8njFI5onlN+cxbY+wVVDw5DBoP1+nl?=
 =?us-ascii?Q?t2G5mNAHJjMufKCdCL4MHDEc2ssSJoc0n+Vviu06MIYfujYwO75PU3TYoti9?=
 =?us-ascii?Q?s8HDjC7P2gjfAs7VuR2YdWUqXsPe4zdIH/ybx3kSxIT6NYqkq4PFN7K89ed/?=
 =?us-ascii?Q?Pg6k97AyIhC4fc9/rnCqHakOfyQ7soBt9XNwsvwx+G+F+IId9J7Rg2hweuP3?=
 =?us-ascii?Q?mmJQG213u7SaGJJ3YIg/+Nj1JU+oRzBgKEx+2Z+VoJljk7xSDE6Np23Rr7f/?=
 =?us-ascii?Q?003JG87XnYmS30ORZRghLVMloI5e2lHdjmYowMhDJY+XxFK39nwsiSIM1IZO?=
 =?us-ascii?Q?e/dfvMOKFwu92YTERLue5yK3ZGxeplsORLeDCv33q3u+CkRki5G1fzmf+mHm?=
 =?us-ascii?Q?Eledr6RSS2NlgRa9VKANDIntyrrMDQp+vMxbh1q9ZXbw9kikW3mcrl6XxyLd?=
 =?us-ascii?Q?fApKVUSLv4Sux5RDhhwM9ZGibc894L1EdFM0pzMu8E9eNzsECVN/Dh3ekdS2?=
 =?us-ascii?Q?5CXKOC39EP501WwhJHXB6ZEtpiesb6e6H0yBRp0gbt8r/ri6yeUf+7ugzMJ/?=
 =?us-ascii?Q?vgG2je+SRCWPLTs1rroRtP/H5g+/HUUVNDGJLCiJMcpWeY+zs7JkiUTAutaG?=
 =?us-ascii?Q?Kn3fIWs/aK39aTMsewJSLmgyehPJKu7g7i8jmACAHKBn0nicLy7dUwNINCBP?=
 =?us-ascii?Q?c4xI8aDHlYo/JiAZ1rrvZxI1rrUz8SQuT4TfypsnavKSRn6QEIIsA6u8vwTg?=
 =?us-ascii?Q?McFN599kq6cNH6S+hIfHw/y6/wyWe6Bub/4kA1QiSj6srzUuCMPteLGkdhjN?=
 =?us-ascii?Q?qmUHFeu0y+r9S9dNngL3OGiBL6uRQBjfM9mMTkqdofB8NiPmwFDFLcmo0RfD?=
 =?us-ascii?Q?QZJzXCFr3OyhGK7T/0TDVBnmZswkr/Yuw/UOCOyTMfLRj87RmeaOp/ZsbR4C?=
 =?us-ascii?Q?hDmKplPZvM3llZ88RLQ/uNVx8kv7dVaOBg0dRaH+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd57c86-552e-414c-f8fd-08dc9b3d0df5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 08:49:31.2281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bRGLsu9ZgCwRaWmOrwj1PtZLMxQQdCKH1b4zHe1jRC8DNNR7cu+ZgsHTGDkzYGLWXnhBnHEjP+uTEIZ5Zzcsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
X-Proofpoint-GUID: HZ_Srf_rhqE7qhOtEL1A3vazh5sLwdSv
X-Proofpoint-ORIG-GUID: HZ_Srf_rhqE7qhOtEL1A3vazh5sLwdSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=997 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 08:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111222

Fix typo: gobject-introspection -> gobject-introspection-data

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index f2e04f793..500719a8f 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -49,7 +49,7 @@ RRECOMMENDS:${PN} = " \
     xfce4-verve-plugin \
     \
     ${@bb.utils.contains('DISTRO_FEATURES','polkit','xfce-polkit','',d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth gobject-introspection", "blueman", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth gobject-introspection-data", "blueman", "", d)} \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
2.25.1


