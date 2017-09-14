Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7D725784F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 14:44:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f4so312708wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 07:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K3GllEpKZ7O29YRtzQ6bIuGApB9fEjgCGRH93re6lMM=;
	b=ii6k1/WxbiO7B6WwMnFp0Ck1DjCgwTb6+FbXVWM7S/73A6qFJu6KyhG0ZIW2FBrkF4
	fX7W410j2AwJGITaKtygac1jlpK1wONUwdYXZYcZhO7fvnOBC+m+DEuE2tO3DVHLHl/8
	lzkzcuzUlXPfDBnJjBMMnG0ZtJsSpbDc/JZftru8uvs4vDyk2UY1qfrZZVSBqKQUTKoO
	O9Jgd9tMkd36y5BV1fc8Ldd0hjn+p4WY9LcReX0Qey7D27qhzIsc15ImW5GoI3p7+ZuI
	/RxbnV7VpJpyYEyOFT3HhCEKesVWlP+ZlYlose3zwPmFHDG0ACUsP/PmF0X59yEpDsqk
	S3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K3GllEpKZ7O29YRtzQ6bIuGApB9fEjgCGRH93re6lMM=;
	b=dczGxk/Q/uaH8ImWVVJW3Nz8QvICZVNKBGMHPgImR2jgYLMQo7P/Z8guwtyuaxh8LG
	XL/GchX8SK8d8h+nykWKlNEGn5ubyxvxbFNA1KHZPOFfDfT7WqW+M5S7LzCZsGSgT0Eq
	bbG7BY7g8lbG4LoLvs1Q+MpKLJJzy3c2FhXWK9BZEqyfwOhyHNLEyurpAO4S2OPnmVUS
	wvJ9s03a34A3Pe9s3W6GnYo3qkqZi2AhrtZuEqNSKWOlXaVYEJxW7/x0Te0Etf439wSG
	M88N+fQHfMr3czscmAm84c7rldr8FlZY+VCpooDA2nVFCsEmijvBmIJxmLxkhMK93gI5
	SEZA==
X-Gm-Message-State: AHPjjUiMfOy7kbUnG0nu5VIzJX8kecZT0p/LGlZu3IsAzqEzts9pIyfR
	/6U61ioU3Uok5A==
X-Google-Smtp-Source: AOwi7QCuRCA5MLHnd4sciUgllnZQPtlfsWP+WWBe0twhpGmC9tm7YmZAt44iCPy3wyE4dn3XikVAjQ==
X-Received: by 10.28.23.76 with SMTP id 73mr280406wmx.70.1505400242293;
	Thu, 14 Sep 2017 07:44:02 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m86sm189256wmi.27.2017.09.14.07.44.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 07:44:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Sep 2017 16:46:22 +0200
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20170914144622.GA3292@jama>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
	<bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
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
X-List-Received-Date: Thu, 14 Sep 2017 14:44:01 -0000
X-Groupsio-MsgNum: 68808
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2017 at 08:01:49AM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Fabien Lahoudere
> > Sent: den 13 september 2017 22:06
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
> >=20
> > In order to build gerbera, we need to support libupnp >=3D 1.8.
> > However mpd won't build with this version probably due to API break.
>=20
> Wouldn't it be more appropriate to copy the current libupnp 1.6 recipe=20
> to libupnp16 and then update the libupnp recipe to 1.8? Presumably we=20
> want to get rid of the 1.6 version whenever mpd is updated to support=20
> the new API.

Makes sense, I've renamed it in master-next.

I've also noticed that libupnp is optionally used by vlc, that's not
tested by my world builds, because PACKAGECONFIG for it isn't enabled by
default, but maybe vlc is also incompatible with libupnp 1.8.

> > So we add a new recipe libupnp1.8 to be able to use both version.
> > Both version can be run in parallel.
> >=20
> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
> > neon/libupnp_1.6.21-r0_armhf.deb
> > drwxrwxrwx root/root         0 2017-09-13 17:26 ./
> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/
> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/lib/
> > -rwxr-xr-x root/root     31600 2017-09-13 17:26
> > ./usr/lib/libixml.so.2.0.8
> > -rwxr-xr-x root/root     17912 2017-09-13 17:26
> > ./usr/lib/libthreadutil.so.6.0.4
> > -rwxr-xr-x root/root    117676 2017-09-13 17:26
> > ./usr/lib/libupnp.so.6.3.4
> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libixml.so.2
> > -> libixml.so.2.0.8
> > lrwxrwxrwx root/root         0 2017-09-13 17:26
> > ./usr/lib/libthreadutil.so.6 -> libthreadutil.so.6.0.4
> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libupnp.so.6
> > -> libupnp.so.6.3.4
> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
> > neon/libupnp1.8_1.8.2-r0_armhf.deb
> > drwxrwxrwx root/root         0 2017-09-13 17:43 ./
> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/
> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/lib/
> > -rwxr-xr-x root/root     35696 2017-09-13 17:43
> > ./usr/lib/libixml.so.10.0.1
> > -rwxr-xr-x root/root    155128 2017-09-13 17:43
> > ./usr/lib/libupnp.so.10.1.1
> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libixml.so.10
> > -> libixml.so.10.0.1
> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libupnp.so.10
> > -> libupnp.so.10.1.1
> >=20
> > mpd and gerbera have been built successfully with this fix.
> >=20
> > The patch also clean a bit gerbera recipe and fix dependency issue.
> >=20
> > Changes since v3:
> > 	- Drop RDEPENDS from gerbera recipe.
> > 	- use git fetcher instead of github archive for libupnp
> >=20
> > Fabien Lahoudere (2):
> >   libupnp: Add recipe for version 1.8.2
> >   gerbera: clean recipe
> >=20
> >  .../recipes-connectivity/libupnp/libupnp1.8.bb       | 20
> > ++++++++++++++++++++
> >  .../recipes-multimedia/gerbera/gerbera_git.bb        | 12 ++++++------
> >  2 files changed, 26 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-multimedia/recipes-
> > connectivity/libupnp/libupnp1.8.bb
> >=20
> > --
> > 2.11.0
>=20
> //Peter
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbqWPQAKCRA3VSO3ZXaA
HGlRAJwOOYwEX4ej4SF9JvG+e+gUQfAXxQCgqrGdza0J9JzOzEhFxwJlwDpyFRs=
=Gmin
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
