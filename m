Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3247C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 06:14:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16536.1709273662366205312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 22:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FXjguRVy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3790b160fd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4214VgJ2003856
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Mar 2024 06:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Su2cDQSczu2YTwW00O
	n79lAskOBbjcJ3GVdMZJoNLVo=; b=FXjguRVywhSfW63jWtHdp4vQZZ4ZiR0KmZ
	/kgaf2h0G52NjATDvDbop465DoyN1JBuOWQyKN6JVXf7y/u90YyX5xnwzRxHIDrP
	kUGG1Njn2p60JLfRUIFErPFJEW70y9X4PHFbS1yZq4S7D71MKdcuDkWuajC+agF4
	wbYmJhCsy933DMijg6/ob1H5F6inoa9k1OPAgS1rfnQreh1pG+8pc7jxMlD/GuwG
	YDUHc320btTKPsvJATBHy9Ppf7xUBWOmN+6fhruU8hGQfUFVVDwiEEf4h4LiJkxe
	jTtXYGe19EVXVOBPOQaO86ja9Z+3SKwVkxhOOH3pJ7kyD1BdH+cw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf5nx6bxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:14:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9rSrOBy4teBzwFvJyouQIlb55DPmuvdA1Vshp7HkK6HB8Fyl5ZZCRvi4ExGHwZRUrx14ZTpjD1U44YV+k3A2fPDBjDbw3O6EXRiiy6rI0SkTQEGogF8jj1/bs6y+lg0pUQHY8CJoAz4y8J95Qe0dAPMU5zh2tpkfdz/z0DX9RLQZU7E6i8JxHrB5lKAM5zqnLNQzxZxCiQBJ+FHWv5777ahupIzhGgzeBSX0mQFqPg4Z5cOG1MGLFDoe+/JzZ3y4Pe1jOXrhLLTW/8zI1vjG4Te7DXMuh2CIGs+x1nPeukyQz9fNpU+gGPSVBzs0cPskaF30KwIa+GN9bXp079lkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su2cDQSczu2YTwW00On79lAskOBbjcJ3GVdMZJoNLVo=;
 b=obrrBLry49aL0KnD4mpmy6GYbCopcyzlCaryRRe4EVRK04e65kqsEcZBkWtcPUL5Z9m/o0AokuGC7s79yNl+nn+yegzYFHBZHHPZ22WGFIMwKqu8Vv2PkazR4eq3G61IzZLrMB/Cg7iFM/gpBwGXRkLoSKy/+/3LGDwXALbGg6oI+xyQ7Yt8AibDdft0+v3sJPgK3j2YxijBGZ/Iqxd6S0ii/lIgEXvo4jmAdKHj7WGhXgtpLZfvnQj1kJhwcec22xl60xhbSCHbF05VoDdqc1EbAZ2go1vrD+shSh/d7sCujohX0o8Ch4DzRpeoRIXJ7AvBd1oFNsOIojwcZ/MA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.16; Fri, 1 Mar
 2024 06:14:18 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%5]) with mapi id 15.20.7339.024; Fri, 1 Mar 2024
 06:14:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] cryptsetup: upgrade 2.6.1 -> 2.7.0
Date: Fri,  1 Mar 2024 14:14:06 +0800
Message-Id: <20240301061407.1769771-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DS7PR11MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: b347d9a2-784d-4352-f4fd-08dc39b6d39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DLirm2ek/ihyy50wWrIWwH1JUjNjxCLUjJAyNd1qtWEU9nQpynq2xdulnVyFuHa7DBoniAgC1qEA5ekfC01bofnZQnTApVv/t/lj+pwLi93GS8jz8xzTwdqlpxiywLJF0KKXSnVcIrDm3A5qOPP7dOveOMvyiVj938w0wPsiDZmh4Q4ezd6opRH57dxeS0eDp/VFWW4aBX2z80aQfWSaPmUnwhUZzJkUtvHzxz4tTIV92CnUU+40ck1xiPPZoJAJYm11Gl/dTyk+eq0sSqmoSECeMGmhHxkNyFKIiQAONnr9845akxsS0zSNAMTys1120hNVsbIFKwN89m0HdMafDmjR3i75nmnshYq3iGpCYwuffIKB/8FV7MNcswXxHNY9yPKw51Ifp/WiZ1vwCtz6m8treRT2z6v+Jnkv6ZeDhfa8vxcODzG3u8sECct+0D7DbvpqVHV3/NE5Iv5RHx+LbvZWidgzpBiAyRdNHgJLoo93aIl4M4/E5Be+EvPb107wek/gSfVthmQTAjCc8+hRrybbuWPJN38zoAhwsYuKpdrxOTUkWYkDhsTSk7H8syAaC4y22g7LNedBlFVd0wa/dlIoIcHnBkzz2tUz3hWdf/OB2Pv/Y60O7FcxNajx1vjdOMHETpSX71GzfzZZtjtJdJwxI2jU01QOjXNl8uLsbow=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DbWuuNoxqHS9NpOqDofVteUyNLAHIVJouUnCVOnRhdnrd6szmDsbbgMZVUDQ?=
 =?us-ascii?Q?DilqNyuC7wSqSf6slOuU/Tvyy7MV/8tVNqZBfc7sZQnFV3dm3Vz0zIIgUs7A?=
 =?us-ascii?Q?M5UTVLEkhGI8VZ5nQW2ZrYAwEZEoUG9V3FVzW16Mwko300y4p/GcK4DdC2aT?=
 =?us-ascii?Q?uiniph11b+6RiTkrAorenU4BSz1mTdZmr79n/Atgnl7VOeZ/lHm8e1C3CZwq?=
 =?us-ascii?Q?EdKkRz4HyQsspYqdFtys3asCaEfw4851k+QODJoOEvSvR7JR4rFghJJHM8Ll?=
 =?us-ascii?Q?qtB5yJuwY5Ye7DdnptLiwInH38g/eFqG3iXYUubcOJZ/JLlJ/SP8EgE7L7wG?=
 =?us-ascii?Q?rDOc05UNmSr5+/Ekqs7qt/evrcUU3CgfMUmgwmGuAsfZfNDsf+QTenW6ZgVE?=
 =?us-ascii?Q?/AEJUqvhAcS60CdOzoXKWTho6KnQSWEQpJ7CHEoVeteAEvmorRDLZRRKm/r+?=
 =?us-ascii?Q?j/ivBPKCldLHIGcd2Ajw9sOJnWl56jozIjkxAxX6WirP51elTbY3V9f+/W5b?=
 =?us-ascii?Q?3AaBTEKeYUYX7R1C/TEogp5NRWCdRdsd2Dpm+Y9Z2cFsu1vlPzhY6Yr7B3uH?=
 =?us-ascii?Q?PQFSOTqV9RSR/0zydrHzHVM8+k7XIyvCnKoHaY7ICa0TF+kR6eI+RPDN9x2m?=
 =?us-ascii?Q?e4JgDfxftC+ImNhDqm/0iArlLXkE3UlE3tqe96Y7PVfgoJF3792KLnt59PUa?=
 =?us-ascii?Q?YHGg8XtCLuqeb9JjtxjoJoj62msxM9bNQIYCQhBw66nNaKe/KjdqZ1sL9Svv?=
 =?us-ascii?Q?qk/z5MIE4lymvDyaiBZfXtXcndzxs2P69FGxFXRRysCeXYgiaw6AsiKvNGHS?=
 =?us-ascii?Q?0T6TqCsHO16PncYw7tc3CHXtHw0aeZG0OQ3o4hEMz5kg8eK6AGVTXxKE1uR0?=
 =?us-ascii?Q?R/M6gkW6kevxiLmQUKI1DZd+Lnha9DxH0ipuQgrpckO+r7NB0bA16m0wZpC1?=
 =?us-ascii?Q?YzFgqFDjYs1s5bgd8Ff7ZVL6Ze8QxaA+yknZzO7yXDPVK1X8X9Ovax/+WapM?=
 =?us-ascii?Q?H+MiV9RkW/69fG5Vlr8Fcznb+DbKOHppqGjNu8Gqk0r0LC+x4U7kN+53DtiB?=
 =?us-ascii?Q?SjpXqk7yCYd31p4DvgraqhM2Pbq3RGS6Z6HwImvl2W9UP16wguZpBy9Mjjyj?=
 =?us-ascii?Q?fSHX+m7/6Dicl/07gP/yZiUK77ECXlUMkANtkzXUGk/Q9W1oUsEaDF7Ix6/t?=
 =?us-ascii?Q?1wNOuIq7HOA7u28+C1YJwi1wmcz+8cyAXZ6Ng8SFPs1EZ+Cl3sLSrk+CzOh4?=
 =?us-ascii?Q?rroPtpViG6sBl/nQ65ev9ftR+FjSAcghllPYgSKhfzASwFRfBSVfTQB/W9BW?=
 =?us-ascii?Q?Jdr12ekzeP1HYvYFmgN9Z1gfggxzkS2Y75yJyq12LMcamRET0idh9zXUxeIC?=
 =?us-ascii?Q?6i4SzgF/MhG6tfAh7WKkE9dqW8kFxD/0FW9ufXTOkUWmtwuy6xFunJzRfAPY?=
 =?us-ascii?Q?DXiDE9JOW3s2SQybGGRUPFph5dILo+7GCEsAzCKV5vA8u8QcagzqMu4EYkcn?=
 =?us-ascii?Q?ljonAufGHjIfNyzQlFFoBK4Erc3Koh+mfh95ckKcPMkWumMENw7nz3KOxakr?=
 =?us-ascii?Q?Ge4AZTmEv9PBtDnDlbYYi2lDn8nUpKXLusxtR6bI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b347d9a2-784d-4352-f4fd-08dc39b6d39a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 06:14:18.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X/F5KBZnQtJMOOdnezclBi7/ldaR4E3jeAQ9fOji7NXnRGShJiLLnQX5XaRKaLU82olPqsEF3wwyJEAiAzoQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
X-Proofpoint-GUID: 5kvxsvJvgjj9o38CYYVhgM2UWzN1XwdA
X-Proofpoint-ORIG-GUID: 5kvxsvJvgjj9o38CYYVhgM2UWzN1XwdA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_03,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 06:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109067

Release Notes:
https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/v2.7.0-ReleaseNotes

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.6.1.bb => cryptsetup_2.7.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.6.1.bb => cryptsetup_2.7.0.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
index 293522140..c5e84b1f0 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.0.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "410ded65a1072ab9c8e41added37b9729c087fef4d2db02bb4ef529ad6da4693"
+SRC_URI[sha256sum] = "94003a00cd5a81944f45e8dc529e0cfd2a6ff629bd2cd21cf5e574e465daf795"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


