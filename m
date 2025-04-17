Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDBDC369CF
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3719.1744877132941450411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU5002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKT+8TWenOfw2tYbsvXLENsRomrIbOXAWP3fM+TzCy8PyJp8tyQ0qt5kiEArTSxWMX6uDFkXjCW62ag99NKHXrMJd8LfplT5cguYjDxGUJrm2SiRM6EZS5K6M3i0PpuEtcRAGTjPZoXSqXbG6NF8lO0Co7zypAy7NaqQs2X9lLM158YJPOB6T74BCpjU/WxRZqfMbKzSl/lRuXCn0etVj+e3deuj3Mk2XjftkoSH4Two3AkIXJXmNicgO9AElc/ruLpGPAQXqvoe067LJ+ggtXJAI/nMBNhb6DLX0RPoaFI7aR3FmcAreAG13xJAwwmLWhOTNIEl3bxu8FVP3c7dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqpWzz+oCWvdxQFAsAPDXe/li4l6BUJk5pclRMgerk0=;
 b=yRfzPfCpVfwcCc3bEoquXNXfzXZnHdwdeEoxxUww5YEeEMtI/KKbDsa/cFALsF5hRZKQZeCB5DpDLZnbwVbeyL+X5KY0U/wUUS82+Z3FOFG9gArwFVfd3db+vkJttARI6DwW5G+WV1Puxx6S4qpA9AZkGPxYhyd627bUxqlnf0OC5zHgdeYZ2bLNcvPs7e/6FDre8DbTEafpwlhpaVW2FKSveOumctK8lwR82EWbW19GYPWVjbOdcEKvNH/Pi8E50djxGW4hvkNsPWPdIPuesscGI9RcqmvE5Ux5KbVlIpovg/oWpoblFUqpV3uNo/U2sAbeoSk02U9AkRmck88IBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 4/7] check-version-mismatch.bbclass: ensure sysroot is available
Date: Thu, 17 Apr 2025 01:05:13 -0700
Message-ID: <20250417080516.3158818-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417080516.3158818-1-Qi.Chen@windriver.com>
References: <20250417080516.3158818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 135b90c7-c8ff-4558-0937-08dd7d869e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3BHuFfCYd3zvYBN5qL7OJmEe+e53bGO/U3Hq8QPqGnyt+mPaLfcxcYHXjuHx?=
 =?us-ascii?Q?7A7Zt+qVyu+mEvZTMNe+SO2OK0g2v6hjg4sMcNAuhjtP0yrGgMrDpVBXCbql?=
 =?us-ascii?Q?XRdvBKgNC++qFnuTQHF9m9wBJJNMgS9EKV8GnTngsilxOEzPR1V/LKYCceQd?=
 =?us-ascii?Q?MrFu1HI6E+dBk5SRvAuC6bAsuKl+640PC1BOiPdTfoekCm4NXTQLvSuc6eG0?=
 =?us-ascii?Q?fNSVl7bKo5DxxsjXuV4G/PmBeIwWpnBjIPCp3K8K5Odz0pU+JOjM5HHUYpvw?=
 =?us-ascii?Q?UhUkbSxnvA4fYWmLTgjCjLJvimuUx37eCQ0CqvrbRbRo4gH67PaTVXnpWo9J?=
 =?us-ascii?Q?Up5eVa9W/vJBDfVzuhkg1fPNwiziT2P4eBI5xjWRvng1URCGf1ebPN8D5NDc?=
 =?us-ascii?Q?XzIWXMESTXfMMq9Y4ZIq8g8D9BD3Vt2c3i8ponxpj3pNV+wKyF+1PEirzwNC?=
 =?us-ascii?Q?1XXlr9IxeSIj4k06sx6wIRa/+kZo78sWBa+4LgpNjxnjh3klLFsWZOXickKE?=
 =?us-ascii?Q?+3xtj0R31KLRytqCsg9DjsIOc+rd+kxvds3JmcN41PUF9DvBhb+k3Lhrkx3x?=
 =?us-ascii?Q?2t7E3t88RBTqiMTaKF5S8dC83Ml6cqawcZJgacR+lnytt/eecnR2xIfQzp1n?=
 =?us-ascii?Q?b1H9S43IgsgZiq8kfwQkJv11oVN/lMuugnkYvjdpYgyd4cuWFIgAf63kIj86?=
 =?us-ascii?Q?MsTUabfzgAOQKXEW9WCAXV9img6hlAkgdaYneHRRkxLW8vLa1QZwZ11jITYr?=
 =?us-ascii?Q?9rvt2BB3rOJ/pA9ZIa4mte4gJgbzM/0eFMecAcmcvKzEwumP6qdJ7so/rSfK?=
 =?us-ascii?Q?oB6Fc4F4rxAEHFjK/M7VZc7mO0QPVXmADENCYeyiMra7kjbSyR1BmCOSVjJh?=
 =?us-ascii?Q?xPzujTBZZaPOY4LgdvBtqsYXjkoDw/9mQxGkmaj9mNPrixEXWUe4b76P50O6?=
 =?us-ascii?Q?2vXWGAFo1X+9zcoHsEwjZidWIWlD7t3qvCYXk3lxdeNeFwhMxpdfO8j85LQ8?=
 =?us-ascii?Q?7VINZplHGGUdK+Nplk3y2NtJw6IvWWmIv1T/vfvglfhlFkdoHK6ot9AQJucM?=
 =?us-ascii?Q?mFRRYox/X1+MhxNTdBdX0Dn1V/Xjfsfe3tvBbup2WzMSfk+4mLWBy0ypiBnh?=
 =?us-ascii?Q?I0xLlW9bNfpN9Qinp4zNqMFHmXsJwdiqYcoXCgNyNDq4+G67dXNknCSGn84f?=
 =?us-ascii?Q?psuK++0Q0pewKkqjhLk7w5ZQnaaGCZNgAEdNOKoYgpiH/0J2xqYSpKKzUe8H?=
 =?us-ascii?Q?Ou+nVc4+TILj/n/Aab6hiq8RKeM70mBrgeNYERUv969B3EPnr/D6TdNgauTZ?=
 =?us-ascii?Q?QWIx1bWS0VDOKd//VPyKr2Q2jJOAGTzWEovFehbIGIYOV5rkfUUAfdNa63Id?=
 =?us-ascii?Q?fqhKFOpSxnxStkb8DwXhrlAuzQe9mKJ1wItQw2173EpsLn7oXkNF/J2cMTjG?=
 =?us-ascii?Q?j4BxXoB76zLvsM5LVFU5QO46D2bc41rKn17UtezvJg9lGwFmZMkIxQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?80EYfHV7g7HzkoJlReTZ1wm986KbJqcQY1NSdAtDcewS+ZNafosE/9Haery3?=
 =?us-ascii?Q?E7Mrov5FTK5+VxDl4//lZYFfkO4G5rCtq732MmKXFsefN18WjlyR4Uet86h0?=
 =?us-ascii?Q?d8mQrnoY3GW+VqpB6KMwSnoPc6Dgw7UoIEv9fVZet+4RMKzLUWDBqwL45SlP?=
 =?us-ascii?Q?FsUUhPkxcZQz/J+2urcWmiNvD9s2WBtgmFS+757CLFuKID9f07U+qEFUk7iK?=
 =?us-ascii?Q?kA8KSbXKwwiw6l+Yu3SmE0pMQzym681MhqWEIhBR1EBgPn4XDHgO+tKV4SN2?=
 =?us-ascii?Q?VrO/grN4L6S45Brqx1jO258t1ZlRS+U3s8vGgXol3sOI0Yo7ELc/e3Jd82/q?=
 =?us-ascii?Q?S3civ5zD1ytGMszyJOqQwvMKvEGiJ/WC7zOLw4S+BF6C3wRFI/sqgksdlmBG?=
 =?us-ascii?Q?brMuFYrV+NwSSNUIKekKdY4dOSoJvD6x/uZcQ1rG/eQELq4iOIRPCmrMvL8+?=
 =?us-ascii?Q?7/KB7OBEnKrPmf8KC36RDrSMXs5AniOvEykRVG+2KBKRkTY2NWm7Vdu1kUiE?=
 =?us-ascii?Q?2V7dd3JWVoWrwy0Um/GwDjOkbZUY3yx6tq9Zb/s0RZu3hgT+tx2O9EzcWt5j?=
 =?us-ascii?Q?QCHBYgQVCI5BrGy9Goyxd88TOjhIQ9mdQr7vX7uaOozkFZx93O7+UPdmn2Fk?=
 =?us-ascii?Q?XgpZqJs1OmMtR/6MoXKC1dQWwgEda13P+DO29KUg2zoMrhzSs8JHJRjqT+mm?=
 =?us-ascii?Q?KpGqejTp0AzOd4xXhkpwCGqfPI3Jg9/jTFDeSvS5GVv48FjN1kd+0gyd56ES?=
 =?us-ascii?Q?H6qZdsSZRKPwHcg9kBxshL7gWoIdi3uoMBz/L0ZQGJxUdsByp5Gla/kXCmnp?=
 =?us-ascii?Q?TeOLXN+gH9D03kaJ//ZwA33CVXHkT402iWa4TB9Ik9U+iUPl2wM7pr6YWZol?=
 =?us-ascii?Q?G6f4drS24xJffdHfSdKXsg/XCa15cvjjYTxEP3X0piVthstjV8AY5kJ1PrXw?=
 =?us-ascii?Q?Wh0Q3+e7rh3dfudU9U2APCcPhRVrPiIoxX1LVycprnncXlHwO6Wo8a3b5fW5?=
 =?us-ascii?Q?TqMA2J3oPPo79wkAVvwXjo/pQhypWk9uXDjrl+MWuZamSb369+Mirz/UbrSU?=
 =?us-ascii?Q?OBmy3SG7SH3DcQDBVfpPC8U2E9JKfZ8MiFvi2OLF1J1AaPbPPlio2L8ooLqF?=
 =?us-ascii?Q?OTV61NmWGvHfGfDNKuk8/bxgUabOSseRjHD2XDMABGVviDdevzjJeke5vBOQ?=
 =?us-ascii?Q?n5zU7U97m8W685mCB8KBbo7D4M4n28qcA55130WqgRM1xU+ximKCpAU0lw+f?=
 =?us-ascii?Q?aNTPHqlD03ZSYRLf/5HfhVH2W2M1bVXFoQdI1dvndRDFr1JriSqkWdJLYR1a?=
 =?us-ascii?Q?BhLwdgec7wCtCgWJCwOc093+WshA5OBh1WyEnGwuMGVM8Ls67hef6NBC5vRT?=
 =?us-ascii?Q?HAuhrV28fvyikuj13Jf+LFxLDFioXEMfkuJhdLqwlThDqkUGVvVVEvjbCrtL?=
 =?us-ascii?Q?IcMdb5t4FeiuwWMWv050QK25T2B7PSpJ4YHCKgONIGLu/y7PLBevAGvrRFif?=
 =?us-ascii?Q?UtsfwLoX4VxsON1M6Fs++LaP8FoGFMGvruonZrn01ZBZPaieaAPw/G2VSteV?=
 =?us-ascii?Q?tF7pY/rKGxgljPGhoWExzGlsMcNwTtE5xMU6MEtKpqkQFWmFf7RVlNZr7mRf?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135b90c7-c8ff-4558-0937-08dd7d869e40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:29.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgXu95j+F2W1HGstN+XpFFTUN0rC4s+YvnB4egpzm2RBvZs36FEVyrKdA5xKnPAOFu4AfjrjkdP+7AvsMhInhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: GGtKsVta1Y0stJE2nL0VpVA_F-nrsVvw
X-Proofpoint-GUID: GGtKsVta1Y0stJE2nL0VpVA_F-nrsVvw
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64c cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=6k8-X4hrguBcR-0u3XMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=916
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116923

From: Chen Qi <Qi.Chen@windriver.com>

We need to ensure sysroot is available for this version check task,
otherwise, running binaries might fail because of lack of libraries
from sysroot.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 676f7fe755..de7a5102d0 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -393,7 +393,7 @@ python do_package_check_version_mismatch() {
         bb.debug(1, "No stale process")
 }
 
-addtask do_package_check_version_mismatch after do_package before do_build
+addtask do_package_check_version_mismatch after do_prepare_recipe_sysroot do_package before do_build
 
 do_build[rdeptask] += "do_package_check_version_mismatch"
 do_rootfs[recrdeptask] += "do_package_check_version_mismatch"
-- 
2.49.0


