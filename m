Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908B6C36007
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:00:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20499.1742562021489225598
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5175c14ca8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAo2cP015434
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:00:21 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrd1ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2kVO/yb10YTeBkjqTDQfLqNDXJ2WA7S1vIa6t/rAlGb2J0aQGZexFQ1BbT4qMct4raCpUwuQfbZW7zEyB4BrtqkXr3Da5EplsGSYfKQe/aH57jJfXRqmmrpP2NjojULx4r62tRCJ2x/m5dluUhjuTA9UXAH2NiBEc/zr5uwsAXtbdsheUwYKKiCTOtkByQ9VupVFNZlpMPrZTJSHoVe1loAbAiDWBM2TqNxdbjH/tYqEkwezHCpoC20iOb3qtxBw/m0fCRswrAKJhOfrSW8KbskM+kMEr5LxB9lxdJypqL1jlJriPMkRSpAfO2oBQOnPIDLnhzgr9ZO1HtIFiAHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIFkUijeJ7HYq2jKDv+Q/DapHhdswl6903o/PeLLqO8=;
 b=e2x0e9Bdnh0urPM/eU9VkOImZZF9sofPnFMqX81+jPxU2kipMik0ytGJjHeBlHp/m/9vBcRi4aRUC+DShp57N85FuWoCd0CdgCdSDQfcf8p4kiFbX1RPIwORbCVez039btd0wUfUa+4a8z0fLiY66p5JhoV1N69uhTN3Hr6wPELCa7GYf7ZkoTQwZVkjrJivGalZCfn1582LCmXNm8ybkm76YUCgMB/TQRskZs2fYsOaLF/ZhMJXbXF3WLKx5oh8dxIjk3V/cyM1vqBkNZ/sORo585XxCw09kKsWbaD1vIHncbUyjhs0Snu0SMdWV+wdWxtgtADoGUYtcZ8NcwQ84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Fri, 21 Mar 2025 13:00:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 13:00:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] strongswan: upgrade 6.0.0 -> 6.0.1
Date: Fri, 21 Mar 2025 20:59:58 +0800
Message-Id: <20250321130000.667251-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::24)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: cfca13e3-f078-4850-ed83-08dd6878545b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WjJtGtLgJhRXr0P6ckKYC8JYImmR4isKqyPj/2WhpJPQdwNxmwn5Xmq2hkqy?=
 =?us-ascii?Q?cd5sC8q5pt+cjSzKJyRo1tL+lG0BHmSuyocD5Az3SL/OaESdfg38PhjSeAEF?=
 =?us-ascii?Q?RZX5+Y/PWPONXVKLXSu8DND52yHhbcEl5XGsxzT4DEqNaGls57Z6ctZvgnr4?=
 =?us-ascii?Q?nY3Xt45NjDxRpzjv89UQu5aBEt1tDfiIxqRoUXnZyZZWflRl2xry2srJi4Fh?=
 =?us-ascii?Q?HU02/ir6dq7Zyq7JggwHMksOST6VMYqAm0s6jLpkdWVbvaXzi1tul3ZahdLU?=
 =?us-ascii?Q?3MrCu6Vf4pQiVg3dzHEbD3XkfgKhMkZaVcJqBH2y1nEprspJOd2jGU9aznwg?=
 =?us-ascii?Q?8nm6tol7Ufllz3N1IXMC7HTBCyWZX2kqPL2aU9/SP5aU8OMVFpwAz0Za0hJS?=
 =?us-ascii?Q?WZ/XFBiferfGc8CEzGcfJcxxUYVSUMfRyP/34rnL7qIbVHjDo7UQ0J1z0x+8?=
 =?us-ascii?Q?bKdVOrvO7dFWkonsAg64ntaqheTpaMvjCFMnNaxuI5BV1CYxVFFDZl9iQF56?=
 =?us-ascii?Q?RFitRIJWTYrcmuV0fI+NHs352fmEXbnHI0H+lz04+hE58fXmsFzs1US5PVif?=
 =?us-ascii?Q?i0QK+jWafDfuekUMjC52OF8NrDrrrJiaDUMyX6OQhvqFha23KGEE9va+2jdV?=
 =?us-ascii?Q?uevQI50+xqq3TxQwlZVIFkoIuch5lr1KpqXcgT6/HIRgdSucmf+DwoVQL1RZ?=
 =?us-ascii?Q?05E66+AW3FGKrC/jof2CahC4Yudaw/xPj+gPEheNZhDeOZp7Jase8PHkg7HV?=
 =?us-ascii?Q?py5nx96XIGiTJBdP9wafrGtlhJgExTL4H7kCSDFrBPGi6QKl9OXAqQr5CBXY?=
 =?us-ascii?Q?lC6FFZLgQuS051UYRUsY6/hzI//QbTOB5h79i98/FgAzbNO8QKGpWuvBbqqh?=
 =?us-ascii?Q?vojSUebip8nlSuKLuQIFz5uZsBSh5TVQbL/so31WP54XfhWuQQ9wxMc/gXOG?=
 =?us-ascii?Q?pf0ehjhs4PdpKgEk1DRuWixVXUpjjWyK7ATtir2I8bPSEq9BGHVWo+8JssGz?=
 =?us-ascii?Q?ehfku7QytkShWNNbv9KfoyxXzyOwSd+9dy+biSjUCD1SQY3Z2fG2a5jlXtxR?=
 =?us-ascii?Q?/czBRf03sa6u8+5M54Lq+hE8T8ZNEW8kRmnMSbzgLOCwsEBO4mN9Y1UMS0Vp?=
 =?us-ascii?Q?LWyzjJf3MI4z0xkMAHOcGSL6ZQR9+DC9AVdhqB9z1+fJwV/s0+tDZrtMu6uE?=
 =?us-ascii?Q?joo68I/tRN15aw1szvm+cBr7NLd/TE6QcqMFz1Zh8dzO9cfZkHWwVZt6M9rY?=
 =?us-ascii?Q?eOxSTA/kpY0bl8gzd2AoSLbyjXcsMqhaFwe3kqKEBp2UEES1FwX4VysVInTX?=
 =?us-ascii?Q?Z2mbLTQzKu7a8dMR316pgGBHF5xRSJW4kXPtt6qHKeE/sk9RpEg5tKNXQ4+5?=
 =?us-ascii?Q?yKwpqoUNhUWwObX99NgLvGf+9kJ6b6Nj7rtoHO2o7kX7QrBoaw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m+kVbftJGnF1TQBTiZg4qerVdRhc3aJkgVpr91v+VE5DO+hwshyrzRNV1Q3X?=
 =?us-ascii?Q?W+lzCtwzwER2eAfBPMTuttV8r9+5JnBFQtzXBlXSlEC7ktcKmKn3bMvYpsnx?=
 =?us-ascii?Q?VLDQqCR+jcdNSpGx0tw+35eGG6ZiuapNamiow6pS1KLCMs47kVTZjGC34D3G?=
 =?us-ascii?Q?3ZB5i1KRewp58E5ULnhmLaWCTNZLo4B1oLsunLPza24nrslVNEcxF5xbVCm0?=
 =?us-ascii?Q?CwiBdD0fQgX+UqYFHYlH+FTrvDcUQmQP8m5hMbcrbWuFY/E9KkjS5WHoiC5X?=
 =?us-ascii?Q?/6dAJyH0JyCMbgjCuS4PRDILwjKtt4OH0qVJD+Xc+5NPPxZl26Y/lqEQs62Z?=
 =?us-ascii?Q?/AWP2axLtyoGZXxPSZ1F3UDsGVKpV4WzvcYH/pO+AmEgTDfR7V9mfVR34oFm?=
 =?us-ascii?Q?2SF0VSzHV3u+f6Iz86fB9ZZwOEm0Cn9LtUds0lS7cVh929waN57WUUvj+nm9?=
 =?us-ascii?Q?3SSQvz9XXXQiBNBOymcEYe6h9coHiO4VF54AAbwYa1eD60/aed1M4LnmNzOP?=
 =?us-ascii?Q?l4T9nJqrD8+I82xhRNMdbs67MbrNQMN6LnmPcRha95tbkw8uY4FmED6qOPSr?=
 =?us-ascii?Q?Tg6S/20F8z+6hFpyNTuTZrwLeJidWc/740XQFVoQDxvtZe0t0NsJFFC0gSnQ?=
 =?us-ascii?Q?y8rq+AC3J2j3f8rmyHaEvq3sq53GoIi/yDX3QhPHTzTvNDfcT7euGWSpWzrU?=
 =?us-ascii?Q?hut3l1mGQfbAEuhBFJZgIdoNNfNMflKqXPOBoA4wVAy6VR15kNCQf1mjLL+R?=
 =?us-ascii?Q?b8mOCJvm2AdyIG+3M+AzebDce1aO+Z/oJHhMjU2BPSwe+LAOfL7ypvqrI2G1?=
 =?us-ascii?Q?TZ9/XjAmlYXlRawm9P5k9mSM/5693bPfgJpJ79YwFwzx6kkcVHQhoKuhbpWG?=
 =?us-ascii?Q?RnBkpkbtUehFPfgkCGOSizmFoAA7RAEJrECrs5XkhdYvM5PqUEfVXtOJ79rq?=
 =?us-ascii?Q?oDpxnDf3bpPXfBIZHX/OllXi/tj7aUYLIWN0iit3owQCtK+Af0o4OUz+O5dB?=
 =?us-ascii?Q?jJhWDV98z8Fozzjl5dZqpQSMFHEwmBYyIYivnMhVWQC1MEvHhBuNUO3zSUON?=
 =?us-ascii?Q?PsxAN4z5YNbYJj+PSPUd2/MeuU7uVQm5/n8sydJEDf9pq+V+83J2YTAvvJZr?=
 =?us-ascii?Q?8ByGQsD9rGfxuaxrjgGLExBjUiMkzf9U+fiDlDM3xewG41ZxbUXoEEhLtfEa?=
 =?us-ascii?Q?LNmf1J9yZ6xaGMCB3r2L8ag/cVAUm7bbB9pm0alePhj/zaTqs4clGMDKH1rS?=
 =?us-ascii?Q?Y48egKeM/ZgBlf6qVlgwYeyfsFI1tfave5o0ypgYsDMkLCndZXr2e9CM0PoV?=
 =?us-ascii?Q?xaWIE1dsb58W8PxBZIu4qtLcrJHoRCSGl1zpjFwWvpwCuJlQcMgSCZrS6vs5?=
 =?us-ascii?Q?CNO0bl7Rpd4u3MWkilRXQn13Lj15jLxLH964+aFBkMe2m3ZJCmI/26P7WUNi?=
 =?us-ascii?Q?1fN9rgvXOC5vbik/PM59AWbQmWkud8kfzTt6iq+omh1pVZ4L5rPY9A3zAYoM?=
 =?us-ascii?Q?rmHm46+e/b8dr43/lfpGev1WYOQRev0bxvF1QllPcEFPEuqtrpeM2YewYY19?=
 =?us-ascii?Q?fSNVSA9WahHxCPQIwr7qvjCupCdHqOu8Od5LYzt1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfca13e3-f078-4850-ed83-08dd6878545b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:00:18.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAbD1ensBwknPJbVC3+wCexNNjlPY4alvPujbYNR/0evbA/fYxJgB0PS9s8ofRG2615bEYWtC+Id1+KE5WT85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dd62e5 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=KiMCiSwjAAAA:8 a=t7CeM3EgAAAA:8 a=zNXjhLrgNjjuMfKTFokA:9 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cf3fS-ikRVev63bHinURfPCzSDc6w-Ws
X-Proofpoint-ORIG-GUID: cf3fS-ikRVev63bHinURfPCzSDc6w-Ws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 13:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116184

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/6.0.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_6.0.0.bb => strongswan_6.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.0.bb => strongswan_6.0.1.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.0.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.0.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
index 5cf456990b..9baf219cea 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "72fe58b7523155703b65b08c3cc559c2c9a5c96da54afebd8136f6623e7dda82"
+SRC_URI[sha256sum] = "212368cbc674fed31f3292210303fff06da8b90acad2d1387375ed855e6879c4"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


