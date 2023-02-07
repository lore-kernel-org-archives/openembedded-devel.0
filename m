Return-Path: <henning@itconsulting-heinold.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF419C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:16:52 +0000 (UTC)
Received: from mail.familie-heinold.de (mail.familie-heinold.de [85.214.48.103])
 by mx.groups.io with SMTP id smtpd.web11.89413.1675790204903137990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 09:16:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@itconsulting-heinold.de header.s=20220607 header.b=hA4J7fMD;
 spf=none, err=permanent DNS error (domain: itconsulting-heinold.de, ip: 85.214.48.103, mailfrom: henning@itconsulting-heinold.de)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 25D7E689C2;
	Tue,  7 Feb 2023 18:16:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=itconsulting-heinold.de; s=20220607; t=1675790203;
	bh=rf4gAG78/e+tTbWuknKx6raUQhpALoUPxo2A/mvsOqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hA4J7fMDxJVWbcN83n94LD+DdcZvDyylcNgGy3R1Bm5CQpn7+UQv0EzRL36Whsqn0
	 1XZOjWziOTwQMsUedlb7fAuPgXHjsdBtKnkLOLInxq/e/K13S0vxPYoRT7hHCpA4uK
	 yhgYv5QMiFUyYQ4lBUxvogEte0hYoHGaJ1VV7v9fLHuJhlQkQZmtQ2qMTTjWkvGIzq
	 iljDtveuNY5suEbtRnndNApEPt7FtKadeojlTMAy9k7gGEQR5vcuAF3fauHLStoIHF
	 8FIzus7eIBpxp6vQDiqrKUJINpfDZjx9nYlENEYKGrJMzt5oLf/R0h98QlQqkC/UIn
	 7BrGnadIrxOzw==
Received: from mail.itconsulting-heinold.de (dynamic-089-014-138-223.89.14.pool.telefonica.de [89.14.138.223])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Tue,  7 Feb 2023 18:16:42 +0100 (CET)
Date: Tue, 7 Feb 2023 18:16:41 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Cc: "dev@g0hl1n.net" <dev@g0hl1n.net>
Subject: Re: [oe] [meta-java][PATCH] temurin-jdk-17-bin/temurin-jre-17-bin:
 Add recipes
Message-ID: <Y+KHefl4Wfiak3O/@mail.itconsulting-heinold.de>
References: <1740FE2141407D2F.20960@lists.openembedded.org>
 <487E72B2-8D6B-4B81-AE4A-F72DE1E4C4AB@getmailspring.com>
 <Y+FdFJUIogBOfEAS@mail.itconsulting-heinold.de>
 <5C92576F-BD60-41A1-BF2B-D4B88BECE5DC@redrectangle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5C92576F-BD60-41A1-BF2B-D4B88BECE5DC@redrectangle.org>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 17:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100962

Am Mon, Feb 06, 2023 at 07:14:23PM -0800 schrieb Robert Joslyn:
>=20
> > On Feb 6, 2023, at 12:03 PM, Henning Heinold <henning@itconsulting-he=
inold.de> wrote:
> >=20
> > Am Sun, Feb 05, 2023 at 10:52:59AM -0800 schrieb Robert Joslyn:
> >> Sorry, forgot to add Richard L to CC when sending the patch!
> >>=20
> >> Robert
> >>=20
> >=20
> > There are a lot more licenses involved according to:
> > https://projects.eclipse.org/projects/adoptium.temurin
>=20
> Hmm, I was going based on the NOTICE file in the tatrball which says,=20
>=20
>     This program and the accompanying materials are made available unde=
r the terms
>     of the GNU General Public License, version 2, with the Classpath Ex=
ception.
>=20
>     Additional information relating to the program and accompanying mat=
erials
>     license and usage is available as follows.
>       * For Eclipse Temurin version 8 see the LICENSE and ASSEMBLY_EXCE=
PTION files
>         in the top level directory of the installation.
>       * For Eclipse Temurin version 9 or later see the files under the =
legal/
>         directory in the top level directory of the installation.
>=20
>     SPDX-License-Identifier: GPL-2.0 WITH Classpath-exception-2.0
>=20
> The legal directory in the tarball does have a LICENSE file for each li=
brary, but every one is a symlink to the same GPL-2.0 license file with a=
 classpath exception. Maybe the other licenses are used for things that a=
ren=E2=80=99t distributed as part of the binaries?
>=20
> I could update the recipes to checksum the other LICENSE files to make =
sure they don=E2=80=99t change (there are 70 of them in the JDK and 50 in=
 the JRE).
>=20

Hm okay I looked, at the openjdk page again and there still is only GPL-2=
.0 WITH Classpath-exception-2.0 as license.
So I think for now this that would overkill to add all links.

> Thanks for the review!
>=20

Your are welcome.
> Robert

Bye Henning

