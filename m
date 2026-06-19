Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D423BCD98F6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 05:59:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.128])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36660.1781848787176346188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 22:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Up8jUUkU;
 spf=pass (domain: navimatix.de, ip: 52.101.69.128, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk6YY4C+1L8N/ZDBZPMloQrdMVL6xgddtfretMmBr7W2GA6ckNipocOpKq+GB+mvgPaZwFts9MyM83AdIK24BSkLlPaxL2W+cKMjkb8hHNiNEkBUd9jYPMHJ7ib07SnVzJIFw9xxzWUQnA8dgITxO8UIFa+JDGJcxd7A6teCnh4fwBzUFwXUMFhr9RN/KV6yqrBocfOi6AB+q6XGSulYEgLBegHcB9UPwSnxv1yeMwfjWm02mp9tiYO+o8LgwmdX3TKsddRxX5r/EA6qDSVqETwpBdPU8e6nufw0XF1ZupkNQI29Mk7tmbKzp8Kbs8Nq0jAfcZU/LHLdZ5cAH6v9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm7/vh7HHinpzWZqt5rkzLn9t0j1zfpzCmq9iQs3S7c=;
 b=TJdUL2iUxKUD/JdDC3IO3rHPfazQLq4aku4z++gkwaoaLeIKX+qCTpRmGHERu0VzGpWtV4ffeAK+X2RmxcuYoKY+ZN4lBCon/vM9KbUfz7hSEbgunpp8iQgnqwef4VpACJzQxSn7t3o3UTPLiabiEQ/MBpZhxQyY6OuWAWUblj2XpOk82a7/+wwbPvdR28Ia0/Zoy7gjPkUlmVyOgI7em5fouoQ9EVXBEl5s0ElJWu13Gx+m5yLhEPP5dwjstQ8EeUStMxdMxJngZT2X9loqNNp/g54dQRrSO1ooRGcmdj8lL/EvB+Gw+TCSaOlQ4BPVZqJSCZg5u6x2YNPX0MhJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm7/vh7HHinpzWZqt5rkzLn9t0j1zfpzCmq9iQs3S7c=;
 b=Up8jUUkUrrw+9HtKLHky3MwnF/D9it0S1OE+lLGG/+jrI18+d7+0NFmCx8EftpaiZTPotry8+aRzoF3yGSZW+iLu/gUVZmgx+yhBWaPOCOXP6TZf5qJZnQTkbZP2jd2fOsBjUOZGmikxyknrTrzYvDIU49//J8nKKaJbrqa9pTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMBPR01MB12155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:6f5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 05:59:42 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0139.009; Fri, 19 Jun 2026 05:59:41 +0000
Date: Fri, 19 Jun 2026 07:59:40 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] sngrep: upgrade 1.8.2 -> 1.8.3+gitc77bd7
Message-ID: <220f1c2b1e28979b37131e50457e0381b0561186.1781848779.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMBPR01MB12155:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b0db2e-f0ba-4f29-b352-08decdc7f455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eyyIqx/x4L594/Uh4d3uJDYEZ25eKOnTrUfrQH7+ZfLkV7m7E59OWD+eLif8R2SCNg+ZOpwSr6UXiUnr/p7WS9BcXNbdqpxpglVEUVd8G67XidsCCvKCaBKHfGSUPv6fTrvQh2TRzTApmXRHiQH6DUqYKzP9M0DW15/AZeLtVBZvQF9qmasUfTlXfMBQtNxvxq+k2jLpDhomHlMGeqY0+1+lHEKCslJbEbvP+3ZSZpVy0Lx73Cv6MjWD+rOGAd6+ZdbHldCPcmbL7pklObJu6voYU8Z4tBQhsUcYq8MQWYhh35+6XFlRh3BDJUzOlnAHmG17CZCfUWfSiaQD2J8rEeetRccl6/Bt+Tzh8we//wwfI0EFMSPwiLghnsB6frqpluWFy7QqRoNUaW0DOYmcmGV+sRcBYyb2xAoMGnCVvkkyxcR7nkUA2eLfFESBAyPfKpEHBFTbvM5/EBiliNetZowNqSasFZPSJWQldmCeCvWYgyywiLoxVkpGPRr7dGIgfIpjCDeyRKhr+lbWnSQulo17ST/Z0qO3p8HyCMo+yYWGR4V1SP43BYDtIrbEuJxOnU1HQadp8j04yfPSEs/L/RP5mecHJzjl63hQKURV2b9+wcYP6U0Fipi2ZK/cHOlvckVoY5VCc0gvFRCKYE9d+xnOYyQJduN5kZRDz25Mmhk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J36Mqt1Yi8NiWvcoL9Pc1JzJYdcPZGfATVkHD/zvHNOYta3uaXYK0CyZn168?=
 =?us-ascii?Q?RHdefGitye99Q8jq1YvZR6kZMX4KSzl3EkvM9wKTneYz6FPaCHUmJ9YcbyCM?=
 =?us-ascii?Q?Lu4CTQPSR8BVjflYvyzDEJJr9muvoQExo93DlAk9hLMLo47qLs7PJeihhRwk?=
 =?us-ascii?Q?P/8DXJ6/twWneMRqNWQWOPGE8OWQc04EBg9ih4jYZyUsM2egdWqK0Zk7lPap?=
 =?us-ascii?Q?GHGmMrZEd8ChQ/S68hf/NjeRsZY6/kohDDoKKsm1kKYyyWqLJgEbWcFy8j0M?=
 =?us-ascii?Q?uFts815QXyWTLxP3JlYMbA4mB3N+t9z8orfUn5o1fR0HvRhNN6BssZU6O8O2?=
 =?us-ascii?Q?bZ+hpLYC+HQErlGymTLfu8GjDISnBIgt7z3+xO8PtDkseHufZf14OU/DUpDG?=
 =?us-ascii?Q?jm8d/ePWUR3HquExbawCrlwnyoSRcPab3qzeWSyp7g/4LnQ8n36uInYQ1M3S?=
 =?us-ascii?Q?FDvM4hAkDM12LIfwXv6HZzFHA+bR5IVrpDSKAMDMtXmw6s/bk+mD9tYxYFxR?=
 =?us-ascii?Q?tkUfXmIkhlv7Pryajj4D7mZhUYNk4lMeJdXbSp57YcBRjhVrsuu6ujBX4qIK?=
 =?us-ascii?Q?JCil98iG8aYgX3d/D67odrlSLGJrjOaCO/FaSHqgMhMVB5W/0qzZL68SzCS7?=
 =?us-ascii?Q?MHiUy+g/dcqiZm/5BUB5XLdwUrmx5j7N3WR7r6TMcShXnfTY7xcaBzYNSGnp?=
 =?us-ascii?Q?HtqLR4IX3ieUmbsmUo/WIHJrmo1CjJv0pGpfCJqLUDgskA3urt7ETy4Xm97T?=
 =?us-ascii?Q?sbmlnrtytlOUe38b40/oVJu8enmakL8JXazYCInxXiQTmaXQy15bQafBBNi9?=
 =?us-ascii?Q?MzO855gLOCpLuHRn+ZPix9mMIlWjOhUl1BMMXdgZmDe9FD7Dx8NS5IYhteZT?=
 =?us-ascii?Q?46fJQO1zHKpUctY6czqbJDeTJFmr6a5o6GZaxVRaCRqSOBbvxy/yHEfORNHT?=
 =?us-ascii?Q?i3ZzK81rhfFc7VEX0vcRkwfUblMnU+b2vKnH+7W1aGfjzgzPxvu0FUdPVDWH?=
 =?us-ascii?Q?lu5vJAy1qBbeDYde1s55P5EiJm8A2BntLTEY1tJ9bSUvGmYmt8RwlG0O5w3R?=
 =?us-ascii?Q?03HiWiB1Ddh6LZlJw+8z6rA94k968FTS+p4U51Oz6rCK9pdcZA9s0ahpFP4E?=
 =?us-ascii?Q?F5TinfHQ5cGMTsRbDZmILf7CQ3nHRtMJ+tAn6Ti0Ri3mN8jNT+kBqcbgEDPg?=
 =?us-ascii?Q?o5YibH42hCIr4OuGswZ56Tzxp1wkNXp2DG1SL3TivoLgA+SHyt+zaMEvggLP?=
 =?us-ascii?Q?RgNxh3EfEnwHmO5k0Mdr8YiSqUiV32CH824lVOn5cJdVTrzyZ6m6B5edAz+q?=
 =?us-ascii?Q?dxzOzgsIKXThDUcNKmOfsY8rXAy62812DtmARvYFO5OckxMO6zecpBqVzeYY?=
 =?us-ascii?Q?N1F07tfXmeHJxvQKcqHpi24O2oYzdfVL/IkHo9OlWPLytI1ocaNMlCObmo1p?=
 =?us-ascii?Q?Egqw/6vBq0WMFCBxfpl2iLTgRw66rbief77UxjMqF8UgH+HXJII1OTEhhb7b?=
 =?us-ascii?Q?XWO9OmgXSH9nYUT7XnvRKpQGprmCVHa9EEWU00gAwBuCf2f2/Y2P2dLwyodY?=
 =?us-ascii?Q?0LA22VIJYgvbFfyHkbDOKvE9m5DAPIfN7//m/ppI42adBbmuQaIMZZGTYukL?=
 =?us-ascii?Q?OteUQccWM5RcEIs0WsS7eLUi4S1mtfP5rghB2LOzrvFLwILkuQApsIFdt3fj?=
 =?us-ascii?Q?BCJO3F+iW6lFOQoqC42tBeAW7CTc0yHENhNaEzbTG6tXxzl4hL9XYe/l1gIn?=
 =?us-ascii?Q?M6LFgUmDRGA/psRE5t/Fx52ePUfgL+M=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b0db2e-f0ba-4f29-b352-08decdc7f455
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 05:59:41.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7g4gGfaAl9WBYrSOJGxhSruXSbE9Xse2W+pObDCQoHkGyl2lUL30ZeZVLdWF5lyUmZPswngdTpLpo/O8CWRVcRqDBGm/nvPfflAPJ7eg1qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR01MB12155
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 05:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127680

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Update to a newer version of the last release, because this does not compil=
e
which got fixed with
https://github.com/irontec/sngrep/commit/b84f0663e47de6f238d9f81eed67612a9a=
b616ef.

sngrep supports pcre2, so use this instead of pcre, which is outdated.

Changelog:

  * capture: add support for telephony-event rtp streams (RFC 4733)
  * capture: replace fake HEP frames for network captured packets
  * call flow: limit call-id displayed on title to 125 characters
  * rtp: fix duration value in telephony-event is incorrectly converted
  * core: fix out of bound arrays crashes
  * eep: fix multiple memory crashes in HEP parsing
  * ipv6: fixed incorrect payload length for fragmented IPv6 packets
  * build: use libgcrypt-config if pkg-config is not available for libcrypt

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../sngrep/{sngrep_1.8.2.bb =3D> sngrep_1.8.3.bb}            | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/sngrep/{sngrep_1.8.2.bb =3D> sngrep=
_1.8.3.bb} (84%)

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb b/meta-=
networking/recipes-support/sngrep/sngrep_1.8.3.bb
similarity index 84%
rename from meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
rename to meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
index 12fe3ececa..c82db8c9aa 100644
--- a/meta-networking/recipes-support/sngrep/sngrep_1.8.2.bb
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.3.bb
@@ -7,7 +7,7 @@ LICENSE =3D "GPL-3.0-or-later & OpenSSL"
 LIC_FILES_CHKSUM =3D "\
     file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae504 \
     file://LICENSE.OpenSSL;md5=3De39170c41c6f83de36426dbf49a03632 \
-    file://README;beginline=3D100;endline=3D124;md5=3D758a88cf2b27572df059=
96a3810066b3 \
+    file://README;beginline=3D102;endline=3D126;md5=3D758a88cf2b27572df059=
96a3810066b3 \
 "
=20
 DEPENDS =3D "\
@@ -16,7 +16,8 @@ DEPENDS =3D "\
 "
=20
 SRC_URI =3D "git://github.com/irontec/sngrep.git;protocol=3Dhttps;branch=
=3Dmaster"
-SRCREV =3D "dad1033640f249fa4994f976cf6ee96826c15702"
+SRCREV =3D "c77bd75a52d1aac96ae9d1603f2b7dfbe7e90ffd"
+PV .=3D "+git"
=20
=20
 inherit cmake pkgconfig
@@ -29,7 +30,7 @@ PACKAGECONFIG ?=3D "\
=20
 PACKAGECONFIG[openssl] =3D "-DWITH_OPENSSL=3DON,-DWITH_OPENSSL=3DOFF,opens=
sl"
 PACKAGECONFIG[gnutls] =3D "-DWITH_GNUTLS=3DON,-DWITH_GNUTLS=3DOFF,gnutls l=
ibgcrypt"
-PACKAGECONFIG[pcre] =3D "-DWITH_PCRE=3DOFF,-DWITH_PCRE=3DOFF,libpcre"
+PACKAGECONFIG[pcre2] =3D "-DWITH_PCRE2=3DOFF,-DWITH_PCRE2=3DOFF,libpcre2"
 PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
 PACKAGECONFIG[unicode] =3D "-DWITH_UNICODE=3DON,-DWITH_UNICODE=3DOFF"
 PACKAGECONFIG[ipv6] =3D "-DUSE_IPV6=3DON,-DUSE_IPV6=3DOFF"
--=20
2.53.0


