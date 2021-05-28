Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5669.1622190599008766399
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 01:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qnym1GaS;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id z17so2413969wrq.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 May 2021 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mLA3HxRYvtNNwKKtH5+it8jLAn8sOd9zQpPPTpaSY7g=;
        b=Qnym1GaSPURvOL3mADeJRSxwFt6sAdQ11mN6blR29U0KAhQ6BprwMGkIxfxznU7OGZ
         Seh81JfbtpIMINFJWG0PArBemLPb7dAFQc5JSola1GWOzS2N9h2rMgPEY2nksw4KkXUW
         TfpbAsr55bSiyl0I+1DS7DGqrtH+mG6bFivI8OFRg9Ow4BQ7eFVr0DFj1qGfTdKnOSkn
         c1zATFb7CFHnv5pQPtiwtxDnMmSJEKWtuQv9tgXk5W+OMgXauvkBZGx1fc3+p5X/Jcty
         y+qSNtIgzCG5RXJ9GeNM4I2jTk+3ed6pAdmkjpjameDGrVukQKi420FqI2tYddYFacgi
         X3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mLA3HxRYvtNNwKKtH5+it8jLAn8sOd9zQpPPTpaSY7g=;
        b=tIwDpbUwbnn44rEiWG2EfXI2smIDDlWL2BUmu82V6+iVoupNahknxjjkktzIPsFDQ5
         hrhGaX27KVokHhKAl0pbamQ84Zu2McLQDpbAbd56mxhjE933GJn5/5AuYrnW+NDpTLnb
         3N9Z1zQjYgdjFynzRtL55N0PrzNkE440ill6slc9DOjjxEe734PlG1t8wYVn7IlN4FA+
         i6itF1QzsGZlBGZEOqKMGsi7EaLHWd8Ep2e8jsscuz0W/2D+nblFHVg5OFJADQkAnqvc
         nSo++DA1T9ggbl2mIa6sY0QlDCSXfW4mi+OAZghh4AyTFhC1Riakj/cSaSiUGeqk3eYX
         h2aA==
X-Gm-Message-State: AOAM533dDVKzxAq3hDAciSKp/pO4grd3OMgX9dsP1nvgI1Xa9qhyB1+5
	eJ26O6RKERScQ2nImapumJo=
X-Google-Smtp-Source: ABdhPJwtofxGyOkwWgKz6RW7GTq5XSL6hFHF5oNcc+/4gHT9R1Puo7B05y+/nwW0Iz5KOKj1Mj4lAQ==
X-Received: by 2002:a5d:5109:: with SMTP id s9mr7327218wrt.231.1622190597242;
        Fri, 28 May 2021 01:29:57 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b188sm577188wmh.18.2021.05.28.01.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 01:29:56 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 28 May 2021 10:29:56 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] sdbus-cpp: Do not fetch googletest on the fly
Message-ID: <20210528082956.c6fvgcrkk5rvnd7m@jama>
References: <20210528003936.568907-1-raj.khem@gmail.com>
 <20210528003936.568907-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210528003936.568907-2-raj.khem@gmail.com>
X-Groupsio-MsgNum: 91601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i7mwfj4geok4pfsu"
Content-Disposition: inline

--i7mwfj4geok4pfsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 05:39:36PM -0700, Khem Raj wrote:
> This package downloads code ( gtest ) post do_fetch task
>=20
> Now this is checked out by bitbake fetcher into decided source directory,
> this ensures reproducibility
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fetch googletest via bitbake
>=20
>  ...-Do-not-download-gtest-automatically.patch | 44 +++++++++++++++++++
>  .../recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb | 10 ++++-
>  2 files changed, 52 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-D=
o-not-download-gtest-automatically.patch
>=20
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb b/meta-oe/=
recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> index 98829765c2..91cf70c911 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1803fa9c2c3ce8=
cb06b4861d75310742"
>  inherit cmake pkgconfig systemd ptest
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'with-external-libsystemd', 'with-builtin-libsystemd', d)} \
> -                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-test=
s', '', d)}"
> +                   ${@bb.utils.contains('PTEST_ENABLED', '0', 'with-test=
s', '', d)}"

^ is this change intentional?

>  PACKAGECONFIG[with-builtin-libsystemd] =3D ",,sdbus-c++-libsystemd,libca=
p"
>  PACKAGECONFIG[with-external-libsystemd] =3D ",,systemd,libsystemd"
>  PACKAGECONFIG[with-tests] =3D "-DBUILD_TESTS=3DON -DTESTS_INSTALL_PATH=
=3D${libdir}/${BPN}/tests,-DBUILD_TESTS=3DOFF"

--i7mwfj4geok4pfsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYLCqAQAKCRA3VSO3ZXaA
HKlbAJ0WKsmVHLuEdatLeCZ/1Saj4KzlRgCfW2nkpcf8l2BVSbgwdix06UNBn98=
=ZgqC
-----END PGP SIGNATURE-----

--i7mwfj4geok4pfsu--
