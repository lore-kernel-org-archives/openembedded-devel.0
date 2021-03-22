Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web12.12385.1616417964439775343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 05:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=fVFY+oC0;
 spf=pass (domain: skidata.com, ip: 40.107.8.58, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3UYikvjtMeIPtSgk2vsX63p+8xVfTtflfZY9KZcHQZ8eT0uNvYb0/19Cwc28kUhH7+IoU1Q9vB9zUYp1eB2pA40mb2p7mwlHxzdZjiVP5QqNy+bP6PN1Jy852CDCtYLYYUPEsDYMnqecyfJ6J9dnk4IidddD+3vvpYnq2Akuzs+N3x+6Dp3rD5lje60kykc1OoizZ1yJy1hIqOXx6vxhTfAp7qu5DOIlru/O1m4cYXxpd0AV0t5+r+Op1cwjFSuNl0wEkkGbKEIU3gAwebYYs+FiSoc4BGP16tT8Xfubv0GRnkTAwOCvHRk1Z2cullfY2KoT4XTGo4hjTtTVm9Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qna5UO9URdjWoDN+iXLQLe/eAHFVatAeHhrQC/a9CBs=;
 b=Ig9OQafGeujJzYsNgXcMDX+PqQmMJv6g8AyUHvumL0n158mhJX7/Y9ht2pamaoP8e5OyPvIS1qfC5EgsDNNuXK3CQZueEnIgSh58bFEZcpmpfnI5tPxDBKzSf5SuxG9ocQY9nV5vb3+bmFXwaQSpMUxRXoSH/rEOddn6WNSOseXY+NJPww3Tz66IZSU+CSx9V31HLtGI5hLM4oW8tjKIG9jR2rFrbGxi2g3s4bbUlPQ9x714vstAwdBtiO5WfP5K4rpr9JShAkRTZOFpB/fJLYrPYl8W8ECRC56P2S7AkSxQWk9N1HsNc0is5JAgRXBftyAfFeMFnBT2KOgRuQqk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qna5UO9URdjWoDN+iXLQLe/eAHFVatAeHhrQC/a9CBs=;
 b=fVFY+oC0o+L+TML0/DMFdZghKAEOzOm3MeoVrQCq9E2fA8kr3xlJP1p52c96DN8MWm0g3HzSBzXCrj4/0o4Jvw5hRG1gEFqjO+Zh31oqZa4usgEpfrh2goNk1GUtyqXH0C4GuDownmbnbM/83lydlFmZm83c5KSrOKKWzHxzm9g=
Authentication-Results: vctlabs.com; dkim=none (message not signed)
 header.d=none;vctlabs.com; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VE1PR01MB6013.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:125::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 12:59:21 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::2983:c1a5:e792:b3cb]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::2983:c1a5:e792:b3cb%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 12:59:18 +0000
Date: Mon, 22 Mar 2021 13:59:10 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java][PATCH] openjdk-8: use relative path to build-aux in configure.ac
Message-ID: <YFiUnvWEeEk05021@brokenbit>
References: <20210317225802.logo2goqzs4f5na3@vctlabs.com>
In-Reply-To: <20210317225802.logo2goqzs4f5na3@vctlabs.com>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM0PR10CA0108.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::25) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM0PR10CA0108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 12:59:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c8edcac-3128-422b-6fcd-08d8ed324d80
X-MS-TrafficTypeDiagnostic: VE1PR01MB6013:
X-Microsoft-Antispam-PRVS: 
	<VE1PR01MB6013A9017A4973F3C5352D75F0659@VE1PR01MB6013.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pCEEzHhvcfwau68bR0MjVIR3qCc2TKs1vEOa3dTUipWQLCYDr2TqvC6uk6QYMAZ148YJOzK5FQtVbhR71wb6nPhETvq3Vc2hdKOqNOthuMbULQycAv4sP/fxG2t7fye1SzLyLchMuw/kqlGu679NN5le/VEmuXAGgj4RctcMd+3BqDOVpPvpa6YxM+FBsB8+7JxJsyw6HLULUDUP8xVj0oo1Gg0b5V6lLtTHx3xHfVQjmGqc8NmzKy8FChj+dwVa4kmJwfQ/OwB5T1WdebC2YmIAVS1Eox3c0i1UJBh6ms11z9CuI7vt9WPWevPlyIx9kO2yxUpS7kri5qIkB6OufkDwBaCwmIZghKtt0XqZZAUZ5wwQIuV9TfGPjmNw7wel+T7maRkU8P28hwhHYJoW4y9xkiqshcIwTtZjjf71SHQ4M4tJ2+HokxVjZ6DHxcw4FsAPXEoUD8aUQ5FwJC31Fj8bijrSrG/7U1vkCA04nNnen3D9NvQrxyTyD/IKjyGAX5AvoLrrMLrfSnbWAyPK+wz3MGpT0qqh6W8k7s/scO0J7H2owL2m1HhZWaqqgCU9WGIT3BTmyHWR8u9JXSSAHAmLwTfjHgza51VFUfEsvXxLpodzRqAok3g2BfbaWJtHhgeYUUtQ8tQlCWnyBBZ8GKKSY4IlhlY8pom8zhKQvvzvqeg2e+yWH4tTBhLMn3LSZgM2rT9g+D6q4R573fZf57bWWYJInERvCs7ZuGlDm94=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(346002)(39850400004)(376002)(66556008)(956004)(26005)(316002)(2906002)(33716001)(55016002)(66946007)(6666004)(66476007)(478600001)(6496006)(83380400001)(44832011)(52116002)(8936002)(186003)(38100700001)(5660300002)(86362001)(8676002)(9686003)(16526019)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?c5HSDzpCm7zv/rsj/Eo0crH+6Mb9Pxcg4A78tLFb4d51DL07BoCLH//1Mr1h?=
 =?us-ascii?Q?C0+mcL8ny6zkbhzaUa9KPMM3aMUPdzlTFa6lGcI+PKUkVvbFmXgsuv0au2UL?=
 =?us-ascii?Q?AujUNf8VAqoHVpyua2n4IaPzeyIhX/5f6y6PUqBwZ8IlBRUZYtdOMekP7uk1?=
 =?us-ascii?Q?J5nC9EHEIe6GgNP1OX6CGgbfPIaqQDWHyf9McaKqCRzaYD/sJQX38eIZLoS6?=
 =?us-ascii?Q?wcp/TDoPTpsVUCTmy9YMXKS7rnD+IhWKQyCY8pw839jCSa9bUOr5N4su9eNc?=
 =?us-ascii?Q?j/APvkPepe2L91cLl8s019QfV0rWP6rNzEPGDeK9M1bieTiUpitC7+hk/HUY?=
 =?us-ascii?Q?ZiP3LgP9HtimpdUUsyE7yFMlBbEKlsOMLvdOd40uvINYvanhELFU3kLw2gWh?=
 =?us-ascii?Q?qOkpOWWoYw1WCghSCzEqyFwH8pCtl0zifKP7UWvLrsaY0iLW02VhPmjtixpj?=
 =?us-ascii?Q?FkyRlbCfrBXInoPl0dZCdGbvDce3s5u4XCa/ufW5I10UhC3y5cNqqLLQhu97?=
 =?us-ascii?Q?+NjjGhMHzEsVu76xU8xYGN/waMFsl7P3tgiHIF6iwKmudDFMkKMnIGy6NZZ0?=
 =?us-ascii?Q?H1CiM1ASzr3R58tnk029GmpFyjXZgBT/xGz/Ao/101G4I3aC8S7mjOypLmgt?=
 =?us-ascii?Q?ChJLlQ71aZ5PSV4vfVhdFXgdQicZZzvLt+AOLeZ6//0hT0jR0+P8X6L2AcAM?=
 =?us-ascii?Q?Qbd8ZcEWeVLolbGPiQQFTNzSmljfwpHhkRLpxMaxaeNjT1vkF21TbIzwwbp6?=
 =?us-ascii?Q?205K1Re4HfLluNtCQLyKBHpkyQRQTmg5SpVCuz541M2YHNE266cHbYYU/aFa?=
 =?us-ascii?Q?E2+CSjTG2zXesTewFBeQUh8TZuzSw2wfYGF//WwEgjCheVIGfuElvmhTnzGs?=
 =?us-ascii?Q?PHf1/3tn4NNtj1kCl/ajsMmhoL9CjcHPYNE3nRuFxocKxvnaoQN7rCqu73Dz?=
 =?us-ascii?Q?1qwcEeE4OxV0ueR+0gPd3tkG9fYWLxgGSTi5X51n3bl7HeyDPvQ2rVVh10ri?=
 =?us-ascii?Q?qd3ljN/K71U3A5wd1RWf2WqqBHWVqW6O6vHnnsamm/ox4icHPh6NGKPZEOQF?=
 =?us-ascii?Q?4JGyxaLOXrMy9SM3o2MmQg40/lC8dZvVT6hBna/udQ6PJ6ujayBErGrGP2+4?=
 =?us-ascii?Q?wu6ejoM/MjDWzGG/zRa4tHqfefDy6Kq8wKQW+LyAsaUBM/F7wZ1RsE0dBdhl?=
 =?us-ascii?Q?F03ho4byKoTiJF0jf7WS2/QK2BsJoQ4ptHKMQn5lr4YhiTvsHrsQcwaONpSm?=
 =?us-ascii?Q?qmg0zEp6RXkdn+0jWblrT1QnPvdNj4sxySABb0h3aGckWCeO2VcjAAzePfCI?=
 =?us-ascii?Q?5+VE0khhiPDbeXv06BDhbz0n?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8edcac-3128-422b-6fcd-08d8ed324d80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 12:59:17.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPGLmBAw6YVAZh3+Qi+BiLfLEK1wIdrUogU3yMhcd9u2AZgRtk7WM4pfKnBYG3FXowdKWshKaCg1Ip2ve3hpJfSw4Ej332b9D0jFig5bKS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR01MB6013
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
thanks for the patch.

Please find some comments below.

On Wed, Mar 17, 2021 at 03:58:02PM -0700, S. Lockwood-Childs wrote:
> This autoconf error has been present a long time, though it used to be non-fatal:
> 
>   autoreconf: configure.ac: creating directory $TOPDIR/common/autoconf/build-aux
>   autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux: No such file or directory
> 
> Recently it started leading to a second fatal error:
> 
>   Error in tempfile() using template $TOPDIR/common/autoconf/build-aux/XXXXXXXXXX:
>          Parent directory ($TOPDIR/common/autoconf/build-aux/) does not exist
> 
> Fix by patching configure.ac to take into account that bitbake is
> calling autoreconf directly from its parent directory rather than
> the top level of source.
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  .../openjdk/openjdk-8-release-common.inc      |  1 +
>  .../0014-autoconf-fix-build-aux-path.patch    | 30 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
> index a3747cf..db6a4ab 100644
> --- a/recipes-core/openjdk/openjdk-8-release-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> @@ -10,6 +10,7 @@ PATCHES_URI = "\
>      file://0009-prevent-debuginfo-in-favour-of-openembedded-package-.patch \
>      file://0010-autoconf-remove-shell-variables-from-autoheader.patch \
>      file://0013-autoconf-remove-Werror.patch \
> +    file://0014-autoconf-fix-build-aux-path.patch \
>      ${HOTSPOT_UB_PATCH} \
>      file://2001-jdk-comparison-between-pointer-and-integer.patch \
>      file://2002-jdk-Allow-using-a-system-installed-libjpeg.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch b/recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch
> new file mode 100644
> index 0000000..45dbcd8
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0014-autoconf-fix-build-aux-path.patch
> @@ -0,0 +1,30 @@
> +From 2246166945819a68d1c9facd1698c9ef430611a6 Mon Sep 17 00:00:00 2001
> +From: "S. Lockwood-Childs" <sjl@vctlabs.com>
> +Date: Wed, 17 Mar 2021 15:21:54 -0700
> +Subject: [PATCH] autoconf: fix build-aux path

Please re-apply the whole patch series (or adapt the subjects manually)
so we get a nice-and-clean [PATCH xx/yy] in all subjects.

> +
> +Unlike the upstream build wrapper script, bitbake recipe calls
> +autoconf directly from common/autoreconf directory. Adjust the
> +path to build-aux directory accordingly.

Please add an "Upstream-Status:" tag here.

> +
> +Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> +---
> + common/autoconf/configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/common/autoconf/configure.ac b/common/autoconf/configure.ac
> +index 67a230591f..00f3b0ef7e 100644
> +--- a/common/autoconf/configure.ac
> ++++ b/common/autoconf/configure.ac
> +@@ -33,7 +33,7 @@
> + AC_PREREQ([2.69])
> + AC_INIT(OpenJDK, jdk8, build-dev@openjdk.java.net,,http://openjdk.java.net)
> + 
> +-AC_CONFIG_AUX_DIR([$TOPDIR/common/autoconf/build-aux])
> ++AC_CONFIG_AUX_DIR([build-aux])
> + m4_include([build-aux/pkg.m4])
> + 
> + # Include these first...
> +-- 
> +2.17.1
> +
> -- 
> 2.20.1
> 

Apart from that the patch looks fine. I'll fire it through my automated
tests and give feedback if something fails. Apart from that I'm waiting
for a v2 from you.

Thanks again.

regards;rl
