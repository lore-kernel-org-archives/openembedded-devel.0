Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D378CFD2EC
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:52:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7014.1728636777349041940
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B4VSdm015750
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 01:52:57 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sfggahd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 01:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nxz39OFoIADWkgquhsoaT/t3gi/Hw+NyRu2sSpiBI+Pd8pkvciyloUB8i6LNQNjUmN5q36d8l2bqI5HWQxL04yntwC1Hq1K1Ck+nXh4tNd+caSJGBbBMg/1Lc/abvTc4P9JVKdLTSLB89YKbKhf5ubFQF//EMtCjCscA5ZthiLMKxSVVuvQDlp7CRCCVQTi2vfkhr53yhC2cqgrDbZHvdM4hjCpc2AwYiNuVEEkxj7t8Hi4Wh/T0HFBGy/Psq0FoONgFVUyPzaP50tHBHHlstSI9bHzmV/xLwP9TOsuGZpzGJlq4wjrHbtDTbjQn0bnXjqo5DjZx8maqXWwZIwXJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQqkGg36tQMxahWCKgKBr16IXSWbWoLEJAuXu19Yma0=;
 b=bgFvDrwrpDSSfk3MGPThvatONkIheADpc0uvRfzCpiM3xYpr3Dni654QO1TsMayqNjX/+UAzV+QQjF2+x9avHjVjEJBljyc8N0KsbZIneRp97/AF3zqM8oioaXFvY0tS5DiVPzycUyJOaHrCrJLBzBrXrKo5IkxGx4CQb+ullhMnMt5hWooe4+kz/ZGVvUvYvbw6vrpNZFSqRxAq+IatcKmZF5GqnrJoSsOzy5bvujMV5sohKFprh17gOQ/99siULC3DAhPfpEzZHlCrIAo+WD5eJ0RIBEY/rV7xhYZM9wLriWn8RZgxPTrXGOjYdy5iS8vbFjCSx66HwoOFiVC4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 08:52:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 08:52:52 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] keyutils: Update SRC_URI
Date: Fri, 11 Oct 2024 16:52:35 +0800
Message-Id: <20241011085235.2199377-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 3406b77e-5491-4a6e-0e70-08dce9d21746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F1mepT3aQFAs7HiA10ESMzvJvaSrFFS/5s5lZ8jGUSYD6JPJKZqFx79gboSM?=
 =?us-ascii?Q?O58pu1oI7Nce4JGvAjUKsl9U5fj3yghlc+bibz4iSGv6Oe3T1mqaK93BI5ys?=
 =?us-ascii?Q?P2PJIDMCPMdXkDFNB6SZa7a2m/ZrXowwomQ8WQosLnl8cmScnTjuQUYTYgpF?=
 =?us-ascii?Q?vqAA6EKhCjE/Cjnlp+y7eNyX4ZS2PhGilm790/baYX9v536k+wXyxrDvhtny?=
 =?us-ascii?Q?xPncRHwznmC6tcNBxpjcHWUObot22HT9nFyQTMSwlHVXakQ7siTp2u/hxnSf?=
 =?us-ascii?Q?2BY1ni6PTjIgYVjG/AO3TBFw3Lzzn4PiKKYg4kiI6UjwU/e3NrcqOtX28Uwu?=
 =?us-ascii?Q?pLlUZAx9UD9GAN1Ypt+PGkFRw8c80iY47Uw4i8XYgFlt/p9Wxr+i/PPJa3hs?=
 =?us-ascii?Q?fHbd+g5aIkV16slQqAVZXcWJ25lHy6vKoWJbFN9iUHzgKp1DdwixY4KZ57bU?=
 =?us-ascii?Q?jKWDnplWtArjp0f7RPfYEaRyHTkYzurf+oplKe0y2iVf8ZJeSLRpz639rmnh?=
 =?us-ascii?Q?qJOLS+6ojlaua9s9zYe1LbheyG1WkpkSyPQ1dadI8ELjtbTYQOmzawcPYbdZ?=
 =?us-ascii?Q?ZYeIwbhoMfL2j6WGtRBtbfcW0C7DTkKZ3UNICrc+zv6QSJCCfzO++0qJqsiW?=
 =?us-ascii?Q?oXDxrQU2/f/pB45GRdh5O2r9tsxZ+T72qPg3zWIGBcevqPeD7mM5GkFR5m/O?=
 =?us-ascii?Q?tPLRBtzoGsbsrNtcyGN0IJlI29AmkgoRYVkWoIs1CXWVUwbIH8jiz7n8rX5E?=
 =?us-ascii?Q?GJk6XIdFjOdMGzFHpaw3gws0UcnvYqtoK17em1xcWTkCeIZkUkW33++7l7by?=
 =?us-ascii?Q?2Ppd9RAPWqGNXGHFWjelv0BJmYEMNOabwcQxbvib/sSN2oZwjxoieRFfDJQI?=
 =?us-ascii?Q?xQIEKHJr3eqPnHlWVTrXLDF37WkBDEifBB8LP5ptJkZsSdgC1tejt7wzeNJ2?=
 =?us-ascii?Q?Fd291cpmX/9dGqJQjJC6gJezv8AMznwdcZmtpZGAj4nJorHuHDnwDAj9umUr?=
 =?us-ascii?Q?7pjYBe6ZJDgQmqM3OMNt5/yyWpG0yob1CFGrbbUrVV6VQuuRLbxlHIXSpobC?=
 =?us-ascii?Q?DF4jwFrMI/EGyh7chzi1VEswM/GBqbaHxx/pvQ8lLHjvYfXTAbPD843lP7wJ?=
 =?us-ascii?Q?xz90je0ljvVYZ7V5lVVrWEtdOlyvfJejXBA+9bpNR2ZkWDuZfzL05VMQwhoD?=
 =?us-ascii?Q?v20CB4WkLOO3X7qH+AAA/oP/W+jFW1ntN9HlMMIYMbFHMgjPe0yuiWgIBW/d?=
 =?us-ascii?Q?88dWCAWdTlSSXLKa/z1/fnY+CZk7YdHOQJZxJhjWTkOyVmjFFqye0c3VYQU0?=
 =?us-ascii?Q?JhzSyeVja/DvB3NTiGpv55TSDsfMayEo3hxFCfruOyJl9w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3wVCBS8MVZ07q7Z0jmp+46ENc3vg/9CE8c3qGTUfH64vJPVw94y9g3g5WMWC?=
 =?us-ascii?Q?kTGPiJYmIRwyvmjRfNGj7iOLp5Meu4fXSoR3Yz3yqdT7IJSNAcNx/+Ha53Vb?=
 =?us-ascii?Q?/h7I0M6fetO2dwYHQLbFfEL/MU0UWb94duNFfQbLNLMiEpFwAqYUzexJ43Ll?=
 =?us-ascii?Q?ITcZEcSlxZ8Fg+YbICDOtOKKGEMreAdJBCyMEEYD/EbsNB+0+lK2bq/BOknG?=
 =?us-ascii?Q?nXLHsqf5R1gLsyPhD1hvnq6S2BylLVBOH+NHUQ01744wacWWcUUxlLb7Ec6N?=
 =?us-ascii?Q?Z8uw1Fp2MsEOEADBk2MvhNH1+W6dzolEG0Ccm6WrOBMrKgf7Px7Lc+8b/Oe6?=
 =?us-ascii?Q?sEqLbGWfZ4yFVl04nwUFvIIc/KAPap5E7Aftvf50H61Zbc1lmy0cmPqO++oP?=
 =?us-ascii?Q?E/13cnKOLvXfPg/xptq8JsjaDorSKrmzrdm6xhYEutuXbwMOBsxvTGPG2aPj?=
 =?us-ascii?Q?nmcwAOkNCDXtwmQAf+eultsY67XTkb/4zSPRX31BfVBt1uE1AzkFC7B2JgQb?=
 =?us-ascii?Q?2owRosTw9W0DOLk8D/SV9oprIci/tcjvurSnvUK8cJQROy4U8pl5+gSPGlAJ?=
 =?us-ascii?Q?7hVORvW7M3U9/3Lk5UWymZIiJMUD2iDcKPJ6QBqd29w2DtoZ0F2y4+x9StBX?=
 =?us-ascii?Q?IE7n+dGLid7WGvqG1b6/3sjI2NZ4J+FNNFYK8cb5k2du77vqBRXC54TwToZx?=
 =?us-ascii?Q?Ag8EN3s5q2ZkxcKcCfHaJM9ussmNncFKsh64qBodxVnnnCpwHgvkOWYct+VD?=
 =?us-ascii?Q?2oY8Uv+XJiPK0yIxQjR6Ljiqhbj80mbhj42SXNg6rJA3+gJk2ZrW9qh08w/3?=
 =?us-ascii?Q?Vehig9qEnLPN/A0V1JGpDxBmo3u5jJe7q83VmoprMW4famXjK6MoTBFC7DmR?=
 =?us-ascii?Q?ooc4j1GOFRxqlrFsMKOcw+6Ib7yD8zIg+BOGgwMnlilwKFc4iBBrGhMbChN9?=
 =?us-ascii?Q?Yo0Sxik+j/ENGmDf1nP1rmk0oRnigoe6V7jTzaGkYHtniIVqyUcHULaqWYV9?=
 =?us-ascii?Q?/pmHVwr5rpKhkw29/vXT98xYt+XscxLfmdTSCf996EejltXQ7gepgUo5eQPe?=
 =?us-ascii?Q?4vLh70D3QqmuCMqTw4Y2w3EBRpRLFwFC6V9xblJVpO5cSnBU5THv89PgoExn?=
 =?us-ascii?Q?m53uuk/eSHaS1BNOeX8Rvv/HeLnjOXFxCSzJUxXpbTYHBhvi7R0YQiRC/rUi?=
 =?us-ascii?Q?Z6Cgp2/07Rit4CBMSGgpeoCg2I1DyhF0YxQEbnuUWosYoDkw9ASm49nDvf8j?=
 =?us-ascii?Q?0wSVh6i8KN9UmlU8yPKTNoQm/oFGrKBmUhnuzciMjcl/NH2FoydBbkVIdLQa?=
 =?us-ascii?Q?zuyLkVGtB6KWPFrYIDpyOPhFtaY2fGVe/ZkXe6wtEuWhXOd/EeKWODFxUtkC?=
 =?us-ascii?Q?lwCxJTvLG7t3AJg5hjPU3mPygPM3QTHFHQAm4VkrpVE6lPL5nUXMl2DGeorg?=
 =?us-ascii?Q?Q4TsvHTBi0onK4zrmJH4H3gJsHDkiHUdzg61dycJJFqUpawfKnz6jQ3e8OWn?=
 =?us-ascii?Q?1qcDdnwt2sTbGm+TruC9z9I+pQIsI3iWl+3tvUCpsZmncBmpk1vPl3zBQh15?=
 =?us-ascii?Q?1STlbrSc4rdijm/E/R4MPJExVzHRRgjZYDKScfMMGZdqiRdwPr9PM2uJyG3f?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3406b77e-5491-4a6e-0e70-08dce9d21746
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 08:52:52.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoDL+dPuKgehgO+td3M8qbbobAy8dcTelZorcatJu/d9fsWUx9cK+pYz3K7PaFfzGAcHhkKWYjBLo8p2DGQGqbxXcYA0IxWS2B+dxQbbfbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
X-Authority-Analysis: v=2.4 cv=QrQM3kyd c=1 sm=1 tr=0 ts=6708e768 cx=c_pps a=GbYsmhbcUJoGoLxTsnc7yA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=kjb2NAJAmlzjKS57w6cA:9
 a=ZXulRonScM0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -Sb4eLgbAsVW4IruKKGV6k3ry7IvIGMH
X-Proofpoint-ORIG-GUID: -Sb4eLgbAsVW4IruKKGV6k3ry7IvIGMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_06,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=675 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410110060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112790

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
index 8a95a15f6..a915b7f2d 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
 
 inherit siteinfo autotools-brokensep ptest
 
-SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
+SRC_URI = "https://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
            file://keyutils-test-fix-output-format.patch \
            file://keyutils-fix-error-report-by-adding-default-message.patch \
            file://run-ptest \
-- 
2.25.1


