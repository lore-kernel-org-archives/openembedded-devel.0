Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41739F54AA3
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19082.1774357210566086674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BBfb6hag;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4uHJm1918188
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zAPsSK9YPfnXqp63pswli3QR7MQV1xk403uPFXIZpf4=; b=BBfb6hagyVw4
	gCFi6DNNUG+J2UUn/8QKZU/K6m2xg334tJ5Tkqpznx6EdmEfrEVAKYwo9Uc0Mser
	u0wMwP+x82FSS7w1ay4YTbXfU89cCSub87N7VrhFAZ41RpVjIvBW+/hY3f1jtrYV
	axSxBdzMA7UPG1tLNmQ9BkU5VdpwaioSxl+VpDh59gwjzJw6zDOriYSFGImfFi9K
	iHvInP19JkbiwkYyRv3Ar/yZTYnyI3w0TUaRcMfaWrjWYDZmcx97mGjVgmyQMHc5
	/Nf44yd2WEDitqIg3r05c0xG6hOE0lBtuOb3qvhIxhiJb5RasooSxc+FG+uBu7wb
	LoL6YS0gKQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyb5rc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 06:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cG6SsSKEO7srILXXGgub7/R1iWmtY6A6meL1xnUe0dMoPvdrbpZnOy6Wfvai8rT6w48HMoa23CxFCwcmS355/B6C1TVkWo1Lrr0bRVy/uXhvsvboPCdxaPk9x8PSUKkDNqBfBgWfV0HQEqiDVEcrSaCPjqVoYyWp4Ktq8a8D6V+TMuLy5QWkH5suF64MtQnfOa2Tnj4n/7MAWTCmo5KeGQQUCCDNP9IZev795mSLEXPGZcto0eVJ4NaWEcTW22W9y5zcr3QjmWLFSM1lwBwhws2+mxi1L1RMYckDlnSaoRLv7y0kNJRxbqbqx1FyO76qRaAiQfc/q4TPBnv8lQdNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAPsSK9YPfnXqp63pswli3QR7MQV1xk403uPFXIZpf4=;
 b=V8rQRYZtS0AbQXp+jLAWgmd+FqQ1IZRu5be4SP1sP94eh6p4nyCp319Kfk+e+odMbrv4cmZpe6LDUIwbUA2GooNB/RVb++bPg0oamQO3AP/Em2TT+GQZrRj+M1vC9auUCCjwq9PgaOzNVH4Hv+6oqaIN3JNVKABr0V2JpiyPKctXdk3lNGst+XWaEu/5wKApdktg4+WYkcmkFpys1FV+bzLdU3MqRht2JRaKYzUH8/8xx/bJXJ3kVZtJ9xZXWj+M+KM9hBrFXW34AI/T9SmuSy0TLoWYoXXfs5QFk+AagpXMLQePQ9yZx9q7N4J6aoZQ6YGYrgCM9/DkScoMTkfC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 13:00:01 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 13:00:01 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 14/15] xfce4-datetime-setter: fix link failure due to missing libxfce4util dependency
Date: Tue, 24 Mar 2026 20:59:26 +0800
Message-Id: <20260324125927.1070644-15-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bcd859-08b3-4a77-449f-08de89a542b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tghPegeE3G1gJMYRjHGqpezCSu2UZWnzhCgcwF0pNJf+esrJDX6CahY9+zM6lEomM/UZoJPr+vUQm3h2P2m461P+7YtQjYLwLy4RuTsGt5Z10c4CMRyC9bhRzAKl+mWBssgwnsPatVCusb1eFBrqjD7gfmnoSbOMhiecyKCtOlgSTDtmVSBPRjp8AVi+JqhxHQ3Cgy0JI2iZ8DR9s8EDNtsSY5XU21EVJHc3MpYPcx8YiJL784JRodzKyGfTPukb/E7LC4jQfsqJ7wz51QxjzMfLkfd7CCp/vBZXd5gn+y6prQ0QVkOTmg6u/XYAv7WqqQro5djoL/M3ln01amEV0NkbB79PwXTcpgX35IOP67U0RVZLHce7eMSyUYFD1FiZxVqJu3JFHzM2zWeHFAguci0Hn/C7ov5oe0Te5gLn/SvS7ocrmMVn3MyB2Kf0PxEgW8/+RToc8DvWMBrUwRG0IR7EZI0wa9m87ioKCCofNHVssVUrf5k6foQDuZb7mgPUkhsJTn8aguPrKjvQYUOU1bwkz114vDsiku/GGRxRtSKba/AnnIa0fks2ge9rdDsV1NOph86arEBxZJbDcJ5xoy7xtzsk/coPF890Ci3XDGhkqNQxMPOPgYLXdF4wvyEy4civOIKH0C1B763kNhkuJhNJXXkDFLqIIl5IG1k3R6lFteRNragvoZKidG16b1nPh1RqSsyDF+SaWNoYoQ2qw20SfLmtGwAfd/40CqZyvdzwazRAj33C6ok9nJbMGTTDvKmKapTwLxQxgiWQDi+MVvcUa37HRCDmebS2deueEFs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TD+DxBatKgB3HHgLwfEMyYHp8PaSvPyM3HHPNBoI7rIhtt0oSMljD8fx22qA?=
 =?us-ascii?Q?qzyWxNAC+fvY9JihvLG5FR80BtW3VRk92AaqDEo6vZi8MU18FgZeZfGMEzJP?=
 =?us-ascii?Q?fvlz48LDSwAkh73PSzs1gsgal+yK4XrlBgq7VMnad6eItsUKPoY885SgIPHq?=
 =?us-ascii?Q?L5JBcY9oKhA4ZLqZF6A834WuIf1U2rZl7jUMpum1cERviHsq84FPOh3ACWRR?=
 =?us-ascii?Q?fvMyxKd3pHKk2Jd2TrXg8Ie7qbRSBwimXOEmYdF/AWVvZZzu0Y6qOpbsHIsN?=
 =?us-ascii?Q?PbufskmPygtVxN2kIh8VR05WKfjOZqx0odICjySCekCYM3l/8r+TiglgXcX3?=
 =?us-ascii?Q?eiCqPxe9qDwVnNzQd3gAvtjV3A2oUMR/dRH0XiOP3X1zu4fSGux6o42yv/UN?=
 =?us-ascii?Q?ybQFlqoqIGsWnnyLpsXbxEzwHpS2u97C26FcOrhf17qN0rEz1cRq7pH31mOx?=
 =?us-ascii?Q?T/sjfzUF0dBpUPahfW0D201PDKDFcJ+eOiMQP/Nmsht3dL52PEssAjbdV4uM?=
 =?us-ascii?Q?Xi5Zky3fINh3rigNJUhUu/M4PRU7akLF6hRDs9kFQT7rCfEFedbvLvy4ez8w?=
 =?us-ascii?Q?mFAdDtJEqCroQV3RglvMhozDuMuOLg2xEKjj1NKzpETUQ+Y5VcCt4tKj8uCB?=
 =?us-ascii?Q?pee8S3YtTSWNYgD3reUMu/Y4LC6b2ErNcL3K7bX1s14Eiubu4a6ypY1oqStp?=
 =?us-ascii?Q?TSFtEUcUMOpHQH2+2uOCyIcqIPS9At+WCkZ1uPee9lYVQ3zRC0jY+SPiBAxo?=
 =?us-ascii?Q?VYIvuPDL56+Fpr+xPdzN3ZzCNYuG1JvElaSQwScOVQV4S4UGX9Fm8Sh4Beke?=
 =?us-ascii?Q?YCOpz5u7xiiQUVn0cSWVBSf42WwU8eFN7YSpW0EHayzhXtpS0GXKv/LAbJ1D?=
 =?us-ascii?Q?bOe7/ERuPqJRpHI1Bs4ZnsbVZAkXq687qbrE2UR2wJJ2gwfoZmH6IHJbUF6P?=
 =?us-ascii?Q?NDUHlzw4Ppc6tTUMdUruMGRzM+8sMzkOh/nMsTEI9s+/9TrAgysxAEoseCXG?=
 =?us-ascii?Q?OBpSg/pXuGbAdey6+i9U+SujBk5C9564W0KIpNzUFEoMFEOrM7E53Gs6M0GM?=
 =?us-ascii?Q?hWZi8w614eJJ86t0MVKcIHzsOelgCVRdovtKQP4zjwIjvrSeOSiALz9L+uQb?=
 =?us-ascii?Q?16jCZb0PZxMwGT9fM/scM464uK5nNI2A5p6AnJ0TI9GRXLveFZHrqaqhoMyC?=
 =?us-ascii?Q?CQFJfKRATFIM2AK94X6MLoFLwGq8P28YNns3IeZ95p0p0osA4SxAJLi5HH/L?=
 =?us-ascii?Q?nsLaAZoINGYZ+UMg+rYg9vL/f8SlLtEC/X2h/rb0oF+MSN0aqI9vN7MCeT/X?=
 =?us-ascii?Q?n2hZZJgglLVEyMNy6FR9XAGnBpwETl0mxCyqeL1m2msWBupduLmp2a7790sj?=
 =?us-ascii?Q?flYDPLN29/11tiIMSjkL1nZBNepmJkCOP7M+bO7J8h5hhW6b94B+Qn5nSWeX?=
 =?us-ascii?Q?TABsB4MGs2QFJkfXoMpagCoRwAGRyf612YMWq1gPSYkxgpSG3ZirR6LzQzw7?=
 =?us-ascii?Q?rVc2Bkkqw1xgwFlaRyisfajPDB3+PeMTQljRAmk8qJqh3Yguy5Exgb1VxGfH?=
 =?us-ascii?Q?HepxTlUFThauvEG7POdlHqHxr7Nk6XXSbxFS9SSIGqZtYwhca/Ekt+8k2qW/?=
 =?us-ascii?Q?hDzNOmAQAWUzDKr+KudhVQaMNg+c+lJtUXuVmSXHFuiIlXlvkGyowpjg0zzM?=
 =?us-ascii?Q?53563V8xDUDao1PVXSlJsfqstDN9NlqcUL13Yj6SX53ao/vyXxMcUUxdc6VA?=
 =?us-ascii?Q?oWPnHV1lPqLIbP2T+9OHkdvThtpOdY8=3D?=
X-Exchange-RoutingPolicyChecked: 
	qtPbpwdZvqoOCVtVqCv2XDEKhhEfDOSKJXSItKApaT2OGhwf/2DHMBy0asMEfS2GAKBz+nUZnFg85Ldasx1c6PbTAOzqt22krOwVbkTUyU9OQalu/sVWxYfA3KrHUr3GZgIr94ihPv1ce6JkTb/c+sNTnJWPz1PFjH7DGDrWOLxI+SFlQer7j3Jb/nCRXoJ/o7ru5nEGMnofyYiAxyj7bI0uORoiYtUkSYm8+j3nR4OGL8p4q7CP3Ad6j06AwqTmwnhU71ZMNFPnqXw7VZjTnAgKKmJ85lM3ErBpoxUB4ighiyuZiISu4uEGhxHEc2otKWGgj8wJ761BbbA8ZAySIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bcd859-08b3-4a77-449f-08de89a542b0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:00:01.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTIfmnUdKZxwN3Z37tV1fKmN5cHxyCjiU0xhKACYZNkznBtaI3C//e1eOR6e8ZcP+j36H+evCz3Pw+un/LfePXc4g+p2N/9LqyRr4MvIA6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX61Bt2WXsUekG
 MfZBrtkNaMrBrkAVx1C8wuzT7mYaeXAFuv6NQX8roKlcLRBWl+6n63aQ3bwU88FK+RzBlk4NCUp
 l6dDPJlhvIB05NtHaLZi8S9SfzWDRS1V7uJsW2oZB5dfaUvnM3A+nfH0A7RXeq2flKJ9aMblXkr
 rLrLI1unI0tee5kNVcRH4U5RS4XXaO/4tTKoBIJtXj3sBXEjD9fS4NzVoDDkwndETY33KmcJHAG
 AlPy3mzI0v0VthJzkk2DMEbxqZdql8JR0BmR3BuDDSt0OVNod2YeMZT/0HK/hBD98VXsR212kod
 n4mLEZr6KmrsaAqhU3f6xLKHyWa+IfX8tbvcSz2jOuOnlSD5RARSbr2c3KkvH6UmAQWnQS+RTeT
 JB7HFHlY4DiFaeyEJggICzGqp0BhKfXXUGLO0kQw9cbQHb7+7l3L1XqiBpurfoKr66xwrhGfz9L
 SqykEJapxJ/Fun1j/ZQ==
X-Proofpoint-ORIG-GUID: rPbXKNc-3JPD-Xz5Vr-MqxUKyBhm5jL8
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c28ad9 cx=c_pps
 a=QHQ/c+VJRs0sJIezHEQ2hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ySDnN6HVMrxVU6y22h0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rPbXKNc-3JPD-Xz5Vr-MqxUKyBhm5jL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125573

From: Zhang Peng <peng.zhang1.cn@windriver.com>

After libxfce4ui upgrade to 4.21.x, its pkgconfig sets
libxfce4util as Requires.private, so the linker no longer
automatically pulls in libxfce4util. This causes an undefined
reference to 'xfce_textdomain' when linking xfce4-datetime-settings.

Add patch for libxfce4util-1.0 and common_deps (gtk+-3.0 etc.) as explicit
dependencies in xfce/meson.build.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...g-direct-dependencies-to-fix-link-fa.patch | 35 +++++++++++++++++++
 .../xfce4-datetime-setter_3.32.2.bb           |  6 ++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch

diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch
new file mode 100644
index 0000000000..c86e418800
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch
@@ -0,0 +1,35 @@
+From 57fc1ba0b433f2f95cd9eb011cf64a4f28b281b4 Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Mon, 23 Mar 2026 16:44:28 +0800
+Subject: [PATCH] build: add missing direct dependencies to fix link failures
+
+xfce/ sources directly call symbols from libxfce4util (xfce_textdomain)
+and gtk+-3.0 (gtk_builder_*, gtk_combo_box_*, gtk_widget_*), but only
+libxfce4ui-2 was listed as a dependency. Since libxfce4ui-2 correctly
+places these in Requires.private, the client must declare its own direct
+dependencies.
+
+Upstream-Status: Submitted [https://github.com/schnitzeltony/xfce4-datetime-setter/pull/4]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ xfce/meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfce/meson.build b/xfce/meson.build
+index 2acab2f..f1386a5 100644
+--- a/xfce/meson.build
++++ b/xfce/meson.build
+@@ -7,8 +7,9 @@ xfce_datetime_c_args = [
+   '-DHAVE_CONFIG_H',
+ ]
+
+-xfce_datetime_deps = [
++xfce_datetime_deps = common_deps + [
+   libxfce4ui_dep,
++  dependency('libxfce4util-1.0'),
+ ]
+
+ resource_data = files(
+--
+2.50.0
diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
index 308da40c34..356c55e47b 100644
--- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 DEPENDS = "glib-2.0-native libxfce4ui"
 
-SRC_URI = "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https;branch=master \
+SRC_URI = "\
+           git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https;branch=master \
            file://fix-inner-dependency.patch \
            file://0001-Fix-build-with-meson-0.61.patch \
-"
+           file://0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch \
+           "
 SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
 
 
-- 
2.34.1


