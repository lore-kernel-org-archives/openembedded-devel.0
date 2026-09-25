Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657CEC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:44:44 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6135.1790336683674481949
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E/bE7CPi;
 spf=pass (domain: est.tech, ip: 52.101.65.23, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwHnmpIi9Bl5D51X8slcfd5CcYdLYqw8+WXWOn3Nj2R6sOrldKOr/GPSwdpdXfmk1I/ilkLhhGhGbHwWDmH77zx2R+U+T6Az5VhzJu+CGGbgaB+s5q7uAuK/cX6iLguOwYO4TyPNCiXZdVaOehq0kfP3Bzp5qncnBDzxMnfPtKR2IMuY7fpffC98jIiZeqSSzrFihX+fq71VfnvC4yH6+t/ak48ZUzVvtDtfPBiaDcCsgM2Uw+DuQ/raklEI6fZPckecU5bUgnhR/NIjTjwZUQMMNxa2faSItbmeXzrpBxzWSzV7y1IP1LNb7d6kEZYOSR8c3YpcSHoeVBX2tU2kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=170gTNBpTZDg9QNm6STM+lTVIIo1ZrWBBaNXdUDBlZU=;
 b=mR4/HyRNu28CavdOTY3wTR1iOuKxBKmdgGZJTEzXlrEm1umxpoNqaTOkdQ+ugea1n0KtndyyejKujR/eIkMWLNP7qMi0hfoZbyHhUS9h2gVVi8BOPIay+skqSBe1nfQg62W+qEborWJ0rvu6afO1fn+hHl6Z1HIXSycMGuu+M/iki9t6xC3zb5W+eWG1n9b61XpJWTxdbk/aKn+h8DCiAmlsYFWkk5v07BQ7FuFm1gEW1QC8OhvwQ9ci64VF10pmhGkicVpMlkB640ON0U05ILJSbRDifIQNrBDvO6iE8gNiLTQ53qEhv6X92EuZNqaHGKc61v+zxFiVQYdqEw1u8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=170gTNBpTZDg9QNm6STM+lTVIIo1ZrWBBaNXdUDBlZU=;
 b=E/bE7CPi2CqW0iuTsyob/vLaY3vYR55lAhGaOzH6CMfm3agWdSoIjUM5Og/b1tadMj6SPH7MdL/+InFkKjUoNapG9FUgGGpILdoyYPa/Ieoj87fRQ477tUK0c0ygk1KZ+HO2dXuhI5VDU19ce4rrUz6H4axYO3GcxTC83NbLYdQlZRJfBSEnNyN5Iq7Cf/5jL90a6osCXvIdzDkVjpDxxU+bcWD5UiMMUTHwCWQXzrR/c4BHyA6b6EaIvSEBHCauICrItU3h6tZMQh7SobaJdCEIQjrZZoYwyrKzegJTai8s2P7sWSWl1OXOwemGagfWWSL9EcanBmKUqf3HtFwSjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2984.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:44:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:44:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/4] libnetfilter-log: add repo.or.cz as premirror
Date: Fri, 25 Sep 2026 13:44:24 +0200
Message-ID: <20260925114427.2889-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
References: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0208.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2984:EE_
X-MS-Office365-Filtering-Correlation-Id: 2611d4a6-a4a3-4d46-48fd-08df1afa5fee
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|3023799007|6133799003|56012099006|18002099003|22082099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: QyKs0zDg43hbGqdD3l/IPg0R8DqFoCllkBZ94f5UlvNgM2Q1EVQqKtrNQujEOULC/DSx9v+JbZRwX8X8fzJyGq5G2eGdxjfF/QIK81JcgSJLFwA/wCHh3TYN7mx1LwioU4lwmegQvL+AyTo8D/76cAbuw286JDRDqcBiKwd0SjLx2dya5u0hTksj05ObawJdEYFTYmKVmjySSpcPkvDjeTWdlqQyShdIVWtwmhPAQsi6kxeIJq3x7mhfTsoKRXIZDCxQn4Ud+pZUyQwPS5DWX5fHSu9nLkUj2a/vsowEnw3/Z/athlz0ukRAThfdySnGbQSGwA3LbAWh5QijDC7I82vLn2OFrlD01p/oPQ3qCyKRoeUNvZRuPwBrnTH/8AWh3810J4FOdnNzBRJw0Z6zwxGP3VvD5WGqSOOZm0Qw6YfCn3mlc0YEtkEstxszvmA4e9gMIZLgH3vV32tV8/tstV76t7SXJzAtKjNM1AX23wM8FesIROQxSDDnuJfA+rq7Lk/NrJ6mYfdXyxhhg7Dx3XZ3amEslhMlivLT+3Ac2JnYqhqGeZAQot/NVOX55hqBihCPtzLX0Ai6oxgAkp7DPgO2sf1pAuF0qca+1+kTywwhohdBj+Qyo2s8W0RWKUHo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SD2K7KyflDt4262noxA1MUShtFiscxxnBnOxGRe/YgRAL8I6kJgdTHOoJoSq?=
 =?us-ascii?Q?3yw5rsR5xVWF2TYoy2JiN08IBYhimcGV8KuFwA6VUR6FPOi5dZLYf0QeCVob?=
 =?us-ascii?Q?FRt4TwL39Y8wHslQE5L14elc7cQOUZ/Yg7IgG+cc5juTsIFNMtnM/vxYTjRC?=
 =?us-ascii?Q?GJ9aXS4gcA4wUfUOnHa6Bd62H/N0NdkQF4owHiFNFHWoKMN3k0Jq+tQNT2Yr?=
 =?us-ascii?Q?F+LogMj2Bvt+YjKjFOgM6PrUkSIyToHoTdAliXd+vhUQ18badxPzldtyxrhE?=
 =?us-ascii?Q?4CKGoPwb1LJLc8HuK+4mFIkYbPOwO/2zPVcISfkKRaPvlZ0cibsbjsFwkGKb?=
 =?us-ascii?Q?DMC2Ri4m26dvVrnYPJyo3aUpYVx276UwHBmGYIGJfGFDbS3xI1/n+zUZy1wQ?=
 =?us-ascii?Q?QEVf9RCtrj9Xi8qCYEUN6bhwiy3oyxSK/xQHxfrb5oLpvdRuz4Tx6QoLWthm?=
 =?us-ascii?Q?cRoQi5uSogbmt8pWlZZuc6gbIHuc7v9IPk1IoNEPjZyFqHhe0JssqnkEOQU6?=
 =?us-ascii?Q?trVDMF2dkAL8OeHuUmuz4q1Ai4FJeYKTmGPtcrPhaLHCqhvpymDUVcVSBSYz?=
 =?us-ascii?Q?mAwDHuvnVnL+eA5f5vooP+SYHI+6ANCLTn+/xuUZ5z4CBUmwLvKOet/lU8Zh?=
 =?us-ascii?Q?S1zRunUjNcwwFS2C6hhyMtMOp+K4wnQLN3JCKNrJqxbiScFywPw4yTLv1lkR?=
 =?us-ascii?Q?Sn5nR/sofOirCbUgE2ul7dxOa9vY1c9ylkvnEal3BA2I5slBBqdZYM/+migP?=
 =?us-ascii?Q?nKa52e1MewxvsqzeG0sUAP1wgA8+jhtDGnpOrm7ETMQzhLw/ZJi8d1YlCMWC?=
 =?us-ascii?Q?VV1fQIuVUzaWn5n7IbeNYOVopeOXdeSgCnYuoEminXG/2pDQEfo7VB0b1bef?=
 =?us-ascii?Q?HHtfkD7bg5R35RDSQ/ApA0nsU3RtYIBt9nI3bvxff5daI7qMrBaCQhvnSSGQ?=
 =?us-ascii?Q?8vblgQd0u+Or6HmzegbtJgztDzi6PzJiFyd5mytLcgSZr46DNTAG6u8uz5/3?=
 =?us-ascii?Q?B8mJs9B8dY/hL1T+Y6/rqf6XteEDChvkXnmXXKLB+BTCF8wphl4VaSNckI8X?=
 =?us-ascii?Q?1RGsQ07FnS7dyFkzDtKbdKiyVpoJQMXlqKnMttMU/MMZMDl7GdgeDtddUG0e?=
 =?us-ascii?Q?+zU6ao2exGxU8wokWwSfySCWvU9529u6C+2merWPK+hU2gO6cVigne3pWeY8?=
 =?us-ascii?Q?CZtumO0SGzGCNzQv/fWQFiw+Trj6nphYG0AP/fDzMO3wgIEvrTOwXjr8WAOh?=
 =?us-ascii?Q?wB6UwIjpoaHXqz5QgI8ZAX4+7I0uL+TesccYcA4NdsIOdnWIS4ZzX+EZB82w?=
 =?us-ascii?Q?ThjjqMdGhhG/UjyMo8eoaztfICv2dPqiHv/TMhxjAYXeS9QzTMCdqy0e+E90?=
 =?us-ascii?Q?hcpVBy/ZnzaXWL2qepfvA1Qk/kQrDwgX/w3HAx9Pffi90ZaZ9l3IoiA/5Zxw?=
 =?us-ascii?Q?ekiuj+tur/gCSK1tpVJ7KCMs+XbnvVVM2ncXiCpU7yEu4W7Nd967q9/hqNIA?=
 =?us-ascii?Q?zUlge9SfB7YAxIhglGLjHXHxoYQ0EUP+9SqfMtvVKHumDlwiwbuPap9UH1Iy?=
 =?us-ascii?Q?RB7z2ILjLKxw+2R4pSZheZQwC8vFv7WWYQ7/6zdsyJLEFRJRjHxGHXDMMJAf?=
 =?us-ascii?Q?OYe9QZJqy2dB6HVAZrZIisONyRP6Fu6lLbKL1T9rB1srSsS0tTv21Mqmkcut?=
 =?us-ascii?Q?ZVGDFvEODfCzQIf9JyMrcbWaKHfniMPZF7KnbWZ4HKuQ/Qqeb51e2Ls2E+mU?=
 =?us-ascii?Q?KQ5OzWCWnJMO7ES5Vv/NtMoUP/qijL4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2611d4a6-a4a3-4d46-48fd-08df1afa5fee
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:44:36.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OITh9Zfz69uVMAACZ/I3BzGrZEI6KDhUC+NDaYzEUsddCFgbPTvhuz+khTsMXaS6WFZHBHV5ir45moIaxrX02CjxwMuLavuSrWbH3xSG8ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2984
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 11:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130296

netfilter now offers an official mirror at repo.or.cz. Add it as a premirro=
r.

See https://www.netfilter.org/mirrors.html#git

Link: https://lore.kernel.org/netfilter-devel/arVpqySeeTQ7ZA06@orbyte.nwl.c=
c/
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1=
.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.=
2.bb
index a6e6b9b153..5082ed0134 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
@@ -9,5 +9,8 @@ SRCREV =3D "b0e4be94c0b8f68d4e912402b93a130063c34e17"
=20
 SRC_URI =3D "git://git.netfilter.org/libnetfilter_log;branch=3Dmaster"
=20
+# See https://www.netfilter.org/mirrors.html#git
+PREMIRRORS:append =3D " git://git.netfilter.org/libnetfilter_log git://rep=
o.or.cz/libnetfilter_log.git;protocol=3Dhttps"
+
=20
 inherit autotools pkgconfig

