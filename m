Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC77EB3648
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 02:22:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9397.1772504552370490135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 18:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Otu4akp7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7522b53711=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6231P2t43510497
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Mar 2026 18:22:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DcPHKNjH5DO39CUk4SLY
	OEH866M4OH3LwPW++h/Kvsk=; b=Otu4akp7dLkD7HPFDC62GpoEEhwK2eaSp4xy
	Oi0kEsTiMuG5/o3vHeUe8g8oqaWp1mg2YZyic7XBSkfmNuQszILGwdbIPPAvqV4k
	4DSJ94v4gcyfqQQ8jQ1AaZyPb+8vo4dvqoWA19Kw+o4ph4J13VWHVgUzMBSDVsr4
	6sKcN1CV0nM7hwwyV1PciVwQ0pZKM04dfiHXem0sD6cvQfmGirDdhfseBtDkeh2E
	Pp4MXUVq59tVl7hzVc6FgOlU6z/z/X2vAjn9hgyxUpr4g8M5sXw/U43UI8KUqe1S
	mcAARj3Fl7Gnx3ODk3HPDOV7EvZG5p1UULrTJzlXEzGcPBSmCw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011042.outbound.protection.outlook.com [52.101.62.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh42t5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 18:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDanVbAL8ZU7Abt3zX0Ihq9I8YCxqzC7r67nz9svyMBgFJO9biP28ZRb468Y5zJkk463IU9JPHEM8G8+4JVTe55021kP8VkPecsR0sH9zku+7YKvc8w8xbu7aZfRMFMFnZnk9hWFS7tcx7ScfMwCWY20QW0os814Wj01XFO87aH8A7AB+aeP5Y7lt1krEwYPvKpkfoozy860F5mv2q4LVL3psjh1BK2UdThml8B2vCOXQivrUr1DsQidwfTqeCSJLcz95zLUVjzdfjwKHlBBWF/yNezWxkYTb55EyTx/X9uADriT84hrkrhVxnrMxdUJXfVUbgBDpRTeoEN9Y3xV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcPHKNjH5DO39CUk4SLYOEH866M4OH3LwPW++h/Kvsk=;
 b=E1w2RQ7ED9l5bbcSSAkxPUb2a3euxuRBaqAy/gaG1QuhCCu+s83Ir2A6ZJcV7vHRUJmaFqgbisbOIjrE6frqXPm86GIO3HJyaQlFl7x6b08nhl1OgM3NB40F3CvUum0aPblKw2Vc4jieQnOZoyUyKLyOD2gRhqRv40DoqykRmommh1+wpoM2ypYKd1JwRSZJLXsr7HfXbgNyeFQShKZFEX268/Yk3c1NSRswy1kkRqbAzLB8fMN0GANRUUwuZJ8OOlQ8HftYM22FIt2Yyj67hW/t/H8X1Er61Xn+K/DatYD5D36jlxXaxmXEiBscls0sES0EZ/Y+b2yIatkcuM8/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 02:22:28 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:22:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] librelp: update PACKAGECONFIG setting related to valgrind
Date: Mon,  2 Mar 2026 18:22:08 -0800
Message-ID: <20260303022208.1399940-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::15) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 187394a8-40c3-4709-20d4-08de78cbb741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Hu16sALVomdHo8BqAho83q6kcB4Z2/HqxxNjCbnb85hAnM3UUC/Hbj9D4wrEWptr7YdeI/wIzzrpmOaOWRPLGftpDyD9XCGblTjUzzPWa8nsIeCm91B/0+IIPMW4FkQM3oyP2x/I46jRPcH3Ep6LBnKGGvBoll1qR3SKXhc5z4KYaFqnn3Q+unh1dD6GskR4kL9aR6WnstF5ZqgFKVmlSsyfMUm8ZNwxCyNPIQQLS5CcBjTw9SzBzT44j6puWFuRDF0AZzdKcQUGmlRtCo6X4O7eG005lCywhueOISWhypfmNy/ooEdBQ+mCN/D8vUlEU1cpQOd4E05dB36/8tHhrhskOY7iuaM8PUQCHrn35bsh07E+W3hgQpoW9xAMa0LPUb9aLZzS3EOQg1IEmtXV7X+JC+AYJlURMyn3JVeFxI/JCOJxDaiHkPiYR4/hez1ccnggzlx5riW00WNTC9Q5cc5MiDYp6BFY5IcpxYI0q/pLaaSeTjWWw/mPfRnSODf6deSw+tax7Wx+kJhsBbTSFXpQ7sC1IrK9aizfu23cgp4Jp+l/7ON3+BrKTt+CQix2BHE5TKE79GwtIjb/lyJuV+2xUXFytJlFhUwHEa9El1BoKRE/lH7pXSY0zig9lVAhzCruTFHLFghvDuXdunwLLo64tftNPdCLniP33QGDyljd/pTG2PBNwNf79DpbaB1gs0SLrtAF73HVou/RDb7stAkgX5YCvnWh31jcsVsDKwQzU5t1qW5CqP8xSToRJLmaMjG5cW9UNU8wtFTZdHKCAAC6dBT7TCH9GK/5wy7ZZJk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SsreSJ1pKAkVD5B4/Sfm5huABI7C+FdU4yNXAux93WkAImKhP/GHsRq9XlQz?=
 =?us-ascii?Q?6UDrhP6LoWLbDUMO37UWDV9fU41MCkHy6qqXksCtOts+BMrPkqgjsgXK7urJ?=
 =?us-ascii?Q?3fKYnKZKjFTU0ZVyAdEzYZ6NG7tNksKK8MKEKjm20Z/iERj87J+bAV1S8EBq?=
 =?us-ascii?Q?gEhKchikNelr5OcLNsTLI6n3L3OlQ+wjS71//LdignP4iMpSjK+skcoMAlfF?=
 =?us-ascii?Q?c7apmiRn4TrPqiwCSenRiN9a9wIYWRfP3rXaTKdb/GlQ5kqr7ZmNUiLHbnlg?=
 =?us-ascii?Q?e5Ivw7LKHecDwU3mkSiTVJ+XSendPmwTA1NCU7/fMRvIcNxnj020e0MgetjJ?=
 =?us-ascii?Q?AzKa3DxkpmJ4dDOs6EMSC31iUhsQREKpGpoPlmitV8ClsxTtVZ5bMW5FEdfX?=
 =?us-ascii?Q?i3wINNFWvNoKyeMC370rjJ0weUn26QeG/jVBy5PbwfTdSyEoWmYBYepOBa85?=
 =?us-ascii?Q?JbyE4kwakGhNdGz6SX3PofMMM9p3g3M0TxV/p+TZExV2aPJBJGikCHayk1KQ?=
 =?us-ascii?Q?mjGY0z6hUOKO9vOvyJO7sNJfsWvzSqxjbleHGuy3PwMKLutRnpnrH/fnutgD?=
 =?us-ascii?Q?ls612z+Ab8FFiaG0zRXUOKmdnmALkv/BE1tGBzifZ+iLptBfSVZPLqjWLng0?=
 =?us-ascii?Q?QuAsWYDSChQRLXqMLjAgVDzG7dbEHAqrPmz6fcIXbnLKZsxE+R/VvF2Rpw0T?=
 =?us-ascii?Q?GcOnd6YPue+sMcaO0DpZia7wd+eycaAxJrt/g4KuTVEXqAGFeWAzZyIg2oJS?=
 =?us-ascii?Q?YdLiXgSbm8cBrFgiKXCt5+vXK714jCa2Muogqg3FIX/gtId3pcIw3jdKri4B?=
 =?us-ascii?Q?jCpZA0WiKdZUZU+EZDbas1VQOWxR2yZ0FZYa5+47ToXbKorx+xEbcVug/KlP?=
 =?us-ascii?Q?elx/xrVSgWcVM9xYsoMxF1L+wh2vn8aaLwxX+HeOG3c4nhVbJ6PJuOBC0i1J?=
 =?us-ascii?Q?Di0GKLjcrnXsIy+rnC2TwMUX5pbl3CY9jLNbl2reaH7Xdo7/W1vFHF/o7CAo?=
 =?us-ascii?Q?iaIPNyjpd+j4AlvCdjdaMwW1ja0UBx/Vf/jpcFhGJN6q4gUoRSvlKCPstgwV?=
 =?us-ascii?Q?9nE9Gnm6Jx4XpH9EXKxMf+wzWc8kAztbxV/k5litNWLSOZydgvb1/906TKQv?=
 =?us-ascii?Q?3jfNh4mWtD+W1nHbjCuJV9A95Nn44j2c1NJtTW1ao0rXxFeP77KM2hCooFDN?=
 =?us-ascii?Q?n+13xK3LYupa0eE3bTfK2ERS7giiPtmZd24dO2lE6uJ5uNvlS0pBQT1+85ju?=
 =?us-ascii?Q?1Yg1JKo/aAzx97vmwitut2ckInrNppbKwLqdmkdU6eN6mwWcFofX1Z2yJEDu?=
 =?us-ascii?Q?K5J2w8RbjHTxAObh8tt66cwt3/nnJoGVMBlbg85fEFtwGZVQTA09DRXkhG6P?=
 =?us-ascii?Q?n/GzimkD8miKtS1B4eNwOuWKMuVUjcGbKsY6XXJkZghx85S1k/O9yaWt0wt/?=
 =?us-ascii?Q?dEu2oP3F/hYVanc6lI+Eh9ZXMoYx9PqIXX2iqmJ43/sfp67AwxO1gohYUroH?=
 =?us-ascii?Q?KhIM2sAwD2j3cibZb6JLO61ubG2nXfqdH7pX0FJ4V9NQ5zILnJicfqvXt3mn?=
 =?us-ascii?Q?x5yfEgEO+V4xW9K0+mCg7UL1X5E5mT6+vmTUrUVDU6YYJZ0t3CuzuffpiYkx?=
 =?us-ascii?Q?ujimpJod7EELeZpWrWdvFDVHve7EGcW0hoLOtGScSuRH3vMrYF9jpN9WAhks?=
 =?us-ascii?Q?ltlqJVrjUPq/j8za7ULcdARYHTicdog6PchShghn62OP26tHSXRSMZAWetJO?=
 =?us-ascii?Q?LXFtAxk7iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187394a8-40c3-4709-20d4-08de78cbb741
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:22:28.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siM9f2J3Eov+JcHdUNu/Us+ESoUjgL0SDcrvQADfx+YPds2p9knTBXn0CasyrsmmUaKEB48ZCfNiO9QJf0fomA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
X-Proofpoint-ORIG-GUID: s9gAG2mCdxAz9eh6DXDRLJZ2AKquyzwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAxMSBTYWx0ZWRfX3lYEoyXVQfLQ
 XCWrhHuoAEyXR9MYRKeWU0udme3byMmVlJNZceUlGVIi3QtYVZfTbUd6KHCNDIFMj0YoJEgqTnA
 hXPcdjwe8DkVoMfqPirPQBoDc4SZEra/dhGmOJx20qf8dFgHVc/ot8GlejrOrloDGK8YGAq2RZt
 fBD95JoUgO9Cn6Ijqy4KQXX5dYDZ4bwDwnv6UbpRdmT4SVcjBzwM2zTY0AIDU7WDgtaVyl2vmN3
 ZBlksmJSVtgHeKMCP+dddQgXZ1aMwGo42UIFTpgG577r7fYz4oVhkzTIjlvkGswbgHbP7E0K/vv
 rOAB7c3eITJmKlU/nCijf3jOAT0aen4Yd0cdn3NZpS37qdiI59GZ43NnzlOoaZY+XopaoHqUjJU
 7NygUaMJDV+TEzH1pyfkw2xak9vUVdwWyHkKqWcnWjhsYqc/DtZWo+UI+24zRf97VtToL4buDog
 lvGoZ1JdNtuJEb4M4rw==
X-Proofpoint-GUID: s9gAG2mCdxAz9eh6DXDRLJZ2AKquyzwM
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a645e7 cx=c_pps
 a=Sa5LwqyZh1jbhgnehO2qiQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=06zrz42mlFf1_MCMxTQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 02:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124820

From: Chen Qi <Qi.Chen@windriver.com>

The riscv64 is not in COMPATIBLE_HOST of valgrind.
The armv4/armv5/armv6 are not in COMPATIBLE_HOST of valgrind.
Update the settings accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
index 6bad112e5a..260e4171a7 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
@@ -17,9 +17,12 @@ CVE_PRODUCT = "rsyslog:librelp"
 inherit autotools pkgconfig ptest
 
 PACKAGECONFIG ?= "tls-openssl valgrind"
-# Valgrind is not available for RISCV yet
-PACKAGECONFIG:remove:riscv64 = "valgrind"
+# Valgrind is not available for RISCV32 yet
 PACKAGECONFIG:remove:riscv32 = "valgrind"
+# armv4/armv5/armv6 is not in COMPATIBLE_HOST of valgrind
+PACKAGECONFIG:remove:armv4 = "valgrind"
+PACKAGECONFIG:remove:armv5 = "valgrind"
+PACKAGECONFIG:remove:armv6 = "valgrind"
 
 PACKAGECONFIG[tls] = "--enable-tls,--disable-tls,gnutls nettle"
 PACKAGECONFIG[tls-openssl] = "--enable-tls-openssl,--disable-tls-openssl,openssl"
-- 
2.49.0


