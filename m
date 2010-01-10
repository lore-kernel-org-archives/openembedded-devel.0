Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NU4jd-0006XZ-5g for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 21:50:08 +0100
Received: from f053034057.adsl.alicedsl.de ([78.53.34.57]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NU4hb-0007sU-6l for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 20:47:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100110123923.GB6363@rhein.zuhause.netz>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
Date: Sun, 10 Jan 2010 21:47:57 +0100
Message-ID: <1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: vdr: questions regarding cplusplus.patch
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
X-List-Received-Date: Sun, 10 Jan 2010 20:50:08 -0000
X-Groupsio-MsgNum: 15528
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DZGDfiJyWh5/oZWNJgep"

--=-DZGDfiJyWh5/oZWNJgep
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.01.2010, 13:39 +0100 schrieb Henning Heinold:
> On Sun, Jan 10, 2010 at 08:53:18AM +0100, Paul Menzel wrote:
> > packaging VDR for OE you added cplusplus.patch [1] to be applied. I am
> > trying to get the patches upstream, but I have some questions.
> >=20
> > Is it correct, that the two changes have the following goals?
> >=20
> > 1. Instead of using the C headers which are deprecated use the headers
> > provided by C++ as mentioned for example in [2].
> > 2. You changed `canonicalize_file_name(FileName);` to
> > `realpath(FileName,NULL);`. Is that because OE just support Linux and
> > not GNU/Hurd for example [3]?
> > 3. I do not understand why a lot of headers are included in tools.h and
> > tools.c. But I have to look that up in some reference.
>
> with gcc 4.x and 4.4 c++ is stricter at including headers the right way.
> So you need to include a couple of headers, because some functions
> are not found. You can test it in oe with using binutils 2.20 and
> gcc-4.4.2 and leave the patches out.
>=20
> The problem with canonicalize_file_name was, that the function too
> wasn't found with gcc-4.4.2. So I googled and found that
> canonicalize_file_name(FileName) is the same as realpath(FileName,NULL),
> but realpath was found.
>=20
> I hope this clears some stuff.

Dear Henning,


thank your for your explanation.

I tried to reproduce that on my Debian Sid/unstable system with

        $ g++ --version
        g++ (Debian 4.4.2-8) 4.4.2
        $ ld --version # binutils 2.20-4
        GNU ld (GNU Binutils for Debian) 2.20
        $ git clone git://git.gekrumbel.de/vdr.git
        $ cd vdr
        $ make

and did not get any warnings.

I will try to reproduce this in OE but have to read up on how to change
the versions in my `local.conf`.


Thanks,

Paul

--=-DZGDfiJyWh5/oZWNJgep
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktKPP0ACgkQPX1aK2wOHVg4CgCeLV037MdG7LhIXShSV/0dE4Qu
LhMAmwarDc7E+4yYsN39RWoSvIOt4p6O
=9dA2
-----END PGP SIGNATURE-----

--=-DZGDfiJyWh5/oZWNJgep--
