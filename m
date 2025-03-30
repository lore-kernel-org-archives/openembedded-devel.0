Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0966C36011
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 09:21:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27373.1743326455312519987
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61843d4d18=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U9KT2G020116
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:20:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p7u8ryg4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:20:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpyavNVa8lTZb/lXs51nDb2kRzh0JB8whdw3mWFZVU12YwR+l6+/v9+KM8mtlUlimQbIQFUaqQmVtgVAFF6GdihM1/e42HQxtXID2hbBvdGhfMVA8jhMVbmU3kA46BQQZ48p1h2MHnU0Rv8e5RMlWbS8bA8oBFbx4+xa2mQfm2j3XkOyEuKqs6vAzsrrkbSVFkOPO00PsxQs7FuMYdxFU1Ev5OiRy9CFzqQcc1lZStN/FN4m7ndgG7wxGOJL5ex01DcbLgY4LqeiF9I7K/M5XKm4Naz01w6xLkwWHYNCLZ7dKlOOiyKiyLqyVltt2ibUqO2D1EVtnqdi35vQNjEvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7E6+fiFjMO0MJw8nFDo6FLW2+HpZDQKEl+5F6UEm64=;
 b=s5ht95g6Kk49b+LDwClmCNzFrT22cvEzeSAOlfMthWi6IjcnOnMeebpGmkbdeNQYrPxqAkwE3xg3j/svt4DTbBWKc6f2N3hpMHFBRCB3vJ92rzprtiJLIrs4DN9YS+n8i1XWHVoADj7b/M7NuHBohwetw1Vr0XkF4aNcXCTOSaosP6U8yEGSR+glEFm2BVEuMjPaD5EGlbM38085T4/7zrbmhyMYYtxdt7ApNgdaMPeVfE+Kp1m9/t/tadECRj17O6g6ufwY4Lk5cAqw17Cw+Wp184QqEI2UIcG41MfsLOijjRIzDuoAuU9uU3xUHghGCPJtzAYTFZxmbbrQE5xTaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 09:20:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 09:20:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] mbedtls: upgrade 2.28.9 -> 2.28.10
Date: Sun, 30 Mar 2025 17:20:39 +0800
Message-Id: <20250330092040.1267913-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250330092040.1267913-1-yi.zhao@windriver.com>
References: <20250330092040.1267913-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b710957-f0f5-46c2-0894-08dd6f6c2ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8TeAtTNV/p6U8W8iY/zBwCoqhyXpH3XBKbBLS9+DC4UKf5P8rCgKwk9dGv0s?=
 =?us-ascii?Q?t3m52MIU76cwzz8KotWoJ8tuDaQU0FA5k2BG0F8TLsaYoTBiKlh4pm3NR4D2?=
 =?us-ascii?Q?1zAwe0wnDWUh/cIGUPMMjpHi+DtwuUlXvMMnR0nfw6s1m18HEQJ8FMU+Agah?=
 =?us-ascii?Q?bURbezp6Ff7ZpwQscvOIF/LIZ28gECERuyjzTsjFOhBlNPPCrQCA7MVxpNiB?=
 =?us-ascii?Q?QmdVoA/6ohQJFYVXivz7yk7Uh6uhJnLXu1LsU2KHvw4XeX9GiUbMXAgF6vdd?=
 =?us-ascii?Q?jywMrNnU1FT4nNZ33i4OT3h4I4quZxxCEckklqULNJ2Bs/iJ+VOutrjoEL0D?=
 =?us-ascii?Q?TxeyyTqIgRGCKhl2PC7HY2yHhRvD340C5gjEK0fRIgge6PfPbBGrdH12vtil?=
 =?us-ascii?Q?xGUC8rmu25QahkwoKKmX/jBtXiunvVChdL3AzJWK62SpV6wX6fIcpDcuQfg8?=
 =?us-ascii?Q?gRAxH1pFRXNTb8EujXwlR5TuBbD1F3zoSrsNl6Zo2x0r+QI5pvXV6IMZzZeO?=
 =?us-ascii?Q?riwQd+IVdnQfrrJGc6B7sJmc5Zim0c+ETuVLavRn1yrwLffufbUeupExVKey?=
 =?us-ascii?Q?xpC9RMAo5mR1JJhs35DgQLt1VnO1f5Q3TSHaP+0L40ZyT+jDRxQZnSoj/Zse?=
 =?us-ascii?Q?NcQ4xYzWK7BXm0kSanO3aHWIok1JidTs+j2k4iNBGvWRU3lKLZB1ptcIvpyE?=
 =?us-ascii?Q?SrOtFUHOF2PPeChvavm+OFqOh47z+rjmQUGHjSPPtfA+mZbKI+1aqX3Rv8yz?=
 =?us-ascii?Q?6wr20z9Eb2evDQyQOSk1ctlGea4Ps0Ru5OXmoj1+kJ0RnOoPc7q9xCIelHtb?=
 =?us-ascii?Q?IdpG3FaCwCR6+6AzrhgxG2PjcYgaUOP09ZF4p/kzifT0tvDfOp2WExHyK6gb?=
 =?us-ascii?Q?LWZ8dvaa/Nf2GBpkyfArfnP+carGRtWpBC6dQhqngAatS7hYnn7cyp1ol8pw?=
 =?us-ascii?Q?z6vpu89R6TScNgLiFFcfT8t1iIrEGdPlp4lMiNuwinhr2MMctmGKQQjxKo8O?=
 =?us-ascii?Q?86R2/RVZX50xeZzyZzvz7sNJ4cFjsIH9TcrAlsNnit/xSELd3g5nZuOo4vC/?=
 =?us-ascii?Q?Pnk791X9d97eT7/THDIRrsxRaCuqpRZ6SuiXU0jmAP5G3dMIJppdxz2JTCm6?=
 =?us-ascii?Q?daTb+Hk1HJGIVsDub8MM4tzRnd/Q5WbvQVgFLa9Yrp1kenZeZdAZ4UhJWycH?=
 =?us-ascii?Q?mqMtf/+yWfvPFjWKDhACykvxY9qzXCB9vrazxkBvOM21gU+mPxz1N4SscAkO?=
 =?us-ascii?Q?KMtMxxo46agFOJb/WRun0X7jFEOQe5B7AwBTqnwFdIMMg9ccSBN/o+EUOTJc?=
 =?us-ascii?Q?gBiWR5uqjElQmdoNkXIB4uNK73ZG3QkJDixh4iUa2+mUReSQeUJ1RnjNSdGd?=
 =?us-ascii?Q?agv1+H+Uehs79tMkvOfENBFmHEQZOfWVBaNFReVBUbvw5vlAp8pAeNCQcl/6?=
 =?us-ascii?Q?H3w2HZYeA41XRTo0M/8a7kO9KQb0YTP0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1WmmlllTRIvcCSt59DYvCI4ox8wj5ssaX7Ura5PmdNQB2ZD8xi8sej/U2nvT?=
 =?us-ascii?Q?UIWfrelGa8rHUmkYqz0aOj2grl8vFSxH24NRVvHqDo1WbM/BWeZmAlCR9z7Z?=
 =?us-ascii?Q?2FeEsLuJWnP2t5kt8HmvsO3BdmMFZjSfdfzq3WLdmjr3uN/QOMzAr6YFIUoH?=
 =?us-ascii?Q?xt8QboeA3IG/W7AEIOdqEsfjJdI0enNxmOn1fCe8CmDK3ifcWoz8KBcfIodZ?=
 =?us-ascii?Q?z8aRLB1+ltkcTB1EzX2YBfAV5GmURZRmt/bJD9zdEnf81oT/zrzqR2QYAM6s?=
 =?us-ascii?Q?3X4L6l3KkXnQX70xxvIPFpuyp/yfWFEv+KTpWT+s1H/c47fGjmRJUHctjJGD?=
 =?us-ascii?Q?rnw5575lUwPkiWuaXUpaWYhT2LziZ1vFUD0Zo9ODOPdy5ae6j8SUhCfvcfhq?=
 =?us-ascii?Q?8RYVliChzJXNChawl6UvBytrGJkyKlGBxqeZeEHICNJBx7kE+i7mIeq4q9S+?=
 =?us-ascii?Q?vFyhXzuvd2DYA5iXUpTyiJ1Md3KCOS+gVcI5FvvDqgdJfLsEQL3q8tP6qqU4?=
 =?us-ascii?Q?9aM819jGUGs1bx4adOBR5ST/IQW0w4qgeaDgb6V/U92H3fBlDK1029mIBZu8?=
 =?us-ascii?Q?qrPHqQlJvCCifCnpP9jcFvCuWSGfCPlPEo3uffQpK0dkPcpZ1tDj7RJJu0Mb?=
 =?us-ascii?Q?mieYCN+CsmEvD3aTpOKQbkeCCvn9INebjG1rBf7P1+4myj1/RQUpG1fcScyK?=
 =?us-ascii?Q?WM1hvZCOPKKg2coEoGXr5Mv6NCP15/eOK72Ze00pZ3grYHOsr2iYytXhAR/x?=
 =?us-ascii?Q?mVBBAvHbtsrZBskWWGPNC2rcYCXN9uAgeVjzmCHvg3CqTHn5NaK56BghElHm?=
 =?us-ascii?Q?p0jeZrIeiXXEt3y79VoGbTA9QVsIFgxRj5bgYwVsWLCjHM0QQzLtcxQtjkxg?=
 =?us-ascii?Q?VN6hE1tS1gt+uekQ/tkMuXbE9lv+sNG/D4G9qJNE0Q271HUqRpz4+Fq+iYzE?=
 =?us-ascii?Q?MB5zzzYggy0e/mh1Jc8XvoSoEjR+F1BEnXc0hDjBD3b0CeCtCynVAMUsbnQG?=
 =?us-ascii?Q?ZqIeHam3+A0VoWL4l6OdzpLgxtzM/YhSxdxTo8iK08G8VzAEEbnNUWhat/5Q?=
 =?us-ascii?Q?A5q8PpZK36e98EmGWsgdYQGHPqQ0Pk1OmAM4/og1BlGUUtUb2EcKKLQa6Gzo?=
 =?us-ascii?Q?H5tVfZ7s5ryg4CATVCcLo7niBuyY96K/tlO5AFHE0q5sJd+2T4Hh/AaZ9CoQ?=
 =?us-ascii?Q?GAblkqR/p9o7OVyFh2Nh1MGPz7h5ftIezHJBESN7pHHGNSWsPVGFXft2AQTI?=
 =?us-ascii?Q?OVT+PLwtHhZxIWz7DJJ8+r50kkePuWXqv+15TIkrKS7VHkY2ZvRodV45B8/u?=
 =?us-ascii?Q?YKA/d09Tz9mqSDUsNEJ6N+xNiBPPnzwbXSqz0pR64VsMtwDKAAm+9wsGK98J?=
 =?us-ascii?Q?TJX0k+Qi7/+b/Ede5d4eiht5sCQyZ+pk2NWQ+zWAe3oYnLxKWA9aLIOk56H1?=
 =?us-ascii?Q?nqMIGge2W9WBwNwTrZ052Z/nZ1/r+tK3mRiBowkjd664MzwbeHkWe6vGocWq?=
 =?us-ascii?Q?n2vFAS5kbfltD+WO9C3TVdHuU1hn9Gl1Y8jPlcq1bhI+FYolmI7+YolUhyf8?=
 =?us-ascii?Q?ogWRPsDJjmqT/w0CIo/zHQwnseTufERCCjRUi0+N?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b710957-f0f5-46c2-0894-08dd6f6c2ae5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 09:20:52.6920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8MHY1sb0vLRt7/HI9hAU0HPeIXtPbxI7yAmPHtgZ1Hov7+dBtibiL/j9kufckqbGzS6j8IpEuuEbhDRWpsidw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-Proofpoint-GUID: BB9sqCMmyCZMZotaU3qA-B29GD2Oc0F2
X-Proofpoint-ORIG-GUID: BB9sqCMmyCZMZotaU3qA-B29GD2Oc0F2
X-Authority-Analysis: v=2.4 cv=RNizH5i+ c=1 sm=1 tr=0 ts=67e90cf6 cx=c_pps a=G0EMd8eUBd5ElxF49Cdl+w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=zgmhBoBMWke2EkbEFD8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503300064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 09:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116377

ChangeLog
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index abb5ad2442..b6938b2991 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
+SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
 SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-2.28 \
            file://run-ptest \
           "
-- 
2.34.1


