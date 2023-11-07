Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653FFC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:05:01 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web11.5062.1699340692258071787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=CTyrqwNM;
 spf=pass (domain: axis.com, ip: 40.107.8.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuJuTSRYGEQVL938jeGbhATFOt91hGuIuM1ntVcSnDvJ0WyimfSO2bmVdNrNJD8JEMi5sgtdKJv6gQe7qpj/ybijLQ57wKVXhAc4iW5TOiZ5PCRvapcAMLUG5jJjhVdmJ1BcdLNI8CtLjkNuxtsJ75QqUaQPOddgHp5V35WBND5TqnRIpOK2tRdydkL5F9u/woVmsECvAiPux8sBbGzP12FSIcXeNZH9wRHSYahU2XyBz1y3nhKsAbEyd3kW5IyMt2B2EiEr0jvtQ9RwSaghVYUm4Qtw6+Z/v1IPJ3mJ5TeRJxKLDxXjHcvwOaFrrFRshjG6zzoyN2ZxU72XFiX+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lQ91xq2aZueQHqCb1lp++6kADHMsfozvGO+QWTxzGk=;
 b=ACOv2Mpa3a9hkcRmMzm6ujmpMixJMSkUib646RnaJ27AZKBlD3tf2xDC+OMEMb8qMfqzVjzdf7elM5R8jJrIgC+boCY0clNkAweIDPOw1D5RCn9raXj9w1TK2qRKeXxX0lY8IfJ8aAKlfv8PZkP6fkdTaGrZ9UUM11TDlK2YLCEFw5yHHU+gxHft0+fBoUn4kzCcfF1oQz92jwoqyh0quFKUlAH4mA9ZwaJLg510nUX/XhlBhAMbZEGTCk7/bq0AugsPm9MGLFao4p8yAnugOGZmWknVAYpw09YmNcgiC2JusMgwtFipL5H0k9Gs96ZqhrR4/qDkk2oyLirog0g5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lQ91xq2aZueQHqCb1lp++6kADHMsfozvGO+QWTxzGk=;
 b=CTyrqwNMUty4dDUgMHK8/hP4j4XeM+qo2VxaxxlF1Msd7Wda/UVThyigoDhgSMqHKdE+0uIqCZJVe//lCThXqXSlE6Bn9m71Xk2sDUEqX6VBtJ0W7+8q+sZ2FnT1F/D4lWJu4oPTDDExoHm6W0h9z/exLMgQjUy0Ju1gbX1aRUE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9051.eurprd02.prod.outlook.com (2603:10a6:10:47c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 07:04:47 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%7]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 07:04:47 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [AUH] jack: upgrading to 2 SUCCEEDED
Thread-Topic: [oe] [AUH] jack: upgrading to 2 SUCCEEDED
Thread-Index: AQHaDpBwrQs0WynKWE2os6cQ6jbccbBt2EWw
Date: Tue, 7 Nov 2023 07:04:47 +0000
Message-ID: 
 <DB5PR02MB1021373953A3F7D446536E21FEFA9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <0101018b96beca92-c23491b4-e265-48b6-826b-407851a8a508-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018b96beca92-c23491b4-e265-48b6-826b-407851a8a508-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9051:EE_
x-ms-office365-filtering-correlation-id: c35d978c-7f65-461d-50a8-08dbdf5fd402
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G6xiXyNybZnwv5DIqbNc1Z6TawR6fYwcKQ7vafCHwq9DQRH9++Zv1siKwhWKLxLqBZ2yjMDue9iZVOSU7h53SjMvEUI/HXq1Hi2BYQYm5SJxNh2whg5ROzmjgagv0fHnjuxtMKHKujPADVzGeg1wzy8npkkouh0ccLLxWcv025xFz2wqBU3HYK07IwLod9emNCGR7IlN6D6W34aecfD4zOrScCs+1Ne7N1HuMbCOvNA01QGUvlGm10T7EfQMa8MPCJ/YpS54NNsfQZFF1Jv4YZcUYREnhpPN/bHfUDDU60IOXmHlFgY6Rl0pxIOf7evLePkkUEN8ZZyAfLOiWa+Qg/bv5CYiA66ILk7VqC70hCg55/qR8wgTbdIoFTdAGtLbF0350IapToF+8V1byfRG0nXPKY86Sj8A2C0kfk8uGMThJdlcwN9Mzp/mrtBLK0wFzacSyB2ya5Y7TceIlQTEsonh33I6fIJWjxQR7MO9GelO/c7MgFc4aFPp4jkfu7OxTiqPouXx1l04vwlh6MWn3BAzySYKycnuQEecmkQ6dYZVbIQgcYNtAYUkdq08wY3SbHHpOgix6+7zsOedeHnA8SNzTpoEwytQ03wqI+nBP6U1FIhIeP6FRh1Pe3pamC2E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(55016003)(966005)(478600001)(38070700009)(122000001)(33656002)(86362001)(38100700002)(83380400001)(9686003)(41300700001)(53546011)(66946007)(76116006)(64756008)(7696005)(6506007)(66446008)(71200400001)(66476007)(66556008)(26005)(5660300002)(6916009)(52536014)(44832011)(8936002)(316002)(8676002)(2906002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vCSI4RJFnMLQGki8QOJYVieL+Y6bw9MPSkMprFCqekZvlLoK44lFbKtDmP8h?=
 =?us-ascii?Q?JnJyTJypjvUV5ugo3HmPPd6BYNldHpexy3P1XPj37Dtljxtt/NEdqcCxBPFI?=
 =?us-ascii?Q?ZjCeA2fUXBAI8EBjNawOD3IK8PO45gb/V4HrFZF7d4jT/kwuNheYeYTmYBLx?=
 =?us-ascii?Q?XuYwpqZrOKTV7hUlTSaf+EEaYgpaoI9Uut7IJXYeXqIMB95ruKF0i1sfxKUo?=
 =?us-ascii?Q?/gYsynrD18KK/zVWKaDjovQ3qTIVhTCEoORWjmdMxTNMIVKzgM2IAANe360i?=
 =?us-ascii?Q?iiXmsgmT9neBpeB2TjVMCJRSboE17fSugwq5uBjqSej/v9KuOKvWJNgV/4Ng?=
 =?us-ascii?Q?OscyukxJ6hyKzW7R2VbJ0bx7ZRYXZTS5OeTnlPXTLGcUwpXzLqBSjpuP6KUv?=
 =?us-ascii?Q?Xf3P7IY3rf58kn241OFDFMZuAFVCdzyfN8w9zFqYh3V6Gcy0xPmCNdBTgCGi?=
 =?us-ascii?Q?njDW4bfG+T6UTW4DGaOnzyWdCueOIQ7WazTw08efhwM7XHRxVQ87bzLBKhn6?=
 =?us-ascii?Q?KcvlvseHX0WBXlWpyqYFaErch9JVX4D84/sM3DTbiIrHs7ymwI20zxB5A3i9?=
 =?us-ascii?Q?5GdgvD0UhY6yLoPL1J1IsyBgZ78PxpLRbnZLSjewFG3JVTa323ROJYCGfjsC?=
 =?us-ascii?Q?M9kaLrvPUuPCCZwEuAzkkK82hZn22UmxWge/VtRjje1/pnJBKYVPJl+rPvl4?=
 =?us-ascii?Q?gHks23HuzsjKMSmX6juapt1gCEO9QGnuLNgtzuwatS0J5/J9UnkLtWOqa3Py?=
 =?us-ascii?Q?XLbU3KmtVu8DBZ/DytmFVccHjr3GMjlYAAdeYt6p+qzY+u7fYAaL58NPjAko?=
 =?us-ascii?Q?x8ouVe4Sm+GyPh7yJakKsJs1kWO3aC3IBwxeDhqAnM2KZL2P2h5n8g/rVfOH?=
 =?us-ascii?Q?kDG6TCy7Z5E/ghNxDbRdXCKxeJCKG1JGHHo/74ExivTFqflQAezkp5xWJLcD?=
 =?us-ascii?Q?RjzgwjINFO6qMA2cokJh3Ejzs64tc/Pr0wtf0QjCI8OIbpnYJZ6lwcJ8y9yb?=
 =?us-ascii?Q?RNSgGdRmMlGGZxG2LyDkm6UHjh7xSWVLDUY54IN02CGJ+nmIwjsmGQeZQs06?=
 =?us-ascii?Q?E2+vy6LvnrxMJOGlEEaO89eHdqhAt9YUjD5xYX63QdG4WTd8MWYktyUjoPKi?=
 =?us-ascii?Q?3PCK01ivzojZ496e0BOYRTGkkO0oyOMy3L0PbXznE5CQnocHcHeFD7AJlFyB?=
 =?us-ascii?Q?iy8E/Cc6PqKd8GQOmSdwwyyzZlWRNHARDIiVeia9ziknvZaX4Q/rMWnX4jpc?=
 =?us-ascii?Q?oNQKa12akoEY3oquweMZrb6FEsbn668yYjvxIKBCjJBvcuyv4rRgZoqX8Iap?=
 =?us-ascii?Q?n/NePqkpAlYM4qAIyJ7HgYx58v8KQqDGpyzGPujI78yZQdgoJ8/xFzIF8K/7?=
 =?us-ascii?Q?codl2ysn3sufx3eMr5nRYdsb6AGtqVQK6t7Auu6UyV+x15PvfzlsxcHo1T2d?=
 =?us-ascii?Q?MCumqlaYAIwQ3/S5ehIWeTn13wkXVpAdV6vI7BK3qnBzYiHM4Wcr1E8gujjD?=
 =?us-ascii?Q?G5vr2HCWwGYkgsub3IZ+jSHEwaB3ikfdhxQ+ANegIxlBkPRbFNsloq5GhEA+?=
 =?us-ascii?Q?BF/XbijoUUtY1Y1WQ0U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35d978c-7f65-461d-50a8-08dbdf5fd402
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 07:04:47.4803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+Rfr/ApgXBRmw7zsA3YPkP9RuEhmQylw70qR6DVD9wQ0vREQPQyF/hkexcWPBcz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106421

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Auto Upgrade Helper
> Sent: den 3 november 2023 20:53
> To: Forced@yoctoproject.org; maintainer@yoctoproject.org; for@yoctoprojec=
t.org; AUH@yoctoproject.org
> Cc: openembedded-devel@lists.openembedded.org
> Subject: [oe] [AUH] jack: upgrading to 2 SUCCEEDED
>=20
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *jack* to *2* has
> Succeeded.
>=20
> Next steps:
>     - apply the patch: git am 0001-jack-upgrade-1.19.22-2.patch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>=20
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>=20
> Regards,
> The Upgrade Helper
>=20
> -- >8 --
> From eef657c9b09e20176899189525b158e63b1405ae Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Fri, 3 Nov 2023 13:23:36 +0000
> Subject: [PATCH] jack: upgrade 1.19.22 -> 2
>=20
> ---
>  .../jack/{jack_1.19.22.bb =3D> jack_2.bb}       | 63 +++++++++++++++++--
>  1 file changed, 57 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-multimedia/jack/{jack_1.19.22.bb =3D> jack_2.bb} =
(38%)
>=20
> diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb b/meta-oe/re=
cipes-multimedia/jack/jack_2.bb
> similarity index 38%
> rename from meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
> rename to meta-oe/recipes-multimedia/jack/jack_2.bb
> index ef9936dab..4b31be7b4 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_2.bb
> @@ -1,3 +1,55 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgra=
de'.
> +# The following is the difference between the old and the new license te=
xt.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- common/jack/control.h
> +# +++ common/jack/control.h
> +# @@ -1,20 +1,20 @@
> +# -/*
> +# -  JACK control API
> +# +/* JACK server control API */
> +# +/* SPDX-FileCopyrightText:  2008-2023 Nedko Arnaudov */
> +# +/* SPDX-FileCopyrightText:  2008-2023 Grame */
> +# +/* SPDX-License-Identifier: ( GPL-2.0-or-later OR LGPL-2.1-or-later O=
R MIT OR AFL-2.1 ) */
> +# +/**
> +# + * @file   jack/control.h
> +# + * @ingroup publicheader
> +# + * @brief  JACK control API
> +# + *
> +# + */
> +#
> +# -  Copyright (C) 2008 Nedko Arnaudov
> +# -  Copyright (C) 2008 GRAME
> +# +#ifndef JACKCTL_H__2EEDAD78_DF4C_4B26_83B7_4FF1A446A47E__INCLUDED
> +# +#define JACKCTL_H__2EEDAD78_DF4C_4B26_83B7_4FF1A446A47E__INCLUDED
> +#
> +# -  This program is free software; you can redistribute it and/or modif=
y
> +# -  it under the terms of the GNU General Public License as published b=
y
> +# -  the Free Software Foundation; version 2 of the License.
> +# -
> +# -  This program is distributed in the hope that it will be useful,
> +# -  but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# -  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# -  GNU General Public License for more details.
> +# -
> +# -  You should have received a copy of the GNU General Public License
> +# -  along with this program; if not, write to the Free Software
> +# -  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> +# -
> +# -*/
> +# +#include <jack/types.h>
> +# +#include <jack/jslist.h>
> +# +#include <jack/systemdeps.h>
> +# +#if !defined(sun) && !defined(__sun__)
> +# +#include <stdbool.h>
> +# +#endif
> +#
> +#
> +
>  DESCRIPTION =3D "jackdmp is a C++ version of the JACK low-latency audio =
\
>  server for multi-processor machines. It is a new implementation of the \
>  JACK server core features that aims in removing some limitations of \
> @@ -7,15 +59,14 @@ been used to have a more dynamic and robust system."
>  SECTION =3D "libs/multimedia"
>=20
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D " \
> -    file://common/jack/control.h;beginline=3D2;endline=3D21;md5=3De6df0b=
f30cde8b3b825451459488195d \
> -    file://common/jack/jack.h;beginline=3D1;endline=3D19;md5=3D6b736ed6b=
810592b135480a5e853392e \
> -"
> +LIC_FILES_CHKSUM =3D "file://common/jack/control.h;beginline=3D2;endline=
=3D21;md5=3D9edb8b99b7a0dcd49dbf8741444f123d \
> +                    file://common/jack/jack.h;beginline=3D1;endline=3D19=
;md5=3D6b736ed6b810592b135480a5e853392e \
> +                    "
>=20
>  DEPENDS =3D "libsamplerate0 libsndfile1"
>=20
> -SRC_URI =3D "git://github.com/jackaudio/jack2.git;branch=3Dmaster;protoc=
ol=3Dhttps"
> -SRCREV =3D "4f58969432339a250ce87fe855fb962c67d00ddb"
> +SRC_URI =3D "git://github.com/jackaudio/jack2.git;branch=3Ddevelop;proto=
col=3Dhttps"
> +SRCREV =3D "520dfa0ac5a72d292f5b9fc5835926f925129764"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 2.39.2

AFAICT, this was integrated with additional modifications without sending=20
the resulting commit for review to the list. That makes it hard to comment.=
..

Anyway, in addition to the above, LICENSE was changed as:

-LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
+LICENSE =3D "GPL-2.0-or-later | LGPL-2.1-or-later | MIT | AFL-2.1"

and I am pretty sure that is not correct. Those licenses only apply to two=
=20
files (control.h and JackControlAPI.h) out of the entire source code. I.e.,=
=20
while you can distribute those two files under any of those licenses, the=20
rest of the code is (AFAICT) GPL and LGPL.

The licensing information for the whole work could definitely be better=20
though. According to my analysis, most code is either GPL-2.0-or-later or=20
LGPL-2.1-or-later, but there are a couple of GPL-2.0-only files too. And=20
then there are a couple of files with the following in the header:

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License.

which makes it a bit hard to determine whether they meant to write "either
version 2 of the License, or (at your option) any later version." or if the=
y=20
were trying to remove the "or later" part and missed to remove the "either"=
.

So, the correct LICENSE should be:

LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1-or-later & (GPL-2.0=
-or-later | LGPL-2.1-or-later | MIT | AFL-2.1)"

However, after having done all of the above analysis, here comes the catch:
there is no version "2" of jack! AUH has mistakenly identified the tag=20
"jack2-control-api-relicense-nedko" as version "2" and updated to the first=
=20
commit on the develop branch (which, incidentally, is also the one that=20
relicenses the two files mentioned above).

And here comes catch two: there is no version "1.19.22" either (which was t=
he=20
previous version of the recipe). The last version is actually 1.9.22. The=20
recipe version was accidentally updated from 1.9.13 to 1.19.14 instead of=20
1.9.14, and the mistake then lived on with the subsequent version updates.

I will send a patch to correct the above. However, whoever does the update=
=20
to the next release after 1.9.22 needs to be vary of the license changes.
Thus I have added both common/JackControlAPI.cpp and common/JackControlAPI.=
h=20
to LIC_FILES_CHKSUM, though even if they are identical in this release, wit=
h=20
the next release, the license for common/JackControlAPI.h will change.

I will also send a bunch of other patches to correct other stuff that was=20
incorrectly changed as a result of the AUH updates.

//Peter


