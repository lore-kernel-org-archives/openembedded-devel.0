Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB2DFF4952
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 06:32:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45266.1774852323742067809
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 23:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H3kzeA19;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8549bf16ac=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5efuZ411066
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:32:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=z0ekAY0brwJX6qt1jcn/ruK+awHnlB0H08nh1lPw5L0=; b=H3kzeA19ttlu
	MuFq1+XsbTn71NCOefjBI/QitiFOV0mUcMTefgAan40h5YZXc9ctLgfhssh2gRbR
	0m6S15IQjk6G6r0N6PX2/CGRazO0KiHKG/B5ehI5BB/r8VoLXCB9uTCdPQ4bGM85
	/tqpv8m+QKs+5V9IiCwmDOYUxfrhFxdBY/ZLHAbvhafE0s9EDNupZWlvEv1qctYF
	XkJWwLeiidR8Iq+GyXvSU2XnKP5JnNPOsYYOkqH2ZMP0toJDlR9BLKkLe1kLI8U2
	j6h3XldegnkR9Mnk9NFkn28/jaP8WG8ap3xbxOftwe1KkVzSMplsdqR641OiexNI
	bunc7NuRuQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egbsbcj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNrMjszWHFOSAnx7K3xXR6V4zg4Ixiv4wZ1+BvnBB1uNBjTTBv6JSa+/+IFagse0d2qD8CKSw7PVkvmFCRon2juI1Q9EmQGa/RP9sBa2w4EldAzq7V6ien/1/jsSRYWrD6U7xetW1szHl9Z8XrpxziVmLS6a34/6wQHQJTTq8DX6RWd+IFWIxYqksyVHTcuJqTp6AA/wDFnw1aT4Y/uXdFFv8Uyl9Xbv86yRSTqatEm5Lqd8l3uN8sOHcSM0fFNtXJGkKVHQNOOHZEkgSzbJDbTltiw71UydCPYJatyzQoCtB0d0fmuAkgbN5bykEPDbLUWMpNpJoe3zZjMyf9V4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0ekAY0brwJX6qt1jcn/ruK+awHnlB0H08nh1lPw5L0=;
 b=Fsh77UGBnKkSek1QJMC6ETomuIF3WesKKzff4UGDOC56CmnDPMswFtzzGLYoAu0HHMj973y4qtQ5xEkvZF53jLepyBqeJTrKehV5qQumHctxK+EAF1KH94nzoMlFqqPJSaV4BXhSzi1P7kX3dzEoHu5saQcrH+8bnwvsA1ksVZPwDl0TMRxB/dwkI/m5DUKBCA+ZVxc6WdcsgeWgIg4SjXJG3VAVR8xG2L9onHYv68mru0DGcfr9G9y7qXPNtRAOhp/TRVPGtn5HeZMhnchR/S13eb5tDGyQHX3GUgBreBZucNBT8JBT2/mbqkF1rMH1v8TXwBVu7gIkBgjrFtA+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Mon, 30 Mar
 2026 06:32:00 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 06:32:00 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] surf: upgrade to latest commit
Date: Mon, 30 Mar 2026 14:31:43 +0800
Message-Id: <20260330063145.94013-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330063145.94013-1-changqing.li@windriver.com>
References: <20260330063145.94013-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0181.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 1618de9a-4612-49fa-327a-08de8e260c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	oASJ3d90b6H5uEsxY5nQj5kt9ygpnH+ug/0a7SynWqnPkqDeHp2p50zvzNUEAvxqSGLTbCQloGLwcKsyLvUhipo/DcDQWwuOQLHB6HOJb9GPPHJpUk4JK4vMNsIlC5Qu8YxaPLlS4pfUAFTeUf5A3mD4CPJcSyY3ZfG57Vg2GgAMe8t82eDTLypim1p8RZpzm9rFUESkQhN6bfmRavg9BnrAG/Hwu7o0HVAwZtYXwWGpZJzFxahfqEwSJwyOg7GVfG5CkLjoh77kXvbhWDZ25Tfvk0/SupONEp6Tj4lymrnVovHKD1yyqPCNtupL8VfAXTmvGCwpi1VvPp02168wGUP5q3CyVJ16WwSper+bhG4kOI/sVX5QMz0qrgWg7SognqJ3Ug0BtPC0GeSEiYujx4XBVtd5lOanBXXCC5ANnOVpz1iGCkFdOSFbk5hh3vnr1MwH9hZi9J5JG0Qxf7CojtLezjIwl/IiNSJcwqLH84/vAwPXHKsIZo+2MRmbDpYPvL2ANf34gqfcrJtQmYrTbROvco+8ItaJMabSY5n8rKvvDK3lHDydQ7yGswrTHqwdiNbZNfiZAxATRrfpQ8LmW4JRg3VMdVMomoFfRx6yj54psOi60khmNQkP3UyqOpMLkZFwBaSC901A12EQEtpgq3VTasHZiRf5UwlbIMYY2Ys4ZRtu6aOJTFnqLMc5KnECvKP8IxjZqS+DENwWMGhOWBRPT3wd9Isdt6/crQzZIBU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P7XdmvcZOIbGPqD3iXLwk4F5YBC6G//wJB5d4HVSg/HlHAntk1pnQ6UiGN5O?=
 =?us-ascii?Q?4FXe6Yvzd5RKgoVZbH8HrujIL4CUpK169iTPrlON0Tel95EIbpykmelEgL+0?=
 =?us-ascii?Q?DX2BY3kWBkfKe0TIb0+hh9po0MDQ+L9+F9xpfiQas1GeJaHyhAm9LTtMRtzk?=
 =?us-ascii?Q?P73YpvNH12RHh+HJZjqqnpAJzCp93gljml0kXjCWkqkICmscHwQNpbEk+Okf?=
 =?us-ascii?Q?WtxYNXw2gJGRdwYHSbDQZzjGtrlzdA6NdjIV0acw4tLEo/k1tDTG9b0Vv0FK?=
 =?us-ascii?Q?XWy0ljk1H9Fywh/RavuoUcJ2noBe6NGGMxp9D8UAYKhqASOTwJp8HFQAy4dY?=
 =?us-ascii?Q?rEJSHIRIGdmM6V1xgXX/lEB0Z2Hj3554dWPFdTTOAyn1gFY3PGr4ldIpDPxX?=
 =?us-ascii?Q?UrJhknVovOAwXshQUBuxIeR7VxF4MK6ensGtyOjWk+s/QQZVYGaod0oJM4xq?=
 =?us-ascii?Q?D5iIxI0DUCtpGkvBueEE9pAmJF8CLV6upKEWScPNM5V1C8vEuKFtLLifIoo1?=
 =?us-ascii?Q?kT008Um+uyw+XrJhvyg1F+snyeNEGctMDqqMajgDkpIsxBkNY8AcHg1ceWvw?=
 =?us-ascii?Q?T/Pl7efugAH1Y5NNUcXfRMwLlaXygeSV/aGrQXI/sZHuE9KaOnh8Do1SiwyW?=
 =?us-ascii?Q?pgYeZZERArJtDF/pMbNRu9A2rQlKNIeeMu9Q+F3FwLSTDpCTYFxQvebyxJce?=
 =?us-ascii?Q?LilAdkxHiS8yr7ttcmFtDujkMoKQpN/pJ1zK/aaHsUEa9c4RgL/ZHc4cHsJG?=
 =?us-ascii?Q?MDfAN5zP9ew2A3+LGCoBsKk5NXpayf7Ygi62gJptV3bkrXwLnwnR+DuJhWOd?=
 =?us-ascii?Q?f0KN5BLMc5hNOrdKnckzMN1dIwAhj6irtgh8ECyXEBB4/2ujov/98vbwJOPH?=
 =?us-ascii?Q?TPYB9NRFsAQTqBhP+2+xmqNgUpUyD5DLD0hVb4mQ2RsG92S99WbVU1XssLdR?=
 =?us-ascii?Q?Xbz/YDFycwwWa4bDvuPikd5ngfCCUz6a2PgvHgfJTRTIAzb8rxg6Z8DmxoVm?=
 =?us-ascii?Q?ZEKiyUOKo5vQdQD5oFT2WiyQBIQGMZqOAjHb8KnD3BWsxGW5CnYzE1PBzqnL?=
 =?us-ascii?Q?GQmol2VpFzABlJjbaZrwz9cK3dmuquGVed9+hyUkd3br3UUTL5EcBmsnKRVz?=
 =?us-ascii?Q?7q55XaaYBS+X56OEkHC0RexOtSldAO5Lga7Kzoo3LJCn3WZN6q4eEikMzrcs?=
 =?us-ascii?Q?mTaT28zEb1w+tVboG9itdxq39nTa92NG4z+WHRMv5EnX4fAlcoZDb6NHIwTC?=
 =?us-ascii?Q?kjLeUL5RWBsrGRMLmQD/6DL23yZ6UxHOCKW2+mr6Sa/txFmV5LgCKH19cdyt?=
 =?us-ascii?Q?TpjB8ta2I3IWkukzlReTz76FQEw8NaZz9Qa1ZDC3mA+9kcp6i6pYI6dqag4T?=
 =?us-ascii?Q?axgSZXcSBOfvbeIyRx5fzdGCwHgNAbAKBEqzUWWib5olJxJNg+3nWL6AnCza?=
 =?us-ascii?Q?9xhJZ7q8NU+oPXbz1XElHj7UGJMdgtrefxqvXScxBlsdOx9Fb8+qGz8M4Ytp?=
 =?us-ascii?Q?/NZoBOmxau1ps+47SB9R+maQLy1HdTGBNll3/vSmEyKogf0g7czNuDbRhaPP?=
 =?us-ascii?Q?kttDkH3/HYVXm0+652oJHJchH4vg2vKRJ0L5SAMh+QeFlAblR4ScdDe4NTCh?=
 =?us-ascii?Q?Z/p0sjCmJPdaOl4x8D49nbNGO0oPpHaUu1J9360nTG45p89/Cm7yhicZe5ZQ?=
 =?us-ascii?Q?xiD8+Yc1i36wfQwcOdMHM2+AW/LV88lDHt4s0koMg8rfsOBKJCDHtjYTAn3u?=
 =?us-ascii?Q?x9Gye8Sk1vRXGlVezV/wB09T2pjqaxc=3D?=
X-Exchange-RoutingPolicyChecked: 
	SkEgOPVGur4+KF52pTrRTM3c/ZXSXLrpgtOvD9H0Cp1dJf8QAH7QN/xl6a+cYhetrwRb//IVpmzsZEbUjq1hacy7sNSXU31H51pev/wLRcOw0JrUEfC04Z2/ulGtNx/W0M++ryhVai2b7WBbnStDrq+xm9SXFkPdnKN2JpuTpuwo77AmL+U4bQ4mC8zk0HcoO6D/dfGZi5Kjrx92nFLWAyEaEs/7MH+1uKMZZl0CdHm/xjfQ/zrXS2FOs6Wr0s/7YX2SJ1FAEXFCgdL2fOh1YxOyBphQB861yzhy1gmHFqfLbKISKytHv5KjeVrCXKfMdTYTEmCOD3/uCYzdamRtsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1618de9a-4612-49fa-327a-08de8e260c9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:32:00.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huqrijAI/0njAbkcQwP0Jw29LMfWwMhh8iXeBPOTOeedvPmzWUsnwQgmxoPAioiAinjtGYyiLOVjdRn4sy81KbHUYVUDnrcspfEt+YbHt4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0OSBTYWx0ZWRfX8XshVhl5f1Xx
 ukEoT3cDsY/mYEIBUG51CzGFkd8xhjlHUstIQNO4pbEYCYM0rVN5/mrnDJ0vdfm4IdKm4jafnTH
 Kz5uyYPNKu6QAYH8ylK0rRZltpyt7IGpQeTIucVpFwrcvQi2m07/JD29ucb/yHcFLwqvEheZo4y
 oqqmoQ/KDZkS9uOGDFPfkhe81llr+Lyxs3WEgefMGkrwuNRaMXIX0RIWSXsDS+S2zzr7ob3Hp5m
 tGmR0CESl/XjMEwLtk0SCwwbP1beh1VuRhmYkwLZ3sbydgRrzqKteV4czhQUzC8O9SO0D0KhRu8
 PSs1WLWRi6NE2+L0FIYmiwuQD0lcrjt3N4ObYDx5c8DV6SfO/g/nkdAnUgh7YHpv3L3EZFlhXm9
 5ztlzWJ2gv8BUNzDTgEKPjRhVDyIkyW3fkAaKa1jws4VbROg5JR88zXVUFGy7d/jlXiLQ1j/ylk
 h091XpP67g4BDrdxxVA==
X-Proofpoint-ORIG-GUID: J-0QclSdUEWtZrijJzVbQYRW6juNk3KT
X-Proofpoint-GUID: J-0QclSdUEWtZrijJzVbQYRW6juNk3KT
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69ca18e3 cx=c_pps
 a=eZ5Ua+8tQ3RPWrQJUiaIvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=I1_ynHwpAAAA:8
 a=t7CeM3EgAAAA:8 a=JTETGA26Yv_lStVd6rAA:9 a=Q6MEtcudlToozrQ1I-fC:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 06:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125829

* upgrade to latest commit
* latest commit support soup3 by default, refer [1]

[1] https://git.suckless.org/surf/commit/7f1156f9b0977a72e523e031cf67a4946cfee9b2.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ake-compatible-with-webkitgtk-2.34.0.patch | 42 -------------------
 meta-oe/recipes-graphics/surf/surf_2.1.bb     | 12 +-----
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch

diff --git a/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch b/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
deleted file mode 100644
index d273d1459f..0000000000
--- a/meta-oe/recipes-graphics/surf/surf/0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0cd38e6dbcaff7eef39fd46a60ff8a47e5f488c4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 3 Oct 2021 23:08:48 +0200
-Subject: [PATCH] config.ml: make compatible with webkitgtk 2.34.0
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
-Upstream-Status: Pending
-
- config.mk | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
---- a/config.mk
-+++ b/config.mk
-@@ -2,6 +2,7 @@
- VERSION = 2.1
- 
- # Customize below to fit your system
-+PKG_CONFIG ?= pkg-config
- 
- # paths
- PREFIX = /usr/local
-@@ -9,13 +10,13 @@ MANPREFIX = $(PREFIX)/share/man
- LIBPREFIX = $(PREFIX)/lib
- LIBDIR = $(LIBPREFIX)/surf
- 
--X11INC = `pkg-config --cflags x11`
--X11LIB = `pkg-config --libs x11`
-+X11INC = $(shell $(PKG_CONFIG) --cflags x11)
-+X11LIB = $(shell $(PKG_CONFIG) --libs x11)
- 
--GTKINC = `pkg-config --cflags gtk+-3.0 gcr-3 webkit2gtk-4.0`
--GTKLIB = `pkg-config --libs gtk+-3.0 gcr-3 webkit2gtk-4.0`
--WEBEXTINC = `pkg-config --cflags webkit2gtk-4.0 webkit2gtk-web-extension-4.0 gio-2.0`
--WEBEXTLIBS = `pkg-config --libs webkit2gtk-4.0 webkit2gtk-web-extension-4.0 gio-2.0`
-+GTKINC = $(shell $(PKG_CONFIG) --cflags gtk+-3.0 gcr-3 webkit2gtk-4.1)
-+GTKLIB = $(shell $(PKG_CONFIG) --libs gtk+-3.0 gcr-3 webkit2gtk-4.1)
-+WEBEXTINC = $(shell $(PKG_CONFIG) --cflags webkit2gtk-4.1 webkit2gtk-web-extension-4.1 gio-2.0)
-+WEBEXTLIBS = $(shell $(PKG_CONFIG) --libs webkit2gtk-4.1 webkit2gtk-web-extension-4.1 gio-2.0)
- 
- # includes and libs
- INCS = $(X11INC) $(GTKINC)
diff --git a/meta-oe/recipes-graphics/surf/surf_2.1.bb b/meta-oe/recipes-graphics/surf/surf_2.1.bb
index 258c78e509..6da7a0d93e 100644
--- a/meta-oe/recipes-graphics/surf/surf_2.1.bb
+++ b/meta-oe/recipes-graphics/surf/surf_2.1.bb
@@ -9,20 +9,12 @@ DEPENDS = "webkitgtk3 gtk+3 glib-2.0 gcr3"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRCREV = "665a709b522a6fa18c671f1fc41297603292d0e8"
+SRCREV = "48517e586cdc98bc1af7115674b554cc70c8bc2e"
 SRC_URI = "git://git.suckless.org/surf;branch=surf-webkit2 \
+           file://0001-config.mk-Fix-compiler-and-linker.patch \
            "
-SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'soup3', 'file://0001-config.mk-Fix-compiler-and-linker.patch file://0001-config.ml-make-compatible-with-webkitgtk-2.34.0.patch', '', d)}"
-
-
 inherit pkgconfig features_check
 
-PACKAGECONFIG_SOUP ?= "soup3"
-PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
-
-PACKAGECONFIG[soup2] = ",,,"
-PACKAGECONFIG[soup3] = ",,,"
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install () {
-- 
2.34.1


