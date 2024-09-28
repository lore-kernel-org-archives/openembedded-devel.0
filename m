Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7710CF6493
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:34:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10481.1727516052409120177
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YBxL002547
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889j8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDRPiuY/YjcFTGWCx5UY4IQPVWZn4QcZloplwG7YXbioLnhAU6BjiqdLWzn0tm82L5Jlfw5Bp5fPWs0ALbe+MNF7OGSJ6+n2XcTgj/lQerW8jrVN8mFyR8Tz8i4DGIhtsRehYXhD7gw4v4KjHcF8TTdhAMGLUMpIxj2rEroCkom4Ojoax3hvLyuRNRpSXSEX5Cv/Npvya6WVjvVlOomXz8hk6CarKh0iXXVPEJQo4TTqclKopVGYBWL5rMWvLuzfH9EYxilYb3+6yoaA4ZEfFjeh/XOYAtIBhRFmbmE+R+RInmklcSAijcYPN/iRdK+nb/EymO+aIFHIBccrSdU9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVvMqCf3chyPyLNd2gi7nBl/t9vNw2Hgp/EMb2CvUfI=;
 b=kTllQM8KUSlR2LBf0muckj1il0nFFXm5NNSKyx2ERvWTEoDd78a85Fa2DkB/VNm8luZzyAXnvTKOt3Gti2xb8iliMovLK92cYI/pVN7PJZA3kh6Q9gpUQBwIzwI58CTnHNPoD5QWWYBeQFQ199TNmWvJNprQphqpxuO6z3eDFw2rwbdzSSKxzkxnArINRfS7TYscgCmCCz6xvsuwzmUqwiuf0/fub10ZN9O6Pd+c/uFcmILeCtBICh7DzKXEKHOZv6jNfsb3ENsL+zJb52lzyf8N031k5Vz4+B7Zex/ah7w+vO0RA84/j3G1HXZLx05PBVYyq4g73b4Y7fx7f1c+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Sat, 28 Sep
 2024 09:34:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:34:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/6] ipmtool: add UPSTREAM_CHECK_GITTAGREGEX
Date: Sat, 28 Sep 2024 17:33:51 +0800
Message-Id: <20240928093356.3992191-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a46fe93-f077-4043-5682-08dcdfa0b28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mI6Tx9UeC5FaWgngTWS2tacmJLamADSPUlZ2lt/K0QwWOWezgEdPOjC7vatr?=
 =?us-ascii?Q?XlVgtfm+5m4ZZbqjDF4jjC8prCOFb4vBkN0mWZiARzA6RfmWT/1nRlIRGIk2?=
 =?us-ascii?Q?3A0tGvCny3Htb/nec8VsOoKWkl9k/5MjpAMmFg+x6y8VFKp+E9RWWiQkfw27?=
 =?us-ascii?Q?+NKOo2S2bctTXbRdjd5kact7ROn+UMaKMxsdw3k/hceAKX/U338em8wTPl1X?=
 =?us-ascii?Q?nwl+5ORfHoyBPZBS0mOuVW+FLG0Fa3pH3sS/KXaHmk9YOgqmyZakZckJky3f?=
 =?us-ascii?Q?pUKiTGGZujpeHx3jkf7IwSokcmOobrEi0sylBcKxlUHApNsAvNY3RUJoJ1sM?=
 =?us-ascii?Q?JFFRCVGI1BZTHC9voanooFv0Z28z8neu5IrObZn2qIhac+6GYZADSMOB2rA4?=
 =?us-ascii?Q?vG2ySyc+Tw0hNWGDVKbvBDps623iOIUVuB9VEN5Oz/2zZnSVQrOBA2Y08Hge?=
 =?us-ascii?Q?Th2OXN+BNe4xg472xduedprah896AxmzjxV+7NRL5QdAYe5aTMP9UF2bTitd?=
 =?us-ascii?Q?QTXfxyYeYhWc6DTdtgOvnY4qkHPf8hZh/pSep/P4ih+yP9msAfvg/re++MwP?=
 =?us-ascii?Q?vG+u5h2IZwVvgSMad0d573xGTqcZ+8S9HCRe6troiU2iGmUs5ZehQ0iz12Qw?=
 =?us-ascii?Q?oQ/tNxSlTJHOBwqsToOpnS0OCa+6q797354JIFjrxlyHZ6dSi+P7pxHfrEtJ?=
 =?us-ascii?Q?vAR7hXWqaRjZgcrv1W9UQ8ouLE9r/OopmFtDISAHFpaJdGj23cvWOg6FzA9d?=
 =?us-ascii?Q?dmSvpWUvf/btlXL95BYFVlGlUFS2eWuaGh0rRN5x/V83T4zbdvDByjUc96zi?=
 =?us-ascii?Q?j2MK2w2iS9j/+JhZMbRDUKQ1dPcScuy3/MqDiwtKWY1vzP9CTyEKj6J6R6t2?=
 =?us-ascii?Q?GwiiFaaaB5HuBfEJZCpgv2v67NT3ekPRYw8nbgCIKLK3DEJ4oxr+1dMk+bXR?=
 =?us-ascii?Q?GNncSlsbPUTzUt2WZhY37wID1OwK74ByDJ3feq1J+uQ5biJYoTf1TF7PQOlC?=
 =?us-ascii?Q?qm0Tn8E857efiIsVWc6jAHAskjKd0B87LkkH76ghpds0vPQhTRkl2zIxRqMr?=
 =?us-ascii?Q?DeLGQ/OL44SbLkti7Sj2NOIS/4W97Ryl7Wg842XHuUYXsbMAK5TtAG090MiY?=
 =?us-ascii?Q?9NjNs3DQZvSmRDIZpzJZ11k4qHBVpqkRm5mzRv7ty9bXUgB7qE2vR48Vm/UG?=
 =?us-ascii?Q?1KvRl/mUyJJitulOE/9pLYn64Jy+VdoNMG9h0QBspdlW2tTqdLRj6uH7yf3C?=
 =?us-ascii?Q?bV5xmUHU98lwsKeMH5c2OGo0KDYAiilRCEiGcfRmsQT6qQEGUh3eAqCs1gS6?=
 =?us-ascii?Q?WL5d9wnkMC/FFPV1NJC6ZxzFKORLSNVrhC+8fJvykRBVUg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p7THXMHTRFePNKzwJnvUYwlGnja77Hz3NotqOQxejWs9A7kKQzdEpB0W59RJ?=
 =?us-ascii?Q?Zzjvm0eN8Zcp/AcPdGeH0ONJ3Zq3HOLVQux4Md8G4WmIi5BpW5esvr4rWCsM?=
 =?us-ascii?Q?p83GTR10jhxxrhAT+kL81Uj9aOsExQR+L9ctTSDpoUVFpQBLHOuulhvt+6hY?=
 =?us-ascii?Q?/HGyQQKSKDs1KAisP3OwJx35fe2wyIHlT/pEDXaPgJsSZfcDj7OIX0fSjsSZ?=
 =?us-ascii?Q?00vqBz7K9fVaok/WkDbpZX6LLjGlNnPFA/mHyl0IzlVmvkQNAB9XubaoGf/d?=
 =?us-ascii?Q?s7UvCiQ6heRfGNNVmNIh36+D79RbH+UK6ySlaVvbQSyIQpIhmeq5KYYxEYS2?=
 =?us-ascii?Q?u/XWHebSCQB0uD2QHa9ZBjZiMt7hRTJmsWFzjD8ZOxTyR3CNhBxL2Ox/3iqe?=
 =?us-ascii?Q?UuYXClpaaZIUAoXqpnjSoSk2VHA3MVkZqZQvpOJu0mZyQIJ7rmz01YfoVcYd?=
 =?us-ascii?Q?KCdNUw9wRnyXT+0JGgtmm/Qtq17xHEhpOOKfQuvebWkA/j6pmWRmrdyh90QL?=
 =?us-ascii?Q?naSLRNi7w31lU6eW0dr8NQWgYZt245VM18UblTOLo2blMa3JzX07dLk3X9vt?=
 =?us-ascii?Q?UQAIIpGgS3YnP3UasXfhtk245v4vys3iZYuRyCJmSRd1AYQjnGNhhuaXisrG?=
 =?us-ascii?Q?vGF6G23XKs+AZcCD8/yrFlMEXOslRy4uWTceP9IbKnZD7SfJ+QmqneYYmD/z?=
 =?us-ascii?Q?PD34GLHiUAA2ieN0NDA2dsLcHcM3MCvQ+PUr8UsS9BJmwlMc//3lF/GEHEAy?=
 =?us-ascii?Q?yzuGTrx6Y68IN17ysczvAO8na6NDopoMDt+iUApZmlM4HtnpLwrIR/jsyyXR?=
 =?us-ascii?Q?wZXM67fIpHBle+qcAzEmyFdhj/fw0YBCx345Zs4tTMSvCmxX5TU4b19GNyJS?=
 =?us-ascii?Q?l2AQLR9cgMELFvUSHlrJQvN4SHisL/+E18rne1mO/d1/yM8S/RRiEJ6Nqwij?=
 =?us-ascii?Q?buBhZ7Sejmk087Mzhfc79alD8aKfG7pnT1E0EKnAjdgVitVt0S6flaSulTa9?=
 =?us-ascii?Q?UZX7iTX8Yaua1qyy8M+YPMXhDOJ1nTw/AMtWzUPmQAESLNmDj72hT2ZOY1sB?=
 =?us-ascii?Q?wvM/ma0wRqoslNEMF+W8MSIp/XS59K2UhxhaN1n2cwvVGtvSIOJ5TZqbFti7?=
 =?us-ascii?Q?fAH4gWWAwhpwzfZtrenJzXv7vOHIrB/gflmONphCEas2yWk7x/iaoOO+j761?=
 =?us-ascii?Q?S+5Q9RZYiDerbmI1PxomWqlW1Zm0wK5o6wF31C+He9VluJoxiYQZZJZaJCUr?=
 =?us-ascii?Q?dKOiSOXHEWG1sS4o0AK/D3LEYiNf5WAeOSd0KQLoIGmsUDulcnTI6bw9GzRJ?=
 =?us-ascii?Q?FEQANWp/PIFoFFKIDeJGGKiJdUcYlhO5GbMeFtGq4KjXLquEyMQU4fBAv9i+?=
 =?us-ascii?Q?fObN5iu4ZLZCDDQysKDgHp+KtsHmk2Kw7W1xol97ckk/CYWhsrbPJcdUjOjI?=
 =?us-ascii?Q?BDOq6neESmuAZRCvRIoZ3PRShGUn/HVAVZZmpIavTQFak2/IBjut7I3KZKne?=
 =?us-ascii?Q?VDSlFLKF7XN0Ug+VWoq13bFXft1bWOqBVuXaz+eA/+cVi1CxLZeaSnb9o5gz?=
 =?us-ascii?Q?bBgqA/HiWP3qPqvtrZN3emzo1jl/8aBqK+Hgw0BK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a46fe93-f077-4043-5682-08dcdfa0b28c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:34:06.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avnkLmwxycj170MMi29XqMUjdx4wEZQANPHRvxn84sBJtR+qTBK02hSvcPCfLT24L80p5z3m4xhdZ0zDRURxPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cd93 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=SXzkmgPmAAAA:8 a=d10BF46Z5o56Tql32BQA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-GUID: QdtnL9nuofuRc-A1Ew1ySfLh9HqaZIBP
X-Proofpoint-ORIG-GUID: QdtnL9nuofuRc-A1Ew1ySfLh9HqaZIBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=668 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112535

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version ipmitool
INFO: Current version: 1.8.19
INFO: Latest version: 10.
INFO: Latest version's commit: 990f9672c9581ab5fcb6bfed98f5da12edd29411

After the patch:
$ devtool latest-version ipmitool
INFO: Current version: 1.8.19
INFO: Latest version: 1.8.19
INFO: Latest version's commit: 19d78782d795d0cf4ceefe655f616210c9143e62

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index dcd3edaf3..f53150cfa 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -26,6 +26,9 @@ SRC_URI = "git://codeberg.org/ipmitool/ipmitool;protocol=https;branch=master \
            ${IANA_ENTERPRISE_NUMBERS} \
            file://0001-csv-revision-Drop-the-git-revision-info.patch \
            "
+
+UPSTREAM_CHECK_GITTAGREGEX = "IPMITOOL_(?P<pver>\d+(_\d+)+)"
+
 IANA_ENTERPRISE_NUMBERS ?= ""
 
 # Add these via bbappend if this database is needed by the system
-- 
2.25.1


