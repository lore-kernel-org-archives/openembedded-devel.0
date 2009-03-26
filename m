Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LmsyC-0003js-PJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 18:02:20 +0100
Received: (qmail invoked by alias); 26 Mar 2009 17:00:35 -0000
Received: from g225079152.adsl.alicedsl.de (EHLO [192.168.4.110])
	[92.225.79.152]
	by mail.gmx.net (mp067) with SMTP; 26 Mar 2009 18:00:35 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18liMkjbl4lKAGp6RFqQ6Hyk+1KeSDXfwlN1pkFxu
	RVmbhCKlSG1NA7
Message-ID: <49CBB58A.20001@gmx.net>
Date: Thu, 26 Mar 2009 18:04:10 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49CB892B.2020705@epfl.ch>
In-Reply-To: <49CB892B.2020705@epfl.ch>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: A few questions for better platform support
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
X-List-Received-Date: Thu, 26 Mar 2009 17:02:20 -0000
X-Groupsio-MsgNum: 8744
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigE1F941F59140A431EC5138BE"

--------------enigE1F941F59140A431EC5138BE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Valentin,
I am assigning the mentioned PR.

What is a problem with OE and its bugtracker is that everyone working on
the project usually does the things that affect him or her personally
and so PRs pile up in the bugtracker. :|

If we work through these four entries I will recommend you for write
access to the OE repository. Since it is likely that you will want to
change things like your base image and toolchain recipe in the future
that would make sense to me.

Regards
Robert

Valentin Longchamp schrieb:
> Hello,
>=20
> There is a quite small support for our board mx31moboard
> (http://mobots.epfl.ch/mx31moboard.html) already in OE. I have lately
> been working on a better Linux kernel support for it, and things are no=
w
> getting in pretty good shape.
>=20
> I now would like to spend some time on tuning our distribution for our
> robots based on OE and Angstrom and I have a few questions about them.
> Maybe most of them have been answered in the list already, but I have
> had some issues following the list lately (mostly due to my military
> last 5 weeks).
>=20
> - I had filled up bugs on the bugzilla for new features
> (http://bugs.openembedded.net/show_bug.cgi?id=3D4960,
> http://bugs.openembedded.net/show_bug.cgi?id=3D4961,
> http://bugs.openembedded.net/show_bug.cgi?id=3D4971,
> http://bugs.openembedded.net/show_bug.cgi?id=3D4972). I have read that =
the
> preferred way to submit patches is the mailing-list. Should I repost th=
e
> (maybe updated) recipes to the mailing-list and close the corresponding=

> bugs ? I think that the answers to the questions below may trigger new
> discussions so I will repost the updated recipes for further discussion=
s
> later.
>=20
> - Rootfs location: We have a pretty small flash on our system (32 MB).
> But whe have and SD card reader. I would have these two possibilities:
> 1) Have a minimal image that fits in the flash with the kernel, but the=

> rest would go to the SD card (and all packages installed afterwards
> too). This would allow the system to boot without a SD card.
> 2) Have the whole filesystem on a SD card (then, an SD card would be
> needed for the system to boot).
> Is it possible to have two different image types that would allow me to=

> build systems for these two possibilities.
>=20
> - Package installation location: As stated above, since we have a small=

> flash filesystem, I would like all the additional packages that would b=
e
> installed get installed to a location that physically correspond to a S=
D
> card. How can we configure opkg so that the packages are installed into=

> a certain location ?
>=20
> - Add additional feeds location: By default, with angstrom, the feed
> source on the angstrom-distribution.org web server in configured. Most
> of our robots wont have internet access, they will however have access
> to a server where all the packages are going to be built and I would
> like to add this server as the main repository. How can the system
> configured in that way ?
>=20
> - Best way to build and distribute SDK: I had proposed in the above
> patches recipes to build an approrpiate SDK for our system. I would lik=
e
> to distribute this SDK to all the people who are going to develop on ou=
r
> robots. I would like to keep it as simple as possible for them, so if
> they don't have to use OE themselves is much better. I have seen that
> things have been changing a bit lately about the SDK (canadian SDK, wha=
t
> is it exactly ?). What is the best way (best current example) so that I=

> can build an easily distributable sdk ? Is it possible that we produce
> .deb files ?
>=20
> Thank you for your input
>=20
> Val
>=20



--------------enigE1F941F59140A431EC5138BE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknLtY0ACgkQG9cfwmwwEtpp8QCffEG2RhKqUaDdAXDs1TaXFplE
UJMAnRN1VB7AdpRf4bRpxhGDwQViTYV4
=AZ9I
-----END PGP SIGNATURE-----

--------------enigE1F941F59140A431EC5138BE--
