Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB87D5E15E
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 11:04:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web10.10180.1731063882887590979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Nov 2024 03:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=o/8FkP/o;
 spf=pass (domain: axis.com, ip: 40.107.22.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lB8GpWraX3BhR8sT636ABH3EH7eJPov8vY4Sm7dR2sfFF+gd9Lt3hH8Y/26jFm2NT4YttvqLmK1ukZypD+op0xbaCXwGZ4+5a8y5v5mCQD5kJRXjPgDiNQrbMOMi90deMZt8VtJL9MjfW6qY4WWfrGj5qiG6VjzijnCdc+8grVq331cz01ghNIB3DYuuVHWm2nw6Ld6ynerujrPJKJVdqu1IisGOMQ45bcGP1v8CHnIHNT6+IYyMqhKOJRF98OY0cR5cKbQNYEg2aEkJGtYK5s+rsjlZGn9pELpqIY2n55nsDXG+E/4FSDokWRXs6Ia5x4AMB8jcB27czJpFVbnhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTQ/JOyZBuN9crcn8BTrDesjj8mhjmhYdhc7uIfvDrQ=;
 b=nO50m5kJ0rqT6zgeVLniJEi6Zt+6EBgj5WZQz09gPUczv+HusxHkrZJeVfA3KewUqvKLIYwWJWbmbReRsm6u2aGUAjJurfiETzlo3YahgFQu9kOM5UOwzXLh/spkeueRARINhYMt9ZjjIuMP4ikcQKlTAOu2Snjg4TSYi45SqVDC7ScYI4PGQDYSSZwUpfd6vFqXhB++VeM1Mwri3eg4tnoEF+eBqrPuKymZj/Df/idW54rrbSrog9rNoodVdyMETMlN9OwTkCEFR85haQk6giVvN3EOjP+tHxeMYPg/hMbfxAmIcGF9RS5WaWS1c5j9jEVBzK7QnlqBcgTdsVeD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTQ/JOyZBuN9crcn8BTrDesjj8mhjmhYdhc7uIfvDrQ=;
 b=o/8FkP/oN1TK7GWY7An5HFhsdmv4lLSuCh7rImbz3dAhBTsiCyUBHqw8h/WTUDwnEFp/xk+7uWLRULpQ9J/EQ2W2FNUyEduDlBGnTN7l9qeI0DdZgI52EX32Jjhkna1tgFjDvtRAxAIr/06lqlDoaJKB8KmsXE+fnNSQUIrnkLI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB8814.eurprd02.prod.outlook.com (2603:10a6:20b:551::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 11:04:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 11:04:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "peng.zhang1.cn@windriver.com" <peng.zhang1.cn@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
Thread-Topic: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
Thread-Index: AQHbMDuIhAzgLFAMKE6QTkjYFjYFi7KtN/wQ
Date: Fri, 8 Nov 2024 11:04:38 +0000
Message-ID: 
 <DB5PR02MB10213B19461D7A24EC043E886EF5D2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20241106110311.1657900-1-peng.zhang1.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB8814:EE_
x-ms-office365-filtering-correlation-id: 232277ad-a36a-43e4-2818-08dcffe5234e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?tAHW2rC8qOE65nlSAotoVmi8j8+Qvtgn37FwPNBvfTuTQEJneG3vVB0slBIm?=
 =?us-ascii?Q?czhmhh/dkJo5UN3RFPwpylvI6oZ+bnhUWBLCRqZ5+zuwo4ei1uWNsFzqza+9?=
 =?us-ascii?Q?gSPG8eSTxNrI0fsJLJJBDQ4IMZ+AKH1AYhA9qDPLRu7K+6454CdId5KDLcw9?=
 =?us-ascii?Q?pyd3Xm4KzEqXFWDuWgJ2OaHEXEd/I9T1uqqRtSOId2ZnRMQTcEGP6QD4eRp9?=
 =?us-ascii?Q?xAvjmpm8o1mKezpL59RxEMvbwTUkE5LPkx7zm1qzZ9WkxyqfdnYvkBmBT3Rz?=
 =?us-ascii?Q?TKj1zFD5tGxNzS5wta/P6yMRqDaW+3oO8Iy62Cca4A53n524B1H3TsIWBw+R?=
 =?us-ascii?Q?otCR0js/fPoqI1/F1WL8FfhyEoxGG9hjCem6ve8DvwzFusRYnMDJKVo4JLlu?=
 =?us-ascii?Q?mfLrVHc3X/q5y2zj9zdRtgakpWvD0iQOrJdrfxCguHuhzMqxVSoJELd/uHCK?=
 =?us-ascii?Q?Ywx3zCcFzgjU33AKjshyorbL0R6xKYcloKCeqVJac4qnfbR3MrGefRrWkAr0?=
 =?us-ascii?Q?kmOjByNL3UHEv1LDgMNvJh6oTdkYfx9UwYL0XV8eDBWXd4qa1qV40LSuvdFD?=
 =?us-ascii?Q?O4yVSib957bCaTiVw50cyFZFP9gwrswtsNKYIGJ2QXzpj060aqB78bbO1f18?=
 =?us-ascii?Q?gZ8y51ZR4VahdilOP3Tb8+6vMT9voymtG7nRsf+bHjVyWXnexMsZ6vp2cv+w?=
 =?us-ascii?Q?y38qPj4qaDns0tOw5EX081ecOJOuu/bZYei/ecYKJCMppNUyMRYj2BalXJmj?=
 =?us-ascii?Q?KAHKjWjT3nDtbC99V7BzMghjRi6nOnoFTnq9Cyp70yhN93Mrwa0Sme2vMdI9?=
 =?us-ascii?Q?a1mtGJ82NITC460Nu/SXGGbahHTq3khSVFWkgmUnqDOijPlvjFbbk3Il9H/j?=
 =?us-ascii?Q?usPGdfIWwaxp/S3QbjEuVy6PXY7qDrFC2GjJfKnUb/tvd41UHPPMnsqNmdz4?=
 =?us-ascii?Q?7F22ay2R54VMYVvguYw90vK6FFa+9Xz2wJ7/a9S6s/c8XbndRHAKJrm2Gkvb?=
 =?us-ascii?Q?QrHeH9WV9s1O5zvxUIi1cfk6X1tJ9zx35hOApOtM9xLC+aIrJS9sWvQrOYjF?=
 =?us-ascii?Q?HvF+uRbGsPe9JKoJrycVFJcckGH7QYuntx4REBcv93AUjqC4OrNY0H6aUgyz?=
 =?us-ascii?Q?zdO3VtYKQjWzsWJxTztBYLKy5EgLURx6/3TK+aRm+WGcgOgfzOR4PE2ErgP1?=
 =?us-ascii?Q?3/oO2RwM0lWs9HbfQmRNbXvR74vqyuYJEeusiVN0JfFJQEpBQ9vVt22NUnIa?=
 =?us-ascii?Q?xRw/Fvq14QBMayyu37cEoIriuMOtPubE3R5jX/a/LaBFd+vqn1pPMSy9KA8R?=
 =?us-ascii?Q?f+fYqQySuzO7cw8m3Bo+Wr0Rt3axPXN8idEi+BDk+ss3hSmbwYj+9XuzOcI3?=
 =?us-ascii?Q?6vv/1Niwgr8H6MyAcOCzo617+72/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DyzhzpjKT7A88iw7/SKInvw7Yp+tqzFERlWctIVj1Jo7bbWYKEE4wYPFTBer?=
 =?us-ascii?Q?xAmhm8Cj0HtFcUSPbTciSOwx80fo5ga2x7B8vcJ/8rRqQbtmX0+oVADShU+H?=
 =?us-ascii?Q?Rcn0mlzIALEp+t6eBachorAjyqdMKivALK18AGqren0/1oRxfirKGBIRlXkH?=
 =?us-ascii?Q?8J40ZEaakrMqtDN5Ak7xM1eEBvbW2fayUdkKZsPE4Mwd5/g+wpEJWoBgeYmZ?=
 =?us-ascii?Q?Wyoc6hf9aSLMzjGf/v2j1ujfsyc1N7x08scbG9BTACx1R2lzB3TpmewE+QNp?=
 =?us-ascii?Q?g2sYGZlS/c6dD35JHITftAuAEa90KkKfFDPDNtab76yJJoCPlVSIJSxD0bTJ?=
 =?us-ascii?Q?2L06bk4fLhTb1SYIdZ0SGOYa1rIg2EWEpRvEczYCvSUSCjhQ92J4B84NhLJj?=
 =?us-ascii?Q?yrcl0VdxOASrmgE2F6aZP8KA7YoqA4ViCMO/uYBJdubdk3FwJ96ukVoDrTM2?=
 =?us-ascii?Q?XCCO0VqCvetZNiki1qZ6NcvtaCj0Qmzs9IYiVSlYy1qSFqudHl5gL3ZyoEJQ?=
 =?us-ascii?Q?8iWcbJlBrLgoQU8Fv6ca0CDQ8imXElMuiir/Y7Fa6HS+XVEnF7o+lGPJWOf2?=
 =?us-ascii?Q?U3VBIo5/GK76qO4jlrlT4C8Kqziqr4adX1n0wpfuNiGWDSm68UGcFnaBuCxD?=
 =?us-ascii?Q?HtPmnsXCgkJG9H98YB+WNnRM9axFOeGgOsgWGUPaRpy3F8XekO9jGr8wQT6w?=
 =?us-ascii?Q?QBjENvWou9NspVv3XYoJSlLsAhgIhoAmypryTBO0LR9Pa4qGOspETg9Ejh5s?=
 =?us-ascii?Q?bf1Trttn3loJryPf9lVUMzUjAY5UIqIY7oQWY5XtKclCZ+Vpo9zTsdfdsnCq?=
 =?us-ascii?Q?6FXEioIznGdoT8LVJyAd4STqNIj2u9WRrpRMSnR+T3Fw7JFhdKlQBhM7Haka?=
 =?us-ascii?Q?HWHvUqjSwxgzs4VV4KOOB3w+Xi2zbaquP13nay3wzKLgdj9atBlY5r75fpru?=
 =?us-ascii?Q?8gPuFL7NFBZYHJm/DsoVUv1VYGIZ1THt9pwsvpPyfQdu2pPcuf9a43+BmNtW?=
 =?us-ascii?Q?O9vdgOXx80Y0YVYn6BL3aWPLZlpPfYYOGEP+tducbqdQy5gAycE72KzDC03M?=
 =?us-ascii?Q?4aCHzRqyKsYC0u+Y1yZb4A6dzXydxobhvsMscfW5GTARGkI5BPUfNiX9jaV2?=
 =?us-ascii?Q?h/zqfelT5rv9UOR4A9ornRfrb1f8ZrkX5zTg2V2lM/MB/V281i0UJXKFAhvM?=
 =?us-ascii?Q?Uzc0FQNg8b1QYyODqgYEomP5YmPDKXmhsPo5w9rWLzEXne6njqZdBTWWgycr?=
 =?us-ascii?Q?jUnQSIMHn9JI3uD6GoKL7EF/iwk/iyAWWSFe5HhUTB1mTQlvvlhioAE+E6r3?=
 =?us-ascii?Q?IbW0FX3YRKbkn6Q6TWwRnVo826eYSXwp+LRp/Ggux8updD782F1NFS674h/1?=
 =?us-ascii?Q?FBfRV49MEGbrdIp2QoXp7quFDheOdjDEHmmZXGQXEHq1o6uvoR17xMMtgbvl?=
 =?us-ascii?Q?i9t+8lexAYgHCwrpW/pv3i7+Vd+H7+xQNe/s414EKvaF110GSqCK7rgHFSBv?=
 =?us-ascii?Q?f/j9zWhfFXujTpVcOa5hic1k/wKNCIHUMg958/XAP7BsWiopGxZ4zTxS05Vg?=
 =?us-ascii?Q?fTEBlAdmlp9rooQ5he8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232277ad-a36a-43e4-2818-08dcffe5234e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 11:04:38.4429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHsuf+3OCMr73Qfpi15AjbDlYXfg10IHqG3+QllYtXpmKyqRsQ5wf22FUOs+nEbA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB8814
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Nov 2024 11:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113764

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Zhang, Peng (Paul) (CN) via lists.openembed=
ded.org
> Sent: den 6 november 2024 12:03
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH v3] parallel: Add recipe for GNU Parallel
>=20
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>=20
> This recipe adds the parallel package, a shell tool for executing jobs
> in parallel using one or more computers.
>=20
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  .../parallel/parallel_20241022.bb             | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/parallel/parallel_20241022.b=
b
>=20
> diff --git a/meta-oe/recipes-extended/parallel/parallel_20241022.bb b/met=
a-oe/recipes-extended/parallel/parallel_20241022.bb
> new file mode 100644
> index 000000000..e3cf0a6a7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/parallel/parallel_20241022.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "GNU Parallel - A shell tool for executing jobs in parallel =
using one or more computers"
> +DESCRIPTION =3D "GNU Parallel is a command-line tool for executing jobs =
in parallel on one or more computers. \
> +It allows users to run multiple commands simultaneously, making it easie=
r to process large batches of tasks."
> +
> +HOMEPAGE =3D "https://www.gnu.org/software/parallel/"
> +LICENSE =3D "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784=
ab1c72e63ac74971f88658166 \
> +    file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f03e89ea=
4b8\
> +    file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e50b1d45=
0fea66b7\
> +"
> +
> +SRC_URI =3D "https://ftp.gnu.org/gnu/parallel/parallel-${PV}.tar.bz2"
> +SRC_URI[sha256sum] =3D "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939=
ba937925c0a57a12"
> +
> +inherit autotools bash-completion
> +
> +DEPENDS +=3D "perl"
> +
> +RDEPENDS:${PN} +=3D "perl \
> +        perl-module-ipc-open3 \
> +        perl-module-getopt-long \
> +        perl-module-file-temp \
> +        perl-module-filehandle \
> +        perl-module-file-glob \
> +"
> +do_install:append() {
> +    rm -rf ${D}${datadir}/zsh
> +}
> --
> 2.34.1

Based on the above, and a corresponding recipe we have, I would=20
suggest the following instead:

SUMMARY =3D "GNU Parallel - A shell tool for executing jobs in parallel usi=
ng one or more computers"
DESCRIPTION =3D "GNU Parallel is a command-line tool for executing jobs in =
parallel on one or more computers. \
It allows users to run multiple commands simultaneously, making it easier t=
o process large batches of tasks."
HOMEPAGE =3D "https://www.gnu.org/software/parallel/"

LICENSE =3D "CC-BY-SA-4.0 & GFDL-1.3-or-later & GPL-3.0-or-later"
LIC_FILES_CHKSUM =3D " \
    file://LICENSES/CC-BY-SA-4.0.txt;md5=3D7130783469368ceb248a4f03e89ea4b8=
\
    file://LICENSES/GFDL-1.3-or-later.txt;md5=3De0771ae6a62dc8a2e50b1d450fe=
a66b7\
    file://LICENSES/GPL-3.0-or-later.txt;md5=3D8da5784ab1c72e63ac74971f8865=
8166 \
"

SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"

SRC_URI[sha256sum] =3D "6de22bf1c67f7f316670d21ed1a2a32f1214dfbd3e420939ba9=
37925c0a57a12"

inherit autotools bash-completion

PACKAGES +=3D "${PN}-zsh-completion"

FILES:${PN}-zsh-completion =3D "${datadir}/zsh"

RDEPENDS:${PN} =3D " \
    perl \
    perl-module-file-basename \
    perl-module-file-path \
    perl-module-file-temp \
    perl-module-getopt-long \
    perl-module-io-select \
    perl-module-ipc-open3 \
    perl-module-posix \
    perl-module-symbol \
    perl-module-thread-queue \
    perl-module-threads \
    perl-module-threads-shared \
"

BBCLASSEXTEND =3D "native"

//Peter


