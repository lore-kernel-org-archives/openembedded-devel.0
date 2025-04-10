Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19999C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:42:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34824.1744292517311167487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5eYcY001118
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 13:41:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1q1ba-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 13:41:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI+nzd7O4xNL5kWfXZypSU4dstPZLge0WP+eaDh0whfHPEzy7wmtX6B2PETeY3RFyXtdMtl0XFmgXEmwFXIjs8GoOFD0QRULk9m/4myP3x9VQJmIyunsZfiOZN0Ud15vvjCcGwcgadiA33siPvPOkWA3ey8GBzlcmpSmb6Gn0ovTyyAI5dCkj9MX+NFCyozmFGM82wLi2t3XJpQmu0ElXi1qRjBnYWkeYgaA64jQuWh71Aun3UAnaf/uNpCIO0gSq/SmlwJH9GFKWpfN/Q2vB/gGcY1WPHwNupFeeG+KNARwB0z/7nadMSkcPKlmQlOd2xBNbES4CjK6sm5rcxWW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMGINEyg9h5nfIiNuDO6FnwTH/4aH+7+RKQ2k/UccSU=;
 b=AiHKb8+ZbyPq1rFTwCNrebd+fzqDLAODdrXWfzM7CTP4eA2ivuv6B2+qrnnwM+USP0127Sc4a2vHvBH7cdylqb+rQpOGDF3dOHZDTsAvfHwCkAV3RnaV22Ze4adc5jNk6Mtf6RmKLohyzKv5+DSYca0tBvQAH6H5+j8qqLwHkFEFOkLfLmV2WBDwZjYDI17uv5WkPsqM1SI/6GQg3JI2ksw1eLPiM+1EH8Am4w7NOduFXAi9i4T7meP8W4HijqdZOJgmIyKKCeylt+oom8LOTR+v1juvyM9EjK+39lnDuXt5rd0Zug5imlDhSckQKx8TCs4jseUCVUoufzU29cu47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 13:41:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 13:41:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH V3 2/2] waf-samba.bbclass: adapt to qemu.bbclass refactoring
Date: Thu, 10 Apr 2025 06:41:45 -0700
Message-ID: <20250410134145.1300042-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134145.1300042-1-Qi.Chen@windriver.com>
References: <20250410134145.1300042-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: bc08f8b2-d876-4d97-64dd-08dd78357371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D34T/AieG8ulgTqurogh6fehZtxsRF+MbECUOd9MRbiBsCmQvlWdoSTt2HpZ?=
 =?us-ascii?Q?ovRXKoHNR3bukvYx+RppihAYBe9CmdkVfFZ9BWknmw7Wrw9zIlzEyQO6pFtt?=
 =?us-ascii?Q?c+GROzYVE5hjDGpTG9EG+WB3C+U686vJi0NZpk6eeRSSBrFb81otk1d7LUr6?=
 =?us-ascii?Q?pctwqdMMroBlTtF0MP/tN6dQsA9KIS3BgE7oRO1Y1QvAdPTQRC8yOlCDNSO4?=
 =?us-ascii?Q?+NI9ZcOGHBn/hitQPwoS//tQ34ZwNV9KgA5I4/YuV3E10Zjt+4LVH6k1RK/4?=
 =?us-ascii?Q?K5nRRv7TpFRx6RAmVxokVHrkk1qd09dQ+8Qv3WdzfHw03tAtrckqexJb3FUr?=
 =?us-ascii?Q?zsdp8Z0AMT2bXAm3jLFGhvB7atJWY2UGOj7SImNgpikFBnsJWb47/gUIpcqi?=
 =?us-ascii?Q?TRZZX+1h1htOUGFiZkcqDZih6cx17/+frLdrbvCcv+OYUk/h85E1UUfvCiCg?=
 =?us-ascii?Q?72NwfmWYoNP3S4CFKImPOai1d5BFyv133iAelQ+qoOJRh+Mo050yFfZ87y8e?=
 =?us-ascii?Q?y0f5a7z8aYWjDv6OTLjNaWRX8tmiGIlNfM9XhD+4hZQXg9Z01cJQNNEl+KDb?=
 =?us-ascii?Q?cveT689uNNY+pz1LR9lAYRTuXNyzgqmUFseQ7trxdOjSrUOFTBCCRmN86uxf?=
 =?us-ascii?Q?PTM2SFwWqLgkiaNQwQUKj3eSF6xO78tdE9JiJ2adhQeyHs6zwXvss17Trvyv?=
 =?us-ascii?Q?avRVeX+QZ4ahkcMgp/SHjBZbHXx+miyWi4+Cs6cRzwRMZCyBM9+hGdVcHNKL?=
 =?us-ascii?Q?3EW09Vr2znA76jyLrjXvuxh0ILpAoxt/XPFS16xYlkyUHwe3JJ76XrREW5jH?=
 =?us-ascii?Q?rJ+7xIYnwvJKv2HPK6BXQyn3eKiSQ5FuHyFlQ23IqN7xOom7xDr/GHlOxf+i?=
 =?us-ascii?Q?Cgd1CJZ6UK5KU8c0/GoJ2DR90w8mSVMDamTqrjZg1ZwoDb+N9E5T9rq04PoX?=
 =?us-ascii?Q?CvnGyvpNb15z5dgjReWm7RnFSv7cV+MBrbyH+D+5IMwHXFOHwUUbQBNtFEGW?=
 =?us-ascii?Q?0fvuEsacyUhXecgbFTGVGfhhLgPU0uHGG3NRLq3sJWK3PYRo/BLrR2yAXXQW?=
 =?us-ascii?Q?rIyRMhxUD67s2TgIngjYMex/+5cZR7439r69A41+4ASpoPk2/lbfyMV4BKDb?=
 =?us-ascii?Q?DNU5z6zph8BceLJg1zJapcZrp1OSu/Uwvl/hfx+tfi3SsGbb22MHRMgBMBe/?=
 =?us-ascii?Q?ESswq5ExjeQHOKmt4aBAHctG1UBsG8g0QXIN+PDTG9gle401JWjrqavvhl2j?=
 =?us-ascii?Q?ic452vpQzFmaN4Rg5sNQnzKnfAq+pKPaZpIHiuqDElyAn3b5YsoTwGg2l+bW?=
 =?us-ascii?Q?Kfc1PRsAjOJWudoGOCyCWnGI5E8w6WBVfe+lmhE0ciq2YFcExah0dYe7maDh?=
 =?us-ascii?Q?T8Z4fztE7DYdzbH9LOg9bOj09rwxjps5o8E5IG7mvgndsztBxUmyjmtstvMx?=
 =?us-ascii?Q?WCUIEf7WCdo81v63kbCOfwXoVADat/VDyawniDE1fHxzR+kRa23Q+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HwuzK1DrcQTmNPmzZ/3E2oNxQh5SiblQQLxNCQsln9piBDKJiU2Z9gXc7Clp?=
 =?us-ascii?Q?2cq8GKRUe0HASKCvCBDCtfAMfB9DrL2lElszYWETleXWZGdJ9skUxre9GSP3?=
 =?us-ascii?Q?Wb1JAz/Y/oyOGmbiV3hbfTN5o+/Su6SiZdUXS/ualHChtLqBU70v9Rjf5X45?=
 =?us-ascii?Q?gp0GnBcemCZcnEjGVHE8WvxI7KDibp54C8hSONDqBcX7C/z6Id7zhhZ2kbMg?=
 =?us-ascii?Q?CE6m3YJQa6RM+KaUioN7ATgmnc0BJKXuPJAO3f/rd0leUEk4Jp7wE4qFrLnY?=
 =?us-ascii?Q?3aLm4AFpR/fQPHiIqXBly+mvFW12bTIsy8kx66JzbC8Ip76WPGUfpFuyYVHX?=
 =?us-ascii?Q?B58dptKzw132IJ982aNPL3/aIS6sidNctWT7a/Utft/gMsXYp84DCKNG0/z0?=
 =?us-ascii?Q?nR90rKjCxsqASfRuATfGHkF+FAms6t/ewqZkxvbFf0KO/tRZ4uhMUi0Ul359?=
 =?us-ascii?Q?8rOtgSH791DxDQBUDqLgNamKPGwfsqE7D2NF8SJ6iR3iOEYXxm9Kj46OtgMj?=
 =?us-ascii?Q?IW6Nyg0dUX2jzeL55bFdLAdEya/iN5+Ilt2XBFaFt9QwvI04EGzB4NY5++LK?=
 =?us-ascii?Q?tXw13avz7wRXYkVA7MXCElCInRQ7PcLTQOWzYXBGlVj/j55djhSZB0VOXLW5?=
 =?us-ascii?Q?NDr1vrg7YLF18iQo0iPCO/nJXbIkgFHnwaHxKHs0OXKsPod7YcQfCVoEtnFA?=
 =?us-ascii?Q?de2OGYx4JJ11xRUT9k7t+vn0h+530i3pgIZBgsfSvvnLKhZHEdvVw37r1e2f?=
 =?us-ascii?Q?x5nk/SuXiy0V5hkNfG719xEn5ZywseK+f8eAC44WdQ1MORbc75/9BKkmckIt?=
 =?us-ascii?Q?Es2j6/7hkgUITTY/c3zJ+t1OwRVlmiTFLaajqAXnocyxPSI7lIeck/0z3WKL?=
 =?us-ascii?Q?HqZZqKGNpBHD3TlDCChJom0eN8kqANhydxoBUxHxASxFkm3iHMR891AIYbAM?=
 =?us-ascii?Q?1U8jKHVCc9tbxki7giw8ZJPNiGk7xCqE8U5dZgMXDKLnCZVtQYoe3HBz2y/m?=
 =?us-ascii?Q?E06Cua2mpNmIDaaVnHZCG8XbaUHG/lRt8VUFjZlnekRkuyJXROFlViztZ5+o?=
 =?us-ascii?Q?ghl+db3DuMba01e99y+JFQQDzUr2KYRtC7VwmR6Kg76Y7GrDnb1DVSrvHgqA?=
 =?us-ascii?Q?AnKpFxJGBVZ3/C0fr8xnswUJPc+NjyUnqYGcogEiAGutXw848ia3UBGvhR9l?=
 =?us-ascii?Q?MJsEDo+O2WkjnX94z7zDg2bB9WKjjaT6ACaxlizioL70LhEzzKhHyXNk2c0T?=
 =?us-ascii?Q?q/ONsOjlFWkC9Z3XG/866j7U2pBL4KklZmTqKkjv1sPm+3flPiGvbCwKRG3P?=
 =?us-ascii?Q?3VKlNEvRlPjbgAiCrDP0FNF2aw7dXvkTnqSltdcT0VFIPl7tEhtgDDXf7ccA?=
 =?us-ascii?Q?+8r2dLT6qn/IJzX6JHOc6031+kw3u3m1N5BpiWvKyqmY/AFsye+ju6K1Oaf4?=
 =?us-ascii?Q?Hqp13UBOhipypojgzf+/J5t+fN/13yyHzr/Fc9h8M7k/0zefO7QdNNS0rMr6?=
 =?us-ascii?Q?8mGOObDZi6qgCobuVYpVyRoDxk4CV7KKTyKJWblg/A8KSVz0taOi5fg231YY?=
 =?us-ascii?Q?o0AjgO3APxwHvtA0xix8lkdNoMrrROESUxmTXxfXjY/V9oG6Qb0HiEdTB62S?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc08f8b2-d876-4d97-64dd-08dd78357371
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:41:52.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fej3xpT/pMEu+ZJcX3J3eouGlwLaNTjHrJhYGi3D5q47rd1WhRtjnTn3FIRn7jp3ni591dY4KHOpzonwMrpgHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7caa4 cx=c_pps a=WGTt6C9BqyZsVnlRayY6PA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=0cNpdDu4uiylx8giwlQA:9 a=ahtzkqAwBOYA:10 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vuZMLJrrh4USY16bMRnnPaeGZP8GY9aT
X-Proofpoint-GUID: vuZMLJrrh4USY16bMRnnPaeGZP8GY9aT
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=929 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 13:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116769

From: Chen Qi <Qi.Chen@windriver.com>

Avoid inheriting qemu.bbclass and use oe.qemu.xxx instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/classes/waf-samba.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index cb78ce6b0d..49d64b096f 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,7 +1,7 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
 #
-inherit qemu python3native
+inherit python3native
 
 DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python3"
 
@@ -77,7 +77,7 @@ do_configure() {
     echo 'Checking uname release type: "${OLDEST_KERNEL}"' >> ${CROSS_ANSWERS}
     cat ${WAF_CROSS_ANSWERS_PATH}/cross-answers-${TARGET_ARCH}.txt >> ${CROSS_ANSWERS}
 
-    qemu_binary="${@qemu_target_binary(d)}"
+    qemu_binary="${@oe.qemu.qemu_target_binary(d)}"
     if [ "${qemu_binary}" = "qemu-allarch" ]; then
         qemu_binary="qemuwrapper"
     fi
-- 
2.49.0


