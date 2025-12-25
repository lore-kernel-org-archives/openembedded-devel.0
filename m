Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DE4E7AD41
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 08:08:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.134983.1766650094964571088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 00:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aOpBaTTy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44546b9d61=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP7Aufl860259
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=G8PwEshBATzEJg1p1htn
	p10FSjfJpLIqFOH+pilgFB0=; b=aOpBaTTy3+cCCyHZw+bJS0wWUhfOO73RT2xP
	PleA0ZqSPQnROenv5NE2mIqk8L49wTZ1FG0I1HNMgu8pJPiycFJpqmvriGBEttzV
	TxR5RVV6SScEgeqZiRmVECdKMdzpfIgrDt1ucfI4+4NC7MlKj1kqOGdD2+sM2Q5n
	9/FmKvsOBR5/WU95i6oK8KgznXDpu1scBGyphyCAsfu+gti90KZPckMpO5oau9tJ
	xmTGnAQGM14fdU7k5leUkVfug+b4y7To+A09WlGloUUbiodWch4f4juu93iwff0j
	SjwcfM40qtyWKWstfMC6P+njyYtmE9F/Jlz9TfBz5KQGmVTgDQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js74uec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:08:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO6hD+48tvrRK4WqV28cs9UpaLDhN11iAjOWPRmT7JdMN0ZgYSrGoKfMA1IEMVzHSSoM+vXIOwCsh3fwStoawwLo8heDCPHuj5Bwxmwdf7jCVA1m3XIDpB+w0htCKj1vlBs/tMXtBgeemu5pCMYtx6UnUC8MzPEPCuVcheYp/u1Mv30CGJ2ioMU8AuZR9dWtADuq8P29bJJmD2RoQ5qeLZcZ2wzL1REXKQRlRk4c4lznfsLezPeCa3+7DN0yf4zZms2N3Nk7EPPjchMXxN8rhbBpJjHvlGXICwu023pM3B2NtMqOlwf3omICBnhNjjJYZ8PEqYu94mtptl8tDl5peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8PwEshBATzEJg1p1htnp10FSjfJpLIqFOH+pilgFB0=;
 b=G/hSdPxWbqdmPYa77rExdKo9/sUoGMO/ukbrVXWaBTJqR0zBoW1xmZwOAToAx3Vd52ikgS0i8UzmigenGa1g5bNcFmI5mglusNTms3p4Vo2yfNGXDOUTYqVzLa3VIvpMVoPN6hgPG9B6vfFJFeqlwxYCBzHnWLQQHkIwA3MqNuq7Tp2YZs3nwChYmczJBavtOhUu6TpAi7fU7VaDxdFL4pF5FKTAv1wUqYGpJ25zLf9NBGuoQBV2If0nCyYy1nbXd7tuqkpkeASqgar2SmDS7wQbNc5L9DozwEaeqYoguFLNRU6kcxEl2LaJ85cqbViFZ5IPyYmbotViOYEm+b4k6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.11; Thu, 25 Dec 2025 08:08:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 08:08:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] e2tools: fix buildpath in ptest
Date: Thu, 25 Dec 2025 16:07:42 +0800
Message-Id: <20251225080742.2146630-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5e9e4b-3216-425d-4fb2-08de438cbf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xJTZJWhwQhT5+FUMk9AlNZnNDsHk+HWT51sCNGn975PHSiGu5eo9fOs94oTi?=
 =?us-ascii?Q?syfeBGQd/Ndiaq/6QI+q5TSduDvfW2Xg5DFc4REyG+1tBF9kXCdWDqdf2GG4?=
 =?us-ascii?Q?tVOXs2IFUkTsyH5UqcoYO+p511d9mjk1qYFl+bdcH4m03XqUH8FY2G6Rgxkt?=
 =?us-ascii?Q?7bmsr4NZKQHCj4uTCob1tyhvy7YDVramVPvhly2PmbaUOqZbwoB/wqTfxW7N?=
 =?us-ascii?Q?Qr0U3grU5rzG7zedKBPZjgorsqLITycN6JvkQRILBkiuwQVnuU7lEcXv8O5n?=
 =?us-ascii?Q?rslG258vugGEXoxce81ymuA0u7ph3aT3x++FpQRrjP6vtloJE8ByChDyHdqy?=
 =?us-ascii?Q?B9vQTIbvmLt11XXUhmi77X+1ByoZP6frHLBSqBY8uzQVf3whgzF5pRKTVT4n?=
 =?us-ascii?Q?O7Iwntz1uQ04UWQILk/qui3mioTuskRvGGx77aTpB68VF1dopgQd6sjlDMw4?=
 =?us-ascii?Q?KhbwJecgvNgPN24snZXH6VqOv/Rjv4lXMYjzeMc8K/FY9zHXYfE2KI0PumWI?=
 =?us-ascii?Q?z+dgm1xGiaGDrc+W/CKQ6I77vPZ3HZkb/kFaAphP7AbzSCCt6km3lsGhMBTW?=
 =?us-ascii?Q?jfog7UkyeHTj+0OK9HXXKWY9gWRIxWylAOIcYyNYgsrHFUidMQl63f4Oaa9Q?=
 =?us-ascii?Q?nsfl7r3WY2iF5eNkQ5LCFxa/AATdZCPAdLNiHWX1bIBurgtG4V7bVhJSIHjC?=
 =?us-ascii?Q?lxH69OZH8ZgzKaREmOehCoo9P53rpYfBBujernFOP18vciPnY/SSKVr9bwP4?=
 =?us-ascii?Q?NXGkuvNmpUZCUU5KnG/xVQuW5txPldPMexpCROWdCI8dkLvV0jZdyZSqRKa1?=
 =?us-ascii?Q?NcPAz4nwcnCv1q9Pm9PJR9t6+YjnksMCNnnVPTRy3VLA+KO6cBi0lzL38oN7?=
 =?us-ascii?Q?Ox3SxYs/4+csC52HEw5kRCmY5N9zm/0nzD8+wzpNW0T5Oyqc1o/KqpPxPuaE?=
 =?us-ascii?Q?lAwrgaYoKAJQ4BLa0kyFZOcmTgFMILs+6G16Oa7KJnJ8VddNMnOpWfwp+221?=
 =?us-ascii?Q?es721XnpKmBlNLHl7qwEfNQTpS2bRvSxA8ZvL9SOkZmlYde7VpCsvqxwp3Mf?=
 =?us-ascii?Q?R7Gful2GPnBt54JQvv65ultg1ayLPfVEisKSlR0L5nobhC2TqdUZ7laT7qIs?=
 =?us-ascii?Q?7OLyd3vIh3FIn441VlnxJ49kjIyKKZ32/MioEvfmRaaUPsNbuMj6RY2GdcxZ?=
 =?us-ascii?Q?rfi+WED1ngbr1rCZ0dubgfUqk3IQkMJNt0xw+nEuQx8Iu+46GO9EaVkaK3H2?=
 =?us-ascii?Q?3EhZewVnEo8q9kGUssBDw7F6Z11A4tS1JXP6+UZ/yBnScjb8ThYUIzo+4YQV?=
 =?us-ascii?Q?hplvwH7noitWEMCRk8Sm8JiF3V8CIlTFvoAjQllzrJ/gPMm3bygDZbIzda0x?=
 =?us-ascii?Q?d3scXTsGhOsrloQaZfpV4HgziJ2qt86qN9q97KVzr7SzkxOlry24wER+8c9v?=
 =?us-ascii?Q?IL2lh/W7b9HEzVLKHGfwwgD9CzCfumy19zRuCbeFf8OlSSTXZ2gV4LVySuwt?=
 =?us-ascii?Q?Kjlf7XaU7vRWMrV295CGgSYkFuSHmCvMnXcn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?igUJfXx1m+cgOb0GMwLEr5MTPdfrtlAvtUfBwSeIyXpK3egGsKDnUHujtd5b?=
 =?us-ascii?Q?Bsign2+Nsqernr6YK6w0UZU7SJ9lu3m4BvrHrn+hswjRRSMdBVguceNM37GT?=
 =?us-ascii?Q?KsHqFrBlkLS8Bng1JLCfyjDvPLElePUnx8CdqbFtE42058Bq3Y6cjKL5HLvR?=
 =?us-ascii?Q?k6RdRomWLRp0XILkLv7KJaOju+3MG/va51/b9ikKUERy66QjP+qn6GT13eW5?=
 =?us-ascii?Q?vhcAE2FPQSPzXRsQ/2u7iP5khiX2DdcxpFJgICxv7/aitu6pw0xXFSd49NcN?=
 =?us-ascii?Q?CY9v1CVv4DDNB8Oot0gHeMaq4U9+MeacR6a4glB5hCyn9fujNQeUAM/Ft/q2?=
 =?us-ascii?Q?xL9AtQxdbCqpFUMp1nyqMMaBDed1LOCPjA9AGDW3tRX9hJ1W4zmDpYIR06u+?=
 =?us-ascii?Q?aX9oYMrjayNT6haGINifv/R4KtoSw7LTEQCdRFXj8dUG1bcK7SNXBzPrhwQf?=
 =?us-ascii?Q?hZKQRV9PexmpOwCsMO7Rilg3xqxZasDPDnr4SxB8sVZIL+qB3As8f5kX6bPH?=
 =?us-ascii?Q?pIvQdw7xps/58yoFrIOjB1tk4YofBunrn+YFHrOjPG3SVTmQAuxaP4stpF20?=
 =?us-ascii?Q?4efOUv8izjiNHpyFlIt9o9pf9gixQlVkaBGfEPmMEbCBlCz8rF68TL/DjN37?=
 =?us-ascii?Q?nXow80IZCbHwCgXr1VMI4c2hrHIadhM3mPrB6qoAl+vmAEbcL1xHC6vw0yjp?=
 =?us-ascii?Q?deS99miCW/GR8HBKqHlqBILBiN2+39aamHZU3r9w8AtMxgOo2g0y2OEF1W4Y?=
 =?us-ascii?Q?GBhmoK2o6dCAd4HuRlae9p6LheDmqwyWWU9wIB1kQNL5drzZ5bBN/oQgRHLp?=
 =?us-ascii?Q?C4otSVQVBPxrsdYPditTRL7C1S2rVkWyzOm4/I2ijNwmzg6aN4yn5TwZ/XqF?=
 =?us-ascii?Q?VJzHBY6ZvUtMuVJNA3VOr4rpiQDseoMYphdiEjPXovSBlkyRL7emVOb1jeGc?=
 =?us-ascii?Q?S2FqT0kRv4W9j1Sc+ncArorZMW/8o9nTJKWNfoSYDI8FV/7NJfdZwdRHL0oP?=
 =?us-ascii?Q?OQ3NBmMWrCRHmzILEJVYxA6ynoGrj8sNbPiPQGz/6ap1ppFzxc7WL+w1HbJx?=
 =?us-ascii?Q?tdI9TqdcVvr6J/PoLt3M4T4fnIgkDYKO9Zn0jY90qxCpmNR/n3DUXI2Tt6zH?=
 =?us-ascii?Q?abObEDy+QPQYYgegpGS+NCEY8QTJfgMB6pSlw9pDUjyw6mG7Z18jk8xvCiJk?=
 =?us-ascii?Q?+5Sk6IsWKbZHJLt/EUMsGlCISAnDutEK/OFhgQ+UMrStdrKTafUulwGGH12Q?=
 =?us-ascii?Q?VTbliyokr+/sPUM5ZkEF/0OJmXV4lFOMIVcGbsM0qbA6Ka/W52V4kQNM5DHQ?=
 =?us-ascii?Q?47M6ZILxS/mv1CgxUhaNRMwF34hiowIuHoNA9yalIYcjH3To428Mfy5cEhPT?=
 =?us-ascii?Q?S+8bKtxRaKhC7mkED1Gon60NOuVsjYAT9p2mD4PB4S3KYK15+czgECONZKop?=
 =?us-ascii?Q?8JcGRAlezHqg8uy3UQqs2sAEtrmHP5zoSEOR77KBrx5ZVwW9Bft/h0u7jo1q?=
 =?us-ascii?Q?eaX6ClnAUiWJuHmZE84YiKYBzCeuG29k5HZTfHQ4vrD327NiY39Cu7YYASbo?=
 =?us-ascii?Q?0pOu4yTr3DPrWHlAy87b3dS1clW+fAJx6smp2JHrjtQ8RhYt6ibfp5NQHu37?=
 =?us-ascii?Q?2JK1qnruRoDMYsFLDav0UMWW030LaHGel+yHDqu5Iq0DQRxwWNe+2KZ13jzP?=
 =?us-ascii?Q?ZGSX6/BEStptHBNqiolO+ZogOAGeYw1opOThlCc+silBtIXlUHLkjYlMCqzm?=
 =?us-ascii?Q?oc4shlM/oQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5e9e4b-3216-425d-4fb2-08de438cbf26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2025 08:08:11.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV1tc23MpfxuNl1ZcGuyMA3BdU4Lb+f/LNbq8+WwYbG13XVkOTz7AopSToQABcXTuKLpVa6hxE3yIKQzGJKcfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
X-Proofpoint-GUID: RXb7HEKUI3Y-EBYR_rESyp5UXOkVRCMm
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694cf0ed cx=c_pps
 a=G+edI3GLQse3gACT8XNfSw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=SfXCu99TTFuFcEF6fwkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RXb7HEKUI3Y-EBYR_rESyp5UXOkVRCMm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA3NSBTYWx0ZWRfX3kZRT561cZpo
 mnj+/vhNm0y2OISmzKOYv84PHsARFcRuJaOT8inVpIyna0ZWBq7CRCu5kkJ2jXVhFVxhr/LFthI
 xUW45vRPRQdxae33JrcrrKKZhqO0gPQT66Dej6u/XpENTKcrqI82qG3c0gc243OKKjeef3vaD8s
 xtkemGFK+K8CCbOj/ly7IKfCKn9Oum74mX+zKLC/J3OHKHgZS8onNAsVor6lVigN0EE5OeGhzb/
 H+q4y2Iit1hqi9LNElBeT+lagah0YcORj83PCBYAMbMUcazmJ8M5rK8xEyFLaGL/D9uXMaBmv0g
 qZFWKbpXjSSxTuSyeh1ccJXCbNAm9I78ltVes3UQMVW6YGdgPnR0KJv/yWTp26B+5hOvUUOuCOL
 Vka8QX3iqRabYKTVMRyDM9AP1JLEzGj7NQoePw+2eiOtOn4cgX05deaqL8MtgyGgtTV4n6hQos0
 dj/Xdsw77APCwRjFhhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122910

Remove ${RECIPE_SYSROOT_NATIVE} from config.status to fix QA warning:

ERROR: lib32-e2tools-0.1.2-r0 do_package_qa: QA Issue: File
/usr/lib/e2tools/ptest/build/config.status in package
lib32-e2tools-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index c9631f6219..06f0c28d6d 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -66,6 +66,7 @@ do_install_ptest() {
         -e 's@${S}@${PTEST_PATH}@g' \
         -e 's@${B}@${PTEST_PATH}/build@g' \
         -e 's@${HOSTTOOLS_DIR}@@g' \
+        -e 's@${RECIPE_SYSROOT_NATIVE}@@g' \
         -e 's@${RECIPE_SYSROOT}@@g' \
         -i ${D}${PTEST_PATH}/build/config.status
 }
-- 
2.34.1


