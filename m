Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B1FC369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3641.1744877131348236703
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU2002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSyY7axsvpGbDOPbvLWZ1ha/M1L3nhCOkOH2w1Z3FZaRxzrMBcvQNFIjMsTei0VImBmb67sZYGYuxN9S8zAsX65fnGZX3+Z9lwv2XKGPRrL1qwcyTLOeBj+9YmKNcVGsAxo9o7VnFccW4LmKDADkfJ+K7U0z8+rLMIynRGX2qYG7UKOaVDxOF3N2FrxSeNLCujusJZiGcNJNPzlsgzXhByNtOi4Je9cYB0rBUmYjz7XB1+d7KxfYOVJBXUxgXWrhaRCUMVGWi5JkJFEgVdo9AZLnWzB5unzTD5kyPkyGJIB3pUN/9fVhiyyFxM5otIA+hDKHJs59nEWJlLIsLVq7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rbh6RqzD1BMi1NZc9P+UmUcftWAIJejvIhWwWruf5M=;
 b=VNX3oA9FLsyz7J2SHDfrLOj3XZeC95PXg3igpK75quRV3iNGvS9RoxTpIeIaeiRaSusd+kbxWe6PotxhbBMHXTFOFcSQtg9Q33au7eq0e3Cnvji4/Q9LQPX0blq47P52cv4heGI7zzGMVgEgf1L5fYPvht1LvHGw6TbDEloFS/Om7X30ppGHm3khPzsrkZFReDvkrt7+3MYh0ZIV+bcobmxImmTec9zGKf3L+OXx9fkojaasPTOGyu9a/IkwYhQfV8L5MEsT4avSoyApMZkAelbNxai84byrt2smvLEJvo/TfIEIkob6Hjf3yDbthoJ8vHHeuH1EdwrqW3yo5tHbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:27 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/7] check-version-mismatch.bbclass: avoid single '(' in version output
Date: Thu, 17 Apr 2025 01:05:10 -0700
Message-ID: <20250417080516.3158818-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: b918fa44-c741-402b-bfad-08dd7d869d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xr0lHC2DZXzfIwfrhtLPWUOMvKp5y6MlfT3Kt0YLGtQtm/5RfPRDEAAROk1/?=
 =?us-ascii?Q?ALeMeWHu3Ar3KleJc7xJ02zgWd8RURZYTS+Q8jWR/vtcfKIYx99ENvJt7iCR?=
 =?us-ascii?Q?of+Dew+m/glOSkSuzjtdWHJzb4ivR0I5o/GeUmXXXIzV6iGdBOL3QzywdCCr?=
 =?us-ascii?Q?G6g2KchhKm4pfXXqgnR72QdwpjQc/utEjDUIvqBGjqTkzNNLGtDQvA/Iz4sM?=
 =?us-ascii?Q?SXv8aQqikjLy2CfcQJ/vMe/E90UoFtD2rHKp0+EkN9Y0tPZsTGf5cvbUGuOf?=
 =?us-ascii?Q?SQmg1s5k21a35YwUybsSHvPWcMbiaTdPp4vwGr7FtDqLanejZhlX+MJlvn3C?=
 =?us-ascii?Q?8cw2YCqwSjSaNr3Mx9nrtDthFIaflfBdy+ZTNb8mYta4/1JiT2eqK1ezFdpq?=
 =?us-ascii?Q?+zY33g5Fg48Jv5WKHHnjHzZZrYK3FBOYwo3MQ65u2Q3phR7XQ3qgFVLeGq+H?=
 =?us-ascii?Q?M3pXy7KkGv6/wlRhepl01zeROamFW9ohuP+Eio8DtbFoHE9K7mGSSK3dSC6x?=
 =?us-ascii?Q?2bqxy1aLEgipzd3B9tO/MauKlDQ8+EQv49jmLnOYvZCYce4mPnw/fsbC97QQ?=
 =?us-ascii?Q?yr4aL4vPccx73NljsWZj8tfsQYTK6+Pru2QWc7lJZAJqep/qsNI1FqXgVF/u?=
 =?us-ascii?Q?5lj30Y7qewCG5nv1skuH6gE/VZQXM0xl4j28ZsrA1ojGXmNtEgqOnwVWaY/k?=
 =?us-ascii?Q?m9RvyZaf/ybBpNrFa/LFWq4MjD4lThTNba2ULjMzG6k9qLasAFCzqWSkYqH7?=
 =?us-ascii?Q?rEaMIsVSn3HNd0mDdakcUg27VRTk8cG7e8jCfhH6P1TgTdigAwI1GdUUl9qv?=
 =?us-ascii?Q?wDmYpiJKRxoS7V7zjEEB30fGJ7S3YweB9pjIrS0GaNaBEsqeOeGQj3uYKFI0?=
 =?us-ascii?Q?F0JZ6pzA547pvyfbjqi52AvR1etnMQ6EMfy7++634+ohFckPsXYnZUG6qv4H?=
 =?us-ascii?Q?3DBnvWByYq2yDF6Q/5+VsSCDpS/1UrkBQhQErOM5JHlttlmQO8MaiuxO+tbk?=
 =?us-ascii?Q?UkPc73Gx8Ac7YxloTXK54VIsw0X0IBdIwsJkzAzvqM1YZv0pm1UU6/Cb/os0?=
 =?us-ascii?Q?u9IG5QO76mJMQgwnR/tV8e7M7FY2lI9pZd+ovzCEAcIgl5NWzlV5S7r0+AN6?=
 =?us-ascii?Q?wBsz16zrrAXaoRZY1yMnhruNIgIPeFEb1bmQgtc9MfKtcyn5EJEaHW79HM5j?=
 =?us-ascii?Q?2iMTUgwB1bBPW72kubiCJEBRyjMJzZwsvmjNqkLQM+snFTu1lbDJD9mKA36Y?=
 =?us-ascii?Q?m+AXv8NwDGR/U0ToISQIRteNvycfBqCAKiZr2zgntXsFDDjyyeyaurzQlx1T?=
 =?us-ascii?Q?vV12q1Nl1D13jDMSTPCID8rkUR8ProoB36KBuWtc7vqEpXDgM7vhuznN3xLS?=
 =?us-ascii?Q?cITGh5PpvfjaGT/t1tjZQeqzzVMtoJ3WNBuJQvvmgAEvs8a18H7TcDEUgYqK?=
 =?us-ascii?Q?Ppz3VbwWe/4lJaaj8RosB2KTcwxTsfayUBDz07piPFhpP+ZVH/6m2g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oql3sGdW5nET4P5U+4HpkJqwJWpEeNyvFjpb5kB87mreWbVRz2hrzcb/C6y1?=
 =?us-ascii?Q?NMKx8EwBt7Mbu0FH/ha2/RonK1v8tEkpQM7bkoZEs6nI5KacLrg1PsdmZ2A/?=
 =?us-ascii?Q?/oTGm0Wk7OWJKKRSvac6qHC77AwhNlIUiFRQnpQDVyGSCI0XYXEQJrF4P96O?=
 =?us-ascii?Q?wrgfDmRAU9P82mkdljOC0Jut4IfPLuPH8Iuobt77OqM6XDWu/5XixZcGSO8O?=
 =?us-ascii?Q?fwQAMDPDMJ9MfOuZ9h5umP4I+0GNpQm2SeC10PtMWw4Ln27Pq6QVKUSEXBd5?=
 =?us-ascii?Q?S/+CY1MBqBFGp0FSOTkvCcs2Govb5iAKoNwxAwRH6284uoDRSVgSz59bKyM+?=
 =?us-ascii?Q?tB+keiokHsHxbb3iu4GGb2qEcCuB1gJb3GoW4j0T1mXfj970zF+PRk0ahXiL?=
 =?us-ascii?Q?/Cu2ZW5oTeS52ASH6aDSOmk+ba2B6IofPyAuMPIqeJ/MLYaWq8aPMEDlTQY4?=
 =?us-ascii?Q?Ed+q/IsBIncBQ0teeCf3LFUAr5Kdk77mCzgkxdbYAx0JIV3DHjL9Etlvgr4G?=
 =?us-ascii?Q?1V64yRZMfYLpJ8gSGiP9Egx8i6zIbC4Ia/FSE0YNSBBCJeX9EjoepiIh5GOY?=
 =?us-ascii?Q?Qrf6ax5S0SO20tLVutz7EN/p79k0LOo02tGhXJvxM1cYFbLZPHGyuUy+1mSP?=
 =?us-ascii?Q?5c07aY7I+xwfpqXZH+2PE5XjYIJRyM3jr8BPMKKfbcUE8dHSi9rflCpr53uB?=
 =?us-ascii?Q?vROUpnMaVG9Qf2O4OnTkuZr3VxzRa48U/BETPiwqLugtVg8/kZhCEluH/2Q7?=
 =?us-ascii?Q?i3PXrh5MuZipXZKPy3iZBqPQSVfXQegajAOD6UPJne+3Rwm1DNPA/sstgcSo?=
 =?us-ascii?Q?1jXY9g8PzBwlEAslm+mHwee9oSWBdVkD+wy4Pueohq7Qgo8bo8mrAbLpYeLm?=
 =?us-ascii?Q?luuIcALGuxh52Ni5bFPhuUF/X0AMOm50DqiP0/m1Q9J9gIkcYRPXv6MxYess?=
 =?us-ascii?Q?RdkBSYUXsZvF5QrNlBSgeh1y7Q0mKDttFzxjBRcdEL6qLWdU/M3W575kA+Bw?=
 =?us-ascii?Q?jiajY18IQZdMZbiNDOMXRsVkRA07Ykr2R+Ng2hdjFFRSRxDIJ/CpxCPd/dO1?=
 =?us-ascii?Q?p7AupiOVIpkLlccaMIPhZSNVJC5J5yKUqcF2zJsj9hMLdeH93Uwp2HYZiRxo?=
 =?us-ascii?Q?Qm7BOFplsPYTHfJY2XgncuCCS0wWw3hNm6tOGn3L4nBTU4OvXVoxxM8+bdJy?=
 =?us-ascii?Q?PaoBnkBeJ+tqZiLIzoQvTxWXMmcB0dGNSkNjTxatUwcR7O1FhnEq6Kz+yiIS?=
 =?us-ascii?Q?U+YkLUc562z/KO6yFYl3BgG6Ea0QSfTFr3NCN/usP/DJa5J94zC0U8Cc70Z6?=
 =?us-ascii?Q?e8rnS4IhU7ug5dl7KVEMydxvE3Zi/HkFjYQ0N4y/exfSH2awRH4DvqKH/JzI?=
 =?us-ascii?Q?mUynlLTEzBtqBGOIyS/gw9y0YidwLhZ1LYDF42OJWPgeF60KTxqpLciG5Txb?=
 =?us-ascii?Q?Edd7sPiZUsx4e/zyAEUBDkmTDN0vPi0hk3bL36i15DNED+TvDRFTH6SEyXtU?=
 =?us-ascii?Q?Itj/dTw5Qd3jDZ40M5ckzPfttmziti+1K4cTajuipoOXZgWDhnrBVYSD0s9i?=
 =?us-ascii?Q?4Ym2pQ3b75iEJrz8Ggr4kV/c3QNWqdFr6FTnSeO8K5f6sPmwT4wsBANHSCG2?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b918fa44-c741-402b-bfad-08dd7d869d67
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:27.8272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oSARPRNPBJh5uuOBJohJsRBkqexYwQMrrtQmJdcrJ3N6m5TvqtzK5tzFfuFsumgabF91Pjf/llpIdH8bL5ZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: uLyggaWUY1lYJUyfqq1lJqfvRjPWrhr6
X-Proofpoint-GUID: uLyggaWUY1lYJUyfqq1lJqfvRjPWrhr6
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64a cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=7oWG2brRiSQrbvlFYgYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=840
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116920

From: Chen Qi <Qi.Chen@windriver.com>

Avoid a single '(' in version. For example, we want to extract the
'2.30.31' instead of '2.30.31(2' for lvm2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index dc6eeab4e7..100cf09ac2 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -93,6 +93,8 @@ python do_package_check_version_mismatch() {
                     version = version[1:]
                 if version.endswith(")") and "(" not in version:
                     version = version[:-1]
+                if not version.endswith(")") and "(" in version:
+                    version = version.split('(')[0]
                 # handle extra version info
                 version = version + match.group("extra") + match.group("extra2")
                 possible_versions.append(version)
-- 
2.49.0


