Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE52ACD98C5
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 19:30:32 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115199.1781465423488670600
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2026 12:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=YbWY37o5;
 spf=pass (domain: navimatix.de, ip: 52.101.84.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wri/NdIhuk2q5orf5aY1rbUvhHl3IJLG5cGKELmv/YAlxUJXr+s9zRA3N6pwGscrxGb4HOlMKF/BBw+XNUUsffgRUF4s6SEKLGWtp2kj07Jq/tpuiM5o+p9YL5HRuD4ofG/+btTJV0rlza7LK5BwCQ6plA54Mkyss8wZeAetLGuDUCxd585DiGtx/lA16Hk2fl4h4N9e8OPbLFUIN624D2oIpyv1fi4dRPaRaGjFOLaltWpwLj8QcMPuMH5iWENC1Ud0API4AL+ZjJIlRPXLCGdfi76aoH9RlvotIVSV6D+dr/irIFXi12ZIUUoJYNCsWsfgdUIvLOcqGyttO7uM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvw6fs6yTV1BHGW7OAksRQHEgJa+VyxbsPAlFOO5kiE=;
 b=Ojzxitw5SBVyveIADp9/FK2KYBnoVt8ivkkgtVKvZ/tvGO6Nd0IlnVMMcDBx8j9cZjeIuueYqAz+GJV27DlnsK5VUTksem1j6DHulJR3psGnKGbTUwD1sAwUTCnEd1D43a+STNNZ/0Q7ajCTxSkbZKihmFt8YWWSC7tyneDPWWaeBuX6gbK5NYSf8ZJSAw6xqbkumrLCTZRVLP9Tp2dTjdDRBH/yzKDK2qfzA3fVEd35GVUwRlW65TfcBKEeBO9+PvAxqi0PkAtX588/CjycZi5RHsxZUBbWsri4apTVCIY6c84RCA8MewT76y7qu0eNSmMbJoHv+PLL7J0ev/phvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvw6fs6yTV1BHGW7OAksRQHEgJa+VyxbsPAlFOO5kiE=;
 b=YbWY37o5bwHhV99shwoorr+AHmxmoUzc/C/OMAg+RaaQquo8eaBchKzvns/3a1goyDomxEh/h3RpcnTbAHYroF/Exh+suKLiEHW3tBFwQGbFXVeRnOELbn/JAegps/bQwFytbyZyii80E+t2vfSLvgCtszwAvGcy3LzorqwOWlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU4PR01MB12486.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:61a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Sun, 14 Jun
 2026 19:30:20 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0113.015; Sun, 14 Jun 2026 19:30:20 +0000
Date: Sun, 14 Jun 2026 21:30:19 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] fuzzytail: New "tail replacement written in Rust" v0.2.3
Message-ID: <4bfa3c3194654d31dde019513f479e39ebd90f5d.1781465416.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <a8c5ccade0dc925a019e50b6309b554afc318b33.1781465416.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a8c5ccade0dc925a019e50b6309b554afc318b33.1781465416.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU4PR01MB12486:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1613b8-6d55-47e9-7ae5-08deca4b5f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|3023799007|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fn9pg1PRVNDV7KwPHtno+YAXFbgXZaPkrP7GcKqVVtgPnMj4J/MQ5wyaQr2k0F8tvi8s2P6/dQAHSHow6Bsvv/lzLtBZyJLiawOyJJVNkv2ePNhmuF47Ubj0N2sbNORVoA/kluz9mxXOeRIZ/XxCJ4FE+2SDekBVHUjB5Ded27o7trI6tysUn0LI0acbhtT6fhR+4AnFZmpDvR5G58WkjusLUl1o2p5Hr3eAU9THN+Pll/ecAVyt59rwM6My4ZWLytdR1b67OJ2nkLGSoUZYthF3DFD3KR1GVOweYPSa2OOWguDRkxBvFR9lkhYxCLD37arVevmcrfxNeRAhapDX7xPqp50uxVLYEQcL1J7BBxgLlxnQw2gbWXmGd+rOo4VIli2W0mE/boqEOPiSNOV4u8M9A8WMicJBIf1ZwpjQpxMGM1lE7teobrtykDBQ0WfWA/l5M4RZyqcYO5Ek3FVv18Kz51S/IWKmAiDL9jPLF0KTUqCXRU1cx37Tyfb6fVLGodnhTwLz45aEjvkdhEYj+d0tNxvCiKQnQshJBn+nE8rHPR3dJU772sMRZh91ano7/kejzQdg4q/bbwXmkzmdtlA8vd2i2CWQfAe3wu/jN1Qkcu8tK43UCnKzBNmLBiivePZr+eCj2u2sPi7doJiOwkOr/QvZxb3GHwaU5wpUnGrCBpBXOUp7Qho7axmiSr1oBiH9U5e+Tj4RfiODqAPHoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7dfJbZ0B8cU5OUAlPEfXYLuX4iEB5FK+AW/wYHpHCKwxw0QspmbpLGYs1lkR?=
 =?us-ascii?Q?T40Edc/JuD1FjqZJh+PDTfPZOENgXHTcPf7TZLLZ/Ys622Meyle3MRQ4UUNl?=
 =?us-ascii?Q?OSwzQHED+cCqiVd1giiMrCH4Vt10gT/dl1sVgtM17hQf9TVVV+WN5cyAbEYg?=
 =?us-ascii?Q?pH6ptwPbc4GNJvkRTimS1H9GHCQQCmgakUWOuL6r3FFUnPtASiH3+l+aGFoL?=
 =?us-ascii?Q?cb7V8JdGoVwAfEn/gw5B/1fu0+i+WC4gONedAm9oEmBey2yah6HJPBVV3Q3t?=
 =?us-ascii?Q?FeAwkYwbJW3X/0rQPB0g8Sb3s05UY1yn2jBRHkDmNX4LMqdCJkPid0DV0Fq+?=
 =?us-ascii?Q?qgBgZS+9B4eKYDspswYBEgaQNkeUrR17atQWMPXdIap86+ijZcu9YbzCmjgv?=
 =?us-ascii?Q?oCw1rlYoRAyFFqRkDA4lZisCEqI8rwcyU/lz/xkqKouYvlkZuaG9Tu0uv8Be?=
 =?us-ascii?Q?DTkzd+XITJc9rZksPbgIRrieMh3Ep0cvJJiubq/8qB9zDvkn7LOFSOEleaz4?=
 =?us-ascii?Q?9WCS3s5jYwEN6c4POfuPVGHv8OX2ADe7K2PdpMYH3ZmsfC7DwBJaW13eLYl3?=
 =?us-ascii?Q?i/0YEYIWckMh/9++tQCCLaRuveDhHnFjAclaZA2mmLfHpUXMkhAs92xNjda/?=
 =?us-ascii?Q?UbpShd4mOjbx5Wvie9MmX9ofWa8XN8UlwJnTb6ik/4nzJdBdvLO/BxqcFBOC?=
 =?us-ascii?Q?pW88nl8sAw8pqeOl7CERa93vBjmnp8wqrg1VgS/09i3n1MrlN564urAFTSW8?=
 =?us-ascii?Q?bTtkiu1IzADwWLOqg4KZ2LhSI2U+RKzdnOP6Qgi2X81+zcN+jTXOfaW2wcp+?=
 =?us-ascii?Q?Hk2T1GPzNedujO5UQR9AMQHmJ5ODAX+UNA12PabNmXNoOP7VD3Ay1esUxRV1?=
 =?us-ascii?Q?k4ljyO3hJ8GKR+Bf0prqQGLBmXJzEZTnnmoGC5p3x3A1hl3gwhlREoMQ7aJH?=
 =?us-ascii?Q?o8F2mtMenRM/C+Rk8p0OplWTgICZBGj+u9sCOoPxbob094hEFZDT9TB4qxdF?=
 =?us-ascii?Q?3ingAvSsrc/K8zDpNpIn90YFgHJC91nwhAkBmx/yRQIkWNY12EnkSkENK2sm?=
 =?us-ascii?Q?pzqx5aiz3FXxIcmNVizid0eEEE2e/AmuDgmc+sI9o9rDbTWs2uj6zrdlCTYu?=
 =?us-ascii?Q?R2tPnCxN27l2fH8VVhVPPh13LbrdRp8/Vh4xZy+OFxBExQqb2uotYCzh5AkL?=
 =?us-ascii?Q?4S2BDe6TnuLP5D4/N0LLO3tBCpABWk4syhrkNu+2XFpC6sfkZMPdrHDHH/Aa?=
 =?us-ascii?Q?6lCp+H318DjIfqk9xfFz4B1m3ZpCsZ0Z4aJPjzKdj0eO1+cZMYVK6bFW20gJ?=
 =?us-ascii?Q?CJYpMNIbEx8vBrlx/uSMcwoqdoL/9Bode8/rLvfD/N/FPL6NW7JC98K+P0AV?=
 =?us-ascii?Q?DtTu00OKGLYnDGWPjEd97EdZlgd3W5/sQXyr9OIcQ9cvK+ZzP5tQCiRdnBhJ?=
 =?us-ascii?Q?w4pwWL2dG4h2mPDixcWu8zONzqcTh/FDjPDXUCClsVciDcUFpIIwlX7fc1OX?=
 =?us-ascii?Q?9RuyYGrbUdQUP6hCJ3PnxXvaqx19S3W4i3XABsBRpuJvKc+BTq9QMkTRH/aM?=
 =?us-ascii?Q?9Uj9t1KcyUA2QlABU9TrKzo0BKG0+7DX+tYRQO0VMXQ9MC/KtvhxeAg6hn/2?=
 =?us-ascii?Q?sYjOT54pvptzrvAj2/W3KhLOLjeIk7tCtGcVWysS0x6slsqNb0t+W8iea6uh?=
 =?us-ascii?Q?YrxcO7V/8wleozqev0AgWRlOqxSBA7xJ3avaxgqqzT20Vg0sa6F6Fi7EsS/z?=
 =?us-ascii?Q?2PkRaXYWf1uG6g067gKo9Pz79SZxDD4=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1613b8-6d55-47e9-7ae5-08deca4b5f7c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2026 19:30:20.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iah2LHq0mywOsdu5x+bpG+iDJWiOK2BI2l5SP0Zq/wA3Neq06bPiEXJHCcgYKYahVGEWh/qHQ5pqUbkTxsqA/cJcgK7g9/fPKxwYMXwkoN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR01MB12486
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2026 19:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127577

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../fuzzytail/fuzzytail-crates.inc            | 304 ++++++++++++++++++
 .../fuzzytail/fuzzytail_0.2.3.bb              |  22 ++
 2 files changed, 326 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fuzzytail/fuzzytail-crates.inc
 create mode 100644 meta-oe/recipes-extended/fuzzytail/fuzzytail_0.2.3.bb

diff --git a/meta-oe/recipes-extended/fuzzytail/fuzzytail-crates.inc b/meta=
-oe/recipes-extended/fuzzytail/fuzzytail-crates.inc
new file mode 100644
index 0000000000..4166325e06
--- /dev/null
+++ b/meta-oe/recipes-extended/fuzzytail/fuzzytail-crates.inc
@@ -0,0 +1,304 @@
+# Autogenerated with 'bitbake -c update_crates fuzzytail'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/1.1.3 \
+    crate://crates.io/android-tzdata/0.1.1 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anstream/0.6.20 \
+    crate://crates.io/anstyle/1.0.11 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.4 \
+    crate://crates.io/anstyle-wincon/3.0.10 \
+    crate://crates.io/anyhow/1.0.99 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.9.2 \
+    crate://crates.io/block2/0.6.2 \
+    crate://crates.io/bumpalo/3.19.0 \
+    crate://crates.io/cc/1.2.33 \
+    crate://crates.io/cfg-if/1.0.3 \
+    crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/chrono/0.4.41 \
+    crate://crates.io/clap/4.5.45 \
+    crate://crates.io/clap_builder/4.5.44 \
+    crate://crates.io/clap_derive/4.5.45 \
+    crate://crates.io/clap_lex/0.7.5 \
+    crate://crates.io/colorchoice/1.0.4 \
+    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/crossbeam-channel/0.5.15 \
+    crate://crates.io/crossbeam-utils/0.8.21 \
+    crate://crates.io/crossterm/0.28.1 \
+    crate://crates.io/crossterm_winapi/0.9.1 \
+    crate://crates.io/ctrlc/3.5.2 \
+    crate://crates.io/dirs/5.0.1 \
+    crate://crates.io/dirs-sys/0.4.1 \
+    crate://crates.io/dispatch2/0.3.0 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.13 \
+    crate://crates.io/filetime/0.2.26 \
+    crate://crates.io/fsevent-sys/4.1.0 \
+    crate://crates.io/getrandom/0.2.16 \
+    crate://crates.io/hashbrown/0.15.5 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/hermit-abi/0.5.2 \
+    crate://crates.io/iana-time-zone/0.1.63 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/indexmap/2.10.0 \
+    crate://crates.io/inotify/0.9.6 \
+    crate://crates.io/inotify-sys/0.1.5 \
+    crate://crates.io/is-terminal/0.4.16 \
+    crate://crates.io/is_terminal_polyfill/1.70.1 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/js-sys/0.3.77 \
+    crate://crates.io/kqueue/1.1.1 \
+    crate://crates.io/kqueue-sys/1.0.4 \
+    crate://crates.io/libc/0.2.180 \
+    crate://crates.io/libredox/0.1.9 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
+    crate://crates.io/lock_api/0.4.13 \
+    crate://crates.io/log/0.4.27 \
+    crate://crates.io/memchr/2.7.5 \
+    crate://crates.io/mio/0.8.11 \
+    crate://crates.io/mio/1.0.4 \
+    crate://crates.io/nix/0.31.1 \
+    crate://crates.io/notify/6.1.1 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/objc2/0.6.3 \
+    crate://crates.io/objc2-encode/4.1.0 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.1 \
+    crate://crates.io/option-ext/0.2.0 \
+    crate://crates.io/parking_lot/0.12.4 \
+    crate://crates.io/parking_lot_core/0.9.11 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/redox_syscall/0.5.17 \
+    crate://crates.io/redox_users/0.4.6 \
+    crate://crates.io/regex/1.11.1 \
+    crate://crates.io/regex-automata/0.4.9 \
+    crate://crates.io/regex-syntax/0.8.5 \
+    crate://crates.io/rustix/0.38.44 \
+    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/serde/1.0.219 \
+    crate://crates.io/serde_derive/1.0.219 \
+    crate://crates.io/serde_json/1.0.143 \
+    crate://crates.io/serde_spanned/0.6.9 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/signal-hook/0.3.18 \
+    crate://crates.io/signal-hook-mio/0.2.4 \
+    crate://crates.io/signal-hook-registry/1.4.6 \
+    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/syn/2.0.106 \
+    crate://crates.io/thiserror/1.0.69 \
+    crate://crates.io/thiserror-impl/1.0.69 \
+    crate://crates.io/toml/0.8.23 \
+    crate://crates.io/toml_datetime/0.6.11 \
+    crate://crates.io/toml_edit/0.22.27 \
+    crate://crates.io/toml_write/0.1.2 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/walkdir/2.5.0 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen/0.2.100 \
+    crate://crates.io/wasm-bindgen-backend/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro/0.2.100 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
+    crate://crates.io/wasm-bindgen-shared/0.2.100 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.10 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-core/0.61.2 \
+    crate://crates.io/windows-implement/0.60.0 \
+    crate://crates.io/windows-interface/0.59.1 \
+    crate://crates.io/windows-link/0.1.3 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-result/0.3.4 \
+    crate://crates.io/windows-strings/0.4.2 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.3 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.0 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.0 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.0 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.0 \
+    crate://crates.io/winnow/0.7.12 \
+"
+
+SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238d2=
df97c507009a52b3c10addcd7f6bcb916"
+SRC_URI[android-tzdata-0.1.1.sha256sum] =3D "e999941b234f3131b00bc13c22d06=
e8c5ff726d1b6318ac7eb276997bbb4fef0"
+SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043ac=
279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[anstream-0.6.20.sha256sum] =3D "3ae563653d1938f79b1ab1b5e668c87c76=
a9930414574a6583a7b7e11a8e6192"
+SRC_URI[anstyle-1.0.11.sha256sum] =3D "862ed96ca487e809f1c8e5a8447f6ee2cf1=
02f846893800b20cebdf541fc6bbd"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b9384579234ef1=
0eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.4.sha256sum] =3D "9e231f6134f61b71076a3eab506c37=
9d4f36122f2af15a9ff04415ea4c3339e2"
+SRC_URI[anstyle-wincon-3.0.10.sha256sum] =3D "3e0633414522a32ffaac8ac6cc8f=
748e090c5717661fddeea04219e2344f5f2a"
+SRC_URI[anyhow-1.0.99.sha256sum] =3D "b0674a1ddeecb70197781e945de4b3b8ffb6=
1fa939a5597bcf48503737663100"
+SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.9.2.sha256sum] =3D "6a65b545ab31d687cff52899d4890855fec=
459eb6afe0da6417b8a18da87aa29"
+SRC_URI[block2-0.6.2.sha256sum] =3D "cdeb9d870516001442e364c5220d3574d2da8=
dc765554b4a617230d33fa58ef5"
+SRC_URI[bumpalo-3.19.0.sha256sum] =3D "46c5e41b57b8bba42a04676d81cb89e9ee8=
e859a1a66f80a5a72e1cb76b34d43"
+SRC_URI[cc-1.2.33.sha256sum] =3D "3ee0f8803222ba5a7e2777dd72ca451868909b1a=
c410621b676adf07280e9b5f"
+SRC_URI[cfg-if-1.0.3.sha256sum] =3D "2fd1289c04a9ea8cb22300a459a72a385d7c7=
3d3259e2ed7dcb2af674838cfa9"
+SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb082=
c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[chrono-0.4.41.sha256sum] =3D "c469d952047f47f91b68d1cba3f10d63c11d=
73e4636f24f08daf0278abf01c4d"
+SRC_URI[clap-4.5.45.sha256sum] =3D "1fc0e74a703892159f5ae7d3aac52c8e6c392f=
5ae5f359c70b5881d60aaac318"
+SRC_URI[clap_builder-4.5.44.sha256sum] =3D "b3e7f4214277f3c7aa526a59dd3fbe=
306a370daee1f8b7b8c987069cd8e888a8"
+SRC_URI[clap_derive-4.5.45.sha256sum] =3D "14cb31bb0a7d536caef2639baa7fad4=
59e15c3144efefa6dbd1c84562c4739f6"
+SRC_URI[clap_lex-0.7.5.sha256sum] =3D "b94f61472cee1439c0b966b47e3aca9ae07=
e45d070759512cd390ea2bebc6675"
+SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790d984=
5d13888356391624cbe7e41efeac1e75"
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f280=
777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D "82b8f8f868b36967f9606790d=
1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b3a=
ad3a4c4cd4de0629063962b03235697506a28"
+SRC_URI[crossterm-0.28.1.sha256sum] =3D "829d955a0bb380ef178a640b91779e398=
7da38c9aea133b20614cfed8cdea9c6"
+SRC_URI[crossterm_winapi-0.9.1.sha256sum] =3D "acdd7c62a3665c7f6830a51635d=
9ac9b23ed385797f70a83bb8bafe9c572ab2b"
+SRC_URI[ctrlc-3.5.2.sha256sum] =3D "e0b1fab2ae45819af2d0731d60f2afe17227eb=
b1a1538a236da84c93e9a60162"
+SRC_URI[dirs-5.0.1.sha256sum] =3D "44c45a9d03d6676652bcb5e724c7e988de1acad=
23a711b5217ab9cbecbec2225"
+SRC_URI[dirs-sys-0.4.1.sha256sum] =3D "520f05a5cbd335fae5a99ff7a6ab8627577=
660ee5cfd6a94a6a929b52ff0321c"
+SRC_URI[dispatch2-0.3.0.sha256sum] =3D "89a09f22a6c6069a18470eb92d2298acf2=
5463f14256d24778e1230d789a2aec"
+SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c02=
9f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.13.sha256sum] =3D "778e2ac28f6c47af28e4907f13ffd1e1ddbd4=
00980a9abd7c8df189bf578a5ad"
+SRC_URI[filetime-0.2.26.sha256sum] =3D "bc0505cd1b6fa6580283f6bdf70a73fcf4=
aba1184038c90902b92b3dd0df63ed"
+SRC_URI[fsevent-sys-4.1.0.sha256sum] =3D "76ee7a02da4d231650c7cea31349b889=
be2f45ddb3ef3032d2ec8185f6313fd2"
+SRC_URI[getrandom-0.2.16.sha256sum] =3D "335ff9f135e4384c8150d6f27c6daed43=
3577f86b4750418338c01a1a2528592"
+SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
+SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
+SRC_URI[hermit-abi-0.5.2.sha256sum] =3D "fc0fef456e4baa96da950455cd02c081c=
a953b141298e41db3fc7e36b1da849c"
+SRC_URI[iana-time-zone-0.1.63.sha256sum] =3D "b0c919e5debc312ad217002b8048=
a17b7d83f80703865bbfcfebb0458b0b27d8"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590ba=
56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[indexmap-2.10.0.sha256sum] =3D "fe4cd85333e22411419a0bcae1297d25e5=
8c9443848b11dc6a86fefe8c78a661"
+SRC_URI[inotify-0.9.6.sha256sum] =3D "f8069d3ec154eb856955c1c0fbffefbf5f3c=
40a104ec912d4797314c1801abff"
+SRC_URI[inotify-sys-0.1.5.sha256sum] =3D "e05c02b5e89bff3b946cedeca278abc6=
28fe811e604f027c45a8aa3cf793d0eb"
+SRC_URI[is-terminal-0.4.16.sha256sum] =3D "e04d7f318608d35d4b61ddd75cbdaee=
86b023ebe2bd5a66ee0915f0bf93095a9"
+SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25b2=
e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7ccefe71f=
97f96e50151fb991f267928e2c"
+SRC_URI[js-sys-0.3.77.sha256sum] =3D "1cfaf33c695fc6e08064efbc1f72ec937429=
614f25eef83af942d0e227c3a28f"
+SRC_URI[kqueue-1.1.1.sha256sum] =3D "eac30106d7dce88daf4a3fcb4879ea939476d=
5074a9b7ddd0fb97fa4bed5596a"
+SRC_URI[kqueue-sys-1.0.4.sha256sum] =3D "ed9625ffda8729b85e45cf04090035ac3=
68927b8cebc34898e7c120f52e4838b"
+SRC_URI[libc-0.2.180.sha256sum] =3D "bcc35a38544a891a5f7c865aca548a982ccb3=
b8650a5b06d0fd33a10283c56fc"
+SRC_URI[libredox-0.1.9.sha256sum] =3D "391290121bad3d37fbddad76d8f5d1c1c31=
4cfc646d143d7e07a3086ddff0ce3"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] =3D "d26c52dbd32dccf2d10cac7725f8e=
ae5296885fb5703b261f7d0a0739ec807ab"
+SRC_URI[lock_api-0.4.13.sha256sum] =3D "96936507f153605bddfcda068dd804796c=
84324ed2510809e5b2a624c81da765"
+SRC_URI[log-0.4.27.sha256sum] =3D "13dc2df351e3202783a1fe0d44375f7295ffb40=
49267b0f3018346dc122a1d94"
+SRC_URI[memchr-2.7.5.sha256sum] =3D "32a282da65faaf38286cf3be983213fcf1d2e=
2a58700e808f83f4ea9a4804bc0"
+SRC_URI[mio-0.8.11.sha256sum] =3D "a4a650543ca06a924e8b371db273b2756685faa=
e30f8487da1b56505a8f78b0c"
+SRC_URI[mio-1.0.4.sha256sum] =3D "78bed444cc8a2160f01cbcf811ef18cac863ad68=
ae8ca62092e8db51d51c761c"
+SRC_URI[nix-0.31.1.sha256sum] =3D "225e7cfe711e0ba79a68baeddb2982723e42352=
47aefce1482f2f16c27865b66"
+SRC_URI[notify-6.1.1.sha256sum] =3D "6205bd8bb1e454ad2e27422015fb5e4f2bcc7=
e08fa8f27058670d208324a4d2d"
+SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72ad=
0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[objc2-0.6.3.sha256sum] =3D "b7c2599ce0ec54857b29ce62166b0ed9b4f6f1=
a70ccc9a71165b6154caca8c05"
+SRC_URI[objc2-encode-4.1.0.sha256sum] =3D "ef25abbcd74fb2609453eb695bd2f86=
0d389e457f67dc17cafc8b8cbc89d0c33"
+SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a7164=
82c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.1.sha256sum] =3D "a4895175b425cb1f87721b59=
f0f286c2092bd4af812243672510e1ac53e2e0ad"
+SRC_URI[option-ext-0.2.0.sha256sum] =3D "04744f49eae99ab78e0d5c0b603ab218f=
515ea8cfe5a456d7629ad883a3b6e7d"
+SRC_URI[parking_lot-0.12.4.sha256sum] =3D "70d58bf43669b5795d1576d0641cfb6=
fbb2057bf629506267a92807158584a13"
+SRC_URI[parking_lot_core-0.9.11.sha256sum] =3D "bc838d2a56b5b1a6c25f55575d=
fc605fabb63bb2365f6c2353ef9159aa69e4a5"
+SRC_URI[proc-macro2-1.0.101.sha256sum] =3D "89ae43fd86e4158d6db51ad8e2b80f=
313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[quote-1.0.40.sha256sum] =3D "1885c039570dc00dcb4ff087a89e185fd56ba=
e234ddc7f056a945bf36467248d"
+SRC_URI[redox_syscall-0.5.17.sha256sum] =3D "5407465600fb0548f1442edf71dd2=
0683c6ed326200ace4b1ef0763521bb3b77"
+SRC_URI[redox_users-0.4.6.sha256sum] =3D "ba009ff324d1fc1b900bd1fdb31564fe=
be58a8ccc8a6fdbb93b543d33b13ca43"
+SRC_URI[regex-1.11.1.sha256sum] =3D "b544ef1b4eac5dc2db33ea63606ae9ffcfac2=
6c1416a2806ae0bf5f56b201191"
+SRC_URI[regex-automata-0.4.9.sha256sum] =3D "809e8dc61f6de73b46c85f4c96486=
310fe304c434cfa43669d7b40f711150908"
+SRC_URI[regex-syntax-0.8.5.sha256sum] =3D "2b15c43186be67a4fd63bee50d0303a=
fffcef381492ebe2c5d87f324e1b8815c"
+SRC_URI[rustix-0.38.44.sha256sum] =3D "fdb5bc1ae2baa591800df16c9ca78619bf6=
5c0488b41b96ccec5d11220d8c154"
+SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a02=
9961a8215f9619753635a9c0d2538d46d"
+SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c5dd4b=
c44d8bb0c1c632c8d6829481f"
+SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4baf7=
e3078b0bd1b4d7b6b0b68378900502"
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59bce=
7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[serde-1.0.219.sha256sum] =3D "5f0e2c6ed6606019b4e29e69dbaba95b1185=
4410e5347d525002456dbbb786b6"
+SRC_URI[serde_derive-1.0.219.sha256sum] =3D "5b0276cf7f2c73365f7157c8123c2=
1cd9a50fbbd844757af28ca1f5925fc2a00"
+SRC_URI[serde_json-1.0.143.sha256sum] =3D "d401abef1d108fbd9cbaebc3e46611f=
4b1021f714a0597a71f41ee463f5f4a5a"
+SRC_URI[serde_spanned-0.6.9.sha256sum] =3D "bf41e0cfaf7226dca15e8197172c29=
5a782857fcb97fad1808a166870dee75a3"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
+SRC_URI[signal-hook-0.3.18.sha256sum] =3D "d881a16cf4426aa584979d30bd82cb3=
3429027e42122b169753d6ef1085ed6e2"
+SRC_URI[signal-hook-mio-0.2.4.sha256sum] =3D "34db1a06d485c9142248b7a054f0=
34b349b212551f3dfd19c94d45a754a217cd"
+SRC_URI[signal-hook-registry-1.4.6.sha256sum] =3D "b2a4719bff48cee6b39d12c=
020eeb490953ad2443b7055bd0b21fca26bd8c28b"
+SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45c6=
9e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
+SRC_URI[syn-2.0.106.sha256sum] =3D "ede7c438028d4436d71104916910f5bb611972=
c5cfd7f89b8300a8186e6fada6"
+SRC_URI[thiserror-1.0.69.sha256sum] =3D "b6aaf5339b578ea85b50e080feb250a3e=
8ae8cfcdff9a461c9ec2904bc923f52"
+SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42c6=
0a18f76588c3d74cb83a0b242a2b6c7504c1"
+SRC_URI[toml-0.8.23.sha256sum] =3D "dc1beb996b9d83529a9e75c17a1686767d148d=
70663143c7854d8b4a09ced362"
+SRC_URI[toml_datetime-0.6.11.sha256sum] =3D "22cddaf88f4fbc13c51aebbf5f8ec=
eb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
+SRC_URI[toml_edit-0.22.27.sha256sum] =3D "41fe8c660ae4257887cf66394862d21d=
bca4a6ddd26f04a3560410406a2f819a"
+SRC_URI[toml_write-0.1.2.sha256sum] =3D "5d99f8c9a7727884afe522e9bd5edbfc9=
1a3312b36a77b5fb8926e4c31a41801"
+SRC_URI[unicode-ident-1.0.18.sha256sum] =3D "5a5f39404a5da50712a4c1eecf25e=
90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
+SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1dc0=
6c5efe94541a7d6863108e3a5e4b"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847eb=
01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasm-bindgen-0.2.100.sha256sum] =3D "1edc8929d7499fc4e8f0be2262a24=
1556cfc54a0bea223790e71446f2aab1ef5"
+SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] =3D "2f0a0651a5c2bc21487bd=
e11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
+SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] =3D "7fe63fc6d09ed3792bd0897=
b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
+SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] =3D "8ae87ea40c9f689=
fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
+SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] =3D "1a05d73b933a847d6cccdd=
a8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe939=
92746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.10.sha256sum] =3D "0978bf7171b3d90bac376700cb56d60=
6feb40f251a475a5d6634613564460b22"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d057c=
1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-core-0.61.2.sha256sum] =3D "c0fdd3ddb90610c7638aa2b3a3ab29=
04fb9e5cdbecc643ddb3647212781c4ae3"
+SRC_URI[windows-implement-0.60.0.sha256sum] =3D "a47fddd13af08290e67f4acab=
f4b459f647552718f683a7b415d290ac744a836"
+SRC_URI[windows-interface-0.59.1.sha256sum] =3D "bd9211b69f8dcdfa817bfd14b=
f1c97c9188afa36f4750130fcdf3f400eca9fa8"
+SRC_URI[windows-link-0.1.3.sha256sum] =3D "5e6ad25900d524eaabdbbb96d20b431=
1e1e7ae1699af4fb28c17ae66c80d798a"
+SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa9163b=
c891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-result-0.3.4.sha256sum] =3D "56f42bd332cc6c8eac5af113fc0c1=
fd6a8fd2aa08a0119358686e5160d0586c6"
+SRC_URI[windows-strings-0.4.2.sha256sum] =3D "56e6c93f3a0c3b36176cb1327a49=
58a0353d5d166c2a35cb268ace15e91d3b57"
+SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806bc1=
ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c39b=
32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.60.2.sha256sum] =3D "f2f500e4d28234f72040990ec9d39e3=
a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df6176=
6145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c096456=
083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d47=
80d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.3.sha256sum] =3D "d5fe6031c4041849d7c496a8ded=
650796e7b6ecc19df1a431c1a363342e5dc91"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf9987a=
4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec044=
bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] =3D "86b8d5f90ddd19cb4a1=
47a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f06=
90a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53fa=
7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] =3D "c7651a1f62a11b8cbd5e0d=
42526e55f2c99886c77e007179efff86c2b137e66c"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef72200b=
9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295ac6=
720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.0.sha256sum] =3D "c1dc67659d35f387f5f6c479dc=
4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76c5=
63b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] =3D "9ce6ccbdedbf6d63544713=
19e781c0dfef054c81fbc7cf83f338a4296c0cae11"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c52358=
0f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28bf=
89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.0.sha256sum] =3D "581fee95406bb13382d2f65cd=
4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fddf=
1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901cb5=
895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] =3D "2e55b5ac9ea33f2fc1716d17=
42db15574fd6fc8dadc51caab1c16a3d3b4190ba"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5bab=
768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc41741267968=
1396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] =3D "0a6e035dd0599267ce1e=
e132e51c27dd29437f63325753051e71dd9e42406c57"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b73=
89a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d127=
0a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] =3D "271414315aff87387382ec3=
d271b52d7ae78726f5d44ac98b4f4030c91880486"
+SRC_URI[winnow-0.7.12.sha256sum] =3D "f3edebf492c8125044983378ecb5766203ad=
3b4c2f7a922bd7dd207f6d443e95"
diff --git a/meta-oe/recipes-extended/fuzzytail/fuzzytail_0.2.3.bb b/meta-o=
e/recipes-extended/fuzzytail/fuzzytail_0.2.3.bb
new file mode 100644
index 0000000000..eb6e6fc75f
--- /dev/null
+++ b/meta-oe/recipes-extended/fuzzytail/fuzzytail_0.2.3.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "A modern, colorful tail replacement with split-pane log monit=
oring"
+DESCRIPTION =3D "\
+    Fuzzytail is a modern, fast replacement for tail with split-pane log \
+    monitoring, syntax highlighting, and powerful filtering. \
+"
+HOMEPAGE =3D "https://github.com/yodabytz/fuzzytail"
+BUGTRACKER =3D "https://github.com/yodabytz/fuzzytail/issues"
+SECTION =3D "console/tools"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc603190f79e3e5272a870f1a0dd680e=
f"
+
+SRC_URI =3D "git://github.com/yodabytz/fuzzytail.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3Dv${PV}"
+SRCREV =3D "f08c8d3e2c9501c0d3eb278278ac95d8cc211547"
+
+inherit cargo cargo-update-recipe-crates
+
+require ${BPN}-crates.inc
+
+do_install:append() {
+    install -m 644 -Dt ${D}/etc/fuzzytail/themes ${S}/themes/ft.conf.*
+}
--=20
2.53.0


