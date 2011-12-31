Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1Rh6aR-00031E-7e
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Dec 2011 22:35:31 +0100
Received: by wibhq7 with SMTP id hq7so7824641wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Dec 2011 13:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Q+BfgmP3DeexW804bIRcSl38o2IGbSi4/wy43Wwh9BY=;
	b=RRff6oepQkBJLC4aTcH7B0wZuwfyjN7zm9uHHrZuHV3/IcwgMW3I8YOptrRnsKeFjp
	JfKTjpC6+GaxZcGK+8ysQBTMg4tHzbmkAM9KDo7UAycyeTsBLWcAka7OHxgLZEFFyA14
	+mKnNA8+K5+XTZNH37yI3a0C6V5RUYtIshRXQ=
MIME-Version: 1.0
Received: by 10.181.13.17 with SMTP id eu17mr96259135wid.12.1325366893355;
	Sat, 31 Dec 2011 13:28:13 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.231.84 with HTTP; Sat, 31 Dec 2011 13:28:13 -0800 (PST)
In-Reply-To: <jdnofj$urk$1@dough.gmane.org>
References: <1325352759-321-1-git-send-email-bigotp@acm.org>
	<jdnofj$urk$1@dough.gmane.org>
Date: Sat, 31 Dec 2011 15:28:13 -0600
X-Google-Sender-Auth: uB-hvbTtsRH7nCzZL1YeVKonEmc
Message-ID: <CAPOJ94PA7gim+C4efVYJCB3FBtFwDtdRkERfH+sqzx1cB=eMNg@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] python-mysqldb: import from OE classic, update to 1.2.3
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
X-List-Received-Date: Sat, 31 Dec 2011 21:35:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Dec 31, 2011 at 1:40 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 31-12-11 18:32, Peter A. Bigot schreef:
>> From: "Peter A. Bigot" <bigotp@acm.org>
>>
>
>> +++ b/meta-oe/recipes-devtools/python/python-mysqldb_1.2.3.bb @@ -0,0
>> +1,24 @@ +DESCRIPTION = "Python interface to MySQL" +HOMEPAGE =
>> "http://sourceforge.net/projects/mysql-python/" +SECTION =
>> "devel/python" +# "GPL or the original license based on Python 1.5.2's
>> license" +LICENSE = "GPL"
>
> That really needs a version specifier for the GPL version.

I agree in theory, but what I quoted is what the author provided in
the README.  It's characterized as an unqualified "GPL" on SourceForge
and the Python Package Index.  There is no COPYING file in the
distribution, hence my use of the README as the license file.  I note
there are several dozen other recipes in meta-openembedded and
openembedded-core that have the same unqualified GPL license.

Digging a little more, the only further source of guidance is _mysql.c
which has the following text in a header comment.  If  we assume the
other files are the same, I can update LICENSE to be GPLv2+.  The
alternative appears to be an HPND equivalent; I don't know how to
represent that, as I can't find any recipes that reference it.

How do you want this resolved?

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version. Alternatively, you may use the original license
reproduced below.

Copyright 1999 by Comstar.net, Inc., Atlanta, GA, US.

                        All Rights Reserved

Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the name of Comstar.net, Inc.
or COMSTAR not be used in advertising or publicity pertaining to
distribution of the software without specific, written prior permission.

COMSTAR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
EVENT SHALL COMSTAR BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.



> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk7/ZTYACgkQMkyGM64RGpFc8wCcCU8ufb4FiToMuk0WYns9eAea
> +QkAoJd+xMnAHtk/Sf5eG2eoCusm8D/G
> =maSn
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


