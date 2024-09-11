Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80528EE0214
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 08:11:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16823.1726042293317511962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 01:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99845107e5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B6gQiD020490
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 01:11:32 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44c2g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 01:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geKHDxWpDLcozNtHRazGIGkb0XoHZC7dJq4zLWI3qe4SYIxisfUXhOvjQifZRZejIn+WDhyH/nli0bILTJbujO8jqPIMGajP0Z8ZYSdmHEZMu7Nc1n8qdzpHSL3d8oiGV4Acx/HLP6Y9hq8+HmUJMnVQTd09YXBVzEIa0dBhk//RWLKs8qUFbHaWL7c8P+voog/wXj6SsRCVfvUDg4G1z4Q/V/GV5YvEqTqEZPjm8Xb5XG/BYRwODHTlNF1cqLTiFogLgMs2+kxKj+9mAl+n79WgC/OmKWLzZxItMtTNhC1Vwsm4G7XTfTzTFBS0s1bRzRSMGcGqyUflc7QJKFolCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkXj3H6EeveFRoyqL9i5FTsMKmy+5M/EHGYL23xKxbs=;
 b=bEJ/4gTtb1JCCm3FaVshH/neLubMZnc1jTUtsxf4XT2M+b9kUy68CNASTIDz2neDwmqGewBPagkb6I8rD9mB/jIq7247I3qnO8C1ySU2BU6NhHcg6TCy8CHffWNzCZGg9bYs0yJu0bKrIHgjw6UVpboU+7BJDi31IvmLhjW+bHQWAAZvOiiY7UyZOQXaTZYHw0Qr5hLYpllEdhJ1gYxKQkhc5IfdoLvpEAVfV3P4GFFal87wX7jHBcXdulqLIY31tJpT+IQbeXpT9l+s3GvZ/JBLTcrSXP26tZ/powA7XnT9K4+Lka4JrhG4a9yQS1lJnkD2Kvb2nC9ykspBmq/w4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 11 Sep
 2024 08:11:30 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::79e6:58f0:788d:b45%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 08:11:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] mbedtls: upgrade 3.6.0 -> 3.6.1
Date: Wed, 11 Sep 2024 16:11:17 +0800
Message-Id: <20240911081118.2972187-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 96778456-5787-448b-261c-08dcd2395790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X+bu7KXLRxyCBkIhl8/5Njz9ulfVPPVPBQD36ZVtLs+KU50Qe9uVVdFnFun2?=
 =?us-ascii?Q?MS/0lQlD3zZ85sBJm3dhKZUK4cbJ0Iio4/g7p06A/vWRskbHXpZnRlCkYGPY?=
 =?us-ascii?Q?Zh1C211iSUrrC4WejHiaYGipWCBnOn9VzezMjcvMEZuQK/Z6SW4NdOICy4xZ?=
 =?us-ascii?Q?tKmry0lemE5cDtsZ4ZQW04xe35iNhkW6twPVNl/ESzXdJSZRQ+K59tldVV+U?=
 =?us-ascii?Q?fopDBk75He2Hn+KxKctz2SCob/tUl0z8ahCz2YM/K/1eEH3He4/H0S20vR+l?=
 =?us-ascii?Q?QjUjwnURzaRVrLtscojeX3Q67xEH72FsyLXO7O7/p7eT5oht45bnVkTdBNZz?=
 =?us-ascii?Q?N1CHhrRfQia74AwQTJK4/U//rcgoN1zu3Ob+4wlLAjOqYPbN9PMqTZVUv0KJ?=
 =?us-ascii?Q?Kl2zpOGJkZmQjziKg8imHbdW7Ge1HLAIknjnO/k6baOg10LfEHSNvtlHOdCm?=
 =?us-ascii?Q?9REB8xo6Zw20oL/dZEtqXmY647KMWlYYb1UFNErIUuTCTfcvOfmHIOhT75q3?=
 =?us-ascii?Q?sySDCzCYbEtdHBvOj0jFmJ+Lv/Zpo0KeYjNUEN/sRj2o8/rOXJcxRo0U9CJC?=
 =?us-ascii?Q?viJWsSFhAr9Ckr9M09ipauxnAZje5BWFZIfDDa2gBUcz3oSNaxhGEcHuzpGS?=
 =?us-ascii?Q?0Br1Jzq9MXLVko9G67C91Fw31qIac5uvZnH/m/iFRutYxT+qE8qaOHOuAF+3?=
 =?us-ascii?Q?Z62+vstbItns/maHPFpPsev43PhQ4JtIqnRefHFpJrAZVRVJ9nDBkWQxaPK/?=
 =?us-ascii?Q?Bl77Bu6igRKIfPu5dBGxF3ExSl6xeZRBpzBckuPSiSyJs+ETbKubDT+xqO7K?=
 =?us-ascii?Q?soOhMHeSF/zTV4rcLDyvRp2pzZHMRsTuJKkBOOtAjUNv3EN0aOeHdot0sado?=
 =?us-ascii?Q?ADEjNuzroxynU7fRyhcbQM0sBNWwTycaU/NjhDbGb+zFfNWJN1owjziLiRg7?=
 =?us-ascii?Q?DYk6VHYB8/0B/SYky27m66iCBXPkBVOLBGkcdQ0joCD3FwxqPagdOClgbd4w?=
 =?us-ascii?Q?ZWc5JyZtJusX6KmSzvsAMeCNV1wXkjqdUBgtN+cb4V6aITnQJtCxM4Nw9EWP?=
 =?us-ascii?Q?0V08Dx9YucyrZT3Ww/6An0gsPzp5Oy+VtCFeedyJejsvyDXaqT2gsD1CaPmz?=
 =?us-ascii?Q?jBwKjbRN/gZ9lCLjSYxfejFUfPLve05G07fywFt2XoLpfRmPDklNREwdhFtG?=
 =?us-ascii?Q?A7uHr4WOiiGAgpv/EyBdiPZiY/izXwpVl4PVWalX2Hq5EiRMf5pOA57fLwwe?=
 =?us-ascii?Q?kX0dEcr1OdY48BnDW2ZdslbNwlUhqAQFb2SvBgAYc+ttj0lM4xVvTf4vHfPi?=
 =?us-ascii?Q?BNCUlM2L1yoBAkF7RRjg4YGTj2iBQvY07+Nkkd+hMyji0SgqPjMBKfCN9N5t?=
 =?us-ascii?Q?BexDqFDasdVEM3ISo+/1f/b4ImHnE/6gZbBkSI1r++kUtF1Bgjc3MJp90ums?=
 =?us-ascii?Q?ke09iiVxGAo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?84A3bJWxLh95vixs2s3rLCMU0rqmhCyPi9pyHYlfBjTMuVgIyEpjIluql2E3?=
 =?us-ascii?Q?yv096vE8sGbxohlrHVXpzrjiXxkXJ/1RYkwFJ98po3xc0NYQhk1FHyuRRu3h?=
 =?us-ascii?Q?GMCIfC7XRJIkPHd/9kKamFBoQX/3xvD0MsJ9BjuajuvPT/CnK1lye8UT+Z5o?=
 =?us-ascii?Q?y/8YhI9e1HEitxKn4bCxwLTWQVhAMkONfd/o+8OfgUAqYnLFC7QWYy9gsppK?=
 =?us-ascii?Q?3nw72rn/fYHYwFTr1HVXa57NI68BRD8mys4hlr4/CxMH/wPvC6Eihc89SaOw?=
 =?us-ascii?Q?Xmv9lp2aCDU1rBXP5ZTsdLV6JA2YKjGTkk7Zb5g51z9y/T1OU6h7t0Xx1znO?=
 =?us-ascii?Q?0MZvpGRycrdeezrfib2ZmI5HZlBJlqdLybiselvmNpSWCCuPlsStwREK3s8w?=
 =?us-ascii?Q?tiiUuJW2IjeK+YQ3L3HEj/Tv1YmCuGiHpvdZHtUGkAhVIaHnNR9d/zjLHhB0?=
 =?us-ascii?Q?w89yt1unYDJnsWDwtLyEFxf5Jjd9+9HT3caItpnRavKXDeM+PhxcGOQxPHjs?=
 =?us-ascii?Q?tqg0zkjSECi8zbNB37a7/kVwT0ttoEzVHHTmF7MG5kNjf3S/fDKEorOm2Dsw?=
 =?us-ascii?Q?+4fAHmESLo1ximHR3twanx/63A36rk0M3oGE0irS8JKzrIoy0s1LTUX74IXv?=
 =?us-ascii?Q?q/7G4NMMYcte1G69FHPIl+VdBQEJZYkB/N2uVuPv6blBgZ6kxVlDSJfuakeo?=
 =?us-ascii?Q?Tj7vIC124hIJlf9XOrRDIffAblgZd6jucLYzAUTnqoTK4B0fsj26aHncxIQj?=
 =?us-ascii?Q?Uf2vjqnK6dxgaHye4anoIJoFvBmOMt28BtjSE1NcGNCapmuSXXOCXoMkQZuu?=
 =?us-ascii?Q?Uixd4Y5XR4nLoEnbobzsm5lyqd/XafKBE5KfHEYxaTSX5utX7FAMlKpSGzEQ?=
 =?us-ascii?Q?YC+/zcv4JklOf8uHY7QP+SzATHgHjk6wxH9jltIo6J1gplC0uRwYLGkqk/K/?=
 =?us-ascii?Q?x6JQncssFQT/+XNw3gi3gFo4mtCXgLURb45N9kSMu5EyOvUnbkPdzdpBZ0hF?=
 =?us-ascii?Q?bsV4RozUuHO41lRWtVKCzcnYhVWFUMRka49FeOtLtCxMcvsjM1mZ+jEwiWNz?=
 =?us-ascii?Q?Yp5GL8Fysd7CeRz6O6ZzDUl5eeF4QozwnN/G+azACvWzOau8SA53GPURNLvU?=
 =?us-ascii?Q?2vOxMSBq5NCgA/SueaxC81BeifKPW4H4afj7nBlDUvB9I8j1u+IiVfZihG3O?=
 =?us-ascii?Q?5wRgvYvQKV6EbA755OLIazCoT2GwgcdJ9QArKMggGSFyv1Dts7gYh27JKLMr?=
 =?us-ascii?Q?5D19dLLk1vZMCpeZVagCXYocZUctpI02d3dgkxmMLFD4XijuCHjpgLBGSuVM?=
 =?us-ascii?Q?JtR05k2oKHOrAnaKBiDVoPHQrn1bV7osPX7pTQHmgJHrGuWUi+72mQ/TgKw/?=
 =?us-ascii?Q?ZO929fHI3eShNte1SqVFu1vw6VMZ58oBLgL6nYs5NzDJyoOGy/oKOCmidhAx?=
 =?us-ascii?Q?mknYNcRQHoDclqeI2SJgj7rxGnckDOiRZV02URES2sKlaxa3kbrSj2RaQLIr?=
 =?us-ascii?Q?zFxSv0lImYpvpMbBkoGnKGdruezH4BVpAPV5x9yyISva5HScjR1RAfsgMoo1?=
 =?us-ascii?Q?UXhAv+LueOT3Txf1nJkGZnUlQd6n5S82q/XH6+bX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96778456-5787-448b-261c-08dcd2395790
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 08:11:30.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKudQaCy22Mo/Hyg2wiqpywPtx60E+QWJT/+UDf9b7VDTBVmTK6+ebIzPSeFmjnWZ/Cd+psBnibQyFEGsIioKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
X-Proofpoint-GUID: 9k0AuZqHdKk6mkrXQbY2xSMTtqt9Ixiu
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e150b4 cx=c_pps a=1OKfMEbEQU8cdntNuaz5dg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=8hB5-h17Vu8DU5hV58wA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9k0AuZqHdKk6mkrXQbY2xSMTtqt9Ixiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 08:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112239

ChangeLog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.1

Security fixes:
CVE-2024-45157
CVE-2024-45158
CVE-2024-45159

* According to commit[1], install data_files into framework directory
  for ptest.

[1] https://github.com/Mbed-TLS/mbedtls/commit/9c4dd4ee6fe570b6a50a275d78b7d140fec0e02f

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mbedtls/{mbedtls_3.6.0.bb => mbedtls_3.6.1.bb}       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.0.bb => mbedtls_3.6.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
index 7011d54f3..62c3add2a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.1.bb
@@ -23,12 +23,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
 	git://github.com/Mbed-TLS/mbedtls-framework.git;protocol=https;branch=main;destsuffix=git/framework;name=framework \
 	file://run-ptest"
 
-SRCREV = "2ca6c285a0dd3f33982dd57299012dacab1ff206"
-SRCREV_framework = "750634d3a51eb9d61b59fd5d801546927c946588"
+SRCREV = "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV_framework = "94599c0e3b5036e086446a51a3f79640f70f22f6"
 SRCREV_FORMAT .= "_framework"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -74,7 +74,8 @@ sysroot_stage_all:append() {
 
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/tests
+	install -d ${D}${PTEST_PATH}/framework
 	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
 	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
-	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
+	cp -fR ${S}/framework/data_files ${D}${PTEST_PATH}/framework/
 }
-- 
2.25.1


