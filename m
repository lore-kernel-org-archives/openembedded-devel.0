Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D68C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:34:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7972.1784270044476476986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=mdZ+ZKGw;
 spf=pass (domain: navimatix.de, ip: 40.107.130.98, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/VdyJ13T69xFp+2hrnZBkzrTdlYl6vc4YeiEFmTqXvPI27G5rtdF4t4AunTHk8ECP/1YxEmqgMV7SXDujKsbC5XVossf380kaLbcuMYMYLK2DjSTDU0/jFdoxvc5B/Dadgm93UcFfdcNexEahtSKO3AsAIrPCW1hMzOWT5fBRG1aznp+3S/A1xvWlQrE3b8y7jm4GD7TX3Md1h8+L5UHb8KvVM8Es/9U1eRml7SMt20vj5W08UY7jEv6AV2Vhrnj8tKSKyLTE41iNgkViMtrY3/UppTgaGPNdv7abt9mq/jTWrdLlYHR+PIklhbdU8uXqryJiwn7yen1UZaPAl/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSVZQAOaHd+yoWN/YF5l85vOVkOnF1QigUt83zXe+2w=;
 b=vDgKEDHWnVXggq6hX6/Ikcz1lYgvm2KodGnW/mag0QN8kAic2q6MWNu3LEwuXcEhtbPBSYe+NSuGuPlYtpo7BJSaPqnK1JPI6mP7IX6jW1b/r1vPunh0o2VSRcoQuUEtb/rb6Fy2zrbDMhOFxt228GGl986O3dzWtyTm6PEgE84NDfYhMJ79ipsYXHP1Ufyyw1OMog1Fmi5+XO0T6HMT7h7Qw1W3YJVeFCSXe4IqluRV+H4SVGsC29iAwmn5UTqT4zULNi1hQljqxEfjSk9b7A0P8fZo7wjM4qL1ycKCwqaSTT51gl/dGaWPofmzXiIULZd2Jj9uIehFDa7BaUtDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSVZQAOaHd+yoWN/YF5l85vOVkOnF1QigUt83zXe+2w=;
 b=mdZ+ZKGwUyqCWP0EikdaqArD/bR6jPq9fEl0qrObLlr0pGq1IoU5ig/ShuyvL6sBiWfffnq5UdIkhsuWYVvG9X922wMpmeGIR2J9HUwNOmdQdOJolDh0St54sMn32O/MErNPSWjFbcbwRPWHERcMs2gKobIgg9UsNT9VijXpLUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI0PR01MB11365.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:265::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 06:33:59 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Fri, 17 Jul 2026 06:33:58 +0000
Date: Fri, 17 Jul 2026 08:33:57 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] zsh: Update 5.9.1 -> 5.9.2
Message-ID: <ccc9289f95924943d5fba4f4be27e6c558652390.1784270036.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI0PR01MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d7a716-eb35-43fc-1190-08dee3cd61f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	D+EKr7ielFcNYQFiBhXl0HEVWr2l12sEhSaIKUtWSw89n0jrxQPmRETMUKlY23syCC40NDn1Av+YFl0B7JTCUMc9kBbIP6SzLcHTlycxo+9rJt6fAb9/WQ6VAaFJR2zZmoqug9tSx6DQoUCxzr1+lcjwqYNDaywRIuq7M7KETMLPtN4Ei7k5YPjPybCJ3qHU60mKP5oaHFgvcK6CZGZMpy0C3WJoHp5Uyrt/lI7pig/kFwWSgina/WY++u2LjZwvEQ8Sh/6PHpncazd66gY/COeapV3gVgxGOKnj/VB7PripaQp36QrAQzlQJuiyaURmmSPk2GpO0AoSrusyEW00P+q96G6CyimXwiaVEaEDLOoITGHYDHlaCsy8say53jf5rySXmEfqlOXe01UEvpgxOW3fxg30FqfAYFlQ1XU+asqbfqTuS/cmzfjldmxcXU5p+ADNXSROS/qIq6OQg+3jLfriTnrb1/9MshHeSgDXyQYvug9ndmlYrt3GdPMahJ1vxCyogHin+qYti+fQTdaep7jGVCzSf3nOmOwPqjaT62r5lAWK44KYscjRc7N9Mgff+FHnUp5QN02XduKpXVmdMl6Qg9JsPjuIF0ASm1e21Ow=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y9SoCNNm1uiYCPihG9owbVW/XUp5kXaEbaNEFeybyg1dryUT09UI9pocGNla?=
 =?us-ascii?Q?WLaoBEztbqfeK/yHYWFSP3ARx0O2PwkpFPZTqzOVqGPJ5gcBUtGSae0UFmiH?=
 =?us-ascii?Q?ahPz79n0I50grrmSJQPJQRqaN3BI9IEA5PAbiI9CPwDOPhRD5HEobYUCTQ3i?=
 =?us-ascii?Q?dODGwxiUfYLTaMM7pfB9+bn73aiio246Qc4m3mFFUI1KKPxqBJpGlh9iRCjv?=
 =?us-ascii?Q?3SK/U0q+Lk9sXJsu9YN21YIm3E2j1gJi+LF0+ivuuqPmMTRto1KdRnr3nsH9?=
 =?us-ascii?Q?u0RzQADhO/PSXWu8qyPnGCJYtXhoNd4RYYhLee3BJ3VrbF31ZfT3b09dXZB3?=
 =?us-ascii?Q?3Q2bcpiks5PT7itUhCntS3SISIRjHOsYKrSCbpVFHZKT9F+i/XCDESwaXWzp?=
 =?us-ascii?Q?KDGk3TYF2OGWuNE/J2rLhFIVQ/BcT/d17WlfTTSUOxaEjkSh7ijU4x+/5x2p?=
 =?us-ascii?Q?ged37fQI7LQLXIAO5WS18L9yECAReq3StpBgNnvk2FVxF99d5qYducGvx/49?=
 =?us-ascii?Q?TPK9uoE/4IaU+o0jTQU4AILia9TbcgsLWLey4Rcm+XjXwmZZZK32c0NsMBia?=
 =?us-ascii?Q?Cr21vtQ5z5cj/X0kTB/PWhiGEZ0mr9xbXA1xc2E0nG17SufMEFqiqGix6tWI?=
 =?us-ascii?Q?jksd3rOjp2kGWzVPBvmaZrGikfAOVBWSXQLkroQlr2PcRhk1PCxgwDKHR6Rt?=
 =?us-ascii?Q?/sbjAUWtshula0F4fILMMVw0ZNyMbR794adIQEBwKxZpxuieQJ89qEZhsJit?=
 =?us-ascii?Q?rIPYU/C3Rn9837O5TXPe0UWWuL9jE0wblvA6tksDyJc+Cy7mKr8RavY63/6Q?=
 =?us-ascii?Q?f+E2w/IE1v+pPgXUjDtsgNHaa2lm3zwGWg8TxK0CcHo2SzFAIxnlW70nkAuM?=
 =?us-ascii?Q?wHbhF4yOm5fjFEfarTtd3545VFeJUJMuUF2sl6703Rx5AUeU3BWh13+VaFFI?=
 =?us-ascii?Q?+tSbfIWzYxeZFFGICtjzuq7ukjtB3RYfAS9FWyviL2z3ifMgpdk4mGOC8Ct+?=
 =?us-ascii?Q?eNcPqrq/WEniscw/fK6Rgsd8pjKFw8J5rv4ggIJXhtvyt517yC2/mPS7IHdZ?=
 =?us-ascii?Q?AIbJ/LRDhtwYUe1mYA+ocRdEQbJXdVFWRHgLHfPQhGlChzJBScRH054Vm3mg?=
 =?us-ascii?Q?AFxD9wTS2VGIIFAx3KNyGAZelnYFq0FChpRDNU+AecQzJY6Mz+BkadriDJAx?=
 =?us-ascii?Q?tzS/CzRWGlU/v8J372lvkA1FrXZaz8FsJbw/mMlVS3QiKXvdAgKhCf2QlbHe?=
 =?us-ascii?Q?G1poJWy5lNnJ5sOxTbbOW818VZBSilWqJWIaGoG/MzmKGgAO8uwsiOvP/9KX?=
 =?us-ascii?Q?zeZTrKQecsd7DrCPSS+qqZNmFdHIkO+8PO+Q31e2YaEi2C+OWeJCnAHylsb1?=
 =?us-ascii?Q?RdzvGed5HohWGx5oOKvdxoHvhPusrBtVIj6G9Jlgp4oXQgMZ5Sz83M9+ojnc?=
 =?us-ascii?Q?9I42fcECvHSJrQ3+JMhx8EqYJu2UDGxBMnwuL0EoZ9UK7eqVjWnkBEUKQnu1?=
 =?us-ascii?Q?gRJcWlWiEDnHF0NR6TSYrrCxVcwnXCa0yBGsQ04XIlx7n9/x5AOUEeh2ooKW?=
 =?us-ascii?Q?O5dWnpBJmGfDfjZKKIvXjjz0Nzj4bPzcm21inYkUmvPJBQXdrs54UoMHLQLs?=
 =?us-ascii?Q?bLUQjPe4jUm6b7BCN8wYGSV6Ae4B9Ja47ABd3Mc/IPhIULhW7U6uNN4yvoRB?=
 =?us-ascii?Q?RwtFcPQjvxyazfW7MvIz/B0Ag8msTEexFhnGFpupEPiEpiCXCh594Vnw8jJw?=
 =?us-ascii?Q?H+hsZd7ASbeo29jeb8ua9Cf8w4Wwxh0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d7a716-eb35-43fc-1190-08dee3cd61f5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 06:33:58.5962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPhUdUOlyeMYdntiLEBwU+CZzhyNDZsk7VfGUP5hF2mmbjd2Rko7CXFuuIIUTpYK1LraGwQtyxDi/zZ4dHKzW/M0VT8DwsHNhSNm/l8+Ckk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB11365
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128245

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Changelog https://zsh.sourceforge.io/releases.html

* Only minor changes.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} (95%)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb b/meta-oe/recipes-shel=
ls/zsh/zsh_5.9.2.bb
similarity index 95%
rename from meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
index a62526dbb2..88c846a27d 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096=
d2fd483ff2f4514fec"
 DEPENDS =3D "ncurses bison-native libcap libpcre2 gdbm groff-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.x=
z"
-SRC_URI[sha256sum] =3D "5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416=
b5042e58d8280d"
+SRC_URI[sha256sum] =3D "020ee644be1749507b282e619cdcd95c56ff36144e79b7a3c2=
45458aacd9458f"
=20
 inherit autotools gettext update-alternatives manpages
=20
--=20
2.53.0


