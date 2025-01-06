Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B58E7719B
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:22:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55403.1736151734665426781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3101692a3d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506610W5027302
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Jan 2025 00:22:14 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43y1569c1m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 00:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/MN2vVFfL3C5jwiGFgB4HUZp2wuW0vpt8huYZmMZpcUYGDzJUkzKSahNTbLcV1VAPtk/tMrWB3s1mjZhIahCyAwx8J/B+02jF0tTLSs1wZML3CWxJTRUK9mAxkl1xVs0kCEqihPdLdFMQenA7nXcT4skntDtuFsGF8p907BgD7V9mHVcT2zNz1ombMGfszSnJz2Zt3oFX64B6RqTYQsGi4XWUircO87erKYk22Iuw7A/5FloX6D8ajnsjDLRr5MHqDWl7z/+1fv1p1zDrdvI/CD+4e7Qt8DM71e9+1MMcyEymXeWQJILSg+O4QXiqjZfoqterxze8N8cZ2trcvkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwEYn7vE1VqzOdxzAHkqKTOvNE+AzhUHDh3ii2Brrtw=;
 b=ZmMFm9cRtK8dUl1RYJJ/J2PJ3AyVRJYWxLSyhhsgtQVXv8PNfaWOqA+RLDRhCzGnkR20ZYz50+nw85zlkAGhw3NlTRJxcyYYTNg9lBpJMBU4n6LVWxPDiGd64dJlDWWP+v0jrEm3ZJn+DBS+rWvDaymnYHa5po7UjA7ootwA04kzQYxmnZusd+/e6vmxkawCtthAzUFnWJq0orLZ4sQZI5lPM7fzJ8oXHCblGnJgY/F+lfKpdAHT1oHVdLreL/WMhEpij8LFnrUHWnTNCuJq23ZG+fBxV8kO5io+4ekLNkpKaLTbL8Iz/uTuciU5wCNIFRasXyOlX32wdToRObngbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:22:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:22:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] mariadb: set pam module path to ${base_libdir}/security
Date: Mon,  6 Jan 2025 16:21:49 +0800
Message-Id: <20250106082152.882222-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250106082152.882222-1-yi.zhao@windriver.com>
References: <20250106082152.882222-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b378c8-0887-4a83-3169-08dd2e2b35a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KQFE45NgYVeLe0nuBQZxK87KHGnlUH0trg0TiFdDTbcQG48sfxDkw4LQMJHq?=
 =?us-ascii?Q?5FklMegKly8rm3CeLoiZGcV+h5jkjwEAtF5mW3YmBbgqcUQD/2Gy3z61eMyE?=
 =?us-ascii?Q?9F/9AWtjGXi6JPuTn68xOmtNcXep9aUGH30myB88Ig/n1LJrKDIMhth5fva3?=
 =?us-ascii?Q?R3MUkOGvdblhmNPRqJR40wtUyuZc0NSE5U9Q3gNgMObibRFey4sUiU4a7l2p?=
 =?us-ascii?Q?IP9+RlVI4dBmbnlFaZK+1paSZSetZvr/uy1Sk7CfoRyrqbYWysWaGmyQz5tj?=
 =?us-ascii?Q?+jGTCaUX1lpmQ/Ekj+eJP6HeGC2Kg7Iw/T3h46ho8J97+OBSaX86mm0sCyqH?=
 =?us-ascii?Q?AurM6phhjF/BK5+zns9Z5MsUjLmb14hbje3AItFue/7MTlQ8z7My/359fb47?=
 =?us-ascii?Q?3uJA10pzKeqvgFoxm8JydUP+91NAAuslIaJxsCIehI5I4/Kax6caDiFbMGno?=
 =?us-ascii?Q?GcmaCr6OEgNqNu293YNh1qJi6j59pZRR1D4NY233XXX79Bwz9XQNzsKDkg8c?=
 =?us-ascii?Q?TdcpfcRAtfA4k3DTM9T2kiFpnrz15H/8WYGvjXRXJGs/xzgu99jkpe6oyK57?=
 =?us-ascii?Q?sB8+cVCj74VmwXjmZ/62Ucd+CYxjs5W7qLfGkXNUIYKsVrBfJy/VUyPBaLNc?=
 =?us-ascii?Q?Zt22YAhn+bFI6QZrtPLWlcSWY6OuAk6WMQDzHlrKNbHg7lg2khFdyN7ROnPA?=
 =?us-ascii?Q?BVczzLk8MiXy3JmnduaVhpDGxH2C2XdKN46WBelFScmA/RGDUAeS9Ggzkry6?=
 =?us-ascii?Q?Ss2S4yTCJDaQzSwAF/sO2xU4djB8vrikr0w07KfQSD64G1BZrW5lKXkvbRnV?=
 =?us-ascii?Q?/h+dlYuxaE3W8MKNI2BBqjtVx09gZbfkEK24N/QaP4HUimvQGLARgp//hcO+?=
 =?us-ascii?Q?1aVm+hbLH3a29Vcb2pSI4uYn5L3KlwLuZk5PgOsaNctCOno9ppPHDWNqgNB1?=
 =?us-ascii?Q?mDM3Z2X+Wxi+I4Y2CU6DEvYMjsjtCqpVhHbQJlwBHVd2g9m7NELanozkf3+P?=
 =?us-ascii?Q?Q29uQkM3sSvzZT+9Ue5y5OGXAwjBsqGB+7an3D9uV+8V5DbV/pWnUUg7mvxV?=
 =?us-ascii?Q?0CpY5YkueOKDWWeVRahfG7bEoq/IVrdgUPOIs05ShhmCxQtIFrVEaXcWNlsJ?=
 =?us-ascii?Q?EvqrbXb1ZTQcdv+bxEoq4ddrXyrVn/UN3PAXV5CgJg3V3o+oBq38toR+NRPs?=
 =?us-ascii?Q?yZiEvJdcA5It7F0Kf7F7mB8qplK75qWzRFHXss5PNe1G527eOSdTykGwuwMf?=
 =?us-ascii?Q?iDyVma5QVCrcL/w4UenDyFqRPfhZX4/JzRFOfIFh5jvf/aUeXIw9AOpN0Ec7?=
 =?us-ascii?Q?6jmyd2SX/+g+ldNCrRTNrom8/5iJ6OP/du8+UXf5nLjGtKiWkH78le07W6AI?=
 =?us-ascii?Q?5eLD6PlWS0gz2CjsaAJeVPlj54v0g1xk2WgdNK6VepqUoeKHz1c+BxmqPJTb?=
 =?us-ascii?Q?6ntk3EUY30Vv28g0DHuIONYaqdL6FooB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OyUm0JHJrFvtjzFb5Dhn9Yb6vpOc2a9xToUJiAVQWLhiKEffpBMv2rsXt0Ei?=
 =?us-ascii?Q?mQk+7MsqUD8nXaWSnHwNarFYBswE9dVRrUu0lU+iNGxjkrAQJmjQPvk6EAOS?=
 =?us-ascii?Q?K+4YDq0p2ot+6XrOv8Mksx+28JaNhZDv1wkXZ2263RwtnI7AYkxh/bwL51kR?=
 =?us-ascii?Q?xzWyW+A7QVGBJAxyfIAwceH2WuQwN5v7VKz7bd0U5ch6mRuf4dyxSnTPF0LS?=
 =?us-ascii?Q?+H/zZHx+UGO79d8Wr6mIRAXhAPYHmkI32ti1L0LE5WKHlh9ZB1whvS4apACT?=
 =?us-ascii?Q?1/sUiugw4NDt6dcTEaIA776dNwzNgxNXdid1FA8p1BDbzpBWFhM/RNFQStvx?=
 =?us-ascii?Q?gxWGVoPI4YMpYBNjHs6ofENhy3GQdyagVMsxwko4RP7KQqST6wrZguHHw132?=
 =?us-ascii?Q?hWNzJBHYKR3AA3H/yCcH24uNUWcj771+knm3ATZoG4E+h+82FrPJwdpxeRnS?=
 =?us-ascii?Q?iPYOqZvHsJDjp+cH0UAqi7ZrA87WM+NrGLZ+7cMEzsIse32Pt33No/jNtkpH?=
 =?us-ascii?Q?j8VCQnd8tFqiwxKvhQfwEJBJcYrvxfCk9ctbINB4updwnhoeyX3J3XBlusAu?=
 =?us-ascii?Q?1uOu0AtizEM5ZgHF+MAdsOKljgrbua4IGvJPG56SnYOH220t7DMPO3XarfcD?=
 =?us-ascii?Q?sWCdnw0p4GXhb+3D4gEtkiWeGSkWWz/P7eRYyxcWrgnZuoS2rgv15dmDzNfc?=
 =?us-ascii?Q?decjHxJkxdtCy9bIWiDC0d1Rp62DzudMnRyErJBAwUWmFTN9Z0aRin7Gk9nQ?=
 =?us-ascii?Q?rlsshjtHyJFHyrGMXR+Ei1SUtQxHswVphz9ZlxrEfmYBUzqpKuxAnwzkmrSI?=
 =?us-ascii?Q?O9izTZPrW43noTUy8fMMUubaRcj0zuF9U9aNA+zLXrIWq1yxrlr/k7tM/5xm?=
 =?us-ascii?Q?UG4xxUYowNhhFhaz7KFriSO4hHTlKRSO1uJ7WAsF0yo9lSJWVN5bUlYYesXl?=
 =?us-ascii?Q?Rp48VMccJk6oYCPMYwo922etUDYTENdJEjoqvkFULmxjVhlTMnBe9A905HxI?=
 =?us-ascii?Q?dcpeVGO5kN5bXw9tfK5HC/N4R84JMUBBzca7nn8snwAEIgqdqTFvuz+e/TJw?=
 =?us-ascii?Q?q01HC7E9qOJJC5uYJTds4+MmVhzUvXmLtz94Ub/5/B7Mc1/eYaCdNz0522JA?=
 =?us-ascii?Q?oHODFuSzSMC4j3q/18oD4EGcyqB8L95VWF49WCsDY+u2BDSo+cIAVRc5SUBO?=
 =?us-ascii?Q?QtyijGMLANL58OzQpZtVXFAidUVYH58vxewSgCTJfRONfU7u0qcwYdl6YUH4?=
 =?us-ascii?Q?6CE8jpn2//bUqdtScOKArThjB4NvVRn/kLZIFtpVbsU+99O973LN7BUAHGbh?=
 =?us-ascii?Q?SWwQV8q6v2URrTHXDu/8ZXgKORIJBlL9VCyb840/0g07g7jQGQeiiTa935di?=
 =?us-ascii?Q?1mEP2vFpHw0TJH78nwhT2cMGDtZQZiFWrDPfNgVz+BSfzbBwSpd5Kr47cT+T?=
 =?us-ascii?Q?PJ+oUxRR4+uwLEFILqEBU4AH0Echu1D72dAIPA0GsMqrT6/f9Ob/R47Kb6Qz?=
 =?us-ascii?Q?VpA7ZUoMynhIxh7N2/S9UVTQbAWhpWKdOdsKY2/EKhdPhfriXuY5lS9WSDZF?=
 =?us-ascii?Q?Wp4G2MU8m2GaPUad1gptoKHgxgcx2ewrBlMWesKL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b378c8-0887-4a83-3169-08dd2e2b35a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:22:07.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYRVZLp9MoAwuMwT/OJsUEGpWhl2JD6fzj7zq5Zi9hGzloMCwcXavw5gdlPBid4T4ZprrHPtigLfCaEBU6L7uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Authority-Analysis: v=2.4 cv=PMT1+eqC c=1 sm=1 tr=0 ts=677b92b6 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=g6IXVHkzqjK3ydl7IjQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qVZgh--n6Sof7StEP0E4Fargy39WRuJx
X-Proofpoint-ORIG-GUID: qVZgh--n6Sof7StEP0E4Fargy39WRuJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114656

Set pam module path to ${base_libdir}/security as this is the default
path in libpam.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f3b8b5eed4..d3192cc59c 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -192,7 +192,7 @@ do_install() {
         pam_so=$(find ${D} -name pam_user_map.so)
         if [ x"${pam_so}" != x ]; then
             pam_dir=$(dirname ${pam_so})
-            mv ${pam_dir} ${D}/${libdir}
+            mv ${pam_dir} ${D}/${base_libdir}
             rmdir --ignore-fail-on-non-empty ${pam_dir%security}
         fi
     fi
@@ -346,7 +346,7 @@ FILES:${PN}-server = "\
     ${sbindir}/mysqld \
     ${sbindir}/mariadbd \
     ${libdir}/plugin/*.so \
-    ${libdir}/security/*.so \
+    ${base_libdir}/security/*.so \
     ${libdir}/plugin/auth_pam_tool_dir/auth_pam_tool \
     ${datadir}/mysql/ \
     ${localstatedir}/mysql/ \
-- 
2.25.1


