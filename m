Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NJVsA-000190-TX
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 18:35:17 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D00B7110011E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 18:33:31 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6EE8311000E2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 18:33:18 +0100 (CET)
Received: from rhein.familie-heinold.de (g225007165.adsl.alicedsl.de
	[92.225.7.165]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2009 18:33:18 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7FA603C10F; Sat, 12 Dec 2009 18:33:13 +0100 (CET)
Date: Sat, 12 Dec 2009 18:33:13 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091212173311.GA3730@rhein.zuhause.netz>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Sat, 12 Dec 2009 17:35:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2009 at 12:48:40PM +0100, Paul Menzel wrote:
> Dear OE hackers,
>=20
>=20
> I am trying to write a recipe for The Video Disc Recorder (VDR) [1] and
> get it into OE.
>=20
> Unfortunately I have never done this and I also do not know much about
> things related to compiling.
>=20
> I tried to follow [2] and [3] and came up with the following which is
> not much as you can see and in addition does not work yet.
>=20
> The problem I am facing is, that in the Makefile of VDR [4] there is
>=20
>         [=E2=80=A6]
>         LIBS     =3D -ljpeg -lpthread -ldl -lcap -lrt -lfreetype
>         -lfontconfig
>         INCLUDES =3D -I/usr/include/freetype
>         [=E2=80=A6]
>=20
> so that the path `/usr/include/freetype/` is passed to the make command
> which of course fails trying to cross compile the program.
>=20
>         CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/includ=
e/freetype2
>         cc1plus: internal compiler error: in add_path, at c-incpath.c:4=
25
>=20
> Now, if I understand it correctly by looking at other recipes there is
> EXTRA_OEMAKE =3D "" where I should be able to set the INCLUDEPATH to th=
e
> OE build environment. Is that correct.
>=20
> Could you please also tell me what the recipe variable name is for libs=
?
>=20
>=20
> Thank you,
>=20
> Paul

What buildsystem is vdr using autotools or handmade Makefiles?

for autotools just do
inherit autotools

for handmade Makefiles

make a Patch which patches the Makefile and sets the include path to our =
staginginclude-Path

Bye Henning


