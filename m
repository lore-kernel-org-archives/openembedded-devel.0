Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D88CD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 12:12:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73728.1778587972380984634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 05:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lOGu+hej;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9592267a27=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4x8pP3608917
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 05:12:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=s+ttYHblmwpPVuq1sUlo
	fnZPEeyQ2i1etUmmTBIJwPM=; b=lOGu+hej6cLblY9lB6snlKaoTTBxUEyiutGP
	2nqo3KcCfxts1hJ1lKPcA0n7L+b6/4dY8kFaOXeU8NB6kngBog3DEjCt9BPXLqwV
	nncL6hPLbl8q0Z0nltJkxUASniRpNK7S38bjAonLmzg1N8gmhZiOkzmZEl/9Kwah
	98GUYtHpPi1rOMn4QuSMIiz0O9j47mn/51GMyBiRKzte9/vRHxT5zKoYMH1IhzWY
	kW4SKjmx6T6s4CPL9H4xo4OMl35ppYLYLlOJc4Ym4KVN+0SXmNfnQv4JiRcRnY5z
	DOWYatX8SoETmAfV0cpWHJxCpmG/HsdvZTVhApdQQ1eq+CnWlw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvg0ut1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 05:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQevnHWsXafNK+vKObNLdUj+8XJ4cveOjbtjrY2PMkyXMPhxhAiHLoLlqsJzslhlB23Vr2o28AhrE2JtVQ3Lj+LUpzMv/Yq2+NEU9S6Ypc9l8sLe9iL+0t0cUeP9pHrE8fX64twSZ7nIGicI6Skg8qmkt89KZsjPEL+6ICQTnuikAupTlliYCvDtTed4rNp3kghFXeksB6S535HrVnf8IrvK+06VfRr9DRAwrNMg3y11Jj5GVqLnzbyg7Oh7wmMEGgE8e8NfnLXjUy6Zu5lf4MN8k+9cDG5p0xpfCHca/dEsAsZFYsfbwxUH8OUE96oTUEBzrRNw08FKYgVwGboX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+ttYHblmwpPVuq1sUlofnZPEeyQ2i1etUmmTBIJwPM=;
 b=a4einMF/N3Cz75MhAhMR+ZxLYMAiUjluCO7fOupbv+VTvGvx0b/dTFxwmm8VMIBXxiZgPwIV+Jn3QRo73DX7sYiv+vEDc8EZy/hZyqtL/ZOF7bExyxcERBzh4nneMGJOgdBZ3JpGejfOYeVyQQLZaJaVd9+Myt33UAiMze2n00gM78C8GrC+n7bq2pHOsA04KzAomhbFZMjJCL0nbwB24OgvcMFfweVMyR+7PkcpEyEYLj+YpewFy0dx7iWzBxdU2hZXlmG8clMj2a0ATR82DOu/s0XWQQgEPdwCD4/VVgIlqbCQlurpFXISsppW5h5T1jfDb6oIHMytZ+AoKFgtrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB8599.namprd11.prod.outlook.com (2603:10b6:510:2ff::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 12:12:49 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 12:12:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] nftables: improve reproducibility
Date: Tue, 12 May 2026 20:12:34 +0800
Message-Id: <20260512121234.1779664-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 45709e50-1250-467e-885e-08deb01fc87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|3023799003|38350700014|18002099003|12006099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	/1NV9iG1cRxByqnVC9JfYCX1lEHmL/fNUi3DfRAL+gJGH3OcUlbX0QJLsbN2V7CRFPKjTNoC7FZctAwmleM9dwG8ucmAvkoxU7wTXa0vrYPR+fRfrNSXSFbwUJxCvz515Yht+GuqzQ5GfvTyUNt8lRqkX+KqnhZUMEe/EsALFB9vlGJMHNcQ9qnC7djPn0lzMRWYfmQhfqHrqhN+PjbvFRzVZmc4pbDhKnUSxlu+94iZD+2fyHdWU6MN/y1jyh/83FS44eCl3Vb44GPbhJkaubr0gMJ/8Rf/sSDFf9Z5+JnaM0q1ubOl7+8xBc9BK744vtCRPmJYDnl9e5NnfVnaPIOo58BJaMaEqeGK6w6mVDkxPBRBD9f1rbxgjhCzKRM1qrzZKU7b0SbPI+gUtLlishRHVP6fKhQ07zRdUikxuFhElLbS7Co1hrl5ZCKqKBY45AWl7WDyG7rlRO/jXtvLY1UtTMaMG7UQIyJuoq8NBzUWaQmh9k3pwiCEQnylNzGxZMJv6ow9K6gdc7kCrNSRjFcx/ULFUW9gVKInDCsgqQeQMs2duxugqYEy2clGhOokLiG/qRe88dEwwrddYey6BOkmioDmSsDrr53melEESoGHn71fLQym8D0IC0G85spFvrRDS5+OqPgVmbYE/JPd2zO56YvS3jkzpKrpA9LKyAheix03nVzKLTHz3x47exWJjhpmOVRwATzzFOWOVtsO7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(3023799003)(38350700014)(18002099003)(12006099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TwzOsPP4nx65Rfrtk+Z5p+9h23fTSHreyQtwB98+kjPeuX+TBpivL3jLrihJ?=
 =?us-ascii?Q?jBnlhfaBXUKEQZPzUCm30wGnRvw/VN0FT+pOfHitZVPKxPr0Lv0w21YyTKE9?=
 =?us-ascii?Q?K0tPzPwZlBjIYIdTyG4mpnbF5NpMPE3gjp5gs6epZSsB5uZbbw6sXBoqE902?=
 =?us-ascii?Q?vXSYJFcfyPMeV38qaavEewEeE7eZ5wdoA7FvHVI+zXyN9Ml6cMW4NdNnqSMY?=
 =?us-ascii?Q?kcl0Q0dzOL/X278hS1D+UvHhnKdF7BkM1CfWUqAp11qWivEWHeWUErgKJ45N?=
 =?us-ascii?Q?My1NSsXaq9J1SWpuiL/Laa4vV+mrlbZSbkaEVcMbk/b6QvdElpfRWjKdNI+X?=
 =?us-ascii?Q?VS9gkwxCHtNS6njVnn469Z4ZVWqPGhh3po58Kw5Ud1zRXE1Dw+47qMUjCb7L?=
 =?us-ascii?Q?KaTG0JgL/CHDG7GVE4nGGSB8JXinMtnfjibKCPckqRl4iOYfvxQBpilvXA7b?=
 =?us-ascii?Q?ejpJV/OIuQqbs56pYtCWMxfTn104xLyEGAFWXDjlr+f/N/B61qp3Cevj6ig8?=
 =?us-ascii?Q?Q0BeG6hJYPHWsu9F5ZKWNndbc0yeOqytkaocpQIDjL85RncW6G3qnt8435Xy?=
 =?us-ascii?Q?VyhVG5cs7WWT6G89gT2a4y8ijHAg0iuy57WzX2Mz68JQNDgyRWA5KKxZY+Cp?=
 =?us-ascii?Q?4T2KlfXP2r6KbeJPy7zugltjCkI2lgxCtehL6Jv556fz+bCjEV7T1GsuRI5N?=
 =?us-ascii?Q?9PRgMScwlTORIA3HraFNUhL6YCAb/6POJJaukLH+Sgni4+7wKW8SvpVNwM0/?=
 =?us-ascii?Q?7B+nEZ5sXblHuUKgGpXOgH4o0UA2SalLFmLbCy4CKcyKPg87UPrPJIRqM9hS?=
 =?us-ascii?Q?r6A3w7dIUERuyFEM78QnDyAzYtphbpxXL+xPrxjU0fCvbFtMEe35plDvak/E?=
 =?us-ascii?Q?tRxTGSS7D+c9gaOPoDhZfohfXRJyOu4LgDi7Cw03Q8sILPWmzPNzSgpFnLzz?=
 =?us-ascii?Q?FK6JpmnV1J/u+cy7Jf0Re8qJ4n9OQW7GA7hGK3xy9gEjOOZYMk3ZEfv11zLs?=
 =?us-ascii?Q?73pl15u8jAWDx7h20jAh906bbYpXpzwV4THIZV0D2EkTHEKZPX0+R+SjKZwj?=
 =?us-ascii?Q?IAEF5jx7Hpoyn7l2SIsMyAMmaojj6f/LUFDi98uMZcteNjyM/+XjEsMRCYeh?=
 =?us-ascii?Q?5Mz0X75EybY4zPsGRq42wDxVfZSv+yV008Bmnl9KTy1D741Hz7+2KMDnEx8I?=
 =?us-ascii?Q?z+A5/xLg0JgUPK4vp6GXKuMACdRV6ccsaxTOYmm/XjWpdgWMY1OCg6vZ7Vi4?=
 =?us-ascii?Q?3e9cBwVMN0mhJ+g5OOkP79mqn0BcCIIx2xxjx+s3SD+osGZAHoFN8shjrq6A?=
 =?us-ascii?Q?Tb0ej9qgeMjJpH3mHmcFFHBURxwyY9p/Eo5J9m1wfWqFsi77lc817ZvFpQ79?=
 =?us-ascii?Q?v3zdBwQqWGumsy77sGIXjx6Mk4Z6foFRFzKX860bBmOIrDRlTGFysVNENSJv?=
 =?us-ascii?Q?hvFcOHo2gME6y6zAj2JC2rvDaj3iVfKuwItDPHSo+7CRgeFBukCgnJMKVuSj?=
 =?us-ascii?Q?lfbNtViA0SyF/xGpbGqe5x2UWjCm/Ypi0eIU+xRBzl7giWYA1YZJO8/WYSHT?=
 =?us-ascii?Q?YmiOkx+n3/VubjkII+DycMyjO5qbuszPikyxBFbbHAu0ZbKV6jMBF3dQcePG?=
 =?us-ascii?Q?X0m4R5WyrqUTO1dZF+vANtX1Bw8u0ztfiHgUC3IaUvJyM5v7UVkBW2YhJpq4?=
 =?us-ascii?Q?meDeuAEfLsvv9Bawlu7AQwhhnSZPwmrsSPvLTHhLlT8AwGFh95flEjmzyfMf?=
 =?us-ascii?Q?ju8sbfdCEA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Ymevecgsn7++q4vu/o0XSX/xfq5iU81DlPt6qPUrllH1H4PT4Fp3bcoYLH2tNXmgJY5Z1QTxDdhFdmAh2h9fi1m2wVhC9pk7EK/QSX7UzZ7NnaqFAoIr6i3iI/WvVVmt2GBPOHqyQd2SgxtKEDxElu8QvlvM9qaceX7tUO3WGOVnJiOrUkOknKrc70ljGYs/uManDQJA6JsSuJ0Ga+D2Z8KyOKWD/NJSA/OsyFCoG5Wtdq/Kyg/iXoOyFyfErClUP/9FdgyN3qNJm58HrYdbmrWtThxdtYai5mqd8xJdKPdSTfR5HSQS1H0nzFGmoL2PUMT2/daRvUcda6TaJ+jUNg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45709e50-1250-467e-885e-08deb01fc87d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 12:12:48.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +w6vgO1f0Tl3iT3BRXiBu5SjFjAtOkvUk6mCdjWEuosam5sGuGvey9K31ylRhvV1TwwgYxoutXVyTD/u0RS3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8599
X-Authority-Analysis: v=2.4 cv=SYDHsPRu c=1 sm=1 tr=0 ts=6a031943 cx=c_pps
 a=6gnvs+K4iRzQbkKjpWE4KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=SsMK-6ewAAAA:8
 a=NEAV23lmAAAA:8 a=3HDBlxybAAAA:8 a=t7CeM3EgAAAA:8 a=Vf8oi9PKAAAA:8
 a=DjJ1iMIJAAAA:8 a=kY28avEZHWTb90xO-h4A:9 a=49hUO6naoDravHwzbBTq:22
 a=laEoCiVfU_Unz3mSdgXN:22 a=FdTzh2GWekK77mhwV6Dw:22 a=s-HcpGhzF3c4NlUTCjwJ:22
 a=jmO-1Ghq7yFKJHp-pPJk:22
X-Proofpoint-GUID: eUOxJ3IW_p4zm6L91yKJydqBXhzbOs53
X-Proofpoint-ORIG-GUID: eUOxJ3IW_p4zm6L91yKJydqBXhzbOs53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNiBTYWx0ZWRfXytDZHHpetVDV
 D14sa5rwOKZdLCRmDOcSz1lVzxAZVJhmny8blqFdRdtirMd9kpcFVR9TqviUZq2U9IvRCowQjNi
 jrkxkd5aOdRomoh76+gWDIxQvm2fYewvNS1DRCA6Tftc9W58hMVf9wWeboJ8eFkUqNOYbvBd6b1
 y6ZVQIFv3vesc8cSd47qb02BLaVYqema39kC+/LfxkpFGeFeb/hEgnFhqGfeo0Jzjbe0vrbJ7Lq
 SiGDstUIOcEcwegEtHAUWW7LhzOeEeLM1IXOPfGTUYVThHbXNuc9pf1vs81IbiANrJ7d4Llj5uS
 KcJvKICm4cItNcKH5E6SRY3yf0zfvBaNKcjApWZ8F4vjlvqXHIob+eRBxVtd/4PXebeQydK/Po5
 AdEcvUj2eeAtFusHaoyxcqcsPM4gIVCTO/o7+65d3HqFCI7lVs/4psqZYZKcM+rHIGIFHPUvly5
 HbqeabfJ6610+vDVpOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 12:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126866

Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the current
time, thereby improving reproducibility.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...URCE_DATE_EPOCH-for-build-time-stamp.patch | 41 +++++++++++++++++++
 .../recipes-filter/nftables/nftables_1.1.6.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch b/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
new file mode 100644
index 0000000000..f52ff28b21
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch
@@ -0,0 +1,41 @@
+From fde27e62b241fb7d96de36a2fd6d7879c24f5de6 Mon Sep 17 00:00:00 2001
+From: Jeremy Sowden <jeremy@azazel.net>
+Date: Wed, 28 Jan 2026 18:31:07 +0000
+Subject: [PATCH] build: support `SOURCE_DATE_EPOCH` for build time-stamp
+
+In order to support reproducible builds, set the build time-stamp to the value
+of the environment variable, `SOURCE_DATE_EPOCH`, if set, and fall back to
+calling `date`, otherwise.
+
+Link: https://reproducible-builds.org/docs/source-date-epoch/
+Fixes: 64c07e38f049 ("table: Embed creating nft version into userdata")
+Reported-by: Arnout Engelen <arnout@bzzt.net>
+Closes: https://github.com/NixOS/nixpkgs/issues/478048
+Suggested-by: Philipp Bartsch <phil@grmr.de>
+Signed-off-by: Jeremy Sowden <jeremy@azazel.net>
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+
+Upstream-Status: Backport [https://git.netfilter.org/nftables/commit/?id=ca86f206c92704170a295b8dc7a41f6448835dde]
+[Adjust patch for 1.1.6]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6825474..527049f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,7 +165,7 @@ AC_CONFIG_COMMANDS([nftversion.h], [
+ ])
+ # Current date should be fetched exactly once per build,
+ # so have 'make' call date and pass the value to every 'gcc' call
+-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
++AC_SUBST([MAKE_STAMP], ["${SOURCE_DATE_EPOCH:-$(date +%s)}"])
+ 
+ AC_ARG_ENABLE([distcheck],
+ 	      AS_HELP_STRING([--enable-distcheck], [Build for distcheck]),
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index d27e60a18d..cc57db3c81 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -12,6 +12,7 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
+           file://0001-build-support-SOURCE_DATE_EPOCH-for-build-time-stamp.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
-- 
2.34.1


