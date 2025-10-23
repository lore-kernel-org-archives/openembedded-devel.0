Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670A4CCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.103])
 by mx.groups.io with SMTP id smtpd.web11.16446.1761212823656798470
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=H2Y9bECN;
 spf=pass (domain: phytec.de, ip: 40.107.159.103, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjwPX69YhingXFfjYvy214pIfEPqlub7ZAW2CYlhxdMySuL9F8/VzroQsxlJkFNABDr+NF4poH1qFr8gztRQHE4CEzciiZEOz/vHbVekA2Hp2qWV86Aj5vEOm8cxjfTKur29+bmMlUSGA25poj8UNCZI/hV3vENWBMYvTvvfCpz9O3KJkUcjMxRLAcy5mlyOEh4tGbHehZyEF/6DJu47Hmh/ByVqytjxxxKqdpXQ2T1SZfyHw0bU8K+j/anxTuXv6H9DfjcdJ8G82DtuHEPbZgYhWB4VRU8QZqmjN0Xzle9rLoSIWQWH3Yl8X2IGrX2kZQNBmJM2110sT3YE2Y7cUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqCQsm4Zc9AZDR4ObauI8aun6XUoK4MqRe97pHgWOqg=;
 b=rejl4o9pLD4qnJrgsNonvyYVM4Kxti4t/UDAebDSkULVU9CHhGvshcEbIa1zSZ9p1IUoQ8tgO9WCligI9hfshfxuIsUKcMVk+oPMffiOH8ZyAr3f0wTix+kLGsey+wLJB8XdO0BtixLT5C0LnU8OF6Pb8YSCrSQ0Gy0QE9euWKpCiA7BQDcYPnQMtLx3ZZGtK8USBr0F+cXiyizb2m1o0lgAjbBH3MVQzoam8EkpYEv+a8MhB2/8AiTmBAopqBgFOsiUREp9u0YSdWgbgHSYXAKr/yMRz4+zrbxMa29AipQs8WK2UE/qtppFP3aXcuX7F4MmJC0x69KyzgZqglDh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqCQsm4Zc9AZDR4ObauI8aun6XUoK4MqRe97pHgWOqg=;
 b=H2Y9bECNZp/l1otllIiWNt+tQ5fLdB27UyhWW3Hq0OWdedBcayEAgKTZmjzk56oz9IXJQhzz1Vt7Li7QvQXnbKTVRUWBNbPQuPic4IDbq4MmGJ2RBnZbI2Da0qvPSuAh6/tQC0r+WuQ9r7yqBcRib4piIboDuQrWQg9WcpNQWKkooxtxE3Ai9CMpU8CsiQIo8MDjPo797S1A+exVY7+fXcN+3OyNSM9iElhvrhcNHzVe5/t3QhJHkANoJL++hJ3GZfq6LoVo5NHiIH2ZfrILgMcUHgpg43Abm2CilWm++FkcYfX/b6Jzr0ZBVAtyZzIjG+Nedv94bSVD2u2eAc+WQw==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by GV1P195MB1809.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:5c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:46:56 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::70) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:48:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:56 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:54 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:30 +0200
Subject: [PATCH 2/8] python3-orjson: Add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-2-570de0ecafb2@phytec.de>
References: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
In-Reply-To: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GV1P195MB1809:EE_
X-MS-Office365-Filtering-Correlation-Id: 250a5f07-f071-4835-10c0-08de12191a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Qlp3VmNDNzhVaFcydVdBeC83LzgrQmtOMDRFSE5sMEhaWUJIWE9lZnZhN205?=
 =?utf-8?B?L2ZkczZZSnhoSW4wQ3ZIczVKajVSRjcvSzlGZTg1TjByaThtc3ZTdkJDeXc5?=
 =?utf-8?B?aE1EaFpUcnpOUGtQL29UTENWemx6SGVURUJpaEFzczhUWnVLRWdaYU5VeU1S?=
 =?utf-8?B?cm15YzBEZFBrOFhmSkViMUtVOTBseXgwb2JSTlA2eDlTaGhtUmtmbkhyOHo2?=
 =?utf-8?B?MXQ5Skk2Y2h1SEVDMkEwcS80L3lONzBsVElpSkpkRnk3WXdZWUk0V21ya3Iy?=
 =?utf-8?B?V3RCSDltdCsxaUw3QldpaDFtL1hvWWdkZHBLNnpVbHdCMy9EQnUyZDJqcUtu?=
 =?utf-8?B?QUM1R2MvdVUrTXZqTHZRa3A1YkVmNkg5bmNPVEZ5SmV3eUdnM05NZTdTTTRF?=
 =?utf-8?B?Z1N3cEFBUjZYTzA3RzBOMlFNV3BEeWc0QVQwaHVQN1I2T1RCQ2dpNU1VTGx3?=
 =?utf-8?B?V2hZdkFYWHlBVFMvdWM1Q0phUWc0ekNnV3VZa01CRS9yeENtYmlRdnl3U0ZI?=
 =?utf-8?B?MHJ1cEtyOFV0YldzTmg0U3JNMm9FZlIxcWNmMHl3TitsL0NFZDFrUld2RHpJ?=
 =?utf-8?B?c0VEay91TU9ZYXI5MzBWSG1Md0hCQ3B6cGlKdmdPeTFhUTN1NldHQnJEQzd3?=
 =?utf-8?B?aU5jdzNROGM1NkF6MUd3c3NJcHM5VTNrdHdVT2hkZmhOR0pjVERndGwwYTh6?=
 =?utf-8?B?bFkxU1NZTWh2cnM3Wm15WUxvSzJQdlBxV2ZiSHFCZlJCV3BxVUF0OUNMQ1c5?=
 =?utf-8?B?RnBuK29PcU5RZHo0dUxLeFZwWGxvU2hwRE96aUxrQkRLUkg3VXNnSUJTbUNt?=
 =?utf-8?B?aEdNbU4yVVYzQjBZRnhUVkNpNkRCa0M2SE12b1BjT2F2MzdhMW5CQjlsL2JF?=
 =?utf-8?B?ZWZLQ2VHZm95KzAzRVZjQVBwKytsVjNqSTFReFJDNWZtRFJwamcrK01pTlAr?=
 =?utf-8?B?Q2VNcUR0c3BLb0R5ODN5bENqekJ2bVh3bUV6RVZvbk43cXpxOXQzK3g1WlhK?=
 =?utf-8?B?bXF4OS9ROE1LWVpOQkZZOWkxbTdneitiUWJEQThURVNLbm9RWS9IU0t5QVhV?=
 =?utf-8?B?N09WOXpsVThvaUk5NlN2VmpPVTVib1pONmhMMXYwSGpidVJ4ZXVQcDZueFdL?=
 =?utf-8?B?bnBCR0JDaVRQOHdFMnJ6T1hKWjhSYkhXSnlPMzQ4Zk9NVWZXYjc0eGNRSTRB?=
 =?utf-8?B?VEhiTmUvRjNBNEVvQng3K2pOM1dZMXdhNTMySEp5NUpFY2w4ZjlDbU5hU0Nw?=
 =?utf-8?B?NzJQaFdMeERqcHRWUlRaSnhXU1k2SjhlbFdCY01Jbnhwb1FmcXVwbVF5UUlF?=
 =?utf-8?B?QXd1ZGgxd1pmelFVK2NYLzR6QnhNQlljVHFjWnhON2V6UWphUkhIa2pMeDhH?=
 =?utf-8?B?MDNZb0NnMjZja2NoNUZTKzVoZXVJcDh1WU1HQWFyM0FJY2FqT3JtT091bjNk?=
 =?utf-8?B?c0RVdXlKN0RBclhjV1dYblNtbFR4NEhUa0J0Ny9ZM0FZcXNVRTdQTTRVR0RH?=
 =?utf-8?B?V215czN3ZEsvSWJuQUdyYkVYZFA1ckEzdlhOYmYySnNEa2srSFNXK1pwZ1ZX?=
 =?utf-8?B?UTZzN2lvb1YyQ2ZwYTlqRHNqT2ltVkdvVGdFaXEwNEZsdXArNmh2VTA2NlFJ?=
 =?utf-8?B?d08zSTlSeERpMnVqdWNvVkd4NmEzWDNRSjJjRXBOLzJTRjY2MCtDNEJqUmVO?=
 =?utf-8?B?YTA2V2tRVE5tWDNJM0RycWM2ODFWa2NZT3ZsaGllTldTL1gzc2FEUDljcWVZ?=
 =?utf-8?B?RTdqaUc2dUlsbnBtYzBoeVlaa2ErTjlIK21MQ3lETGpFMlVtRE8wWTZLNURi?=
 =?utf-8?B?YmlmcllMTEpXREhEQUZIMHkrR0F4aDdGTHIwTUd3VlJMb3Z6Zzl3ekNFczlk?=
 =?utf-8?B?NWIwbkMxbDdiTzNZZ3hudUJlSmVjYUplTVRqbmhhaDh6a2FTZ2x0WmFIOWND?=
 =?utf-8?B?MTU2MFNnU0tSZDh1TVVIdEF3OEl6M2I0eFE0Q1VpcWlBTkNmaW9SSFQwTXFT?=
 =?utf-8?Q?lL6wdEXDDdGKUcUfFcGbGckBuOowFs=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:56.1400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 250a5f07-f071-4835-10c0-08de12191a8d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1809
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120926

orjson is a fast, correct JSON library for Python.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../python/python3-orjson-crates.inc               | 84 ++++++++++++++++++++++
 .../python/python3-orjson_3.10.17.bb               | 20 ++++++
 2 files changed, 104 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-orjson-crates.inc b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
new file mode 100644
index 0000000000000000000000000000000000000000..76ed174329d099f3ace53cdefdb8a4f791017c85
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-orjson-crates.inc
@@ -0,0 +1,84 @@
+# Autogenerated with 'bitbake -c update_crates python3-orjson'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/associative-cache/2.0.0 \
+    crate://crates.io/bytecount/0.6.8 \
+    crate://crates.io/castaway/0.2.3 \
+    crate://crates.io/cc/1.2.20 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/compact_str/0.9.0 \
+    crate://crates.io/crunchy/0.2.3 \
+    crate://crates.io/encoding_rs/0.8.35 \
+    crate://crates.io/gimli/0.31.1 \
+    crate://crates.io/half/2.6.0 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/itoap/1.0.1 \
+    crate://crates.io/jiff/0.2.10 \
+    crate://crates.io/jiff-static/0.2.10 \
+    crate://crates.io/libc/0.2.172 \
+    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/portable-atomic-util/0.2.4 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/pyo3-build-config/0.23.3 \
+    crate://crates.io/pyo3-ffi/0.23.3 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/rustversion/1.0.20 \
+    crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/serde/1.0.219 \
+    crate://crates.io/serde_derive/1.0.219 \
+    crate://crates.io/serde_json/1.0.140 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/simdutf8/0.1.5 \
+    crate://crates.io/smallvec/1.15.0 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/syn/2.0.101 \
+    crate://crates.io/target-lexicon/0.13.2 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/unwinding/0.2.5 \
+    crate://crates.io/uuid/1.16.0 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/xxhash-rust/0.8.15 \
+"
+
+SRC_URI[associative-cache-2.0.0.sha256sum] = "b993cd767a2bc7307dd87622311ca22c44329cc7a21366206bfa0896827b2bad"
+SRC_URI[bytecount-0.6.8.sha256sum] = "5ce89b21cab1437276d2650d57e971f9d548a2d9037cc231abdc0562b97498ce"
+SRC_URI[castaway-0.2.3.sha256sum] = "0abae9be0aaf9ea96a3b1b8b1b55c602ca751eba1b1500220cea4ecbafe7c0d5"
+SRC_URI[cc-1.2.20.sha256sum] = "04da6a0d40b948dfc4fa8f5bbf402b0fc1a64a28dbf7d12ffd683550f2c1b63a"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[compact_str-0.9.0.sha256sum] = "3fdb1325a1cece981e8a296ab8f0f9b63ae357bd0784a9faaf548cc7b480707a"
+SRC_URI[crunchy-0.2.3.sha256sum] = "43da5946c66ffcc7745f48db692ffbb10a83bfe0afd96235c5c2a4fb23994929"
+SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
+SRC_URI[gimli-0.31.1.sha256sum] = "07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f"
+SRC_URI[half-2.6.0.sha256sum] = "459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9"
+SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[itoap-1.0.1.sha256sum] = "9028f49264629065d057f340a86acb84867925865f73bbf8d47b4d149a7e88b8"
+SRC_URI[jiff-0.2.10.sha256sum] = "5a064218214dc6a10fbae5ec5fa888d80c45d611aba169222fc272072bf7aef6"
+SRC_URI[jiff-static-0.2.10.sha256sum] = "199b7932d97e325aff3a7030e141eafe7f2c6268e1d1b24859b753a627f45254"
+SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
+SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
+SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[pyo3-build-config-0.23.3.sha256sum] = "dc0e0469a84f208e20044b98965e1561028180219e35352a2afaf2b942beff3b"
+SRC_URI[pyo3-ffi-0.23.3.sha256sum] = "eb1547a7f9966f6f1a0f0227564a9945fe36b90da5a93b3933fc3dc03fae372d"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[rustversion-1.0.20.sha256sum] = "eded382c5f5f786b989652c49544c4877d9f015cc22e145a5ea8ea66c2921cd2"
+SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
+SRC_URI[serde-1.0.219.sha256sum] = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
+SRC_URI[serde_derive-1.0.219.sha256sum] = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
+SRC_URI[serde_json-1.0.140.sha256sum] = "20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
+SRC_URI[smallvec-1.15.0.sha256sum] = "8917285742e9f3e1683f0a9c4e6b57960b7314d0b08d30d1ecd426713ee2eee9"
+SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
+SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
+SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[unwinding-0.2.5.sha256sum] = "51f06a05848f650946acef3bf525fe96612226b61f74ae23ffa4e98bfbb8ab3c"
+SRC_URI[uuid-1.16.0.sha256sum] = "458f7a779bf54acc9f347480ac654f68407d3aab21269a6e3c9f922acd9e2da9"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[xxhash-rust-0.8.15.sha256sum] = "fdd20c5420375476fbd4394763288da7eb0cc0b8c11deed431a91562af7335d3"
diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb b/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
new file mode 100644
index 0000000000000000000000000000000000000000..7db76c94151d097b8a47f9a6aaddd0974a9cb9fd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
@@ -0,0 +1,20 @@
+SUMMARY = "orjson is a fast, correct JSON library for Python"
+HOMEPAGE = "https://pypi.org/project/orjson/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
+
+SRC_URI[sha256sum] = "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
+
+require ${BPN}-crates.inc
+
+inherit pypi python_maturin cargo-update-recipe-crates
+
+DEPENDS = "python3-maturin-native"
+
+RDEPENDS:${PN} += "python3-maturin python3-mypy"
+
+do_compile:prepend() {
+    sed -i "/panic = \"abort\"/d" ${S}/Cargo.toml
+}
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.25.1


