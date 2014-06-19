Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id BB5AD70232
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 23:21:30 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so2903124wgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IXGuPCKu/0FWQ3tEWkBGcnaodR9FvVFt/eNvfr6vNtA=;
	b=tGSsprstgYmKqoYxZaX59LHjxSkTYxWyKlUisoW6PMV83ezGMrTcN4yGb5qzYFQY5h
	WSeT/qvfKyk/xnD+j9EwHLiIYgSJKb+J8JhGA5YTBW4vZEsv5YSWnn3TMQ5yljCdnZc4
	BUx4e+AcyHcYjrK1PYPDySdsWI2laeLkNmHJ5Q1Jz4CIjhenwoY/2jDfapHF+yfVr5pz
	XamdJ8CA2Qa5haihbtny0tYKVumQk8ic3WA9FB9DyrIxm8zAiomDONHpV44wk0dACvXd
	gKBkaV8se0KeMElYa4kelInkrKR8vGROP+vBMVP3fmP1qwiaY+Mniiyd04JSbKblON3p
	kSzA==
X-Received: by 10.180.183.167 with SMTP id en7mr10335488wic.6.1403220091605;
	Thu, 19 Jun 2014 16:21:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o3sm37403084wiz.24.2014.06.19.16.21.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 16:21:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 20 Jun 2014 01:21:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619232132.GV2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
	<20140619192658.GS2117@jama>
	<CACgAsMd+5=_77KqbftS_pQMAwU4sgRE+2nVBusc_pUxNXW+jyw@mail.gmail.com>
	<20140619210847.GT2117@jama>
	<CACgAsMdrN75Mrk7Ehuf7=GjzaJmTLMQoWHgDcJ6EshRCLWhURQ@mail.gmail.com>
	<CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMf5GQ-8325U4aGeNDrM_WtRkmK9bxQuyUSBQw0v_buOSA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [yocto][meta-qt5][daisy] Error during bitbake of my image
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
X-List-Received-Date: Thu, 19 Jun 2014 23:21:37 -0000
X-Groupsio-MsgNum: 50468
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="buDNgeHiu+HCsDEc"
Content-Disposition: inline

--buDNgeHiu+HCsDEc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 07:06:08PM -0400, Kevyn-Alexandre Par=E9 wrote:
> I'm a bit further but still have some interrogations?
>=20
> ERROR: qtwebkit not found in the base feeds (overo armv7a-vfp-neon
> armv7a-vfp armv7a armv6-vfp armv6 armv5e-vfp armv5e armv5-vfp armv5
> armv4 arm noarch any all)
>=20
> I'm having these included in my image:
>=20
>   ruby \
>   qtbase \
>   qtbase-fonts \
>   qtbase-fonts-ttf-vera \
>   qtbase-fonts-ttf-dejavu \
>   qtbase-fonts-pfa \
>   qtbase-fonts-pfb \
>   qtbase-fonts-qpf \
>   qtbase-tools-dbg \
>   qtbase-plugins-dbg \
>   qtbase-tools \
>   qtbase-plugins \
>   qtbase-mkspecs \
>   qtbase-dev \
>   qtdeclarative-qmlplugins-dbg \
>   qtdeclarative-tools-dbg \
>   qtdeclarative-plugins-dbg \
>   qtdeclarative-qmlplugins \
>   qtdeclarative-tools \
>   qtdeclarative-plugins \
>   qtdeclarative-mkspecs \
>   qtdeclarative-dbg \
>   qtdeclarative-dev \
>   qtdeclarative \
>   qtquick1-qmlplugins-dbg \
>   qtquick1-tools-dbg \
>   qtquick1-plugins-dbg \
>   qtquick1-qmlplugins \
>   qtquick1-tools \
>   qtquick1-plugins \
>   qtquick1-mkspecs \
>   qtquick1-dbg \
>   qtquick1-dev \
>   qtquick1 \
>   qttools-tools-dbg \
>   qttools-tools \
>   qttools-mkspecs \
>   qttools-dbg \
>   qttools-dev \
>   qttools \
>   qtwebkit \
>=20
> [1] Why the bitbake qtwebkit is working but not when I'm including it
> in my image?

What PACKAGECONFIG values are you using (especially for qtbase)?

carefully read comments in qtbase.inc

> On Thu, Jun 19, 2014 at 5:34 PM, Kevyn-Alexandre Par=E9
> <kapare@rogue-research.com> wrote:
> > On Thu, Jun 19, 2014 at 5:08 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> On Thu, Jun 19, 2014 at 04:32:17PM -0400, Kevyn-Alexandre Par=E9 wrote:
> >>> Hi Martin,
> >>>
> >>> On Thu, Jun 19, 2014 at 3:26 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >>>
> > ...
> >>> or use bitbake -e qtbase | grep PACKAGES=3D
> >>>
> >>> Other solutions?
> >>
> >> buildhistory is great tool
> >>
> >
> > k reading:
> > http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#mai=
ntaining-build-output-quality
> >
> > thx!
> >
> > -KA
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--buDNgeHiu+HCsDEc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOjcHwACgkQN1Ujt2V2gBxFcQCfRDRKaBmnMQhYI3qd9uqGwnNu
JK0AoJYtqK/OzzTrnlj0P+eXgRnMjDpZ
=zwNL
-----END PGP SIGNATURE-----

--buDNgeHiu+HCsDEc--
