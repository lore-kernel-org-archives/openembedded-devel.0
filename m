Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9FCC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 13:34:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12064.1712064858682936518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 06:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aQU9g0Ey;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4822a20b16=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4326EObw008128
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Apr 2024 06:34:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ntRIMKH0CtUjV4Ng/3SO+zDsm3U6AHJHkqPPVQETX/0=; b=
	aQU9g0EywmbiVBwsqDUqeN6dbs5v19ZsFeHQFXmDLGurJothXsDpQCbyFY8ng606
	jl6vY6M8BxGyDQvJmLkAJ9zFOPuOP+a0pFsVRvdcEtFhwEUcHK7siXScz67N8mr7
	4CBw0/nfOXAHH4L/kQrYcWC7wCreDPlwP4k5iGzMKe+eZ3ixUwzPHD1Rn4klvkoC
	xBgcBV++9USvNMBCkvQP2oRZ/D1dn7SRdnmbaNznRIzipCKDWcJ9yP8LSj+eRBqQ
	F1LZGMfRE0T0rTkjxZOZia0P3M5vUMK55QBmoguamgXq1W5zMLdnJ+8dvXuseS6/
	c6pLcNXwLODsAIysqda7cw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6e10k2mc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 06:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7dbkr6poIn9Ho7Bvr/V9H/2dtKa2+OzpY1XkEUmSSODsD0kIkXwoIqYmbkF0HnfCm7iHhVIOWMc/a0ug6Ayw4nOD6rIXUouwthBm8RRWK0t2Bo1FtiVpCihbsFmcVR0OtpEzpiSTgl/ev8lpofcNIntnqlhekveAsY/9YxYI3yE+ICgYQayVTe3Hy+T3yRj5Q3QmpBU+O5OycqBvmIYy/KJadPUASJ1DSYxhgvnpzKvBAysBvtMb/m5NvrIvzVZ9y4Lu77FBdRA95emFaiPUqtiCUegNzC8Gf2s4vlxxXrlINBGxsC54vmRsHOolzMGzUH3mV4AIAGf0PTOmBBRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntRIMKH0CtUjV4Ng/3SO+zDsm3U6AHJHkqPPVQETX/0=;
 b=LM3G8ikruH6MlB+TxxO8Zx6awP3xuv9YN8vgXFZEyiqHqQ+O1/1gitW/mfPEVesQTqQqIWhzzwF/2Cea5mLdV5oY17OGCmWTNmcqtNuQ+xyZg7YywGoOH2geWX1Dq/Qt4LgxB81CM4ct04+QK8/8DENI5EZWz5mzg0Yf/AuGsDb3B0qtwFl0GGvJR3HCdaNIL8Ig8V2l9W6+VuJAhu89C16GhneU+iI9J+BuVxRMhR/u8m5nk4v8g7MHQWi+wxoIk8KHtJ2Di/ytbVo7MK5Su7VARuDC+oLJcB3sdswj7vKxANp0+yYfntWBY5KP5Nls1ium+1rRR6Rnw2UPoP43bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Tue, 2 Apr
 2024 13:34:14 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:34:14 +0000
From: William.Lyu@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] nftables: Fix failed ptest testcases
Date: Tue,  2 Apr 2024 06:34:00 -0700
Message-ID: <20240402133400.3347547-3-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402133400.3347547-1-William.Lyu@windriver.com>
References: <20240402133400.3347547-1-William.Lyu@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|CO1PR11MB5090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R78nhWjLqjW6Zvo0ifOBuuFTumtVZVZmeSb7urFjiCtQwLYBqynm45/c82su9Jc7hep/NKArPdt9g7kh5cpEin2Qwqnkgx7x9sA0slmLI87IiwINGsng/gNfB0MqxPNTBqE0w5gItLnDv566p92jdjkQneqX26RBJuufCnahRaZpKgbBM79FpL0kz9WNv/zERB4TBtWCNNHU2h2Rp27raw5g/1GGcWtKrxPTxIJGvMAROIjJ6q9qKeJt9WNcz/f9n2vA6TgeyZwMXkNLKvpFGuqGD1uXwXzHohSDfOGZPEg521UCpCNWmjePiPajmjijNPqHwKG5rX/MG9a+hMB+LOACTAsycarFUP6E8dTwvNW4TqYs6LVc3ox/c9rIGIRLCwZ1EKJbhDc0XrdLyZCtmuMZJHWTHs/5ciRWjc732pFnJb9/ob9l0vWaFAbMn9HnAx46KS7fL4HSVA4yqAR5zA/25deBP0RepXy4vlxww8TWt4bEEllHOpHSdK8V42WFQK/FTg0aIY65/SIg3PEJHptckLYgkdyToCOughvK3Jwu801wMnp9aafDZb5Y8AH0H2LgvhPuS5chQLbTj9MXCKMWyrcCU2hCxgfS+am/SMfduvR0vlNjbm6U77WpAMKICJDvi0yVriUD7MBv44GcAFx6Tij7T+e9ZrELcUC/9dQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U4fJEAlklo/hM21vEzrc2UFtjMorjO7MFuiL3yDMjmisLSJvdUlNDdk+rKS0?=
 =?us-ascii?Q?T5n0se1I2KJ691u8zOffdhrsTGK348jDN/62BFvBfiTJu6ikwYkYKlEXoy7v?=
 =?us-ascii?Q?B7O/SxRVmlmvhUiRKvk/7rDVX7lpBgrGF2rglZDrankv8Rw2f0pwdu0WlvyT?=
 =?us-ascii?Q?TgmI8cOwEd0vvR8ojWah0daXaRHdrSE2/ys0L1hIP5pXFzkemDjP/lBkHmE5?=
 =?us-ascii?Q?2eCAs0jAhR/hnZNZnMgI1LrWdmXDRaEaKKujpFVDYGOMJPirpDgVJGJGL1af?=
 =?us-ascii?Q?Ybk8QwLWbDZJzt3JN+UdcpoALez6GxE+RXthTJhDrHcEnNQ6S0z4NLTXRCcE?=
 =?us-ascii?Q?ok+HlKR+Wr6i40RAbnzI/oU3SVR54mgYbcgcXDfa1ptjSUzb+0d8V7uBg/6f?=
 =?us-ascii?Q?hvrnoyJ7xWlvKmNj8+2VeKyDQvljPxCtFIzlVhIM6wLinVnrKGX9fuI84h7x?=
 =?us-ascii?Q?H6dljBFkmgJQmta2qLspd5vmXKKVxdsHcutWMuo3c5LWgXcBD1nJyepDgomA?=
 =?us-ascii?Q?iDJzyVHyznZjy2Sc3wphAS0k1wN5VG0gpAxz5S91HzeYhNFivVVs8PuO15iY?=
 =?us-ascii?Q?2MfopMisZVxL+felMj/m0ZfH1klTGCZ3IF/luAXYHbC14En/KqBRC1RQe2DM?=
 =?us-ascii?Q?Wh7R0mucjsgR91Ee4rRf6G191lfvu8wuZ661cR/hHz8phF9d66PJhBwlsypx?=
 =?us-ascii?Q?ZZpZ2+9Q85nDp2slGqxrTlOSPtSFpkbDop7WSibgZT80GQY7+Dm+o9NwhTNt?=
 =?us-ascii?Q?iuqS01qD3XAvJIHUE+zcPBGl5Mur5lcU1UPFYqlwFHAQTZudeEVsWt2eoNfk?=
 =?us-ascii?Q?EVlMdKqJy8/fe2id7lnj8EbiMQzn8isDoFTkClOBrGO77hJ9WuwM37Y+3lSO?=
 =?us-ascii?Q?jFpLeQsECCUXAkYixu9O5GfC9HY/TwKii+1iGBssRijN0MrhHkwDYCXsNUy2?=
 =?us-ascii?Q?vsqpB8RYbJNNHi453W7b7XfAOnFCXeXqMyQSlxii/EOqOXWT0sBYTP7rde2r?=
 =?us-ascii?Q?eso+ItHmePQKHBJDSwzk0dHJL+T02LOkP4qaYPlHBT4solv1JHhN0cVoFr8O?=
 =?us-ascii?Q?djXbn+P02y3sAT9jmqQfJax25b3HvK5lCTz4zZUhw6sKXcwdwXJgGF+U5Kfv?=
 =?us-ascii?Q?HkwGG7SsUjoerAsVZu0VAElnBNr5vzIlzIftu1GGBN6lOzbnIEdkAfQanUuL?=
 =?us-ascii?Q?nHZ2VckXwuAtagagV5QM5HW/2G8WxOQNdMNYNxNfT9jEj4ZXx1qUXXo+ex/l?=
 =?us-ascii?Q?/lFnrG2NerTPY1Ebnrr9WFtZEakHv6cS4tf8BpESggi6itVt5qXZJmO7t0wJ?=
 =?us-ascii?Q?PTRkreRIIPm19grIfrzBFDjNJ98JCBZSqZHDpWz8viVnqXb1WPeuzBs1WlgS?=
 =?us-ascii?Q?OBgXl4QP5WDXdhalV9QZI1eqJKR26fJXedw58bc38yTFSSDw+ptIpyqnNNYX?=
 =?us-ascii?Q?HZW0jHdfenN5nWK1eHE+3Q4Xz5fKsww+cHpw0KbHFjWTZ6RY55OdFFGkReRp?=
 =?us-ascii?Q?vafrLbbRCLulyMrMiD4eKj3YgchVaSqU/s2cZav61SU76yd6ZT4ZA86WXmY4?=
 =?us-ascii?Q?Yjviqj8kFLYyuM683sGaZX4MnX3o0OdH1UQke9SfIu+WOVqGC91lX7Rg9QEK?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723b2049-3bae-4155-4ca1-08dc5319961a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:34:13.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lc+4q+KFZA+y7tKr7qa8QviS9Ne9CQN38kI3pi45c/IxTXpljybB5rz1wa4vmUPOZhQOS6zyjXAbDCyp6UQrYewSnrXuVHN68+aCHckBXTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
X-Proofpoint-ORIG-GUID: No_68GtFPpK9C3bU-vIol9EmV2tjwpuq
X-Proofpoint-GUID: No_68GtFPpK9C3bU-vIol9EmV2tjwpuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 13:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109782

From: William Lyu <William.Lyu@windriver.com>

There are 2 failed ptest testcases. They fail because they are broken,
but the fix from the upstream is not yet available in version 1.0.9.
These testcases are:
-   tests/shell/testcases/sets/reset_command_0
    Fix from the upstream:
    https://git.netfilter.org/nftables/commit/?id=7a6089a400a573b9a4fd92f29c00a6be7b8ef269
-   tests/shell/testcases/json/0005secmark_objref_0
    Fix from the upstream:
    https://git.netfilter.org/nftables/commit/?id=fff913c1eefbc84eb2d9c52038ef29fe881e9ee9

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 ...sets-reset_command_0-for-current-ker.patch | 53 +++++++++++++++++++
 ...-secmark-tests-if-kernel-does-not-su.patch | 46 ++++++++++++++++
 .../recipes-filter/nftables/nftables_1.0.9.bb |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch b/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch
new file mode 100644
index 000000000..164182bb1
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch
@@ -0,0 +1,53 @@
+From 7a6089a400a573b9a4fd92f29c00a6be7b8ef269 Mon Sep 17 00:00:00 2001
+From: Phil Sutter <phil@nwl.cc>
+Date: Thu, 2 Nov 2023 16:02:14 +0100
+Subject: [PATCH] tests: shell: Fix sets/reset_command_0 for current kernels
+
+Since kernel commit 4c90bba60c26 ("netfilter: nf_tables: do not refresh
+timeout when resetting element"), element reset won't touch expiry
+anymore. Invert the one check to make sure it remains unaltered, drop
+the other testing behaviour for per-element timeouts.
+
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+
+Upstream-Status: Backport
+[https://git.netfilter.org/nftables/commit/?id=7a6089a400a573b9a4fd92f29c00a6be7b8ef269]
+
+Signed-off-by: William Lyu <William.Lyu@windriver.com>
+---
+ tests/shell/testcases/sets/reset_command_0 | 10 ++--------
+ 1 file changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/tests/shell/testcases/sets/reset_command_0 b/tests/shell/testcases/sets/reset_command_0
+index e663dac8..d38ddb3f 100755
+--- a/tests/shell/testcases/sets/reset_command_0
++++ b/tests/shell/testcases/sets/reset_command_0
+@@ -44,10 +44,10 @@ elem='element t s { 1.0.0.1 . udp . 53 }'
+ 	grep 'elements = ' | drop_seconds | uniq | wc -l) == 1 ]]
+ echo OK
+ 
+-echo -n "counters and expiry are reset: "
++echo -n "counters are reset, expiry left alone: "
+ NEW=$($NFT "get $elem")
+ grep -q 'counter packets 0 bytes 0' <<< "$NEW"
+-[[ $(expires_minutes <<< "$NEW") -gt 20 ]]
++[[ $(expires_minutes <<< "$NEW") -lt 20 ]]
+ echo OK
+ 
+ echo -n "get map elem matches reset map elem: "
+@@ -80,12 +80,6 @@ OUT=$($NFT reset map t m)
+ $DIFF -u <(echo "$EXP") <(echo "$OUT")
+ echo OK
+ 
+-echo -n "reset command respects per-element timeout: "
+-VAL=$($NFT get element t s '{ 2.0.0.2 . tcp . 22 }' | expires_minutes)
+-[[ $VAL -lt 15 ]]	# custom timeout applies
+-[[ $VAL -gt 10 ]]	# expires was reset
+-echo OK
+-
+ echo -n "remaining elements are reset: "
+ OUT=$($NFT list ruleset)
+ grep -q '2.0.0.2 . tcp . 22 counter packets 0 bytes 0' <<< "$OUT"
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch b/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch
new file mode 100644
index 000000000..2a966ab44
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch
@@ -0,0 +1,46 @@
+From fff913c1eefbc84eb2d9c52038ef29fe881e9ee9 Mon Sep 17 00:00:00 2001
+From: Pablo Neira Ayuso <pablo@netfilter.org>
+Date: Tue, 21 Nov 2023 21:16:38 +0100
+Subject: [PATCH] tests: shell: skip secmark tests if kernel does not support
+ it
+
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+
+Upstream-Status: Backport
+[https://git.netfilter.org/nftables/commit/?id=fff913c1eefbc84eb2d9c52038ef29fe881e9ee9]
+
+Signed-off-by: William Lyu <William.Lyu@windriver.com>
+---
+ tests/shell/features/secmark.nft                | 7 +++++++
+ tests/shell/testcases/json/0005secmark_objref_0 | 1 +
+ 2 files changed, 8 insertions(+)
+ create mode 100644 tests/shell/features/secmark.nft
+
+diff --git a/tests/shell/features/secmark.nft b/tests/shell/features/secmark.nft
+new file mode 100644
+index 00000000..ccbb572f
+--- /dev/null
++++ b/tests/shell/features/secmark.nft
+@@ -0,0 +1,7 @@
++# fb961945457f ("netfilter: nf_tables: add SECMARK support")
++# v4.20-rc1~14^2~125^2~5
++table inet x {
++	secmark ssh_server {
++		"system_u:object_r:ssh_server_packet_t:s0"
++	}
++}
+diff --git a/tests/shell/testcases/json/0005secmark_objref_0 b/tests/shell/testcases/json/0005secmark_objref_0
+index 992d1b00..5c44f093 100755
+--- a/tests/shell/testcases/json/0005secmark_objref_0
++++ b/tests/shell/testcases/json/0005secmark_objref_0
+@@ -1,6 +1,7 @@
+ #!/bin/bash
+ 
+ # NFT_TEST_REQUIRES(NFT_TEST_HAVE_json)
++# NFT_TEST_REQUIRES(NFT_TEST_HAVE_secmark)
+ 
+ set -e
+ 
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 906d1b4f6..ad99a80a6 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -12,6 +12,8 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
+           file://0001-tests-shell-Fix-sets-reset_command_0-for-current-ker.patch \
+           file://0001-tests-shell-skip-secmark-tests-if-kernel-does-not-su.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "a3c304cd9ba061239ee0474f9afb938a9bb99d89b960246f66f0c3a0a85e14cd"
-- 
2.43.0


