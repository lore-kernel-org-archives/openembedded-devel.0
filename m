Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 055B365CB2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 09:43:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 666CC1B81B009;
	Mon, 18 Aug 2014 11:43:49 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Aug 2014 11:43:49 +0200
Message-ID: <1467268.4I7ksEROPs@localhost.localdomain>
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140818091658.GJ3660@jama>
References: <1408345522-29466-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140818091658.GJ3660@jama>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] collectd: make pinba support a selectable feature
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
X-List-Received-Date: Mon, 18 Aug 2014 09:43:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 18 of August 2014 11:16:58 Martin Jansa wrote:
> On Mon, Aug 18, 2014 at 09:05:22AM +0200, Maciej Borzecki wrote:
> > Pinba support requires protobuf-c that is currently only available =
in
> > meta-virtualization layer. Make this a selectable feature.
>=20
> I'll add this as comment above PACKAGECONFIG as requested.

Great. Thanks.

>=20
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > ---
> >=20
> > Notes:
> >     Updated pinba plugin dependency to protobuf-c.
> > =20
> >  meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb index
> > 30279c2..443f85d 100644
> > --- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > +++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > @@ -32,6 +32,7 @@ PACKAGECONFIG[sensors] =3D "--enable-sensors
> > --with-libsensors=3Dyes, \>=20
> >          --disable-sensors --with-libsensors=3Dno,lmsensors"
> > =20
> >  PACKAGECONFIG[amqp] =3D "--enable-amqp --with-librabbitmq=3Dyes, \=

> > =20
> >          --disable-amqp --with-librabbitmq=3Dno,rabbitmq-c"
> >=20
> > +PACKAGECONFIG[pinba] =3D "--enable-pinba,--disable-pinba,protobuf-=
c-native
> > protobuf-c">=20
> >  EXTRA_OECONF =3D " \
> > =20
> >                  ${FPLAYOUT} \

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

