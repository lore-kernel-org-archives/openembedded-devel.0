Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB81CD11DF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 10:27:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5506.1711448825818865529
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 03:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=emgBbjyX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3815e3f0c2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42Q6WUWD012344
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 03:27:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=zQFaBNyltUQL5mxCrt
	UIrOwbCpfPVZmsKd0scDRbWJI=; b=emgBbjyXG3IcMvy3RzdkFCDcIP5O30Sb1r
	ZEXTuaadOEVECyhXDj6l2zKAEo51JSLD0MNmqw0PFexLkcXDgfAvLxoWcsSD54ir
	uj7H67rwmu6S0NR1McRoJj8L/tiCrraS0LrZLDzrscxdLpQgWakxd84+rN+rqmzO
	DNW/NETFKhb6pGuLsaRlkJa7IDSmxhv9Bp6LGlJ6w8Fwb8Eh7s09ZRkZz58kppqs
	ui6XyQC+1wPdverO+WQpVeYdSFmk7MpeUq3lvL1kDKCr++v9B+t+1UZ8UUfZx5+q
	fiDqASbnQAq7yOmF18W9moeAyg7Y28EGh6tJR+4sF2KxGQFmIm6A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgu97d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 03:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELYDv/q5aJLz5gxSe4rbXliA+rRoRhpE48lEwKKGPhaENOpPbshpB6zNwdZSYw6OyW7oG68nXsfXbKn/nRByDlkNM83swZQyYQCLpQrloF/BEPfzNKYuC1ByaFE83A9Jv3PsKCLIAQZXBWiaV16Qa3v91yfexJ1qJswcGCNdDyXEmugUfFwReR3b3hSQzCcl2ByQP9Zt3JBjOnVx/LDLAUUIl8Bzftp6kTu5GvgTia7lRk+jM3qu2/IDjU2IfcxHKWyX2wi+tzPjD3aR4fo6ylsbyRbEeX5ijLDPiJfbCaZ1KJWYehO/f/xZXPo7UNkESJbKLFgMxb9He0omvZCkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQFaBNyltUQL5mxCrtUIrOwbCpfPVZmsKd0scDRbWJI=;
 b=bdNVO2lp1uUWyur3tY5arbAu/QyZu2DoMLQ/tOGdToWYwkJaPPBm+SnSjWlrrlfHXkeirq10sHl0zSgIyhjUanlNfa5dH9+IH5C3CbwKaO12w/JD/TEyCc0M0K1NnpFdsVvFO1tIvbRtgRGvVm/q9xZKOLGHCJ/0qGb0k1jxzg9Zv9friVGwGyZIxyIlgPJR1mdR6EtW19uSpbN1bULWcMLrJABUWD/f11ZSL8PS0yQyzV8+UewVc/AOi4SjhFmLRSSoq72cj6KN7R6rnqgAUOruP9URg4Mz4ll3TOXvX0uBKJ951YsMdeXDcdUqtBPI9OSbB/wEr/Dl3VCFYKbATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB7379.namprd11.prod.outlook.com (2603:10b6:208:431::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 10:27:02 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:27:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 5.9.13 -> 5.9.14
Date: Tue, 26 Mar 2024 18:26:50 +0800
Message-Id: <20240326102650.681780-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA0PR11MB7379:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3/LxADDM4Qy982yr9Ql+lUYxPW7bxwJjmwSPxj4mgmuvy8PmetmeI7c2qh5yflVnx2HVL/hAwdK2opmub8mKo92/M9jctAQpJwKbsGtZuQ0BqBjy/OHZzh8fT41Tb7TWQrrs5haTG9EHG3gtfr3zPXb4qGczOoodAsWWK6T+qXa7kHnUiEMoCtQUv6/m4+2tOsyJdNdPYy7yqTVY+vlnRyI0+7kVEzcHDtWRmpeoH2DZ4IU2+1pvTJDrwdbH5jvY9SSKivVON5xfQvyt70i3DeI8ysWwg45knGJNOVUqjdz5kn4g+fb7d+W8aEWHwe0ELj/ouqTb+af0xEryTBc46Ot/ptBJ+Rr+3yrDwy0samf6PZTWsYBnXQVRZi5aUy/1eUcLjaViw6xLIVENp6Qb/mXdWlA9gc/0o4FQeAn5u4evQ5QrFfRPOSSsKlWBDd8zj0ZRhvl44FWO8XBuF/IopcvR1W/4W89YExZ6ixCUxrjNIq9Oi9xzCrQ/hpen7C7Vyeqp1wBzZSEzRLmvlqYHpvtOzbYeHWUYkEN8EecwD4higTQmMNiIshTxl934vNuO7v/QF4SbQAikqtBu28+BVXnAe1bG55XoMgXE+Z1/ADm+JmzA676XP0HH8nDt5fOpY67D1RNdGrZsMHtvWuWakr6tGyMthCGxE9RYCNGk1kM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XQ3qBqyfzUHnrQPGiUcuUdTyqBfM0OiBgk3Q3+ins9bU7NVT18jXuzIU/4NU?=
 =?us-ascii?Q?HEeUIr+IOREo+S6VLlW29CM4H45xcA1T7x10hSRdLuQhUZofmFpWiYok/HBq?=
 =?us-ascii?Q?Ps6sSx+PergJT3m/o9Mv508ocggUzQz0taZP0wSuPJrTQC5SWe7/FeCDgiPW?=
 =?us-ascii?Q?YsjXOtmAnhLwRNmqW2j6y7FZt+2J3LYDd/H7OHPtm8vnRBJnG62zPPTugQDB?=
 =?us-ascii?Q?3KIFg/R7P0XHDGVGy3EcKhdX7k8zOl+iau6Wv84PmhiVg4LPMfoGLanerTkd?=
 =?us-ascii?Q?BKg/yZVJi7d0wpjZyfgT4b+zG0yA4mY35o0sef7WCq/reAcaOWl1W37M15WW?=
 =?us-ascii?Q?Raxt3k5FXpKAyCPpyt9t8NWAFdj4w4rLB0Nha2WXIDhjcpaKHCBnqy0leW0V?=
 =?us-ascii?Q?BIP+J638sRGnmGLQd8sd5vPIjYi+xz3Iw5l4Stq+FxKmwm8perrpJD98KHE5?=
 =?us-ascii?Q?Mjo/rqcPEEVCgCUYaO3FHcsl4hQ4/qs8cZC5/asnbwdxZYRHmdRJ9MWARjaC?=
 =?us-ascii?Q?qpD5P//6NOA6js/Em2ncSuGDq9CggrKub3mymuYjHiG5KSlbPmtZDN21RiOs?=
 =?us-ascii?Q?VpoZNG4p70ZzOwn1GZkwyBhlFnyeqTmFlm1OdiHQLJGgUm97NMyq4JgcfyNm?=
 =?us-ascii?Q?nCRe9wxef3cpLfSBrsYG8WXMbOadMPev3H1Jg9glohLu8/FNUpZLvt5jAHpE?=
 =?us-ascii?Q?EDCUhKVMt96/FR6/dn4MM4dYsXIuXZe9SJ2RKU0UdZEQCMqheYUh+atK4sXS?=
 =?us-ascii?Q?oUAnndPAOsZrJ7selkv8OCMzQ/QDBSIkefE6jVuIpTJDDAE+lzT5D18Tjqrp?=
 =?us-ascii?Q?5KZMqD1S4E3Hh97/fw+PvwnfgZbpEi+JTPvq2MebZT8aFVgkN8qagzwU2bwZ?=
 =?us-ascii?Q?xSjE4oVPYDMp3Q+hFhY8S3A8m0xIJEuyIFz9l8arN1c0zGVpLorZTsGIH6GD?=
 =?us-ascii?Q?S+GGpQ1BXl7L4xt4yJQDb97CDywl0cwQuomnsID8t8LsBIu4eXli8+wQHju1?=
 =?us-ascii?Q?NEQHWPLKDMF4YnvzYut7U/zrBcCkhEPXKEM31hrfLBwk/bZv14VEHlTLD0tO?=
 =?us-ascii?Q?o1ApfC7TslS5KUpALoonU51yOCG9k6MfWj5dTKwQRy4G4z6rGvMO4TRqfJi4?=
 =?us-ascii?Q?baNUnUqhsMPrPIWSi/mkrMLE6A/tXKV2hCtKl/pA0uuK9y99il+ybMiGeqfi?=
 =?us-ascii?Q?gnQwg2pJyrDzX+9TLjdhrzQXQYWBgrS5sb/Yj2H1W0uYPsJAOUKK+y5OcDdu?=
 =?us-ascii?Q?BLdfvZOnUI856R5eTcy7NflK1XlMps52y9Wmo+Xb6BQAMNF3yWMmvOeZtgu0?=
 =?us-ascii?Q?u1HsivX2q67b1IiAt3QECEu5XSpVUYmODMVuEmaJ5z9G7G8nHWmZf9rX7L/F?=
 =?us-ascii?Q?tKN6AZlXHbzrOBE3ikn79Sf0xLZOgdF++Z3Qv2yF+QG9STVSBl+Bb8gBBm5n?=
 =?us-ascii?Q?YphIixAcnEQ4iGuXY/v3I1GJEvhdWw/arjqj7OmgDyqjpDaeZsENQC/Iucpv?=
 =?us-ascii?Q?X39zxfvg+I6pUB6q3DBtw3w5M15t1otKafcxUvEboTv+VsGeDSnbu4I2CVG0?=
 =?us-ascii?Q?ybWzyhGpUUcibL6mYScNJyHSUJmNJx1dj+MqISku?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490ac278-c817-49f3-e41f-08dc4d7f4695
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:27:02.3471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/LMlnWCJIjAc2qZ+Je7xEancUdGF9jTvgizpiNygWR3yhDHIA4a0OwJrM4q2PSvzuuC+8W8r1s/LGfVfoP17Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
X-Proofpoint-ORIG-GUID: TCvxhR7YQhCThr7yE-yVZCfyCmhuUOmh
X-Proofpoint-GUID: TCvxhR7YQhCThr7yE-yVZCfyCmhuUOmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 10:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109621

ChangeLog:
https://github.com/strongswan/strongswan/releases/tag/5.9.14

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_5.9.13.bb => strongswan_5.9.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.13.bb => strongswan_5.9.14.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 4523187af..2e2da8274 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
+SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


