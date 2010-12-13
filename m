Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSFUX-0005g3-Sx for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 21:59:31 +0100
Received: from f053042178.adsl.alicedsl.de ([78.53.42.178]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PSFT2-0003zr-AX for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 20:57:56 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=e4vnw3=z39fmwXvFmkMOrB+Qaw7PCe+wOXmh0@mail.gmail.com>
References: <1292269885.4146.79.camel@mattotaupa>
	<AANLkTi=e4vnw3=z39fmwXvFmkMOrB+Qaw7PCe+wOXmh0@mail.gmail.com>
Date: Mon, 13 Dec 2010 21:57:55 +0100
Message-ID: <1292273875.4146.80.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils_2.21.bb: fails with Minimal: `ERROR: Task 1266 (/oe/openembedded/recipes/binutils/binutils-cross_2.21.bb, do_patch) failed with 256`
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
X-List-Received-Date: Mon, 13 Dec 2010 20:59:31 -0000
X-Groupsio-MsgNum: 27132
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-m62yucaTfearzob+QZZZ"

--=-m62yucaTfearzob+QZZZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 13.12.2010, 12:02 -0800 schrieb Khem Raj:
> On Mon, Dec 13, 2010 at 11:51 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
> > searched for `libtool-update.patch`
> >
> >        $ git grep libtool-update.patch
> >        recipes/binutils/binutils_2.20.1.bb:     ${@['file://libtool-upd=
ate.patch','file://libtool-2.4-update.patch'][bb.data.getVar('LIBTOOL_HAS_S=
YSROOT', d, 1) =3D=3D 'yes']} \
> >
> > So I am quite confused why the task `patch` wants to apply something
> > from a different recipe.
>=20
> It should not. It was an oversight libtool-update.patch is not needed for=
 2.21

I know and it is not present in `binutils_2.21.bb`. But it gets picked
up anyway.


Thanks,

Paul

--=-m62yucaTfearzob+QZZZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0GiNMACgkQPX1aK2wOHVh7bgCfTXQM17Ydzq7/jyHlpVOhMONN
3CwAoItQXeqgfBvi7PqLZarOu9YZXvab
=2swy
-----END PGP SIGNATURE-----

--=-m62yucaTfearzob+QZZZ--
