Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAE9D3E798
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 09:59:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42179.1730887151395306023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 01:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=104095e49d=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A65qBw4003775
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Nov 2024 01:59:11 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjm0qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 01:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJCgqjQLRlMTJeDuXR8lcOjISSPvixmZR06l+N6DYd90HbTxZKHxgg39AxqxCnFw/3EO8H6Rq8/JbOh5kKnQzfCT9BZltrUzjkyZTPKplDTBvQbZxC4SGKxRUfDKWj/E24JTFdLGq5OK9l9rwoInI4CSOVqeGQV8ccZ7oxYWA8+sSEYSeOQso2AieR+iTAU2sv8gXv9Mu8tptjSIeWRLTs34ZtQoa3E18X5CQ8vswN16Jm0wEedCEt782rbai3kuZKrWYo3rZDMN8L38kj/QKkssYoqeOvTP02g3olEUhOntKiR/3Hda/nEXn3QnLCE//m2nAyDJgwh/ojjBYC3Y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvC2z9w2+7apdxtrJkmL4Mh9eDD2oUgb1E6rCTMCMmo=;
 b=qVf22ERP0evktPiUX/M2MpzX8Cczj4ytnffJa7WRE7UxMQxbswN7PzHBC+r+NCTlViLXFgf6CFHIeqq9D5M7ZszXff8C9oqbDGD2pboORP/ouyhNQhJUnfKFjCFVyfvL31xBrjtXEI5bgOcRqOyHuqG9mO8mjzwDsYtbXeBWE12CGV06sAtCmB02+gQp3sWthtLaIDuE1xSGtBUIfLy2S4F+/YeFUIAdw4wCAKN/gI6V7c2Lh24KgsjxurQBm3es7oB7UFdxIpzslEQM7Ko/LAgnSOI/xM0cHqiFgYq00k29FdIX3rge4ay8J1NrqQrvUu15VRFydzLwmSqSOBn2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Wed, 6 Nov
 2024 09:59:07 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 09:59:07 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 1/1] openvpn: fix CVE-2024-28882
Date: Wed,  6 Nov 2024 17:58:48 +0800
Message-ID: <20241106095850.2336534-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.44.1
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f80b1c9-6126-4850-032e-08dcfe49a721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MPCl2wHlAv6l34Z/gZQJT++35oBXhdTUUHMTE+8fj7PSmehtmeOjp+s3iO74?=
 =?us-ascii?Q?23jx4g69OIOwahg3FwCBe4Dfe+O17CEaWMX5PhIICQGzOMbMMhJ5rEwW/oSk?=
 =?us-ascii?Q?crghQGVyF7YhSD/KD8Th31SiA6hjiybciptz/xzZWvfdLa5BdI0/5saqjSq6?=
 =?us-ascii?Q?rtAm2MTCgSdy/rrGd3v1dSgFgSA4EXvpI0LXvvM5b49Cu1vaGjrNhOpeSSBP?=
 =?us-ascii?Q?XaHTOiZkpL9Tij8Jq+TGxpEnt6uFQ4bGJVEOHiHrzcCIG6KEMzmQ2mekZLYx?=
 =?us-ascii?Q?+zmpw9iDOJLQmjaSqGUZvMe1dwon79N4OUIoLpv6hZVra0mw+snJvI4WXFIl?=
 =?us-ascii?Q?gE0dpk7tVnok60JdTkiuLoaDPbm3e8hPPTyyUc/MhPsz6Hc02voVHtLwFg5H?=
 =?us-ascii?Q?/3UOzQMSjcf5Zw1cxsDs5XzGl2bhcwyc9fniNoClxjlgR4BRVhr+ZZtHt5h/?=
 =?us-ascii?Q?Du2x0o8CTuYf2G0NDG/OHWihq2DPyHPThSz3kfWdJRhFPTwQdxH/GJIz25S4?=
 =?us-ascii?Q?lYqOO81mBHFVQE0xBxZWEqGUtaq98xOIDyFj4nxGA/iAuvuzqwodUvDNdslC?=
 =?us-ascii?Q?N3lm33iNiO+yScB1gm5eewlNwEPTbk5EeUvzeL5H3L5A9viJoFKsr21SRQ+T?=
 =?us-ascii?Q?Sb+5L331uZgjl9DsaJZw9ROC0NooC15jRv5G5tvzzVXtz+r/sXwuGh0zcleY?=
 =?us-ascii?Q?WebAIgj66X2XYc6qrC41bNPM6U/xY7NRGt+GTsMHUjV861P3t83Bb9GaMAig?=
 =?us-ascii?Q?CRJkZH/Jj138CCFSHquL7jBkAOu7iWksSbOpZOKYOocVA7WwZDHRMrzcuGE+?=
 =?us-ascii?Q?1jFzRIoQ/ZaAGWWAGg34RSPqf1vLjmJKRgPX/WpHfo2kVEIpFYbiRHCRRt18?=
 =?us-ascii?Q?lRRrWPVbaliZO5ukn4KuWCvyltRRqGmSahskDx1LSLH4TxbsPhOrOjv6+lv4?=
 =?us-ascii?Q?r9gsrTCFMagG6qKQoFN9L5r/Cdybm+rL9d1m3AwwG2qZfGWGjuvtBCfJ2zSe?=
 =?us-ascii?Q?l/IdRcP42KFqVh1AVjamPw1SSLYOmVG0UqDg1BX8aTRFGMjMpBJVX0s0PAe3?=
 =?us-ascii?Q?4UAjq0nGaNDpdF7PAJi9jE1jCHcEtwqiNEuklKwt17s49U//eeGKaIG1Sxnu?=
 =?us-ascii?Q?gHPPJUJB9M5ipAAggHJEdfLcKrkCF31+azmqxa+1Erv/SDWeH6Ty4GApCkmp?=
 =?us-ascii?Q?bRePIw02xh/7JtBTG1wIOV5Fb5Ou4mT3dlCmGzU7A7dIIoyYgov9QkzeBy0i?=
 =?us-ascii?Q?i64rOoSpKJCVe/e9ZAc89gBuTE0fLTKOyPVYPV1ctgGzn0uFgUNfddDvSwNU?=
 =?us-ascii?Q?ef1BJJZZ61rjLQQHtLEDY93f?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rLPDmMDyj/SmfJv+B49+rP7oIcS21bMEerznM94HnrDSRCRspeq2Nja+oDoq?=
 =?us-ascii?Q?oEqhPp+RUKXmUD8KFo0XSnmcCBT5w6YPuro3V3vIPlNIwkuSX1eR8ZM41WXz?=
 =?us-ascii?Q?qG4vOk8zKVNGe4tYLmuDbnz4AjtBYX87+EcQjFZ2QQl54ku4Pkvkxkh0i+8Z?=
 =?us-ascii?Q?HjcRN6Jq50oXnxPueN155GyWFIlJOEmprrM5jQ8RGeIfC9jIar+ptOvgSpV7?=
 =?us-ascii?Q?yhHWgNVfbEtTN88yzkju9BcUe20lB2pYRr4XS+cGkB0HYASqqK0UdgaH1ajo?=
 =?us-ascii?Q?c8yqiSGYJ3uw+ftUEKA7Q9/LWtk5uuUCKqM/NhNUUMgH4BiZJu1sZ3gO34md?=
 =?us-ascii?Q?uoLoZQugbsOjg3LurFV2Zx/VsFckoJue/a6tdKquIL3YdYv0J4mmCwIdKMgK?=
 =?us-ascii?Q?ikJJw6Usw06ADr7JuYhymr5SbrEbWnyLqFqBIfiwpTLmVvY1gsoNK0w8TiQ8?=
 =?us-ascii?Q?kKa0Sk648Qv5o2cb6qedTKohFtVgY6jcBxmh+QFZ54TCsOXjHEuhuhQqkbiu?=
 =?us-ascii?Q?F+gQsrIfbsrutCkZIM0m/o410D1seEGXfnEqAt2LD3AAlUdCSLdUy/j85u0s?=
 =?us-ascii?Q?Th8LCX/N0T3usbXmbXfj0+/YMJAZofnhrsjf/EULvc/Yr0NJuhXBVLosGU0K?=
 =?us-ascii?Q?8IYxWvrOhv7jsowh8H2MaRPao71CtrLGg4iXsSamNFAg2n6VD/cM3vlk1kI7?=
 =?us-ascii?Q?+u86vk2XawOmP87SfVdEDR8krCHHJLDhU2biosHrh0ZfzJJ2I2ktPWHZo4N5?=
 =?us-ascii?Q?RZ/wzVzSv2y7O4nx4gTNlBLgj7kYpCMmIdSeZx+SCr1AGyYjDnPmJAFL3n6E?=
 =?us-ascii?Q?H4yeUHnJFkLh8FvQvEq566THckewtI1ULzCbeYU6qmP/xpOcHCGAe9sjEdjI?=
 =?us-ascii?Q?3a3Tnk1B4tLEt4IbfcYL1WveuXUajQd9Ti2Lzssrcm+qIQseiSEMgUniJ2eW?=
 =?us-ascii?Q?sf6vkv66QfipMxgzOxGEa4bygDGCK6f+FP7k4Uc1xDltCeYhruY+7468ZjWA?=
 =?us-ascii?Q?3iGoUMDw0bVnXBrR0NC+3JeabcMNF3GEiJyrFiwnM+frnZVSXvppIv0m+Gs0?=
 =?us-ascii?Q?ylQzB12EzJDKwnjBoZDloVguSC2T6DX0cOT+S0At0WO1Oep1QCfrtyFH2vf2?=
 =?us-ascii?Q?DEHVlcIKrXTz3LjCIroHdb+4Re/7bxifTq4qSLznL2rL0iMwPIJUru/9B3RD?=
 =?us-ascii?Q?du/53R8oB5ea5ySEC/AKsukiRd9TSOO8rPSqy5TN8qa6sfcNZ40NRSyslbVy?=
 =?us-ascii?Q?X/OMedRfkyVGklRoqxqMW5wspaPFJz+KEuKCjM3k230H5Obq8UlAAfxOBJjO?=
 =?us-ascii?Q?o2P0WoNhXQmc2UIPthVhAF6cdqpNnCRu1JT4bHfGH5SCdbS9sRDqJaiMlvIB?=
 =?us-ascii?Q?eJUi2DcTFgFiAD3MLB8eBmnJD4BrL1Vre3RyilYKIqGftrHrZAW7JQ9+fmq/?=
 =?us-ascii?Q?6Mz1CmWby94vJWI8QxU6HSgUU5TIpX228qCCboL2DACpP60AGhiNbnYT3gOg?=
 =?us-ascii?Q?G7Rq0BdYmIpOxcx2tzNakyOULAuL1CHXgbko3JZSInujW4kw6OKiEWrha9t6?=
 =?us-ascii?Q?whsoxoGvyeqIXx6YlZp9TSVD4yF4uPcW4Pn388pqgChLMAMVubPZqKGvMcy6?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f80b1c9-6126-4850-032e-08dcfe49a721
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 09:59:07.1646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEycvl9iYjUbSFx8tbJvS61fijfVQ6VLPVxV27nBZcLSX86cpSJT07IKxHevt0JkEt+8ReBX4WTt1kfk32Luu0PXBBntJF57M9J6fvudxFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
X-Proofpoint-GUID: _svXNJTDG3fg8agdFvSFahFJlvI0KG8W
X-Authority-Analysis: v=2.4 cv=YvBdRJYX c=1 sm=1 tr=0 ts=672b3dee cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=uDo-SIiEAAAA:8
 a=xeC3QtFAAAAA:8 a=Vt2AcnKqAAAA:8 a=FP58Ms26AAAA:8 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=969rJcwz9Ax0YLQNjREA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=9XEOD9pWidfRTSXZEhnp:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=gPpeecpFUKP6j8iU7U-x:22
X-Proofpoint-ORIG-GUID: _svXNJTDG3fg8agdFvSFahFJlvI0KG8W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411060081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A65qBw4003775
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 09:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113734

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

CVE-2024-28882: OpenVPN in a server role accepts multiple exit
notifications from authenticated clients which will extend the
validity of a closing session

References:
https://community.openvpn.net/openvpn/wiki/CVE-2024-28882

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../openvpn/openvpn/CVE-2024-28882.patch      | 144 ++++++++++++++++++
 .../recipes-support/openvpn/openvpn_2.6.10.bb |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2=
024-28882.patch

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-288=
82.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-28882=
.patch
new file mode 100644
index 000000000000..0b016c89e2f7
--- /dev/null
+++ b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-28882.patc=
h
@@ -0,0 +1,144 @@
+From 6b0859f669729f4fd328d80bc5c7b4dbbdbf0280 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Reynir=3D20Bj=3DC3=3DB6rnsson?=3D <reynir@reynir.dk>
+Date: Thu, 16 May 2024 13:58:08 +0200
+Subject: [PATCH] Only schedule_exit() once
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If an exit has already been scheduled we should not schedule it again.
+Otherwise, the exit signal is never emitted if the peer reschedules the
+exit before the timeout occurs.
+
+schedule_exit() now only takes the context as argument. The signal is
+hard coded to SIGTERM, and the interval is read directly from the
+context options.
+
+Furthermore, schedule_exit() now returns a bool signifying whether an
+exit was scheduled; false if exit is already scheduled. The call sites
+are updated accordingly. A notable difference is that management is only
+notified *once* when an exit is scheduled - we no longer notify
+management on redundant exit.
+
+This patch was assigned a CVE number after already reviewed and ACKed,
+because it was discovered that a misbehaving client can use the (now
+fixed) server behaviour to avoid being disconnected by means of a
+managment interface "client-kill" command - the security issue here is
+"client can circumvent security policy set by management interface".
+
+This only affects previously authenticated clients, and only management
+client-kill, so normal renegotion / AUTH_FAIL ("your session ends") is n=
ot
+affected.
+
+CVE: 2024-28882
+
+Change-Id: I9457f005f4ba970502e6b667d9dc4299a588d661
+Signed-off-by: Reynir Bj=C3=B6rnsson <reynir@reynir.dk>
+Acked-by: Arne Schwabe <arne-openvpn@rfc2549.org>
+Message-Id: <20240516120434.23499-1-gert@greenie.muc.de>
+URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/ms=
g28679.html
+Signed-off-by: Gert Doering <gert@greenie.muc.de>
+
+CVE: CVE-2024-28882
+Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/55b=
b3260c12bae33b6a8eac73cbb6972f8517411]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ src/openvpn/forward.c | 15 +++++++++++----
+ src/openvpn/forward.h |  2 +-
+ src/openvpn/push.c    | 12 +++++++-----
+ 3 files changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/src/openvpn/forward.c b/src/openvpn/forward.c
+index e9811b9c81de..29e812ffd17d 100644
+--- a/src/openvpn/forward.c
++++ b/src/openvpn/forward.c
+@@ -514,17 +514,24 @@ check_server_poll_timeout(struct context *c)
+ }
+=20
+ /*
+- * Schedule a signal n_seconds from now.
++ * Schedule a SIGTERM signal c->options.scheduled_exit_interval seconds=
 from now.
+  */
+-void
+-schedule_exit(struct context *c, const int n_seconds, const int signal)
++bool
++schedule_exit(struct context *c)
+ {
++    const int n_seconds =3D c->options.scheduled_exit_interval;
++    /* don't reschedule if already scheduled. */
++    if (event_timeout_defined(&c->c2.scheduled_exit))
++    {
++        return false;
++    }
+     tls_set_single_session(c->c2.tls_multi);
+     update_time();
+     reset_coarse_timers(c);
+     event_timeout_init(&c->c2.scheduled_exit, n_seconds, now);
+-    c->c2.scheduled_exit_signal =3D signal;
++    c->c2.scheduled_exit_signal =3D SIGTERM;
+     msg(D_SCHED_EXIT, "Delayed exit in %d seconds", n_seconds);
++    return true;
+ }
+=20
+ /*
+diff --git a/src/openvpn/forward.h b/src/openvpn/forward.h
+index 060fc374ca60..245a80292112 100644
+--- a/src/openvpn/forward.h
++++ b/src/openvpn/forward.h
+@@ -302,7 +302,7 @@ void reschedule_multi_process(struct context *c);
+=20
+ void process_ip_header(struct context *c, unsigned int flags, struct bu=
ffer *buf);
+=20
+-void schedule_exit(struct context *c, const int n_seconds, const int si=
gnal);
++bool schedule_exit(struct context *c);
+=20
+ static inline struct link_socket_info *
+ get_link_socket_info(struct context *c)
+diff --git a/src/openvpn/push.c b/src/openvpn/push.c
+index 1b406b9c5311..d220eeb97442 100644
+--- a/src/openvpn/push.c
++++ b/src/openvpn/push.c
+@@ -204,7 +204,11 @@ receive_exit_message(struct context *c)
+      * */
+     if (c->options.mode =3D=3D MODE_SERVER)
+     {
+-        schedule_exit(c, c->options.scheduled_exit_interval, SIGTERM);
++        if (!schedule_exit(c))
++        {
++            /* Return early when we don't need to notify management */
++            return;
++        }
+     }
+     else
+     {
+@@ -391,7 +395,7 @@ __attribute__ ((format(__printf__, 4, 5)))
+ void
+ send_auth_failed(struct context *c, const char *client_reason)
+ {
+-    if (event_timeout_defined(&c->c2.scheduled_exit))
++    if (!schedule_exit(c))
+     {
+         msg(D_TLS_DEBUG, "exit already scheduled for context");
+         return;
+@@ -401,8 +405,6 @@ send_auth_failed(struct context *c, const char *clie=
nt_reason)
+     static const char auth_failed[] =3D "AUTH_FAILED";
+     size_t len;
+=20
+-    schedule_exit(c, c->options.scheduled_exit_interval, SIGTERM);
+-
+     len =3D (client_reason ? strlen(client_reason)+1 : 0) + sizeof(auth=
_failed);
+     if (len > PUSH_BUNDLE_SIZE)
+     {
+@@ -492,7 +494,7 @@ send_auth_pending_messages(struct tls_multi *tls_mul=
ti,
+ void
+ send_restart(struct context *c, const char *kill_msg)
+ {
+-    schedule_exit(c, c->options.scheduled_exit_interval, SIGTERM);
++    schedule_exit(c);
+     send_control_channel_string(c, kill_msg ? kill_msg : "RESTART", D_P=
USH);
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb b/=
meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
index f8de78ff74fd..9b551d3ca27e 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
@@ -10,6 +10,7 @@ inherit autotools systemd update-rc.d pkgconfig
 SRC_URI =3D "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz=
 \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-ve=
rsi.patch \
            file://openvpn \
+           file://CVE-2024-28882.patch \
           "
=20
 UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"
--=20
2.34.1


