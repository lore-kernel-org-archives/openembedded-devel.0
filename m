Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1N1gfE-0002vX-8e
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 15:28:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 475A91417181
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 15:23:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZxRWRH7MfO1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 15:23:33 +0200 (CEST)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id E972C1416BAC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 15:23:32 +0200 (CEST)
Date: Sat, 24 Oct 2009 15:27:15 +0200
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hbuf0m$esa$1@ger.gmane.org> (from k.kooi@student.utwente.nl on
	Sat Oct 24 10:48:22 2009)
X-Mailer: Balsa 2.4.1
Message-Id: <1256390835.4307.0@zaurus>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 13:28:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 24, 2009 at 10:48:22 Koen Kooi wrote:
>=20
> I would be happy to take special care of the above recipe in my fixup=20
> branch. Do we all agree that the above .a files need to go into -dev=20
> packages? If so I'll add something like FILES_${PN}-static =3D "" to=20
> the
>=20
> affected recipes

All mentioned libraries above must go to -dev or -sdk, otherwise you
will not be able to build against them without -static installled.

FILES_${PN}-static =3D "" is not fully correct general solution. There
are projects, that have more static libraries. Only listed static
libraries must go to -dev, the rest may go to -static. A good
example is libsdl-x11. Only libSDLmain.a must go to -dev, the rest may
go to -static. I'll try to create smarter expression to find such
packages.

Note that this list covers only packages actually built for my image.

> And these wouldn't need special handling:

All of them probably would need. For example without libgcc.a you will
not be able to compile.

>  > gcc-4.3.3-r7.1: /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/
> libgcc.a

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



