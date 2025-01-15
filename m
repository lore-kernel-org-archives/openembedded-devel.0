Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07681C02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15808.1736925890049590671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F618DF031512
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:49 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt73qec-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox4TViMk4SR4APzu7zsxHrzDz4zvJyzggwvAyWsARgYLk2qyVUbrvpgPxbCFjbb1GKQxWHVRt7RqDJLB7RadGzAggzqtzxtjqQDr1UF67Zp2h7BrOnky7+4WpPIxl+y2HA/2IAhcGjaV6tVHR6On+u86lYIGrMa9nUoHFiDbnGG+f1r62DuoIhnRQ9M3rksDz0Dnqon9lNtfqVsvw/AaljO2nzI/q8YN2OKHwjzFFVsVXpbUfpF06/urDskpUmxdKmVSxCeQHol3MtNJwAJVWLvDjk1iMMkogHAgLH+DlARd93bv1rztL2By8fgItShPoM3649VakyLFqR/fnf55Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMyb/kYahQokj1WRCMco06UH1sb0J7cUrW/dMTuCU3s=;
 b=dSxZFiohYVFDiOs02ngBEzDor7GtjzPBHoECRRisMh6e7rWdSc95JUEv5JffkDep1KTGR6j27GVqRRgN1d21nM3ZMl0zncmv9pGAYZIN5QFaXaonZYfAiGgoQRWIsOF/An/zh5f0F6QAa/X+Eftmn96h+XcNBNZKt7aZY5Bte9ikLw7dn3k6JcJesb4+G0NdYLNQp4rvDc9SQZuMq6l38mJ8bXRoWvTjcso/E3XY2LzJ7KpifzPaRHsDK058yfTMXMUtmnA2eICfMQHpWFzBehNq67drYWBCot+cNZ6iRgQOcYDxt4D059+JdYPhKLkbR07UilUFwr8KTRgCwFjNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:48 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:48 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 7/8] opensc: fix CVE-2024-45619
Date: Wed, 15 Jan 2025 15:24:27 +0800
Message-Id: <20250115072428.3667416-7-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
References: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a84dbed-0ebc-40d8-2f05-08dd3535b127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1SbIwkqNskiQFlvIVE24BZFXPsD8OrPiRJjhyaiQigyyqbkxYMgqKV2G7PjN?=
 =?us-ascii?Q?bTiWaIpie6nyW/YNLsP3ypB6qXTRhT6Q1ch5Jo9IOnTNAEHHBY2YmF/oIklm?=
 =?us-ascii?Q?WgYlzu5/eysRXJNeg09ko4YwoxYk0LzojbC97iKfyn2aXupQE61SCOUE9pJX?=
 =?us-ascii?Q?xZks+BfsiGj0Cn4IvXBOlqQsJ8VbHZBxSbb59bhP1R/VoivelotPlRFXw+/M?=
 =?us-ascii?Q?lANsaOLE3sZsq4qLvLAYT9y2SC5CgjM/Ax2lmsPAf9cx8wRZiQyn1G6106MA?=
 =?us-ascii?Q?4uu2sCZnXY/NqqFqCpxZWy2rmBl4HDN2nfYAUUID2OSZp8uUySCAi9ZtJmsI?=
 =?us-ascii?Q?xG5mbwKMpFX1xaTb5hdrWm7sh5nD2RcEMI54joOAzrdggXu5ciyOa9LnNmq+?=
 =?us-ascii?Q?McU7ps6w5tn0KRgprTAVHp4nxG4qqkk1/kou08z1cYD+NDKgwrxETYNuxyLR?=
 =?us-ascii?Q?oqLn6j0Wh/Iwtodmq54MO1TrN1JPR3obKCjyVUgQOGWmlArmGA3fwV8q+Jbs?=
 =?us-ascii?Q?gMovH+CWb8rc1ph/IoLeefegCfUFDomZc/kGCAQ1HpNMYEdaINAOXKE8CsB9?=
 =?us-ascii?Q?uMq193uFPM3B6tpH1dFeR7OnTFNxoYYKV00GbdEjzGsgrLdp6k9JjId6CIi+?=
 =?us-ascii?Q?Q9nvQwGqWp9EKbT5b0M6HF5a1GApVt8va6Vj5Sem0Z65VYkl+3zaeNo+NDP2?=
 =?us-ascii?Q?LKzVaLTmYWc7ZVipc3mxugS54fCSF9+tLF6PuvP2Pk/+jYZabPnDeIJqRbCZ?=
 =?us-ascii?Q?sucov10a7RxFEs2iv4cL6VltK592SEEHhumaza+GFqxgXBxznxz3ReuzXHt/?=
 =?us-ascii?Q?7W4skz2ym4clYQPKyOR6b621di1WBPPW1mHwx9t2gj8M1wzYdjFruEekQp4r?=
 =?us-ascii?Q?Ysby+rUxkeR0XuQ4UXdEns//Cv+xWlU54DdtJ3XDYd7Jt24B+RdL7MTtwxR8?=
 =?us-ascii?Q?955vHBL7OY+7VxZHTi2OoI/GBBj8j+XDh2RGIyzLrDZLNY/baHl/gkGLIQII?=
 =?us-ascii?Q?pf15xem/NZL0Fb5QbEKlk4RsDKoFMr/i1wkaPoIqkdk14+T3jxSZrGOay0II?=
 =?us-ascii?Q?JNJ+5SWo9UntGwYLJXwVUwJjVXpDRe8FhJWpjHlEutCd7m9r+rsxJqSw8bQI?=
 =?us-ascii?Q?JEsyaYL23rtddRiJe91plwl7cK0nnpMCkgqr1i2gwwQ/QTbh+jvbgfBc8WwI?=
 =?us-ascii?Q?RekkcmQZcnlqV+2pmeSyyzQmB4R9KOT1BDSFPrtElqmJrNR8kEXqti5nLXeu?=
 =?us-ascii?Q?EWnxU/RIgTKmknOUjUViE9F5/5Y/ZqmfSsf1i8anQw4r/dXS6moPaJFl/Q+K?=
 =?us-ascii?Q?+2DZEY+xURRJlJOh3yZfqJqD3mOabVw6/23c99vZ46AzMLjKMetcHtNa2hQj?=
 =?us-ascii?Q?TkGSsOLnIuyDrKk2im6ctoLBzUyKd7rdQTZ5aYzgPNuzPc8m+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E0XWxZOqAZMJP8rtcB15lXQcl3uXoWsXjB+9vaJScyvAbmuUGl61QcRgqO7v?=
 =?us-ascii?Q?q5e/ejpl2RA83w3jXvfAqOwD5+UYLyl6TbcuTEFTSfdNmnZtyB1FilcVqyzT?=
 =?us-ascii?Q?7O/qKLbJOiWDvdAIWpNndKvVp5eumj32iFB7GgqA77b3RJvGNiYRqIHdewl7?=
 =?us-ascii?Q?6VLYoQNixHUNIxKM5DhA+tJFHacpp5RyF5W24nv3ssmc+jtzGBjrbt0ML0p4?=
 =?us-ascii?Q?2zRBkZnhDV8gqdr9QdaoRCXwxEvAkBM8woKJYBBVlbwoKhJzmuAjtMs5F+4I?=
 =?us-ascii?Q?f4oQRQpxix0wtn842nwnSI1KvZC358PlR47e9NtJ/nYRgack+u1FabOVQjsY?=
 =?us-ascii?Q?TfiQRo5dx9Kiw3oPfmn8HGnymzWmMh1AEPOnJUM6XlwB8kdymMu4vw1F+Yem?=
 =?us-ascii?Q?NdfV8X0qMC4eJ/2DzTv610lpCV5hjq868NdtGIN15HTOzYYmGQ0ehCKS0uLP?=
 =?us-ascii?Q?v9jfexyAcdPAyPjoywdARxxD+om0YzacJihc7MrVS27s/TLseR4QXAmkFwXQ?=
 =?us-ascii?Q?S//hG9Ii+ctlnaZrBsmoIziOfiIfsXm5FLY4G9Z5/yWZVlIG4U2YgeEp7af3?=
 =?us-ascii?Q?GJniT/8D9ECjzzANPVq/OMkKXKcvwA1yZkVwEIsnqfAwGaDd9mufI5UBvMyQ?=
 =?us-ascii?Q?0cXna4vfrtuIGEzV5X8PcfDCrjcw3Sqt7SyX0ykX2paSFSF1QPL4R6loZKUZ?=
 =?us-ascii?Q?FBlrs+waYa6zRrfy0APwnbyA+My/CZOpVdCw1nDqVN8Lh0S3beB9A5LE5Mgc?=
 =?us-ascii?Q?/fwhp3xJTFS+MeCqR7IztFvYJNKKTFDQ/gco3U9ItOf067E1wh3nH9lyYiHi?=
 =?us-ascii?Q?gRVmJvZifGzKazdPLX3tHLtSDy3tHXkWXb8MkTsBjje9WWiElhwUNwKGSQ3o?=
 =?us-ascii?Q?uU1Zr6catTPvc7CZfgI/hJ90k1xKlrDU/NqkzgZChx3wnNA007WM7UrjQyID?=
 =?us-ascii?Q?wTxSHGS1EfFEIZ/+eqNz88N1T6E3fb5sGp2I0sgkKXZDAd7OmAKTBepzfj8S?=
 =?us-ascii?Q?Dju33sxqly6v8xWIqaJH24KGqHYc1jNwS6Mw2lwgbuhjMAuAHJxFppgzD+lQ?=
 =?us-ascii?Q?NLQih6PGViAul6PaepkhOKhDL0ryujrNEbD0YFiHNSsI87FlUBmF8ounTfP3?=
 =?us-ascii?Q?nzfUPCMmJHVVFKdf/R1eJXWqzQNQDTxQkOU00cEyvj+ZcA03NJp5Xnpugauh?=
 =?us-ascii?Q?djGt9IdjMgUBeL8r/IYHXQfRFWfocCBau8DC1DZpQq9DsiUnA9v+Wg+JEtUr?=
 =?us-ascii?Q?mV5wfdswDGeV26L/UozVvzV5pKZjCdfWfL+Yrz9HXhOH2aEIYvcj/DDMNRMm?=
 =?us-ascii?Q?h9+lAg5IgbdXklk4MUTE5qCIFS5rihCByyh0lQl9o8nUOJfjAVuFegvxIBEm?=
 =?us-ascii?Q?VcrvAZO8TvQ2Wfoz48OVfLVCyV8Euwi2mJ1383iwmuehoEoTAIrQW8VJafyd?=
 =?us-ascii?Q?gbExgd/XMXseiWO6JWTrQtsUHEWc2UjSx1BeFEz/HZ2vyZqcoYEQAQpdGSVu?=
 =?us-ascii?Q?cyOnufFEXaR+uSlyiejwFMlQXxMD0NaKPkz7VvaVmbY50wPtuz0MwbsRqAai?=
 =?us-ascii?Q?FszoL/pxGjR/yXT410vxp4gLvidWH4f45b4AkXDtxCqJdaYwAw7LFJO7mEpL?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a84dbed-0ebc-40d8-2f05-08dd3535b127
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:48.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFAsfgAfrdjZMVrkNK5/XtgEvBCqVvSr8v2vtOBkdC364mg3zY/bgXYBq5n/wEmSuzS2+DCcDIQrtaNYm4gRwDpm/0KbAfAgRRR9C/TVH0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Proofpoint-ORIG-GUID: jaTRYkyTQbOkIGGZsz8UcKeChScvRuMH
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678762c1 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=RvqLo_sUiLEVdYAAtr4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jaTRYkyTQbOkIGGZsz8UcKeChScvRuMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114891

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-45619:
A vulnerability was found in OpenSC, OpenSC tools, PKCS#11 module, minidriver, and CTK.
An attacker could use a crafted USB Device or Smart Card, which would present the system
with a specially crafted response to APDUs. When buffers are partially filled with data,
initialized parts of the buffer can be incorrectly accessed.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-45619]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/f01bfbd19b9c8243a40f7f17d554fe0eb9e89d0d]
[https://github.com/OpenSC/OpenSC/commit/a1d8c01c1cabd115dda8c298941d1786fb4c5c2f]
[https://github.com/OpenSC/OpenSC/commit/673065630bf4aaf03c370fc791ef6a6239431214]
[https://github.com/OpenSC/OpenSC/commit/e20ca25204c9c5e36f53ae92ddf017cd17d07e31]
[https://github.com/OpenSC/OpenSC/commit/2b6cd52775b5448f6a993922a30c7a38d9626134]
[https://github.com/OpenSC/OpenSC/commit/dd554a2e1e31e6cb75c627c653652696d61e8de8]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-45619-0001.patch    | 34 +++++++
 .../opensc/files/CVE-2024-45619-0002.patch    | 91 +++++++++++++++++++
 .../opensc/files/CVE-2024-45619-0003.patch    | 83 +++++++++++++++++
 .../opensc/files/CVE-2024-45619-0004.patch    | 49 ++++++++++
 .../opensc/files/CVE-2024-45619-0005.patch    | 33 +++++++
 .../opensc/files/CVE-2024-45619-0006.patch    | 63 +++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  6 ++
 7 files changed, 359 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch
new file mode 100644
index 000000000..db2d5f4d8
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0001.patch
@@ -0,0 +1,34 @@
+From f01bfbd19b9c8243a40f7f17d554fe0eb9e89d0d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Tue, 16 Jul 2024 14:22:02 +0200
+Subject: [PATCH] pkcs15-tcos: Check number of read bytes for cert
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/15
+
+CVE: CVE-2024-45619
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/f01bfbd19b9c8243a40f7f17d554fe0eb9e89d0d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-tcos.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/libopensc/pkcs15-tcos.c b/src/libopensc/pkcs15-tcos.c
+index a84001e122..4d02a98ee1 100644
+--- a/src/libopensc/pkcs15-tcos.c
++++ b/src/libopensc/pkcs15-tcos.c
+@@ -62,7 +62,8 @@ static int insert_cert(
+ 			"Select(%s) failed\n", path);
+ 		return 1;
+ 	}
+-	if(sc_read_binary(card, 0, cert, sizeof(cert), 0)<0){
++	r = sc_read_binary(card, 0, cert, sizeof(cert), 0);
++	if (r <= 0){
+ 		sc_log(ctx, 
+ 			"ReadBinary(%s) failed\n", path);
+ 		return 2;
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch
new file mode 100644
index 000000000..217bb4919
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0002.patch
@@ -0,0 +1,91 @@
+From a1d8c01c1cabd115dda8c298941d1786fb4c5c2f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Wed, 17 Jul 2024 12:53:52 +0200
+Subject: [PATCH] pkcs15-tcos: Check certificate length before accessing
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_encode/8
+
+CVE: CVE-2024-45619
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/a1d8c01c1cabd115dda8c298941d1786fb4c5c2f]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-tcos.c | 35 +++++++++++++++++++++--------------
+ 1 file changed, 21 insertions(+), 14 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-tcos.c b/src/libopensc/pkcs15-tcos.c
+index 2bd275c4f4..ecaa66edf2 100644
+--- a/src/libopensc/pkcs15-tcos.c
++++ b/src/libopensc/pkcs15-tcos.c
+@@ -45,6 +45,7 @@ static int insert_cert(
+ 	struct sc_pkcs15_cert_info cert_info;
+ 	struct sc_pkcs15_object cert_obj;
+ 	unsigned char cert[20];
++	size_t cert_len = 0;
+ 	int r;
+ 
+ 	memset(&cert_info, 0, sizeof(cert_info));
+@@ -57,25 +58,31 @@ static int insert_cert(
+ 	strlcpy(cert_obj.label, label, sizeof(cert_obj.label));
+ 	cert_obj.flags = writable ? SC_PKCS15_CO_FLAG_MODIFIABLE : 0;
+ 
+-	if(sc_select_file(card, &cert_info.path, NULL)!=SC_SUCCESS){
+-		sc_log(ctx, 
+-			"Select(%s) failed\n", path);
++	if (sc_select_file(card, &cert_info.path, NULL) != SC_SUCCESS) {
++		sc_log(ctx, "Select(%s) failed", path);
+ 		return 1;
+ 	}
+ 	r = sc_read_binary(card, 0, cert, sizeof(cert), 0);
+-	if (r <= 0){
+-		sc_log(ctx, 
+-			"ReadBinary(%s) failed\n", path);
++	if (r <= 0) {
++		sc_log(ctx, "ReadBinary(%s) failed\n", path);
+ 		return 2;
+ 	}
+-	if(cert[0]!=0x30 || cert[1]!=0x82){
+-		sc_log(ctx, 
+-			"Invalid Cert: %02X:%02X:...\n", cert[0], cert[1]);
++	cert_len = r; /* actual number of read bytes */
++	if (cert_len < 7 || (size_t)(7 + cert[5]) > cert_len) {
++		sc_log(ctx, "Invalid certificate length");
++		return 3;
++	}
++	if (cert[0] != 0x30 || cert[1] != 0x82) {
++		sc_log(ctx, "Invalid Cert: %02X:%02X:...\n", cert[0], cert[1]);
+ 		return 3;
+ 	}
+ 
+ 	/* some certificates are prefixed by an OID */
+-	if(cert[4]==0x06 && cert[5]<10 && cert[6+cert[5]]==0x30 && cert[7+cert[5]]==0x82){
++	if (cert[4] == 0x06 && cert[5] < 10 && cert[6 + cert[5]] == 0x30 && cert[7 + cert[5]] == 0x82) {
++		if ((size_t)(9 + cert[5]) > cert_len) {
++			sc_log(ctx, "Invalid certificate length");
++			return 3;
++		}
+ 		cert_info.path.index=6+cert[5];
+ 		cert_info.path.count=(cert[8+cert[5]]<<8) + cert[9+cert[5]] + 4;
+ 	} else {
+@@ -83,12 +90,12 @@ static int insert_cert(
+ 		cert_info.path.count=(cert[2]<<8) + cert[3] + 4;
+ 	}
+ 
+-	r=sc_pkcs15emu_add_x509_cert(p15card, &cert_obj, &cert_info);
+-	if(r!=SC_SUCCESS){
+-		sc_log(ctx,  "sc_pkcs15emu_add_x509_cert(%s) failed\n", path);
++	r = sc_pkcs15emu_add_x509_cert(p15card, &cert_obj, &cert_info);
++	if (r != SC_SUCCESS) {
++		sc_log(ctx, "sc_pkcs15emu_add_x509_cert(%s) failed", path);
+ 		return 4;
+ 	}
+-	sc_log(ctx,  "%s: OK, Index=%d, Count=%d\n", path, cert_info.path.index, cert_info.path.count);
++	sc_log(ctx, "%s: OK, Index=%d, Count=%d", path, cert_info.path.index, cert_info.path.count);
+ 	return 0;
+ }
+
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch
new file mode 100644
index 000000000..9775bf8fb
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0003.patch
@@ -0,0 +1,83 @@
+From 673065630bf4aaf03c370fc791ef6a6239431214 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Wed, 17 Jul 2024 09:15:43 +0200
+Subject: [PATCH] pkcs15-gemsafeV1: Check length of buffer for object
+
+Number of actually read bytes may differ from
+the stated object length.
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_crypt/15
+
+CVE: CVE-2024-45619
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/673065630bf4aaf03c370fc791ef6a6239431214]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-gemsafeV1.c | 20 +++++++++++++++-----
+ 1 file changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-gemsafeV1.c b/src/libopensc/pkcs15-gemsafeV1.c
+index add4c3e68..46cc420bf 100644
+--- a/src/libopensc/pkcs15-gemsafeV1.c
++++ b/src/libopensc/pkcs15-gemsafeV1.c
+@@ -168,6 +168,7 @@ static int gemsafe_get_cert_len(sc_card_t *card)
+ 	struct sc_file *file;
+ 	size_t objlen, certlen;
+ 	unsigned int ind, i=0;
++	int read_len;
+ 
+ 	sc_format_path(GEMSAFE_PATH, &path);
+ 	r = sc_select_file(card, &path, &file);
+@@ -176,9 +177,11 @@ static int gemsafe_get_cert_len(sc_card_t *card)
+ 	sc_file_free(file);
+ 
+ 	/* Initial read */
+-	r = sc_read_binary(card, 0, ibuf, GEMSAFE_READ_QUANTUM, 0);
+-	if (r < 0)
++	read_len = sc_read_binary(card, 0, ibuf, GEMSAFE_READ_QUANTUM, 0);
++	if (read_len <= 2) {
++		sc_log(card->ctx, "Invalid size of object data: %d", read_len);
+ 		return SC_ERROR_INTERNAL;
++	}
+ 
+ 	/* Actual stored object size is encoded in first 2 bytes
+ 	 * (allocated EF space is much greater!)
+@@ -207,7 +210,7 @@ static int gemsafe_get_cert_len(sc_card_t *card)
+ 	 * the private key.
+ 	 */
+ 	ind = 2; /* skip length */
+-	while (ibuf[ind] == 0x01 && i < gemsafe_cert_max) {
++	while (ind + 1 < (size_t)read_len && ibuf[ind] == 0x01 && i < gemsafe_cert_max) {
+ 		if (ibuf[ind+1] == 0xFE) {
+ 			gemsafe_prkeys[i].ref = ibuf[ind+4];
+ 			sc_log(card->ctx, "Key container %d is allocated and uses key_ref %d",
+@@ -234,7 +237,7 @@ static int gemsafe_get_cert_len(sc_card_t *card)
+ 	/* Read entire file, then dissect in memory.
+ 	 * Gemalto ClassicClient seems to do it the same way.
+ 	 */
+-	iptr = ibuf + GEMSAFE_READ_QUANTUM;
++	iptr = ibuf + read_len;
+ 	while ((size_t)(iptr - ibuf) < objlen) {
+ 		r = sc_read_binary(card, iptr - ibuf, iptr,
+ 				   MIN(GEMSAFE_READ_QUANTUM, objlen - (iptr - ibuf)), 0);
+@@ -242,7 +245,14 @@ static int gemsafe_get_cert_len(sc_card_t *card)
+ 			sc_log(card->ctx, "Could not read cert object");
+ 			return SC_ERROR_INTERNAL;
+ 		}
+-		iptr += GEMSAFE_READ_QUANTUM;
++		if (r == 0)
++			break;
++		read_len += r;
++		iptr += r;
++	}
++	if ((size_t)read_len < objlen) {
++		sc_log(card->ctx, "Could not read cert object");
++		return SC_ERROR_INTERNAL;
+ 	}
+ 
+ 	/* Search buffer for certificates, they start with 0x3082. */
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch
new file mode 100644
index 000000000..68c8e609a
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0004.patch
@@ -0,0 +1,49 @@
+From e20ca25204c9c5e36f53ae92ddf017cd17d07e31 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 10:16:39 +0200
+Subject: [PATCH] pkcs15-setcos: Check length of generated key
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15init/26
+
+CVE: CVE-2024-45619
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/e20ca25204c9c5e36f53ae92ddf017cd17d07e31]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs15init/pkcs15-setcos.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+
+diff --git a/src/pkcs15init/pkcs15-setcos.c b/src/pkcs15init/pkcs15-setcos.c
+index bfee78cd6..57d5e83bf 100644
+--- a/src/pkcs15init/pkcs15-setcos.c
++++ b/src/pkcs15init/pkcs15-setcos.c
+@@ -498,6 +498,9 @@ setcos_generate_key(struct sc_profile *profile, struct sc_pkcs15_card *p15card,
+ 		r = sc_card_ctl(p15card->card, SC_CARDCTL_SETCOS_GETDATA, &data_obj);
+ 		LOG_TEST_RET(ctx, r, "Cannot get key modulus: 'SETCOS_GETDATA' failed");
+ 
++		if (data_obj.DataLen < 3 || data_obj.DataLen < pubkey->u.rsa.modulus.len)
++			LOG_TEST_RET(ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED, "Cannot get key modulus: wrong length of raw key");
++
+ 		keybits = ((raw_pubkey[0] * 256) + raw_pubkey[1]);  /* modulus bit length */
+ 		if (keybits != key_info->modulus_length)  {
+ 			sc_log(ctx, 
+@@ -505,10 +508,11 @@ setcos_generate_key(struct sc_profile *profile, struct sc_pkcs15_card *p15card,
+ 				 keybits, key_info->modulus_length);
+ 			LOG_TEST_RET(ctx, SC_ERROR_PKCS15INIT, "Failed to generate key");
+ 		}
+-		memcpy (pubkey->u.rsa.modulus.data, &raw_pubkey[2], pubkey->u.rsa.modulus.len);
++		memcpy(pubkey->u.rsa.modulus.data, &raw_pubkey[2], pubkey->u.rsa.modulus.len);
++	} else {
++		sc_file_free(file);
+ 	}
+ 
+-	sc_file_free(file);
+ 	return r;
+ }
+ 
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch
new file mode 100644
index 000000000..88564e299
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0005.patch
@@ -0,0 +1,33 @@
+From 2b6cd52775b5448f6a993922a30c7a38d9626134 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 11:38:25 +0200
+Subject: [PATCH] pkcs15-sc-hsm: Properly check length of file list
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15init/8
+
+CVE: CVE-2024-45619
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/2b6cd52775b5448f6a993922a30c7a38d9626134]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs15init/pkcs15-sc-hsm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pkcs15init/pkcs15-sc-hsm.c b/src/pkcs15init/pkcs15-sc-hsm.c
+index 71f96cfc56..db1a2b518f 100644
+--- a/src/pkcs15init/pkcs15-sc-hsm.c
++++ b/src/pkcs15init/pkcs15-sc-hsm.c
+@@ -140,7 +140,7 @@ static int sc_hsm_determine_free_id(struct sc_pkcs15_card *p15card, u8 range)
+ 	LOG_TEST_RET(card->ctx, filelistlength, "Could not enumerate file and key identifier");
+ 
+ 	for (j = 0; j < 256; j++) {
+-		for (i = 0; i < filelistlength; i += 2) {
++		for (i = 0; i + 1 < filelistlength; i += 2) {
+ 			if ((filelist[i] == range) && (filelist[i + 1] == j)) {
+ 				break;
+ 			}
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch
new file mode 100644
index 000000000..4e45cc757
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45619-0006.patch
@@ -0,0 +1,63 @@
+From dd554a2e1e31e6cb75c627c653652696d61e8de8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Thu, 18 Jul 2024 12:33:31 +0200
+Subject: [PATCH] card-coolkey: Check length of buffer before conversion
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_reader/3
+
+CVE: CVE-2024-45619
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/dd554a2e1e31e6cb75c627c653652696d61e8de8]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-coolkey.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/libopensc/card-coolkey.c b/src/libopensc/card-coolkey.c
+index ff3ffd9a7..e0a5ae774 100644
+--- a/src/libopensc/card-coolkey.c
++++ b/src/libopensc/card-coolkey.c
+@@ -1684,6 +1684,7 @@ static int coolkey_rsa_op(sc_card_t *card, const u8 * data, size_t datalen,
+ 	u8 key_number;
+ 	size_t params_len;
+ 	u8 buf[MAX_COMPUTE_BUF + 2];
++	size_t buf_len;
+ 	u8 *buf_out;
+ 
+ 	SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
+@@ -1724,8 +1725,6 @@ static int coolkey_rsa_op(sc_card_t *card, const u8 * data, size_t datalen,
+ 		ushort2bebytes(params.init.buf_len, 0);
+ 	} else {
+ 		/* The data fits in APDU. Copy it to the params object */
+-		size_t buf_len;
+-
+ 		params.init.location = COOLKEY_CRYPT_LOCATION_APDU;
+ 
+ 		params_len = sizeof(params.init) + datalen;
+@@ -1745,6 +1744,7 @@ static int coolkey_rsa_op(sc_card_t *card, const u8 * data, size_t datalen,
+ 	if (r < 0) {
+ 		goto done;
+ 	}
++	buf_len = crypt_out_len_p;
+ 
+ 	if (datalen > MAX_COMPUTE_BUF) {
+ 		u8 len_buf[2];
+@@ -1763,7 +1763,12 @@ static int coolkey_rsa_op(sc_card_t *card, const u8 * data, size_t datalen,
+ 					priv->nonce, sizeof(priv->nonce));
+ 
+ 	} else {
+-		size_t out_length = bebytes2ushort(buf);
++		size_t out_length;
++		if (buf_len < 2) {
++			r = SC_ERROR_WRONG_LENGTH;
++			goto done;
++		}
++		out_length = bebytes2ushort(buf);
+ 		if (out_length > sizeof buf - 2) {
+ 			r = SC_ERROR_WRONG_LENGTH;
+ 			goto done;
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 641d6a807..5e840555b 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -46,6 +46,12 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-45617-0003.patch \
            file://CVE-2024-45618-0001.patch \
            file://CVE-2024-45618-0002.patch \
+           file://CVE-2024-45619-0001.patch \
+           file://CVE-2024-45619-0002.patch \
+           file://CVE-2024-45619-0003.patch \
+           file://CVE-2024-45619-0004.patch \
+           file://CVE-2024-45619-0005.patch \
+           file://CVE-2024-45619-0006.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


