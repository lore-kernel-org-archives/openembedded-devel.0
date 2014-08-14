Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7121E65F2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:09:16 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id ty20so751752lab.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9QnAQetySyRdL/TGZhdIpJGJ3yUAirpkv9lcjG1RORQ=;
	b=ZAHH33msDN1nSlnYG79fQsAhA1k3C+nws69RF4DOiNPznnZu+w+BWjnSboFKUAMjub
	pNG5yrsaVzJzD/07de0qYrLRvR1BHGGtTkCYy1S4RT4d+iimL04KE33y9NbvuR3ooAOz
	+0yioTq072v+aclPHW6cwDTrDFzBUOKZJKieYBGassCitY+ZgPZ6uWJp6MGu+hREOz5w
	quWAvsYvwfDML28GW8/9fLKTwkSB2FrpWUAyDgM42KizuE7iT5+RecWgGvtD0E/6NJyP
	6dAooDeXqU6IM+AMw6iOlW3hXhhZCrEkYU0qiqtRuDWO11bhW7Erk27N2SX7otUmKryY
	LbrA==
X-Received: by 10.152.116.73 with SMTP id ju9mr3537513lab.24.1408007357461;
	Thu, 14 Aug 2014 02:09:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	zm10sm7046037lbb.17.2014.08.14.02.09.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 02:09:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 11:09:53 +0200
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140814090953.GH14848@jama>
References: <1408002845-30625-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140814083615.GC14848@jama>
	<2564441.T2MRKS19rc@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <2564441.T2MRKS19rc@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] rabbitmq-c: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 09:09:18 -0000
X-Groupsio-MsgNum: 51682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qc5DkMWUFEsp7/mK"
Content-Disposition: inline

--qc5DkMWUFEsp7/mK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 10:57:05AM +0200, Maciej Borzecki wrote:
> On Thursday 14 of August 2014 10:36:16 Martin Jansa wrote:
> > On Thu, Aug 14, 2014 at 09:54:05AM +0200, Maciej Borzecki wrote:
> > > rabbitmq-c is a C library providing an implementation of AMQP client =
for
> > > use with v2.0+ of the RabbitMQ broker
> > >=20
> > > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > > ---
> > >=20
> > >  .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb | 17
> > >  +++++++++++++++++ 1 file changed, 17 insertions(+)
> > >  create mode 100644
> > >  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb>=20
> > > diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0=
=2Ebb
> > > b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb new file
> > > mode 100644
> > > index 0000000..5a02c99
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> > > @@ -0,0 +1,17 @@
> > > +DESCRIPTION =3D "A C-language AMQP client library for use with v2.0+=
 of the
> > > RabbitMQ broker"
> > I did few more modifications when cherry-picking to master-next.
> Right, I missed that. Will post an updated patch.
>=20
> BTW. any idea why xmlto might not be picking up the stylesheets correctly=
? I=20
> found your patch: https://git.congatec.com/yocto/meta-openembedded/commit=
/c688085b4c96c169ca853bf91b6fee54f4cd983d
> and you seem to be taking similar measures to disable documentation.

It should be fixed now by:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2416

but I haven't checked why it didn't work for rabbitmq

It would be great to debug it and report back in that bug if it doesn't
work correctly.

> > > +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-c"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://${S}/LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd5c980b583f53"
> > Dropped ${S} as LIC_FILES_CHKSUM are by default relative to ${S}
> >=20
> > > +LICENSE =3D "MIT"
> > > +
> > >=20
> > >=20
> > > +SRC_URI =3D
> > > "https://github.com/alanxz/rabbitmq-c/releases/download/v${PV}/rabbit=
mq-c
> > > -${PV}.tar.gz"
> > rabbitmq-c -> ${BPN}
> > rabbitmq-c-${PV} -> ${BP}
> >=20
> > > +SRC_URI[md5sum] =3D "b1f902c658c772cda464754678d8deb6"
> > > +SRC_URI[sha256sum] =3D
> > > "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa" +
> > > +DEPENDS =3D "popt openssl"
> > > +
> > > +EXTRA_OECONF =3D "--disable-examples --enable-tools --disable-docs"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +PACKAGE_BEFORE_PN +=3D "${PN}-tools"
> > > +FILES_${PN}-tools =3D "${bindir}"
>=20
> --=20
>=20
> Maciej Borz=C4=99cki=20
> Senior Software Engineer Open-RnD Sp. z o.o.=20
> www.open-rnd.pl, Facebook, Twitter=20
> mobile: +48 telefon, fax: +48 42 657 9079=20
>=20
> Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe zaw=
iera=C4=87 chronione prawem lub=20
> poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wiad=
omo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
> kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 zo=
sta=C5=82a otrzymana przypadkowo=20
> zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzecic=
h. W takim przypadku=20
> uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poinfo=
rmowanie=20
> nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwrotn=
ej. Dzi=C4=99kujemy.=20
>=20
> This message, including any attachments hereto, may contain privileged or=
=20
> confidential information and is sent solely for the attention and use of =
the=20
> intended addressee(s). If you are not an intended addressee, you may neit=
her=20
> use this message nor copy or deliver it to anyone. In such case, you shou=
ld=20
> immediately destroy this message and kindly notify the sender by reply em=
ail.=20
> Thank you.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qc5DkMWUFEsp7/mK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPsfOEACgkQN1Ujt2V2gByMNgCfWjGhs6etpQoAOd2A9sVtvvYH
vyUAoJfGKhNpDks392hAJWUFT5yWQlX6
=+flH
-----END PGP SIGNATURE-----

--qc5DkMWUFEsp7/mK--
