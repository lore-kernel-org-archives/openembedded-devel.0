Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E599AC28B30
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 23:18:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1740.1741648693356504603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 16:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164a3b284=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AJUkNP031859
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:18:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8tpy7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:18:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKLOh4nNxmqgfJa83j/l28BLBDCGFV6KVBvnM4Ad5Ko56kgmjsHUlok5eQJk4jfedOYvURwhPRAGbXREuuIBlP8j/58Gn9KeH5iLDsMHeF9+Cmz1RkabWF+CJdVhgF2L+RtBEu75FfaJz38GrvAFlilfjkspn6duq5uyXG2sqYusPjZyNpKPqkm3p+fucmGuuGby/8Gh07iKwzM8p/eO/biXeyNT/0l3B3wOwTNQStI8wlDEstST/ksyONAs7jwKIbSEshNkE9j77IBMpjc37o4NYRgwKtL/C7ghukt2721jsFOTIL+e6zQMr1hsJtNC2l+T0Cyjgm0LGKQCYVTGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ltz33eTkXRgMdJi/Eep2eDDB8Fo0HkB7mq6N+my2G8=;
 b=jd+SudMbagM6/ER59eA2ELlxxl79I8AJmjtdA5/G2xSbtdm+4GK944SHS0rTW3tXn7jPhEStfi7o4qKt/iUJ7uW6gfT7FAAh9Z+5jim5MS+hi93g4vUpvRGxWDcfBn7N7ct9ZCauPecIBngwQ4IQ0DNqTYJ/PM1DT49exO+vdxykCi/pGXd6yonMxpG1HVkhtXg4+yC3VvfewLCLXwKhZ2S5Ip1WElf/CWsGXYXGWDB4tjZM12le+dmnfBNvVzARzpv9UvEWJrD4KvcO9RUAuKO1PkrU3iZTmiT8pmBD+oMh8tqbR7Dq/uu0covNjLkwOmZJwoCtkNrgntbuOhuxLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Mon, 10 Mar 2025 23:18:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 23:18:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] catch2: upgrade 3.7.1 -> 3.8.0
Date: Tue, 11 Mar 2025 07:17:50 +0800
Message-Id: <20250310231750.2912527-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310231750.2912527-1-yi.zhao@windriver.com>
References: <20250310231750.2912527-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: acbd0602-cffa-421e-35d1-08dd6029d237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x8/pVm6aRr0qQ22l9KT32Kgceg39hmuNRlcM2QTe0CHhsqYXu+opbNhukeqQ?=
 =?us-ascii?Q?ytmeZxazZ5F652bBYIeQiz6AUTAJ1mRzST3KqCv/DKTwaqWtkAyYAcvKpOIX?=
 =?us-ascii?Q?miWeCLvX5mXSFvtU4ge7rnJwSjGJRQj4bBgRJqTWi0PfoOwpi0rUv7/Hrngq?=
 =?us-ascii?Q?1deyfSy1i8uhI4FcSLsQcSiGNIfMI+2Dqs6Y2aJWYjkxIxAl4Y1C3/7vSLZR?=
 =?us-ascii?Q?IeYXinQrwqePVHCxyeo/XV/DWTCG15fqpIo8uvC7yrMhWzEE7Hgs1tc/xJ9v?=
 =?us-ascii?Q?mDcT1Rg7bRjeNPL4nqQ1OWdstki4K7Na2is/GKZgfUBRniqS4kRfFa2YCP5J?=
 =?us-ascii?Q?iGNTBxHqTS9ZjPMThycGUzM1QaIUfaecnvdeaiPKs3R2LQCsvZwihQCRQUL3?=
 =?us-ascii?Q?p5z8czoBjsg3mQSb4rF1aiCeidoY3kztVpzRFwH12n3UrwnoJjI7zgiKy1VA?=
 =?us-ascii?Q?2Yq2Tzuaj4pSErNfCNIXoZ6sjjLPYH+pQvlG1qQTpTPJR6ZJk7WAfyy0rlFe?=
 =?us-ascii?Q?5Vq88ayYXFlav1hvyr1oCuoOtyQvNama3tAclK3LPW/9gYfeaKfd2+qeJb8D?=
 =?us-ascii?Q?7DgJ9nz4Dli8wQbhz1/Nw6t0XgjrksWd7DjejvDuNVM2DGl74CWzmWshtKY9?=
 =?us-ascii?Q?ORKTr/pxrrJT02fITCSmRvugiqsvujRziEtwra4QcBNfghefBazw7cJIfWrX?=
 =?us-ascii?Q?f0AV9BLB8Chqm9gCs0ySdUgSidgkL5kVG1KUFzy5bCljG9gSs0Wcn5uHK6yY?=
 =?us-ascii?Q?rJfYSaePi3nNxZa6vJwgo3u8sZ+BawnljCYHfmRMMpBmAF9mvDoz61+F/4EU?=
 =?us-ascii?Q?lCiphBCha7LYBrKk4FYNT+suWIkFVBCeV1sIaJUwJYCSTExKyBcEFAgU8Dtd?=
 =?us-ascii?Q?B8+C4xp/gMFHjxgQ6TABpWjglQ+6LIeeM4Ktk3vlwSjnIT9Z5WyOgOOF8/HR?=
 =?us-ascii?Q?ZmOSwvei49qnY6B0MynGev9TPL5t3/SHAjbxjN+AOoyn/WRyCj1govh+48Ei?=
 =?us-ascii?Q?JCPoI2+8452mjc57oLQ0ME8JcB9nzzWq6+gxm/9aXVk2tX2qN7FReSpzjxDs?=
 =?us-ascii?Q?nxVKf+Svd5SF+y7WT6zetsoVdLBxeXl49C3Ura6PEdF2h273uhtc/JwQch69?=
 =?us-ascii?Q?VRG4hH4DhZ2iJNmUdhgR5CyDnr6CaUq3P4O7nQn1PU7rEj0u/0/H+RJ0sHmE?=
 =?us-ascii?Q?Ir+OHGM8i6vtXbRW8OzTeieb8Z3GH4ysjIZoraviH5zbT8jpXZFBTlJy/wzJ?=
 =?us-ascii?Q?O5AyEL3QZ55OxlJJ+Ye8Bp963oCR/UeUUfYgyYyC3O/E8BDcTDDzK6r+dCPP?=
 =?us-ascii?Q?11HjlsSSes5ZmitjK35FqFEz91Q30ghPnmQ4G9wJxwZaaHEm7osii04k5ulb?=
 =?us-ascii?Q?anLQMKK763zXWDWadBpobnQVx/uXSO0QYzO1WRTzjsHykZvcqz7gecIbd0ET?=
 =?us-ascii?Q?kc3R/RY7enkzDOoP4i4cNw1eO5LIVosr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+c4Q7wMveEARNFLou5RBhchBMtUE5K+ToFga1x2VkC6dzyxLVbW46ZOOMbDp?=
 =?us-ascii?Q?i10l+BQctepOXTqfuU7TcSYFF9z607IMCQVc3wgZm5h7Ap1TKoE+em42xiEQ?=
 =?us-ascii?Q?O455GWRomuhhk7XhCJpZMILOeR2w84g8sprlDzl78hC/WMz+Ki1hk97O+ume?=
 =?us-ascii?Q?eocLYBmdGU0E1xMPLrlZflXq6i9G2pesgezk0lK8knl7aNFBad1uY5R43FiB?=
 =?us-ascii?Q?vTrJAglLLrVKXpOy0Q2Bme7Wmz/hphEZ6I7Pc3suqHEO8LO/QGwKDgAKjCS5?=
 =?us-ascii?Q?2pi+620Lxiq+ITpZyLyBxFJcDFxIz1C0Ed+olCncadCh5sf7BmhG5Bsb/s0w?=
 =?us-ascii?Q?qAkr1BfGAuNmuB8WLDH6IWaogs4ssQqpEsVQd8t0maLgLmqlKw4sGHVgjfbZ?=
 =?us-ascii?Q?yhDJq73p2W/H7v4AWjK4TsdehCDVJ+vdlErDP8TOZgQJHDMqlk5XgQuPCXG4?=
 =?us-ascii?Q?AM5tnD+KbH5O0OynsWjdwIOxkpER4LFNMyG0qTeYaQ98gNAI5tbypHfYfSR+?=
 =?us-ascii?Q?XZq4dw79dzDREyVI4ef7AenipZZCcNW/5TEdruSxmGiS5ih4j4OlyQdVh7fx?=
 =?us-ascii?Q?m1rtQ9Dezeg28aJ+2q2egtX/Px+/OSGSzPOZv6kKu54JsddUPUg+O3K0f80B?=
 =?us-ascii?Q?kd9cBPTf+m26TLVWpwB2jM46x/lbDgau8mSl6FvDvZRJ9XkrszTkknh1f5do?=
 =?us-ascii?Q?d/RcpiMtfVYnsRIfgWrZWTb88QM41hIJPIB6kbvohXIuC3rfrltZ7cocac4J?=
 =?us-ascii?Q?FfVpvCfz5Bi0nb2e93How2gC6p3h2BAXUbDl9s3eP6UTsPEynwqkt4+8I+NM?=
 =?us-ascii?Q?zabmPuhKShdYP6N36rfvJ0OXoxSKPc+MYAzpUdTv5dqR0Tw/F/ioASRNuUku?=
 =?us-ascii?Q?5afPhb7ue7RWisk9kHgxYUyxH++gKyvuZFyloYn/KecId8b3qz3TGglz2Imz?=
 =?us-ascii?Q?uzZ3aMncendfZBfGo/ubyrUpfbJCNeggLUYFMMCpJ0wfUsKrT71F5LujY7wr?=
 =?us-ascii?Q?s6zlZj+xSVgBlqrWHUyLwiKlU2vqHK6GZ7so5lMAjFvfyY1a+9GmS65K48qP?=
 =?us-ascii?Q?jKLbuCBCycG8QQcZvNwj02qFM/mJVgyNQ24EFOkW7aVfngw/WFoc0Z364tac?=
 =?us-ascii?Q?VrQX38i5HEPU7JBGSJ4bsU3mdZ6VuafMdGYCPLn5ugTTO/gRBfT2JeUJjqmu?=
 =?us-ascii?Q?nkR/g37FgGvgVVJHUbNoDx5iBbVmj4ONVTSv9XTFmtxPzLng+0X9WUXc/iiT?=
 =?us-ascii?Q?6xNi2bL6StMpfWsAI3x5raktRbQSiAH2qr0cbVS52wjr661TXV9n1avCqBCD?=
 =?us-ascii?Q?eBk3H0OUtBHUFR1DXwXeBd4I2FaJNSnxtIMEjUWsAN1QPQGZdk7M6CWidVJ2?=
 =?us-ascii?Q?He8wXgC7bgX1TPBhgmfm5xg7rpjIAJamgM2xxVhuuEZeDQ/ZNpebxjbTxek7?=
 =?us-ascii?Q?JWjr1NM04lQg7ll90ZF2Wtw/iOQHzeRDtYo34c4Z+FL4sLPIC7rH1WZclT0j?=
 =?us-ascii?Q?Wc8ClOuUhhx/yqF40cAv8+GMn08H3udbDDQ18I3X2WXPVgpdt8DenSIQ/nyl?=
 =?us-ascii?Q?oUdWIlzwgU+RcphPHFmj9BrvZ0UDyNhzD6tHEQTL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbd0602-cffa-421e-35d1-08dd6029d237
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 23:18:09.7180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lladEKqvQRMnrK2I7yLW17I6FZ2W5X19eT/SCkNE5jB2EqoshOXfzrYd8yzDn4AC8xfbAg3vadwJwp2oW3UHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
X-Proofpoint-ORIG-GUID: XkZHUNN35nbx6EV0OkVg9M-6DD_vpSYN
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67cf7334 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=IhJqg8CyjCCzT4Ug31kA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XkZHUNN35nbx6EV0OkVg9M-6DD_vpSYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100176
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115841

ChangeLog:
https://github.com/catchorg/Catch2/releases/tag/v3.8.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-test/catch2/{catch2_3.7.1.bb => catch2_3.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.7.1.bb => catch2_3.8.0.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.7.1.bb b/meta-oe/recipes-test/catch2/catch2_3.8.0.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.7.1.bb
rename to meta-oe/recipes-test/catch2/catch2_3.8.0.bb
index 35cdab5e82..dd7ec5469a 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.7.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.8.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
-SRCREV = "fa43b77429ba76c462b1898d6cd2f2d7a9416b14"
+SRCREV = "914aeecfe23b1e16af6ea675a4fb5dbd5a5b8d0a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


