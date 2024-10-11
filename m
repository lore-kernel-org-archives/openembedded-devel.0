Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA49CF043A
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 07:11:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6017.1728630702483229564
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 00:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B502c8010676
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:11:41 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sdq888q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:11:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLfahwYaRwZahGcJhXelWpvnb39DV/5lYg5MzyOQKvtnIlCH8cz2dOimF9oM/aHwmQQDu92stLT1M7Kgr6Jrna/ezJw3vHSkDvQo3GXesh1kfry9CXHD2vPKMT0Vf07EX7eDFJIm0Rn0BkXM9wh/X9qgGEEMXqEB8uGqvGIKRkKk0Xsdj+Vt1AaENKlnDEXyYsynqhKcCXwZrfAYdUGxtkTgDGQpQkE8sOZUwyfVDCGi1zBPZOPkzTmQTT+KpGEEprEoZdNF6cjLWEUUcQuNMGbSvSb3CUATX7G/1kDaDuTVFd7/Q4m0jPgIE5Ft2HDS8r2fNyvZ874fb3CFR6dVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPzsL1a/g7uKu/BbId4EYKqvIWLU4k30OTHUyp7c/ZE=;
 b=ldX0TL4i7u1OovN5cDeIeiS20u5rd+mWn+uz1qhwlc8s6jhRX9/Kdxd74H33fzTiWulDRL+NUIZnI54MqhudGfFvtglg1UC2eyFDmXmW5VSjxRI2nU9riyKN9Q4W5QrRekuI1Kz5TAYIbDwx9jeRfoGeBj5kDNpFPIGwjpWVAuCGSYASiQFhR3I9NkULinoH01d1sjfJHYFw/HvYg8+W4OnBjdUJaTlie0TBAXqwS/JU7B62LTYxmrv9/4/q58wEF29dPzqPP4VSVIs5ghfqOOoxkWdQOt1yayeSteCKdIxMkkXdECi4jz9pmGVFy2KSMVyj6XI3wACZQ2OYQrvJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com (2603:10b6:a03:549::9)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 07:11:39 +0000
Received: from SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83]) by SJ2PR11MB8421.namprd11.prod.outlook.com
 ([fe80::97d2:efc7:3eda:ea83%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 07:11:39 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libatasmart: Update SRC_URI to fix fetch issue
Date: Fri, 11 Oct 2024 15:11:23 +0800
Message-Id: <20241011071123.1936609-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:404:14::30) To SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8421:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 152d466c-8944-478c-9f19-08dce9c3f369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rGegEaDlFcIfrCQs0X6MIUyHOmqpahIuc6VdEyzKdYMSfXmNnkMtH7AduG1Y?=
 =?us-ascii?Q?OJl5YJCGlrJNiINWfnM21xvGU+Eaurl/ru5lYiq5LhDvKuK/Zk7SzjarTC/f?=
 =?us-ascii?Q?92QT4nJx7II0ev4Y5UaEnaFeOTTI6V3gNJReyO8eSQOzbUo65wXOK8lkdRLF?=
 =?us-ascii?Q?x2PvmS5MXkHF192n0i4bzQpXC/roOfGejCfVmc9p3NHKEAGXon7UmSGDZrPL?=
 =?us-ascii?Q?2m4M+P4rhqGLOJDkaBAcXRt1oKexQLZEkuMWRuv2fgvkfnS3UGTo89Iq0zGY?=
 =?us-ascii?Q?4e71inxETIy89SsF/cGkZrndxoh3j3PEZj1uyrL/X1hzRTkEuAs4UMCVdlIH?=
 =?us-ascii?Q?4v7j+bHUzAvbJTOok8uabK5EjBGlNGOiXXGRgl+Gai4Q9VsGbeChLQehQebe?=
 =?us-ascii?Q?hbNQ2n7GiyANNoLS0QdlCV5VUX5mYiPW4GKazkLJWlTmf9tzToZGwdtdN1jr?=
 =?us-ascii?Q?wbJKj7m9I79cZDKzNLc2J0ZpejkTbpI6JWDEIr6ykE+Ts1u1/FqB7tD5ZI/S?=
 =?us-ascii?Q?SJSa3g9RNqcZYmwXkI1BvV8b45xuai1PMV49I4YocTWQKmxlFUJU4jE49yuL?=
 =?us-ascii?Q?/jXI87IId2H0beNNwXkabOAIOsIuXZY13iqHS0aINXQYgkV/iIjeMAE6mpu3?=
 =?us-ascii?Q?2OdXnEOdAQ1fZuxsC7HJ4Kgt1I7oMI7C2tUhvQ5MiDn6Bom0CAI1jC93leyl?=
 =?us-ascii?Q?l6o6Twgp8ZOtpoqbVCAz7BngDXAAe5/KXANu032NrKAAz/cmF5kQ0MjbN94R?=
 =?us-ascii?Q?wf9FqEo1uns0GGyTltSe3DKo30qVOd2V9aXoHI1gQmEhH91pbtrmxov2rk+E?=
 =?us-ascii?Q?JvaND+V3DHITJng317gQWC5C58usPvWX8xI9HeV2t89undy3ooGbyza2wgiU?=
 =?us-ascii?Q?XiO8tnCCQA3FATG2zb6wCTPO8Pe73Tl/FxrLrOpveLezJZBSZrX/IEDAamT8?=
 =?us-ascii?Q?oMqwsd6yVqfpR6q3c8loLUS1LPNkisx6iQ6jn62Gy13/oetOiKH0IXaVRkwj?=
 =?us-ascii?Q?9XJ2U7n0dfIlgVqLGWKpQlUpqEBDbNr/x+S1Ch1HLNRFAjYo6nL7a9fm17he?=
 =?us-ascii?Q?1LB1drXnEnQ4jtYxSK6J5BYD7QhkOKo7tor9TB5KIcoWLaAaDRpEqMHkWd4U?=
 =?us-ascii?Q?cl//4XxjvtoaV+lUB46VZjqBIiqLL5jYy+zNkf/pdqZsC+3keeJgYnWZBCTD?=
 =?us-ascii?Q?zQ2wMYDIA+CkwHt3426umQC48PUxC4L8dH5cYL4dwi+Qx/sGxz7XukvFWFqs?=
 =?us-ascii?Q?P+Bi/mbzpjXibmq88w1XtEUo4jQPQCa/dJPSeOu0uj9SHNanW1Ash6+9SBjP?=
 =?us-ascii?Q?jyIKaQKqgcaMLoju4s3hf/yCZlFwEPRrTqTf9cgeoxS39Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8421.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bLstyEv8bGtQgkX+gQRsu7wqPUVIFL3mhM3kMFe7ktgRTYRjxaitKopXeIeu?=
 =?us-ascii?Q?vzK92KnCPiq1cjaw7pOjN4ERR/HDIiJYOrtn9fU7RJeUOgcBKSPnfndRvMre?=
 =?us-ascii?Q?pqhzpjALxztpJq5ysjCxo7glcfUu/JiQS76T0XVmhzsBTNWaVasQPY2ZR2gt?=
 =?us-ascii?Q?4KfTmsV0hK6Gj8vQ6Dwm9u+H5W2P1QqposRA3Xw9V0pPegHNVbgLDPmX4YCR?=
 =?us-ascii?Q?wWc/HYitjZidAWvYeTNrmEZyGcaDqHMMFsQKt6AWzlWppFVpVO3RpEeRIvSg?=
 =?us-ascii?Q?fJTmvHL2vjmbjWv8L8k+T/G4jFWyoBuBbre8+ACN0xf27IIVFu0j9Y3M7elT?=
 =?us-ascii?Q?lJmRLWayL4vLlN3TdST2DA/Hsf0dvUydIyfqOAMUQ+GK6tnyyC2IXFAFmyqT?=
 =?us-ascii?Q?EBILFnujN8//Icrr1a1Is3ewbeEi82GHjSbeks7UKiNbWlpHdew9owRMUa0E?=
 =?us-ascii?Q?AeLD9EF9GDjgnGW/emf4D4/jNWdpxCFypG+YxgqHAtF91IUHGusSa5Qc4P8J?=
 =?us-ascii?Q?BXLM3T2XAA6Qnpy848PFxBDNqHRK8mEcreEupVnxv078nWoVtHdb/vwyOTW0?=
 =?us-ascii?Q?eWZyAZacFrS5bWg1LB4dkeclp2RDJV6y8vXeSN8Q4k2TS7nV6f4A4/m8ncnc?=
 =?us-ascii?Q?Mg1XIPvDYkoP3ymhmX5wEF2YZsJYGik6P37vZxOLCALHyDUHm/AiSwujgHyH?=
 =?us-ascii?Q?WfLMGsD3LnbVgm0XEsHCoXdgIS1Kc/vEBmPzjZqms2T7H9EqgusDXmLZ2fWR?=
 =?us-ascii?Q?FtD4rvl2YPj5UjSLwbkvthfQnuRDAYt7koKiI+ErZiQw8AqnviKl5VnpVJY3?=
 =?us-ascii?Q?oW37Pb6IVPSPzKeMfOkFhEpKdbG8K0asdDncKy+ny0tr4p+1epeazc97/JcL?=
 =?us-ascii?Q?gOddc/cXmlZRgiIrZMs/p6zyEb52YgFv2dM4z8BXqiR3QAKPdISTMOdB02ch?=
 =?us-ascii?Q?0180hQtYiJ0w6KYVenFu5SLm2LjOVJWREWZEvP2Ldkzz9z4v6fZFsH2eWOK9?=
 =?us-ascii?Q?kIgoeR6e++cB4SH+Z75rWWDLQUKaEbA5EB87jlGAGhVXrxjbEZU9cC33FF5p?=
 =?us-ascii?Q?rek6SxPXJVmPtflTHRMYx6Xs/ciTcsg+ORKY/3mXpJHbrrDULRg7SYpgILpN?=
 =?us-ascii?Q?S78SpBfh7wra+VWKEQpaJaklT1q1DocFmjsztb6Yd5v8VTFVqytDcuiHHirk?=
 =?us-ascii?Q?77oZrKE25MQo7rQB4kS98nf0n8njU9/EeG/MG6O1GWG+KAwqB1/uRuWysvvn?=
 =?us-ascii?Q?JPnMzgrAc8NARhlv35atLcKDU2bk//H24EZFelaHKhM4shtoPWIEnJX3YHY4?=
 =?us-ascii?Q?n/MBOLxzBoSzt+EPQ6Xf3hfl8c/4R92GDaMhevdbrMI+dNNq/RfDlx/Mehy3?=
 =?us-ascii?Q?xayTkTuag5x2qEHzZlMhCBxx4hwYdsh9B9v9fvXDvX0fv60jUvScQvl7bUsS?=
 =?us-ascii?Q?robwgpiyD1zY/mFHsTrec+rp7EermmoTLSGFlZxUxXYoUixbsEJUE6HnPuE5?=
 =?us-ascii?Q?Dt4JvMU1OkWnhE5dJDYSPFPgBkZnJ6WNBfRMrT6hges8EuCKv+7AUm42UwSr?=
 =?us-ascii?Q?guze4vv0M6aOAveJc/882XgwmXLHm1MW41LcgpWbCCV7kEb5CDfXNSksU2Zr?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152d466c-8944-478c-9f19-08dce9c3f369
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 07:11:39.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyWCQ/Ck8wPmz2DlJh8LAFosPg9znPN1PWC8wixkKourPlcfELjGE3QPH4CXyXUlkqD99TKIHC4RtgambjdlQnJ91MtsC4mAhTfDbrM9k5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
X-Proofpoint-GUID: 8cN19enlO7Ik-GGJCofvqzcPtUEWCq0T
X-Proofpoint-ORIG-GUID: 8cN19enlO7Ik-GGJCofvqzcPtUEWCq0T
X-Authority-Analysis: v=2.4 cv=LfZu6Sfi c=1 sm=1 tr=0 ts=6708cfad cx=c_pps a=u2H4imzVBiBAAVvoIH6jzw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=6xbm41ixAAAA:8 a=UB-e77jO6j7I9kU_8C0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=S5GGVp12ez9_aiSFvI17:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=684
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410110046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 07:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112784

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
index f747ecbf7..8947b9fa8 100644
--- a/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
+++ b/meta-oe/recipes-support/libatasmart/libatasmart_0.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "udev"
 
 SRCREV = "de6258940960443038b4c1651dfda3620075e870"
-SRC_URI = "git://git.0pointer.de/libatasmart.git;branch=master \
+SRC_URI = "git://git.0pointer.net/libatasmart.git;branch=master;protocol=https \
            file://0001-Makefile.am-add-CFLAGS-and-LDFLAGS-definiton.patch \
 "
 
-- 
2.25.1


