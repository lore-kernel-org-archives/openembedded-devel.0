Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 546F671971
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:32:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so166269wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 06:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fcJaYIZ2IiaXJRi3VBBV9sVOmplQQO1U89i0zrOlvb8=;
	b=Z1XCInMO4OcaEOteaWshKKUZKU52jpbsWUwnT3iMZi/YhRZA7rgepu4ghSOqLP/GE9
	VEsRhELYj8fZy/pk+xrd0pudLjZE+8WLqqz+TwODdi2qrjOmpqgQxFLe+xMKACNBaHAx
	dDmGyz3hjc4nOK7BxB3pabKCHMUYIVdI6rwMS5b65W5+FzZDrSTRAIejUCGU/MZAkFx4
	hM5HoWcQ9V3l9pwyWz26ieyNvueHuaZShem0zgIfxuj01iP38j+RoV9pA6M+qRmvuVpn
	IQKVelLQB4+vC0uzpmTlmlTqhlzGM73PLkpve41+BUuj02gnKHTEEx3GVgLhT2IbELwL
	Oy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fcJaYIZ2IiaXJRi3VBBV9sVOmplQQO1U89i0zrOlvb8=;
	b=giw0PBgGd4kUcttekypBEN0wbkU0pWCdtdBTl9Qfo2Yt4sBGNnzCowdHj38AIQ5JW6
	DqZYHtwMvPdIl6Y3DFwQPF5iwFwVEfjR4LOTGOWimz/kXRStBrYdDTVp4q17+3OuvDuN
	WJfnWpDkmw+0oFaZhOj9dEtxwQNKm2eRz6CnQuinFgANpuEsYg5FQqQH+VxNq8pQHWmx
	ZDU7dtLNW3WryPRyhvz12GX27+vQZZomAzS0zD8scXrpwvTRCaPRVXVh1OelwrQ6YTMw
	6Okkz0awfDVlfnSo87ZwDsCXH7TnjRBqAKr4Kf2Vi/JPe9bO7snRaRLskq5esroTaqoy
	N4aA==
X-Gm-Message-State: AMke39kxt8RDg3BOXbSS7emhGTir23Tl6B0EmyVdV1GbX9OfdztN4NHGDiy7r4FBtHc3lA==
X-Received: by 10.28.150.194 with SMTP id y185mr5069548wmd.47.1487860357892;
	Thu, 23 Feb 2017 06:32:37 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m188sm7037188wma.27.2017.02.23.06.32.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Feb 2017 06:32:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Feb 2017 15:32:38 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20170223143238.GC3300@jama>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
	<20170222230250.30288-6-schnitzeltony@googlemail.com>
	<20170223105259.GA3300@jama>
	<CALbNGRSr2VNR6P=u23u=ecchFCOs=cNwPmDYGz92fwbtmB-xLw@mail.gmail.com>
	<20170223125901.GB3300@jama>
	<CALbNGRQ3rfUFAhKqpMhT9yGhWJ3RPDSn9cGtVUhoMvuFNvyvBQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ3rfUFAhKqpMhT9yGhWJ3RPDSn9cGtVUhoMvuFNvyvBQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2017 14:32:37 -0000
X-Groupsio-MsgNum: 65521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline

--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 02:31:37PM +0100, Andreas M=FCller wrote:
> On Thu, Feb 23, 2017 at 1:59 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Feb 23, 2017 at 01:20:05PM +0100, Andreas M=FCller wrote:
> >> On Thu, Feb 23, 2017 at 11:52 AM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >> > On Thu, Feb 23, 2017 at 12:02:44AM +0100, Andreas M=FCller wrote:
> >> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> >
> >> > Thanks for another round of fixes!
> >> >
> >> > All looks good except this one, see:
> >> > http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170=
223_005128.log
> >> >
> >> The link does not tell why abiword's do_configure fails - can you give=
 details?
> >
> > The link shows:
> > http://errors.yoctoproject.org/Errors/Build/32829/
> > which leads to:
> > http://errors.yoctoproject.org/Errors/Details/133989/
> >
> > configure: error: Package requirements (
> >   fribidi >=3D 0.10.4
> >   glib-2.0 >=3D 2.6.0 gthread-2.0 >=3D 2.6.0 gobject-2.0 >=3D 2.6.0
> >   libgsf-1 >=3D 1.14.18
> >   wv-1.0 >=3D 1.2.0
> >   libxslt
> >   gio-2.0
> >   cairo-pdf cairo-ps pangocairo
> >   gtk+-2.0 >=3D 2.12.0 gtk+-unix-print-2.0 librsvg-2.0 >=3D 2.16.0 cair=
o-fc
> >  x11) were not met:
> >
> > No package 'libxslt' found
> >
> Thanks - have overseen the links. This is the 'fedora is useless
> without libxslt' problem - will send out V2 for abiword.

Thanks!

Isn't this the libxslt for target? I wonder why you're having issues
reproducing these failures when our builds should be very similar with
RSS.

Of course missing glib-2.0-native dependency is different case, but
target libxslt? Does it silently fallback to host's libxslt?

Regards,

>=20
> Andreas

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK7yhQAKCRA3VSO3ZXaA
HEwfAJ907KXy+ChTz9eUhn/jxd70v2Uv7wCgo3zna5Fwp+pRxXQFpJt4CeK24VY=
=CY/d
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--
