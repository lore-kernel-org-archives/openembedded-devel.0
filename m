Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313E0F013DA
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 08:39:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46390.1773650348961672910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 01:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rW7lCtBY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753566c020=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G4q6LG2243620
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=btBxHLWqayI6Bia+lqKWKrP65NDa19Bk1um5qqfUDOA=; b=rW7lCtBY8yJc
	U/27wfqUFfwRVREFOT/9XreywgpqRHRSLiEswcfO2MTwsFt91ISTzn1CDcFZUmrP
	eZ6+F6riocMui2ENGK2PHP1MKIut/usJXbTm0fmGsToUbp9K67KY9RsjqeYxbE4m
	d4eP56lNsOs2MJu3as1AqMaUKK08iKA7QOU3BK8Cze5Zz1Mz2TB5DkJmEJQ/DccP
	WljUp4J38HSaxt9EL86XQjoHIYdo+AicA2cENbmHKAoF7vyLbAY+38M7XhxPNcWR
	Y06S18XhH1UpBpXwVACsAfyWQSAl0BbOmh8AGokbubZhQvD6QjEZhObE5+V1XA92
	asQ/RfHxnQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhtf0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZb3JlpA2IuJeaTezKIKAf+4oycmKaLIH4CGzs5p6z4TMVE8bYYSD6d//xUCjR18CEwKi7LLtk1qsY5Oqm8v3jUgFGxYV+1+mwMknjJJUabAaMuvBYG5j9Keov+KTWFRtLupt7ezNYiVUcY39Vy8gxdHStWEHaz2xbQ5enAQiuZu8Pn0Rm1/zP8SqbfMcFgarecioJ4Y+v/VZy8wQp1VLt0dhE89bH7r/we0OlPqT74lfDm+bUw0qcYCDWvbqMz6Msb/tVav2ADNsFtif3pF5Fm5c71vj0iAL3l0VRUPCqTclUABc5nxBaNDHJ78HnNYe5N91D3mBYFitAyFg1BlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btBxHLWqayI6Bia+lqKWKrP65NDa19Bk1um5qqfUDOA=;
 b=dQXI34uD4swtEoiFwkdZzYCImxV1cnCuiYTV5EWdW5Z3sOHzTopxtrngqv3+4sy/aU6m5H6/pe2nyg48EGlxvX5wb5Ife+dkwiyMkp0jgU2vseCKOGsQ86gKL6xA92Y5Kbj9nyr35/svsq0KkHaVzblpqcnW26Tqs5K+4GocR1kr0fyIwAypgF9JPL0b7+31BB8wFZzHL7uv4nwFJw3OzZPTsCcxUdG9s8UUBW3qExHcmiV82BWMAoeysxtCBEP2jGN2KH64odHW6Gcr81h9sYPC2IMsNcsKJrnno1+OYBrE/qQcsofD3k4HwCmp++MjSCb0HlhlIuMPd4wxDHjPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 08:39:05 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 08:39:05 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hstr: upgrade 3.1.0 to 3.2.0
Date: Mon, 16 Mar 2026 16:38:22 +0800
Message-Id: <20260316083826.1550599-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316083826.1550599-1-changqing.li@windriver.com>
References: <20260316083826.1550599-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MW4PR11MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: f8022661-6bd3-40ff-92f7-08de83377bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	+7m+mTLTP3uIXY+qCVvVjdwJ91liCWB0HV8S3Yf9Rt7xTPKh4Umq1Ptg97T0sSw0q9Le1iEGJItupZpb9NdDKqWYN1z8v9523eFiQPq+dtQ/bxf3H+sL6WnT6/8kUa94mkpTn86fF9ynxL2V2Ik3iBGswK7Pnr9O9m972YwLmSYvGtyenzTxkOoAhnLcpskBpSgupSBzqV95bGDN5uX40sgAa/MIPpVOfCwy6uQczRkI04A5yCJXB3yuX5XpzGQhSfSVOWjzAerRTcC91v3rLaxEYCpdkxa4vLvVpRV1GeWPDbn9VWnAiveZB4cHAfPH20qUxtF+hH2r+UyyvTIxwJzMo23vZx+5Omb1Kq6mo3I5Dr85f3s0SbIohs8gAGr7AT81IRf3vQLDHJreaX66ZD3SbeTY/uHi6JpXjTeze4yewugX4NqllHigbhANZvf0+LPV/+XApAoVZ/T67IBEOe6b99quOv2MsQVPD8kRR5k7cBNh0GpXD7s4OxkyLUameQ+LBVO79NJ0A2DnAhNpFskOBRlAnWP8A49ULtOY4JL6d6c6/FCDLG5DaUd2scJqb/tsueHP4ZVqTKLS9GJT5BQDWwT1ZbfFfcqWWgF6m/87jGfcLQfnvGxOQuVRPbOQjzkPnvm4ayKqjA214CNUJd1lYke1TRKEjTl1wsZj46GqZcRpN3gHekTQ3rOcmSoseHxBd8L+dnMHi9BrEfBqasiHf2LrSyHEyZjNzYF5r4Kl6mkXQwkBewQId4+H9S9MC0/V1fCixZXppWANcCdrVIPEMvBP0Aauyk3Vy/kuXe0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?03j2OOB62ff0X753BCtYEZVr4D2P8/aEx2ODYy7I/u49Ic/YEfJL8wgJ5It1?=
 =?us-ascii?Q?o16xe/vKxh/5QwcFD21s2fkKq8HSAcHxF/IEY4LXaVYDdyVfaZB+dPsX4jFQ?=
 =?us-ascii?Q?PoM8sCpQrzryxjjM1LtM52geUbS04SE1rbNBdFs1rQQHfw8+q1aREN1kmTJi?=
 =?us-ascii?Q?Kn8JBuzCbTl/m0OqHsJXssFTi9RHet0UMy4X4c5hzl2i0zNnPxGKsJ5UvP0+?=
 =?us-ascii?Q?NGo8DRDxclkt9OAvbRIDLDb75AlsA+6YQdbKsg9qqHjPFSWTvSr0yVra8/lp?=
 =?us-ascii?Q?ZX6EHGwrM+3sxczC83q8pVTaATSsbFC59EZUApewcPYWRKRN850/fCXlCzNv?=
 =?us-ascii?Q?g3X9+hzGQhXXGqK5bkD+Iaicm3ZIZUV7eNDmsb+p+BLjGJd5v8cHp5O+Ywbc?=
 =?us-ascii?Q?R12IJt29bCtC0MKReC4SZCyv9VM5XRSkqp6pDL6a9UXyFPFiUmIrZnM62OSY?=
 =?us-ascii?Q?AUjRoRG5xfagpnL5ebL0+7hySQq+6p0NhuDaX1K1vM2MFjz0JJ1L7G+StkXH?=
 =?us-ascii?Q?A07nFM1ET5awwPUOtXiSEHxW/EW04Vw8/5CJk+NMbAJl+ip13vDl1k+ruZPA?=
 =?us-ascii?Q?hLmgCJHxvfQPHp1iPUjsixXRoyw2yBifiQM5VhOuBJ5EyoeDP3Imb64EVGfQ?=
 =?us-ascii?Q?0kC3zV/iUT6BaMic/l+hRJdFfln15zdAL6K+sPCUQbQP4Ct2kwmgJUU+KqnR?=
 =?us-ascii?Q?iaC1Q8rPNfHrALalMJN0dcABbok01bTWau7rsI710rhLaUY7p/C/O2r1MnK4?=
 =?us-ascii?Q?WHEqCXD+CtD99bps7AtWy6RU+WBaF5tZg/P86nZ4zjAi0nBLC8cWJS48Mesw?=
 =?us-ascii?Q?JysEtOUWdXfIxUygDgFsBAB6f5BJx7rjY5CI/ONnd2V9lhoWeyg26sVtQVFr?=
 =?us-ascii?Q?q4abzD+c20Dy/Pe+tF0gbYSkyPdVlXfnIkCmtY/wXScmT0Kd1E6l/LwXR9It?=
 =?us-ascii?Q?+fgMksJ4yAT40oqVIFptOXM6l0jBOE7WUbipofTSpTj63O9uiwDiCwJSP1Qg?=
 =?us-ascii?Q?qabb+khBnfiZdKuuVCGU7lhIaBwukGZPVY1R7x7MLF6Oi2s2TwVRYFl93yMt?=
 =?us-ascii?Q?m1wunK0VZ35Y7q/j7tC1UYA6LU5psaiJNLyKKMPsPsbdTTtBYCw2+KbIphdM?=
 =?us-ascii?Q?e9cI1PuWqtTqvh57FWDCn1aYKnP1NgJugCcZb8Cag4oNpqD8zKXEPKwHZ45z?=
 =?us-ascii?Q?kooXUmmuFzKawaVdJn+QQYxa3MU3tdYLdmyF2V8gzXNVCckqKiI7Sgut0C5q?=
 =?us-ascii?Q?U9HXtGY2BJT09ZHS9hyRl8qXn1JwUQWng0HcOT8osV1k2UjCk3bsLqM+rf23?=
 =?us-ascii?Q?x6h/P+e/+ZDHFlLb6wmW0x8RcRMpfYVIcvO7Ra3a1GKWDrLYZ2m6HId1N71D?=
 =?us-ascii?Q?ReCUJw9BftI6vsbuWeUz8vx6wx15qPbgkhfXT7mbwyMIPVmdNeKmFh3BptUh?=
 =?us-ascii?Q?ZteenlUfGY/pK41AqklTvoujoh8IgFzthKx0nmVjyxLIoeypUK6kSpaOjqhu?=
 =?us-ascii?Q?K246Hxgdvbj19h1H4OAFKDTNXW5xpoXBQnZreOukkuJHz5Em4h3yXd4vGHUJ?=
 =?us-ascii?Q?oI9GnDA4Z8LqRBpcJGrjoYN4I0cqJWrXDcPp7CbjDnGsuYrY7NFToA8TFB/F?=
 =?us-ascii?Q?M7s5pvMTd21IrzgBfn16+DaoFm3dh6Riucw6Xe2cln3GgOPDdbOWXNDBgOwD?=
 =?us-ascii?Q?o2rX4vM0OpHppcfTbSCY5F1bXeEY/IvYhNYlkAgOo4gW0DqWYZHNzH53TTTS?=
 =?us-ascii?Q?zyeS7+dK0ZH4WoOwbL8qX3l2nh/j9dI=3D?=
X-Exchange-RoutingPolicyChecked: 
	kHui/Zk1EtmWWUQwmDpMovcbrcfFfFvd/SU37jEzKX8cwwnV55wIQQklqZIvRK32V1DwNzSlSfcRPN5s/R+ECf+6sfzzBZpTQfRlvR8COqgBNJBCVmee2QI1cfmEVJ7XNv+My5VGllkzwRsIyL4m4ORRynC3o3X679gyWp26xzIkgZbOTZM5Ozd0qAtW0ZuzqKDmpvhGRFOFHe819pNtlxeMzhDw7MAv5qN+DwAfxkA0DBbFBbbfaxWrt9i8tmkncPPXWN8GTB/CPi50KyQ0HBMT5ILwPyqXulRr7ycF4m7z8EbalXOEvjDwAgpr+9DWf/GmKQtqkqQTLSwSz3SwaA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8022661-6bd3-40ff-92f7-08de83377bbe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:39:05.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjpApUUEwXTFhmtq9lz1Si/086mDXPQ3cSYueIP3X9ugy6hp8ne/Y4kCmh0Y5yph8vpVXZF9q91WzaMpZrEryHFxoCEPdpkiN8OAPQ/nNCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7149
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b7c1ab cx=c_pps
 a=/jEiNo7mPoItVXs2NspnyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=snR0OsaTAAAA:20 a=t7CeM3EgAAAA:8 a=E9TlABWVnr3fK5GVW-IA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2NSBTYWx0ZWRfX8TS3W7SpYf0S
 A+Nny9Rlh9jq6UinoZH/67MhpIDVXZFJe9/3N93DUeim811WZwmCW9a/4o9M3ziGVp5FvwNOZ/a
 ilkJJ6sRMEC2JILXOU39ZLrjxD7Zyh2dzs46Zc9TsdbBAdgeIavUkBBYaHa9UqFvVLFSvGaTxb/
 gte3wedksjZ9V64FvIaxyA7sUZLKaatBE2Ktjg3CQnGwU15/uqfPy+woP1BTuBZX8ypCQmAtVH3
 u51KhqX4vUXIhLcfp7eqnDk0BvY1ZBpEwWx9CU4wiqyUnEJhn/Gg0Q5YI+45r4qzvsThb3eZUhp
 G7G2FbMCsfAGIyk+sJKxj2KpbFtVKw/kzpYxxZ8FBKeYFunJTtUYVsEB2pOFevSUldR9ZKrWRU6
 9qNqMSAYVnPa4NEi/G8KKp4sYlP6SI7TACd8+zlrWfP3fgFXdYRgLJPjiO+9Ra0FQoE0ma+LpDs
 kagZkwD1WXJdsuJx8bg==
X-Proofpoint-GUID: Pw_TX-qlVCSQDEP3W8GB8uyhqVnrFckg
X-Proofpoint-ORIG-GUID: Pw_TX-qlVCSQDEP3W8GB8uyhqVnrFckg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 08:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125259

Full Changelog:
https://github.com/dvorka/hstr/compare/3.1...v3.2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/hstr/{hstr_3.1.0.bb => hstr_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hstr/{hstr_3.1.0.bb => hstr_3.2.0.bb} (77%)

diff --git a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb b/meta-oe/recipes-support/hstr/hstr_3.2.0.bb
similarity index 77%
rename from meta-oe/recipes-support/hstr/hstr_3.1.0.bb
rename to meta-oe/recipes-support/hstr/hstr_3.2.0.bb
index 96be8bd09f..418eeafdbc 100644
--- a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
+++ b/meta-oe/recipes-support/hstr/hstr_3.2.0.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 DEPENDS = "ncurses readline"
 
-SRC_URI = "https://github.com/dvorka/hstr/releases/download/3.1/hstr-${PV}-tarball.tgz \
+SRC_URI = "https://github.com/dvorka/hstr/releases/download/v3.2/hstr-${PV}-tarball.tgz \
            file://0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch \
            file://0001-Use-OE-specific-checks-for-ncurses.patch"
 
 S = "${UNPACKDIR}/${BPN}"
 
-SRC_URI[sha256sum] = "4dabf61f045f022bac8bc909e5fd96041af6c53df56d97dfa3cfbf49af4453a5"
+SRC_URI[sha256sum] = "abf0a8625545b2022d62bf0d1c576e3cc783c4ea7cc2ae2843c518743f77f4c9"
 
 UPSTREAM_CHECK_URI = "https://github.com/dvorka/hstr/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


