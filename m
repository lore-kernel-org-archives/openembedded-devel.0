Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2BD60034;
	Sat, 21 Mar 2015 15:33:34 +0000 (UTC)
Received: by wetk59 with SMTP id k59so103813756wet.3;
	Sat, 21 Mar 2015 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bgBQIW5P+60xB0Be3s8BgO9ItsFurZfxky5P7ue9Hbs=;
	b=083AKGPNZWXc3HeQPOnpNnqrV4xUb8u8ybhY/vaqnRnfFMqIex3uBilJGkkfpdTCox
	X8w0GJBbgc2CduS7q9kJOtKFT4OwEbB6oU2ZKr8H+d8ely69iUvXd+ag1wgkhoGhwRUv
	CfG3F53aj8KpCriEC9u5smwX1cemyM3R4tajdtbk+tRe0e/knJr28jskZtM4DrYcByoU
	t3x+lUqegOktx2D3mNvK2MFQ5pI3RX1EOWUAMMVVQB8scS4HUbAbbaniQhwWb5fStPIC
	51eof9kRph+4SkLYJ00enoFiKrPX8Hi0MLoXJ1q83EW3N9TCIdXBxwVWrDOQ5hefgcD/
	75Zg==
X-Received: by 10.194.93.165 with SMTP id cv5mr90319322wjb.24.1426952015703;
	Sat, 21 Mar 2015 08:33:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s19sm2837562wik.18.2015.03.21.08.33.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 08:33:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 16:33:45 +0100
To: openembedded-devel@lists.openembedded.org, KhemRaj <raj.khem@gmail.com>
Message-ID: <20150321153345.GL4738@jama>
References: <20150303074258.52BFE50424@opal.openembedded.org>
	<20150321153022.GI4738@jama>
MIME-Version: 1.0
In-Reply-To: <20150321153022.GI4738@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : lirc: Add recipe for 0.9.2
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
X-List-Received-Date: Sat, 21 Mar 2015 15:33:38 -0000
X-Groupsio-MsgNum: 54839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S6vg04ofUPzW4qJg"
Content-Disposition: inline

--S6vg04ofUPzW4qJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2015 at 04:30:22PM +0100, Martin Jansa wrote:
> On Tue, Mar 03, 2015 at 07:42:58AM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: d68ffc6ef01a138c04c935a8599e5679ae56a917
> > URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcomm=
it;h=3Dd68ffc6ef01a138c04c935a8599e5679ae56a917
> >=20
> > Author: Khem Raj <raj.khem@gmail.com>
> > Date:   Sun Mar  1 22:25:08 2015 +0000
> >=20
> > lirc: Add recipe for 0.9.2
> >=20
> > There is a older version available at meta-guacamayo
> > but its not distro specific and many distros might need it
> > so meta-oe is right place for it.
> >=20
> > Change-Id: Ic6b45dd652187d72a1e1bf4fb5adc8ed9c80e52a
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Please fix following undeterministic dependencies:
> lirc-0.9.2: lirc rdepends on libx11, but it isn't a build dependency? [bu=
ild-deps]
> lirc-0.9.2: lirc-plugins rdepends on libjack, but it isn't a build depend=
ency? [build-deps]
> lirc-0.9.2: lirc-plugins rdepends on libusb-compat, but it isn't a build =
dependency? [build-deps]
> lirc-0.9.2: lirc-plugins rdepends on portaudio-v19, but it isn't a build =
dependency? [build-deps]

and
lirc-0.9.2: lirc requires /bin/bash, but no providers in its RDEPENDS [file=
-rdeps]
>=20
>=20
> >=20
> > ---
> >=20
> >  meta-oe/recipes-connectivity/lirc/lirc.inc         |  14 +
> >  .../recipes-connectivity/lirc/lirc/lirc.tmpfiles   |   1 +
> >  .../lirc/lirc/lirc_options.conf                    |  24 ++
> >  meta-oe/recipes-connectivity/lirc/lirc/lircd.conf  | 315 +++++++++++++=
++++++++
> >  meta-oe/recipes-connectivity/lirc/lirc/lircd.init  |  40 +++
> >  .../recipes-connectivity/lirc/lirc/lircd.service   |  20 ++
> >  .../recipes-connectivity/lirc/lirc/lircexec.init   |  37 +++
> >  meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb    |  66 +++++
> >  8 files changed, 517 insertions(+)
> >=20
> > Diff:   http://git.openembedded.org/?p=3Dmeta-openembedded.git/?a=3Dcom=
mitdiff;h=3Dd68ffc6ef01a138c04c935a8599e5679ae56a917
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S6vg04ofUPzW4qJg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNj1kACgkQN1Ujt2V2gBwGOwCfQfU0XoIzVuZ2RSCB0KKqJ+8h
gHIAn3eqzwhJDs3MmoikD5NqCiyQZW2c
=y10f
-----END PGP SIGNATURE-----

--S6vg04ofUPzW4qJg--
