Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0910CC3601E
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.112])
 by mx.groups.io with SMTP id smtpd.web11.8085.1743764082344333991
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=t1FYobco;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.72.112, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvq4c+H23oByxk1Z0SAv0bbtbB4tmqQJPAFJ59e4nI98vyrvNPFBqcoGe9hBeBYvd+IW+Q2y03+uPH7kn44x97iXDg2egNJwfUoJSx8viZvlLJAta6VjYT4blarMdq4fD9uXk2nw1OCDSH6+Pmfhetu3K4U3CHbfVZ37ugH3meHMaJhjDTJqU8luQzwmPCITG5rdXSZPLXgTpdei864NOhQ1qSTVXaMcsqICP73s+vls4M5AQyCOBEMqtbzoA5rn7ECvrRKfK3loyVSwpLul+85fQqIzfW2jKQJqMjMkDcrw55LW6U0rviOetvbYAfAGFzbHLd/e6HwcE+fKD2zg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyCFqr+vO19TI9dmz8ApOOFFtdP4j8FBjD00Q/1SfWI=;
 b=NL6MoPXfVQXuiV16oP3666Kkx3ubEjl7K5MP2R+mIe1335mkQHFcHiYWWQ+9poUJ27mKPYHG2Y+ddvgafGA7ZR61xSFedEcXKYqHQWS2AECyAmoWvyNM5THFxQhMy1BpFrd21xerHWoItAIBRNmbA0aP8wvvvc9lbUnFgfRZ8D8pvdtG/aqo13p8MEvYwkpftQVbZ4IO4k6MZXPqgdZQwlaKmjx4YtcvTbmwhg7YPJ1Xsf0b6qIv9b2OXg84VdndkrnXzhv4ZRyU2D7MTBBvsHA7pg6DkKwNdiyToewvQ94zaJeipjvRUD9GLts1BUUIIaWNLKN+MTogB/9pz/6YYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyCFqr+vO19TI9dmz8ApOOFFtdP4j8FBjD00Q/1SfWI=;
 b=t1FYobcoStnmBJYB0rxRG30py9tSF2+coe+1x1pxuXgb5yY66WyF+Qa46fZTsR7PFdkY6seWoB0KubJ3feeGcYqPv4fNTyyQffHPTeyG36C3dMoeUR5n5wEp9KxbpzFIekuPqZRIMr9lWLJZuWGpkYm0M8DMVZOnE07eqKw8oARbpSz++WMUSwyoqDHXnMP7do4VjhhLTg63RSGKh1zhIPyspFNPELWOPzQTCrYivxtRPGxGPG8E3qmCr0aTa+0kfGUb4ux0KHwGOX6J2UNygfOy8HXNw7+9gWO+oIlyhg1939MaEbhWi3oc2ZGMOJZp8GUkvWqLELfx+XwtBkNSXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:36 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 08/11] packagegroup-meta-oe: Honor VIRTUAL-RUNTIME_dbus
Date: Fri,  4 Apr 2025 10:51:47 +0000
Message-ID: <20250404105150.870898-8-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 818da6f6-b079-46fd-077e-08dd736716c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b4a0o2a0S7axkVr4pFGFY4j3GGFDTFHvdeY0YE/WSdGUh5LPWOsa7ZEcUGjf?=
 =?us-ascii?Q?tld7GGj7KQLxxtVwLZXwilgc6+BiXSP0B8tLw7y5kOYMkyo4tg0u/pX4vlAA?=
 =?us-ascii?Q?gstyfQVNy/xQGPcqcvrYr0qWNgPB+yZev8PMCbdxCLlkRSiJ8Uct85HPSzaL?=
 =?us-ascii?Q?Kdp5JsCVlfnbjbUlpK3fxzx6ftgIGdHOF7XOofG1pLnsTZ4UhTuAmwSi0lGS?=
 =?us-ascii?Q?iThUDN4gNZqPXThUv5jrNrwEHKYQTrWBRF7xt54MpwqMWKPwCsObCB6btaUs?=
 =?us-ascii?Q?5B9yeKG/vyd/DQDj/y+r2LK4mjTngdyUI29WXMXfb/NtoZDQN1iX9s1XKE7T?=
 =?us-ascii?Q?h6tGYu6E/wn9WlpHxqSybxvzhrsDs575Kuf7Ygy1WAelBJFIb1uBjReDCZN6?=
 =?us-ascii?Q?o4v/+7YH0zd7SD1z+qyEL5CB6VSZLTbHL6V4/icIJx4yhpNd3WPTWD2h1780?=
 =?us-ascii?Q?kzt48Eh6wDPajS4Sbh4kU86ttPrrrFCJFvmpEog6TeclJ9sYHnv4tpWtzHD+?=
 =?us-ascii?Q?46zoz8qOcsLryo4DGmUEHcZRf6+19fmB6G/yqJX67N/EocxhLxbeGdCQtvhE?=
 =?us-ascii?Q?h/yCaBKQNrbPy0pVBueraDxkezdm8PaQbKcffpwsP8GuNfmVaZsrld1Cw4IG?=
 =?us-ascii?Q?ilxYEMMLTVwYu4GdhtOme+rt5hglDu0SII9FVj761vcXszzYClkNhou5hGl/?=
 =?us-ascii?Q?TOjvNJI5SJFgnuEBfAMxUmFl308bYnfMPiJ29jZWGnL/ozWppkl4CLvWc1S7?=
 =?us-ascii?Q?WC2jvdpcJTqJY7cdH4ngO3kVuzmVfojxEpdSfl2uVR9LjN6gRjo/zQlMfwmZ?=
 =?us-ascii?Q?XjBuXdG9PIp8gX9exacZ61P1ULYpdoAsBNh0g/UKCImx+IkvFJjYIl6LUEZd?=
 =?us-ascii?Q?RgyGwTELR5BldGA1ISYvcPd/6mPyVMfa44xuY+HeeTOaRs/PPao/d0bKI2Ij?=
 =?us-ascii?Q?MyzSmRB0SR2UthiDKx8SwnIu7jPTqGw54xOdICuUGsGa+pFsJrtEJQsxk3Pq?=
 =?us-ascii?Q?MQrteX+BJQajii2CjvBttNtxMkc/GKnjToXeLLdIviJqyg4RalIRXjPsLfas?=
 =?us-ascii?Q?QKFZN/EoLd0WyANNZkiuS8zholT2N2sXgchT2stoeeQim8/HB1XdqDAFYest?=
 =?us-ascii?Q?ISdSSyuCvKamq+iiJL/nO5F4VTX/VcSYld+9Myx3lu9Y7CO6nrsogCFnZbQb?=
 =?us-ascii?Q?QTZj7GQhiCv5NwVqPMVZmcTBmmcjAAkO16LbfxSbhU2yZpPa6Z2aJbQ5WkpQ?=
 =?us-ascii?Q?nbA830ZXzmxSCB+gzHkUQXkfoHOLDakZ0bV/eo+N+tEgt1KNxGG7x8C37/Et?=
 =?us-ascii?Q?yiGgWLPYvWmls2onWhqndnQ0UQMQjl2MVr2ECwSsk9e8mLTgB/zMR943WWeo?=
 =?us-ascii?Q?OD02Kopr1nbZL6i8Z5iiGtonNGEKky/yWUZYkk4m1fqUuGseW56q9q0UO8W0?=
 =?us-ascii?Q?PlJXHx6nWawFV8sKvXk9O+x9Uklrtpsr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/E+RSYgmZ+ltMbwrQgFAhFsL/I+YGf0xhO/2xpEOj/De3fkXutfr2AE33lEF?=
 =?us-ascii?Q?4PzVnIdAbAlG3HcoCpnG43GsjNRJvZ1nSYxpMVoMXf4hI0lzMH4ytA4kPqtA?=
 =?us-ascii?Q?WDYyA+O/5hW6C5YHheXqCpp8ClDa1MONbwtq17fCIpNIV4bhNrHxbkagebTO?=
 =?us-ascii?Q?03xWm3NHUxDdSZb9QPREOtrUNVHikd2CpMjKLsQQL8Cm9Qh44Ad1cfmm1tml?=
 =?us-ascii?Q?4H3uStUIvCjd46+HFerJ5LK6i9XdX9uCrZUCWOwztaDIlms9mxSy4N8jLMDD?=
 =?us-ascii?Q?YxedCSou314FeztZriSiDhLamH3j5+4VVgBCZvVKy9IkO4Hk3jrnkvel4B5G?=
 =?us-ascii?Q?VrPLBJqUGN++qlsKELwc4fJbU+2iZ1RmUK2lY7ppr7MPhfK6mfsUm0mZQued?=
 =?us-ascii?Q?X3ZpE+KW3VKmZGkfMI/Juqk2nMVVzDY3FSIfZ7y/emlKzEMv4+GC96j2fBX7?=
 =?us-ascii?Q?GPSs8KsqWNuswTjN6gddGcMKdTtpNqHOZ9K9HcbXfRQsiR0DnpuyXIVJduAk?=
 =?us-ascii?Q?qBxkiTt+VaIPdbNCQtfhSFXlg2raI6grBlIpYsKaLSC0SPtrq+wgzUNLRSw1?=
 =?us-ascii?Q?r941UzdUA6m2GaQ8bPmkho7TcPvIh55yFSkEu447yg5WVX27G+hMXso86i3W?=
 =?us-ascii?Q?ONho0U4T3IUQlYvfSBvI8jdOoys6EAlvxp/69dSavwJSOc76RGgmajpYuTn1?=
 =?us-ascii?Q?MODEOmuIBoqSpTFsXyPglBvu84JZHr0LYMtIi6aTydxFOtVM6gA5hNvspu4g?=
 =?us-ascii?Q?tLW5E5Rd5r5W/izZeGxumsGWulCpYjHH0t8wo9+VtLsvKy3z+uRTVOWzz0yQ?=
 =?us-ascii?Q?mkZdCVS50PlIGQ+ADDM6NYXj3vGI6db3fRpEImg74gSS3axb/8k9Lgp0x05o?=
 =?us-ascii?Q?lCdNUykIByjEYRBh08OV+HaxUE4QK917MSs1Rij1FB4+iqS3KHBtwHHc/RZG?=
 =?us-ascii?Q?OFqqbSqrjscA/rMv/oB6CWkHFkSXBfC0JK8ILG/MAMr1efewK9IhIuui9oo5?=
 =?us-ascii?Q?vCzL3lN8A5LxWizjGaDWhCIZDAyLGt/wl/2u3BNPYA0vAlsG8TbAddrpQ6At?=
 =?us-ascii?Q?7wIPakQcvTIqB5nWtzXXofhovhpjmYx0J7bVxo2norKHYXkNSnLv4lQ1cbfo?=
 =?us-ascii?Q?Vee12Zv/MeATPajwDy5i2gQmQrnXesW21dl/ChTt1xJDAjzujed2EKKwDrMi?=
 =?us-ascii?Q?bOlSz20ui7nKpq984+hG9ZGfgKi/2yqA9ZymUN68ppakESgov5J5rU+wylaW?=
 =?us-ascii?Q?9r+GPpE3UXe2fEw3ZrhSlsgPfzictZUrp/518/FgeAETZV6PIbaDZ/7EPpWY?=
 =?us-ascii?Q?erl5q3LPx8cyNqmq85OSTYeqYvjf0+Fjkur9XQeDSkqQS5rq+gYBSjijq4np?=
 =?us-ascii?Q?4y/mybjUAX14MxmmAAOUTzFM9mhXjPNaC4UuqmGCFaquvBiZ8lMgQX96gxVv?=
 =?us-ascii?Q?n5BFysS061AvZad9k8krIi56r7UQsKJ9m18xNmGEUoKTnnNc3Ukoj+9CpJaF?=
 =?us-ascii?Q?wCbkiHQLJ0hOffjWjc7AwN93lv8UH7UtwgRYONvh4E71LCOgtFg5BbG5WnHA?=
 =?us-ascii?Q?4gPknyJbx1TS9MobLnzUN6C9XO6P4uKG5hTt9ER8/Ce81cahd1xLF3onVkML?=
 =?us-ascii?Q?yA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818da6f6-b079-46fd-077e-08dd736716c5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:35.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pF659Gkd3Gdurzv8brffzrQ+UBx1crGPcr5UlSasdlFqCbsAMuruoTbhu956RRTCp2yFIcPzhT/z3SSnVBSFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116579

The new VIRTUAL-RUNTIME_dbus in oe-core can now be used to select the
preferred runtime D-Bus implementation, such as dbus-broker, so refer
to the variable instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 70d05c44bc..78d91baaee 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -163,7 +163,7 @@ RDEPENDS:packagegroup-meta-oe-connectivity:append:libc-=
glibc =3D " wvstreams wvdia
=20
 # dracut needs dracut
 RDEPENDS:packagegroup-meta-oe-core =3D "\
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", =
d)} \
+    ${@bb.utils.filter('VIRTUAL-RUNTIME_dbus', 'dbus-broker', d)} \
     dbus-cxx \
     dbus-daemon-proxy \
     distro-feed-configs \
--=20
2.39.5


