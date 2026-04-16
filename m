Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE66BF8A146
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 08:38:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8915.1776328726284581813
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 01:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jhj/pnGU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8566366d7b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G4Hu3R199557
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7GqnbuTLr9yL++lsalSo
	PWed+by5P78c2h1tWp+vFcg=; b=jhj/pnGUFzn9XEJCtkKXelDhiIF7Yr16IGgq
	HJuHhFQiwcByRBFeCG9Ukv2dC9vXS0styhLC4E6JApIxPma/nnHwddOfVz6aPWNv
	JhKcNi8R1afXoLXxVzAddoot3kuPXYehyJ4J9NJFHL43QPf8PtHjHEVstFppUYNz
	Af/ecpdW/y+YEtwU7dK2vPDkVm6jE/8R4l0pqH+Jbk1g1jkywuGySs388xN59Lvi
	afOf3OMdXcxEaZqaP27zwDGreHh0tYJz0IAmQ/lTNVqtop1m89BVsYB9YYOFTUWQ
	Ln/cUGYZlTnmSjI6TOUtgz7VFDa69lVb4iMpAL+g6wN37+R3fA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87abdxp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 08:38:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Be/FjyewHnCUW304QpsoNC6iuowlpRjDmKhII7OmF1mMtCPcosaVq3jXLk7q+tB0I1eZG6AeO0DK00TJKJe0EvdLF0GLw2ggteIhAiMshAqiMXtxgEY5Ghz9FBr2uMQjthHRSa5gE86WJbMtmtQ+764tMCkNOiCDLocha5iL+tBFagZGSDT+ppUNu55miNgX6Br+OVN6mjgbUM3QbkYDZ/zVrXTDs8eSJZnoWW45zoaXKC8yfl40PjvU3fWEIlaP1Vfw8bosqcoANZwTt19N/YaZUb8MaWW4BK+f8TNcJeoEymVay7C0nXMn+I25aPh6i8/cn7af/b5eff+JzB/fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GqnbuTLr9yL++lsalSoPWed+by5P78c2h1tWp+vFcg=;
 b=WW5rsW09brpnWIpx3Fq3dTCUXdD7T0dwBVfirHqTW3qv8eX0G2tj7PfqlYf1k1NZ1xU1rZXYJaHUPhrfTZg5DpTzJG7e/pGpPvO82hSQh/Cdb1FyEAW+M7csjOmcBhMWLEOTF1jzRY7bFGMyqc+k7hShFzQXbOAQj26aEsVWD1nqeGh+lAqVLjUc8aVz2po2a8iGvw+CJ9aIWOHEJU/n4zWDRsPJYFLtb3Nf81doohFpuYQuJSZTYMnyxerkLzIB7p3P8SVQvB1Ln8TfJMpQ/LFnaStCqktSRjz/z67TYXqP0ILcwHHZtJxUJVVHzfGUl5SZ9tX8RXahEGygx+EYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 08:38:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 08:38:41 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dlt-daemon: fix missing application description
Date: Thu, 16 Apr 2026 16:38:23 +0800
Message-Id: <20260416083823.3691940-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0007.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c446926-2725-4fac-fd7f-08de9b939002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	RMzv/mLpDyIqYoplTtiNuYx9YTZu2MaLf///C9ZcBNSullTNtWQnq0CDy8Yux8VFc+dfLYpRlm8r3PQmgA79PI9e0i8ctx7kWKPWLJxLXMSZxURkX6jJopnAO1H/y+O/CFGeycE03qc90yfCcNnNGUpwVz6bXIhYDV0nNt0GG/ST4w3PHIkPttlRU7UwOYLFUPRY0h5xpYpMhVRHGOr9W8Ln+2zF1qp8YKZKUAay0C8TZmai3sPRZrVZsrVUItBlrlJcTxGor7zEzDJB7T1ypOBgHDiOCHv9XbSfzxqBeplvqmPoQsBfGI4uI9jJaoqDT01Wh3VbODXEtStAxK1v8KHCHfhI0aqLsQY/2I/6Lct2XAuntGX5/P7I9rUu9ochJEvupjomkJTPsWYD8l+wOy4WccuVbKyQ/jM51CuQILsnkwfey9iUA8+w44DM7bs5vQKla3LZXJ+z2wDLmd1qTGJwwso3JmtW7JzvjjS2qIl9iH5bEexxYG7XdRYg5djTnP/jYBPrTyNXpRPcBHs5pwKl01TCA1zXcM9/dWkZ4MRXFYnjwealCrKx+ZjgTWnx3N1PV7l9fBcI48gsS5Gy1WBOjsuQcOGPxi9cWpOOWU+HqVCZWjuVuFoLv85WSEzo6GK4RDs2e5wucucIp3tDX8wWpEkqUJCTGpfjztrS+y5WP4E5yeERQSDlfpsA+BcKL/Ax4M+krJX4ImziZ1hQIQKYFHhMxC2wcocrL+RJOPMIWXlH+W+yP2e18eu1b1i9syds2elDVkBWrxpgQwWM9aR5Hx1bhBBE36S7aCCme4U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TnG5hsuf+8jtjs5dLowkWjKMs+My57bREM+kRO3Baba9t+HUWg7cuxDe0VLp?=
 =?us-ascii?Q?sSIHvJQsJ6mrU78xDptxIv40ru+PSF7O8XkeIatAra5FzzXWfOcNcTUkRc1k?=
 =?us-ascii?Q?h+zx7vELbes7Xn+hRaz7urCqr6foxkOZtaRosBk9OKk/ftIuRPri9XJVeMzY?=
 =?us-ascii?Q?iPfKSA0UNn4kCfR49rUL32ez7W/KqczRmEOxQupCaISamoqx9tbwIayFcra3?=
 =?us-ascii?Q?aBA9Wra8E4xVexoK7jBiS5yc0542pHLLSbQO9hRmgzgTbvWJQTTn8WlFD8bv?=
 =?us-ascii?Q?v41uN9J3R9FjVhDtnjeym4O3xdgUXP0D6/c5ZHOZcMor9o0UCrUQJ+f/dU8s?=
 =?us-ascii?Q?uKAParLY9XpT2zckwOeqZzyAzn/gHQRB2cNM6lEYub94ZzsXYaXsghqYtGIZ?=
 =?us-ascii?Q?USUnQmj+v5T2RYBFiFAB4qqrZHtXPC61HLQDbM5mjX9y8RDGsZFdFBemXRyB?=
 =?us-ascii?Q?zDzejreAgTC3vqQL+Ey9fGN3tToQJqzfMscEzzlOSskOEOrLq87QqbdCoCto?=
 =?us-ascii?Q?Mn+n5GVlYU/paabJIMqej+kxEcsFkEI99tnkyOIfcpaH1GgJ8Iejtab+E+By?=
 =?us-ascii?Q?PUr7rOq8chTiCyuQCLYdPLt3DcrL67b8fDouRsfqQ0JoSpf1uaEcrRQCv4yv?=
 =?us-ascii?Q?geTi0Lz/MvFByAJeb4s2sC9aNnRoSmhRHdtt1dVFGpFYnn+qQ20dHefAYkkp?=
 =?us-ascii?Q?eaUW4f+YA6nY/mQPxOgEDnEzW5oP5xsKfhHCvFjmWGl2m40SJFv3EM3CvYuc?=
 =?us-ascii?Q?FY8oJOYQsNkHBbCH4i5IQxoWUH+JzfhK5Ih79AtnGAwfM4R5yj3IydM3GlUK?=
 =?us-ascii?Q?jIugD/9dPahlrN9qG19ROJwxTd/8tha0wmX1DzOctOwGowQ0edM6byftbNXn?=
 =?us-ascii?Q?H3fxuIuSXb2MOSrRlUCA7pP38skSGmUQBKy4QXOxJhTT3E1FEZEWEeVpuuO9?=
 =?us-ascii?Q?JnnqJ3vXiRWdKGM8XRyDetcVjHkYiLhdSbC2SpwzX+ZIj6mIkZfOtOuPY7p5?=
 =?us-ascii?Q?WDHHVucsQjeY9J4fq39bX8zz2r9dl5BXX4VGp0utU0q2guPWbIgojVRytFvQ?=
 =?us-ascii?Q?BcyozAIvYk4MMItzEPKE2r2noyVstj7Twkp6mypki0XGoHH8RaqX6K5iCGcL?=
 =?us-ascii?Q?fg2A1osOUFfYPBYUp9Kbi1cFImEF9PfC7Elj2WSAdzB7P95dewXkmNlQeeMD?=
 =?us-ascii?Q?BDe/8ObvBMdr8bzzYch2iEd3q+8I0HmXZdsmnvTzGbGHNpngckJ54xiS9GrO?=
 =?us-ascii?Q?lSr1uOzaqcmtxUbl0E7TXl8dIvN0Q6ryYhBuFPT5PGnoVwOk5mzr+F0VnkMa?=
 =?us-ascii?Q?SgvvmnG2SX/L6bGKn4tprLJWxFZkahTz6ax8pABhDUE40Den6GdB0cu/PxFt?=
 =?us-ascii?Q?ZJA4PFrRbwr4lFTfqDYR5oZGzln34BLDqHF01zajU7d6WbCdpgHNZFAaTxjH?=
 =?us-ascii?Q?W1NEBrNHnznxcn4FJt5u1c5qAcfcBAITo2Z2y0AG3wSDJCkEfre3/GIrDKLt?=
 =?us-ascii?Q?nP5wT3uT23CxNDvzormXrz5qE2mOMzh5LZpddfx61RvklrDQotAHKocRrlyR?=
 =?us-ascii?Q?Vi5KRlQHFMwonYn6dPey1AaD4lwER8vW5NEHilcC0w4G9TcnHkQjS7RPOuUF?=
 =?us-ascii?Q?HSfpHwAbqoYQjVwgHYkKX7VUvzqRIVmRsiTefxADF/Y704jOekfCkhI+nc8G?=
 =?us-ascii?Q?DBTC3nt05KlKfHoCpWa30UfFoqp8/ckkUkEQxBcSaSFla8toZ2pgDOW3c19X?=
 =?us-ascii?Q?eu7ZbVT6M8BBP0G69LiFD4fLxs/tCNU=3D?=
X-Exchange-RoutingPolicyChecked: 
	U7Jbx3vX/BePaZHQ6ASZQj/BfZvox4jJ1mhy1DlmeHGq6gaDMKwYKcReQLRT4fGDfTBKA4t8tk81MxWeLF6Py58CD2IVdJKC6MEeMDonY4CnVBJqqagXomrEQ5bSC5GND/P/WuQHhqCtq4zJS1C9oCrq5S/iw1TTfDRUr8vDKDTcz4xBNg1wF0BGu9qDfQWvLd7enS+smW+162QzduMHGhy6PoY1hlL6xS1ryOoV8c631E0YsAruMsc8nQPmJ//9chsw9l5NgP1tQQKCL3iKQyX/QlmtAsAbmpB2zIplyFmeWmmoBXha92kMyvbUsWtymuiFAuGf6/MnvlztGTwXIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c446926-2725-4fac-fd7f-08de9b939002
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 08:38:41.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyl1OqM2edOLkmTmPkFwRoQ/gR4h2ukMvjPhYsdyM4t9h0BeD/oDtEGyT8U6oBpg900podWy+EsyStFAENIjf9x1AbOwIX4oeE9ROSA+INE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-Proofpoint-GUID: sN6EwTzPaOdPMAlBkM7Yd3ldJICExHDZ
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69e0a015 cx=c_pps
 a=X9aWvzuQDVJ7vSK8h/Ha0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=1zgg5unjeo9MhApVFb4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sN6EwTzPaOdPMAlBkM7Yd3ldJICExHDZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3OSBTYWx0ZWRfX06XLoelKthXj
 oqsn5G4Lm6kWjPwwSJmJ+1o4VkdZbb+m4L60QrPtrUmk0rm93yrNw5mhn2bfMz/gOBtPFHzgc3n
 ae2g9fWwO5QxBEyXFLW8nONjozG4pKT50tHZJrRshxPLvf80AbUb2rj5aw6NrPJ18eG3MFBKUtN
 GNcQNEMOIaxzmU3TQF9mTPvY2C+33hN3Tv1tx5LPo25sF62hDAjDGUB01i+i29+MQOu7J3PBPaf
 trphqazqrBGDxK6mf2zdF/1pFxTOpP/Rlef+g3lSA23v8xtHZSGLEpN9woCDonZ9Jx5C8qK1SFK
 e23xrZDgPgGXf2aY7/HFJNAu3jANJBWUkeFhmc9IS7DEeGTAnI5imIhShdT6eZuuA5rAeMWvDPc
 51SsnQzcGRNM0mUbeqk7m6DkUYDOQGSx8jjEHVvQJMJVCPKsZHBOpK4fbuH0/xkqtSoAyhevSkh
 9VH2b6rdnCv/OZL1i9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 08:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126403

Running "dlt-example-user 'test'",
Check "dlt-control -j localhost", will not get application description:
APID:LOG-

Expected:
APID:LOG- Test Application for Logging

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-dlt-daemon.c-fix-wrong-len.patch     | 37 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_3.0.0.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-daemon.c-fix-wrong-len.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-daemon.c-fix-wrong-len.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-daemon.c-fix-wrong-len.patch
new file mode 100644
index 0000000000..bac7691c32
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-daemon.c-fix-wrong-len.patch
@@ -0,0 +1,37 @@
+From 7e94c281563ff0eb67e521cf0a6fc3049f732214 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 15 Apr 2026 16:52:19 +0800
+Subject: [PATCH] dlt-daemon.c: fix wrong len
+
+Set len to 0 makes the application description always empty.
+One of the failure case:
+Running "dlt-example-user 'test'",
+Check "dlt-control -j localhost", will not get application description:
+APID:LOG-
+
+Expected:
+APID:LOG- Test Application for Logging
+
+Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/pull/852]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/daemon/dlt-daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
+index 8c318a4..38fe824 100644
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -4110,7 +4110,7 @@ int dlt_daemon_process_user_message_register_application(DltDaemon *daemon,
+             to_remove = (uint32_t) temp;
+         }
+ 
+-        len = 0;
++        len = userapp.description_length;
+ 
+         if (len > DLT_DAEMON_DESCSIZE) {
+             len = DLT_DAEMON_DESCSIZE;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 141dce57cd..cbeb8c3703 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0001-Fix-build-failure-with-glibc-2.43.patch \
            file://0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch \
            file://0001-warnings-Fix-clang-generated-warnings.patch \
+           file://0001-dlt-daemon.c-fix-wrong-len.patch \
            "
 SRCREV = "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
 
-- 
2.34.1


