Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128ADC61DD4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:53:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1787.1787856812482800774
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uVN7uC4x;
 spf=pass (domain: est.tech, ip: 52.101.70.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9j5WtFxhf5avCUM/k/cAp1gyS1seR4B0q3NANvcN8TotPS/b01d01GP9GGtcxpYZe+AznRHRBUtLQbi6b2jVr2EAd+UZvhqSo1iPC8egmPwCfL1GwMQnzAwGT1X3f5vOw+pI12v8fp6OZWNr61/WOTdfhhIFsb92N4BB5iXbVQyfbDww/aMUKSvX5TSLKNwnrMWie8KUOxBCb08VilRM6MYtKH9u35Yn51tVWXV+nvxa55JJKigmzjTyjJwE2jsPbLkAOxkwDXhIQ1mgxBXmhIhUtfEZsLNbR3ztmnvuNHPwjlnLlh5jcdORiBAB51mB+rAzYcTUcI0/nOGA4oLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+86O3o+s08ANtK8Z6XpAudsteWp/4wErQTUzy+vu8A=;
 b=SwfLbtyAipH64JB4jvfnf3Y3bTLflqUOHbkMtbzT4qOSXoGDUjzXlv6+De4JKifbR4swxawaqubwsD7nDYMLTuJi2gsncy6VQVCs252qrIFkZ0J0PhzRCi4I/FKNx/BtGI9RxvOLD2nX64euTO7+w8d3QWyy5XAPl+01vVlQ68EP65t6CKcfGeLolEA3Ky359YBgGoqqjfZL0c2WlOTsmYC6UZTAi643HKeVCdQlL7wiIQY7edErHNlPRP1eS+4Kmk6xunc7LwqkwiiS/jrQDsdrTeTcFEIPnUUHzYXzb24gJRudJaPgdhR7MTUQhmfPqJgGQIfWAZIUlgDnpyGqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+86O3o+s08ANtK8Z6XpAudsteWp/4wErQTUzy+vu8A=;
 b=uVN7uC4xX2fQtoWvYdbyCD/DWNkBBod5hxqz+o+Q0o1bnZNid09lC5PBcQ1dlIdCXvDBgoijMpThwJZOXxH3/gFuAReUSvxnEqRiuVsreYJbv6DwfjN8MOYe3sIgUt6LljQNAXCBrkylSktYwo0U/j+ajXkRfL2b/dJv7OUlD2Q0vAnR7ZssdYdv5Z93OhpOKZxDz7UHHiCLXoDSi1nw5jwdzL61qIgw/G9gCLmHdIX0J5dkwm3xvBXBzYKBG29CJEktolrlA+RJwcUgBfs1nJJ4x+kponaJZ2K3sJtKGs8Z4he+nHnNQLzWDHTZkibp1raSk3anSKyXDVO0y9E2+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA2P189MB2706.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:424::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 01/20] freediameter: remove openssl-engines from RDEPENDS
Date: Thu, 27 Aug 2026 20:53:05 +0200
Message-ID: <20260827185324.78997-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA2P189MB2706:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ded370-5d11-403b-75db-08df046c7c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	kuNO8e3fSgR5Qh8P8B2jaQuC3LJZatIwS2Gf8+5InNWJcSf/AetGzMPOhG05o0bI0WlovBs5QBX3u/zze5TiJjHZWcIED3vBpg8KUJo5lU1yJCXjkQ2YDTJRXbd0KacB/ZVw+7b1/vE/HjNchYarTrPkszBb93DkREH88Zr3Ya8CSBHLwhS8V1cd8iutQUfmhNvVf0iJV5GAiVCvkZmxLNgafHIpXm30BAqGqgc5vf02ZBt/2SGCnPW/LFQb76xUXk1+Ag0Gr5RIKEBB6gPl17WbAxq3EwAXVvjK0TMETy2W1P6OWD8umbKBtSOo23JoMufjyOgALlOj3A4CYvboqUEfY3Xfb3HcF1jIB3X0QmmHeV1Zc7I3Mg/zoDEeFD/6oOALytiuLDw5ERq5PTChAipA9DROpgsM3ex6iRXT2AZD8IMJDgAotzPfCTXJ5gBa/NJ6Pmw0+cym05gmJiePqkCFY3pUXPhvzPaa5jWl/JxvBtbIYKC4GrClT1WMeX8Hpy3BnlLgS1O4eytcu5qpdKY30Ja2158JLMCGUMAdJ+t25XJ98V8r7vU+eS4HfROnW732zqNXw81zTqPr6UPhI23NK2A3BvqCDTq5vFEt8DabOpUZYHqPWtt6bLrQEIpk9czdSv8PtFOzs1oYrHpxWHjhAoUqQXy34fZB33kmKFo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FnPpUVVDJ2AUGVw0POmQt152rNhmhNgXeXnnGgAbXdrR9tDidzLKquqTMX7l?=
 =?us-ascii?Q?qu0KXudP7GDwjzGSm5yUYd+7ZAVk8Fo/haQWPqknFkbFXGg0BElLzFkFEFAQ?=
 =?us-ascii?Q?XqkRlB5niJIK2iYCifzhHKLM6bO6QdJymcSec7wzbMVhCquF+7A2gbcyo/ym?=
 =?us-ascii?Q?/ROcJUcdI1z7XLjWWfwOTnJie0Ny3/dqAvm7ONTx+TfOpHnkIifauAg2xmLr?=
 =?us-ascii?Q?2aPgjYJkprUmADG+dVyGn4/qV1c1ebX1WO26jm8rT4hd93B0/lVPOexbPPKo?=
 =?us-ascii?Q?nkX9Ar+Zat8fprKJd6s5G2ZhvE1TsIiI0X1BOhazn90of4G/jbB04XoZMwZQ?=
 =?us-ascii?Q?tPtlLkxvWeWsRkc1nfZdDnV0Pf8h9vrLie3Vp8lwyn7B8Xi/o8clKWo8f9+U?=
 =?us-ascii?Q?BR6V14lecudQv1j9I/0UpDmVxd8A7hEluELTrXOcPJuoomqnmS6JtGh0m1SW?=
 =?us-ascii?Q?XamfslYKbBILCm6VF/kzJXM5MQIfknyZuIYtNloINS3s/R+MTqLwwZ3Zi5qQ?=
 =?us-ascii?Q?py6OGtOD010ITDfIIiYSMO//hsja4Le9UiDppGn2dIcWrtKscJ+nNyRE2TJX?=
 =?us-ascii?Q?DVwXc/4wgE7o0B7nty9pc1nWw4AI1PwD8giKF1i0ZQJvagkLG3hbvty4YqRH?=
 =?us-ascii?Q?QdYUchfm3Dy+MHjB7oL4nOXpFqEBTTPs5Vr6F1Z6FRBfvIDesamLmCA0xGQr?=
 =?us-ascii?Q?mddx87g5Q+wV/kXpg/OPiYkRuBeW5sLLwdF0eQC9gl62XNSz6AWKneeYVfAh?=
 =?us-ascii?Q?tth1u2CH6NtzJ6ZHGWiRixdw3EU7eEmwDfuAzTkjjitpJPfzftVBcZXfMlmp?=
 =?us-ascii?Q?WcuAyIF0jNqn6sIl23PVIzMZD0e2KjOT8ywSpxjLEAkp//qmFzUhfVeeEivR?=
 =?us-ascii?Q?UNbQgC4he1moKjMj6YsveIwdP74RnEUGfA3J6Km2uVnGR7vmsoDjRpBDNeqM?=
 =?us-ascii?Q?c+vXMTipr3V7tzJfpmx47kIgi/MeiYfmBn4Rz1fWTA+SqbxJ4Cad1Vf5T1PZ?=
 =?us-ascii?Q?58Mk4yYeyfD0s2sufkiJy8GcIqQg5dYp1cBFkgzdtsUXO7alhaOqr09H2w5d?=
 =?us-ascii?Q?6fLOhSaHnFuqRpxkJ0SZ9oT0l4CgtY+OTvbRVZ8jz8kHyJQruw7KHHO9quIF?=
 =?us-ascii?Q?9j1RHDyjNcNXycFf3s9Y+Oe9HP3Y4JONohw7iBKCyke+wZrtNVRaNOaZpcLh?=
 =?us-ascii?Q?jjOqqpwh1ExvAyZQ4fPGufr2wGLwJ8EAPr/iTr8ce0rE9kDiHa9NBH/qozd2?=
 =?us-ascii?Q?Gjir+0abKa2uaWxcjMQW6jMY1UKaSBeGebo9dlROrUbOaSH5yCYpcFsBSfGG?=
 =?us-ascii?Q?4vJww54JSi76Ao2OmM2TCVL8bZCI434zFc6Fs0zxDToCRbUfIjBdjRjf8kY6?=
 =?us-ascii?Q?A4qtjsmBSEKWukflKlTIyOzvqsb1C/YxGpE9ZfINlHYpUgCX6M6HxXmpE154?=
 =?us-ascii?Q?/LsIYbALnqiYzGFCNyI3nliNiQTnyqEyRLqftkYbwkdV+/sddmwA/EB5m2EA?=
 =?us-ascii?Q?lHg25kA4DJelH5Rk0eZTKeqg6NVxPUwDmILma7cu9Gla4NLCYmhQM9i/1oLu?=
 =?us-ascii?Q?Q67uT4Mwgvkj+/wfhUuJOzcmE64gS260mXlWfKThFKIzTgdL4+SOafXKsFFK?=
 =?us-ascii?Q?ze4h1p0VYx1XEyAc2tkGvh0R9SewkAGw38CHn6yyo1xEoT4snjcf/MaivmF/?=
 =?us-ascii?Q?CIenvpHIpo5NIaMTskDcok6Z+4KI9m7ZeB1e48uynF9CwN8dasZ7HEOJ1BDV?=
 =?us-ascii?Q?FERCPvZ4MyLnz99zQ5Jbl4g7m1Pkb6M/yrxEkep0cx5NekVBpxPTrpHYgMNE?=
X-MS-Exchange-AntiSpam-MessageData-1: pd8uqMJnk0+e0mLWmMq8Nr5Mgz7nAgMRILY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ded370-5d11-403b-75db-08df046c7c32
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:29.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9pYtFD0ZTafF3a77jKQHdc58oBiNZ+YwQmzC6idUzXM7noYe+NTHzmUPCq5m2d2dQ8wLZEuF0OU7R3hRWZa5WuRqN6yAp/dKrDQm2JTZuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2706
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129536

OpenSSL 4.0 removed the ENGINE API entirely, so the openssl-engines
package no longer exists. Remove it from RDEPENDS.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-protocols/freediameter/freediameter_1.6.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.=
6.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.=
bb
index 44be5044b1..4d4d8f32ef 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.6.0.bb
@@ -125,7 +125,7 @@ FILES:${PN}-dbg +=3D "${libdir}/${fd_pkgname}/.debug/*"
 FILES:${PN} +=3D "${libdir}/${fd_pkgname}/*"
=20
 RDEPENDS:${PN}  =3D "glib-2.0 gnutls libidn"
-RDEPENDS:${PN} +=3D "openssl openssl-conf openssl-engines"
+RDEPENDS:${PN} +=3D "openssl openssl-conf"
 RRECOMMENDS:${PN} +=3D "kernel-module-tipc kernel-module-sctp"
 RRECOMMENDS:${PN} +=3D "kernel-module-udp-tunnel kernel-module-ipip"
 RDEPENDS:${PN}-ptest =3D "cmake"

