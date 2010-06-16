Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OOqRh-0001ep-15
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 13:06:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 439694000824A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 12:56:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 3B863400057E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 12:56:29 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6skroXO2U6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 12:56:29 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 6D0414000824A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 12:56:26 +0200 (CEST)
Message-ID: <4C18AE1F.8060000@gmx.net>
Date: Wed, 16 Jun 2010 12:57:35 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C187CF6.5010401@gmx.net>
	<hva2qe$jco$1@dough.gmane.org>	<20100616091709.GA20969@excalibur.local>
	<hva6mc$vtv$4@dough.gmane.org>
In-Reply-To: <hva6mc$vtv$4@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Wed, 16 Jun 2010 11:06:14 -0000
X-Groupsio-MsgNum: 20189
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigA7371D243F541ECBC28F0A37"

--------------enigA7371D243F541ECBC28F0A37
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 16.06.2010 11:49, schrieb Koen Kooi:
> On 16-06-10 11:17, Stefan Schmidt wrote:
> > Hello.
>
> > On Wed, 2010-06-16 at 10:42, Koen Kooi wrote:
> >>
> >> My second question: When is all that openjdk stuff you keep talking
> >> about ending up in OE? I know Henning keeps handwaving about it not
> >> being ready, but after after waiting a year, is it ever going to be
> >> deemed ready by the jalimo crew? Just merge it into OE now :)
>
> > I can't speak for the jalimo crew but I can tell you that Tarent is
> currently
> > hired by BugLabs to bring in openjdk-6 and different other things to
> OE dev and
> > stable for our upcoming BugLabs stuff.
>
> > It seems to me that Robert is right now trying to bring in all the
> needed deps
> > for some parts. Talking LLVM, and therefor this patch, for JIT and
> others. If
> > nothing problematics happens we should have this stuff in dev (and
> hopefully
> > also stable) withing the next weeks.
>
> That's great news! I did beat nss from the jalimo repo into shape and
> pushed it into OE,
Cool, I also saw that nspr is in oe.dev nowadays. So I removed those
from the Jalimo repo.


> but I couldn't get any other java bits to work,
There is only jna and the openjdk recipes left. JNA builds but I have
not a single application/library
that makes use of it by now so I cannot tell whether it actually works.
(It uses libffi, so I do not expect issues).

The biggest flaw of the OpenJDK recipes atm is that there are too many
of them. I would like to get rid of everything below 6b18 (the very lates=
t)
to in turn get rid of many quirks for older versions of the icedtea
build system. However we are having troubles building 6b18 flawlessly
right now, so fixing this has precedence.

> sadly. Henning said I was missing the magic java incantations in
> angstrom and after adding those I could build things like jamvm :)
I am not sure what the problem is. Most Java stuff is in OE.dev for
quite some time.

>
> regards,
>
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Besuchen Sie uns vom 09.06. bis zum 12.06. auf dem LinuxTag 2010
an unserem Stand =E2=80=9EFairtrade Software=E2=80=9C (Halle 7.2a. / Stan=
d 123)!
=E2=87=92 Unsere Themen dieses Jahr =E2=87=92 =E2=80=A2 Evolvis =E2=80=A2=
 Freedroidz =E2=80=A2 Portale =E2=80=A2
=E2=80=A2 Identity and Access Management =E2=80=A2 Mobile Applikationen =E2=
=80=A2

tarent Gesellschaft f=C3=BCr Softwareentwicklung und IT-Beratung mbH
Gesch=C3=A4ftsf=C3=BChrer: Boris Esser, Elmar Geese
HRB AG Bonn 5168 - Ust-ID: DE122264941
http://www.tarent.com/

Heilsbachstr. 24, 53123 Bonn, fon +49 228 52675-0, fax +49 228 52675-25
Weigandufer 45, 12059 Berlin, fon +49 30 5682943-30, fax +49 228 52675-25=





--------------enigA7371D243F541ECBC28F0A37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkwYriEACgkQG9cfwmwwEtrZ5gCfc6BqyJKGS2pqbkMAaGeA4yj2
BO4An19oAscWLhVoFcwSSZf4+PA+1nry
=Lrr2
-----END PGP SIGNATURE-----

--------------enigA7371D243F541ECBC28F0A37--
