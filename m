Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E12CC79FAD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 09:33:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7897.1788946393266569445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 02:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J5TYHZ5o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37127eca51=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6894b8Af3774864
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Sep 2026 09:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QIgucMP1FT3FWWV8tWWc
	kWmSh0kuMqALT+/pNVD2kpU=; b=J5TYHZ5otVvKBKaMkwfC036R3zvhxUqF8l4v
	4YQ7lrQcTZLFV7nQZwsZ7L1mHZflCSQvvZur7OxSSvOoX4pQalwRsIB2rdzjbSsK
	plSff/z9SwvvGRqo2MEvJgFgeIp3yfias1cPsmsgHf6UmVU2ntALBbpLnVH5bqFe
	DZA1cUi0FMwXfHCtwKSp33Bm/VxZ3yDLu5lry0qYUUROp/C1c5Br+rwwpIchSPbQ
	e/VmdIzgbn7yDEiSUtw/Ir1O9plOgfJ9WlvSyh9brL0jWO+zuwpgZi6mhm9B+UwM
	aqW71i9z8Ql5Fi4ldcS0/sq5BB07xH3w9Sj9OfH1mDl/iJ4H/g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023107.outbound.protection.outlook.com [40.93.196.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gga25wury-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 09:33:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRffE4UjkeiaRDgZX5KOb8wsCVma02lSWb7EFeKnc2dIwGr416H9381sqVIahpS1DF+hegKNiaU4EbjY4vqDdWYU9KCuocY6EuWqwd/0iL8RV1VcQHCIyOhT7+CPswH+0/c58jQ0QFW3dW3FnAZ00d7m8iAelfXrvxYHUn2G4p9k9tU0jSDGUE0fXOFAk+h3OrHXF2KgUiw3YUKJm4PljxSS36q1IAi1MKApghGcyb1fI+9NS6ALQ6SMReXnlY9y7A/cJpShJihkrrPUyz5kItp81lVzNrnFxFHHioLKmGwoV57LZ65FdRMUEVEOSXf8/PArpLVDQk2DloHm3CpsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIgucMP1FT3FWWV8tWWckWmSh0kuMqALT+/pNVD2kpU=;
 b=iCgDLeOUrh1+S+3j5EJka95EkJz86G8xvyURNvkbpwfncOEpOesK8aaMF9xde7ZfxkxOlw3+rOEBlAJdpXS2+MeaxkabFddIy9lERCdFBPI+W9fScgOa4fUUcSfpcGxC6NPoZjYtva3z/688m1/14+BoZ3lDR++IFzxoN4yQimPCd7phtQFWTHUqj1xFEl++/LA/fC0wwZCZ1JOQjX4w2poNJuDucPVPv3EnnsaVxyUnnP5shHSHtA0XIEHaGN7EuIGzGQPl8hFTbsxFF8VeBPamZ98O2N98T6zPUJIgRnPP6ZdtZdXo1ZSv7dQ4Wk2Q7yL+Q8KJypWcCizXyCHjMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by DM3PPFAB693A2AC.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 09:33:02 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d%8]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 09:33:01 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH][wrynose] postgresql: upgrade 17.10 -> 17.11
Date: Wed,  9 Sep 2026 15:02:38 +0530
Message-Id: <20260909093238.1459937-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0046.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::8) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|DM3PPFAB693A2AC:EE_
X-MS-Office365-Filtering-Correlation-Id: 5901949e-dd91-458a-afea-08df0e5557bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|1800799024|376014|366016|10067099003|11063799006|6133799003|18002099003|56012099006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Qh2cw3cS80I+NsuPxcZRmqsQS4gAzaI1MrIXDwXs+Pu+TiF3/q7nxd+Ez7dwrr12ckJrd182w+c2Z1SaYyKpgOYEePxMBD61qqzIMgq0MegysE10cvP94kpKA2T869LlKG+ZIWrTzidgKJrRB0vXF+OkSKJbAzq3U3ag+lnsIbJ2eMLRmNQvsAGQKUkT3SClndD4af/h50Ct3pqJUYmVNFXBoOsY+ByP9Je33k7J3FlvegrR8iNfMnsyoi7/6cFM79GO9tvUmfUi1Ddsyk40RZ2DpWlOGa3iLW6/yfLCB4pBAudI2CFf3J5vSvQ4gi6MqFK8m5ts8pGNuHcjhykXnls9zA5+hl3DolZpxVHE6PSGX29+dUgwr10Z0GMcz5j5a9hhRxf0FylQw9DqKwUGrQ8aGmNA1O9dFE5Yue14eKXPqLk9yDKnnRSFMHBCDHg6b1oRwHv9z7JHAI9meIce3JbKfaE+OLoI/qNYWBCLaLubFlvJDgwu5FYGiZaSG2/fi5ZiQa0aIIR4IeVPto5L/lGNGuyBl3aqdZ/EUIcScrvRDceiUaQKLi7SvRz1i2dKEf0OtCrua9Y/hAU9rUL+8/OU4Ale6D/4csvjIRBtIQEt9xx24y+pdDdasCmI49ogtAj++C+6LHrjBKGsoMFljdCUMUqEreqx0OaSRdQTJKI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(1800799024)(376014)(366016)(10067099003)(11063799006)(6133799003)(18002099003)(56012099006)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aGb+avpp+pwNn03Mt1A0LYTyo3hb2bwfboCFdnTwJkBrKqb9uyjcJ0Ii4Jdr?=
 =?us-ascii?Q?t/m5qk26fu/ioJUPVgtbDcM/dwMg8iUIc13NnVbPcBcEdkfbJVroPwsMgIyE?=
 =?us-ascii?Q?aW6Zn95po46vBoUMMeFcg4XFNK+GQzBEwQT1AgBRRfe7YG50oahuxh/OLYY0?=
 =?us-ascii?Q?y5/G4sNgfwufrjOO/YVw5L61stI5q1Daoi1/in5YhMt//dHH6fiCtJ3BC7wj?=
 =?us-ascii?Q?RSMmIwxeKOU6/hLR52Oin4IwcNbK97zSscS6doJNG6VIo8/TfwRqjn1U1zro?=
 =?us-ascii?Q?1R5x11XlLQLIOVs/PJ9q2BL0MBGH4j1SmNX0yiK+WLOdz8P0e57lVeLQx6Se?=
 =?us-ascii?Q?ECjBPbfAa4tZVQEdMHIT746zI8e7X6MJst0GdEVCTWR9xdtK79Ty/xDjBG8Y?=
 =?us-ascii?Q?uVxl+0wJmtkZtj1oIQ5RyPW9eh0OdQuNj+2GSMQMWFhFgz3zMt17R9mU5gPm?=
 =?us-ascii?Q?lNhxy10Gz+so7Q9+yBJPHIIF4WOTk1N/rI6yMh1gKJ5QnTnBoon2NrpjP3kk?=
 =?us-ascii?Q?0C3e9lvDvXjRpNT4FCgkbyOOQFA6SGBPj9sHnepu0+BaqbeRqSaiKdZ6gBXs?=
 =?us-ascii?Q?mGGT8wJcGQuLajJaOpgvNaZD9CybODS5X2rS0wfA8zA8EKXjJN/T2VwLHDgQ?=
 =?us-ascii?Q?jPjuPekqj/0qVi94fjvSuF+ZfLB+QjPTlBrQO2KyuFOQ1x/UjITdkn9F0OfZ?=
 =?us-ascii?Q?YBgGekN1KS08ilx8j0+O93abtK58nVaEr7dbYzantnRLThHIw0mozXmWyEu1?=
 =?us-ascii?Q?IUY4keN0hCmaQCbzeE9bynPZrPk+xwF0423itW/CEbqkKYuEkdgrxQ5rFjN3?=
 =?us-ascii?Q?3mEgcZWr6pydvXv0t2nI+5kcY/UyJK6MLWmJGQQG+efrcO9oJ+pYuCOUUw/P?=
 =?us-ascii?Q?kH2OhMi7yoDPw5L+09vtddaJ9XtyLdlmAlOLJY0iZyX1rKlVIlWtkie8UN4M?=
 =?us-ascii?Q?HYUemLWStlkVTvg3st33OF79kVMov8gAripjiM8rRKassWRT4U4rJg3A025W?=
 =?us-ascii?Q?A8m95BOFNEm6s3Ys8Efpd8k7mSB2mrjIzvvXN0uOZa7moUhKHs78MEdm+5uh?=
 =?us-ascii?Q?xQQ3g63GJC3xz8YATMO6amK7OiZtnSg5KysFZdiTslLGpalHJRgItNB/yF67?=
 =?us-ascii?Q?+4UROp2cWfvLILG2CUjyd2n7l4uofXs8bY0gH1/z614+soYbchPX7wSLp/aV?=
 =?us-ascii?Q?B5BoImWkyylrp0WgmvLBEUVNhQLRUCuqLyi2uTP/29QVWh1xl3Vz7YQI5Afz?=
 =?us-ascii?Q?QhYAXxH1S4g7l0u93l0uldV1GzxWkdZPJVaiL1nFActIWmabbuYnx2kFvf3L?=
 =?us-ascii?Q?r8MToMDOODcvbFg9j2gZFZ0sOUx2ixtqCZaBPIsyOgpqbSBFmHMI1NfgMlxG?=
 =?us-ascii?Q?6K6/5HGYxmT7BCmCoaCdiP2v7mOdm8wM0B0OALoMyqMr3ozhDMrGUx6mpsTr?=
 =?us-ascii?Q?rQs6W0OTdTbTasNvP4Rt+1UqndI4RYW5drI/zczZxQ9QEjYkMIo60mQ+xz10?=
 =?us-ascii?Q?pxcyqbA2yEMX5fQGyxVAOQ/WRJC6qce6gQe8Fo/mnqrmkLRGEFXeg80yhcW9?=
 =?us-ascii?Q?S29OpV7tnpkUvhNqrKkmShjL+RRTx3GyGd5ICE5cvNN+1hbsOCAq/rZ/TnFY?=
 =?us-ascii?Q?t0RTDzP89EW0x1DfgZQPjGNYElHhWbAWsuk8koY1CJ5XrZz4K5cCQpg+CAUP?=
 =?us-ascii?Q?96YNHel5Ylr1AVaXNmbuXFTGB8uMrABxvrkQ7suBQ6QOvsoSXIFVvQeSazMh?=
 =?us-ascii?Q?e76B6YrEtaZjzXwRXufU2mtyhw4bqBU=3D?=
X-Exchange-RoutingPolicyChecked: 
	fXoR+IfGd4Csjv+tQuMRu8m1nvEKb7o5dWtbr1gQfSIoCkEjrXrd6Af/Q8qjxuF5hn87SH/Yuqf2vYIx+LDXLtOTZu6ONIu+RC7byNT1KM2vm1r/3FOzPo9+XJ7udADz50YbRrDe5MuyDiTnB/d4RdxB9tHTOABrPhDBVzTy7o2aTnUbR6eH+59vfvxWAD+EZNucWcTx+gR+npz66gcDBhZLi0BmoaRk0XdZ/jJN9VuyRUb3PBAABAm+i9DO78LdVPNJTmkZZykMcCtc9Y0VWFBv9diH/2T7Jv1F1/ivKAS88pRwwZiZFfILorhDtGlAkgyUXNEID+T7iziSI62p8g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5901949e-dd91-458a-afea-08df0e5557bc
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:33:01.9179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkqsaM0D/Tg67kKnFwHC8b+tfSk1tJwI/eIlqqKv958L9jo3c+0emDGjsjQF0OhXFBpz/OWbxekzoxBR5LortMRKEX8mJyjD9THaB6T6IIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB693A2AC
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6aa127d7 cx=c_pps
 a=slu7Q4BvoA09i0qrEz4xsw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=epTmVMiNAAAA:8
 a=t7CeM3EgAAAA:8 a=bAYW-0WZY4zRW3ytb3UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zqh2MrdwpQWEstSfpgnQqWM948bUMWGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNiBTYWx0ZWRfX1+2Wuc3gkCPc
 YsxHm1+Ly8KvPvH++lXprhK2L9cUkHvjl7EEiCnuX+UpYk61CYa0Y/XSU0E8quiBmWyUAqD/bsQ
 atr0acZsAwvtd2x8UsDYGJmqDmvjnz0uwq/TiHuxbabgBzv4Q60AtZkc6Q0jbzlrfMoBrDsmbM+
 jo1bYQJTg6xV/5AY0axSbIDSPmlg4w4v/WgRDtteiaCaPrtK9l+PhT4e5tYEZFLMBwPNgJn+YtH
 mZJsMfHNNPSADxUNC2hhpMOYwS7/ju9US8mUV2FOes2F9DRR3sDasYS1qI1YHYr/NFwZyGnch56
 5BAC3BWZ7CGoTrD+idJ4guHQWljQoeIh0Gp+sVbOGCwmj2wFZ89Lu5bnC0A98WF5GwxWTfzxhuH
 FwF16iu3RU1rPHDu13fj0zoXSVCx9nUUBevSkXDn2LO7mToJcD4ijXVJBfLmYhaP64jUmD9QNQ9
 s4eoTHkXQOGHItbIHDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNiBTYWx0ZWRfX5F/n09ESHya5
 0tjNBi03pIife3tkWJwAmshGgGqa6d6HhWhcVEijIDGXYmzCgqA3bWjcc8F3GQ3NBfWQ6IIP1Bn
 J5AaB1dSjEOs1HUVB9478Hi0nGTYFYsiggSeN20G9/gujT3KzkFA
X-Proofpoint-GUID: zqh2MrdwpQWEstSfpgnQqWM948bUMWGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 09:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129887

Minor security release.

Refreshed the context of 0003-configure.ac-bypass-autoconf-2.69-version-check.patch
for the 17.11 sources (context/version line only, no functional change).
All other patches apply cleanly and are unchanged.

PostgreSQL 17.11 fixes several CVEs;
see the release notes: https://www.postgresql.org/docs/17/release-17-11.html

Ran ptest on qemux86-64: all tests passed.

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_17.10.bb => postgresql_17.11.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.10.bb => postgresql_17.11.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index ef8c524fad..9e83de2f34 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 29289c6f5b665ed9943bb7701a542fcdf64c4a22 Mon Sep 17 00:00:00 2001
+From c0c532a26ffd6d3a582ed292d6335a3e9289ff7a Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 856b091..646394c 100644
+index 802d810..1afd829 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.11], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.11.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.11.bb
index 98b8d4891a..fcc51507ad 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.10.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.11.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90"
+SRC_URI[sha256sum] = "dd27f2b3c59e73ed14aa3324901242bf69a032a6347805f274e6260322d42979"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."
-- 
2.40.0


