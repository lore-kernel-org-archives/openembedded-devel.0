Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763D0CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 01:16:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26991.1779326206535706897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 18:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f/hdIgZg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9601a9f99e=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0wN0q3514292
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 01:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OqLjsuW4Chxd5EdDqxDJ
	4yzRg3tReciohCO3noJCDAE=; b=f/hdIgZgA2a2jMs+PSSTRyxfNtx8bxVj3pEP
	Bx2sjs+8ItryaF2t89/TLZi5aLE15fwJ+7ISU12+wqECTQhhxvIKV9Zk8Al3fM8m
	W6ZrwKbvzNu6oWDlHTpnMu8cts2CeMM4/Y3Hr8KD8MHsdfiHMHflW5hQiInYjFVX
	8yUDLgme5DPmnOXD/Krmt138ADdA8BfuyCAv6LTq0sfj9ddakdUBXaKTqVBfbLDH
	fcufu0es46fDXE3n8n6dQ9+cugvD59RrfiR3LiTIVaW2/ao2Hvr/guBlKVY2UoQs
	qgW8c76VQUPPZ/GScGujfBe2OYLv/YSqE9peVsrtM2RWkRhu/g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf6ej2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 01:16:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7A+Bzak57naUB8Rh5k0yABKIB6bbpLXYocKqaGoS13sh/CU0dYipLcSfmq2r1gmKU7veW4xGcARP5PQ6VdKsjOLI/XlVmgcAhS6eBMOASoeYDsichi5R0XRk/Cge0e0zR3TRUoAviGY0UD4bHtAAGl8G1voX/QdrTCesNijaurm6a2H8Nh4oipoDn0f7lfoYJUVVKrtUmlNKAs6IPlbr4FHmO7cgXsO9MtAjDWDYsEL/q6SNUYr4/WJsUjytlsWqDps66NYQSk1XD6tIFwgzjhRwcNiejZ87FGoSigzw/0QOR2G6HScwj7hEK5x2VSbpMog7AxBlr+4RXctDo5VUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqLjsuW4Chxd5EdDqxDJ4yzRg3tReciohCO3noJCDAE=;
 b=lfApy9xIJEe83VnFKbH3x+eetQhBQJ7ugrBdD+PefyCxsVXESaXepWPxgQpW4fw6l3sHoOs1zjD99YSx80q6sb9gOD2HPbUyXCbp45NoPW13uWDSHn0kRnznNJyFIGKSPvFLu3f1cAZipbdQZ/56Bfv+KLBuWgF+/GQb1uov6n20Mchl1mgWyeQjG0SKr59OhtBjqxvnYRW1pw/L18fF5DRgQPfTjSP6wog15w99DIO3WBt6N4x9XbkJ4MAB/daj9tuNsL9XiPonoWrwulvyaGiX511KDq1UQsGUjfSYnqWBcObfSnIds5GTGAT3FnZDmpyNdEocA/s2SMnho+nVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Thu, 21 May
 2026 01:16:41 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 01:16:36 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/1] postgresql: upgrade 17.8 -> 17.10
Date: Thu, 21 May 2026 09:16:19 +0800
Message-Id: <20260521011619.1246629-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0076.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::9)
 To CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e7c7c9-417b-4e5e-e34f-08deb6d69a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|56012099003|18002099003|38350700014|13003099007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	xyMM/zklx5N5KB+hua7xdSQV8I8dkhxz2P11ELSFZpVoxLfFFuyrzOnuQG4f5JTul4X8jwMHyTNtVxCTwKwEGz/LGcsvWkjdxli3ermAmE5/y+YKZzIy+UKKqbaCrUmXlrl5MvzHEDX6st3u6QDfXwyeXKh3citJczFZE1Gg95hCgdCwlAjan1oIXsbE751H5byujL5QIRQRPBO5wJoQ5+3BcHm4HPVSpRI0K6dnrdWMer2lc8NbK43pYcLBiLPo0bfG3tAiO+4mOiralYAzU8fFCRD6PUI0YGQ4u1pWQxJ4AnGZnJzk82Ivn6N7CIALW8Yc3lzgZGVlSpii+SMjWmc/FZ61LSmHihC6fOcowOvgEAbNYIxm1FtAAydmqS6maIwaLMsyYtr3Wp94JW39PNfy46ep9sVJ4knVANN80ULRcHDKxVJabWg2BB7zRraF+NkeyYTVtfwd+RlVNxHFb6wNFg4T00H6gC8GVCfjRnGsriOWUKxAoLODM7kBdC18HdEEMH1ADHMiNLCzTBGl7raUJihYk1ovYthoYYXpCajJy3aKNXRtrb2/bJAlIkZP2k/tw+6UhNlGutO03dy46H8Wk+b/w5RCvAgkhypbYPU+vk//SLI2ESsqgfnTvQFko1vggYiepkhqiRrmk2usRkYMgz5t+8wk334CNFhP+sHwO57JwbUlpoQFicHPIk5rdWzM3caOKyLGhZW8ssA0UA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(56012099003)(18002099003)(38350700014)(13003099007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VxXAxdnGW9buOznBr01/s6br6cgnFV1wEuvn6srkIJRp0QPaEMMBXjY5jPX4?=
 =?us-ascii?Q?jRvgqkROOO4m0NXBpGJOxqipxU5LvbJgeoi+IV/YaS0sFuiipBnZPmJUMuyA?=
 =?us-ascii?Q?+SU6RvT1hFSnJufau9GjYmkhlAN5gffFi6z8yWIYztFFQ8685oirKBTOYGaa?=
 =?us-ascii?Q?csXXza6+QkrTuDtDwVFkrtAt3YzLCJBnBceQC+/tYp4HwMuOMoG9FVrdzI3n?=
 =?us-ascii?Q?X8pZExqyZzb9XZ9EP2PL3j7kz2YfYYyF2psrZ3H0JdjklfmX+zxO42gX7+7V?=
 =?us-ascii?Q?X25/aGFfKun1Mi5tEp0P7IQ+Ro6tUJY/u894WyNRP3kxRzs4si2+Q7d6fUtm?=
 =?us-ascii?Q?MVyjTlvEYcuMMDU/oH7kc+t1+odAhetRX8mC81Wieb5737tRWs5xv76nXnEn?=
 =?us-ascii?Q?Lfj10BZXvL1Hkf6q3miaviIwFU6j4nElb+Se80iu5PP5zvSAy0M8JVjjFYFU?=
 =?us-ascii?Q?EBqqkNoiqOeOl+ohJRlZubzhhLo/VcgAjreoLMcUuYf9TU3qPev7YsT9w0Jm?=
 =?us-ascii?Q?ik/BEjCyMhCrt3ysa0VFLHjPH1eCLdiJVfLpJKS3M92JLPorClSM7NQOnqbI?=
 =?us-ascii?Q?3j/mIkRUZNYDw8XcpWmqp+wZkn3M3FPHetNdWKcTmRLcwffMVLo1k+X0OLxB?=
 =?us-ascii?Q?VUCcL+rTKpg0T8JO6ZitAw9gJ0IQ6Lyq894w+CNRvHe0P7fEs6ygYg1fEUM0?=
 =?us-ascii?Q?Q51UnPcZ6eDaVnvjd0fmUaaY1RmuJ7rTxW2W09poFow/nParyYoslskid1B5?=
 =?us-ascii?Q?5FzrsNUIIkZoN0sNnA2eR5PP1tq9FT9x+YUSfp+MTywBRgknQJM/8QPSz1LG?=
 =?us-ascii?Q?QHIcP+rkMpMU7MVfNW1pWEmSI1L4Zy2+qjyH4qjKkhSBbFma6i4Wp7EC13cx?=
 =?us-ascii?Q?l7YwBm1nTQDIZW8X4Cq/T/dx/yoTWQNzK8tDkeOCbAZW5lyHcnuvdRcmijvc?=
 =?us-ascii?Q?Ra5S63gWFUtSUMihJ6A6HKKEv2dzzKXqGwKyVGfQWDciNPudCH7cixwFUheh?=
 =?us-ascii?Q?TgoU00tGc3AT5J3rk+WA+iVthTqDf+mXaa+YeS2t1Z135X6YGCmhPaALYcF7?=
 =?us-ascii?Q?+z9IA5jznMQORjhC5o8TxKtgSC3KW2ebofyEr/4ZtE5FN8mDE37WFofEbI+O?=
 =?us-ascii?Q?l8c3njIypTri/nNxWrwOayGaeadDR9IWWs38Ofh29IhfjkGrWsnbSTs71yHK?=
 =?us-ascii?Q?QBnoKAqrJkYUDf8BA1ejHcjU70+pzy0My38ysRnD/M1tGTdhUPnF+02TKZw6?=
 =?us-ascii?Q?pH1RURmJBPfvV34oA4bABxzjv2MqQtQ+G6Rhq7vvLXjxW4CiJXOoGnq7td48?=
 =?us-ascii?Q?mTyDvkwQX6+dmZWCErz8eLCmM7z/bAG9KUESLbnA5LsRUjGAkqZXV+MLOE3o?=
 =?us-ascii?Q?5qYatDRVx2KOtxKWyzRYWELnJbxOACdb/r2mgndB/qEILmuQ6XS3bYYnT14K?=
 =?us-ascii?Q?cBOTe6xyPEg9C+FYLsIQvT6MjiG3Hcqx96ZzxWre6QjQ57T6JF3GoxBHnHNJ?=
 =?us-ascii?Q?V6UjNI55WVslanXxTywAbG43UqaSS9Q2QDF/c9CsNBF9uqcnc8FMiMlbqHwk?=
 =?us-ascii?Q?AK0FZKYJ76TWYGFd3+mXr4qScvwqdXem2W9BYA4lt70YpypMoA+/lzlB113Y?=
 =?us-ascii?Q?28rpylJKhOGHG1o9BgKlJRPkLw0n811Ylxn7LxZDRmChdnP0/U5UZcgNvAO0?=
 =?us-ascii?Q?FcpRTjstSETqYERpQULsFY5M90yo4WBo9jSTgr37+8RBZ0AsP5KfkY3xQaVF?=
 =?us-ascii?Q?uw2BVeaoeJDuOEwHQXsQCLFWV2fuVOE=3D?=
X-Exchange-RoutingPolicyChecked: 
	LJhwiHHHL9nk/T46IRZkkZ21YxOuS6rFgU3YAunITYk3rcX+77yjIUNQAdDtqVZm0ra47cp64cUnoDrvEwiq6pE0ZIuAodoRntbKrnbweUkxTzdyGKn3KaUhEQZ4c2PrNCfS7WAcz+wwHw7WzYcMRPJFnAG8sL9+0jv7iw2eGphxat9MlA8WM2i+qk0wVNtOnXUHrvBESzzs8YeaQ6M0jiNa+U0hetaP6ONbOzoikSotT+72u3qpTH8pz5SOeKIDAc8jKLB6Rm2Loy/D6j+zH3XtHtTkCIr0kvBMNC0B2sAFEQKL/5CJxoUI903rYueU3dyGklhbEPD7FEBtmhPAiw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e7c7c9-417b-4e5e-e34f-08deb6d69a22
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:16:36.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4nrDnDYO1qHtQcH7EHG1nvUuxoJLmkBzBLyoXXulDkLf82/yEI3dhur3ypuVl3gYWkZynHwDdehksP4stGQmcXYnA06fza4hz5XOPagu5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
X-Proofpoint-ORIG-GUID: w81k3GVUwu6BJRUQle9aemyH6LqV4MNm
X-Proofpoint-GUID: w81k3GVUwu6BJRUQle9aemyH6LqV4MNm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOSBTYWx0ZWRfX/DAPLUi4Pq2X
 0HsJez7Vq4IMkut9SIrNa6/TIkxG9YMmUVqkzxzwWrte6U1AJ2bkyJa0Nd6YXpvMqLsnOA80wIB
 IlFnGqpPquLedRvVvS5fkfi7g/OvyfNggU4C17jLJ4K/jQFBuRbFOzf9QdCe69C4pPmwMLFEtr1
 GANl5STfdFCwSRG/vs5kynXC3zBwYBe7WBnW4c4W0ZeBNyRNdfta5JOVgdp10bbPTGJiK5xZWMl
 /T4Bu8ucNUazQGeRYtZSraedf59vRPuid+k6khRlNaIhi2TurlJNsLeRgY2fGI/FX2Cymz+QxUL
 JUUo2V+u9yN3OF6LloIAcYIFeKkbU7dBImhRYRBp5Kv6DLXdhDyOyKNr0XQxis3+RTbehakYSN1
 aYsbDLwGL5gy1CZhz2cX/FWI7j7cvNkB0Hw8qsN7rD/T3tFBYDuhgS5ygpBDYzpAgDE8bG+ps+1
 6Lx5lCzxWPMprjNHV9Q==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0e5cfd cx=c_pps
 a=6XSCBLYFY2RPGp+89yprvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=epTmVMiNAAAA:8
 a=t7CeM3EgAAAA:8 a=VPnTTzXu6kMEX4SkScUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 01:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127123

From: Guocai He <guocai.he.cn@windriver.com>

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch
for 17.10

Includes fix for CVE-2026-6472, CVE-2026-6473, CVE-2026-6474, CVE-2026-6475,
CVE-2026-6476, CVE-2026-6477, CVE-2026-6478, CVE-2026-6479, CVE-2026-6637,
CVE-2026-6638 CVE-2026-6575

Release Notes:
https://www.postgresql.org/docs/release/17.10/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
Regression test PASS.
Logs:
root@qemux86-64:~# postgres --version
postgres (PostgreSQL) 17.10
root@qemux86-64:~# ptest-runner postgresql
START: ptest-runner
2026-05-21T00:37
BEGIN: /usr/lib64/postgresql/ptest
.............
.............
PASS: all tests passed
waiting for server to shut down.... done
server stopped
DURATION: 877
END: /usr/lib64/postgresql/ptest
2026-05-21T00:52
STOP: ptest-runner
TOTAL: 1 FAIL: 0

 .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_17.8.bb => postgresql_17.10.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.8.bb => postgresql_17.10.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index b91228aedd..ef8c524fad 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 856b091..646394c 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.8], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
index ad1e9704cc..98b8d4891a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0"
+SRC_URI[sha256sum] = "078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."
-- 
2.34.1


