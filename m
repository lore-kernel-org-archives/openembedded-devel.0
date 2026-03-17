Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA406F33811
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:31:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71772.1773739879890138209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JI7OCaFf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7536a35c2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4VBmx2981243
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XActpp0l5B0bCcdtpvVj
	B3cY/oBkFFgjoM3F26/Va60=; b=JI7OCaFfxFUqvH+JQmAsEbIhLlQvyiAmDV/T
	0E3U6xNmf2m8tMbtCoPiCqdYrqgwZIe6fLc/rYHyHwd8/F5sdXm84QgmZvBfBWPo
	U0uRdZusicq/WvqZnCWo/yumcrIRRHr4QRe2hG4lKnPY+oZTyyPGke4EeU3oomtN
	InhPyWq5MEprbciEKEVrSd8FHanGxQLAWbd8ZM43uwLz3GU/Qa9yvwIzYmTpIK/v
	lYzhODlwB+GNltbOosycXmBPpWKNseqeK1woPNU3w2+YtGe2F0xgr4gWrmIypm0b
	Q1lBkiL3i6FM9PnfW4PdK+Jun0vHfP3pfbujCvXqFSPTmKvnSQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66901u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxaFZ3rMpwB+Bu9+zsrRkr4M8zxAn8KzB7QPRji1V7Y5CDa/XFQTV7Byq+I6W+G0D4oG1+Lg5w5hewDEvkUCvG2q/CvXVCXehCYZmkHS6Wtgy9d+7noTKbQqn/VTYWY8fD/mxRyzHnaEWCD3520BbQ+3VP8Glh8qdM8RgGRUBbo50vUk1Zk+xHaebA1HdosVBh/HMuLvaCtRiCO4RCKQGnaiKgZbk4mOs+UTjfDXwboutVI5sS0C00TndGCkTi8ITEI5gdSP5mtH9KDNUAJjS5PPrq43lx8BgrgdBe9P54y0+LS8VLCz3CUKE0W4iyL//pNf5Kixme+Li3ue723dHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XActpp0l5B0bCcdtpvVjB3cY/oBkFFgjoM3F26/Va60=;
 b=C8b010FVbj1Zht0KwKWk1a38cd6mjGiJTVRImwrN2LI+FZcEyw6MCQlh9u1s63wddPt/h8EOG7UOQgOuy7hwIFDnCpx+4mq18JmVdNjIzXOj3hM0cxSY0D7RdPeb1B/Xrv1JegawiR86WDn0wSFaZ8SVIdsDxQrChHQ8N3MN91jQtmT0yHK8uqAmN1fdKnQXc49ctW4TCsq3rU/nYE5p0rwc6pgFmPeANq0yW+Q8tLKeFq1UazNB9HAXvU78pLdmPqU/UUVSdDZL7kmoF63zPbbOn78E7nHxnE5W0A4jihj5AYXEoUqs4aL3r6c0mSNada4j4m2ADjz62B7vtZ+LDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB7606.namprd11.prod.outlook.com (2603:10b6:510:271::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 09:31:16 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 09:31:16 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] glibmm-2.68: upgrade 2.80.0 to 2.86.0
Date: Tue, 17 Mar 2026 17:30:59 +0800
Message-Id: <20260317093059.2673498-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb6c7a0-8488-48bc-7d15-08de8407f011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	EhM8BC/htOOqq29Kz8FnWvCH8CmENgCA0kDSzFHUh474MbOqYioQSQxVO6Nlr1fZsHhVSpsd/S/ixE2GFWtCVDZmpIEbkPHUvuN79sO0xiNV1IR8H02Nbq1erl3mBEIJqaSwAutPZQ6vZenF81KupcpbNg+XI1EEoMx1Tc+3z+T3pgTYc1mcjkGawn5LUyiCLkQmFgozIMCNZ5HCT0NCjUnhFzUeeoS4JM8YoKmVR6DwrtevBsvG4UldhgVwhp59iZ6eRGnAeto/y0m30Clk/y44E+qmfyr6+RknR02fPOpesVgaB3oWhV+bIAbBm0bKgJEreaZuS/FmN6QGD7ssrRkIo0BaO+afQDKF+LimRX7aBnPvPgy5geMyQlclgPrM+09OzRiVGEEW5yWn28c5TptKLpWAkq2LOhUvkTUkxcc4THbQNu52vZycFAL668b+JLyNEtvZa6C6V7nIVRTMi6al5nYIFAeVU+iWTnFGrJ4axVHg+vKG0fKlXDuVhRP9W2m2b2jYR/Kkvhf/abpIrC32xpz3q2DDFmCpJB6Tk0kR9C8p01+YGLCJ72fOXzilDdj7fJfq8741f16ntZRnUsa8Y/9iaTk1wVHwFqHHHCaPP/fLAFtBbb7NXvAYFKkPeQtPMZITRMTK/x9rHKOU9/PqTcxFv5Dn6/2ZoqIVRtm977KyVnpdhKbD6IW5Oh0WKR3eq4UCo0cNKfvEOxzxAhn7Iy27L0CdQp9UnbZ5djcAZMjC8hEBeFH+alu8tsDR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jIeyRIoQJNV4jfFTb5d1h8mgSUn7p2+OhwaEm6rvI44md9g3Zs/8KnFME6bi?=
 =?us-ascii?Q?6NGkm7PfZ0zPnQzrYRf7amoXU4Vni3DV1uAivcDOAlyKruLeYrpc6ZXuhnSs?=
 =?us-ascii?Q?tNWPJ1i5xSd4/SPL/k8a6pG7WYbdtpO1PydHp2pXAeQe6pdWEse2DIuq4RrK?=
 =?us-ascii?Q?6SJThzB6yvNAIvHvyDg3UOnn4S+5rs8sF0QXhe0QRwUyK++1eqrpSigFOGSw?=
 =?us-ascii?Q?3KkOh5KOk54oCR2kFEqtHeV43EFwW1oOajCsSO4Z1eeVc1QnG7d8nJ2BJPG6?=
 =?us-ascii?Q?ytBAOx7yiBDOf53X19rh2le0Mea6enhYRo4ODI6AESc9sa9pmyetaj0I/Sz6?=
 =?us-ascii?Q?zfE6EsxV4ggAxHIBmhcOzh1oQZFhYzvplyEEglO09wM3CzORBkpS6Xp80lfr?=
 =?us-ascii?Q?XuqutkJ06VP2dJa9nayVAbOFvo4SCgcrMdrP0j3D5KSzizBxK8KPT4EWKEP4?=
 =?us-ascii?Q?nH8FOIdsoqIxFeB0FBg84uLfrSeO/5G/v8etJzd371SxMBIG14HJAhlmO7rk?=
 =?us-ascii?Q?IhX/atc7Tgix/c6fcr3r5zn0dzsEIMdCHijhiRqceYRjyOOwpmifa4f/u7Ye?=
 =?us-ascii?Q?qKRG+H5OvJRAdM0IoPeQ3d8RXbd0bjhK4W7xV+UVT5shYrKyWgAxc5PVU9MK?=
 =?us-ascii?Q?gM9uyec31F6mrRjwxBj4pXWqnglDsNTfNANhQeUdA+z/+sI41IW+hwSIPQCC?=
 =?us-ascii?Q?oRpwJSwJfYd6xcdQ5Nsq1jnctLZfdPVVgPa0NasCjoSthgVyOJLMG6cf+vVU?=
 =?us-ascii?Q?fy87TE33yABDjaSEEjObe5tFiug7dnEVLLc6laFpWsWZqneH+1pa9KeaYwHs?=
 =?us-ascii?Q?gM0RTfc3miT7eABSyOOH0eUj5F0ya0j6xi8fpjxynPJj2Hzh59xWKpIqMHQ/?=
 =?us-ascii?Q?htqjras/NmhMUGm/ojeZyswl4A+OMnGyIlCFYv4lknMD/2+DbdzU1+NwP84W?=
 =?us-ascii?Q?nGI48CE1qIICyXvHAw3FEGNEWxv1pYSHH+3wK1Jl0IBtM61s5IN3NJXGal92?=
 =?us-ascii?Q?1xJF9gcbVDZfEoQpXcU4b/btzYMdwLFxl2LGovTRLlmaoeKE49poIYUH6UnN?=
 =?us-ascii?Q?sdQYIIb8CQIK2p3+6e2zXe3jnpLcWNDkeX5n5WJDLvYUBvxHiEAAMhVSvO8L?=
 =?us-ascii?Q?PdYciFSddYM/AdNR25KlXSJCsbUtRa7fi4brStbKv89w0S8J79G9PDBb4Hrw?=
 =?us-ascii?Q?v58ksS5Z5AGPfsTyVLuaB6pGPlp5o5gZRiJZThDNQeEoTfbulQLDUZPmPoGN?=
 =?us-ascii?Q?RwDtdtalwtYpdZZTFiDq8vr7fWCXYiPOjKC5L0b66tgdiFeZQq8yoAnO8Sya?=
 =?us-ascii?Q?IYvA9OWuW1lFvFYOaJc4dKQL8zxr0ygajco08QasjrWzahalypjTtej88VuM?=
 =?us-ascii?Q?zILCG77ExC482EXrTZY7OSXddOCIybLq1qHfddc6cdrTuaNhlCl2Vl9jO6BG?=
 =?us-ascii?Q?lGqylJBv2Y015+XMKFRN8M1KzeJ0a4dKNA3QVB5ZtHUP/93ah1OIKBwFT3eo?=
 =?us-ascii?Q?0ixe9xV2bciR19mfx10cC46aCVoDBC9amA3gvU/95FdVIRTC3vZOqpusmGUq?=
 =?us-ascii?Q?J7Yhmdq2PQIzLFA1pvgTiOXLXvBPSTBb7NL4LbGhb10oz3rwbfelDLuvgMI1?=
 =?us-ascii?Q?Ja7zAGBX93A4rclDryLg5akcYwaAEgRUE2klh2Mwz7WFiqDZEA8pHF0RAnBg?=
 =?us-ascii?Q?hOb9AZlwsmyEA9SUtUqaSbjbaGyywRu/ygpXt36sVzuf2F64NpWJUG1BjqxR?=
 =?us-ascii?Q?PONtJnYalu3Lt9WqCZx0UP1WvUeySDA=3D?=
X-Exchange-RoutingPolicyChecked: 
	ogTPUaFlRhC7uSb4rAhPz+OJrldeNyFNEK2A8ALj2ECebQoTDa3aQh8ZXWshdOTDqUJGf9o8wTLpcKLk7CNJ5BqZEQd6Kb6qvQ10DiaQhqw3u3SZmg0rPf8krhDhj1IFO7tMKh9huKQkhHj/hjgM6F1CCsMBrMj6PDq/myLcrCEaY6vYFs6PlkL46Zcpay78P5yCHNcfmYHmpcq/ewxkRUK++WxvdkclbgQlF4ac9Qz1T1vu/8cv54gqtMJuu8uedNX43KtfU3qFInrmyTtS4aytPxNxKh48Q+kuMcb56hM5mU0QOmlrmgLiUbd9UcYrwYngELpUOCyiX2KCSOoRTw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb6c7a0-8488-48bc-7d15-08de8407f011
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:31:16.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNGkAIU0cPNT1BSPPpJDbehrwgYRMLt2n9udHM+Ekz1xa2fT5hfVQa4IbVb8HoleF/o9LwIJIxFhhEKVikBztPkwwSfYIKz/ac5Hp2qJ7nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7606
X-Proofpoint-ORIG-GUID: apdOYtpoz8nb5gzy_wY-s_zeMyBs0QJt
X-Proofpoint-GUID: apdOYtpoz8nb5gzy_wY-s_zeMyBs0QJt
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69b91f66 cx=c_pps
 a=MBvOscNZ4ImqL1nQClNoCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20
 a=NEAV23lmAAAA:8 a=BiqsqxNzAAAA:8 a=t7CeM3EgAAAA:8 a=Fg_fN5agR75Lu3YF-2wA:9
 a=3c_bh9JCJ1R8RpoZksgJ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4NCBTYWx0ZWRfXy92428jiLfMn
 NbYFUHPx8I3FBXFfrW/nn7CWCJOix6VgyhsVHMOrIwJVVQNbxQuLDugxE45joLWFmyi+CX7yhEv
 NFnXT7N9O7VOj8/6bBsyy4kHOUKA4R00EszWl/Pxn2q7r9vEUlQkmnT3paqv4m/fVlnS5qDHdHw
 69Gl3FxKKsiddDEJD7zjh+Gjek6LADSz2NVcMrockiwvY3o470w4mwtNU4IvDbrQY9TcTFvGt5C
 3RphCGmrsCIVYBwt7oyKqnVH3vR5GYP3rxFYTm8jra6v0h0yM46phxqSbitAeHj0U+Jaq1XeRnK
 pbpWL1Vy2kcxPrMe0EpediA6mRZbFxWWXID3xzY5t1MLwetLYdq0OUPWQcfOkQMU4lUMdRs4jWe
 bJbbnZ36sPfgGr/W5lJs2y81Tl9C3o+wIZQXTMjZ70rTB9Cs633Jzjoa/6cOgc5jTQgUN9mXOkH
 G9udBXZPyPXrTE4jsXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125308

License-Update: Remove obsolete FSF address

NEWS:
https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.86.0/NEWS

[1] https://github.com/GNOME/glibmm/commit/727b086bc5bc29fbbfb3fb90198499364cc65dac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{glibmm-2.68_2.80.0.bb => glibmm-2.68_2.86.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.80.0.bb => glibmm-2.68_2.86.0.bb} (75%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
similarity index 75%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
index 48a1a2a624..b0c83f7eba 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.80.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.86.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
 
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "539b0a29e15a96676c4f0594541250566c5ca44da5d4d87a3732fa2d07909e4a"
+SRC_URI[archive.sha256sum] = "39c0e9f6da046d679390774efdb9ad564436236736dc2f7825e614b2d4087826"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.34.1


