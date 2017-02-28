Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB26C72FC1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 16:32:14 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m70so3243434wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=d29rs1o84JSScs87fnjdBvyubJ3FF1z+Xzs8tfiTQCs=;
	b=gxOJ00zmBsJU0aXcr4SGtwIGrWtotARGdV/Phw9549lHKGMN4ZZYy0NYPnxU9RyPxS
	0i6B5NgD9DSFTzlQv55mXHEjKtmAP1dc5wKsIBMDns2Hy63j8iV9jk7PhfUty6mfxtj9
	w/uINI2E8sD69jzs9wciqwN4XLc02JEEQGDHDPKxXR9+egD4v2Ji8LnITmZv50/G8LDi
	gXBSnpWkNHG1pH07hMNLmRKeyH/IxxXAuWzXBF95GlRax9bfPlHYIc/dnV380zXy2Ndf
	M31qujWyRrCk2dLzKxf32gPuvPkMk/j3Ph5V2N9kkchwFrjcKzJeeReNRyakiQFwVm38
	v2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=d29rs1o84JSScs87fnjdBvyubJ3FF1z+Xzs8tfiTQCs=;
	b=ZQtoRSjk7QdhJoT5JfVDQniaoMPKgmk4qK4bF1I0jgYEw0F4ILeb+2AiGk1EDe8qrd
	xzk6LhBeSaRj8nvhHqMAwhc1+FhtvJ8OYlp3hC8EjZhEWWHLKBQL7hfHD6ME/ciTCi4G
	4vkLI82fJzxFFc3+/sZxenzjnpxaVK7NpdO8IcBEhP2Hpo7j4SM5GUiY5PpITLSBsEqo
	gNi8+VJaSo0Qx0/sdD5tpmJpTGWIwEo+Pcmqxn70m+1R3aQxYVVaarXl+3FpBJMCZ1JP
	gnG8M6503DtOBncyMnPiDmcN+kRn1zFbQb93XnIAUwmstmGCmJtYuxOxH8qwEAb9AJkj
	MI6Q==
X-Gm-Message-State: AMke39lWvjhmtpz4IOR5pp15YXK/MW5QFKecfKVM5lI3PdX4lK2cECDlMZ1dGNXUiceVYg==
X-Received: by 10.28.155.9 with SMTP id d9mr18136229wme.114.1488299535434;
	Tue, 28 Feb 2017 08:32:15 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 39sm2981297wrv.55.2017.02.28.08.32.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Feb 2017 08:32:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Feb 2017 17:32:18 +0100
To: Derek Straka <derek@asterius.io>
Message-ID: <20170228163218.GF3275@jama>
References: <1487973264-29272-1-git-send-email-derek@asterius.io>
	<CA+chaQdjpaUPga2h0rN8BFdjsubgrc8M+LxQhJ0K0cQ6FXJaog@mail.gmail.com>
	<741960ebbae947bd8fa4297e4f60cd88@XBOX02.axis.com>
	<CADNbA1rWZhyFBGEQaeAJo19CFLkZ51KZ8ESourT+yM7H06vdZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNbA1rWZhyFBGEQaeAJo19CFLkZ51KZ8ESourT+yM7H06vdZQ@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [meta-oe][PATCH] syslog-ng: update inherit to work correctly with RSS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2017 16:32:15 -0000
X-Groupsio-MsgNum: 65613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Content-Disposition: inline

--1EKig6ypoSyM7jaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 10:56:12AM -0500, Derek Straka wrote:
> This patch can been dropped and we can use Peter's update instead.

I've already dropped it before running next build:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/11=
1613.html

> On Tue, Feb 28, 2017 at 10:33 AM, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>=20
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of
> > > Martin Jansa
> > > Sent: den 28 februari 2017 10:24
> > > To: Derek Straka
> > > Cc: openembedded-devel
> > > Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: update inherit to work
> > > correctly with RSS
> > >
> > > Now it complains about libtool version :/
> > >
> > > http://errors.yoctoproject.org/Errors/Details/134288/
> >
> > I have a solution for this where it executes autoreconf twice
> > to make it work. I do not really know why that is necessary, or
> > why it changed with RSS, but at least it seems to work. syslog-ng
> > has sub-projects with their own autotools files, and that has
> > probably got something to do with it...
> >
> > I will also include an update to version 3.8.1 that I have been
> > meaning to provide for a while now.
> >
> > > On Fri, Feb 24, 2017 at 10:54 PM, Derek Straka <derek@asterius.io>
> > > wrote:
> > >
> > > > Resolves build issue exposed by RSS
> > > > http://errors.yoctoproject.org/Errors/Details/130631/
> > > >
> > > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > > ---
> > > >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 2 +-
> > > >  meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb | 2 --
> > > >  2 files changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > > > index 21d1748..0dbcc6e 100644
> > > > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > > > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> > > > @@ -22,7 +22,7 @@ SRC_URI =3D "http://www.balabit.com/
> > downloads/files/syslog-ng/sources/${PV}/source
> > > >             file://configure.ac-add-option-enable-thread-tls-to-man=
age-.patch
> > \
> > > >  "
> > > >
> > > > -inherit autotools systemd pkgconfig update-rc.d
> > > > +inherit autotools gettext systemd pkgconfig update-rc.d
> > > >
> > > >  EXTRA_OECONF =3D " \
> > > >      --enable-dynamic-linking \
> > > > diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > > > index bee1e19..73609af 100644
> > > > --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > > > +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
> > > > @@ -13,5 +13,3 @@ SRC_URI +=3D " \
> > > >
> > > >  SRC_URI[md5sum] =3D "e9f401615e92e5eb27396c995c1446ba"
> > > >  SRC_URI[sha256sum] =3D "7be11df31ac7d716f1f952e22b5ae8
> > e2049edd633a41b223776a853d9106f4e7"
> > > > -
> > > > -PNBLACKLIST[syslog-ng] ?=3D "Fails to build with RSS
> > http://errors.yoctoproject.org/Errors/Details/130631/"
> > > > --
> > > > 2.7.4
> >
> > //Peter
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLWmEQAKCRA3VSO3ZXaA
HEzjAJ9lfYSNSJISsdw61RxzZNRxqtjRrACeP/3rWL0CpNHiE916K/syMPlJD9A=
=hatP
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--
