Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9723E99062
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:26:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152252.1775813219540583037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qe+o5qvH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85604dd2b6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5bTV22768169
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 02:26:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=wO4D9s1gwrlheopX6VCn
	tl/xRu53yZBmRN2LXr6mTDI=; b=Qe+o5qvHAA0wOm0ZaHXZ7slJrwZ5Z0zd0y8M
	Yl1jiT3EbE5nYk5FGI/04vuuMF8ac680nqA7IqPpmJwCRmZSEL6mg+s4cuFrJbtu
	sYSsJ6SdTg8AQ2iZ7jefySpSLqiumqI98Z4dDX1lwQs2S5whqEkIyGEHw6h+4GMG
	KdKK+GBmtHdZihR3atwK4Eim0pdTk/hXXCkL6PBaPrXrqYNaVW0t33G8jgvjS3oZ
	Hk1Upp1ZZPHLB9xqCVm4N1ovnx5aBUocP9wkxnK00ORKO59B2XHXXbS8Bk8XfteM
	N8FXj0FVhzrliZ+shT8WMkPSUAMk+QMDs86mGavqtFGmojjIrA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010034.outbound.protection.outlook.com [40.93.198.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryn8cj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 02:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RG0Xq4j95sSSnILn9KytEy0xgkZHLRZuh5s2mhj7+4LpoDDKDRGhXgWIAso1ZpPencLt58lXS28l5Mui/kOv18gMTqo+ANBwc0g8sG7b4AJUoaGX8Xq3dQ+a8LK45I29351r1s8Zs6OMa6jI2a7/nmrimTaKoZNmcq3ZDq6v5OPaXHHj/TIgB9CSUVjEB6UyscoEMeqyshpyI4JgaPq+nF2U0hpIZtTRZDaytuGISRZI6M3JGVnO7UfcFAFy1BS1DXyMO6MqjOLd8UIUUZPyrPlSB4OvIfE/+mSqLc8/R3jxeEawang5FiDqWiDpu4O/1rmZJ3uVDKtyhYd8WZTnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO4D9s1gwrlheopX6VCntl/xRu53yZBmRN2LXr6mTDI=;
 b=kxiZSMadp1D2cOWG3Xuji/qmtPyb4tI+c2x+svvKND+ec6UskwhhdnU0LfkSlRqMaY7g2EjmhtCgGUdvN0wQ4CUZYGHwnArAWssPHn9WhDPxO6Qf0332qFqQ6lVQipw3fKGu2oL9mmbwTnncf3K+P4AW6pNByYK7m8/lIi/0jyCptMNB9/aV0NtGc7MuCc4TpNBbJE/huspwgZRrsAr8u1K7qtrbGn79hfeSbMPQCX4W2lVJsS6KpRhEW2XRkuEV/7jjqsNurQMYzep32KBYqXNbbUORjaaQQHrWvwLryM5gwUL3iEA31ToXq6IW49+S16jD7WlGL3LVjAhXJ6Z9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 09:26:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 09:26:55 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] dlt-daemon: fix wrong CONFIGURATION_FILES_DIR
Date: Fri, 10 Apr 2026 17:26:32 +0800
Message-Id: <20260410092633.3295675-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e53ffc-b754-4a02-c213-08de96e34e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	J/MMNcTWgcJIigYFVpy76ufGjWxp6qn6CZIgObrO9Sd337sPdWnsJaR7AC0BjYkw/o5cPxwpau+jrtBQ5uT12jFcSQuPZ69sXuel0acD9QqDXHpFwoHUJmUGDKSQaO0JEkSiEmwbjCaypguz1pUMWJ93WGmLjAjyU5gqv0CH5o5UTlrXGdZ+I+usHMiPgszswOVjZDvpsTcn4417RuCinnHm9Z20Dt6KlehAqzpJ3BvsgNjPSnX67nspdBj5kFvDxh38a5l0b3k+5h8xKtoYpsk5lyPTFlLIfN81AovEkMnjrJ7AFBP+0Bj2lHAzCzXrrV29DeFsnMfDbB6e/R0tu4Zc/WLynxF0/m6UdArQegJVNpwaMJQz/dW7eC7i+hcSpmSwn7ufeVXKbxwR8FfEjRIWi3EQ6P5GWTBM68YmZYPVh/n25KI3zrDNQ2AU6LIp5kieYeaOmCIJklGcHsJqE3JxLUC5hH76CY2cbLxmn9dAaKMHCN41tjakfijdDNGEidLELFWJ32hR7V9vscztYa5fr76noMRRFF1wXGKpsI5S2eeNzjAIBEkwH5dxIwTKEE5MLtBLZnSDUQ5X4CzrhUcXYbR0I4XHpf0n9rPZsNDmKWMBlSqNj0IF7csBn+nM7HkN+j1Unbs/xua4FI3fS2oDSqq/vjD6zw27W6Ft2Q+aAUNVx7nR8YpbHqF57/QfNV7x8RrvKI8EOTfa9pwUP1DrXAb0T/CrIDnMZZESxCI4qwiL2mhhRGn17TzWLHQt0mT255q1xATiPO5TbUw7KGI92xaytXBt54u4J4QFUNOhAbpqTc4wB9IohUgtCLz0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rp1M9m65zcm/PgjWmaPgUeicvDhtAxccOxD3kkiqx/hmzKOY2iR7QXFOO3Ku?=
 =?us-ascii?Q?bGGYBsDJrhVtkdGIBUXTVjChvkRV64Y1Ct4/RtxoQse3Pg4RA26W8JpiZzBn?=
 =?us-ascii?Q?uynXDlkcvb59FSi4AUVoJ9Yd37l3DBnJeFrTsKWQOwnoZiaBS+iQ7obAyFr1?=
 =?us-ascii?Q?VW3qkchV4HtcFC18F2MaMCCs1NNJTsj+ObG6CDehaOkeFWgCzfstsQlwQ/PW?=
 =?us-ascii?Q?JbEnOC0lz/bb6YRdpiKiIR5w+W1JmddjzTJfF+qKTtw8jTjJTVsacWWq6O8Q?=
 =?us-ascii?Q?2H+5J27YIh/gxtY/MQgPUBj2eg/W0wV0TRRr+4rLiozTURSmUyFw8URDtgr0?=
 =?us-ascii?Q?8DRUuHPTHmg89GzmzyXwpb7ofktj69Zfoc+ObD9VLS5MgvoW1SMSDmB2crWM?=
 =?us-ascii?Q?io6CMfSmE/LkdCfeRONqSHh3/u2iraObZp9H5CG5iDRDLPEthdAd+atTOWYK?=
 =?us-ascii?Q?JO3p5cUf2ZsfrBrSvA20j5yRN952hgdO6vyMAw/wYTipvs74oLCvvF+iLDV7?=
 =?us-ascii?Q?K/7KSSRBjk604etxXNb7AFDXtHkGeobqJwyar2bIuVmJnJaqlm9CunFYhIJ7?=
 =?us-ascii?Q?P7vB9PNChIJ7w5W28NtkvoJ/P8PI/1QMAMR9vCE4c5ChMG1grABrpk6vxvUS?=
 =?us-ascii?Q?swrSt9YzFpsHIkEpbx6KKo0fi+WAw2gVWV2zfor++oILsoECuRQ4gNd00nLv?=
 =?us-ascii?Q?IGXJB5TEheuhE4g+d10pq8D3/94H3mn47LWnb8OPuVgjdgXIstA0JEbyfsG2?=
 =?us-ascii?Q?z6ithdAtRd9laac1ubg/EF43DO49wn67JoEeRfj2UrUZNzLS3yfRJvnRxWNA?=
 =?us-ascii?Q?3X2iBMhdDnM2VrXVMavynBi3LXkeLmGu4eOW+GDKrwGBkVr64R/T96Vm+6Pp?=
 =?us-ascii?Q?q7RaU1+2YNtD2NPtge2+CJcJ7vWRyAvQJbuBAJjSzwV6uvFUhsY5uCi5W/Ot?=
 =?us-ascii?Q?+Ufp1ZSO3wq/A04gKZRZ4K/VVG7BXXqPLXZxMWFb36UxPXIh/039iaglrMTx?=
 =?us-ascii?Q?UqvUVeKZIl6U3d7nUCjHqshbpZGw1OHoSeF43A2o3TWAYBMS58aF7uvddmLr?=
 =?us-ascii?Q?bo2D15yfbTHjqIrfaZhtpaOCY1Uknf6w6P6dUVQyWYkXRwYS8drZuzoNiINp?=
 =?us-ascii?Q?ctmMr2EEUWVcrqjzcqkx0YcnRGrmsDxrDIlt1e6vlLbqwdUcpfOsfb8rElHQ?=
 =?us-ascii?Q?qG7mK1L0gdcnXeLPw9m3p+XkxFCbuzy+Qi1SbfesExnnvEKfojI3HX72No7s?=
 =?us-ascii?Q?xE43bGho4kr4Sl1vwxiAJCJRvVO9R8Sh8e6tUD3fFAuS9/WjvHMXVdGokmky?=
 =?us-ascii?Q?s9Fy+HOWDoRawBsFu7qmc7jqzNNZVzM7BapPino2kCVHfuPJD5eqv6kBPfQO?=
 =?us-ascii?Q?1yHapczGCzqvuNWJmKt0aYQ9eY5wfDGjxHWvioS4yQhwCHwM5ag6hH0F7O0Z?=
 =?us-ascii?Q?SWxuKe21RDXv1ueSjrpOhNDpwMxw5uvzergElQ7DY5cFj1ds+CqnGnFGtsgU?=
 =?us-ascii?Q?KvvEl7Bs+ASwJiGn64i4Ye5Au4l65u3MMSbFxBcxLzdQ/xpskzVrXPHyImvL?=
 =?us-ascii?Q?aWm1FRXSTtUvhaiULyHnhcZxzqHV1xs4NPJzNIqYPFDpyF8g3FDRjNdym/XL?=
 =?us-ascii?Q?colpbPLKbymBRg3vs1Z49tUhEiVU7oSrgjGIsRIJXqEtfhwTPzwF4iK9yMVX?=
 =?us-ascii?Q?zmWOz9AN8bCNT7KUecKNEkw/6xbhw8QJcCnODUutRorfhoD80g0tu3a7M249?=
 =?us-ascii?Q?QMolOzQ8EqZLuPM+8PJhJdT7/VvblYk=3D?=
X-Exchange-RoutingPolicyChecked: 
	a45rcTSW93Au3daW8C7LKwN9muZZ54TABFM9aKz4iooNkSkqaTq9CEZRtfG9xkSgIL3rbLSefLnPAgKzfo6xOdd+Cs3EtEUvwLPiewiy50QyW/OlJzy4pg8MqTWE4HebWWfEomBnAhoB5guf7oGbaIfagJmxlM29zysKUhJ16XVz3yDldSS3fJOj3wgJpYLtZgacivzLQxGk63v2YC0WV3lRPVjJk+W0CmnqPpXIXkrh1JGIOsoB2B0VQcisXDqMOsr37FtisQHgtkiq0uGUWvbQ8nnIPAd/dl58KQl+3iPr9wddr2DnSfj3oHz2mnxU4emyNlKcAk7Dix2maY0BEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e53ffc-b754-4a02-c213-08de96e34e93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:26:55.5132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucUWCPnZeDF9rqwbZK/PtBbzjmkZLYQt0GkuZ01rLAqxVFxIJuZhPvWPv+j3LRvLVdFMIMuIrZvhn9BJ2MNmLdHNqTNXrNEUmHTDCGl8Faw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-Proofpoint-ORIG-GUID: Xe-vuFxATHTevLgngHxFFqK1hw2VHbLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4NiBTYWx0ZWRfX5dif7s+UvJWI
 6cECGOEfR1spDHr4mL7IhCRIH24knvVxCg6WXKDmk6WWYXcRz36WGiA7UxBjfu2Tx30bUzj/5Ip
 gmyRypCRj4Pt7u4EFAFax0jP2PDX2fqMg2MShlr8KFfmKHzpe7+lKNMbskf7KxIEVlZPB1CV4Mb
 BscpCJGedNhnzYaB6ttsO+wXdJcqc8C6bDkitNHJZXKPVZdqBdfdkGvSoNtImXP3aqI6JYp0ptO
 2q7Grek9lR9p4+rNwr3b+kLGgT3Ip5dc2moXxjXIdrzOn6PB8hMGr1pChaFP75OgbtOz9bHeUet
 X9txr9Ar1oQVWHdKm0bbKGOnv1+1e4+S5g3MPUM2TnVd7ZXZSTQQT1ZLnKoI+gJLl/gjD//Xxwx
 fWEooFzWt2mGyRmj5frxHocCM/lYwqePSZSY7U7bfwmK/uI9ZRf0CyMHTH8ivxJfvLTpQrQCGn6
 AUPny+/8mCeTNknIr6g==
X-Proofpoint-GUID: Xe-vuFxATHTevLgngHxFFqK1hw2VHbLe
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d8c263 cx=c_pps
 a=sh6lJpoQSmOZbBTv2jax/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=58YEQxOX9DnwO0eVefcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 09:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126238

The not aligned value of CONFIGURATION_FILES_DIR makes the configuration
file install path is different with the default configuration file path
from where the application to read, then make the service dlt/dlt-system
not works well.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...make-CONFIGURATION_FILES_DIR-aligned.patch | 42 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_3.0.0.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch
new file mode 100644
index 0000000000..2d51253e69
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch
@@ -0,0 +1,42 @@
+From bad5d689a69dca3d1dc3e7653946f1205661afbf Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 10 Apr 2026 13:25:39 +0800
+Subject: [PATCH 1/2] CMakeLists.txt: make CONFIGURATION_FILES_DIR aligned
+
+Commit [723e90e dlt: Adaptation for QNX build system with SDP 7.x
+(#609)], refer [1], make CONFIGURATION_FILES_DIR not aligned.  the CMake
+variable CONFIGURATION_FILES_DIR set to CMAKE_INSTALL_SYSCONFDIR, but
+the tell the compiler to define macro CONFIGURATION_FILES_DIR as
+${CMAKE_INSTALL_PREFIX}/${CONFIGURATION_FILES_DIR}.
+
+At least for linux, this will cause failure of the systemd service. Eg:
+if CMAKE_INSTALL_PREFIX is /usr, then the configuration file is
+installed under ${CONFIGURATION_FILES_DIR}, usually is /etc. But the
+application like dlt-daemon/dlt-system will find the default
+configuration file under /usr/etc. This makes service start failed.
+
+[1] https://github.com/COVESA/dlt-daemon/commit/723e90e77db91130375238a592b9a292302a32bb
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/issues/848]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bb9250f..821730a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -289,7 +289,7 @@ endif()
+ 
+ set(CONFIGURATION_FILES_DIR ${CMAKE_INSTALL_SYSCONFDIR})
+ 
+-add_definitions(-DCONFIGURATION_FILES_DIR="${CMAKE_INSTALL_PREFIX}/${CONFIGURATION_FILES_DIR}")
++add_definitions(-DCONFIGURATION_FILES_DIR="${CONFIGURATION_FILES_DIR}")
+ 
+ add_subdirectory(cmake)
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 431e9f3067..609566a1b3 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://0001-Fix-build-failures.patch \
            file://0001-fix-build-failure-when-systemd-is-enabled.patch \
            file://0001-Fix-build-failure-with-glibc-2.43.patch \
+           file://0001-CMakeLists.txt-make-CONFIGURATION_FILES_DIR-aligned.patch \
            "
 SRCREV = "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
 
-- 
2.34.1


