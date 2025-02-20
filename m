Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8E7C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 12:38:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42785.1740027407615616730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Feb 2025 20:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4146ad3f5a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JMGe7B017087
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 04:56:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00khx66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 04:56:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHGXuimCxqoCkUfWRs7OhV8OZJqiM1yasl5JSO+uwABCtAbWFoELYqdIDfyyEJPLnfjIrkxooYUExtrnEyEHEvH/aSzlK0ZG0eoVnvkC6C0+yjbTqjOYyPZ7pXj3pvAG0vRUwIOcLd+WkuDrb90ORs0nrl+Kgw1fUjVIBtlZJ6I80RnTAzHoOuH/+fdke83lVS4J6UYsvfyVYXSBj6zTm+NpECGpdURhUacpxhfnz6WRZjKSH/JGCzRXIJ189pLif52lgqOy8hwGiZ+xhgfi+yHac8xqRup+WZgvrEHoXG1it+TRQJCVKpG+lB7gRevEUOaeTLp+ZFve8XQWP/OZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbIUmtX7l3odW6tDQpdKDu5sEFbJgZnhDxiTrFbo3ik=;
 b=jpoVE4ifpr0QUIk4SbgLYcLvrfee7XPo9ERAV0ViybO7yCvvGLbT9UkCyMmqaZ3NJFr7leTMFsup3q/S6PMkNygbBTQDQ2qJDRE6hEZEl80jsWqdHVWEP6hKzJhcnpnnBhfQhbaf7ibYPDClh/GZ5omLgy01xnvoSzYJO3/B+XNT5HwFWMCKnrzrkq88PzNlJ1tDuntEiMpzy67w9nQUFWthiDqcvy+N8NUqGiaNpZWnUg6Vvpccg0ma3y0iy4yDMFSzosyAKLhLkUjAOM4DQ71gOgm7kW8+lyCJAOa0QSqd7xNlcLfnlZIT2VEX01VhaWopoYH7oe19D/tOhubNew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 04:56:38 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 04:56:38 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][meta-networking][kirkstone][PATCH] freediameter: fix do_fetch warning
Date: Thu, 20 Feb 2025 12:56:23 +0800
Message-Id: <20250220045623.1129073-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CO1PR11MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: bb704e12-a447-43f2-fbe8-08dd516af55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UYOWcM+6ASEDnPAR/3gwmWE2VCORDtHGgvfxx8zefIlmWTpLxJV+olurl2Xh?=
 =?us-ascii?Q?2QexCZP0NyMy/gCBlaBoZza+/6gGzG01ybKGTF54FYtuXdtpycWaSZ/UcOVK?=
 =?us-ascii?Q?EyEIHe00an7sJMza02Xw0RBLuvlzniBINvXE2vBnjqFg2QScbA5Z8RUxQ920?=
 =?us-ascii?Q?p+jitfSevHFXgS6FUNY6hbz8ICJm7EEHd0STS/CpnmUlTP6m17Z7tHVtGSVX?=
 =?us-ascii?Q?g7NsGVgcy+U7Jv3aaAXl/h5eZk5Q3AOy4t9hU8cd97kF6OdbdShu3ENvRwZj?=
 =?us-ascii?Q?ssAUw6zB+Sz4W3PmX9uJfrfyfO7+kB2NixGX7rsJ2mQM1JWQ+brn8A1koe5P?=
 =?us-ascii?Q?tHJGtO3lIWA7WLAAh5hliZG/KJ1/PIene+3QFvIhCm2KXlTfpZiL6prC2YTk?=
 =?us-ascii?Q?zHejpqe/DXaBd8xCeaNh4Hz1UZnRp7bunyfl7sj2tB7RjO4Yre0DKaDl9PMC?=
 =?us-ascii?Q?b/AvkXDA6XbO8xtpXI3/8yXrTcXPJD0soVZS4HYHn77i+Yqcpbma7iSj/ncI?=
 =?us-ascii?Q?CVW/h7+uQg8GJwZT6ZmfiQGLjsSazhhyk5GyTGQp53IkgqAiLsxrDSSt9DWD?=
 =?us-ascii?Q?B+NT1Q6qFrrzGxu4OUcMyEYUFmX8IM882+Lqnl83efzzbhVJokwPpKKlWy4d?=
 =?us-ascii?Q?IDQwfWRcWab0wbaYWf2zcnjDICVzRsrDuHGWORVucro67K6c60008yK520q0?=
 =?us-ascii?Q?sG+jp75ggUiiqp3SthAtwZSIw2WUk7fqYWWnXL7WKeLJ5ukuRc8UiE22QXDl?=
 =?us-ascii?Q?V5VyCU8tlvjG6PyIcNZmi4biLdYzQIEOwjA0FqM5gc8d5+rdCxoyro7jNwv6?=
 =?us-ascii?Q?HxO6vkDJa17+NxxgeXH3HDnbB95VbhpZTnrVaGfWBFFwqJDRhOnKfb606YvB?=
 =?us-ascii?Q?c5714N+htICqKqhcAqx01RBbJf2xRclqsGntz7p0GIRl2gAP7fH89JnRcj1q?=
 =?us-ascii?Q?JOZaz1zvS2GNI8wxENsKylmO+uWH3PVI/Ip8ydaOMgyDGtpCLAVd78jbA3YH?=
 =?us-ascii?Q?AUtWtxi57yh8+JYEQ+lDRmsUf1L47CV/tNtC5PiNFPIgQpX0D4o5OxdIeowZ?=
 =?us-ascii?Q?FkaY0Vnl8ZVfxaUFbYHnXPZcnMLc20rTok8ZdY5Hhoob29TOQ145/g0jvMmz?=
 =?us-ascii?Q?3XiUO/rLnhPSXbMCSb3vXn3IvJN+Lx7EqTXpSo8RFZvuk/cwJ5fdu4JpnbKq?=
 =?us-ascii?Q?mT14AqJWKjdl5mhWCJ3bNt7A4G4JEYjg+s9xJiEONmDGg0gaC6PsX2kTyO0j?=
 =?us-ascii?Q?btsCmsPsljCOJMdioG0HWj8KBV/uFgvaeZV615iOEqq4nC3HDWg8CvUld2mB?=
 =?us-ascii?Q?mJrWrQ0VxyvAKppyTmtHyvjviWNWR1Jb6L1QVH6ihytT8tRTSYAox2YqkG3b?=
 =?us-ascii?Q?5frXTTj7TRbfr7GX5qVv9/BaABYj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0TLkkedIALLNoZzX9AcLRqP0rclNPBR+bvHGtnkQ7KABJjGdsDXhn5Mg5EMh?=
 =?us-ascii?Q?XRUFBbgVvIQjNRSi9dji8BUeoj2qC9EehWjJQJjQORXEiPWMeXezyu0p/6y5?=
 =?us-ascii?Q?nUIwiTup9BGR44l13OH6vJG3uumZzsPW9H1zEj7ope440Z3+A1sV67RGM7xB?=
 =?us-ascii?Q?5ezaNT5pz++Srdi2ilYwNNmYiPWR0LX0JEkYZSsvwHqdag4NRbx4Y09w/mRV?=
 =?us-ascii?Q?VgifHHQxjTbS7V7/JZpGCZzNbSLko/SxIHG5EwYqzV18gKjj8cr5uxtuDFwZ?=
 =?us-ascii?Q?koU7WeYYLF6PbdZP7RSy1sUF2iebJDuCJUv/eMeo7U2QLIVbnwDaW4jBLuDW?=
 =?us-ascii?Q?FqLu70QZbo0Mi1rL8rB2l12zVrrnYobxU/muKC+bq80fpaoT1E6NcUedjlil?=
 =?us-ascii?Q?H+b79LUdmZwz2bn8RKTTR0YS3bSm8xMZAASE1DE1Tn3tHTq6/9eqat/kT2Ii?=
 =?us-ascii?Q?8WGUPTeW4Xqb7O/xsaTSJwH7RB9Znzj862kpRJ9N0VhEhvRMbaSTSQ97mAsy?=
 =?us-ascii?Q?+R9GL0NqxhG++ABPEkjGADKgwvSCiHYkqQNa+6RT3Y7nPH5ZTcLqtfdiz8Qw?=
 =?us-ascii?Q?RL+m37keDdOq57Gk9zdnh4ciutKNvKqhMsKerimdZRQvEK9ixEbBwD6Yb5NG?=
 =?us-ascii?Q?IrA0v2V8clrkXwh93tdH27kVilp68D/nrdxZnYU9PDDy1j8pQFkZjCJk3xDK?=
 =?us-ascii?Q?mYB3Gotd7evX+a962RCiu9UT2udsGd2Fc03K9ko7bwlg4epA9eCIX+QrYvEQ?=
 =?us-ascii?Q?8NgBM9oLI4G1ZEoY6N5Bm21zLk3SETG6pl6w3A2+gw5Xbp5fjSu6LAMVQHs3?=
 =?us-ascii?Q?bjxMfHPI3CnoCdj75Zmg8GiPIi/G1dArD+BbL4iTXtP/LDme/CPMNgWMZ0c5?=
 =?us-ascii?Q?BPW5Le+XTE0Rrhnmu4wSSA9Yuonh461MpuuOAgqK2djP2VJpEp6OwcT2zW5g?=
 =?us-ascii?Q?6J6FQR3c/p6TrUHGHdEGhLS6i6ExHa/G1t0mY6Av0mqVmCM3nM0MmnEePq/y?=
 =?us-ascii?Q?gGcUgOXNjDmUFEJdfKPESLjWBs5ca6Hv3akgBwcScBHPbpOKG5ew11hyUB+y?=
 =?us-ascii?Q?1dYbSOirAuK/s27/5y5EmlZDUUd+TE9U3RLIjhxyZ7RgxpXPBOwAh7d0dctD?=
 =?us-ascii?Q?rXG7pWrmmy2HXAQY+ElDblySHhODcf/J6NUb8ZhoYtHgmytlZ2oj6Yr/CWln?=
 =?us-ascii?Q?9UZFESubDjgh79kzKoSVGXV62NLIICPCspY62QSsFcx3gQubV41fV63D1Rxs?=
 =?us-ascii?Q?bZ0Mn7K5mQiSv+oS4qoHn0JgDYsrNatpUO0SBK4bSISxEv6qSOYJn7vGD5Gd?=
 =?us-ascii?Q?PnWzZaXh81CAv1KB7bqUoWg3oQizp3k8UiNbC1IjtEQXXsDyHWcc5m9SaQL3?=
 =?us-ascii?Q?YNa7pO/EhOBHUJuIeyWEuAuiFEgozI3VChFKTDxKMc6doh3hR9bVpnm0eIp7?=
 =?us-ascii?Q?PCyb69oClp0vC/enmHwVoubaUynRq0vfd8a5uXrP5ap8HmC7VHYuRi8cZ4DG?=
 =?us-ascii?Q?hc+s7BDvS6+hVjyB6kblDN6eef/mWGoyNJquOy8GujjHSeLgpkTcUVi3K7Ea?=
 =?us-ascii?Q?LxeA5cz8jslj/y1N2G9IlPhg4G12HFxwRFZOJUFAjbHh/Mdgyb/9ZJLItH2b?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb704e12-a447-43f2-fbe8-08dd516af55a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 04:56:38.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLojoLpgSj/9TeN3Y1NMUS6tfwTSWLNbn3TSdnSkoXMDLw8pz9Bkhs+YUTu/fHUeZxXMPWTBq1+JiGVydOlLiV0fTAZqA9KWvlo5o0JBqJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
X-Proofpoint-GUID: agIOfvvbUJ0TOYiiX-d_l1KIvNV5ABp5
X-Proofpoint-ORIG-GUID: agIOfvvbUJ0TOYiiX-d_l1KIvNV5ABp5
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b6b60e cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=SH5qzALUhnIA:10 a=T2h4t0Lz3GQA:10 a=g2d4SVKVAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7KolEh5kn_CROWkMv-8A:9 a=fw-8epx2muEhuKmrRO91:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=849 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200032
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 12:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115529

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Update SRC_URI to fix do_fetch warning. The SRC_URI
http://www.freediameter.net/hg/freeDiameter/archive/1.4.0.tar.gz
is not available, which has moved to
https://github.com/freeDiameter/freeDiameter.git.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../recipes-protocols/freediameter/freediameter_1.4.0.bb  | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
index 3ec20d3ab916..aceb379ee792 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
@@ -13,8 +13,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 fd_pkgname = "freeDiameter"
 
-SRC_URI = "\
-    http://www.freediameter.net/hg/${fd_pkgname}/archive/${PV}.tar.gz;downloadfilename=${fd_pkgname}-${PV}.tar.gz \
+SRCREV = "4d95b21a175a14f7eb79366e8656b452dcca2533"
+SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=master \
     file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch \
     file://freediameter.service \
     file://freediameter.init \
@@ -23,9 +23,7 @@ SRC_URI = "\
     file://0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch \
     "
 
-SRC_URI[sha256sum] = "7a537401bd110c606594b7c6be71b993f0ccc73ae151ad68040979286ba4e50e"
-
-S = "${WORKDIR}/${fd_pkgname}-${PV}"
+S = "${WORKDIR}/git"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=69bdc1d97648a2d35914563fcbbb361a"
-- 
2.34.1


