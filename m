Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BECCD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:50:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15021.1780473034085526213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 00:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=f9v7W1yJ;
 spf=pass (domain: navimatix.de, ip: 40.107.159.90, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCMQjBq9rxYribwpiovxFfgTpx8Nxz2Uiieqzmu8d2QxHPKlBtAi+jXQm4dwWGImYICpu3Dq7IA5O8Cx8PfXwjYfiIr/yQbQ1Irx39pwYF0UN+n/6PH5Qse6KkTKP2AdoiiGcYNr+pThL/hGoGIovVdc921jNDy5EJXmS2NngWaK0kZIcm0DRM8eEtwouDUVNOffNgRi++ALXiLeeEeoVK/dXelkg49LpfR8IzD++5FuJZDU1yrBi6+1sn2B+apG41G4wT8dvg6iXqe0LQ38Koj90Au1pKBVGKt/DEiTmi4xyUq5nRKZvjc/lncsO4/UivXxECrqJIJLFz3OR20+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVf+QhVymNAuKUYf54ZlRIod4Z8C1Jmf1OJbGl4f11k=;
 b=T8dz42m1X+VoUWQhIQBZaQQmeBLejaIzwA5M39c7++ygoX/AMpDX7EHSrtb7uN2w/cYckjhOFhUCHHvrqRgFu2mKh0PYsNzodls7VOFDrTLeYN/yPIpglh29V4zuZ8eFRpws6zhVN4hFUYwJoYNW91q6dg0nEJ0e6MSycf0PnkrNfls3F3PUxp330QcYbyq2UgFNgMnPp0y2S5sKfIJ4jGLTqYPjcn0S+SXa1SykyfDnXi+9sQSPev86kRVKo4mZOJAchX0Eq48farb7v3YHz6mFizxJsyifKqjHNblIA9SxX1RzS4lgQhsR+SPZBPimB0XhHWxNQVOWwm/iYJkEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVf+QhVymNAuKUYf54ZlRIod4Z8C1Jmf1OJbGl4f11k=;
 b=f9v7W1yJg+wl/pAxUgzEBtoMrQJ4LhTkUj/08DM+f0jAhwDwpXFjK0jax/mNX+y3tydQ8UI97DXtSi7HNcRV7C4gcMaWdGWffxE0NI96SNV4oQSqUyGAKaWuV4okIjrjix3qzX8hxAEx27PHIBctM7WJ9GkRf21lXTRMj1ts4yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GV1PR01MB10796.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:50:28 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 07:50:26 +0000
Date: Wed, 3 Jun 2026 09:50:25 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] zsh: Upgrade 5.9 -> 5.9.1
Message-ID: <b9d92b09598fb5def6e8606a6215c1fc21ed9f38.1780473024.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0395.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GV1PR01MB10796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4051a505-0c21-4740-47e7-08dec144c662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	o4DT4+tgfTXOrGtrjCeV3+7PN7ito5QC6ryoSolJ7P7jUm4meVQEkONLpHs4+EoatcMFFBipI8enKIjL6Er7b7MRgOLTYr3+BRj5MzbDMqYgtjcDvldQrEGbUvjHvsWjmzJCpQkV+I+GucdCaM0+W5uaE0kW9Wq2hob6072vMSyAgoetGgsj266NZ1usi8LTgWzVlsc357GlmBR7z8QDPga4oJvpgdmf8+gTSp4utiycjYfgzzCPQ8sgFHvy6cK9ADtHEtH8Ph85ebsS23fbgJnSlsVu2T5TWGUabf6342giQsx2L3K2eFcFedDUMOUFFK6788DKfbEVur8MsmE0AtBeE1P3zGftUDRZqKZSAeGmvZnzXpC712NIzBAWdDrlzIvUMTK4QQenvuOEiwq8maQG6PuUG1kzEVvZD+tAJfW4x0ct6tStSj5byWTPs/T7WDeUckHtxB5AypYcw+RQ7pjcNFbkxqcKWrkv1WjZbWTgQuu9H+aWefy9TCsQJNWRoAMN6x2mPa6AibDsfLYIlP0v01+bhxxDrsrojLnx/DqqUiiAvo3qttaq+4Y6jCFkazfd9Pp/fq1269YTJockzKl/365DKNASLCIJLy9ueeEoqKHlNj2fZxNOH9sqcu35XpVdcrI7FMaXziAATHN9CkkhZ29K6WOXzBjA+VGc0ZuO3TpcqdcBtkddJysrPVat
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fscthr0+QxfrfDaZf4fes1onkQGPjqlC9fWuw7YKCblHLw7ZmYrvmhv/EL9v?=
 =?us-ascii?Q?qPiDQ+nk93F79yxv/slqqr6tiPs/VqstJLjngJa/K+ZXL3FjT1icA+lCRt5F?=
 =?us-ascii?Q?B8dngIIIQwivrAw7gkJsyo8aVA8vmf8flbkK5GPTiQ/QNEchzB0KCDUDnkU9?=
 =?us-ascii?Q?de0g/lud7KGLn0vQUk4e105yH7z5ge1Jhp8QuQfi2jI5p5eecqtX247ynqaL?=
 =?us-ascii?Q?YaI4qho1k421o7SQM1FiwFRTtXGzVqzIl/MHZnYgG6BzbZwsw6x6VAJ4vMmr?=
 =?us-ascii?Q?m1dHL79JDe8qgspDkQZ9ilVosFNEBXo0RpCwYQOO+tgVdv5inhnDKssTMu/C?=
 =?us-ascii?Q?aEPFslpQqxv4ZUCSYbeV7lQBVL/il37mbnt4ja+7rYHkBLklwH4MQxfzAR06?=
 =?us-ascii?Q?tdx2NTQBdPK26/1ScZbTmbwE3SzOcEHDYgmEx4OXkg2QlaJNuSDM9mKtUwjF?=
 =?us-ascii?Q?BzFL0icMlMjPNYO9x1dWSBydzDAf/HXl1/Tkjzh2qbOWKPQLplpFqfynJ75t?=
 =?us-ascii?Q?95yAPPUMSbwl0DnGE2qQS8qXraOWZNrM88dEsUFqaLabvu8PP2OOIWR6FU5s?=
 =?us-ascii?Q?7tPiaubLpHB4y4BxaHjmifGcqraQV8qUfsBKvkpKRK1ybSgn+FK8hItXk9eR?=
 =?us-ascii?Q?5qvKLYw2BiU4g5FGq4eGU6U0wA+ypjPI6G8CxIhAfYq5BRkUkVUuD93nPNdW?=
 =?us-ascii?Q?Okz/vhM+uEnhzyNEa3UsZnOW4srE5WzkzxX4RNfz0iAxY+3hM79OSMvp6nfZ?=
 =?us-ascii?Q?rsruL0XF4iQ7np25exLehlW/LrgcuaskYFnczi9VKoHTba3C5LGpR9hyh2r+?=
 =?us-ascii?Q?tw5vr19xk7b/ORb6+WpSLxiH9MAtjnYVFcbtRCAhD6eirjpmR2Y/Eu6IiDc+?=
 =?us-ascii?Q?h75y64y2PeeDp3olFRj+NveeSv/eUFs2mH/oLDYUB97v7ylMvMkCdmejpPIE?=
 =?us-ascii?Q?JUJFXxc2WqZnwBYTbzC0glBZBxZtfBd1iuwHRg4anppOnDZfi2Idcm5mjMao?=
 =?us-ascii?Q?OWqgE94QIuqY0o1Q3+Lp2FmofqfGw95M4mDxBU55bQelLDPlEtl2I6l7JXE4?=
 =?us-ascii?Q?fmpq0bFsD8gNT1r9iF//5LMnXtBICQI9uk2WS/A2XZ9w/jdpMiznGIw53iIJ?=
 =?us-ascii?Q?KykIT/h1sDIk4tIuBVlovQaFenRliNbciO2Boar4bd/zp4qxYuXNpo7CqpZE?=
 =?us-ascii?Q?eL0gUWML8T37cUaCuxryUpCz84bMUByVD8VaTi687MJ0nu9UXcS3bXLvtftY?=
 =?us-ascii?Q?Fwj6W0LFXafJInm9/wahtcvE47uIktIss6G6GjD90p/yT5K7wJm8t+kx8Ulr?=
 =?us-ascii?Q?/71wKbhUgf9Gqu7miwb3yqgOnyNxOLqx7eROQqCjEwc2YJAZDnTUN2/D9v+C?=
 =?us-ascii?Q?f8VeCGd0MS9+mmuQHcdHj/hygAUftR9N5oCGbd4w0x98OZtCen5O4DrHWHi6?=
 =?us-ascii?Q?JrrBoE2PuIv6dmidNUrJd/bAw+lLF/jM3gQ0nyZzmmnT1t3bMv9RDc+hMdKp?=
 =?us-ascii?Q?n1S4HgY3WiXQgql7PZZtf+2X6iG97JYlOvTfrej3u/AZRwDfJ/2C/L0Vu1aQ?=
 =?us-ascii?Q?qFp+pLh0Hzb3k3Vxy0jjfytZLrGavY2fnS5YxqMOBt4y5/u57MYXlqhNe6Uc?=
 =?us-ascii?Q?rjj0xgOUzd306vBW2pktjdnz8IKjaqYRbOnWyDDf+rZkrQfIIyLF/JwlaTMw?=
 =?us-ascii?Q?LDMOHMe/3ZID075nMnOZIaGWLjZabwJooEohLAIeimDki9UK9wJ68ft0RMrC?=
 =?us-ascii?Q?YsSQXj2G80rvhBP3W41L/SCy2WVpDCY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4051a505-0c21-4740-47e7-08dec144c662
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:50:26.5291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nSJxZ7I8t8Gk2goVkRzKKVS4+AmIUAbylpRPrebiXAn4kIRE05UPypnDZUHGM6945piuXY9ou6foq+i/fUoblDfE0JNlGLPp4lEZErXscY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10796
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127375

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

* Upstream changed from pcre to pcre2
* with-tcsetpgrp was dropped in "53081: remove old BeOS support code"

Changes

* POSIX real-time signals (SIGRTMIN etc) are now supported by the kill and
  trap builtins, TRAP* functions, and the signals parameter, where availabl=
e.

* The kill builtin learnt a new option -q to send the signal via
  sigqueue(3) along with an arbitrary integer value, where available.

* The kill builtin also learnt a new -L option to print a list of all known
  signal numbers and their names.

* The new completion helper _as_if can be used to complete one command as
  if it were another command with particular arguments.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-shells/zsh/{zsh_5.9.bb =3D> zsh_5.9.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-shells/zsh/{zsh_5.9.bb =3D> zsh_5.9.1.bb} (91%)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.bb b/meta-oe/recipes-shells=
/zsh/zsh_5.9.1.bb
similarity index 91%
rename from meta-oe/recipes-shells/zsh/zsh_5.9.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
index c03dfc2f83..a62526dbb2 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
@@ -8,10 +8,10 @@ SECTION =3D "base/shell"
 LICENSE =3D "zsh"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514fe=
c"
=20
-DEPENDS =3D "ncurses bison-native libcap libpcre gdbm groff-native"
+DEPENDS =3D "ncurses bison-native libcap libpcre2 gdbm groff-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.x=
z"
-SRC_URI[sha256sum] =3D "9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10a=
b863842d45acd5"
+SRC_URI[sha256sum] =3D "5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416=
b5042e58d8280d"
=20
 inherit autotools gettext update-alternatives manpages
=20
@@ -23,7 +23,6 @@ EXTRA_OECONF =3D " \
     --enable-fndir=3D${datadir}/${BPN}/${PV}/functions \
     --enable-site-fndir=3D${datadir}/${BPN}/site-functions \
     --with-term-lib=3D'ncursesw ncurses' \
-    --with-tcsetpgrp \
     --enable-cap \
     --enable-multibyte \
     --disable-gdbm \
--=20
2.53.0


