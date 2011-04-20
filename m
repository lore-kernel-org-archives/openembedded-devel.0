Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCVAA-0002lP-FK for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 13:01:38 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QCV8P-00079g-LN; Wed, 20 Apr 2011 10:59:49 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DAD6D9B.2000909@opendreambox.org>
References: <1302996215.3122.31.camel@utx.lan>
	<4DAD6D9B.2000909@opendreambox.org>
Date: Wed, 20 Apr 2011 12:59:16 +0200
Message-ID: <1303297156.3979.46.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH 1/5] binconfig.bbclass: search configs in D instead of S
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
X-List-Received-Date: Wed, 20 Apr 2011 11:01:38 -0000
X-Groupsio-MsgNum: 31363
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RJ65ejTSr79cE5cy8a/+"

--=-RJ65ejTSr79cE5cy8a/+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 19.04.2011, 13:10 +0200 schrieb Andreas Oberritter:
> On 04/17/2011 01:23 AM, Stanislav Brabec wrote:
> > Searching for binconfig in S makes more problems than it
> > brings benefits. Searching in the installed root seems to be more logic=
al.
> >=20
> > Fixes following subtle breakages:
> > - binconfig are populated with a different name that upstream intended
> > - populated binconfig files that were not intended to be populated
> >=20
> > It fixes at least ncurses, which populates ncurses-config instead of
> > ncurses5-config and ncursesw5-config, causing secondary breakages.

Is `alsa-utils` =E2=80=93 as written in your introduction 0/5 =E2=80=93 the=
 only
secondary breakage you found? Is that a run time problem? I can build
`alsa-utils-1.0.24.2-r1` just fine using `minimal`.

> > Signed-off-by: Stanislav Brabec <utx@penguin.cz>
>=20
> Acked-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

I am adding Enrico to the CC since he did a lot of Ncurses work and
maybe can also share his opinion.

> > diff --git a/classes/binconfig.bbclass b/classes/binconfig.bbclass
> > index b3b2236..3d2bf0f 100644
> > --- a/classes/binconfig.bbclass
> > +++ b/classes/binconfig.bbclass
> > @@ -49,7 +49,7 @@ binconfig_package_preprocess () {
> >  SYSROOT_PREPROCESS_FUNCS +=3D "binconfig_sysroot_preprocess"
> > =20
> >  binconfig_sysroot_preprocess () {
> > -	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
> > +	for config in `find ${D} -name '${BINCONFIG_GLOB}'`; do
> >  		configname=3D`basename $config`
> >  		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> >  		cat $config | sed ${@get_binconfig_mangle(d)} > ${SYSROOT_DESTDIR}${=
STAGING_BINDIR_CROSS}/$configname
> >


Thanks,

Paul

--=-RJ65ejTSr79cE5cy8a/+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2uvIQACgkQPX1aK2wOHVgDogCfULV9K5c0MURlPu/On+9LzuUm
bFEAnikI2PJQtfavuOJzGt/D2XC/l1Rp
=S7sw
-----END PGP SIGNATURE-----

--=-RJ65ejTSr79cE5cy8a/+--
