Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NbFQ8-0006u7-OR for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 16:39:39 +0100
Received: from f053035156.adsl.alicedsl.de ([78.53.35.156]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NbFNq-0006C8-Dk for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 15:37:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hk1iso$j38$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk1iso$j38$1@ger.gmane.org>
Date: Sat, 30 Jan 2010 16:37:13 +0100
Message-ID: <1264865833.18482.56.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Sat, 30 Jan 2010 15:39:39 -0000
X-Groupsio-MsgNum: 16317
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RtmSF4U8L/HRZuPsgOAV"

--=-RtmSF4U8L/HRZuPsgOAV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 30.01.2010, 16:23 +0100 schrieb Koen Kooi:
> On 30-01-10 11:35, Frans Meulenbroeks wrote:
> > Today I bumped into console-image and noticed the following:
> >=20
> > IMAGE_INSTALL =3D "task-base \
> >             ${ANGSTROM_EXTRA_INSTALL} \
> >             ${SPLASH} \
> >             ${ZZAPSPLASH} \
> >=20
> > Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
> > DISTRO_EXTRA_INSTALL ?
> > This under the assumption that console-image is a distro independent
> recipe.
> >=20
> > Or, in case this is an angstrom specific recipe shouldn't it be
> better
> > named angstrom-console-image ?
> >=20
> > your views are appreciated :-)
>=20
> I vote for leaving it as it is, it gives some credit to where it
> originated from. The image name already has been forcefully renamed to
> strip out 'angstrom' so lets keep at least this bit of heritage.

I think the VCS (Git) is a good tool to find out where something like
this originated from.

> Besides, who's going to fix all users of ANGSTROM_EXTRA_INSTALL?=20

Good question. I think `sed` should be good enough for this. Otherwise
someone has to decide if it is better to confuse new users or to put
some work on old users to update the variable name.


Thanks,

Paul

--=-RtmSF4U8L/HRZuPsgOAV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktkUigACgkQPX1aK2wOHVhZnQCfVXjT7ECs/bHlhWX2wMADJfo0
S44AnApe5whzW0dDhZdxOyrHovCRINyI
=K9P1
-----END PGP SIGNATURE-----

--=-RtmSF4U8L/HRZuPsgOAV--
