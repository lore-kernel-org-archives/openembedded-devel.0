Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F20FAD3E1
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 01:48:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3472.1776908919584744102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 18:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hem2Pg83;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=857337a20d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N0x4l31596694
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:48:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1qlFFP7DypgR6szkxHSf
	JDqeAQcoiYbpL+SYXWoh3jg=; b=hem2Pg83KLedq2SrCD6MmK57Dr2822tqzH5I
	a+Ih1hdHQmGjVnRiiLA+uDKVZ1UJ3Xy+YeoPOkN8lxX7Va0lWQmTPFEUIeLfkDk+
	sE463pms3eS79PsxrwrSI9EoLjLhFiDmn8hqI6AGdGhsjZMC0t8bon53e333H6OM
	q5d9V1gmLkMTuQdCDuiWFDE3F9yD8sWZ1XK9aKMNeDL3uX+h/ZQF21RKwaDutoCk
	33cb8imiOKrh294jQ1l6XgnMzDvyCOW30PKw9sO9BIubzm1JrAYUaUCuWsZoB3Dy
	b5Gw81etriFxXxAQQgjWoVg75PMC8ITQSh+mx6rT1Zpqxg65DQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8sr01ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 18:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB65nYG6DvfRsc7qnIZvncSBMQVsBWt/xsvKKXBJQW3qw+G1Ds0TMv1WmEFbn21Ostds4hg+UBG/kyPDd3FCqn/Fk5Ph3l2ZwK7xf8/zemE89KxHJSq9G5/0OagL4lr7Bl5FRMxUtxctucxhoUuy5y5EEErek46DWg1Vsrf99E00CHmIA1aEQLPDM4TZHKSxuVmKJVU9J4iaoaJsZ9mDdnNPNWsZ4vo7dKXe0MHFbE8JIH3YU1hnpg//n86/q4wg4WI56UsdLaD8OOSsSZZbbTwUe+C4GE0v+N1E4ctzk+Vpviilmtp9Ef3zmvI5r/P3WEc58PSqVAcB0hqAALQnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qlFFP7DypgR6szkxHSfJDqeAQcoiYbpL+SYXWoh3jg=;
 b=lBTr29uGYo8sr1QDSegVSxtsWHu4Rqq6kh9LLJDlK+GOmpGNeKZMsvWcMBHHRc3gL1apKLor99NE3RKvb4h2J4Cvcv3WDMFHnsjp4qDE3CE55zd5uqB1B/WXuz1v5wFeTerNn8joBLgEgLBQRTSTvfJWkEcF8l2k0iDA2uiyAQ/3Brj9xvgidDBCRJkV3g3/i+8uBG0Xxozs16RXdRqVGYw1NTg7a7iH2sM0QmiPXj5Ma4xXu+KnQmjJOHrIOUtFVBejg5tT75orBmQW34qKNdhjYa3Jz8FVm1BBlDjAYmY9fyAdnvAwZzRMNEMsHen75Sf5UEmVoOEHfmDiFLpCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.16; Thu, 23 Apr 2026 01:48:34 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 01:48:34 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] frr: upgrade 10.5.3 -> 10.6.1
Date: Thu, 23 Apr 2026 09:48:18 +0800
Message-Id: <20260423014819.945909-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA3PR11MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 7307fe8c-9dc9-4935-4900-08dea0da6df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	3otCQ1QAr/HHLdW/V7/q4Y5+qUy8do39T5RogH0aUgWh8Fj4gTRWe8aDt3sUmjAljfXjxpXkv/Sy3IAPxndj6mPENBsJJJcMEWOhfche4hHrG3eHE8eSgu/kKH1iw6n2S/hcX6js+5S+10ArGe+hWc/J2iJP+Vsu5+LYmf1B1QXWcJdfm365cwqU22M5PkSpGSDVb/XNbRRq1w5k/T1Z+bnmOuknm6x4ykF0hpZwOJ/CwmiD5IenHqPhrOs0CR6xmzXLzo5TsGAcAvJejkCJNkGtebbb61N/DS5AOdrzw9Qkay/bslXmUGgmBK5JbTz3hgXJB6YXJ/2OOP6ycR/tG0p2LgwQCVDrhwPlBzjRNXD83qUZ43/SEV79DAgZgFOA1MF+wGAvPuXb2cpV94VISqEoxmcN7tmFcKYsqbOeQXUTG/kJRMbMI7ZNZZP+5i5LQGFhVbI3WTQ0nQx55wBsS8q5AZiJk/XcoWWDIBemYTf0BWrik7oonlpfLTGNGLY3VJ0hn4Rgpm0RhCQDDd1q7rnxDRUHmcPCQI3VGY7UHYGJhzP0ni0t/ysGaBEUe0m4I36osptHd/lu9f3yfs8VH4Kc4jMf9wUT8cqZvnk0i5lx4upVWbzbaNwWu2fnIroUAJRK4Szxo3Yjp9Sghpx9pXrCjlME1LembZGZxwbXvbW1dNCZzP0XAeT9qjLX4NFYmp7k3LVNZ/18HbzcB+mTOJKzo081B/c+PzUpb+mGWWLugmIGyWNRVPvgPS7qYj+6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WgR+V4RQWzd68416eh6I+JJimmXpM/OZevdMtlv+ZtfwW7KMd1zvvKgaC9vV?=
 =?us-ascii?Q?qEAGplRbgTFlLiQIJ47dsggu2k8JfXrfNzZkIuG5xiXzY0tuFUuu+HfjRzNr?=
 =?us-ascii?Q?dHUY8aIUeZvNZGSONOjkWzMrkF25neLs1D2NYDEKQD718xqvONH5pSgk5dlK?=
 =?us-ascii?Q?zMWnPvuu/WN5HvGCLvhfTmJePCKozhgL1mnf195EQz4OgRYD/6GCZH7zpr6U?=
 =?us-ascii?Q?vGiU6pIlX2JUhytj4/LG+RXgQ1RY3UxOXJ9xZwy9++slzpiQ+UJnWJveD+IY?=
 =?us-ascii?Q?KIzH5wa8vrOStSw78cwFL+pQFwZp7yVTLk+l5o3iW3cN4/wW0lavP6+xC65w?=
 =?us-ascii?Q?+uMtLBa1lOSw3aA7+IdiX+mdkACFMLKHjxjjN8Uvmkp3gi8Hpk4zExhSKUqT?=
 =?us-ascii?Q?AIBDUqc45cOkqsvmOsT5ruXDJWzvz/6LTP9/TuZOVnAOkOBQ8XT0pRxbJZRI?=
 =?us-ascii?Q?5Or5+8/T7nnWEkqidI1ZB69uO/xGCj43jwXR6OSQKjWCGu48azguexH27BhB?=
 =?us-ascii?Q?h8Dh6P6AWH6i/Cr4dO4QIZoHUlbC5EPeD6BB1cuNJ1ZlXFGeR50GAyqCLyG/?=
 =?us-ascii?Q?OVZACF6JYm4EqUCZvNNajXLg3nULm2S4JxeuFKztqB30K6LBCzjSrtQg/U0H?=
 =?us-ascii?Q?NYwGcIGCgR5CFZXW9IRdSHpwwR1k0meob3xytQdbIiJqVeQDJsEsjnrbaz0p?=
 =?us-ascii?Q?P5U5/cw2LygNqjkwQdn0WJolyk14FlTYHgjxxwGbB5qrd/4XIPHe847t+WPc?=
 =?us-ascii?Q?4cxDl0jn09QjrN4EuVSU72kfe6m/A13/lJYqrkv7ivEtTKhSn/lBmq+yM/0R?=
 =?us-ascii?Q?mZGaHBH3HXO86bru2IYCfyVyZNCCtCJFmqkjFsglVBWqw0MoSXcEyg4w7nav?=
 =?us-ascii?Q?wiHGuGUEmtB4ApEfto05RTWC7kdQRjFJGYmI6aTqs2QIPsAZR1lhaCV3keNq?=
 =?us-ascii?Q?UFa8UV/HEIwN6B0NouBFkga+P6KPle9Gq83nhq4tqpkada39I7aq/+hq4qQd?=
 =?us-ascii?Q?5uHlWUdfbKRAh4NAE/NGwqW/Qkibz4WJC/0fv0WWTLcQ5Lq11kfRBDDYvkbE?=
 =?us-ascii?Q?S52BnTy8mZDxtUPGrUC7JMXzJrtts8f9mRONeiwgPIX1jzC/AALTmZZYBVpz?=
 =?us-ascii?Q?NFuNftMFX4BuJDunphhxocH+EkZFAwlx9o6k34MeuIEDyjSfmL0YZvWch1GU?=
 =?us-ascii?Q?HiLVPEzVhOdepeCnLNvZfGywZA1bftXZO3ldLh0J3ebDGKgjqiL43TZuUUS6?=
 =?us-ascii?Q?QpnyANX4qblAJnEumLXOQ8HB1gZF1hMJOAzqTQ4UNQVU5d0HA/z2pBjPBKY2?=
 =?us-ascii?Q?C+PB4Rl1uEacWUCSuCnsoUIdOAOcd6nk5mz+VJ/BfQQ46O/xjIO2TFglyMTW?=
 =?us-ascii?Q?DRwUZb5wUHlCgDe/wznHJENXGg+ygCnfI4e4Tjbhy2zAYLD2T4YLCNQUBoJE?=
 =?us-ascii?Q?CGO37HwejQh5l6SN5w7VohJkJx8KEGhpPM3ept1Q07HdGgWgMFPwOSqxGqd4?=
 =?us-ascii?Q?YrgZBCL5O/6hgCiLO438aQAnk5eQf/aFjMA+4r0aqrBuLipQ7WngbL0VFd7n?=
 =?us-ascii?Q?V7fXLm9EJw1D7vH3Rya/zQMagvoKlYr7l5MhSQvQckueloLyCopmq1mbJcO4?=
 =?us-ascii?Q?431C1jVSXDLC1/jkQYS0tpkA4OnYduzmuJETaGmA3vo67r44L+mhA5CCwb0a?=
 =?us-ascii?Q?DtsjDx5lTOhha6AGv/+HsslU9WATeC+iXgZtnTYKJRGWzMv+zOKXuictJAYx?=
 =?us-ascii?Q?NiR4bSJEsg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZVPczidgGtkRO1gcUm6+aAd7aFuWKsAnyJDAgyibDEGVGMHnyErbgpYxXmBUF6k+cy1End2r3Fb4esBRk39wgp4ZoRJNYK7z/Q3kuJbd4vynjZvnHd6GooJe4wREdNshxuGnKQnWuF2yDUfCXTQWFPPn6AbAFIyccCwwM6SHd0kw8VJxWhQ/Pnux+SZO3I4iGKe30COZqtnhMNVXYm1rfBN9H7iu10v5xPUuOUlNAKrxgVIYiI90FmWSMlkcW88yImVZ2qoJt4ORQmPWAshe2mKLDRh0vZMp91ohbRoHislfqQNMKBdpTt5aRkeENq4cVxveLxjmIPybSr+aIY+GNA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7307fe8c-9dc9-4935-4900-08dea0da6df8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 01:48:34.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIURfWV3M0x6Fcnt24bVoTOCn/BGjs1UdftuKbnnWP2xqY63I9FkyAisokWXA6ogB2m7QxmrkKo0fu9QZg5ybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9421
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAxNSBTYWx0ZWRfXxAcr9FEcKzMT
 Aps8oB/VvU7pyxynvuKVVE0GQLv2xNmc1qi61zXd2LglmzeqXMkUgIki0ju1yNxHaxuYUSF6CbV
 Q84ecXZRui+aQZFjdG7/oGTnkQE49zp0nIge95dNPtIsOSu6XYHOuYnHvFLr3ZF+NK4Vumj16Ia
 3DjUinsun3XCdp2I0w4PNvhyVbO9tNvO+2OwKmhPp78X9fg219m3emZfK2ILcdTpJHUTJ0GckFx
 TZ0EpcyExC+IaklRC22Ib+CSlLgMKlH8G8vUSqFb5zkpZrk/9ZAAgycdyiGMpoN+X66001wC1uV
 WEcEJTrsiDTbj33awdPLwzpT3E19UMpNq69zDERR+Hgkfq1L8doNQqbPvtVfLOGPZdlOh151qMH
 Vj+ktsyCRdhGtk2oxicTnA4/BFW4jOQ3olMfknE55AO0T80lLni7HfzKPRajlkx5U/yGsPeimnx
 sVJIzhaUtwEnkMQVQZQ==
X-Proofpoint-GUID: pxAV2rXMU94vewu6d6mzp5-fmJhwQz_k
X-Authority-Analysis: v=2.4 cv=PfPPQChd c=1 sm=1 tr=0 ts=69e97a76 cx=c_pps
 a=kXeBnfu3JcJF6EwF0J+eVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=yEOxYvs7AAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Byx-y9mGAAAA:8
 a=4YC7WVefAAAA:8 a=tu_hnB3LyGwdYM5peukA:9 a=0bdSyPoMka5OphY3:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=tPzOKt3quolVTVSLigK1:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: pxAV2rXMU94vewu6d6mzp5-fmJhwQz_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126564

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-10.6.0
https://github.com/FRRouting/frr/releases/tag/frr-10.6.1

Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../frr/frr/CVE-2025-61099-61107-1.patch      |  40 ---
 .../frr/frr/CVE-2025-61099-61107-2.patch      |  80 -----
 .../frr/frr/CVE-2025-61099-61107-3.patch      | 293 ------------------
 .../frr/{frr_10.5.3.bb => frr_10.6.1.bb}      |   7 +-
 4 files changed, 2 insertions(+), 418 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch
 rename meta-networking/recipes-protocols/frr/{frr_10.5.3.bb => frr_10.6.1.bb} (94%)

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
deleted file mode 100644
index a1e1246cce..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e21276d430663fd8312940bb3b0ce081957e3d85 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sun, 24 Aug 2025 21:17:55 +0800
-Subject: [PATCH] ospfd: Add null check for vty_out in check_tlv_size
-
-From: s1awwhy <seawwhy@163.com>
-
-Add security check for vty_out. Specifically,  Check NULL for vty. If vty is not available, dump info via zlog.
-
-Signed-off-by: s1awwhy <seawwhy@163.com>
-
-CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b7d9b7aa47627b31e4b50795284408ab6de98660]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- ospfd/ospf_ext.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
-index df0b3b9081..8ca0df3200 100644
---- a/ospfd/ospf_ext.c
-+++ b/ospfd/ospf_ext.c
-@@ -1705,11 +1705,15 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
-  * ------------------------------------
-  */
- 
-+/* Check NULL for vty. If vty is not available, dump info via zlog */
- #define check_tlv_size(size, msg)                                              \
- 	do {                                                                   \
- 		if (ntohs(tlvh->length) != size) {                             \
--			vty_out(vty, "  Wrong %s TLV size: %d(%d). Abort!\n",  \
--				msg, ntohs(tlvh->length), size);               \
-+			if (vty != NULL)                         \
-+				vty_out(vty, "  Wrong %s TLV size: %d(%d). Abort!\n",  \
-+					msg, ntohs(tlvh->length), size);               \
-+			else                                              \
-+				zlog_debug("    Wrong %s TLV size: %d(%d). Abort!", msg, ntohs(tlvh->length), size);    \
- 			return size + TLV_HDR_SIZE;                            \
- 		}                                                              \
- 	} while (0)
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
deleted file mode 100644
index eacada0ec4..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From d9ed123b814dad7cf4b069de5601c9f279596191 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Tue, 6 Jan 2026 15:32:32 +0100
-Subject: [PATCH] ospfd: skip subsequent tlvs after invalid length
-
-From: Louis Scalbert <louis.scalbert@6wind.com>
-
-Do not attempt to read subsequent TLVs after an TLV invalid length is
-detected.
-
-Signed-off-by: Louis Scalbert <louis.scalbert@6wind.com>
-
-CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/33dfc7e7be1ac8b66abbf47c30a709215fbc1926]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- ospfd/ospf_ext.c | 6 +++---
- ospfd/ospf_ri.c  | 6 +++---
- ospfd/ospf_te.c  | 6 +++---
- 3 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
-index 8ca0df3200..62b0020148 100644
---- a/ospfd/ospf_ext.c
-+++ b/ospfd/ospf_ext.c
-@@ -1710,11 +1710,11 @@ static void ospf_ext_lsa_schedule(struct ext_itf *exti, enum lsa_opcode op)
- 	do {                                                                   \
- 		if (ntohs(tlvh->length) != size) {                             \
- 			if (vty != NULL)                         \
--				vty_out(vty, "  Wrong %s TLV size: %d(%d). Abort!\n",  \
-+				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
- 					msg, ntohs(tlvh->length), size);               \
- 			else                                              \
--				zlog_debug("    Wrong %s TLV size: %d(%d). Abort!", msg, ntohs(tlvh->length), size);    \
--			return size + TLV_HDR_SIZE;                            \
-+				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!", msg, ntohs(tlvh->length), size);    \
-+			return OSPF_MAX_LSA_SIZE + 1;                            \
- 		}                                                              \
- 	} while (0)
- 
-diff --git a/ospfd/ospf_ri.c b/ospfd/ospf_ri.c
-index 76e6efeb83..7934b25451 100644
---- a/ospfd/ospf_ri.c
-+++ b/ospfd/ospf_ri.c
-@@ -1208,12 +1208,12 @@ static int ospf_router_info_lsa_update(struct ospf_lsa *lsa)
- 	do {                                                                   \
- 		if (ntohs(tlvh->length) > size) {                              \
- 			if (vty != NULL)                                       \
--				vty_out(vty, "  Wrong %s TLV size: %d(%d)\n",  \
-+				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
- 					msg, ntohs(tlvh->length), size);       \
- 			else                                                   \
--				zlog_debug("    Wrong %s TLV size: %d(%d)",    \
-+				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!",    \
- 					   msg, ntohs(tlvh->length), size);    \
--			return size + TLV_HDR_SIZE;                            \
-+			return OSPF_MAX_LSA_SIZE + 1;                            \
- 		}                                                              \
- 	} while (0)
- 
-diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
-index d187485b9f..850a7039f1 100644
---- a/ospfd/ospf_te.c
-+++ b/ospfd/ospf_te.c
-@@ -3161,12 +3161,12 @@ static void ospf_te_init_ted(struct ls_ted *ted, struct ospf *ospf)
- 	do {                                                                   \
- 		if (ntohs(tlvh->length) > size) {                              \
- 			if (vty != NULL)                                       \
--				vty_out(vty, "  Wrong %s TLV size: %d(%d)\n",  \
-+				vty_out(vty, "  Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!\n",  \
- 					msg, ntohs(tlvh->length), size);       \
- 			else                                                   \
--				zlog_debug("    Wrong %s TLV size: %d(%d)",    \
-+				zlog_debug("    Wrong %s TLV size: %d(expected %d). Skip subsequent TLVs!",    \
- 					   msg, ntohs(tlvh->length), size);    \
--			return size + TLV_HDR_SIZE;                            \
-+			return OSPF_MAX_LSA_SIZE + 1;                            \
- 		}                                                              \
- 	} while (0)
- 
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch
deleted file mode 100644
index 7b983198f5..0000000000
--- a/meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch
+++ /dev/null
@@ -1,293 +0,0 @@
-From 2d02bca97251ee53fb10b4c34c8cda0e20ae8b8e Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sun, 24 Aug 2025 21:21:23 +0800
-Subject: [PATCH] ospfd: Fix NULL Pointer Deference when dumping link info
-
-From: s1awwhy <seawwhy@163.com>
-
-When the command debug ospf packet all send/recv detail is enabled in the OSPF
-configuration,  ospfd will dump detailed information of any received or sent
-OSPF packets, either via VTY or through the zlog. However, the original Opaque
-LSA handling code failed to check whether the VTY context and show_opaque_info
-were available, resulting in NULL pointer dereference and crashes in ospfd.
-The patch fixes the Null Pointer Deference Vulnerability in
-show_vty_ext_link_rmt_itf_addr, show_vty_ext_link_adj_sid,
-show_vty_ext_link_lan_adj_sid, show_vty_unknown_tlv,
-show_vty_link_info, show_vty_ext_pref_pref_sid, show_vtY_pref_info.
-Specifically, add NULL check for vty. If vty is not available, dump details
-via zlog.
-
-Signed-off-by: s1awwhy <seawwhy@163.com>
-Signed-off-by: Louis Scalbert <louis.scalbert@6wind.com>
-
-CVE: CVE-2025-61099 CVE-2025-61100 CVE-2025-61101 CVE-2025-61102 CVE-2025-61103 CVE-2025-61104 CVE-2025-61105 CVE-2025-61106 CVE-2025-61107
-Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/034e6fe67078810b952630055614ee5710d1196e]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- ospfd/ospf_ext.c | 200 ++++++++++++++++++++++++++++++++---------------
- 1 file changed, 138 insertions(+), 62 deletions(-)
-
-diff --git a/ospfd/ospf_ext.c b/ospfd/ospf_ext.c
-index 62b0020148..c1fcd632e0 100644
---- a/ospfd/ospf_ext.c
-+++ b/ospfd/ospf_ext.c
-@@ -1729,9 +1729,15 @@ static uint16_t show_vty_ext_link_rmt_itf_addr(struct vty *vty,
- 	check_tlv_size(EXT_SUBTLV_RMT_ITF_ADDR_SIZE, "Remote Itf. Address");
- 
- 	if (!json)
--		vty_out(vty,
--			"  Remote Interface Address Sub-TLV: Length %u\n	Address: %pI4\n",
--			ntohs(top->header.length), &top->value);
-+		if (vty != NULL) {
-+			vty_out(vty,
-+				"  Remote Interface Address Sub-TLV: Length %u\n	Address: %pI4\n",
-+				ntohs(top->header.length), &top->value);
-+		} else {
-+			zlog_debug("  Remote Interface Address Sub-TLV: Length %u",
-+				   ntohs(top->header.length));
-+			zlog_debug("  Address: %pI4", &top->value);
-+		}
- 	else
- 		json_object_string_addf(json, "remoteInterfaceAddress", "%pI4",
- 					&top->value);
-@@ -1752,18 +1758,30 @@ static uint16_t show_vty_ext_link_adj_sid(struct vty *vty,
- 			      : SID_INDEX_SIZE(EXT_SUBTLV_ADJ_SID_SIZE);
- 	check_tlv_size(tlv_size, "Adjacency SID");
- 
--	if (!json)
--		vty_out(vty,
--			"  Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\t%s: %u\n",
--			ntohs(top->header.length), top->flags, top->mtid,
--			top->weight,
--			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
--				? "Label"
--				: "Index",
--			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
--				? GET_LABEL(ntohl(top->value))
--				: ntohl(top->value));
--	else {
-+	if (!json) {
-+		/* Add security check for vty_out. If vty is not available, dump info via zlog.*/
-+		if (vty != NULL)
-+			vty_out(vty,
-+				"  Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\t%s: %u\n",
-+				ntohs(top->header.length), top->flags, top->mtid, top->weight,
-+				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
-+										     : "Index",
-+				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
-+					? GET_LABEL(ntohl(top->value))
-+					: ntohl(top->value));
-+		else {
-+			zlog_debug("  Adj-SID Sub-TLV: Length %u", ntohs(top->header.length));
-+			zlog_debug("    Flags: 0x%x", top->flags);
-+			zlog_debug("    MT-ID:0x%x", top->mtid);
-+			zlog_debug("    Weight: 0x%x", top->weight);
-+			zlog_debug("    %s: %u",
-+				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
-+											: "Index",
-+				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
-+					   ? GET_LABEL(ntohl(top->value))
-+					   : ntohl(top->value));
-+		}
-+	} else {
- 		json_object_string_addf(json, "flags", "0x%x", top->flags);
- 		json_object_string_addf(json, "mtID", "0x%x", top->mtid);
- 		json_object_string_addf(json, "weight", "0x%x", top->weight);
-@@ -1791,18 +1809,32 @@ static uint16_t show_vty_ext_link_lan_adj_sid(struct vty *vty,
- 			      : SID_INDEX_SIZE(EXT_SUBTLV_LAN_ADJ_SID_SIZE);
- 	check_tlv_size(tlv_size, "LAN-Adjacency SID");
- 
--	if (!json)
--		vty_out(vty,
--			"  LAN-Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\tNeighbor ID: %pI4\n\t%s: %u\n",
--			ntohs(top->header.length), top->flags, top->mtid,
--			top->weight, &top->neighbor_id,
--			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
--				? "Label"
--				: "Index",
--			CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
--				? GET_LABEL(ntohl(top->value))
--				: ntohl(top->value));
--	else {
-+	if (!json) {
-+		/* Add security check for vty_out. If vty is not available, dump info via zlog. */
-+		if (vty != NULL) {
-+			vty_out(vty,
-+				"  LAN-Adj-SID Sub-TLV: Length %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\tWeight: 0x%x\n\tNeighbor ID: %pI4\n\t%s: %u\n",
-+				ntohs(top->header.length), top->flags, top->mtid, top->weight,
-+				&top->neighbor_id,
-+				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
-+										     : "Index",
-+				CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
-+					? GET_LABEL(ntohl(top->value))
-+					: ntohl(top->value));
-+		} else {
-+			zlog_debug("  LAN-Adj-SID Sub-TLV: Length %u", ntohs(top->header.length));
-+			zlog_debug("    Flags: 0x%x", top->flags);
-+			zlog_debug("    MT-ID:0x%x", top->mtid);
-+			zlog_debug("    Weight: 0x%x", top->weight);
-+			zlog_debug("    Neighbor ID: %pI4", &top->neighbor_id);
-+			zlog_debug("    %s: %u",
-+				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG) ? "Label"
-+											: "Index",
-+				   CHECK_FLAG(top->flags, EXT_SUBTLV_LINK_ADJ_SID_VFLG)
-+					   ? GET_LABEL(ntohl(top->value))
-+					   : ntohl(top->value));
-+		}
-+	} else {
- 		json_object_string_addf(json, "flags", "0x%x", top->flags);
- 		json_object_string_addf(json, "mtID", "0x%x", top->mtid);
- 		json_object_string_addf(json, "weight", "0x%x", top->weight);
-@@ -1823,14 +1855,23 @@ static uint16_t show_vty_unknown_tlv(struct vty *vty, struct tlv_header *tlvh,
- {
- 	json_object *obj;
- 
-+	/* Add security check for vty_out. If vty is not available, dump info via zlog. */
- 	if (TLV_SIZE(tlvh) > buf_size) {
--		vty_out(vty, "    TLV size %d exceeds buffer size. Abort!",
--			TLV_SIZE(tlvh));
-+		if (vty != NULL)
-+			vty_out(vty, "    TLV size %d exceeds buffer size. Abort!", TLV_SIZE(tlvh));
-+		else
-+			zlog_debug("    TLV size %d exceeds buffer size. Abort!", TLV_SIZE(tlvh));
-+
- 		return buf_size;
- 	}
- 	if (!json)
--		vty_out(vty, "    Unknown TLV: [type(0x%x), length(0x%x)]\n",
--			ntohs(tlvh->type), ntohs(tlvh->length));
-+		if (vty != NULL) {
-+			vty_out(vty, "    Unknown TLV: [type(0x%x), length(0x%x)]\n",
-+				ntohs(tlvh->type), ntohs(tlvh->length));
-+		} else {
-+			zlog_debug("    Unknown TLV: [type(0x%x), length(0x%x)]",
-+				   ntohs(tlvh->type), ntohs(tlvh->length));
-+		}
- 	else {
- 		obj = json_object_new_object();
- 		json_object_string_addf(obj, "type", "0x%x",
-@@ -1855,19 +1896,31 @@ static uint16_t show_vty_link_info(struct vty *vty, struct tlv_header *ext,
- 
- 	/* Verify that TLV length is valid against remaining buffer size */
- 	if (length > buf_size) {
--		vty_out(vty,
--			"  Extended Link TLV size %d exceeds buffer size. Abort!\n",
--			length);
-+		/* Add security check for vty_out. If vty is not available, dump info via zlog. */
-+		if (vty != NULL) {
-+			vty_out(vty, "  Extended Link TLV size %d exceeds buffer size. Abort!\n",
-+				length);
-+		} else {
-+			zlog_debug("  Extended Link TLV size %d exceeds buffer size. Abort!",
-+				   length);
-+		}
- 		return buf_size;
- 	}
- 
- 	if (!json) {
--		vty_out(vty,
--			"  Extended Link TLV: Length %u\n	Link Type: 0x%x\n"
--			"	Link ID: %pI4\n",
--			ntohs(top->header.length), top->link_type,
--			&top->link_id);
--		vty_out(vty, "	Link data: %pI4\n", &top->link_data);
-+		/* Add security check for vty_out. If vty is not available, dump info via zlog. */
-+		if (vty != NULL) {
-+			vty_out(vty,
-+				"  Extended Link TLV: Length %u\n	Link Type: 0x%x\n"
-+				"	Link ID: %pI4\n",
-+				ntohs(top->header.length), top->link_type, &top->link_id);
-+			vty_out(vty, "	Link data: %pI4\n", &top->link_data);
-+		} else {
-+			zlog_debug("  Extended Link TLV: Length %u", ntohs(top->header.length));
-+			zlog_debug("    Link Type: 0x%x", top->link_type);
-+			zlog_debug("    Link ID: %pI4", &top->link_id);
-+			zlog_debug("    Link data: %pI4", &top->link_data);
-+		}
- 	} else {
- 		json_object_string_addf(json, "linkType", "0x%x",
- 					top->link_type);
-@@ -1959,18 +2012,29 @@ static uint16_t show_vty_ext_pref_pref_sid(struct vty *vty,
- 			      : SID_INDEX_SIZE(EXT_SUBTLV_PREFIX_SID_SIZE);
- 	check_tlv_size(tlv_size, "Prefix SID");
- 
--	if (!json)
--		vty_out(vty,
--			"  Prefix SID Sub-TLV: Length %u\n\tAlgorithm: %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\t%s: %u\n",
--			ntohs(top->header.length), top->algorithm, top->flags,
--			top->mtid,
--			CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
--				? "Label"
--				: "Index",
--			CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
--				? GET_LABEL(ntohl(top->value))
--				: ntohl(top->value));
--	else {
-+	if (!json) {
-+		if (vty != NULL) {
-+			vty_out(vty,
-+				"  Prefix SID Sub-TLV: Length %u\n\tAlgorithm: %u\n\tFlags: 0x%x\n\tMT-ID:0x%x\n\t%s: %u\n",
-+				ntohs(top->header.length), top->algorithm, top->flags, top->mtid,
-+				CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
-+										   : "Index",
-+				CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
-+					? GET_LABEL(ntohl(top->value))
-+					: ntohl(top->value));
-+		} else {
-+			zlog_debug("  Prefix SID Sub-TLV: Length %u", ntohs(top->header.length));
-+			zlog_debug("    Algorithm: %u", top->algorithm);
-+			zlog_debug("    Flags: 0x%x", top->flags);
-+			zlog_debug("    MT-ID:0x%x", top->mtid);
-+			zlog_debug("    %s: %u",
-+				   CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG) ? "Label"
-+										      : "Index",
-+				   CHECK_FLAG(top->flags, EXT_SUBTLV_PREFIX_SID_VFLG)
-+					   ? GET_LABEL(ntohl(top->value))
-+					   : ntohl(top->value));
-+		}
-+	} else {
- 		json_object_int_add(json, "algorithm", top->algorithm);
- 		json_object_string_addf(json, "flags", "0x%x", top->flags);
- 		json_object_string_addf(json, "mtID", "0x%x", top->mtid);
-@@ -1995,19 +2059,31 @@ static uint16_t show_vty_pref_info(struct vty *vty, struct tlv_header *ext,
- 
- 	/* Verify that TLV length is valid against remaining buffer size */
- 	if (length > buf_size) {
--		vty_out(vty,
--			"  Extended Link TLV size %d exceeds buffer size. Abort!\n",
--			length);
-+		if (vty != NULL) {
-+			vty_out(vty, "  Extended Link TLV size %d exceeds buffer size. Abort!\n",
-+				length);
-+		} else {
-+			zlog_debug("  Extended Link TLV size %d exceeds buffer size. Abort!",
-+				   length);
-+		}
- 		return buf_size;
- 	}
- 
--	if (!json)
--		vty_out(vty,
--			"  Extended Prefix TLV: Length %u\n\tRoute Type: %u\n"
--			"\tAddress Family: 0x%x\n\tFlags: 0x%x\n\tAddress: %pI4/%u\n",
--			ntohs(top->header.length), top->route_type, top->af,
--			top->flags, &top->address, top->pref_length);
--	else {
-+	if (!json) {
-+		if (vty != NULL) {
-+			vty_out(vty,
-+				"  Extended Prefix TLV: Length %u\n\tRoute Type: %u\n"
-+				"\tAddress Family: 0x%x\n\tFlags: 0x%x\n\tAddress: %pI4/%u\n",
-+				ntohs(top->header.length), top->route_type, top->af, top->flags,
-+				&top->address, top->pref_length);
-+		} else {
-+			zlog_debug("  Extended Prefix TLV: Length %u", ntohs(top->header.length));
-+			zlog_debug("    Route Type: %u", top->route_type);
-+			zlog_debug("    Address Family: 0x%x", top->af);
-+			zlog_debug("    Flags: 0x%x", top->flags);
-+			zlog_debug("    Address: %pI4/%u", &top->address, top->pref_length);
-+		}
-+	} else {
- 		json_object_int_add(json, "routeType", top->route_type);
- 		json_object_string_addf(json, "addressFamily", "0x%x", top->af);
- 		json_object_string_addf(json, "flags", "0x%x", top->flags);
diff --git a/meta-networking/recipes-protocols/frr/frr_10.5.3.bb b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
similarity index 94%
rename from meta-networking/recipes-protocols/frr/frr_10.5.3.bb
rename to meta-networking/recipes-protocols/frr/frr_10.6.1.bb
index 1c06f7bda5..e86e0f3153 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.5.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.6.1.bb
@@ -10,13 +10,10 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;nobranch=1;tag=frr-${PV} \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.6;tag=frr-${PV} \
            file://frr.pam \
-           file://CVE-2025-61099-61107-1.patch \
-           file://CVE-2025-61099-61107-2.patch \
-           file://CVE-2025-61099-61107-3.patch \
            "
-SRCREV = "cd39d029a48a1e58929a7f31e7d61a594c2ecb42"
+SRCREV = "71da51baee6fb2a02b24262defc46591c86e8a81"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.34.1


