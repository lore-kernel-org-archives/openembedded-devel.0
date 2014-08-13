Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 181ED601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 20:33:24 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so240515lab.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CxGnXQhY8Cye4E6b5p/sn8d22wB2blkdnsA62gDFC4o=;
	b=bYvNAD/W+fMmu2m37OPcqCvrs8N3nMFWwBPnxwSERbvX/SwVsYmts98vS5kxouFZvA
	6m0A8bPhheUteA/mRhKH8Wg2/TqS5M0Xaks1CQ+QXzxGZQcqBHHKQy/BC4VnsUqbALce
	P2TCHvaktJn7YHa4lFhxmzJELuj//U7RAogE/qm7GcWa/11+c7XkrvV16iqiCrjaA3LO
	0BB4xu28qcfnftIogrhKiAM3JbIs+FpLzDyJU07MBx0MkghPehOKeTpvugKQcBgxJtET
	mxrf5o2DLl/UcZBFRuqMzLMAqhUZWufdxI6ILxZ+bfIQNYiQjKkCinwT7SGTdmxQJPHO
	zTMA==
X-Received: by 10.152.9.194 with SMTP id c2mr391943lab.16.1407962005368;
	Wed, 13 Aug 2014 13:33:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q8sm1794676laj.33.2014.08.13.13.33.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 13:33:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 22:34:01 +0200
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140813203401.GX14848@jama>
References: <1407767636-32624-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140812114538.GJ14848@jama>
	<1698797.3VM4VhPSOi@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1698797.3VM4VhPSOi@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Wed, 13 Aug 2014 20:33:33 -0000
X-Groupsio-MsgNum: 51650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MhgcBKmfuR2ggk1S"
Content-Disposition: inline

--MhgcBKmfuR2ggk1S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 02:05:05PM +0200, Maciej Borzecki wrote:
> On Tuesday 12 of August 2014 13:45:38 Martin Jansa wrote:
> > On Mon, Aug 11, 2014 at 04:33:56PM +0200, Maciej Borzecki wrote:
> > > rabbitmq-c is a C library providing an implementation of AMQP client =
for
> > > use with v2.0+ of the RabbitMQ broker
> > >=20
> > > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > > ---
> > >=20
> > >  .../rabbitmq-c/rabbitmq-c_0.5.0.bb                 | 22
> > >  ++++++++++++++++++++++ 1 file changed, 22 insertions(+)
> > >  create mode 100644
> > >  meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb>=20
> > > diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0=
=2Ebb
> > > b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb new file
> > > mode 100644
> > > index 0000000..d8e3189
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.0.bb
> > > @@ -0,0 +1,22 @@
> > > +DESCRIPTION =3D "A C-language AMQP client library for use with v2.0+=
 of the
> > > RabbitMQ broker" +HOMEPAGE =3D "https://github.com/alanxz/rabbitmq-c"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://${S}/LICENSE-MIT;md5=3D6b7424f9db80cfb11fdd5c980b583f53" +LIC=
ENSE =3D
> > > "MIT"
> > > +
> > > +SRC_URI =3D
> > > "https://github.com/alanxz/rabbitmq-c/releases/download/v${PV}/rabbit=
mq-c
> > > -${PV}.tar.gz" +SRC_URI[md5sum] =3D "b1f902c658c772cda464754678d8deb6"
> > > +SRC_URI[sha256sum] =3D
> > > "53702ea2ab809af0f923e387458e2cad191d9549f50410035fe82ce5e6ccc4fa" +
> > > +PR =3D "r0"
> >=20
> > ^ dropped when cherry-picking to master-next
> >=20
> > > +
> > > +S =3D "${WORKDIR}/rabbitmq-c-${PV}"
> >=20
> > ^ dropped when cherry-picking to master-next
> >=20
> > > +
> > > +EXTRA_OECONF =3D "--disable-examples --enable-tools"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-tools ${PN}"
> >=20
> > Why are you dropping -doc, -staticdev, -locale and other default
> > packages?
> >=20
> > PACKAGE_BEFORE_PN +=3D "${PN}-tools"
> Right, this should do the trick. The -doc, -staticdev, -locale are empty=
=20
> anyway, but it does make more sense not to remove them from PACKAGES.
>=20
> I can post an updated patch if that's needed.

There is another issue found in world builds:

| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
xmlto: line 325: local: can only be used in a function
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
xmlto: line 325: local: can only be used in a function
| I/O xmlto --skip-validation --searchpath /home/jenkins/oe/world/shr-core/=
tmp-eglibc/work/core2-64-oe-linux/rabbitmq-c/0.5.0-r0/build/tools/doc -o ./=
tools/doc man /home/jenkins/oe/world/shr-core/tmp-eglibc/work/core2-64-oe-l=
inux/rabbitmq-c/0.5.0-r0/rabbitmq-c-0.5.0/tools/doc/amqp-delete-queue.xml
| error : Attempt to load network entity http://docbook.sourceforge.net/rel=
ease/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/r=
elease/xsl/current/manpages/docbook.xsl"
| compilation error: file /tmp/xmlto-xsl.dUNOhT line 4 element import
| xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/cu=
rrent/manpages/docbook.xsl
| make[1]: *** [tools/doc/amqp-publish.1] Error 1
| make[1]: *** Waiting for unfinished jobs....
| I/O error : Attempt to load network entity http://docbook.sourceforge.net=
/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/r=
elease/xsl/current/manpages/docbook.xsl"
| compilation error: file /tmp/xmlto-xsl.9922tE line 4 element import
| xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/cu=
rrent/manpages/docbook.xsl
| I/O error : Attempt to load network entity http://docbook.sourceforge.net=
/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/r=
elease/xsl/current/manpages/docbook.xsl"
| compilation error: file /tmp/xmlto-xsl.EhgGFW line 4 element import
| xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/cu=
rrent/manpages/docbook.xsl
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
xmlto: line 325: local: can only be used in a function
| make[1]: *** [tools/doc/amqp-consume.1] Error 1
| make[1]: *** [tools/doc/amqp-get.1] Error 1
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/=
xmlto: line 325: local: can only be used in a function
| I/O error : Attempt to load network entity http://docbook.sourceforge.net=
/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/r=
elease/xsl/current/manpages/docbook.xsl"
| compilation error: file /tmp/xmlto-xsl.31x9dG line 4 element import
| xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/cu=
rrent/manpages/docbook.xsl
| make[1]: *** [tools/doc/amqp-declare-queue.1] Error 1
| I/O error : Attempt to load network entity http://docbook.sourceforge.net=
/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "http://docbook.sourceforge.net/r=
elease/xsl/current/manpages/docbook.xsl"
| compilation error: file /tmp/xmlto-xsl.z0t8kl line 4 element import
| xsl:import : unable to load http://docbook.sourceforge.net/release/xsl/cu=
rrent/manpages/docbook.xsl
| make[1]: *** [tools/doc/amqp-delete-queue.1] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-eglibc/wo=
rk/core2-64-oe-linux/rabbitmq-c/0.5.0-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-eglibc/work/core2-64-oe-linux/rabbitmq-c/0.5.0-r0/tem=
p/log.do_compile.28061)

so please send updated version with disabled or fixed doc generation

> > should be enough, will do in master-next, but please ack
> >=20
> > > +
> > > +DEPENDS =3D "popt openssl"
> > > +
> > > +FILES_${PN}-tools =3D "${bindir}"
> > > \ No newline at end of file
>=20
> --=20
> =20
> Maciej Borz=C4=99cki=20
> Senior Software Engineer Open-RnD Sp. z o.o.=20
> www.open-rnd.pl, Facebook, Twitter=20
> mobile: +48 telefon, fax: +48 42 657 9079=20
>=20
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

--MhgcBKmfuR2ggk1S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPry7kACgkQN1Ujt2V2gBztQwCdH2+GZbrr5mRWPeFr/j33vhJ4
c+oAn1ke4IjN4n5iIN87WYWcLLJDamPK
=Lsam
-----END PGP SIGNATURE-----

--MhgcBKmfuR2ggk1S--
