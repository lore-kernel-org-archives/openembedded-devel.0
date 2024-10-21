Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E37D15DAC
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:16:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.104])
 by mx.groups.io with SMTP id smtpd.web11.48596.1729523798564282022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 08:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=iE84vig/;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.104, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyKnpKfl0jQQ6F7KZEow38X30YPllVguuJfBtDDbe6htRhmL4E3tfzwQ7I39SxDGYp1whWnDcU/LKyTPX+Aa7cdxlH6Vvt01+a3ItVKEHuiZFsTKab2tMbtdYtTgwBeBlhdjIZkvyntbaXmke3p2cxD5n+a8vsJFUTSCIE8onSnHCtowS/fRMiNDwLwQp2TvF9dJ5EQZKsaE1rcP71pzuAloyT59HYW1vnbapcOTCWfx7M2yGWTMDnFPnzKTxnGlxP7DFSf+RfGyk55Kb0TQLecuYeS4WwfiqAVVNGJtxQqmEeSnihx75LZW4qelvzo1n3EqEBb+QiYBfYnekMqDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKBbwF21Q5HT8bPO80nKyKW/V613/0N+r3Ovb141hzA=;
 b=uBl92QOgzjyxJiMiy+4/TObs3afxd6lPP1l3G0Zt1CPCGdFGzVfpYcs5nEZOB8RJbl7ucf2fqSYMQNaBlVxuPJwKzqMxIHFFEHTzqI97sTbWJm+VAGJVgbIn8D7G+9bPXnoRyBTEMNPFtJ5y5ysvoJTekCBU/iNJWAop+FhX0App4iKBQJ+ab3qCHFnNXdYtDb6LnME7QvbuQg3pIj0VSk8QklQCw2npJsfjM8V3Sh46I3++ckEZnE2Kf9fhmnjiVU4oIJy+IsXK+e8C+W8rhexHhCIU5cPZEEO5/IlrKb1fmUQTJ94KiB4vgtX27Wq4trToOjAvGA9UvIL5l69GSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKBbwF21Q5HT8bPO80nKyKW/V613/0N+r3Ovb141hzA=;
 b=iE84vig/ps964CR+QeWCJhYl37ku6CPAluy2KJfHZaDBwnh/oTIiQ7FDbxcgonbRFMeRtH2iNZCqp1eMPpl5jxG8YgDATdeYEM6a1z1O/ceEvF7R3qa32P3v+ycv/HGKwYtAILr/C7s/gbcZXH8OkQCTI9Z2KLc4owcoDV6RPKSr22JUaK52YEj0YBnb4obf7ZW1frNaOBZWbmO6hr3Qpurnbqi1jEFssgJGxKjkeqF8APM+zwHw0lN5iEPl7wr7bbCmah7ETHrRUpZFp3QXSxVFBnFEdhCuBXPx9KpzN4UMv7Uv0e3uhosOw3TDSsy93ciOM5g3b1ZHHeQ6getFAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA2PR06MB9164.eurprd06.prod.outlook.com (2603:10a6:102:403::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 15:16:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 15:16:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/2] dbus-broker: Cosmetic: Recipe style fixes
Date: Mon, 21 Oct 2024 15:16:21 +0000
Message-ID: <20241021151622.3432996-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA2PR06MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d7d71f-8b73-4eb0-7c81-08dcf1e35920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Pta1UTVOqmwwxOueq+bdzoXULUaZoKzFnwNVHuxXjNqv6vr+3RxYna6JWn7K?=
 =?us-ascii?Q?EVQe20cwm8pAR0vX95+ATJtsiZwVttFno9gervP7DjCQRVsIXSrepuX5CFsn?=
 =?us-ascii?Q?sIxJH4GNdYjq+Pb9xis6bBFzh+jJgrK4n6PGEgSg+wKfK677mPzoq6P4ZLWW?=
 =?us-ascii?Q?ypGqWQB2v9pZ5qDur/xpNb1X9970fHRvrfKA7QKuxlPCcOOhpZ6TuSMBaiG8?=
 =?us-ascii?Q?eEwIdlu+Iz4+CK6rckaqCTtINBcZzStECtW5M1Zq3cyY//DduPbPVYACYEfc?=
 =?us-ascii?Q?IkEdg9VXmOnaXr3cjvTXTUD1/RzQqXDVEeKCA/JkPdxtd5N6sbKmCQsfThKi?=
 =?us-ascii?Q?qCspSusxyVBPJgr1JnFlxBkh2ZhIqoSqyu5w/4boxbvKX/a62H7piRMGAhv0?=
 =?us-ascii?Q?M9MiF2J43KDl3OdBIgTiE0cBZCP1bR/IynXi7jLkokQZkr7Y0qaHcj+VMxjk?=
 =?us-ascii?Q?DsngCC2soOypXTeBIvnjagFCTrUv6CYMYOxai+/rrOhYL3VKZGKSlrZ5dnji?=
 =?us-ascii?Q?w7N12PTjrhtTMiXWBJIP1oyqh0ueWICCtGF0DpEqkYmSqOudz9J5KSllaRWp?=
 =?us-ascii?Q?VXa/RzPHr4cxg19IPgK5Lvec4jnflzdoMODaPfCsGbBzgcYe2WMD304jqaUu?=
 =?us-ascii?Q?XtLYhUvXrkcS1bHSVcZs4IQrQ6FZz89JiRlsFC1di62JBXkq0ceiRkh30hji?=
 =?us-ascii?Q?7ZbV83NRfsvnuwlarYl0tlKIMH6cp3dfgGSqnDQ3QUFbHnr7NISM5HhWhTzT?=
 =?us-ascii?Q?wrjrZiWeREUGz219G9qM5d7lEFlfGVhqkgfBMcuMntHnY9ysU9vot7w6l2nG?=
 =?us-ascii?Q?kfuunTXtzH3qU8vWpyLbgIrh8m7PEuUr2TRF4Duh7sYMVsrPWJYamuKd4QPe?=
 =?us-ascii?Q?t4HnbBGuVFgKlHvd4imuSgQzER27UC3P4mlldKOpmAjYS4KjPLxDHCjpHGa0?=
 =?us-ascii?Q?kF1QQURQHC6eN2xrH6ghcmwiELa73jeYn2FBw82OlinTn8wICdutBrsOPIoa?=
 =?us-ascii?Q?TZj55mCdECfIb749R34cR9wYXx9RLa4r/eU/9rWiSFST99pAGjaIS0i39AET?=
 =?us-ascii?Q?SMnzHyBr8Pb8Plq0gGiy//mRMy33/g863o5dvIzMHkMFEMLdrK0nXrj4qm6m?=
 =?us-ascii?Q?aLtLuDjg22hyYFxSVxqs+10GegPna+OciXnMlzsU+gpELbVuwPwXo3IlpgQG?=
 =?us-ascii?Q?CK7HaQCOxK18Pvy0joGxMH9aEj0vLY3KN5s/imzPwPQTCVg5SeddGJ+IfjCY?=
 =?us-ascii?Q?ZBUSnai6Nu30UzAVsU6o5H2mLvEM6TvaSClvncvtOebE1RzN7XEzLhW11k+r?=
 =?us-ascii?Q?61JYVm+UbM4Cd/vCusupUkrQDkEH4UZlQh+CjOE9id0/PDPALz1YWcofeJLD?=
 =?us-ascii?Q?FGYVmZkRQCNn3sJJAwXUDW/E86CW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UTPck++z1sDx4ryR4xKjuG0MIFiHF3loOKQNlOpa5BEuLH8W65rGdaJD0V//?=
 =?us-ascii?Q?ndqe39N0n5K/VWWZDl5dFLREuOws/Qol2QDMAQpZrIftrjZzkolrtVeFqh8F?=
 =?us-ascii?Q?XZANggnwL3TM05OPKIRWN1cqZycMLDKxnGoYMUe8Qc1ecYH9s9L86ITOsmCh?=
 =?us-ascii?Q?3k5EX/6kdy88jdNr83hOxQOGenN6yb/mW4ktaBYZAL3YLy/M9Elmi/sKuSa+?=
 =?us-ascii?Q?I7NujBC2j4CiFzFpn0ptDZuHnUifv5lbq4QISJRu1Bo5VmEaUD4DjcD9eJBR?=
 =?us-ascii?Q?KFz3gAciI47mjVU81du7+AUwj6h2S1D4KZEgS6awnBKOyQs826ko7jv06EC2?=
 =?us-ascii?Q?yoyXEyKQoFUY1LPoDFQjPI7EzkPlmzYfUsUw8LlVZ4jRurH2R3Ox6pA0nuVW?=
 =?us-ascii?Q?PooezTkSY1EeGgKtYzV/kFMzegs+c87FE6Fs2zaXHCAUu/lHLVFoLldncCW6?=
 =?us-ascii?Q?F5rKPkZScwBuLtE8GVSFjyD2HV+j//FDqUhwIUeSMQweZWGewAYdz+lS2LNX?=
 =?us-ascii?Q?nYYQhBUii2qcruwOwxa/HpiH0+lNTPjzH3c3PJbsCRi5LYnRRWrICAivU1Ze?=
 =?us-ascii?Q?+1AiTSvBpaE7SnLQ/NLHsrybt5qTmgTvd8Qf0UmJsHKBI0jeUMW+3CzSAz6y?=
 =?us-ascii?Q?IlhbEZ3I3GyO7YV2zeQWwyIIGMJf5X4tmku91c847g55co4EPxGl1NECJM5I?=
 =?us-ascii?Q?phhegRmi9bFrIhXOGx2R7lDCkKHZ0uB6EDz2zYgr+5icHajpJyfoyoewIdtw?=
 =?us-ascii?Q?NUgoKwBn3Lb6ZdUnGRPS0/Tq6vWOZf7HJ/3KLER3EdaPGhFX7MtBCOxQ+vJL?=
 =?us-ascii?Q?M7NRHlQGdccx4LhDrBf4AjMSdEdy6ha+KR56CRqdvqI4b5dQ9ZiE5bMRApUO?=
 =?us-ascii?Q?mWMEKIzDSzq9QZ8OyH7aF+3mR6RWPKl3UHCcIKCnW4aGowUJJbRBHEphPBav?=
 =?us-ascii?Q?Kyki/Lj7RGLh9LNFoqaSRaxkpcn5y99SNxEQHxRiL5jEVv89t8PPxE8bB2SX?=
 =?us-ascii?Q?c+S3c+FLvGwqDSOqWiu/TACS87ADSuC/VxCK0dYbLfZ3XuBpCm60bhyEFsxV?=
 =?us-ascii?Q?ul8aZSB3ik9/OjRLtGvVLYlZHksvC29NoN7lIrBbb9vdZzfQosdQOLksHUbM?=
 =?us-ascii?Q?6BBTT5HG2Uv4JnWCeOlWQb05pQnID9uzzrEloiE6HFhfzQiZ9qCE5ablUjz0?=
 =?us-ascii?Q?4hqheO4tMfLR5WKTx0gzRCVh8bFQWzgkp4wDeRCPeP5e5k0KxorI6kZv2+ib?=
 =?us-ascii?Q?oL/+VJP+DWSRDO0tYop/V1lnfyF+ReCBZy9xDATdUEP8IaBAaub0KLrLpvvZ?=
 =?us-ascii?Q?fomRacy0q/dyNSYOXcOghK92XJoJSDY4uBEDX3+n9Nz1tTmuuT535VhOj7xg?=
 =?us-ascii?Q?7WFNll753JtvePYA3187tfaB3NZw09mO4yIyQ5qb2svzgNKWDohVlPbUbvs9?=
 =?us-ascii?Q?2N5X2PcLxm8zxydTt6eGZn+wcStpARlyj9ZctXyR/ZydhfLn/NM5/9Ya5gOu?=
 =?us-ascii?Q?lj9vV2Kj96QJWThZiFQLiFOYkUsPWpglNvLIc+kTuRbC6j/+6SewbVsPykAJ?=
 =?us-ascii?Q?pFD/NOd3n8b5no+DbhtH+pQwDcVd76Q+rrhnt9VI4337+JiEIt4uMsU8ERj9?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d7d71f-8b73-4eb0-7c81-08dcf1e35920
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 15:16:33.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0w/Fu16tdOqYVOASxS2Y5nViBt2jOrUZZ9RWRtHdL9TNxwykGyh4P3p5AjRyctWneQD4QSBWAtb4KZoXu99sYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 15:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113078

Improve recipe content mostly by applying some ordering suggestions
from oe-stylize.py script, and mitigate also few other minor issues.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_36.bb | 29 ++++++++++-----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-=
core/dbus/dbus-broker_36.bb
index 46cff86db9..f0f427ba0f 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_36.bb
@@ -1,33 +1,32 @@
 SUMMARY =3D "dbus broker"
 DESCRIPTION =3D "Drop-in replacement for dbus-daemon."
-
 SECTION =3D "base"
-
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7b486c2338d225a1405d979ed2c15ce=
8"
-
-SRC_URI =3D "https://github.com/bus1/dbus-broker/releases/download/v${PV}/=
dbus-broker-${PV}.tar.xz"
+DEPENDS =3D "\
+    expat \
+    systemd \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (>=3D 3.0)',=
 '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>=3D 3=
.2)', '', d)} \
+"
+
+SRC_URI =3D "https://github.com/bus1/dbus-broker/releases/download/v${PV}/=
${BP}.tar.xz"
 SRC_URI[sha256sum] =3D "d333d99bd2688135b6d6961e7ad1360099d186078781c87102=
230910ea4e162b"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/bus1/${BPN}/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+)"
=20
-inherit meson pkgconfig systemd features_check
+SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
=20
-DEPENDS =3D "expat systemd"
-DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libseli=
nux (>=3D 3.2)', '', d)}"
-DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (=
>=3D 3.0)', '', d)}"
+inherit meson pkgconfig systemd features_check
=20
-RDEPENDS:${PN} +=3D "dbus-common"
+EXTRA_OEMESON +=3D "-Daudit=3D${@bb.utils.contains('DISTRO_FEATURES', 'sel=
inux', 'true', 'false', d)}"
+EXTRA_OEMESON +=3D "-Dselinux=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
elinux', 'true', 'false', d)}"
=20
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
+RDEPENDS:${PN} +=3D "dbus-common"
=20
+FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
 FILES:${PN} +=3D "${systemd_system_unitdir}"
 FILES:${PN} +=3D "${systemd_user_unitdir}"
-FILES:${PN} +=3D "${nonarch_libdir}/systemd/catalog"
-
-EXTRA_OEMESON +=3D " -Dselinux=3D${@bb.utils.contains('DISTRO_FEATURES', '=
selinux', 'true', 'false', d)}"
-EXTRA_OEMESON +=3D " -Daudit=3D${@bb.utils.contains('DISTRO_FEATURES', 'se=
linux', 'true', 'false', d)}"
-
--=20
2.39.2


