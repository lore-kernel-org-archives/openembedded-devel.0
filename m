Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2142CD98E6
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 05:49:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36780.1781848175163109592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2026 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=U6R5wImT;
 spf=pass (domain: navimatix.de, ip: 52.101.65.87, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7uiO0KxA754gVW6yAeVJMRz7HpkAA7byz60ZJfQwk1HjGaK+EjnGSYK9UUb7Gbga3gWcKfo/uONORCkPL20sJbUZ6s4VBzIh9/mVZl2y+XAshmDuba3Xs2MIEsnEbxSpjeUw1qYXO0/wizHSTKPLJhoKaFHRq/sF2PCizeXsrvswoCKF46LP5LtjPVi2VTFfl6SdtHo67pwpKAMDcp6Zh6AWUwkoIQ2anEzP7v5UbBqSpxQ++Iq1rxQKzomnIcoLBhKUtwa6LCGQvHzec86ePCvLzJIspWznKga0RP00H6p/BGjl1AyIkj582sH17AJYHjvVAzp7I/Ajuh4O0g8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZM5+PfTcNiq4AqAZfDl2oxR8f4WR3dkVMjL/NDcOws=;
 b=iYP8ej24hwaq9bqXLeyFz0AsjYfqIa7it++fakSIzo377WX22nShsFXbIjPj79JpSL8mn67S5g3GxwsRcatLk6QQAPKWFuUde+QDOXeZaywfsz6Q7wMsxPNDKGv20Gam5HtNNV7J9sz+BS1rIIBlJpVVmXyg30F903aVBMqo0EdspXdi9r7lez17GW3h6l9Ay/xEFmlugSY/v1gvR6pCy+wq2KgYNB/oYv02WDaybb4FCfM81Wx9g5OdiBOvdvHMPBaW9pbBKsDRjDsH1O/Hg7SzKpMzhOIEKPEb0JoGyUB3QsBSUvfW8A23DdrC9i+Kb62lktrdlJrBrZLzy93Emw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZM5+PfTcNiq4AqAZfDl2oxR8f4WR3dkVMjL/NDcOws=;
 b=U6R5wImTd886XXmUACPfDOrM2YCSMrvH+zeJokYPzyGyAIA/Wm9Z+Ny/prK/8KcZ6KW29esNAlBheoqs3CgYA0L1jSrNHsGbqow+voXGpsoYiVvwRIlwA8yOLQ9ibA2y7IAPjuloATQkhomV+Hyy0xu5wWjc0XHBCnfLqzhEbe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB8742.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 05:49:30 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0139.009; Fri, 19 Jun 2026 05:49:29 +0000
Date: Fri, 19 Jun 2026 07:49:28 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] sngrep: upgrade 1.8.2 -> 1.8.3+gitc77bd7
Message-ID: <aac2393a2cf2bdb57e4bd10cbcaa40244f72792b.1781848167.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: e58291e9-aa59-41bf-e7e7-08decdc68798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	16JzRZ0DHYWdPOc9f+KMc/mo4pIa4oej9jE6tJ1wdloVb0ys0Lko9FjscFtwxFYYZwOwzRskvnYnsrxbhh9OkBCqV8FMCeG7CP7y00YKK4vDKnKGxeBz11nqqRK4DNjKj4N1oGHPmr0vfUsxMt/G3cGkgJR9Hdb1bTRrMDSqKJjYIhmo38+sv/t8/5JPcXzG7tf7DKbF8Ac8ObGTNiUvZ1HeIY5VxxlioliVKITcS7Ta+5/EVBB0N1KYbYKl6SsNPYV7XmGhITA1ochYZu7NxFkjUhWMTDktSElXxDxGy6MFFNnP6s2U6YlqgZ76OdjwOQfqx7kWXSLCa+3E61RPmlEqYJh6Snh7aidYh6e9d+E3sVqFIHebUiAOL/euBXVoZeECmYOXX58GPPmX59oncp2Dp1EMZ8trEMCB1ulT6/WfwI7d6H7NNQQNimo0e2A4Ot0uzH194y9l7pL6ctsoV5p/RKHQmWPohheGqobzUAl5X+cUnDKIpZ4LwNUss7s/NnkudCk9x0FKOSznS4036J7vGXlfEPRBW2VPzTMSeeD3Eu0u5UVHGJ4bzilwyVkzuCHVHgXY2uo4x13o4SFv+T4+4o0T4drGesX2qGpoaTcCNOwpig2Deef4ZrcjMVetCvPZmQ3gCWesfYLm4IbomDfQzh71hti0DTw/q1EZuDA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?evs3e4T8kyC5HBR0d0130kvT/4GsdTD4++FOF6c1vOx7FfMghnFjulRsAa+1?=
 =?us-ascii?Q?WGvVDHZ533RH8n2MLlu+A82oBeKGyKlgkJnx1jh/ucMP/n3nbHXi4Po9EefB?=
 =?us-ascii?Q?a+1PCu0Drmz47bfN71oBzPEQlp/pUHK1wEeyfDvpZXk6c+jyUWNMJ/k+Ykc/?=
 =?us-ascii?Q?BoILxQkJaExJuhddIlW+f+PkN085+gQB3X1IdRkQ4Bj6xH/nYw3Wjtj2rjJp?=
 =?us-ascii?Q?JwZjKp2eQrBmkxxMqkDT8FSLBppNJaIwC7/jSN0gZdhlzQ2AfSMlgILJ9n5V?=
 =?us-ascii?Q?PWDHQoMy45Oy6XBr4H1F6fVIHj0uYpvu2wCD4/YLrfo92Pjsml3Htq/9AK4z?=
 =?us-ascii?Q?1pc7D4emIs8OrT7FvH5UBWDLOXHE+dBsWPWc8bE88via3wt0DFtAaNVkJp2n?=
 =?us-ascii?Q?vS4UYxxzEUTlsuQhpT5UxPMmBGmZ71ung/BbE38umhTqElSgDiNtd/R1K5Fd?=
 =?us-ascii?Q?clWDgGafZe6ew4Tg96rrxgiotrqfzJFVe1rQnbxrk8Lx9o/j0a+PWzaQdHTj?=
 =?us-ascii?Q?NRg9h7xpqsPmnTfO4kUodahsk4ztrKZ3ZxwZgcoOle2nAHWXo1mqhz8kW0fg?=
 =?us-ascii?Q?8VQL7sxogM++R6sSWOilWpnK7u/Vp3FluKWeql7VA809YI4VCiS/Rx4+EVSy?=
 =?us-ascii?Q?b64FLZaHjT2MN+DAvy73N094NOn9q3/LjWykNeSVyPv+XMX8bmcpToRbZjrD?=
 =?us-ascii?Q?HyVbz/sq6sk3B8ZSxHVT9xSDMwDvstsIdDrhIP+apwXtECSKVB9muIOImZck?=
 =?us-ascii?Q?8Q+/wExdphv4ud4FNf84AHSxtSOGctTaOyt0vJBotn+TwYyMy9TJS1Tnu+u6?=
 =?us-ascii?Q?F+NXy3TQFLa+bD+hN7v8ZQGNLzWgQ1Gvys+jvEzhDW38HvtmgUx8JZZdo5Lw?=
 =?us-ascii?Q?ZifO1u6elUJiGcbaR8TCpiej+ncMvZwvNlxER8WeOkM1rfvSZX6WOTHdK1Az?=
 =?us-ascii?Q?9wC4dJxsurAxOLM0XzDVKEnx7ekiP8MXtSQ0/MJv9GQhBG53Nfj5Get5Vfev?=
 =?us-ascii?Q?ZcprGrGzob9XPxz9mwnDAyYjzP43KQsz+WnqO9KrQddoh3O7HtFRjPadsV3D?=
 =?us-ascii?Q?J6+JeJ4sgmbri5AO1Rpt7vWTY2KFvYMgi+RXp5+2t3bVKfc7Ah9clL4buD6M?=
 =?us-ascii?Q?BO4Stcewm1hwN4lWfl0Eka1U+uLVQ1dt5aZg0CwLzy1lLJyWDHSrws9KJ93+?=
 =?us-ascii?Q?jpaHjDK6LK0MzSdV84Kx5XIe/18QX/pdQZc87GzFjy8w/sjPKuVae2LrtNC3?=
 =?us-ascii?Q?34BgLM0ig2bfXoruX0qUhXFMV8wIoTbDD/DH9ow7+iiVmQSBBi+g/Jp59Ee7?=
 =?us-ascii?Q?ZxIzjKNpMSuLm4+q0V96zQ8GUHxzRIdyVbcJ1w+8ovvZ1km4ZMPfVhUHQnu4?=
 =?us-ascii?Q?AOBbR8D+t3pZd2v6v3etnwdcTAS+xjOmteT8+Nom52xJr+1ohf/Cly0xxZ06?=
 =?us-ascii?Q?DHpMfTcGBp+JapCtZiqju+pmYO/dShm/Fuh0PEB4n7FgJmOfX6YAKR+qiVJU?=
 =?us-ascii?Q?EAIpkWCn5mHFbgQ0R6eiKiU6k72gT5d4pIodsmolGSObfvGEFIszQyUf02oH?=
 =?us-ascii?Q?Il0cuh9yg9XpCQzB35WN4Tj3gpH0k1NzGfFawVkYyrR7/dpZu/BBdFa9CdCK?=
 =?us-ascii?Q?aT4Bcbuvb/0s0M8s6mQ9F2mFBW0FPyrNkxxWC33yLVG6c8ln8WS+9gu9qbfJ?=
 =?us-ascii?Q?GBrE7DF2Jr2aQWwjFLl/b9T2TXiGaN4JH2G5ZHIgj4L03IAw8DTtZR5vhQq+?=
 =?us-ascii?Q?7iWrNLghqiGXwCH61t06XisdBj5vFH0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e58291e9-aa59-41bf-e7e7-08decdc68798
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 05:49:29.6727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZllEFq2I8P0QK93QR0d7yf8+u8vdVe9vzYjat248t78uNp9gXwcVxzUmHLDbgja69BX8wu+s9yBO8vY704Wnh/9B/QijEo9GIhREa4kSSwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8742
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 05:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127679

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Update to a newer version of the last release, because this does not compil=
e
which got fixed with
https://github.com/irontec/sngrep/commit/b84f0663e47de6f238d9f81eed67612a9a=
b616ef.

sngrep supports pcre2, so use this instead of pcre, which is outdated.

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


