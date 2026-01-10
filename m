Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62192D277EF
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 13:38:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8616.1768052312640350363
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 05:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DAk+Xzid;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54702d1050=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ADcVF02429213;
	Sat, 10 Jan 2026 13:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rWhioAfu/k46Wts2OMbCxUdLprOiYdAdXBze7q8vd2Q=; b=DAk+XzidnCfy
	zMq0MnKp3CC98BYqLX5uC7OFmlwjSE3L3smy8eS5QL/XfP9JKOkJKeCwgSro6/xK
	oyaDosHDyWjaUroUXOQ18n6oCKtAjRDjzs/L5wd0NR9/KSfUSNc6buMGRGCh5PjL
	1gtMmTe5WAVXKLbMWanD9eQ50RqHsak4mv6XqLnoSpEMDDC6OzFDrbz9UojCEOp/
	R2vrw4qLs4LJA+I1K0BmaPu9XT/ATzGVsE5yIuTGATa+L7fTNjESKNCXuiiPOH5A
	PwzIMEyXZaiDa4/kl5mNysqNkrCccJjZwnwGb2ygrf9riseu+VdIhXe9BO3Z1uSX
	q5K3EfU1Qw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2g9cf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 13:38:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klKjFfFV+6VBVX0dujgsIoH51qTYz1+5TmgbmUl/C1ZrLK8GMM/eg2jG4ZTrJemcnaA7/1nz5unwxi9v/kQW1+GXlHBl/ghkmht8kMYfvqh/5dJLfZTGmmCAwj0ETMNuG0pXvz3dEvBxOjN8zDOWNB9ctxwi6rlO/Kx7IRaPFI9SlyZ1/8kjyj9Ulccaai9sniDDqIjef46WAkxfYQiIJdU4RLnSdoFIDc6HFUXYnU8FgiJ5iwIh3PP6GwMb3HUwOXHXE967V7ydbVD+hq8tFf+QzkqrQJfnk64duXoQcWqxx5atB3VqiWWJ3hSeUkYsydMKXEpPO9/t+OmdCdSp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWhioAfu/k46Wts2OMbCxUdLprOiYdAdXBze7q8vd2Q=;
 b=dWTh0LSC8K1SLRagXIvGk1ne3YuBC1dPfR8PUrt/eOtjWuXqoLCr2uIYcELo1LwFazeCmpzQxuaiZxWcjj1hzixjhW1IzW3ZJ5XT9xg4NNKMo9qJsk5W2iWo9fm72Qltn1/ScU8DeHNsF0imnzpR8WAiGblURG541FsqBPKUaRNUGKNBz9XsAP/Vku1EQ8ovYUiOp54ZotdMiv6bj2eam1TDzhR/3uVNZ64tbRl3hUX8PlcLj/d8OHmCeVq871EpZPqQqlmpdh1DSZkGPUwcba8U3wyusaRnrkNXnrNY0xbaHUZxz9OydvLtREF2i2k/KcnimDHAYS8Wu8Q+lOEB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Sat, 10 Jan 2026 13:38:30 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 13:38:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] nng: add ptest
Date: Sat, 10 Jan 2026 21:38:10 +0800
Message-Id: <20260110133810.515672-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260110133810.515672-1-yi.zhao@windriver.com>
References: <20260110133810.515672-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d999527-1634-4c97-1d10-08de504d8a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I2R9e8Zz3KwrSMcC183nQcD8VGxqirDDVzANoI2oLGAluxlZfAHUxb9jIIeK?=
 =?us-ascii?Q?cNL6Mr9Ua5cRT9U0Hi9hT+RzBon7ciwerqogsaNDqzdst/L27vtRXwAENybs?=
 =?us-ascii?Q?tyIfNzj/Inf7fZ7r6YBVB8LzbHpDYufi8k5lmKWw9ikaTtTX7HNI1bBhFzj5?=
 =?us-ascii?Q?lAm/le/SBa83YQuUsTRxuM9lLSOsQHZx4Bt1d9SkIuhAWFbMOOB/OjEetI9O?=
 =?us-ascii?Q?nEqDeZH0OdC2jY1f/ScE7dzxOaTNTstcbkOxVI0ara3AcO2Q0rbky+j0t8f8?=
 =?us-ascii?Q?fSnfTJ94yqorSomQsI7YCapPNQ0QdpbGYE/wwRAyyZMcnhMgATOkEJsFWIgE?=
 =?us-ascii?Q?v+S58drc1LaLN137kLtAQKeFDuU/CMoj+sr26k+Q7+OW0Teoq6DzCmSBv5qM?=
 =?us-ascii?Q?gEhsTCx87WaScTktI8NFE4AuyMv+YeJsgn1pYSyIoo5j/t/Gv3c0HnPa1+yC?=
 =?us-ascii?Q?INqdDMk5TFT2eWNSH1FNnuW1+wrUA3OJAsSuog+2vF5pc4H3PFoZHxdcVa/d?=
 =?us-ascii?Q?EJxm0EE3XK6R95dBj7RiHLXJz0SsxYCb9CM8XKP73yE4OwqUNESjmhnWkCPG?=
 =?us-ascii?Q?j8Kzyi77yse1pb3XAhXqDGcwiqY4yBAq8d0Tu2F+gL1bNvcMDMVnhl1n4avX?=
 =?us-ascii?Q?TAxt2MB2OVlqL8n72pPyVGb+7PORERjLd6h7RgOMcArLgMB1+8vpbkpM2gwN?=
 =?us-ascii?Q?eHma3Id75QzzQ1WTSufVZyrUqUhCTVh/sUfkZIcgVSv9oa+BshLC5vrRRyQz?=
 =?us-ascii?Q?Dyw2DxDR3Q6hImXiJQ8cK1ySFsa7H2494ZFrMFWFQkZPuQuJSNuhoFH1eBT3?=
 =?us-ascii?Q?GYX0E1qHVYOipqZ4MTtQ5DIDYbuRIc8L2USGA5pY1m7JraYo6mYIU88dLR2a?=
 =?us-ascii?Q?fw9gqb5WvvMowL1A6wTWvRJ3iWCNvelFyz51DZvlvWnctvqiRJIzxmZeixS4?=
 =?us-ascii?Q?7Q8pwdWEpVFJ4ylGfEQj7lWggzG0rCPiqzQSwlzC0FoIbNiFwpxvwsdiG6mH?=
 =?us-ascii?Q?OjxiH+6KXuR+CmMzLL//fZ8jfuuIPgws0xSzvNVHAE29djnVfRhCmHiSoIMA?=
 =?us-ascii?Q?HkoJck2uOGtRD/UbUvQ2/fmsn+Ms+Jh/iU8J93dgoy18Np+d4u0kOVKqfKm9?=
 =?us-ascii?Q?yLiFeHm9Hah+mdg2FrR2jDEv49jdzaO1LRKkEvVQZynqeSvbXkaO6DtG7y1I?=
 =?us-ascii?Q?DI9uAGlatLkwPD1yPWSkfGnT+SixAaZ5TBJQi0eg3uiklWAMpEGa6K8N46D9?=
 =?us-ascii?Q?tbe3IO1gijeCJF352yGLbw0lBsaEfhFymnJOfw4FXPO7jphkpvnOOh+IPAoT?=
 =?us-ascii?Q?IaD0T05FnaNUDGmNaGWDh8n3yy7ZBMngcmGUp+cvJHPrrE7Nlw1TmsBmOD7F?=
 =?us-ascii?Q?3m+1zt2QpY0+WUyDxlUoTX+P+2iy95rQFr/5B1JSEootGwsRCJnYWtEU5Wgw?=
 =?us-ascii?Q?aYmvQkX3XJzMvSWvDWDERX1JajQFEhYu8X6VQiSQAK0LaoERg4+R+Lf7al2s?=
 =?us-ascii?Q?mrKdgoEAtuvOFSAJRMc3xA5shBRyG7udERJJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9ouItBvXTwupCdj2pbtvGg0ys3MZ2aAk3bnJebAKNXtJN7RyI4s8W/VY7ksO?=
 =?us-ascii?Q?xnBHfFy467mFwgQqCq34qBFV5APivlZ7uIVm0s6PFMu5dJf2ue6DWZoOhJjr?=
 =?us-ascii?Q?WMHIOw4NCyrkRDmPgTqai8gYRDfwM3+RvVNujrG1lfJmVOfV3qTJNg8pC4r4?=
 =?us-ascii?Q?LY1TrXmqHMYRbkg8IWwbjwe/f7PQ3OtC0tXdlP6KWEqMEaAzsIUwATy5+MI3?=
 =?us-ascii?Q?mVZtF1aciyt4G5cGfIPZES2SN6aE2OaIQcReE/RgDMads5/XQseKDkIYo3HF?=
 =?us-ascii?Q?g6HETjPL6rUxX0AzeY3fNf0DiCMhHftlNvChz+/cIh3HOMSo0+ibrWDrNqzu?=
 =?us-ascii?Q?S0ZpyWUGSv7z/cabKqdteokikqGC/oZazstwvjZRszLGVGBejKJTy4SPYWnZ?=
 =?us-ascii?Q?ZqYImLUeB2tLMCFAjMoDNKSTcnxqlf1Aa/X22WEEazGGudykiYNMMQPk3RyJ?=
 =?us-ascii?Q?jR2Eu8I58NvgKS21ZBLrDfEdx298bs7Jhxdhyx5NgaSg+m+uh1xzh3ha/2g0?=
 =?us-ascii?Q?ySXgJW6SZzjT0R3ovUByQZNP0yOvZ2NwmkDXgSrRMwQSuLLL4iNOv4pKZntd?=
 =?us-ascii?Q?E+Z9Y7Uv01EnadlYZoF+HShRLz3HsXNa5VGX+orm255EQX/hIU6IrHb2Dcu3?=
 =?us-ascii?Q?YG13djaaP3ITzpTj43ZpQSSMTBHRbFCKvZ33JQvULvDX+4npGKZL4JGv2u+4?=
 =?us-ascii?Q?LagWEboiciY3RvKvc/3r5buBG1P7+uQ9oabwiyUDsqq+4HqzMrnxDfavKc9Y?=
 =?us-ascii?Q?6jtcfGtbP/ciayLJUSETHc1hiuYkgVnnocRmnP7RglRybUwUGOuPMwEl9gRF?=
 =?us-ascii?Q?8+jfVj2gNA6Dbxkqw+aywIdFhuIYcVqsc6DFC2Xt/WQiqV/CkhgrQTVVFUiP?=
 =?us-ascii?Q?sASC0XCTnSUVxnr9i4f9YxF/P2vMsJw54yWwjDyc5WzPBWKKEkGSB0E+f5/U?=
 =?us-ascii?Q?JiR9gkIv2Kz1J24hcXy6L2WYKe4pQaUXhlWz+1PnhPB5Nq77/7gOtJO7eBb4?=
 =?us-ascii?Q?TXXPu4HO7W+z5N+kIKbiGTLmuatBUy7Pb+K2qRR7F13wlx6/NQog6Spp06Ay?=
 =?us-ascii?Q?3eJVrFd2jo+SyPILPHxk4EIybLcePGmdgqLR7ZVnf91I4LWB0ogJxb2DmDgQ?=
 =?us-ascii?Q?+BFO1hZWyG3YuyPJuHxSZfhLbUqKwlyCDnK34/H5rZLeS+fSQXy/xZeRjnlE?=
 =?us-ascii?Q?Gmhsreer8ofKOFUMR32YkX7o7DX6Fai+FF7RY3zsQnLwFmq2zeXmo2VMHc7/?=
 =?us-ascii?Q?+HewncSCPpVTjSeVOj6UnlGaSM5WhmhiB+rMkvz1to4VhceogkmmKCDsTOdV?=
 =?us-ascii?Q?5VcfFXWI6x2M8WmR6VUblGxsbLlmGYxdCL55lek9yeUOFXqnq6NLY9bRCiGv?=
 =?us-ascii?Q?ASlOyax4rihPFZJ8ttK2qgsSrkHsHNu+gQe9oTT8YTzAN8/guZX6rASvHUZy?=
 =?us-ascii?Q?GQyhpKmqrKmg6LU7tlU9PPU6Q2VgJYSAqHIBExFgUyaLTvIxivArXAtZ3z7G?=
 =?us-ascii?Q?o+iqrg1MW9GPJadNi7h0LAPAiJf4AUkrqkxJ5P3NuGnuk/tfkS+VsxynoXHc?=
 =?us-ascii?Q?BYQ28Em/lgmvlKYLeyIIr8zGTcYsmnLYQieqgthU8Nzg1/Fh48CbMLM9aCzR?=
 =?us-ascii?Q?HvhWcG0+i2Dhtdm9QQ/qPojaDTkWFopE0QJeDB6FpAXCbu19w56O1Jf3HiII?=
 =?us-ascii?Q?Mf13ghmtUluHmvB+DY7sYFC/ORK5M3GNz7AA/Waz3r/7QMEWWg8EwBZ8yzRC?=
 =?us-ascii?Q?NvJ1lACvbA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d999527-1634-4c97-1d10-08de504d8a8e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 13:38:30.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjFpeKqRQwxg6/w0FCyAvVKV+rEY62jOYAofDrjmub7wSWCE2VlZR6ooc99Eo3kPtHKkscjEa302WWirrJQrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-Proofpoint-ORIG-GUID: Pa71VGtZDcOhRJvluEcEkV69AqYEbWb5
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=69625657 cx=c_pps
 a=dctP2Ni10a9Sh7weZd+SyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=wiC3dl6N7fpyZRy7YA8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Pa71VGtZDcOhRJvluEcEkV69AqYEbWb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDExOCBTYWx0ZWRfX/Sa9G1nHTdqU
 FWqy+vM4aHY1AWWZzMe4trjgUL08yAvDm3+WuUY9vvs05S5mUBEHCyTy/oEq+liIwdQJJrW8z8L
 V4SwCEJDcOQtPFNF1tc3Ori2X5YhrUnr3n+5kxEUB8nYzd+qPC1Ezkn4vz0lKR+W9otAJDhT9iv
 OCWTZPv7sKy+szDvyPPhnvjILARQBHVIBClMye9Dx82pn8ltQZo7JmPhGxm6bpI0AqDMENsdBDH
 CUfTnfI04ARzSEkNR1nlGDogE5LN9HGQgwkouqHIdMRuTjoNfM8AtE98m4/gi7bsXzfYqtPmq20
 e97ETlVeE060rwGuG2sIyQlHNUDeQRm7BL6C+pf80+CzWghK4I/S31pqL35Y6mfgVGnFMpT9HIg
 q8VHsHfZ6JwkYTZd5M5Ufwq23bllgDOM8enjrH/lGZysq7tdZYW2QajQ3b4h05yCtTErjJL17JT
 xO6EstScxfQ370lm2MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123329

Ptest results:

$ run-ptest
PASS: compat_block
PASS: compat_bug777
PASS: compat_bus
PASS: compat_cmsg
PASS: compat_device
PASS: compat_iovec
PASS: compat_msg
PASS: compat_options
PASS: compat_pair
PASS: compat_pipeline
PASS: compat_poll
PASS: compat_reqrep
PASS: compat_reqttl
PASS: compat_shutdown
PASS: compat_survey
PASS: compat_surveyttl
PASS: cplusplus_pair
PASS: device
PASS: files
FAIL: httpclient
PASS: httpserver
PASS: inproc
PASS: ipc
PASS: ipcsupp
PASS: multistress
PASS: nonblock
PASS: options
PASS: pipe
PASS: pollfd
PASS: reqctx
PASS: reqstress
PASS: scalability
PASS: synch
PASS: tcp
FAIL: tcp6
PASS: tcpsupp
PASS: tls
PASS: ws
PASS: wss

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/nanomsg/nng/run-ptest   | 16 ++++++++++++++++
 .../recipes-connectivity/nanomsg/nng_1.11.bb     | 16 +++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nng/run-ptest

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
new file mode 100644
index 0000000000..57888a77c9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nng/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+RET=0
+cd tests
+
+for t in $(ls *); do
+    ./$t > /dev/null
+    if [ $? -eq 0 ]; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+
+exit $RET
diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
index e59b7f34e2..031827a5c0 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
@@ -5,16 +5,26 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https"
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https \
+           file://run-ptest \
+          "
+
 SRCREV = "84aa701f42968bf536141a24e826da66963b571a"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DNNG_ENABLE_NNGCAT=ON"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DNNG_ENABLE_NNGCAT=ON \
+                 ${@bb.utils.contains('PTEST_ENABLED', '1', '-DNNG_TESTS=ON', '', d)} \
+                "
 
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[mbedtls] = "-DNNG_ENABLE_TLS=ON,-DNNG_ENABLE_TLS=OFF,mbedtls"
 
+do_install_ptest(){
+    install -d ${D}/${PTEST_PATH}/tests
+    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests/ \;
+}
+
 PACKAGES =+ "${PN}-tools"
 FILES:${PN}-tools = "${bindir}/*"
-- 
2.34.1


