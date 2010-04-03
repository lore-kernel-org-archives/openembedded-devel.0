Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ny4d3-0007FH-TE for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 16:47:19 +0200
Received: from f053033237.adsl.alicedsl.de ([78.53.33.237]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ny4Zt-0006s7-FU for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 14:44:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100403135105.GA6475@merkur.sol.de>
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
	<l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
	<1270237489.3714.11.camel@mattotaupa>
	<1270293620.3692.33.camel@mattotaupa>
	<20100403135105.GA6475@merkur.sol.de>
Date: Sat, 03 Apr 2010 16:43:58 +0200
Message-ID: <1270305838.4237.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autopoint || touch config.rpath
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
X-List-Received-Date: Sat, 03 Apr 2010 14:47:19 -0000
X-Groupsio-MsgNum: 18416
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1oEuGVRORB+xXlTEGEaz"

--=-1oEuGVRORB+xXlTEGEaz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 03.04.2010, 15:51 +0200 schrieb Jens Seidel:
> On Sat, Apr 03, 2010 at 01:20:20PM +0200, Paul Menzel wrote:
> > Am Freitag, den 02.04.2010, 21:44 +0200 schrieb Paul Menzel:
> > > Am Freitag, den 02.04.2010, 11:28 -0700 schrieb Khem Raj:
> > > > On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel <paulepanter@users.sour=
ceforge.net> wrote:
> > > > > +do_configure_prepend() {
> > > > > +       autopoint || touch config.rpath
> > > > > +}
> > > >=20
> > > > empty config.rpath would build it wrongly isnt it. Probably this
> > > > should be removed
>=20
> Right.
> =20
> > > That is the work around Koen suggested [1]. Koen, can you comment
> > > please.
> >=20
> > Is
> >=20
> >         do_configure_prepend() {
> >                 autopoint || automake --add-missing
> >         }
> >=20
> > a viable solution [2]?
>=20
> No, it isn't. I really wonder about all these guesses. I agree that the
> autotools stuff is not very easy to understand but one should only provid=
e
> patches if one knows it.

You are right. Great to have an expert joining the discussion.

> Let me short summarize:
>=20
> automake is a tool to generate Makefile templates (called Makefile.in) fr=
om
> Makefile.am files. Normally a tgz ball ships already these generated file=
s
> (that's dictated by GNU). Nevertheless these files are often not committe=
d
> into version control systems and a script autogen.sh or better autoreconf=
 is
> used to generate Makefile.in by calling automake. But autoreconf calls ev=
en
> more: e.g. autoconf (which generated configure) and now also autopoint.
> autopoint generated the gettext infrastructure (the translation system to
> support foreign languages) by copying all non config dependent gettext fi=
les
> (such as Makefile.in.in, some scripts, ...) into po and m4 macros. That's
> also a good thing as this avoids committing generated files.

Thank you for this great summary. I am still clueless about
`config.rpath` though.

> But why do you want to call either autopoint or automake? The belong
> together and autoreconf should care about it. If this doesn' work it coul=
d
> be a bug in the package.
>=20
> If you send me the project source and the command which fails (without
> bitbake stuff as I never used it up to now) together with the
> autoconf/automake versions I can try to inspect it. Since the error seems=
 to
> happen in configure or even before there should be no difficult relations=
hip to
> bitbake and recipes, right?

Correct. Though as far as I understood it using `inherit autotools` OE
is using its own commands to set up the environment using
`autotools.bbclass` and there you will find the following line [2]
causing problems [3].

    EXTRA_AUTORECONF =3D "--exclude=3Dautopoint"

Nobody knows why this was added in the first place, but if you try to
configure Enna [4] for example it will fail as I reported [5]. Other
packages seem to be affected too.

The argument is called in this line [6].

    oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTOREC=
ONF} $acpaths
    autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acp=
aths || oefatal "autoreconf execution failed."

I cannot reproduce this using the provided files by Enna in my local
environment.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/autotoo=
ls.bbclass
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/autotoo=
ls.bbclass#n38
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/0188=
18.html
[4] http://enna.geexbox.org/
[5] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/0187=
96.html
[6] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/autotoo=
ls.bbclass#n136

--=-1oEuGVRORB+xXlTEGEaz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAku3VC4ACgkQPX1aK2wOHVhK9QCghh5yFJVUZC85B/QrF8BsZV6m
EcUAniXVPEilFM1bdQKscVHb/VfEwW/X
=3gG9
-----END PGP SIGNATURE-----

--=-1oEuGVRORB+xXlTEGEaz--
