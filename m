Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30269C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:29:30 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.134])
 by mx.groups.io with SMTP id smtpd.web11.5708.1743593362072301992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=pPc/ij1v;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.134, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLYrivEUG6Z9beLXUSiBw5NF/+ADyzex+rDCY4kDNsd867ele1aym+x4w7negS5qXYfatb7dk6BuMm4ihJ4Xtx0WVVeTO4Blperq5+lI01vri+HjFMmS/A4zJwLv3LGmE/VTMm6U9zeKd48QDnaOeQWg4iUvfoPZXM2Fx5zL9VOPKFiGV0Miw7G6ZTjOdDPrV+iBA3lTCwQg7v8CHlC/38mRtO2JSB5iG0xRjGMx0/WBIwAPiJam5+Ie2F2AchIPUuHVn/MwyVzNDQEHzURkNZ4k4BhFH9sQ7bZ6Yz4eFv2E4e4kMcf9p1wofv+FfuI8OEqopyfVIDdhHyLQcBvJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zlbcn1mmY+8QUTFjqpdCMI3tDRXvrJHThvVuJJWR4e4=;
 b=qFWUmtUK+E0yIUj0IKUWUydp+okqx0oRJ3AcD2f/AhvZSOsK+3aXsCL9dPOoXvR0VJ5U2IHzRKgZLT6xLNpGBVbIXQcg0PgVqO5hL4jTcK5GdvHxouP/k2O9+SZc7GRVJDZcIUUrcCzuDoKTSigkNXVJwX5yR+TQkEt3XE5krV/QVmxSQPnyIeWTLSlxpD809K5jlDPbW1giigPfVGCEIQFwpZYgdFberpfivp8D0orXj5g+V2LDnbYXBtKzdg3KwtDLfmi7ihSrcayBwTcI/lVFZngl7t5xtnyL10PqKQj6HaWReZq06FzTlavtr245dxXjTr9LRDh2UkJkpufEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zlbcn1mmY+8QUTFjqpdCMI3tDRXvrJHThvVuJJWR4e4=;
 b=pPc/ij1v1kgcG77r1uvHfDjOVWV3kaQqwtcQZPPFZl3O4PGG8NKMnuk004Sm5E6xMpDbuFY/V+WkoEmb7CwZ4GD11jh0U0k3zdjFoChDLKW+37t1Vqq3uCzLRBpfAGyoNHdOb//YQT4XXSbrNkMW8ybk0lbrM8USIOdfsqgCKjKTe+ITtn8oZj4vq/1fj/z7mvXCHcCPpgn3XqY0HUXk2EmMhfIiHOAu/uzoflYiicZeT8LxTbvRGCANgxiJjKPxsUnYUeNHa9rPcjEe16DTvM9AgChrLsPGzKTj6K0GxsGXOyM9G3B3OSfZi9OIi9FMb5JAoZaATpYrrKtlNPFJng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by DBAPR06MB6839.eurprd06.prod.outlook.com (2603:10a6:10:1a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 11:29:19 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:29:19 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/2] iwd: Support using alternative runtime D-Bus
Date: Wed,  2 Apr 2025 11:29:00 +0000
Message-ID: <20250402112901.3804235-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::10) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|DBAPR06MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f11bd6-9ef4-4db6-69fc-08dd71d99b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VaZSltoG7uvsTV1B0Jeda90yOWC17xUBZ+Nht0egXG1o9lA0DZ3NtwZnf/Fg?=
 =?us-ascii?Q?zFoLFmXDXtOkOZbHdcmP655XEjZSQeJ79fZCbhYrU39EcG727WrKRZuNCj1Q?=
 =?us-ascii?Q?zy2i4vkfPkd2IYjnLiAru/zhbdIWiVWkJNz/rTSwzwApP9itVGrnVCHCGkTJ?=
 =?us-ascii?Q?VZMAFmeUMFIl4/NFR+qtDsSnJNvYxYJdaQ88CXz5tKq/jEb/t2bcmGn8Y7f7?=
 =?us-ascii?Q?YiiHdA+L1rsRacycd7qwvjJSERwgjmQ+Y+Ru2UgtPB0RmL0h8+pqEZvluSk7?=
 =?us-ascii?Q?BLFXkrw1M6higUk0eZQofzPLS6TLz0pGA46BwnOzj23Od/I70GRw7Lh141dL?=
 =?us-ascii?Q?CiuUj8jsTfzz1PONLL5vV23ZYsuw5b4gLcz9ANURd84RrOA4FhU2OF+xNKbp?=
 =?us-ascii?Q?Z4MJqaQSEQoouzyA2k9Vy/A7UCWqy3HE2lPXWdBLHzFns3n0Z5F8vDa8jBn/?=
 =?us-ascii?Q?2k/dABl1210p0YL/JKoO8fU+eL59ShBcu7HoX7sfwvZEhX8Y9PBotCFh1wTZ?=
 =?us-ascii?Q?jVgymqygTfGTvhqOKtt+J2BgOPd017hYiYv6dvL5ApJ+nE0IleQygy5qPBpv?=
 =?us-ascii?Q?m/CIdBh+KxSifv5v9jpPlpof7erGGSGL7z3HoMZ6sjJRMowpWJAEqa/avO06?=
 =?us-ascii?Q?bVQs2M1WAyeTAGMGDsjAL82ycHN90x/6naPfhen1kccGGcJFts7TfVjIL/zC?=
 =?us-ascii?Q?Yx510SnVQYwllpmlQIlTZqWFyceM+B8pKAEiQ/2AObW/GlhAkDShcpcCovWi?=
 =?us-ascii?Q?4iBicFuU+kynsBLnS6Nz+8CHyU/9GzYxLr9I/sD2braM+GzOXWlVCOx+oVI5?=
 =?us-ascii?Q?BWWjQ4pVdo4tSxJUHNXmbc7Teal6jJ/+LWxmylDAEt19NQAZlTD4Kov6Wake?=
 =?us-ascii?Q?owSnMcIwxBiQitcUN+GVqBEwzk3JDOR7oSY8cgJj3tOPorkEnI2Lgn41yvME?=
 =?us-ascii?Q?4pWjKPhCgvF9TBZn9VMmJ+k10nt7TAscTMUs62CnLrJJuzR18M+vtROZmUyu?=
 =?us-ascii?Q?aI7aOPplIFQZK1lkI5hmQtZTCS+VALWiepxF1++XqjZFP0NIJzKT4RpG1Tuh?=
 =?us-ascii?Q?n34+T0DrYZth9nWP4tDkcYIHqhndMFjX+oZTs4YboIF+9c5oOCFCOwkY0V57?=
 =?us-ascii?Q?mVidV47amcfpFfkJeZZpTuMuLJdtn67gaUx/KTC9+JUPAY0uar0VBKC/I1ys?=
 =?us-ascii?Q?tKstZClmU2Ix3hBTYF0ypC6l3wVrvu6LZvZCJD5V54hQTaR/yj9dITaPxuI9?=
 =?us-ascii?Q?TVf22taBQaYyUmYzdNmWlEUE/QzzfE9sriPd7FQvQI5M6IFixCWAqi5ErH91?=
 =?us-ascii?Q?IEjuGdcSzGGh/du62rS4Io2pex66BPVO8BbJoltfw3isrl4a2QeB4LuHG2ng?=
 =?us-ascii?Q?Z4XikHkxsJixQUy1dMxBfju0FkIUmmMPqr/tUdyR+S0luqUxrqm12r6uZ6oT?=
 =?us-ascii?Q?AsIa+FvllI97Tet4UT7q5LJSyIXe4Bgj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tsqXYDYhg3e6RCwgR7/r4wqizPsLb79VmZu8HW+bZqCH96Y+8+RT9fpDkHcy?=
 =?us-ascii?Q?K3ppPbpX1Z54cG5aGjQan494R91XHGPS+xUNrNKRgzttLrDRUBIwfErhnBm4?=
 =?us-ascii?Q?N0wK62cnpuckBdMgln2WUFa6XQkPzZfMDTHy0Jhy14EqpCxztNTsRBP4v3ZP?=
 =?us-ascii?Q?s1CcLHOK7HT3lbtXClHwcZQWZGJYjJ/hJOxNb5yeyWByOlIYEzJHtzfVjXso?=
 =?us-ascii?Q?nLtQE4NoGeMNyQLFzi6kKK+4D7pb4VkaNg+/VQOeV4IJl/OvhvWcmbMgERKa?=
 =?us-ascii?Q?mP2Km8U6E8G1x3NbW4nFttDEUw6mAOGVFDUik775sGEeMRiFv9sNRjPfbr1k?=
 =?us-ascii?Q?UUSNaNpRxRI6ciqbdBsbZeHDSPhreLQIjLqLJhGjwFCTyDwSUvGOoUfeJL2X?=
 =?us-ascii?Q?P1jnQImvVK4ETzqNNFh3B/d5iJK6VH9in24ttjFApTFFZBtOUKTNzh2Iq3zK?=
 =?us-ascii?Q?x7PsAMnoWFKxJzpmmP5EfEl/E3D5Em/bASyuUrloWsLTt5FLx6SIIka1x22N?=
 =?us-ascii?Q?g9nHHkuf6q2W7y/k9bh+t73uArnXW9xajRmI1zsXyRHCHAtCKXsCiYPbRpkL?=
 =?us-ascii?Q?x7yqa6jiLXFem4s+QxOuouMs1YhFTQv6++uxaLBWZyM8Q5xW0xyKVi0quRmH?=
 =?us-ascii?Q?sZLSDoPv6DmHPlM7o9DpqnLD6kA0uZ6avlB2MfwkvBhe3TApqJyWn9Yr4V7G?=
 =?us-ascii?Q?4RfK3mG7yT3x17kSS7oON+vBDq1ijGBanq2+4bvdaKgSohWrGqxRIucvqLog?=
 =?us-ascii?Q?kk3v3jlScpx+MrRJMestzxDDhBVjt0kQKD9xLMpXoBJKle8ByQP0oZPs3fsO?=
 =?us-ascii?Q?ezpVideIxRZHQudzvaSqfur5xUey+Vycb+ZVV2P9HJLEEVMlukI6nE8wcrKd?=
 =?us-ascii?Q?CFsUjFke6O+EcKfqP6d+NRmssfRoBuB9lu7QN5H1PkoqHUoZiZiiJH2S0rWj?=
 =?us-ascii?Q?SwRBMT89pVMDyxtDxQSbOVuryTg/DgwCvtCfIOEiVPFAUA2zRE3o565pdnuM?=
 =?us-ascii?Q?yatQUmFQhlUuKEG6jpQQiGzf1nvzyQF7SfvPqTN/76tXXjN6siwnwsIK3FvL?=
 =?us-ascii?Q?ek6cBmBpZHCo3GhD3nMwrJAzyn9wKCoM14ddtIFeF0Dv58NsOFdfOtKbLqSD?=
 =?us-ascii?Q?MZ7Ga7nH5MjWWUlyDaRwWF12CIIWw0kXJoPgRiyUOh5HQsoN4y//V77udtdD?=
 =?us-ascii?Q?iicAhOPwrHh/SXgMGqNDBAA3gTV9w9dGCQdudURSUHFudxgPieYWqeN9qOlt?=
 =?us-ascii?Q?4a4YcoHIUDqoUUc0sYKMH+ZKCMJLcr9dOBo1or0m5rkuZoWFw+yX3U8uigMA?=
 =?us-ascii?Q?mC0Mxi6me0eVYfTpsBN3kVQoExj+MTKyglLoz+2sAcnySUzeqyZgn9PyyEwc?=
 =?us-ascii?Q?pFpxRVgcSDRrBt2PoAyx954u8zXkCTD3HDCopTugC9+UFkADZ7RnlnNFpedp?=
 =?us-ascii?Q?SaY1BvzSImnwGMb1RFNlddX+U8FlPRl9YDnGKQIRvhkIBrehjuzdyO7KOCX0?=
 =?us-ascii?Q?LDAqCEFJrm6wSXJ6TqL0uBkP2zBZhC/zHidwyFslZokLo5XvTBEihK55e9W+?=
 =?us-ascii?Q?9HWSYx05DRAdpXoqiB+0X+h/C07FDFop6vsGgH8xdA0fDePKbpZJFR3jn2z8?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f11bd6-9ef4-4db6-69fc-08dd71d99b8a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:29:19.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVkikcoYN6gTqDhkEfc52y6iCaQvR60HVTo2ZgO5JXNz2TnqSbPNrC2ZtucWWymg6NMrQXKNv8Z+L6+yjzr60g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6839
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 11:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116522

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declaration to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb b/meta-oe/recipes-=
connectivity/iwd/iwd_3.3.bb
index 9d5b3658ae..52502ebec3 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.3.bb
@@ -53,7 +53,7 @@ FILES:${PN} +=3D " \
     ${systemd_unitdir}/network \
 "
=20
-RDEPENDS:${PN} =3D "dbus"
+RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_dbus}"
=20
 RRECOMMENDS:${PN} =3D "\
     kernel-module-pkcs7-message \
--=20
2.39.5


