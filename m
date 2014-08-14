Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 14FFA6059A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:46:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 04588115AB40;
	Thu, 14 Aug 2014 15:46:39 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Aug 2014 15:46:39 +0200
Message-ID: <2780776.gdRPnkqH1W@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140814132043.GJ14848@jama>
References: <20140814132043.GJ14848@jama>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] rabbitmq-c: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 13:46:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 14 of August 2014 15:20:43 Martin Jansa wrote:
> On Thu, Aug 14, 2014 at 11:11:21AM +0200, Maciej Borzecki wrote:
> > rabbitmq-c is a C library providing an implementation of AMQP clien=
t for
> > use with v2.0+ of the RabbitMQ broker
> >=20
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
>=20
> Thank you!
>=20
> There is one more issue which needs to be fixed before this is merged=
.
>=20
> collectd is probably autodetecting rabbitmq-c and fails when detected=
.
>=20
> Would you please add PACKAGECONFIG in collectd to disable it by defau=
lt?
> CCing few people who recently touched collectd, maybe someone will
> choose to upgrade it instead.

Sounds good. I'll post a separate patch for collectd.


>=20
>=20
> /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnue=
abi/col
> lectd/5.2.2-r0/collectd-5.2.2/src/amqp.c:417:5: error: 'amqp_set_sock=
fd' is
> deprecated (declared at
> /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/inclu=
de/amqp
> .h:1030) [-Werror=3Ddeprecated-declarations]
>=20
> |      amqp_set_sockfd (conf->connection, sockfd);
> |      ^
> >=20
> > ---
> >=20
> > Notes:
> >     Disabled documentation, incorporated fixes from Martin Jansa
> > =20
> >  .../recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb | 17
> >  +++++++++++++++++ 1 file changed, 17 insertions(+)
> >  create mode 100644
> >  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb>=20
> > diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5=
.0.bb
> > b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb new f=
ile
> > mode 100644
> > index 0000000..23b5013
> > --- /dev/null
> > +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> > @@ -0,0 +1,17 @@
> > +DESCRIPTION =3D "A C-language AMQP client library for use with v2.=
0+ of the
> > RabbitMQ broker" +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-=
c"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd5c980b583f53" +LICENS=
E =3D
> > "MIT"
> > +
> > +SRC_URI =3D
> > "https://github.com/alanxz/${BPN}/releases/download/v${PV}/${BP}.ta=
r.gz"
> > +SRC_URI[md5sum] =3D "b1f902c658c772cda464754678d8deb6"
> > +SRC_URI[sha256sum] =3D
> > "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa" =
+
> > +DEPENDS =3D "popt openssl"
> > +
> > +EXTRA_OECONF =3D "--disable-examples --enable-tools --disable-docs=
"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGE_BEFORE_PN +=3D "${PN}-tools"
> > +FILES_${PN}-tools =3D "${bindir}"
> > \ No newline at end of file

--=20

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

