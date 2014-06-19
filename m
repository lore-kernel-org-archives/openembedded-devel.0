Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id D5CBF6FC7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 19:26:56 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so2830445wes.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gJYk8gBXyu3w+pdklL4lJDN4fyReLP64wCP43XF11ys=;
	b=K2wgevnOn6I5N5UDpzY3Ww58KDCwZqHfQAIYjnAmEYOuzMJPgPV6DvCemQcSsubDUZ
	4ldNOCVW0mebr6AIoOp0FIRWRKtAFNCMuoMSImLSAjix0TOHXOHNZWgHdMdWcvgV/1uJ
	tgG2VfJYqEsy/jQBue4ZIdZxhvyyWaaDt/NjoL4oAtasCnkGw4J2w98NcDCCAMi8g/ZV
	vC7AoDfdFCbzxkIqj8EG/HQJgNIqDgy6cyVl4MvnPRflFyaGs2GqytxzEJCWYuKCLLRg
	UF+lNAQByA28r0/3Gh2NWZ7r+LCSgzRsiV13rLl3Ak5EvjXAMN/toN2Q9XIVpLkfA7C/
	2LyQ==
X-Received: by 10.181.11.193 with SMTP id ek1mr9126770wid.15.1403206017599;
	Thu, 19 Jun 2014 12:26:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am10sm10586532wjc.45.2014.06.19.12.26.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 12:26:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 21:26:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140619192658.GS2117@jama>
References: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACgAsMdhMQFewxK6e+Ja8hNUcSUMjL0Xe7WWL-W_EsDSa7sYjQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 19 Jun 2014 19:27:02 -0000
X-Groupsio-MsgNum: 50458
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H88uUF932U8Oj0a6"
Content-Disposition: inline

--H88uUF932U8Oj0a6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 02:49:59PM -0400, Kevyn-Alexandre Par=E9 wrote:
> Hi,
>=20
> I started by adding all recipes into my image to try to test as much
> as possible:
>=20
>   ruby \
>   qtbase \
>   qtconnectivity \
>   qtdeclarative \
>   qtgraphicaleffects \
>   qtimageformats \
>   qtlocation \
>   qtmultimedia \
>   qtquick1 \
>   qtquickcontrols \
>   qtscript \
>   qtsensors \
>   qtserialport \
>   qtsvg \
>   qtsystems \
>   qttools \
>   qtwebkit \
>   qtwebkit-examples \
>   qtx11extras \
>   qtxmlpatterns \
>   qsiv \
>   packagegroup-qt5-qtcreator-debug \
>   packagegroup-qt5-toolchain-target \
>   meta-toolchain-qt5 \
>   maliit-framework-qt5 \
>   maliit-plugins-qt5 \
>   cinematicexperience \

recipe-name !=3D package-name, check which packages were created by those
recipes and include those in your image.

> Then start removing these with error:
>=20
> ERROR: qtwebkit-examples_5.2.1.bb, do_configure) failed with exit code '1'
> LOG: http://pastebin.com/qnNStaBE
>=20
> Remove qtwebkit-examples
> ERROR: qtgraphicaleffects not found in the base feeds
> ERROR: Function failed: do_rootfs
> LOG: http://pastebin.com/FTuE5xzg
>=20
> Remove qtgraphicaleffects
> ERROR: meta-toolchain-qt5 not found in the base feeds
> ERROR: Function failed: do_rootfs
> This one I was expecting it to fail since it's the toolchain...
>=20
> Remove meta-toolchain-qt5
> ERROR: qtwebkit not found in the base feeds
> ERROR: Function failed: do_rootfs
> LOG: http://pastebin.com/ZpKC5xwU
>=20
> Remove qtwebkit
> ERROR: qtquickcontrols not found in the base feeds
> ERROR: Function failed: do_rootfs
> LOG: http://pastebin.com/S2Zn1WMj
>=20
> Remove qtquickcontrols
> ERROR: Unable to install packages
> error: Can't install qtwebkit-dev-5.2.1-r0@armv7a_vfp_neon: no package
> provides qtwebkit =3D 5.2.1-r0
> ERROR: Function failed: do_rootfs
> LOG: http://pastebin.com/E7DspaJy
>=20
> So I drastically remove  all these to have image that complete.
>  qtx11extras
>  qtxmlpatterns
>  qsiv
>  packagegroup-qt5-qtcreator-debug
>  packagegroup-qt5-toolchain-target
>  maliit-framework-qt5
>  maliit-plugins-qt5
>  cinematicexperience
>=20
> [1] What will be the recommended recipes to enable to have an image
> that contain the defaults setup settings as when we download the qt
> for desktop (qt-opensource-linux-x64-1.6.0-3-online.run)?
>=20
> [2] Any idea why I'm having these do_rootfs error?
>=20
> [3] What I'm trying to do is replicate what QtDD13 - Andy Nichols -
> Developing Embedded Linux Applications with Qt
> (https://www.youtube.com/watch?v=3DlyQVw1RtaH4) have done with
> buildroot. Any advise on how to proceed?
>=20
> BR,
>=20
> -KA
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H88uUF932U8Oj0a6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOjOYIACgkQN1Ujt2V2gByNvQCfbg4/MX434Exu1zJdZxKUmkRW
+kcAoJPxj4sR2NnJdyyMmEsXqdfbZ2+h
=dFSn
-----END PGP SIGNATURE-----

--H88uUF932U8Oj0a6--
