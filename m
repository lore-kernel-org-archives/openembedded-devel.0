Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OPagL-0002YT-0Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 14:28:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id BD98240008249
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 14:23:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id B58E6400083C2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 14:23:53 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9tpvRVsfOt8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 14:23:53 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 6F75640008249
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 14:23:53 +0200 (CEST)
Message-ID: <4C1B65B0.2060307@gmx.net>
Date: Fri, 18 Jun 2010 14:25:20 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C19DA49.3020206@gmx.net> <hvcqr8$mfs$1@dough.gmane.org>
In-Reply-To: <hvcqr8$mfs$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem with SHLIBs and RDEPENDS
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
X-List-Received-Date: Fri, 18 Jun 2010 12:28:27 -0000
X-Groupsio-MsgNum: 20265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigA54E2DCC435A56E733DF0321"

--------------enigA54E2DCC435A56E733DF0321
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey cool, thats it.

Am 17.06.2010 11:45, schrieb Koen Kooi:
> On 17-06-10 10:18, Robert Schuster wrote:
> > Hi,
> > I am trying to make the OpenJDK recipes 'OE ready'. One hard issue I =
am
> > facing has to do with the shlibs mechanism in OE.
>
> > In order to get OpenJDKs dependencies right its libraries and binarie=
s
> > are checked for library dependencies. That is all fine and I would lo=
ve
> > to activate that.
>
> > Actually we have three kinds of OpenJDK builds atm:
> > - zero (interpreter only; but with enhancements on ARM to make it fly=
)
> > - shark (zero interpreter plus JIT based on LLVM)
> > - cacao (completely different runtime)
>
> > The binary version of those recipes all bring a libjvm.so. Theoretica=
lly
> > a user could install all three packages (you can do that in
> > Debian/Ubuntu for example). However when the shlibs mechanism is
> > activated it puts the first built openjdk variant into a registry and=

> > all subsequent variants get a hard runtime dependency on that package=

> > (e.g. openjdk-shark will depend on openjdk-zero if I built zero first=
)
> > although there is no technical reason for this.
>
> > So my question is: How can I solve this issue without resorting to:
>
> > EXCLUDE_FROM_SHLIBS =3D "1"
>
> > which I currently use and which has the bad side-effect of not having=

> > openjdk's own dependencies. :(
>
> Try:
>
> PRIVATE_LIBS =3D "libjvm.so"
>
> That will mark any libjvm.so in PACKAGES for that recipe as private and=

> it won't show up as a shlib provider. We use this in mozilla recipes.
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





--------------enigA54E2DCC435A56E733DF0321
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkwbZbAACgkQG9cfwmwwEtoJFACfaD6bntJPRV0rkKKs3mkpKSKi
sWQAoJUxcCZ/GAFbee7ETTpJAPx72Fu3
=ir42
-----END PGP SIGNATURE-----

--------------enigA54E2DCC435A56E733DF0321--
