Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1IyS0b-0005Em-8O
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Dec 2007 14:03:51 +0100
Received: (qmail invoked by alias); 01 Dec 2007 13:00:35 -0000
Received: from e178068085.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.68.85]
	by mail.gmx.net (mp003) with SMTP; 01 Dec 2007 14:00:35 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/62rIkrun6urMTkn5akDwKcjxpgwh8ZOvdw21Rlf
	i0Fm4ABKrDZIIb
Message-ID: <47515AED.1000900@gmx.net>
Date: Sat, 01 Dec 2007 14:00:29 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071129172123.GA29463@buddha.tw.openmoko.com>	<474F1835.6060002@student.utwente.nl>
	<A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F958C5A@USSYML02.ad.sjm.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: Firewall blocking access to monotone server?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Dec 2007 13:03:52 -0000
X-Groupsio-MsgNum: 3508
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig34BAE33DD75A8AAD01216013"

--------------enig34BAE33DD75A8AAD01216013
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
regarding your firewall issue. Once upon a time port 4691 was blocked on
my internet connection, too (I am connected through a community-operated
public wireless meshnetwork called Freifunk).

Thanksfully I have SSH access to a box ('peking') at my university.
First I created a SSH tunnel:

   ssh -L4691:org.openembedded.dev:4691 peking -N

and then led all traffic go to through it:

  mtn --db OE.mtn pull localhost org.openembedded.dev

Worked like a charm. :)

If outgoing ssh is blocked by the companies' firewall you should ask
them to open it though.

Regards
Robert


Tiller, Jason schrieb:
> Hello, OE folx!
>=20
> I approached the list a couple of weeks ago asking about running OE und=
er Cygwin.  The overwhelming consensus was that I shouldn't even embark o=
n that headache-laden path and instead scare up a Linux box for my OE wor=
k.  Well, I took your considered advice and now I'm trying to get OE runn=
ing.
>=20
> I'm running on a 400MHz P-III with 256MB of memory running RHEL 4.  The=
 OS is mandated by my IT guys.  I got everything down, finally got everyt=
hing built (well, so far), including git, svn, mtn, boost, (1.33.1), bb, =
and a whole host of other packages.  My poor little box has been compilin=
g its little brains out.  I think I have everything in place.
>=20
> I read the tutorial and got stuck at the actual retrieval of the mtn da=
tabase.  I downloaded the mtn 0.36 OE snapshot, but when I try to do the =
first "mtn pull" against monotone.openembedded.org, the connection hangs.=
  It also hangs against the other servers that have been mentioned.  I th=
ink this is due to our company's draconian firewall policy.
>=20
> If I were to go to my IT guys and ask them (nicely) to help me out, wha=
t do I need to tell them in terms of the port/protocol issues?  I'll need=
 to convince them that this is a safe proposition, but I'm sure exactly w=
hat I'm asking for.
>=20
> Thanks in advance.  I *really* want to give this a try since WindRiver =
quoted me $60k+ for a WRLinux distro/tools/support, just for the first ye=
ar.  Geez, I'm the *only* programmer at my site - there's no way my boss =
will fork over that kind of money.  So, I may end up having to roll my ow=
n.
>=20
> Wish me luck!
>=20
> ---Jason
>=20
>=20
> -----------------------------------------------------------------------=
-
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig34BAE33DD75A8AAD01216013
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHUVrxG9cfwmwwEtoRCAUTAJ90Tw3C2WvvJGlw+SOOMql39nUOzQCfScJ7
8y3xE8YVfwYsh3RAmI92RKY=
=ETOb
-----END PGP SIGNATURE-----

--------------enig34BAE33DD75A8AAD01216013--
