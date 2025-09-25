Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105D2CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 01:24:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1087.1758763441017252067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 18:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B8URbHbs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1363312c24=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58OMmg1N1578278
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9bzwN0AWnG1qCAL9QuLd
	V0txTNmOJl6JtRAk5jyBZS4=; b=B8URbHbs2P1N4NGfOu2RzlnILhEkk6V6fIbU
	6uCY0FmtHRV/RnNqvED5sQYPlTFBl4WgRu3coayKGNTs2uJpwNKriOfZHHxsFRlG
	br4/xauomxG1fAFQhYOwR/x7Twff2yIXwRXd4TtFvt3ijqWyRSorONebaHjdS/tL
	5eoNH+VsKzE6uoSLN8NSJRfu9X8169U9+lZh7xGu2guK04bssVKTwJMJ/BuGjF17
	ztsxapt5k+si+ECgdcNPXzFgvLTYhgBDNozia8X6NyHx7y78H7cXQVLnirB64i38
	NM1OpADpVEROA1/afE1edkBbuG4ad/gMLPvK0UOdXNywflDiiw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89dnpc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:23:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktOY0L1WybRWqU+eesCFZziGFJ1zUBYmDt8eQDtnbZKRzXydSGhUJI9/SJTUDxtidxH3g4rP33o+gRpQ/bn0N9mZsgFxTv+f4/N35lLQeSJtnSIg1EVi3/cRi9MXLSFUX5GlCfdY8zz6n0av3N+sSwZecC/b7hrZCNyM8IHD4hL+o1Nx7Ff89TIKcbFsMKSJxljmrb3rsHc8WqBBFGfDfbVRvRSN0JNH+O8T6vQxULg/0Om1kwBkKdqhP9m6sH3pjnrcRg+nbl95sWdKdfBmedOdvUc1+llrkNBW3lYtXRWaTMsCJcSuUD8O3snKXlgMBZHF2FJDYFGahmbFkwNOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bzwN0AWnG1qCAL9QuLdV0txTNmOJl6JtRAk5jyBZS4=;
 b=R+hMjJeHrR81c6zfPc0Pyp+EwfQF1z5YW1fuhqHxYK80qnL/O+6gzMlVt5/lr4WYKQewEl/J8CvUofhgZcGjwXsKkyM02HhobhPJ/Ua0bN3QC3BipwVdayBYqNMoxpurF0+bCyW64i+Lp8RfphpAvItUvOO5idtBX4bT666fS/AMhKMpDbz0b3qu5WuahxfKUyvu/1McLOgmbYDDEzd+4vJ2NiPPzHQFY+syGRwsW+Tw3dvg9qTJl+yVPyYIwB8bzITcZXgpE9MSY9xCEdgUZ7+NxeTYu5KQ/xN+YZFLsIkmKvy83DLlCLOBq7ecIkCtUOqWlMMJjHwwHpxxpw7bSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 01:23:57 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:23:57 +0000
From: libo.chen.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] python3-gpt-image: Add native and nativesdk targets to the build
Date: Thu, 25 Sep 2025 09:22:54 +0800
Message-Id: <20250925012254.1171382-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 00596e48-691c-4df5-b8cb-08ddfbd232ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ihSv3Z7CmOtpo5iYMyDyBCKpYIjxgVV1vVsgSXRMPAN7LaJ0PNoIbpQWNp5X?=
 =?us-ascii?Q?mgnZz0X7BKGmdxsiKH96Aa7CxjE6UVtBOfvBHqJb7rHj7KtZ1RuUE/zsBMh9?=
 =?us-ascii?Q?sGzg5woYUe/07iRberbxZ4KMYJuBB/G8wAx4MUK5Dd5Aoqr+l6PROCHoTVaU?=
 =?us-ascii?Q?hYsHzHunbigchPXcQk1aTOZvCBn6weU9fjZzSIjaWIxIFVw17aazX6+9Fxgq?=
 =?us-ascii?Q?xoMyy6sjphldYXhKfmZQnN5O9MgJRqMRVw4aFgC0hiSXLb9FAD2UzmPE18Uc?=
 =?us-ascii?Q?5yJVNTKRez6DZ0BxSg2oTgDwOED+30UE7zeGkSzFdmyF/5hr51tjPr/0ZTzE?=
 =?us-ascii?Q?cbkuHr4ciMKDjbrRmz3KidWhdRfV9lWHWNYt8wTwftJnWRbZFLECAtEx6Cxo?=
 =?us-ascii?Q?U3pz1rZGSzMQovukqmeFaMWKPw1Yc5j2BaXbVYRlu6T4TxTA2CJzRoaAZAa4?=
 =?us-ascii?Q?0UtF+JPT8CJIM0+VHjrfyYYYXrAioXUOnFcBLesPMvHJj49si1fUrsKv68p8?=
 =?us-ascii?Q?C34UwFI5aJvKlqpYYE6nltAecnTie+DPSFfzK3cMRbNdInhMRS9xNXU7Y5RB?=
 =?us-ascii?Q?E/vNIvuoh3cg7/SsrYgWv/lh4KwJ0rVLZnGSONWoQELfMXGPImYOCreKeht4?=
 =?us-ascii?Q?Zx6cVHzROzor8wWACcdoLwx00SppJdL2uJo7PSsBKGg17zIly9Vi8xtBzCSs?=
 =?us-ascii?Q?5qu/aWxjXc86i6dS41DoVl4qzZ76BKJUtPUhygnyrNizWJmbVmWDWi6hKzr8?=
 =?us-ascii?Q?fya7vWvH6PG7IeAnabUNmLTPjrnTMRO1E0YHJ0bC8cz9YoR2bLBcCRN1GAwU?=
 =?us-ascii?Q?sF1innioQlghTjq8UoW2NaHF0qfyP97UxfMfJD5WCixce7KbStVfHKDGKufe?=
 =?us-ascii?Q?qRFUHLBvz/etPf6sH+T1gDNLMNyuBgNY27xtX9XZ7vw4n1Wyp2C7L1Xa/vOw?=
 =?us-ascii?Q?I21qLnJj2bGkpKT36Q6+Ks1ui+Qxjnthw0VUCdWdFjRB36xYcdFxIWrPA8YM?=
 =?us-ascii?Q?f2kg89EVDdaK2KqS+t7/auaCjRNhOAmEUjZBZZkuJVD66Fmfr33BQo72A/DL?=
 =?us-ascii?Q?OJ11i8oeeWGuTvPJ9SVc4hsEPrMOsvt+qiKOw0bjI8S7Z0+7w6UO07k3uZ67?=
 =?us-ascii?Q?pm5UlJ6hrin0LbJECxiDCU8GltfTo2PNF6Xbj4L/apolbVOARWXyfU4c9Wa6?=
 =?us-ascii?Q?SY1AnpSdmDWBkkt9rfGKOUKcVABq5qy035u8SU1if4JM3V1KK+yCE+9Dr8B8?=
 =?us-ascii?Q?MTIFSmu2vjcHNlB1jEyK9aMK1Y+46LLHaBHwlwz01Vuewxj/yucfNHEA/YfR?=
 =?us-ascii?Q?cVZrQNClVvkhlKWzpManS4h5p/+/RzwGSApuWQoyAXb7Om59cT16fCwSmgL1?=
 =?us-ascii?Q?3GaXFLGp5vbmQ3wK0IDbelnsD0ma6WvjJa5UtZHuLBTA6RyY8h+iTjQ0qqdb?=
 =?us-ascii?Q?cDb2PozEHV62qHM5H6KD12qpcWKMQsEq+ddb6Kpl+BlHZEUZdXzucQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zvtBJ8bUNHeH+nqGSUHB41yDKnQPcpwURszpo40sG1dZGdarz2DMnFjXUlEj?=
 =?us-ascii?Q?1hAyuUXeZl5U/2R263I63YU9a5fImKjNkR39reLKqofQ+ZBKLWY7Szqy5Cmb?=
 =?us-ascii?Q?DAsnwDrBRZBi/APCMtZVv5MaipD3hwdTYr4VXEyGLHKljhJTIYm1l04y47/n?=
 =?us-ascii?Q?dY7+f7mUEIaYv/qEDSEQ5/voUibNeXqxdg520Ac1NFvfXtg/fD7pmrvFDFtM?=
 =?us-ascii?Q?K2kg7OWut2yI/ZDtJMSFcc3VUAOteOLtSYhLAk8hN9BtAa8mSd1PZuP30wvI?=
 =?us-ascii?Q?GaLg2EJNn1Ed8GjoydSNnPRKPjlcEFfHToLUBjj8guUbrEH2T6HRyAcFEu8K?=
 =?us-ascii?Q?CCkpiyQGoYRiVZNAnc2MV5FjbfNNWBvXve2OjZIwYvHNNFGlwqj1vFgONIaX?=
 =?us-ascii?Q?Z37hozh3hXZgSFfgkTH/btH232zR5SIF9/uxCDY7CPOD23+9XyvDQ0NYBXcE?=
 =?us-ascii?Q?USKc2Y7UobwG06BoQAqVa2ZwC3i0Q8Nb4GynDiq8uiqdN644QObBwTMptD7K?=
 =?us-ascii?Q?RcOrDImPodrmjOFIGfyydSaxDMKIfjL4AI44+FXBc09So7JAhnv50nQENEE7?=
 =?us-ascii?Q?en5PjW0sz9sBEqY0ys3VJb0oi0VIAugsr8i7VtRUG81xW8bR7Y3OZWF+Ne5q?=
 =?us-ascii?Q?YgTKsCaUt6itx5WIiE1fC/b3FfT+O0gtEdTHBJ8mEUJ4wZcG+27mUy2bZZBM?=
 =?us-ascii?Q?IdZmDvnKyEMXSRnuFlZw2IZmiqFa+R4giEeMkuuKv+UFrcxN2fO5TW0qRUE4?=
 =?us-ascii?Q?oUj32yH/G/j8HPTVNxZ4Oc+NE6NSkBgaPHWz8OUh3/uEoeXVl72xQI3wlqzu?=
 =?us-ascii?Q?0VUX8Q9YCWokN8nztVN6UNVldLN404HFq1FowNBVa2RUKlo+q7hx/dcI7gSi?=
 =?us-ascii?Q?RFHZAU0V8GJmtI36TEoLrT/tK4B+9bWTObdbEU1NaWHTAsq51ooYMiidXw16?=
 =?us-ascii?Q?9R2225lYGCefhYjkewJ/znjCbp8SzUZMKWM28tkWe7XOp/7Yn7Y1PyVHl/Gv?=
 =?us-ascii?Q?MAn332TMrgT5M0ALIpTXGXXi7yoeR7Qihj4ggc6ht7S60tdCsAFqrSPh+jTK?=
 =?us-ascii?Q?qWg21ToJsPKniIsKLjr1LFMTmCGQ9WEvJW6ip9gRIHeBpOrI1fOfzlItv1n6?=
 =?us-ascii?Q?aNqubG5KlSDHQkg0bVfH1Ciz8xA7mKXZV7mNlAgg/c7KewIF3bCuyerR0B0v?=
 =?us-ascii?Q?fi5GyiuXN16d//ktRqImr14KAx9jBY9msz7ycr36gX8qvohRT04+SiNAE8NA?=
 =?us-ascii?Q?t/11t+AeN4B4EfSzBm/goCAdKbqq1WYP/ctaeC8qT7PInlQ46UuYBGAZf1oZ?=
 =?us-ascii?Q?M5G5FvUS+IE9/SXlWUcPyB6/hLW3k4XktOBehO9B12BcVEg7v/P2zf1YulE+?=
 =?us-ascii?Q?SdehhrESDuqNgpdJpxLI56enZzsFeedsGf9fdFEzXQOjANQQd6sl/cKB0oIc?=
 =?us-ascii?Q?GSXcPWO7sxy95+eTTrgViZok8OJZBe3NTyX7+RdptUdmEUNtWLLcaKUfM9Uz?=
 =?us-ascii?Q?JZdv+jEUZYKtVjJe7rZ0L+nDKFqW4yj+vvoN7gveHO9iFs39yFF113IAtNtv?=
 =?us-ascii?Q?AfoV8tcLpJfkgJg1M/oQi9yRCwf1Y96bDUDQDgzyrttqaH/HLHn7MdXSie9m?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00596e48-691c-4df5-b8cb-08ddfbd232ec
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 01:23:57.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+fE7oktle2LgDHBpEXIHFFw4AaEwTO8d//L0+S4aTheEgCbGDZWHcV3FhCbTEOGYGHOUKzBNTYX018jGVvpsazXsr2dX0OQOSwbfwVXeoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDAxMSBTYWx0ZWRfX5ji5d0V6L6Fa
 4UDzPMoVGE8vMwriQAfXoaKocpxnxVLGNDvyeSkzXReWdiK7tBQU8Eonrq4AKUY3sUD0pvmIp0S
 YbQNk4g5lB5k1gs9P5FncksvzMYj6a9V3IuFkSACVa1wJ7PTUGLjv0jLXLLzwpyjeeyQr6HmKmx
 qv4BzHYi7TYEsm3xOuFM78v30lP9gWRy7B2lS94WmzclgwBf0ayWYA4KtEfM1DNM06/fyJ13zsb
 R7MymDbMEDLbOgfG/cospXR1Cc2ZU/6rOn6qhcbXDOeiahAWHtjhRr3tMAfqi3cQFcbL+Md9tt6
 PkQvTpreFXFHTzmtshdGSvmKOYto8Kcqkkx+SRutwPbzdfJZaTYVlCID54N/uI=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d499af cx=c_pps
 a=0Qqeoa/8LQ4SOC89qm8Uhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=o5XQBxLYwCjhJeqb2ncA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8TNJRzYUSg8vKAjtM3aAPXopDgUkR4XC
X-Proofpoint-ORIG-GUID: 8TNJRzYUSg8vKAjtM3aAPXopDgUkR4XC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 01:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119846

From: Libo Chen <libo.chen.cn@windriver.com>

Add the native and nativesdk to the recipe.

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../python3-gpt-image/python3-gpt-image_0.9.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
index 01e8091f6f..13743174b4 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
@@ -28,3 +28,5 @@ RDEPENDS:${PN}-ptest += " \
 do_install:append() {
 	rm -fr ${D}${libdir}/python*/site-packages/gpt-image/__pycache__
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


