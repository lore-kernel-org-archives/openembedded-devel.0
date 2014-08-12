Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id BD370609AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:05:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 5D8F42B022A4;
	Tue, 12 Aug 2014 14:05:06 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Aug 2014 14:05:05 +0200
Message-ID: <1698797.3VM4VhPSOi@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140812114538.GJ14848@jama>
References: <1407767636-32624-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140812114538.GJ14848@jama>
MIME-Version: 1.0
Cc: maciek.borzecki@gmail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] rabbitmq-c: add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 12:05:08 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday 12 of August 2014 13:45:38 Martin Jansa wrote:
> On Mon, Aug 11, 2014 at 04:33:56PM +0200, Maciej Borzecki wrote:
> > rabbitmq-c is a C library providing an implementation of AMQP clien=
t for
> > use with v2.0+ of the RabbitMQ broker
> >=20
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > ---
> >=20
> >  .../rabbitmq-c/rabbitmq-c_0.5.0.bb                 | 22
> >  ++++++++++++++++++++++ 1 file changed, 22 insertions(+)
> >  create mode 100644
> >  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb>=20
> > diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5=
.0.bb
> > b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb new f=
ile
> > mode 100644
> > index 0000000..d8e3189
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "A C-language AMQP client library for use with v2.=
0+ of the
> > RabbitMQ broker" +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-=
c"
> > +LIC_FILES_CHKSUM =3D
> > "file://${S}/LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd5c980b583f53" +L=
ICENSE =3D
> > "MIT"
> > +
> > +SRC_URI =3D
> > "https://github.com/alanxz/rabbitmq-c/releases/download/v${PV}/rabb=
itmq-c
> > -${PV}.tar.gz" +SRC_URI[md5sum] =3D "b1f902c658c772cda464754678d8de=
b6"
> > +SRC_URI[sha256sum] =3D
> > "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa" =
+
> > +PR =3D "r0"
>=20
> ^ dropped when cherry-picking to master-next
>=20
> > +
> > +S =3D "${WORKDIR}/rabbitmq-c-${PV}"
>=20
> ^ dropped when cherry-picking to master-next
>=20
> > +
> > +EXTRA_OECONF =3D "--disable-examples --enable-tools"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-tools ${PN}"
>=20
> Why are you dropping -doc, -staticdev, -locale and other default
> packages?
>=20
> PACKAGE_BEFORE_PN +=3D "${PN}-tools"
Right, this should do the trick. The -doc, -staticdev, -locale are empt=
y=20
anyway, but it does make more sense not to remove them from PACKAGES.

I can post an updated patch if that's needed.

>=20
> should be enough, will do in master-next, but please ack
>=20
> > +
> > +DEPENDS =3D "popt openssl"
> > +
> > +FILES_${PN}-tools =3D "${bindir}"
> > \ No newline at end of file

--=20
=20
Maciej Borz=C4=99cki=20
Senior Software Engineer Open-RnD Sp. z o.o.=20
www.open-rnd.pl, Facebook, Twitter=20
mobile: +48 telefon, fax: +48 42 657 9079=20


Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe z=
awiera=C4=87 chronione prawem lub=20
poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wi=
adomo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 =
zosta=C5=82a otrzymana przypadkowo=20
zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzec=
ich. W takim przypadku=20
uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poin=
formowanie=20
nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwro=
tnej. Dzi=C4=99kujemy.=20

This message, including any attachments hereto, may contain privileged =
or=20
confidential information and is sent solely for the attention and use o=
f the=20
intended addressee(s). If you are not an intended addressee, you may ne=
ither=20
use this message nor copy or deliver it to anyone. In such case, you sh=
ould=20
immediately destroy this message and kindly notify the sender by reply =
email.=20
Thank you. 

