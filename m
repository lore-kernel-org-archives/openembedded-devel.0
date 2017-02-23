Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB8D608B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:59:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m70so2630270wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 04:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XWBFcutgbstCOHNNCXOa0Lu2fYMdrMaV7bV2VfLrnCI=;
	b=mXb4GPosIppvHbeHgNZ8VD5tp6fJ6seLjzGb4Jr0FxpRahLma/iLQTpxO6hk5gXB+H
	lNb4v/8mRp2xSBZjv1rT7B3ft4xF25kwn0vy4/1LpZ91Q20/F5PA3T/ZOzS/fORVRdPE
	nvif+QV10btoOL98HEMeoVo8vgoFX5YrNoNKBNogXpKi6Y5/TVR+HHulyKshE2LyTrQQ
	PyfgC5aMDQHKwO57GdlOyYca7j+wJVb7Q6L2gMNc3OUMdvLP39AAhh0FPn0KxYu3Xg1B
	XNxP5JDCbH+nSe24rnb8xJyxxiz7aVDFYvokLwYMb8uPhMCKG7PhVx1ZFwyBPljjc4Fp
	lI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XWBFcutgbstCOHNNCXOa0Lu2fYMdrMaV7bV2VfLrnCI=;
	b=ZUJ32W+h0xT5o8FW+YrH5bLbGB5m2F61TbVKnXUwMJI/GTVjiGpXzYh/8iEOPE5H+j
	XK58h9+N1KKK2MLOySF2pw+KTTAvzH+qIRBGMxR/WnTb7mogNudYcEe/7ctSNylyZNDx
	jS5zhgT0kUNISJE5AlbvoHUlqjqIKEIWc5NyYl8J3fewJbc/zwDuUpZcAdf3CVYZ7OUQ
	t2q+9f7B1DQjoWEAW29N8+gdnvKtp/zmweM//TdYNWy0KESllIHmt211Ml5XuniFMejp
	Lk8OXz9DaKhe3Yb7i55eCHPw7gfldyawP90hhkeUjlZpBY3PULWahTusPs2SqMjFIKE8
	BxUQ==
X-Gm-Message-State: AMke39mgIYD6o6gEoThKqYt7nFkXQpHoh3YCc0bvXIBs902J4SADayPNHtXFCkKhGJ9MCw==
X-Received: by 10.28.98.2 with SMTP id w2mr2776344wmb.66.1487854741773;
	Thu, 23 Feb 2017 04:59:01 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l130sm6749678wmf.0.2017.02.23.04.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 04:59:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 13:59:01 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20170223125901.GB3300@jama>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
	<20170223105259.GA3300@jama>
	<CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 05/11] abiword: unblacklist - gtkmathview is back
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
X-List-Received-Date: Thu, 23 Feb 2017 12:59:02 -0000
X-Groupsio-MsgNum: 65519
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 01:20:05PM +0100, Andreas M=FCller wrote:
> On Thu, Feb 23, 2017 at 11:52 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=FCller wrote:
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >
> > Thanks for another round of fixes!
> >
> > All looks good except this one, see:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170223=
_005128.log
> >
> The link does not tell why abiword's do_configure fails - can you give de=
tails?

The link shows:
http://errors.yoctoproject.org/Errors/Build/32829/
which leads to:
http://errors.yoctoproject.org/Errors/Details/133989/

configure: error: Package requirements (
  fribidi >=3D 0.10.4
  glib-2.0 >=3D 2.6.0 gthread-2.0 >=3D 2.6.0 gobject-2.0 >=3D 2.6.0
  libgsf-1 >=3D 1.14.18
  wv-1.0 >=3D 1.2.0
  libxslt
  gio-2.0=20
  cairo-pdf cairo-ps pangocairo
  gtk+-2.0 >=3D 2.12.0 gtk+-unix-print-2.0 librsvg-2.0 >=3D 2.16.0 cairo-fc
 x11) were not met:

No package 'libxslt' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables DEPS_CFLAGS

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK7clQAKCRA3VSO3ZXaA
HBSJAKC357AbL7cvGR4R4k8fUPih3OiErwCaA0SSbCGVDjliCz0xzaQeipQQtrg=
=La+b
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
