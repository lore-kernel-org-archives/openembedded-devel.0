Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tswla-0002OI-PY
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:36:33 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so1067196pad.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hUm80LfklB8jqVH02nOFzLH4+Wa3AJKLKtLA5b9CvOQ=;
	b=nPtp5W/DX4mYvCHBZiZ8NuHKkemsj4FQUBrFxspp7dwbiRCBTxMEuOAZN+Hn0xMtj0
	c8UQFoMWa2HxG13iUrK5p8q+t4opN6sckPJYtYu6TS0Zjh0neovW583UqETz1y7I7eCo
	rL+taJWXesQk51Ni9An827XXuqaTcFe8ouoGcwFq4sstKo7k+LQKK4jFvcS7bP5bQqqd
	621QM0FeqBmvGGWKO8wlLbD0n2j3/c+9NYpFvSK/9wby11Zv67sLWavExhcKklcQ8kzV
	jHZvXZlRDRxt5C9TUz1uVNUr3wZLka+3RcQbZprCsCoxeNUr7xNOjmthRoxZFfkNPOKO
	jzvA==
X-Received: by 10.68.238.8 with SMTP id vg8mr211419792pbc.26.1357741278120;
	Wed, 09 Jan 2013 06:21:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gv9sm41714090pbc.21.2013.01.09.06.21.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 06:21:16 -0800 (PST)
Date: Wed, 9 Jan 2013 15:21:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130109142121.GN3722@jama.palm1.palmone.com>
References: <1355519149-23005-1-git-send-email-gary@mlbassoc.com>
	<20121216180022.GC3448@jama>
MIME-Version: 1.0
In-Reply-To: <20121216180022.GC3448@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] rng-tools: Fixes for latest OE layouts
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
X-List-Received-Date: Wed, 09 Jan 2013 14:36:34 -0000
X-Groupsio-MsgNum: 42597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MSd2ShuMixI0uVaZ"
Content-Disposition: inline

--MSd2ShuMixI0uVaZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2012 at 07:00:22PM +0100, Martin Jansa wrote:
> On Fri, Dec 14, 2012 at 02:05:48PM -0700, Gary Thomas wrote:
> > The current recipe has a few installation errors:
> >   * The manipulation of configurable paths drops a '/'
> >   * The init script defaults are placed in the wrong file
> >   * Finer control over init script start/stop
> >   * The default device is non-standard
> >=20
> > This patch fixes these little nits and makes the package usable again.
> >=20
> > Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> > ---
> >  meta-oe/recipes-support/rng-tools/files/default  |    3 ++-
> >  meta-oe/recipes-support/rng-tools/rng-tools_2.bb |    5 +++--
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-support/rng-tools/files/default b/meta-oe/=
recipes-support/rng-tools/files/default
> > index ab7cd93..7aede9b 100644
> > --- a/meta-oe/recipes-support/rng-tools/files/default
> > +++ b/meta-oe/recipes-support/rng-tools/files/default
> > @@ -1,2 +1,3 @@
> >  # Specify rng device
> > -RNG_DEVICE=3D/dev/hwrng
> > +#RNG_DEVICE=3D/dev/hwrng
> > +RNG_DEVICE=3D/dev/urandom
> > diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe=
/recipes-support/rng-tools/rng-tools_2.bb
> > index ef753cf..b94854a 100644
> > --- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> > +++ b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> > @@ -15,12 +15,13 @@ inherit autotools update-rc.d
> >  do_install_append() {
> >          install -d "${D}${sysconfdir}/init.d"
> >          install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-t=
ools
> > -        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir=
},' \
> > +        sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir=
}/,' \
> >              ${D}${sysconfdir}/init.d/rng-tools
> > =20
> >          install -d "${D}${sysconfdir}/default"
> > -        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default
> > +        install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/rng-tools
> >  }
> > =20
> >  INITSCRIPT_NAME =3D "rng-tools"
> >  INITSCRIPT_PARAMS =3D "defaults"
> > +INITSCRIPT_PARAMS =3D "start 30 S . stop 30 0 6 1 ."
>=20
> Why do you add 2nd INITSCRIPT_PARAMS ?

ping :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MSd2ShuMixI0uVaZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtfOEACgkQN1Ujt2V2gBzU+QCggmNPTroPyjxubECYu9BPqg3b
LaMAoIDsi7QeK3QN6ckS1TeAG3ZfCz50
=IFLu
-----END PGP SIGNATURE-----

--MSd2ShuMixI0uVaZ--
