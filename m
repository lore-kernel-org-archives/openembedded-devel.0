Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACBA609B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:49:27 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id hr17so1344548lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PM9n1TLSvxebylzoLzTX8VyvHlSIVbMGAAV3GJkhKzE=;
	b=hXTGPe94PpDzrjVMJLd3+t0lcSUIEZlse6ICQ4DTJSxl6id20AXH2wcSalc+MwnjGH
	ZNVvr1wiqFSjpnOnz1vT5nXoDGKF/WsxZxipfD7KJ2IEBm1b2xlfheNHaWNSsrbBewN1
	tZFByafmvrxuNnrhmG45+gm1jAtd5nTroiJDnvSmCznaPcJoxB8Qo4ZokLhbDGwzyUHr
	XYAqjJyWuHPKQRIEAJ9zhoz+vV3M6e4BOJPWqBAByFP+BQ9WfzotxvLY0nU+iAI8uxu7
	6nkrzkpumy3+8WMZV9WjIYz4+dvEXSCl5SvxYKSQMBKM4wlPAK6G1L+BjxPxDeav2jsD
	E8VQ==
X-Received: by 10.152.121.98 with SMTP id lj2mr4259102lab.93.1408031368411;
	Thu, 14 Aug 2014 08:49:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id l4sm3320130lam.2.2014.08.14.08.49.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 08:49:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 17:50:04 +0200
To: Maciej Borzecki <maciek.borzecki@gmail.com>
Message-ID: <20140814155004.GM14848@jama>
References: <1408030303-742-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1408030303-742-3-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140814154220.GL14848@jama>
	<3050179.UVPPAEUo1f@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <3050179.UVPPAEUo1f@localhost.localdomain>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] collectd: make pinba support a selectable feature
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
X-List-Received-Date: Thu, 14 Aug 2014 15:49:31 -0000
X-Groupsio-MsgNum: 51702
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FzMlDQVV4VcwxUi5"
Content-Disposition: inline

--FzMlDQVV4VcwxUi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 05:45:12PM +0200, Maciej Borzecki wrote:
> On Thursday 14 of August 2014 17:42:20 Martin Jansa wrote:
> > On Thu, Aug 14, 2014 at 05:31:43PM +0200, Maciej Borzecki wrote:
> > > Pinba support requires protobuf-c that is currently only available in
> > > meta-virtualization layer. Make this a selectable feature.
> >=20
> > There is some protobuf in meta-oe
> > meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
> >=20
> > is protobuf-c something else?
> Yes. protobuf in meta-oe is a tool (protoc) and a C++ library, protobuf-c=
 is a=20
> C implementation of the library.

So shouldn't PACKAGECONFIG contain protobuf-c as well?

If yes, then please add comment above PACKAGECONFIG definition that
protobuf-c is in meta-virtualization (so that people don't need to
search commit messages).

Thanks

> > > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > > ---
> > >=20
> > >  meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > > b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb index
> > > 30279c2..837eae5 100644
> > > --- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > > +++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > > @@ -32,6 +32,7 @@ PACKAGECONFIG[sensors] =3D "--enable-sensors
> > > --with-libsensors=3Dyes, \>=20
> > >          --disable-sensors --with-libsensors=3Dno,lmsensors"
> > > =20
> > >  PACKAGECONFIG[amqp] =3D "--enable-amqp --with-librabbitmq=3Dyes, \
> > > =20
> > >          --disable-amqp --with-librabbitmq=3Dno,rabbitmq-c"
> > >=20
> > > +PACKAGECONFIG[pinba] =3D "--enable-pinba,--disable-pinba,protobuf
> > > protobuf-native">=20
> > >  EXTRA_OECONF =3D " \
> > > =20
> > >                  ${FPLAYOUT} \
>=20
> --=20
> Maciek Borzecki <maciek.borzecki@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FzMlDQVV4VcwxUi5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPs2qwACgkQN1Ujt2V2gByvDwCaAp9gjEGLosG0hZ4hcOvUFhn+
f7QAoK41BEkkcYO1GJkSCnuU18pIf93/
=rqOy
-----END PGP SIGNATURE-----

--FzMlDQVV4VcwxUi5--
