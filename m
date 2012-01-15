Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RmRvW-00070q-0q
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 16:23:22 +0100
Received: by werf1 with SMTP id f1so461409wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jan 2012 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=WUNQCZRHkqo5lzVEgkSPJ6BiJ12lgXrXQ1oc2AVrQ3w=;
	b=bWCEX7fOXR7Sv7ScE038FRdKQdBgTUqZi+xvQhnxeWwEsqgK00iBop8qsy+CgqI61S
	b/XjxZU+mAzktxGIyYWAo3zvsa30HUzsda1Gm19AKj1X3k5CV8ls/1on9qKFeOU10JvJ
	QHz5EIVcC0pKqbTRrs6SxM7YylPsy7aeEAv5k=
MIME-Version: 1.0
Received: by 10.216.132.199 with SMTP id o49mr2110368wei.50.1326640546160;
	Sun, 15 Jan 2012 07:15:46 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.90.204 with HTTP; Sun, 15 Jan 2012 07:15:46 -0800 (PST)
Date: Sun, 15 Jan 2012 09:15:46 -0600
X-Google-Sender-Auth: RbqkL2A_bf1-NotUaqUpHGD-L3I
Message-ID: <CAPOJ94OspH5H4G-=wQNqb=DdHratNwV3LHYnYo2BW43sbavk+g@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: oe-core license description practices
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jan 2012 15:23:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I need a resolution to this question so I can complete the port of an
oe-classic recipe to oe-core.

http://www.openembedded.org/wiki/OpenEmbedded-Core states that the
LICENSE field should be "as correct as possible (e.g. 'GPLv2', not
just 'GPL')".  If the upstream package self-describes as "GPL", is it
necessary that this be refined to a more specific version?  I again
note there are numerous existing recipes that do not provide more than
"GPL".

Depending on the answer, I will resubmit with a license of GPL | HPND
or will attempt to contact the upstream maintainer for clarification.

Thanks.

Peter

On Sat, Dec 31, 2011 at 3:28 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Sat, Dec 31, 2011 at 1:40 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 31-12-11 18:32, Peter A. Bigot schreef:
>>> From: "Peter A. Bigot" <bigotp@acm.org>
>>>
>>
>>> +++ b/meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb @@ -0,0
>>> +1,24 @@ +DESCRIPTION =3D "Python interface to MySQL" +HOMEPAGE =3D
>>> "http://sourceforge.net/projects/mysql-python/" +SECTION =3D
>>> "devel/python" +# "GPL or the original license based on Python 1.5.2's
>>> license" +LICENSE =3D "GPL"
>>
>> That really needs a version specifier for the GPL version.
>
> I agree in theory, but what I quoted is what the author provided in
> the README. =A0It's characterized as an unqualified "GPL" on SourceForge
> and the Python Package Index. =A0There is no COPYING file in the
> distribution, hence my use of the README as the license file. =A0I note
> there are several dozen other recipes in meta-openembedded and
> openembedded-core that have the same unqualified GPL license.
>
> Digging a little more, the only further source of guidance is _mysql.c
> which has the following text in a header comment. =A0If =A0we assume the
> other files are the same, I can update LICENSE to be GPLv2+. =A0The
> alternative appears to be an HPND equivalent; I don't know how to
> represent that, as I can't find any recipes that reference it.
>
> How do you want this resolved?
>
> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2, or (at your option)
> any later version. Alternatively, you may use the original license
> reproduced below.
>
> Copyright 1999 by Comstar.net, Inc., Atlanta, GA, US.
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0All Rights Reserved
>
> Permission to use, copy, modify, and distribute this software and its
> documentation for any purpose and without fee is hereby granted,
> provided that the above copyright notice appear in all copies and that
> both that copyright notice and this permission notice appear in
> supporting documentation, and that the name of Comstar.net, Inc.
> or COMSTAR not be used in advertising or publicity pertaining to
> distribution of the software without specific, written prior permission.
>
> COMSTAR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
> INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> EVENT SHALL COMSTAR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
> CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
> USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
> OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> PERFORMANCE OF THIS SOFTWARE.
>
>
>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>
>> iEYEARECAAYFAk7/ZTYACgkQMkyGM64RGpFc8wCcCU8ufb4FiToMuk0WYns9eAea
>> +QkAoJd+xMnAHtk/Sf5eG2eoCusm8D/G
>> =3DmaSn
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


