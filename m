Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.126])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12765.1794488761531749693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@inmusicbrands.com header.s=selector2 header.b=tT/HjJKY;
 spf=pass (domain: inmusicbrands.com, ip: 52.101.43.126, mailfrom: jkeeping@inmusicbrands.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBoi6ikoch2PmDWhpa5umFyppDNpdRy9fdlWVO0POS/iZJP/V5ZYqNJVcilsRkRNkGziJDtnfqHtQXTkRWshdrjDuEBXT0Eaxcl6LeDTdwfzpE/1ILhB0v19Po338ucK+1PVbDVEmXnYMSrRqcWF0igQ0UddQxpNhvTVXI5k4NDb8o3/NQjHHvo587floMIaS+uysHjrcUuMN18kvDJfFJ6L55UvY/0o32BA5ub5Z78xuxsih+KE3id7h6M0bOQbgd37KvnoOU4vlss4nU2BnufketQxnofNfQoQ7+WppnAC+TtMf0UOx0tsQoP1U0BhcR6N49MG99rps0RCPWQMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29+2FgKtQlIqNJ2OvoZQ/Y6eD6b6yzadseGyVnFRpDo=;
 b=PneXQvC5BoE+xFzecUOTvBc0TV9+teBzs5dqpHGUFwKoki0bN0CLwIzxYjG8oDfKN0BWmoibLP7f55hnrGV3q0BXPptQwPf3D27a06i1RLTqjTzRxK+SEpFLQca2UAsLURCM4f9k/T0rZOAJRKyGhIXIphJ4+0P8LGn69znSda/dyfaYWAUrF5zk+LavrK/yvl/XZzVsZdogSLTx4gHVkIbcxzOCI0rPjtiFriGl3mg4ZFGwUePYACCWdfsLt+WQARPX6yKbDb5QSfEFbd8TEnj6fUdY2i3eF0a4YqiabtSWYcWq6TzeML6n7uAfqBShTeGyPwe4h4DGr/qeMtJoDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29+2FgKtQlIqNJ2OvoZQ/Y6eD6b6yzadseGyVnFRpDo=;
 b=tT/HjJKYl4ivAHsNqUPOQW4EJHQ/wRyZyrrSXuFbnZgMWjgkng5ffjl3Uc2PopJVPFdduMeKhtSmr+3O1WuHDmdVm4lBSvqPLEYKGxbaGDDrO3t3zDp0yANRRh3na/urUejRcV1gkKqRbLIDs9USTGufcXqwLEuZKMohHsWxv9E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14) by LV8PR08MB9413.namprd08.prod.outlook.com
 (2603:10b6:408:20a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 13:05:55 +0000
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51]) by BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 13:05:52 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: openembedded-devel@lists.openembedded.org
CC: John Keeping <jkeeping@inmusicbrands.com>
Subject: [meta-networking][PATCH] networkmanager: respect WIRELESS_DAEMON
Date: Thu, 12 Nov 2026 13:05:26 +0000
Message-ID: <20261112130534.649206-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14)
Return-Path: jkeeping@inmusicbrands.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR08MB10263:EE_|LV8PR08MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e15a2d-4d3e-413e-59ea-08df40bdae09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|18002099003|10067099003|56012099006|261028144727099003|261026121527099003|261021121427099003|261009221227099003|261009223027099003|261022105027099003|261026140227099003|38350700014|261102123227099003;
X-Microsoft-Antispam-Message-Info: dXrv+gZPv2YisuOO+qRg6LgStAObrK6w76s9w8cjNwg+ZhVj1AWtnsLv9fv9xn9CbhAri7H5z8BwKd7dN17wWywFovxmATw0gaChuMgcHSDWHRq6NCetfvKhy5s1+FPbaY8Edt4/AyzeGEkNdmiyJeR+JZmD7oxvJNayRyySqXEBB9XpeDsiHg9pPcqBSgzZwMlC2G/Wo/vdu8IH5098mTu+b6ct1NrCcI1rx/3PkA20SWeZmWlVmKw6B2dtDwXb9EkeVCUE+AAnmYM8VKDE6n+ftO8McWKjrOhQbV4gy95b2cVCdUkt8ciKd0BLlQK0yPsmcQ1NMrc/vVvGIrdmNqZgSIsrxgDbTiaZFbUmqUew5BvL8zMUPoyNXR+ucvGaIMtlw2q4Je7bic/DJhltEq+eWhotJl7YnxfN3v8C7X6V8D8TQkYNA5IsMZWjH9o0mxsicPO2OnVFr2jnQjsou9cPsDr3PUsEhAuNrNPuI36MU4uaGs1Ha6zQHcPAx0RSLNOnw2rmYfriwms1p0+tsiWz4OPbzRRPf9bnZmfcZ7njeL0OQafaEnwZ7Y/2qonlBnOjQiJKIkxRUv5Wvys8hJ0CqAD+4jFpSEf/+hUKzMu6o8jzKYkCt83wuRUiCWB9duvKDsl4zlee4BgSM+3fR7vugUr5+hoy2Mk3WQONfasLEEBE6n/xBqxIhFX4uViPm4o4E8DNn9mo3jUFwjIPNlo95Hipc1d7uh3jkgy45kQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR08MB10263.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(18002099003)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261021121427099003)(261009221227099003)(261009223027099003)(261022105027099003)(261026140227099003)(38350700014)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1H6J3ZlOv55TwVPphCWaK5B+wH32+El78hdN+udKm0pz2Pv+7HpORm1E5z1?=
 =?us-ascii?Q?3r8z96PmUaGRiymKZ81CZRR0wZmTie9nDFlM/u9NnqbMvIqL+LSuBYK8F0qx?=
 =?us-ascii?Q?3KgM0DyOw1DwmQdBFAb2Momr+1ruZ8UUqC+AOK8tA10GZ9wwUUZGca8TbtVl?=
 =?us-ascii?Q?oVHgXF0C9TGBGPPhGTIDYzuUkd7rPsRAdidA1dsBNesP/1ub463ImDOkoMxy?=
 =?us-ascii?Q?FgU+kX5D56fAzK2m/sULq+QXO04mMCM1Tb2Bl3qkOmRPCBKSQxL8owPx+J/F?=
 =?us-ascii?Q?SQszRBqDELhRt5aqD8VqmLRFc9dzp/cxtMEMX7bupVBTatEQF+0gmDzjRh4l?=
 =?us-ascii?Q?z1zcc7lq/oAZ/9BpCR8eRXxt3PeI4Wy6G1wh/aT/RvPbQEVNPK4mrexNSTAs?=
 =?us-ascii?Q?gtY8rtAgq2S9tmrKnG4JIorhYypPSmBdv2rxvy/90qffPJchdilV31EZnySA?=
 =?us-ascii?Q?dMr+LlK5BBoikD5905tLLfibojCe9vmH51EQXLEV96ABjzmQicc29e+IsiO/?=
 =?us-ascii?Q?xiWHw6ean7VPEIjUsFAZEbu0b9N9GWF0h9ZIFCIo0deG+o1nfbWe4qTYXYcg?=
 =?us-ascii?Q?Q746NFPpRaO7ertxTzz7JeO8rbPwPuRVXTRHZI3CTIFoQs2LlLdyRZJQwsip?=
 =?us-ascii?Q?NAIejiPrjVlGZGOxOce61G9d9ZGRgXvoutKtc8++WcvSRbEWxyj1swnzI2Rl?=
 =?us-ascii?Q?gyvdRPMWTenEfz1Ukt+edtloyh2q6Gmc5TtBD3v/DpEx56M4r1FOLG6fXqIQ?=
 =?us-ascii?Q?8L0t7VhBHBrPpjckL+qLiSBfitGvR+a7ME4Qxrj5UFqDx75aN2cfOBSY8ryH?=
 =?us-ascii?Q?EP3XGld0dDehV7U4JJSJtkZr3yDVzGEcR9zIzoYeTxhrahU0a1miu/houPt1?=
 =?us-ascii?Q?klG6aFRxnmVB78klBmhEwfJnY9HHAdngxzIYay3CwgUinZ3A7tF766b6jqR1?=
 =?us-ascii?Q?NaDfIfoO0wVEbtpfgYYOoSS0tiQFWMpNwEwcqkM71dZEOsTXUqDpGGDTkfZJ?=
 =?us-ascii?Q?I8oP/F+t0HkkLOZqH5GVArvs8DeI8ZiJlcpUF5JQ1yMyfdAPx2ENRbmLo630?=
 =?us-ascii?Q?JzpLbR2ci59setgHYTFAxqxc2VjRAKU4VjPmXxmyI8GWYlBFFoYKuq9UNCDv?=
 =?us-ascii?Q?vyQ1rMBFQlKLsyfxQ+brhC05Y3o/0hPYsko6CF/swda1l3gUPE9cnjiLNBQm?=
 =?us-ascii?Q?7YRfzljj2grWR3XCAn6xg353eN0spRbRxnyErJjRC2uVM6KDGHbqN5xCBbAO?=
 =?us-ascii?Q?Vvck67eaSPCQjGnHiFRKcfuIjs7ARWDAawiSVm0ICJqnnlpppHCN1xMR8Q+k?=
 =?us-ascii?Q?hpnQ6rMQXQNj/TTOjRIL8DXvl1KFGqpNFO1UGXeWpWw24jTyQMQ+DWlCm1k0?=
 =?us-ascii?Q?tQMXB46NQpzmaSMnue8/phNQWKFyMWkqB8biU7WFsbosXn0BdLkM4ky3VCbr?=
 =?us-ascii?Q?sj1Krewx/MYDoRKfaf3vlVQEyXPc9hNPA/0DnQZzcC/ZdejMrAU7OGUdeqxO?=
 =?us-ascii?Q?cpN9skT2FP3wwmVPxJnUhVhQtDUzV7YGKDK3a6Vv4H5DfMapfIkEgtCsMfGg?=
 =?us-ascii?Q?Oeglnbn9DQ6M0Ot6/Q5WJKHEFzmx7kBIDo4m4G1zJm8zC4sreV37twnFN/06?=
 =?us-ascii?Q?OI2W7TQtlCZS/iU0z51JEe1i3QC/rKNVu2xwFKIZEhTDV5B2m1DDVeBO+ohu?=
 =?us-ascii?Q?3e/LGvkwN30ccSJkerIzlPP0kRcLPPKqzPGwaXhaS0HNO4tPC9gV4WKgq6Cc?=
 =?us-ascii?Q?coVe1APIcwL24Ve2QF9MWpvO9KMOZx4=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e15a2d-4d3e-413e-59ea-08df40bdae09
X-MS-Exchange-CrossTenant-AuthSource: BY1PR08MB10263.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:05:52.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVcvqRnGU7I69dTdnqe3PO5rwmqah4rmOUodfx3hZRSynr6+CXIStmFf8oDEJhPiRZ7LIBkf6T8ynZi7CD2JsSQI3QQmI3PF8ojeh27vgTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB9413
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132208
Content-Type: text/plain; charset="utf-8"

Use the standard WIRELESS_DAEMON variable in the same way as recipes in
oe-core so that networkmanager will automatically use iwd or
wpa-supplicant depending on which is selected globally.

This avoids installing two different wireless daemons as rdepends of
networkmanager and packagegroup-base-wifi.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 .../networkmanager/networkmanager_1.58.0.bb                   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkman=
ager_1.58.0.bb b/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_1.58.0.bb
index 2dc7605f76..b9a33fe9f6 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.=
58.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.=
58.0.bb
@@ -70,12 +70,16 @@ EXTRA_OEMESON =3D "\
     -Dman=3Dfalse \
 "
=20
+# Select either wpa-supplicant or iwd
+WIRELESS_DAEMON ??=3D "wpa-supplicant"
+
 PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils=
.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}=
 \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit ppp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit', ''=
, d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', =
'vala', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', bb.utils.filter('WIREL=
ESS_DAEMON', 'iwd', d), '', d)} \
 "
=20
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
--=20
2.56.0

