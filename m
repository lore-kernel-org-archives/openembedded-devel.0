Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467F3C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 11:03:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.119])
 by mx.groups.io with SMTP id smtpd.web10.14233.1746011017442280606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 04:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=4zSh2lLm;
 spf=pass (domain: navimatix.de, ip: 40.107.162.119, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoVIUyYrCzWj8lYFBuaS+xgK9z1KUnElMVYtYQ0132S3xMeqvSqbQca4Ic61AZujTa75NuuPuI72EQ2S9PDBQ7dVxMVHyi29woogewqSxGD4fezWWNbvzSII2uMTDYAEl3FxKYl+FPKW5tHyDE23Yn+ysxCZjg9ndPzbvmv6wCwTDpyr0NKg9J4QfgF13kJgEwkE9ySMC0ulQJjfs29N+vEN/Hiw4v0rm56WdoR8FjSOFOdVGJRgZmnacSqAqTDOHhna/3JrpjMOlLnhi+p8k+KTJKpOMlVzPMyLV4vQf9yGwHLdMh5U1XPUrtXkhO7pWBlw0uETlh8PlCspXFfVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxdGlSY7VX9CjmQ5PVyV91jrxLJ6ioJCmIKMP2DasQQ=;
 b=lzNwaeaP9PoT8AIfG7LOPmY7xi805dNw9GRw8R+aQZziugLBQTluCPSmXhTyBKXXbZLXlhpazrz+iQe6NABkLPvry6j/MqC2hNMuuVdhKDbZPI+GMKkBbUTmLfTVwm1pim640WAKEx2QITfonOnKSlu6HUngGS8iCD1tG7uejJPFJPZ2Dor2EozvJis5QnJWy8HMvkQFJ9dTbo2ls+jiN/vYZgYVDsCsXYf+8q1RZHEScPkN+FpXbp3wZ3nh1D93DWvTfza+MfyuKkzzxkITGvwqA9h4X7i4ruLXGDJvP+W5sMtNkpIYOHjTGJWixMWxr1OjOpH5hzdZD8eSrt623g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxdGlSY7VX9CjmQ5PVyV91jrxLJ6ioJCmIKMP2DasQQ=;
 b=4zSh2lLmDZdX+5gSGlX5AbNDmHZVCzbW9PVP05F8gS2T1U12lrQb4HzDXSWKQzQT5gs1LW+qxsT8rIS37HNSCxfDAStTJoiNKC6mKLR2h58m/CWZsjF0kEUtwcyYvC8nsA9zRdB4m6qoB0GdT43XdRTrBwFLTrD4jHbh/IL1OWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AM9PR01MB8297.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:434::5) by GV1PR01MB8481.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:20::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 11:03:31 +0000
Received: from AM9PR01MB8297.eurprd01.prod.exchangelabs.com
 ([fe80::ac1f:a3d4:7e5a:72a9]) by AM9PR01MB8297.eurprd01.prod.exchangelabs.com
 ([fe80::ac1f:a3d4:7e5a:72a9%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 11:03:31 +0000
Date: Wed, 30 Apr 2025 13:03:29 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH] gpsd: Add BUGTRACKER and HOMEPAGE
Message-ID: <7915ef7d9d9ccd45ed5a43fb20421c2ae38c4dfc.1746011008.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::17) To AM9PR01MB8297.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:434::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR01MB8297:EE_|GV1PR01MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eaf0170-ecc8-467a-2d16-08dd87d6a453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fxhNAEdKAI3xDyU67q6u0GFZHILmj7SPlSUoyCb4ag2WJ31wcdiUSskgxWGf?=
 =?us-ascii?Q?YLm+I6VUk0LmpQkXS1g+JD0I0VP/XsCJwvGZ9JDiB6fTJ+TbDMJlykx9W4ZI?=
 =?us-ascii?Q?6gDPeglSvSwEieIJnSuT128b6noC4E0Qpuqitl19m3H8FvKGaH8rmi7uS84Q?=
 =?us-ascii?Q?VorNL2lpMUO1jjgEsYcz2yf+sXsjbrlg+08zyE6OZPzgxWEFRndMQpClh57S?=
 =?us-ascii?Q?r8mIT7IdKtkfjRaaZnGVTwjjk1cqnlY2Y/Hp80oXGze9/jEDfuR5jw7NXQgu?=
 =?us-ascii?Q?SC7mQZRu/GwIMDt1oSeOY+3Cw906S+hzjywzccugfvkdNwFERiRPL3oezPPe?=
 =?us-ascii?Q?Z9jD7dHt6bC7HthUvliu4bOwR54V8XATDSk1+ZqoFTH5vTn0pgrbWRxGHTzA?=
 =?us-ascii?Q?oNQTTxGvlGS0yqjxwu5Adc/I28ns74JGM/g/w4R8SQigY+eEiBH3CJ1Vqogp?=
 =?us-ascii?Q?xxGjdw4n/7j5wTJhUkz1Bq9bx0DGgNodRndzBh4wF8aGf5UzSm+8QhTSivtj?=
 =?us-ascii?Q?GY6+vLRROXrcT9JFWCOqWrqZQ+oIDaHFm64syU7Rnc3KtkBAVKIdM7ihSeLe?=
 =?us-ascii?Q?zoB31tCtzW44YIgYmWQD5jjhWf80bwETkaPtez36OMHa53sCJi5DOR7Z5P7X?=
 =?us-ascii?Q?Q8RGPTwyez8VFdxtEgKt7VHBI5hMRxCp6fb+uC3N+QZ35c3Cn8FScoTWbakZ?=
 =?us-ascii?Q?Dv6ztx1sYi0vSNlyIbp2Uezgrxc0vZWUjt9+4Ev6KBbV19Q2jyC3pUXCpKQK?=
 =?us-ascii?Q?OE56nAeZ6qVWDNzIS5+LTvl7bv8D6WUnCEY2Xb6G/bQEnZNPdscT476GfYEk?=
 =?us-ascii?Q?8pl7RnAaarEPjC3QcDRIcm5vmMmGurAzLBxkytmf1lLRfMJPr/mVWVz+AeNE?=
 =?us-ascii?Q?p/hb+iGxVXyHOcp+g51sAEjjDv9kmBmeO4wC77US7CpJil509LljBKZKyEMi?=
 =?us-ascii?Q?DhIi3AXh93/tbPqD1X/A7o3Pi4ZAwSwzHdWxyNLhTdX+oxdxsxJKKjzPiSvy?=
 =?us-ascii?Q?HSszY3mBvqY2A50jQS7X4sw9HYWyanVe5D3zFcQn7dgSMkz/W1GLfGlFeyo9?=
 =?us-ascii?Q?Taebi52DXRWtnDBsMbIv7LMf1rl/cD3R7hZoDZeu6rn4hCuf6S8beaqTSKUd?=
 =?us-ascii?Q?z6ouY11JEJNcmb8F9H+HD22iVZq8/dCWk79rsAZPNc5IIO0UYRfUhiBJt5Tr?=
 =?us-ascii?Q?v1orGNihoT/Crztma5nBTmSpVStwk0qOD/LYN96u4wRcCm0bz6Rw3D4YoES6?=
 =?us-ascii?Q?J4UtZTnuD2KIaS08N+VBrk9vBtVeHl7dNaQub+uHLF1atYSAPVaS+436wb0v?=
 =?us-ascii?Q?VRUSdinkmb3QseRV2EKCQTg+nhAhxSrT22tijuGp/uGlXX07cF/Qirf24HBd?=
 =?us-ascii?Q?3LOIkdE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR01MB8297.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XU6XSzXeNSe0F7G8cDW0zc1CcXTWWrxWEwbEj0QsY5Wxhv3ZKUtDMPDG78VL?=
 =?us-ascii?Q?wtsMqr/+aA0QKq5fZRcXbRYdVDTZIvaHT/4gv5bpGr84mg6P+BktGhK/eokE?=
 =?us-ascii?Q?0tDXO6NO4xUHMKftZnqPtAeyVxIPliXkKExIFC/wPOPe9+Vp8UP0n6HCMFe5?=
 =?us-ascii?Q?fmhaI1tOxWOGcBveVzzJpVXOJHLTO2v89q2BAiJ//jSiQCxw/wvcw/uygYyZ?=
 =?us-ascii?Q?j/dWEP6BfvF4g+OYM/Cha+xv7GSTfbTMi8wMz0Rnz4cXp+1/s7pe6TBf1CMT?=
 =?us-ascii?Q?59OhkCURbCkZtXpwNMZrxThEaXv+VqPypjWu+tA+nVuQcHY+96n1YJhQe5Sz?=
 =?us-ascii?Q?1wMQY2b5u9fXw1+9LnM/YWj7+ZQUHoG0H01Jyx6Jot5f7XxLWA50tL4Jkw/w?=
 =?us-ascii?Q?Ce080N01JvWTXUyh9e5Te/Y0ToCRhk0syfbIP1E/Qv7PCFXFn+i8Tj+I2wvi?=
 =?us-ascii?Q?+/HLBYMmxOWQ6nO7CWYtB+RA36luEjjGlZHaei2IsfDm2DPZQjCb5XvD+ybH?=
 =?us-ascii?Q?32joU84Q8hWzN/EAH8vhnjGY2Ejlr6pNpSiHttVXuHZcglnEGxRXPA6iXlC1?=
 =?us-ascii?Q?KUhLVwOMaNm+05QccgIulIWBUjGgGs3/qiWADJys01fY7zzFhf0DSrAT3f2O?=
 =?us-ascii?Q?YFq+3fwr+mZNQrQcUDikrDUtvp+ReFvFIK2Rmlp85809164V6cgeM1bjz1eE?=
 =?us-ascii?Q?r1UnK6tokOBE6OAh7TEI+JVeLfZ4zOTRfEgdNQhCUTegsBTCLkABxSMZFsjt?=
 =?us-ascii?Q?pPyIfOk6p+IRN4Wgsppz+O1yTbB72TVdGOoSdumwCIkwqMbntCvhZ0MR6eMK?=
 =?us-ascii?Q?Lcxww2Sk3W17j1yrnRfRxY2KvfHpW/Y/K00vpE6PVuP91b42+vrynLLCPHtv?=
 =?us-ascii?Q?L3dxcDsb1FMQJ5WCBITtlR11SkBQZ/xrRyHJEn65frnl15ntMs+Nb1j3lFWg?=
 =?us-ascii?Q?j7i4qrLPRsHArvj7RRaz/JQ+y9o3GYzalU6v3dqcEplJMkJOlDkQNna1j8u1?=
 =?us-ascii?Q?Kc55ampiYjv84Mk/OC/MeadBtZD/mbuA/shVVETMYYCuIvjBS1BdylmBEs83?=
 =?us-ascii?Q?xyzUid6R4r0fTuOL8GzBQIuukpRGK0eAunr5Ai3cu+frkUPbr5fAZaVBziEn?=
 =?us-ascii?Q?NINgNhf7hAg1uiiAx/NTaHdRsyesMty2bwBPZ4zevgxbTrCLRQP71W1Z/9Pb?=
 =?us-ascii?Q?0CTce+5+Uxg1MaCMRc+79wRItKpMW5XACt5Ly9Saq7AVqyFmB4boBauQRAkH?=
 =?us-ascii?Q?+1M8rhWF/R5l/q9acKYzl+OGMYP6Ph2pP2WZg8agB3ruOCsyxc815Udcujvp?=
 =?us-ascii?Q?0WsvGkrzaNhbJvppS2i1yiMLY1TvbaIRCTmRLD6wkDnCDbz7KVy6b1QBrAkE?=
 =?us-ascii?Q?ySiQSEUPTPF3jF3rbF2NtT1NQRxvIDXSMGW+o3sdfWtMdwxmiYKWQXmONBqD?=
 =?us-ascii?Q?+6aa1v9b297PWM4TT1DUuSZ4QJIuJgTqZxkxe5o6mA0j3NeVKQAGcYHfOwLj?=
 =?us-ascii?Q?R5iBkFJHSqPzlRszc+Kw60LpJMEYTRFclloPjkjW5FLDvAlaKIZF9/P8oBZS?=
 =?us-ascii?Q?H0d23VQrjxguBfShxd3CvB1NoqNzo9GUZ7lQZJT6ERe/QBRAi6cjAsAjzw4G?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaf0170-ecc8-467a-2d16-08dd87d6a453
X-MS-Exchange-CrossTenant-AuthSource: AM9PR01MB8297.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 11:03:31.2306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olAJUQa5BBBcloWlalZFNTnOYQQGX3U1HbJo3sWFFWMFDcg6pU7qbF7oYeHDD2ZrHvgN7RVCDtU5m1Q3EccEQng8jsgu7FFu5X2XulkNYgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8481
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117249

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes=
-navigation/gpsd/gpsd_3.25.bb
index e3b2f8bf69..0d5232c88c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -4,6 +4,8 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7a5d174db44ec45f9638b2c74780682=
1"
 DEPENDS =3D "dbus ncurses python3 pps-tools"
 PROVIDES =3D "virtual/gpsd"
+BUGTRACKER =3D "https://gitlab.com/gpsd/gpsd/-/issues"
+HOMEPAGE =3D "https://gpsd.io/"
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
--=20
2.48.1


