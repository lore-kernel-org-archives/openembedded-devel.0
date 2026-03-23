Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20069EC01DC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15358.1774266143886224798
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FlUWpYmg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5o1iO3735900
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3tTT6CySgTzeWfGlj5RwhfOaHwGoiiCKDaCnXuIYufw=; b=FlUWpYmghn13
	CjH5jNjYTzbPuyilpNvEg+zKClxtReczmwoF1pN60qyo4fQoggVB9vtJKDzIaEsn
	F4DPxAZiVKEEHvyxJAu2HG37P4iO1ghfZzriz0aoZ609tCMtvB8JvhAFSp+r2PPm
	QZOPbcZLuDoQaUmNYAtb++xLDT6UntY4H2HdN7++8nq+p+dOqxyMfYkBP8wKd0zO
	tjmpoa9l5ABh5LRlzREsvMm4mQBXJDrumRSXRqA2vk2vCj2jedb6oAjTI9OmI23e
	6QgFuitp6w1GiRk1uG1WyAtKX1fN6XsHd4WP0HvHHePYhGYWyne2vb7Q336c5ST2
	vxK/dRKd1g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k3g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZIxPVwMOMaVuo4bYtbPAK0BynFN4EkF4wkHKCQAbA7Ib2piczSMYh1HFdlntia2HiPDb7EXc/+7LvUIKDfySyFVOObGit4FltZjvPbnH+/Cdw4FH1oxHIOL29m9PD+X81oNsznVdDOdKbh6FWVKZaN+ly9PZc7GohTsTgWbFpM0zTackgx7/5rfRFAybhdynkS+qhYS70NEo3AW6NR6CVIbQHSyMnDtai2GJaz4n5uvXA7pSOTRXMyTNCpF2QcwOylpGoH7BXeQ28gSv+vVdHRteR8ugPRRIifs+hzRJUkSL6CO/fBOYC/RY1UJcNtwOWYnxNqYbIZDelDYi+rhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tTT6CySgTzeWfGlj5RwhfOaHwGoiiCKDaCnXuIYufw=;
 b=ClUNP8zqxMCT8FpmVN0DzpD4LcHgwC+rv9OEB2fy3T9RppN89VE8B0xIXK4jbUupkO0yGDqoAWcwblf8IzsERT0qrMbsObNTgVpbE8dsnlAw8Wl5PryDXqfMyug/hC+f/VRik7fXX4ZpiOUhWDYLXPlWu1KQ6XTSynopM2zvSgoW+L2/Ty4sUebMFFjUzvvxT4tCX+AWKof1GvnsxFA6ccq45NCjSdfWusV5ubpJDW3JBepfWmuaPyTlICM/GF5+z8/kpqIHtU/lFK90Cut7z4T3sD22e0wEZ6lhGU27AJIpVWJF86k6plLgMc04MOBZiXz2ubES+SqNZ9ecFA0S/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:19 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:18 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 12/15] xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x
Date: Mon, 23 Mar 2026 19:41:49 +0800
Message-Id: <20260323114152.4178269-13-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8211e2-7cb8-4ff0-30fa-08de88d13ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	+Ms+WXhUOxAIy8RPlrJVyLHOJPupkmVNYEeD1cviXsd3hXTlAWzc73jHGP6bMTSmbL6T/Reij12Pat5btoPZ1f22VZ/pTO8NKaW/nonVQGOO4z7YgVNZimM6iK+sccQpV2cqQJvOJCYBxCR8zhsvSS11SVp2mrOATsHzfft1h4JYtU9LZ0h2Ua7mLLUBzectddZIh2VatkVz2k2bDK3O/b+HF78I6Axd8KsEWvYFk7xsxuFuRpiYDfW52nUb7qfX/yE3qYd8kIC4wADdqAZOQIQpm9ZioHB0JCPKd9R3iTQsi7rn6tlT0ZfEnaOsNCWl8Z/1jEXBjBAkH82p2vvviEoZIlq9VTrZ5GR7/uM01if6K9sU0g8aFffKyqEOtmmQMk7lk8asv+IbYSY8kvz8Cre2U0FusfvzJeVaRgDtqHiNMaNbPuY5/1g4k8rtWO/q2eGIwe8Bydcdsv7vLE4uuxLm3qWG75TijpwWEtTatQVbEr4+fS9QUy4AUptWzw5KLPVYBVBwJF9V/UCNSj8eTq++ne60UbCfnwDEEbV4dtBSwOXJAIF/BySMrLUX6GtZ1OinIC48mP1+Px2h3J0WzBEEi0rOUKAnOqt5sokfm/mDY9JAwL/tfQti1Xewepc/zSJdERKldhDhN2rtTew6X8lyNROnzZxKHvc0YWRXcq7Ig6NPHVn3TFU2ajyjIlro3fzwYPT3rBkkcX14KYTPZrMUfEia7bpp1VOny3q1yMo60GMEWbPBkKCpsDag1YGCH7ypSCkZeKjC/cUcI6IlzzXJrmFE0UIJZvYYygQEZTM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dG+zaQPbU+foW9HDk9AL+ExaNPV6gJIKZsRIwStmNf+McLM2mt8fgz7S5OZO?=
 =?us-ascii?Q?Tyjnsy/uA9eGytHPYsBz3d9gdqmZsdDk5RMtMaar9qtNSk0708oNR7kZzz5t?=
 =?us-ascii?Q?JZN6uWu7RxwktbceeCX/flPaRzd1y3ZOpkrgeDf7xCpsX6e7ube7fJURBybT?=
 =?us-ascii?Q?bipq7n6WMhBfig6qsO5XuCW4YbTwR8xcWy+JpNpKkbStvaPR+iQrLxtO/Tn/?=
 =?us-ascii?Q?c+mv2nTapol03bGvQoNacuptEsMx1GJyInUeLFJ40nl+5t433IZrNTWEHnUs?=
 =?us-ascii?Q?cF3ImA7UohR4r0sorHoetTwjzdhLp/hu1kQAqClbkx3bsvU6l+THsu2XFPp5?=
 =?us-ascii?Q?dwLOWoWYpuCGUt91uZPscB+ltE2ObaJVw4gfdTJEo/05w4wgX5pQo3Sc7C7l?=
 =?us-ascii?Q?sXl5tIOXlDe6mttfjkrU3QOP45UJduT0lTFDOuVlap2voCR2RFJpKLB8qH6A?=
 =?us-ascii?Q?rsYRYpRkKy+/3wUHJPd9c6x+/Zdpi62ZUjRFvvLO14CCUppbWBV3qrcri8uB?=
 =?us-ascii?Q?yr53sMDTgzV/9xXloYtb2oe15yah4D8fh+e4s60bEaH4lw1fo43S+PJVtGOt?=
 =?us-ascii?Q?PucgpUZ+wcwiW1QY0PsHUh8c2BVK5UOb2Q/XLLWPVTDx/pze6OXvFZMKiCWW?=
 =?us-ascii?Q?URpVMjI25HXTfqHJ7vMuqK0i1acRt+FxvT8HRyCeklh7LXT/NstI4Si1vK8V?=
 =?us-ascii?Q?cNfBwJxN2wETnJKcH5Qd0TiOZ8eyZgO98x/9It1jtEIQ4VyGBLXUrDJjdwf5?=
 =?us-ascii?Q?WBPZbcSTl6onQpu1Bc6fSU9BdukQaeMshOzvGpW4F1zfucTjGBaz4FzG50Uf?=
 =?us-ascii?Q?NU2GBIgaFuqK8F64LIW2DAtH0reKO3g8o1R+3soDVCCZ10Ozkyu0e2kiFD3Z?=
 =?us-ascii?Q?xQm0Wzgwax9tf2VcToexQju8wiNxEubsOw19g1s+RgHGkyLFP/HrTlCq4zDs?=
 =?us-ascii?Q?5v02fQW1KEUFQMl9ydcGyg+pcvcneLsQkyXFhYH6nFRKcAgym1jXKLbG9uMN?=
 =?us-ascii?Q?epieVcSYJeTNNeYkymAB5nSNUdq+bOZtttVh6jC1Vq2M9t72PFcIRH5JZmB7?=
 =?us-ascii?Q?u3+Hi3P9QfQcVrW52cCpJ5JXpluskGAewzF9hWg/zjrgz/BYR5QyhAwqsq/z?=
 =?us-ascii?Q?pmpu0PruWjoOUVvAMvlihaQv2rKxlTcp4ZDZCwUdC8pwBUyIPG1eIlVeH9ne?=
 =?us-ascii?Q?JIJObFjkzsXOYeErgSgYYZxatvQNrob9M0+Xv4Vq60BYqlLf9G0FnIYcpUJn?=
 =?us-ascii?Q?eG9QBWbb/1CTxPCVlhGMDtSAu7SEYc+ZEIL4yLV6R00N+Eq/rcKTN6N8uO7a?=
 =?us-ascii?Q?9VFJii8cecDGOmEPW05ulTAElkmmjcBBBw4UEeUyhzcWZUULrlC08JJobz4A?=
 =?us-ascii?Q?0Ym+jP2yoMcq3Hvg+BbivbJRC3igWmxRzPwpt0J9SkALyY1c7YbvWL0iAh5R?=
 =?us-ascii?Q?yNgUJ6BEaTcDx5uYiQcjpMA2T0ZnzwfaNc0td5gc+sQGW0Nv1viqDHiSV8PY?=
 =?us-ascii?Q?hVvPla25cgNkNxt9EDcCsRvQnF5QLhh/Oy3QhFM4nbGjMWdnrylmAuCiStyH?=
 =?us-ascii?Q?OI+i7poO4T8Y0A2UtNC3DPk7Zh+1UsaLz8dzFC4OnMy4EHecgJS4noMHR++a?=
 =?us-ascii?Q?0G/UjW4/SrvSFzfIaKUECbMHQgVgqztntqmoai8sQLRknWNav3j03bc1Jq5N?=
 =?us-ascii?Q?Lk4LWkJJHslGGTKhbIIECR3JWi/uZtT3OZFyMlyKTXNwxqfIUVhNP6p2GoV0?=
 =?us-ascii?Q?E8YWQr8Z1wqup60K1c25grIS1kPu6mE=3D?=
X-Exchange-RoutingPolicyChecked: 
	XbJ3iUr5/9Oth+wqSGY4VhpZCaYHGSBbsUGkrJHK5xVakVLngl6FN38+28UoL00mB7gDfoMndFA16s/LM4ysIGnHbp5pJZ0OAns9GoFrJksxFFxghND1VTwvWNazlwXz0WV6mFl1vft73SoMDAJodMgW7xutEOa8RvpRQDflvYqkTOZ8ah7y4ePgYDYHgjRgcyOTzy5yEgJ3bn3pMkA0XM6YrONMU+GiYhOMQREKssdhtojM6bPT9Qj/QHjzXy+M9y0wgEanpH38l4LTtIvaLNwskmJR8Rord3APjQlqifMhv31GnG9OjXJ3TNFDznoCkIXQtmHD3KcmpGfRxU7w9g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8211e2-7cb8-4ff0-30fa-08de88d13ce7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:18.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWHSqg+N3pPsYGnn0rKWPU7jk1ZmQl44BfrX85eNVbkysWcDbzs3uKFx5+szK93lQ3KTzrvFyUhinJ0w0k7ojl8VH1ox2s/9KUDuUbvLq5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX/Xo6bPbJZrt2
 hA5wbV+ULJLfw14qwNRkP06RotEsd5XdIrrUACM7dZWujsQqdqRdj5X5+vJEdvUOmorEN6U20Ps
 3a4C29nzt4JdjX21HyksF5M+K//17fO6Ym56C1fnUfl9KpsgmQg8bnT55wjIKAfmyWb3Ny8Ff/s
 1SjaUW/ufkerA/hqgYqEJ8iTX0MwjgSKP7RD7rx7R03v8UE/vfzdnRUoZ3x81aJw+z7UjGJ9FkC
 jjz8DtGYMZI9r2A3Kw7x3Dl2DSu08GoocSQ/0Id3uO9BeybvJ1TlWpw7IZmA0+K9HEury4tQ0go
 04z5bSnG30fzkrYiiPlW5GjlmzpzUa1Rz+HrCINBI+0MAPO6P+0CHiKmHkVcVPoyZxMxc/YL2ap
 Nh64mkvXpM+7kndI5jvNnge1Xl22kSKa1qEaosASGluiuJAjCiCfmDM84gAhLkNsJ2rO45eUBdr
 Tjjc6WvNf73nyI601pA==
X-Proofpoint-ORIG-GUID: KBV00GfZWOhf3MxWj53Y2fPHdtq9E6jD
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c1271f cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=0qAXH5u53RZfBey-n6YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KBV00GfZWOhf3MxWj53Y2fPHdtq9E6jD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125515

From: Zhang Peng <peng.zhang1.cn@windriver.com>

xfce4-panel 4.21.x added include guards to libxfce4panel sub-headers,
requiring consumers to include <libxfce4panel/libxfce4panel.h> instead
of individual headers like <libxfce4panel/xfce-panel-plugin.h>.

Since there is no new upstream release with this fix, add
-DLIBXFCE4PANEL_COMPILATION to CFLAGS as a workaround to bypass the
include guard check.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../datetime/xfce4-datetime-plugin_0.8.3.bb                     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
index f025edd4c5..b5837f9e51 100644
--- a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_0.8.3.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
+CFLAGS += "-DLIBXFCE4PANEL_COMPILATION"
+
 SRC_URI[sha256sum] = "6b2eeb79fb586868737426cbd2a4cd43c7f8c58507d8a2f578e0150187cc00b0"
-- 
2.34.1


