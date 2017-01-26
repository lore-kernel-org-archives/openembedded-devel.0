Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 51A3871DDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:54:15 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so50121195wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 04:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8lRdGjBpNvL6s1xqjjhFQtlOYm7vhrZ6TPABeFWqv9s=;
	b=o0YF/iGP5Vbs/6y/fVoWuXuC0ikG2Lfacvs75b30yDm99jl5SkLmxqXHLpocLFqwMD
	xkyoMpqerNfxpNT748i6L/xfeLxeuOS89QFQt6057wSGTtlzmxMfQEFnmkYxqxxvWdxU
	8TiQz/gQ/wJu4D7ZrOU8cn9eJnyiw5kO0nrNzJhcU8OzSrP64DV8QY1QrslpJT2ICcJY
	Fl+XEAqFLBtK+w0846dM2Ll05DyK/76L5TMfVC7IjrPMzmiOV3BkkDD8D+ylwJ8isRBw
	irTCI2MHdl3UTMlSWbEdKbKJO/2upnHAxXq7VXN9yDvfjac0GZi6DXhOW0D/SR285pgH
	3Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8lRdGjBpNvL6s1xqjjhFQtlOYm7vhrZ6TPABeFWqv9s=;
	b=oV3i0VaxMCHih+Jbs7tzfrcgddieIBiTRS07oKPH4WGvej68eXKKPTo6j1HZGjflvu
	K8SPtF94souqqSW2Pr96KV7DnnEdfFxgRW8iY7xcQWMcDnMhgpulro7yR8DplDVmWNve
	TbwrKVD/IX8bo2WMjlq4/rFNvNd2nMjVC2mdM7XX+KmKvJzmdl540MPt9Qp8NTntb+z9
	EH3u52CDiSpBVB2Zptwl6g2va4Nxca+oHyoJ/6zPIZejcqxr4b9seP3fwiT/MqsrdmUz
	4KvljkBbuGeoSeMQszUah4pCHtxtGFikDAPB1Yzt0zO5T6GxEWmwk2uwQKeWRnOXcOzs
	UkkQ==
X-Gm-Message-State: AIkVDXJXpURg07Ebwu/RA6LC4eGE5MwjMciOYjqugNoCOxunRKUpeBCXIxghhTwogtXHZQ==
X-Received: by 10.28.217.136 with SMTP id q130mr2675609wmg.13.1485435255726;
	Thu, 26 Jan 2017 04:54:15 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n10sm2463472wrb.9.2017.01.26.04.54.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jan 2017 04:54:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 Jan 2017 13:54:14 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170126125414.GA3016@jama>
References: <1485160227-29998-1-git-send-email-samuli.piippo@qt.io>
	<20170125160207.GF3260@jama>
	<CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHvQdo3_+YfdZN_MYmZQLOW7uDnE-=LuXUwL8SR7sXLCG8VVyA@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v5] Upgrade to Qt 5.8
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
X-List-Received-Date: Thu, 26 Jan 2017 12:54:16 -0000
X-Groupsio-MsgNum: 64872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:00:59AM +0100, Johannes Pointner wrote:
> Hello,
>=20
> I tried to build qtbase after this update, but it failed to configure
> because of PACKAGECONFIG options which are no longer available or
> moved to another part (qtmultimedia):
> PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
>=20
> PACKAGECONFIG[alsa] =3D "-alsa,-no-alsa,alsa-lib"
> PACKAGECONFIG[pulseaudio] =3D "-pulseaudio,-no-pulseaudio,pulseaudio"

Yes, I'm seeing the same issue, the flags were removed in:

commit 90c425642dfeae4564b43dacf15f80479962e910
Merge: 1a43199 9808b53
Author: Liang Qi <liang.qi@qt.io>
Date:   Wed Nov 16 07:37:38 2016 +0100

    Merge remote-tracking branch 'origin/5.7' into 5.8

but there is still PACKAGECONFIG in qtbase recipe, so this needs be
fixed in v6.

>=20
> After removing them I was able to configure, but I saw following
> warnings during the configure process:| WARNING: Unable to find file
> /mnt/raid/yocto_env/poky/morty/ppt50/build/tmp/work/cortexa9hf-neon-mx6qd=
l-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/git/mkspecs/linu=
x-oe-g++/../oe-device-extra.pri
> | WARNING: Unable to find file

These warnings were there before as well, since oe-device-extra.pri
support was added in:

commit 37693b5357e790665bce4957cb7a8d5d2423390d
Author: Samuli Piippo <samuli.piippo@theqtcompany.com>
Date:   Thu Oct 15 13:00:31 2015 +0300

    qt5: use extra .pri file from linux-oe-g++ mkspec


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWInxdAAKCRA3VSO3ZXaA
HOoiAJ9kwqbIB3w10pSTqqIgRXoDSQde1QCfaDJ0OqMQaBOf9NT/K8SrGsu7ia0=
=nWXV
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
