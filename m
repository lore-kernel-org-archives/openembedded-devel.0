Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B93CCFA04
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 07:18:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4037.1762327077882824743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 23:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vb+G+rEo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3404438c32=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A55akIw808921
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Nov 2025 23:17:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=KW+mYYRDb/nlh8CkTUyP
	yx0B7C8T88WZewAHl+NYvpc=; b=Vb+G+rEo7GXZy7umbmoWNgbIx0yiK7Vf6VLN
	zouztBQvt2RK6XHO8jADyypOqWAdYZC+YDW2sEyRyFV/VAzvytdIX8C73aMcSGdi
	POj8eh+Xonmvd9lZfqhAHKUU/Fk7tbfawO+JI+Mam9t/q5afoAwhkD7BorWZB31c
	US5MGdQ0nO4B1PCn2bWI4dBdErPnrj146E8yVWCmOuZhgjcfgK6b9IBLeO7j2pUf
	2lRIYYTdwj/mINePqZwK4ypJA3vz7zzOS+bmQ0dQPpX4YeSBsMxXB+1982XN+Ip1
	5msZ7DtuQoDYIBntpQxn5w8b0WgZdyzi5eLm7XseRmJhHuqXqQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7w8k06uw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 23:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXjO4zhH9J89HnI2T/4JnFOri5gR7pEXDIXJ7CoVxf8tMWdyJbXgskgyMNSezjy+X2oy8fhQDHKJ06QYFDOvNLvsHyNJO2kK3YCc2lBF/0moXyl9YHhT+D/U/Py9AmMOpWVqoDGf3RFus4ENJAJjSlYfcjiRarYpt8uxugJ317VAQrECDD+/RmiYxxBj2ZVV27HuthDO+HFDSokct6/24jeweZjI3Wz3TGOdxC21ed2MAdh+RCvifpp8Q09oo+kj3fZNP4p7jx1If2O5UfDWHZyocPlQrEkmX/u+PMNUvX8P8Mter+4npA8ktFCWwi+/I5mDq8oMcQvtcRN01Lw2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW+mYYRDb/nlh8CkTUyPyx0B7C8T88WZewAHl+NYvpc=;
 b=MSW3Vhag/OAOLTB5c03lSoZ23TW/qhjYH92HO+JFj0ItTA2LDyDXtDvOFyvt0wWK7SU94Gk6EWxe5zc79Nxc5hIcDMhG92hmVKrCcep/xrLn6t7tTWaieRB2UCsolXTqEe0deEDHAZ/5FEAOR59vHdUHpRQs0FqvsOrOg1ZGPl2n2hGrRY7Htf1sLXJuo/ZChCpDoI4i9RY3PLasrTYuKr3v06Rwcb8dF31XMTntv0nay9OUXrZgncQOrR3a8JNpx8Rbfks/Hsi81PueTE9/aUKVsn1SDZNeI6E999gc8x90T0Fzq1TLmbx1i2zk3WVa+hvNwzaGLcktmRVFCV8vGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 07:17:54 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 07:17:54 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][krikstone][PATCH] mbedtls: upgrade 2.28.9 -> 2.28.10
Date: Wed,  5 Nov 2025 15:17:37 +0800
Message-Id: <20251105071737.3129017-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb0327c-c77f-43b1-a456-08de1c3b7001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h+K8hWKKujaPeMRR5LyjxXMOcw2zQVpbyqXXm4Eckr1Cvy5ESMBXcSwD/9Is?=
 =?us-ascii?Q?PheGariuqXcBNYKWJ5Fgb5cs6NKsgaIQeo6h2REZhT69wKe7V2MVlusrTBGB?=
 =?us-ascii?Q?mBahlJlGDFN7RpkT4U7+ESClZzAY6jRczy3+aAfM3I96tINEatlraDzAq/Th?=
 =?us-ascii?Q?7CFxWwVCQPMgvIsAhEMHook1fmAs8quON4zSun8SHHJCIjTsY+w9f687+nVy?=
 =?us-ascii?Q?twe8uOPPeXa4acDHVX6DX5koX9/lW249w3TM6D6+FuX/QlKV9/RNOd729MSu?=
 =?us-ascii?Q?5/cjvNsGzdK7AM7R8HpBeObRy1Ru48wYvoeXPJLj2VLkLPnGMt4ARjzvgUzw?=
 =?us-ascii?Q?Bi48vPlytdsE2xk76xi+A7fDah+Y0dv/r/XTjZrvrxazWCEnySdsYpM6abKd?=
 =?us-ascii?Q?l/uIcAOV3UJV/kczSNAZjgl8iBG/fWUIWi3yovDo/4VInWI8vyIR8W9iyUab?=
 =?us-ascii?Q?BYOPnd0YLT8uCr8tDA8hffBMT1+ksMu0tD1SXAIru5H1yZI72iXWAybOBhp0?=
 =?us-ascii?Q?PGJyH+AwVreZioDnizoAHnvWjxFBL7X9wvclUJbWpuFPmu1eW5OiWRhOoodf?=
 =?us-ascii?Q?p3OSQtxb2iN/Hb++EBl0PrQcddudicUbjzeGocms004qV7DFj0odDbTIS7PQ?=
 =?us-ascii?Q?L6irnLgAXF0IUZJubuscr6acAZNcKKR/DzuXW+cAoKZMGYOeDi1spgbNlF5r?=
 =?us-ascii?Q?nuljIQSxgEJUu+t46Y/oSRMf9HxvblDBofG9jjm2bMea0zVBAHqt1Cp2cMb1?=
 =?us-ascii?Q?LGYW/URKrKc9SVuLNxSfYaHitJJurG/vC55flNTx/U/zNRZ/NWkTr1/tLyVX?=
 =?us-ascii?Q?kuiWyrHP6aVZBhsRZyEYiYixsfrLv92zJ+/DuMM/NuZ6iGPWHl31aDN7zW8/?=
 =?us-ascii?Q?MaNXfDf6HZx+JTw0bXiE/evxEm1VE/8taB3hgKRGTwS55xBqrpJdWbaHG2Bn?=
 =?us-ascii?Q?QyWpOtTes7yjx8ltFwW7lyAy2YiLcU21F5OQgBlVWIt3LPKR1lmiDR7g9Sbh?=
 =?us-ascii?Q?9XKAmwsX/OuV3tIN87MGN1JPJKndRjtewlQuyFV3vpN5NjMY+lJhgOd7w9wr?=
 =?us-ascii?Q?UmTjVVWCzJIne8+foU0hV+ZZIkvSFheMw8wU89LXRJf5ruUL2Bc3SzM5lgfq?=
 =?us-ascii?Q?EuuuJF7TsumRbul1djA2HkTz4cNYXJchQLsWYY7UhMh5g++g4D6oYBt0q42f?=
 =?us-ascii?Q?7IMgqNqWyFtdjJIeESj3vEBFDeNZtRZAoU+Zt85oNwfvSX44vEtMy36eqro0?=
 =?us-ascii?Q?lKwdyReVvNL9nH0fGeG0J+Cv4mD8/q/VaE6YomXHtcHGJadTL6OMozkDkuZG?=
 =?us-ascii?Q?Af23FPt1C/NePwmR4QS63DFRLMaX5cdrgHwwhq3V5aX+px5LOCIrXhhV6RWK?=
 =?us-ascii?Q?WYasiyC9C4AJ3vwvcQLjzyTWHfDwn8qkSomokiJ4iVmquUkRjHYN4WUA++Sv?=
 =?us-ascii?Q?gUTTIHC6sPbglSy8+Jxsj4vyjnrqvrnxKWWDIhcyBeI7oiBefX0mNg6Yb4zr?=
 =?us-ascii?Q?WBOOnNFAeQSTOD6DSJa33fh9g7wyeYo0bunK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1OQrwezXfhEY5QGGlXJSQXnkehQbujRvkzRJQKRMcIkro2eDbNW2Wv+WJ+yv?=
 =?us-ascii?Q?TfTRQLfe2OI1At94yc1IdlkWbxhtQsuk4IH+gxU9wrcLBWYPepMNAnRlu4f+?=
 =?us-ascii?Q?TwxTWKW1jWcY7CNnXeloEu7l7Ftvv9V5axZzQHlo6qiiwFw5aCL3+HcIJTNi?=
 =?us-ascii?Q?mBGHUmYeyxddX+nevN224wPqJUsqtlB0ewzyN8f++3/tTM8BzRo2H0oF8kdU?=
 =?us-ascii?Q?HwmpivZ8kPyzJpEe2eY8yX9Vp9EtcByj6EK/4/4oqWUJ+tupuQmn4BT5wH48?=
 =?us-ascii?Q?Y3pOjSuLjCdwDU2R4f9DzB4XBZbIgFgFKQXf4uAWj4cXkTk20eRva7HwaUqg?=
 =?us-ascii?Q?upOt6azUo2+W2WU9ZefsPXg2c2uWnvB8RWwpUDWN/KrkH+Pt7P9wvyjVOuXh?=
 =?us-ascii?Q?5l4Q7Aih1NfRZ6o7wRSDgH8/mEUfbOuR8W/hAlHueQNGUsE81Q9YyuIGmiwe?=
 =?us-ascii?Q?U+bBKfyuhctuxSal24hjqCWvmPsClrxrHPunWYVWJFn7XsQPFMVSMoOwRtCX?=
 =?us-ascii?Q?nWogbNNtLawlNZuIICFRPptVp/VmYTfV2KbqaVcWz5zMo7GGkU+ZIAohREjG?=
 =?us-ascii?Q?9FqnBkvdvrQUujv9o+EZQjAfrTQ39C39kr4XSBmpCNxASTW8FbSaT88e0i1Q?=
 =?us-ascii?Q?sb1wQodNtJwDVsvu+NpEsquYACi8QnwqTZUr3V/PlyE246FFTHjcBM0mEr1J?=
 =?us-ascii?Q?11RdNXC/qnk2s+pd8FDYAQGxhYdgljP7qnN7VCkkgNuuQ5oTjwxzgOFx3azc?=
 =?us-ascii?Q?2wKACwJD4PDayti4nx7n+NaT3OuD76496HdvIX26e3I/5eqFMlFO9q5e7Q6R?=
 =?us-ascii?Q?7CbZjO6QkqL1KDEGkeiXV3wiwlMFZ2bJzG0rU/jphxao79q9WrarTjTqUDBK?=
 =?us-ascii?Q?+irdvTlLxPDBP0GV/iDNBYf0gbHBsgxUlTOBreIPCUrdQgMPpRGaMJonqslP?=
 =?us-ascii?Q?UV3op+QAFs0Ca2fLae6t3SWCl0N99HV3Ah2ZNIcglcGXyxyNmTK/Oadio93r?=
 =?us-ascii?Q?a074EwUoBMfOaG6kIK7dfjBrL98kzaLQ/TTckJzbqv2H8BYNwnXqKf6z3k2j?=
 =?us-ascii?Q?/Vsy1yveKvrIWPGSW9SOLCzkMvjdA40WLIOicRg65UA/+wiJKZ/YTBKf+7qz?=
 =?us-ascii?Q?bYN9F9P9EchS+n+z4poIHj83qITH56YFZL+O2tyqyy2AEIgNTnoC6KPUOT0C?=
 =?us-ascii?Q?urRZPqi6oZOxEzCe5u/WrgBk1y7cKIBLxc38akNRlUkuuCiCO4upoUZkwJ4+?=
 =?us-ascii?Q?gTAqlU5Z6LkVlf8pydvZpKwCEt0bP8+bqbWbTR2hxg25S8g28YNq+FIaERR6?=
 =?us-ascii?Q?XoeYqD6Jk3X2egA6fjuBIu/LsqNSb6230DHk+/+IThnaQjyjccombLMg4Gyv?=
 =?us-ascii?Q?+mN3L8lQEthbI/LGzizK8S4FbawNuWuCg3KtqHzRi/kPFyE6NFesx+YR75sg?=
 =?us-ascii?Q?R3t54wDCNh5zKuzorq79Sx5Al9KZWQYYS6nlLyr+T6isTHLBKZ+nqkXdvoRc?=
 =?us-ascii?Q?Qfgb+q3I3x9F8OkrsZI+lJRwDetRKm3/F1NeKDGKzGDR3fGlwF75tuo4NChN?=
 =?us-ascii?Q?vpk++1iqeTatLQcOgwvL9tJn0SZBQND8+nCR6TYx0yW5Y9iDP4cyT78IDnbA?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb0327c-c77f-43b1-a456-08de1c3b7001
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 07:17:54.5330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eih2bvfXMdlLFLwEULcUbXIBHTnu6UYlmX7+B6pVzC0t8zSjiYb8JEQ2r0/LGDfnbPl/uIffZjaNiS2HCmI1dNI4zPT9Ky3UU4ReFaXS2ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1MiBTYWx0ZWRfX9wNHRzXfAyFc
 jGGxarnmkERsqG8Qa+ELtrMpBoy3hLt88BbmMXaV/uHq9v3AzCLX+3n3ee1vx7v6CyfK0Em849C
 R6MoqSgCGJcIRZv/l5EdRJZLMxMPMrXeTJqNZOhVtjLvbMNDQJquXdCcGocav5ZcKIBIWnzHADp
 N7Uz1Rjjef1zPOM7Jxpk96qnuT0N+5VGFu/i60fhXFaPcLhx8J8gUypr/Gk4VWLdDa88gXUErtx
 mCJJ6ttWcARybJ1OJHpyknI9MTBLSs0Njj+ziqkk6YqDZhx2nvGgj3uST3xodUPTWEUujyotxc2
 O/vKBiCkvM3NKnBXeiESzaHxFkdYuOTO5wjmZQaW01UAKyEICltgOGtlXukzatHijeLNnd9+luD
 mje5HTnmd9+AXTYw+nNWT1r/qA7Qkw==
X-Proofpoint-GUID: ABXJTBTfxBTkrNTcB0fE9g5J85JU-dPb
X-Proofpoint-ORIG-GUID: ABXJTBTfxBTkrNTcB0fE9g5J85JU-dPb
X-Authority-Analysis: v=2.4 cv=dovWylg4 c=1 sm=1 tr=0 ts=690afa25 cx=c_pps
 a=9+FlcKToPViwBAZXYho+KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=w7DaXHQ_nlfINUCxHZoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 07:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121320

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ca08c742230b758f6ebb428901d51169f1e6044a)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---

fix fetch failure due to branch name mismatch.

 .../mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.9.bb => mbedtls_2.28.10.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
index f5c2cf979a07..61e740389cea 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.9.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
@@ -23,8 +23,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "5e146adef63b326b04282252639bebc2730939c6"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28"
+SRCREV = "2fc8413bfcb51354c8e679141b17b3f1a5942561"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=archive/mbedtls-2.28 \
+           file://run-ptest \
+          "
 
 inherit cmake update-alternatives
 
-- 
2.25.1


