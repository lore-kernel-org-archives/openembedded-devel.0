Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787AFC05027
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 03:14:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.75064.1675739680394475343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 19:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=SB8uJhUX;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpclient.apple (unknown [50.34.64.238])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 95B30FF805;
	Tue,  7 Feb 2023 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1675739677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qb/KVqSH67y5SMrdCFzQK67ZH56Dpbk0sy+8j1GE5cM=;
	b=SB8uJhUXHM7VoGozRF3J/617XpCmoFABT5Q+u4FUuVytGOEiGtwwtq+z56JlIxJfOeMG6t
	ekeFMfI81GVXxEVGYssI9g02jHFDmfVYJ7FTIfjCbOA+FTm8u/a3iVk7sFOafoDB0REwUx
	kI1/exipdM3MYbc30Q8oDaL5et0ZdAmrKwm8KtQDGNZkCUf2ZzqCsu8MNS10+ER/uXJyP1
	TvKVu/rloDvnqWKbg8xw936cUNXloNDMI64J1zzru3gAkJyBnlFUpZ4AV/XuFMKrPEiq8Y
	BBoeILy26oKl2Hhi0MWy19VxmKJmUiMeAkUP3NzHS0+7n61azSsYQE+kudTHAQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [oe] [meta-java][PATCH] temurin-jdk-17-bin/temurin-jre-17-bin:
 Add recipes
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <Y+FdFJUIogBOfEAS@mail.itconsulting-heinold.de>
Date: Mon, 6 Feb 2023 19:14:23 -0800
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>,
 "dev@g0hl1n.net" <dev@g0hl1n.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C92576F-BD60-41A1-BF2B-D4B88BECE5DC@redrectangle.org>
References: <1740FE2141407D2F.20960@lists.openembedded.org>
 <487E72B2-8D6B-4B81-AE4A-F72DE1E4C4AB@getmailspring.com>
 <Y+FdFJUIogBOfEAS@mail.itconsulting-heinold.de>
To: Henning Heinold <henning@itconsulting-heinold.de>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 03:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100953


> On Feb 6, 2023, at 12:03 PM, Henning Heinold =
<henning@itconsulting-heinold.de> wrote:
>=20
> Am Sun, Feb 05, 2023 at 10:52:59AM -0800 schrieb Robert Joslyn:
>> Sorry, forgot to add Richard L to CC when sending the patch!
>>=20
>> Robert
>>=20
>=20
> Thanks for your work, but I am bit torn here, because
> one goal of oe was that all packages can be compiled
> by its own, so we can link against different sets of
> libc implementations and not repackaging some binary stuff.
> But in the end I would go with the decision of Richard Leitner.

I agree, I would certainly prefer to build from source. I even run =
Gentoo so I can build from source on my workstation. But I have only a =
small need for Java and don=E2=80=99t have the time to get a newer Java =
building from source in OE (nor an employer willing to pay for it). =
Since getting it building is non-trivial, and we=E2=80=99re moving away =
from Java anyway, the easy answer is to grab some trusted binaries and =
use them until we hopefully migrate fully away from Java.

Posting this to the list is mostly to share the work in the hope it=E2=80=99=
s useful to others in the same position. Ideally those more invested in =
Java would spend the time to write proper recipes.

>=20
>> On Feb 5 2023, at 9:34 am, Robert Joslyn
>> <robert.joslyn@redrectangle.org> wrote:
>>=20
>>> +++ b/recipes-core/temurin/temurin.inc
>>> @@ -0,0 +1,62 @@
>>> +HOMEPAGE =3D "https://adoptium.net"
>>> +LICENSE =3D "GPL-2.0-with-classpath-exception"
>=20
> There are a lot more licenses involved according to:
> https://projects.eclipse.org/projects/adoptium.temurin

Hmm, I was going based on the NOTICE file in the tatrball which says,=20

    This program and the accompanying materials are made available under =
the terms
    of the GNU General Public License, version 2, with the Classpath =
Exception.

    Additional information relating to the program and accompanying =
materials
    license and usage is available as follows.
      * For Eclipse Temurin version 8 see the LICENSE and =
ASSEMBLY_EXCEPTION files
        in the top level directory of the installation.
      * For Eclipse Temurin version 9 or later see the files under the =
legal/
        directory in the top level directory of the installation.

    SPDX-License-Identifier: GPL-2.0 WITH Classpath-exception-2.0

The legal directory in the tarball does have a LICENSE file for each =
library, but every one is a symlink to the same GPL-2.0 license file =
with a classpath exception. Maybe the other licenses are used for things =
that aren=E2=80=99t distributed as part of the binaries?

I could update the recipes to checksum the other LICENSE files to make =
sure they don=E2=80=99t change (there are 70 of them in the JDK and 50 =
in the JRE).

Thanks for the review!

Robert=

