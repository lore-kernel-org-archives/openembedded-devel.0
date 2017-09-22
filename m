Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A83286FF80
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 12:52:55 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id n64so607736wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=du4pNWJv4Hri8bj/r+l5/HqUkTtC4UBrqTmBT/0BN6M=;
	b=gOcYFAcY4R/RH5Jrl2lHKlb882MoFAvB7PiGJ4XiRgmnbf/YLINOEuu0P6rJbtFeJR
	18RWg7lJkirilqBzpfIshUnHcrVOFXKAzxjwey8qQaxZf6k49rP/Xt+L3dFlygW4COsS
	f3pEQ3HHWfIi/RQz/30GFRBItOBg9nBFd4DZW80XL2ZRenYnl34rVMrOxpy2lb7F823R
	EfzdHfHnP6tFXpxDFJfozeu3V3fZlhLQAXz+50jGHWVZm2L+pu6ayBo00wrQIU8FjfBo
	+LD+d/BZHfyDoHyEz1zp7lwYPG98T/50uGSB3kH9ikBXxeSOHLDOFK7a0hEqzZfyqKFi
	2MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=du4pNWJv4Hri8bj/r+l5/HqUkTtC4UBrqTmBT/0BN6M=;
	b=ZDFe53ZsVIxFQMPkleknn7JESGy3h4TboWjC2BAhYnQil3JuELL1RCV7Dap/dH87qo
	bGp0NZY1fa1otYW5pgGDgTcFRO0WPP2l31Yt8mcfUzpXVUvLLFO/AQWpnOF9ge+VE22h
	26t/ypVBHy8o23ID+M/h06oyAwm/jeGjsGX9LmFs9DwG6S/M9IzojuBTPd6rJwRsG4dy
	baOJFHhrQZeNWl7JPjaMX8K3i2dFTlkqmB7Is+5TvGpZI5pf68xdOGtxV392hwaGjsLr
	Nogcf3zXxvHpL2g/sOasMqYZk37p/QWgRDTXo5+xGJP9O+scqbsO1yI9DBD8TZO+MehK
	U+3g==
X-Gm-Message-State: AHPjjUhJ+9M0etz0q64cVXiRBi7tNj+5IO8CbCXv2lVNHJfHSKhWwmvV
	IcD4j+2OyAFjZuMenDw6sRZ7BQ==
X-Google-Smtp-Source: AOwi7QADUohu5m/kCjMIHF8QzUWB1e2gXHKf5tNwM/IWWEQYDdk9RSs1AfYqQ+LD3kN8Yuz2QCTqCA==
X-Received: by 10.223.154.120 with SMTP id z111mr4663019wrb.260.1506084776513; 
	Fri, 22 Sep 2017 05:52:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y84sm2176193wmg.43.2017.09.22.05.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Sep 2017 05:52:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Sep 2017 14:55:27 +0200
To: Mike Crowe <mac@mcrowe.com>
Message-ID: <20170922125527.GB3815@jama>
References: <20170908134802.13519-1-mac@mcrowe.com>
	<20170922113415.5zum55yffbyzci7d@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20170922113415.5zum55yffbyzci7d@mcrowe.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qtbase-native: Force use of built-in pcre
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
X-List-Received-Date: Fri, 22 Sep 2017 12:52:56 -0000
X-Groupsio-MsgNum: 68997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline

--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2017 at 12:34:15PM +0100, Mike Crowe wrote:
> On Friday 08 September 2017 at 14:48:02 +0100, Mike Crowe wrote:
> > If we specify neither -system-pcre nor -qt-pcre then qtbase will first =
see
> > if it can find the pcre library in the system and fall back to compiling
> > its own if that's not possible.
> >=20
> > Unfortunately, this means that if qtbase-native happens to be built on a
> > machine with system pcre available then the resulting binaries such as
> > bin/qt5/uic in sstate files won't work correctly on machines that don't
> > have pcre available. Even ignoring that, it doesn't help for packages to
> > build differently depending on how the build system is configured.
> >=20
> > We could depend on pcre-native and pass -system-pcre, but this doesn't =
work
> > by default because qtbase actually requires pcre16 which is an optional
> > (via PACKAGECONFIG) feature of pcre so the default there would need to =
be
> > changed too.
> >=20
> > So, let's make qtbase-native match the default of qtbase by passing
> > -qt-pcre in order to ensure that qtbase-native is always built with its
> > own pcre implementation.
> >=20
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  recipes-qt/qt5/qtbase-native_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbas=
e-native_git.bb
> > index 54a0b78..0951ede 100644
> > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > @@ -46,6 +46,7 @@ PACKAGECONFIG_CONFARGS =3D " \
> >      -sysroot ${STAGING_DIR_NATIVE} \
> >      -no-gcc-sysroot \
> >      -system-zlib \
> > +    -qt-pcre \
> >      -no-libjpeg \
> >      -no-libpng \
> >      -no-gif \
>=20
> Does anyone have any objections to this?
>=20
> We've been using it for several weeks now and it's not caused any observed
> problems.

It's already merged:
https://github.com/meta-qt5/meta-qt5/commit/743b3b93e17f5382fd1f9f4e0d29325=
01c8a3c78

>=20
> Thanks.
>=20
> Mike.
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWcUIPgAKCRA3VSO3ZXaA
HAUWAKCaSMkYCrHJ0nBg++F8qL7wBLt+wQCfR4cEm/8gzQG7t9mp1GUK0BFDcTk=
=VTS0
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
