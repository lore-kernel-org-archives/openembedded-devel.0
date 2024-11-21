Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B35AD75BD7
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:29:41 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.128])
 by mx.groups.io with SMTP id smtpd.web11.6472.1732177773316989998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=NEosXQU4;
 spf=pass (domain: ekinops.com, ip: 40.107.160.128, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha7P2v/nVR6mHHC4GyJksI4kzuOgjAANOVkazSrMI8BrPPyBFwZ7XfKsUC1/gHHvVIs0cbQjNRPamOHMr1YU57oqi5QD2s7I7IB0fxfNpmPRhOrWX+iwEblsqlotItBwSvNDhvfwRJ1K4RrZgtecPOy4BqDwW5zs99S+tmMQIkKxB3HJtbtin3h6BZ1A8j84MBnZzbjdcv4pX4iOOStdmI+dt5C8m3yGJBegAdpgxCjhF+hhup0sn79FUorPfZAU0gfyUzfPSf1xLhoiN+axbUaXX6qwyM5xnJnF8hmKtPSUMbmMkjrnM5OPySgyZ12Uax6TXIU2gakMR4Y1cOR8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCI5//FrHz+5gm0ESxgiFL9bFbebWj6Zs6UVHQoqdF4=;
 b=pN2S9MJWjfZG/1+0vdV3UPLTH36lCYbsN8suHWaQOl6bq6Bi8D6c0BD+d5xDZnNB+U4C0BtkOw8gELUorkEmydnlQ2kP159YTjKTnK1WXYKhl1fkKC5L/+I/PKuTgB9WLC072rlSJ+CUerFEqHhuZUt+iQ5bXvrF/ZMSHzojMUNIipawL6E8ZltBI/+mRzyftGxT+JddaGFyIGfKSPHH9hFV5c4HZXiHYi4QYKbAmQzYmyVza+FrLRUDruDNM1/6RyReBYj+GXfccE6kIGECPXkSIo/CNC9o+ZiKFyRp5HMZKaVIbKLFdsFJMg4cCqTZ3eS22bQUwGBBM30uNBLriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCI5//FrHz+5gm0ESxgiFL9bFbebWj6Zs6UVHQoqdF4=;
 b=NEosXQU4GE6xZ7lRc6HPNFwyiJDSC4hRougmqCKO/0CdfV4iH5ayEXdAE/UWXsT6p8UuxdQK83umbptwRehDnwAQMx76SFbOZxLL6Xy1wBy0UsludIK2al3SiZHh1MxiD6pUW96ufHBhTZUCd13L8jHzgRFSCHPKQ17Ih4A7d5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:255::23)
 by PASP264MB5740.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:49e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 08:29:30 +0000
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1]) by PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 08:29:30 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-networking][PATCH 1/3] net-snmp: add CVE_PRODUCT
Date: Thu, 21 Nov 2024 09:28:59 +0100
Message-ID: <20241121082901.2747720-2-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
References: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::10) To PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:255::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR1P264MB4342:EE_|PASP264MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1530c5-eeec-47c5-d02b-08dd0a069e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AL5SvcFE+3KYSoc1nrAIYHFataoWR8QhUTFxPRT+eabNYGopemRAABAytp36?=
 =?us-ascii?Q?jY+5GhVAhireSUFEc0Hrj/DfOgn6G4Cfpvt3ZbetTzQErSi4JxhRzJqNZmtO?=
 =?us-ascii?Q?rOzpNhpdmkEN6NB1f2VR2NfBUJZhfE+hSOPHw/CVSppZJVmhkjUSW7Ip3Ow7?=
 =?us-ascii?Q?ZVQq8fr1+ryVQ2crbX8z1HKhkrStRvN9Eq93oseF+w6JecWHLTkCDyq2t9rW?=
 =?us-ascii?Q?l+b49utKHwRtooNK0jPVzr9CvP5PpPA+rtOZhqPWwxGowG4SyhPTKdCEK0XA?=
 =?us-ascii?Q?fD932z20uctF7Ud94mRcU8rl0i7tr4ohw5t0TLDvFldJhWSP6FfM02UZfwrP?=
 =?us-ascii?Q?vaUh7HzqMWMA4wjSe6ultY4ajheiV2OsbZud4OyYbEXNDIsOfVUeLPWHFeWE?=
 =?us-ascii?Q?4FT+FmBhxZNFWyRbN/jhTeJkYm/JdE2KxfupzUTpifmtFUmF/PP/vx1bE+vQ?=
 =?us-ascii?Q?kJ3wGxxrgb1Qnt/H+k2k9W4wVcFz5pNtjwQ3fv2QmRhfQDgm3C2Bm6ebWp1f?=
 =?us-ascii?Q?HT1jWLYQO+QUtHOj3SKdK1x5fs/UmN+Y8x5yCEHpecBg/xFudAyQz3ywoYvH?=
 =?us-ascii?Q?ypz5fJMwX2sAW6M2kr+EKlcoO9gM0wgUP4YfuwY1HF10eOIl0i1oPOqYuj/k?=
 =?us-ascii?Q?JEYXUy0JNziCBxY7nz8s4yVefPiFsgvF68rps/w2Va9wHhDuRTXfuZHExU3g?=
 =?us-ascii?Q?XXZN7rIwO9FqVrOUadD5SIqW2LLzk2h4TCzooV8UG4rAMk/8tkKyMB5x213q?=
 =?us-ascii?Q?/GsaLdldVYglLdehT44VfS2BsdbtF6M/sLdVsT1KD9EezBaoLJWn9kFsQJAy?=
 =?us-ascii?Q?PT4jf75x9J10qCE4AOD/14BWIhD+S/0uypELhzOoPxF9incQPG7OOI/CzKmG?=
 =?us-ascii?Q?wECoYKR9zbSTePA6JI1WVshAA3WrQqFKfDHre9maP03Ouoh8GlC7D0TLoePA?=
 =?us-ascii?Q?8Hb+aHYNGcGvgnaKKAS9HWhxuxu7x798Sf/ub3yS2RyNFtd2m+4j6yxgK5Sq?=
 =?us-ascii?Q?bSQ0EvAM6Ra9QXq/iTeMbchg7FJZhaWQQyMQTS6Xu/YPgAedVeked9CJF+Wx?=
 =?us-ascii?Q?0M7jlCNmwlFcUWamOUnAgdoqJjXKDu3DIhIlbo7Se5E4PaVixwhaW/Uc9HOS?=
 =?us-ascii?Q?VeNbpHks39EHA9v080FuFvzuimFGUk7PV3R2lPiJSVCPMJXhLOPjvworNei8?=
 =?us-ascii?Q?nfEHwpE5Mlruxjano2L/ob25KDSu3P8rcOXyGxaslJbaCpvM0SCIg3ylM39u?=
 =?us-ascii?Q?wJNbeXY0LOissOko/I5kPHaYZHbFiqbUsJuUP+OTokyunulYWq1a4jzQ5yqg?=
 =?us-ascii?Q?sDj2UDP1VvdkrAmY2UqD8eN2XareJWrKJLk/ZHMcxC/YbuxVwYAXBnNf1fCM?=
 =?us-ascii?Q?sHVUjQA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Vl8JMv6UgWkt1tZl+GowtcZxk1m2RsVn46MFDIrW2qNixwcBfU7rOqCZ6xj?=
 =?us-ascii?Q?tIt74yL+4bFP3f+sKlJeWqoi+sXDfbAuCkauiedurBxp+Iq7aTMQ8BOTpyJD?=
 =?us-ascii?Q?7PpbeYjdXlP12L5d+FtEdegCXIoC3ZtEBD5ASpQQ6GMkBVjNoGnrN/8/l+cK?=
 =?us-ascii?Q?5u4beEUtCJlCwM5D3fxr4Q5yYLDeJRFhiZ8VlsRB6ruYUmEjHwxWgjukFPih?=
 =?us-ascii?Q?FK7QlrbMHnuaonz5UtlY5DRwFs7FbkL3jZzqChErYUtva1onamatPRGlH+I0?=
 =?us-ascii?Q?zUUwsychRC6c5lVW6tuCr8wdNCM1MvwpPHdDtzy073s5LH/71Gl71kM/r/xg?=
 =?us-ascii?Q?qZdQZiff06W+e+YMB9npcxXIagPApqEFH45B28h8OYauNjcd5FoOnbZpxQfX?=
 =?us-ascii?Q?k8Q9xA2vCVJa5LwHUM149OsVAs9vZ64NO3AdZ/bE5tguKMf5Z/URUEktBpsu?=
 =?us-ascii?Q?XBMEybty/LGdvKEySxwV46BCZFTJqxqu0WRrbmhBq3H819HSkTRrsS3pQ7UO?=
 =?us-ascii?Q?XSvvNv4u3V4kcFbx8tGhZvEa3dtOhmJ7YvOo8xukJrDhs3YlEMlHpFtSXFGe?=
 =?us-ascii?Q?O8U732dWPERNoF1oMrVr9ejjLsq9z8HnleL1hS+30THb4SPDYM2nnnD4/BSq?=
 =?us-ascii?Q?LJuAtnEg7wrEhDXg1Supo26lHx/ehUZ9CqqeHPrlZKFo+mbBs9LnKj86Xys7?=
 =?us-ascii?Q?R8Bj4+4RHPmtgiHxuhU7unEG5Bw/5YwVrKWprE49YvUT3q1q+DMtVmHJ4afE?=
 =?us-ascii?Q?TmniyXT7Gww3gmOtnWQ49pNvnIzLhaFH6jGYDB22LI8gI3RC/rDidUzca44L?=
 =?us-ascii?Q?N3n2Y7tz66b/TO3ez+jEJranAKYzk0LcKTk1j0jbalVYBDuqiiP6Eo4nQ+K4?=
 =?us-ascii?Q?RR/++vtIdt2ouTBnoPfJr+UEGTAs3GUYXh87OdJJWi7FqgaK7a2Zqbf/+tWN?=
 =?us-ascii?Q?R3J2fFDfB3Hy3oufFtZ+vqtTZuxs2tfV/YgPzZqGIERzemt6b9IUXkgZ8WNf?=
 =?us-ascii?Q?BjLWzrxLTB/GjwHY6bDwMbRvdvQvLKe4NKdDe7ydmB35pyIcarRbeg+oHlrK?=
 =?us-ascii?Q?GMYRcQV+0IcCsCXZA+wvTP7R38Y6R+PrE4yWLVfx4K4NCu+2EcQH+uHB+zKT?=
 =?us-ascii?Q?jEo3yNeuMmwS0aE/v6/kn1LyTzqOLl4TgwHtptH2SDJYSrkKZZdXhgavpnwe?=
 =?us-ascii?Q?WWsGSMAoy47/extP1FixBfJm9IWmTlyGEVv2Q+TmWom8EBkDogbyx2eP2Zbx?=
 =?us-ascii?Q?uhtN/lEmYczPiWccLAEF092KvIhQvXbdLmSuvWgVtLa3relJowEP60JUuQl8?=
 =?us-ascii?Q?R2c+hkBHYfgjk24CY5ieZc0isOPk41WqLtbj8F23rLGFJDmmULXmJ8MrSBzm?=
 =?us-ascii?Q?VDF1hJyUBoJ2xv/4y2pfNT/mvDevjwIZQQx1zt25BK8At3oOBGDFAZKT7/Z9?=
 =?us-ascii?Q?vTIegTWulTYNPXICnOvCXZWSKc3itSVfpJQII1cNGEY588WRkqPcIsI/WOt7?=
 =?us-ascii?Q?q9ldAf44zY7L2bhDvjN0hCHlzhsJJ8ifDeL/D0V3JPcEMWqivXkkqxByJzJm?=
 =?us-ascii?Q?+w8Y8JUEkSkfD6Rb9VbzOBOUFULX1jG1+qaDEnTVPa0nfSikZBw2sHfg863w?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1530c5-eeec-47c5-d02b-08dd0a069e84
X-MS-Exchange-CrossTenant-AuthSource: PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 08:29:30.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaBk9QgtU9yNZKkf/qRxKxEZPfLesat/eET8tdzVNPec2dQDljBoayPoMktGPdS3djrUfjwRunaAXl5vaU6pF/Ecu95pq7EdcT1kptQ/AUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5740
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113958

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 989ec5413..06decbe85 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -34,6 +34,8 @@ SRC_URI[sha256sum] =3D "8b4de01391e74e3c7014beb43961a2d6d=
6fa03acc34280b9585f493074
 UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/net-snmp/files/ne=
t-snmp/"
 UPSTREAM_CHECK_REGEX =3D "/net-snmp/(?P<pver>\d+(\.\d+)+)/"
=20
+CVE_PRODUCT =3D "net-snmp:net-snmp"
+
 inherit autotools-brokensep update-rc.d siteinfo systemd pkgconfig perlnat=
ive ptest multilib_script multilib_header
=20
 EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D} OTHERLDFLAGS=3D'${LDFLAGS}' HOST_C=
PPFLAGS=3D'${BUILD_CPPFLAGS}'"
--=20
2.34.1


