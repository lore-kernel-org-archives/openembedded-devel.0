Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1788.1617727060992316301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 09:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WdYMtOgJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w3so22975306ejc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Apr 2021 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uh0/s5sJpDNL7jRhYl2nceYKeQwWjbdhyfJS/izzENs=;
        b=WdYMtOgJcbFECnCX2Bktb/vLGrA5RSxFdVO/UEPGb2krtD3M8qp6oAw2ukUNBbFg44
         rfupcp0UoXzoEMKbS9E/i7Ti2MwNkSMapFb+yPVTSU7RSLC8Rrq8i8btJ1I0V+F+OnXS
         KZKOBplONAPTDKz/fB56KVnESGrWGZS07mFuDhA22Jf89nR501gCtOc5LzRmwCZJQ6/k
         7WETfmX/gS+oPu5QBXP5r043S0OkM62BAXrv7kA9SQo5sStrLVwNXkr1zba+zfrtGema
         W7L/ptUZrowKPTrnaY3po/P93zhmaYa1/HO1/Mqk9AJEunFfuM5e19qjzc+uuB2W3eBJ
         LAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uh0/s5sJpDNL7jRhYl2nceYKeQwWjbdhyfJS/izzENs=;
        b=MgGcylJD23vwWg/SruMSxQGwlkIbhs62G/gjxjNOA0KeKfXiVeWZBgbmX2G2mu5xqr
         WIPgZ9wstmCtZ0GvNX1QotQu8iDa0gfkWa1MfX34hNpM11n4QD1+20hqccR80DY6TJ94
         ybblLfQ8WsUrKrxFq/GAG6NZzfNLeF/klPOxk8MRxPdbOzEIWqh3nJw4BuoEgNHwrBNx
         E1ReN//RgYQAjd3LlgOAVK2ytNy/RWV7uI9jzCFQdyqqJNnGp5tKHcO21yQKhs02rgt6
         O82KeBqujmzlR/dV2Wgu1EIB689MPvdKfW3p9FRkGM4ZocjUGRXrbKz+hqfnVRt8wb22
         aFsg==
X-Gm-Message-State: AOAM530htVUIqPTSxRXYNhOZ2uhfZHC6FO3chXUQNaYGd6utGv42hE8R
	8zx9l7O05EXFUbp2+IOaZfKFCQJa7b0=
X-Google-Smtp-Source: ABdhPJzvahgVA68ACXZBy0KGnrPINyCjrXliLM0AvUVY6fbwWVe9jp8KayerzBPGLHmIsoBdkrGCXw==
X-Received: by 2002:a17:906:6a45:: with SMTP id n5mr13443499ejs.191.1617727059587;
        Tue, 06 Apr 2021 09:37:39 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jj15sm11336401ejc.99.2021.04.06.09.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 09:37:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Apr 2021 18:37:38 +0200
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [Dunfell patch review 00/11] April 05
Message-ID: <20210406163738.nhjoncgzl6xvcwyj@jama>
References: <cover.1617634345.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
X-Groupsio-MsgNum: 90580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hb6r25p3dhbm62k3"
Content-Disposition: inline

--hb6r25p3dhbm62k3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 05, 2021 at 07:54:13AM -0700, akuster wrote:
> Most of these where patches already sent to the list so a shorter review=
 window.
> Please have comments back by this Tuesday.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> The following changes since commit d9c703aab817eb30d8a0d2c5caba29530880d=
1aa:
>=20
>   opencv: Security fixes (2021-03-11 21:20:01 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nu=
t
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable=
/dunfell-nut
>=20
> Aditya.Tayade (1):
>   neon: Add ptest
>=20
> Armin Kuster (1):
>   wireguard: fix build issue with updated 5.4 kernel
>=20
> Marek Vasut (1):
>   freerdp: Add missing libxkbcommon WL dependency
>=20
> Martin Jansa (5):
>   opencv: refresh patches with devtool to apply cleanly
>   ceres-solver: prevent fetching git hook during do_configure
>   packagegroup-meta-oe: include nodejs without meta-python2 conditional
>   packagegroup-meta-oe: move the packages depending on meta-python2 to
>     separate packages
>   packagegroup-meta-oe: add guider
>=20
> Peace Lee (2):
>   guider: Upgrade to 3.9.7
>   Update commit for version 3.9.7
>=20
> changqing.li@windriver.com (1):
>   thin-provisioning-tools: switch branch from master to main
>=20
>  ...send-functions-were-backported-exten.patch |  32 ++++++
>  .../wireguard-module_1.0.20200401.bb          |   3 +-
>  .../packagegroups/packagegroup-meta-oe.bb     |  37 +++++--
>  .../recipes-devtools/guider/guider_3.9.6.bb   |  39 -------
>  .../recipes-devtools/guider/guider_3.9.7.bb   |  19 ++++
>  .../ceres-solver/ceres-solver_1.14.0.bb       |   8 ++
>  .../recipes-support/freerdp/freerdp_git.bb    |   2 +-
>  meta-oe/recipes-support/neon/neon/run-ptest   |  25 +++++
>  meta-oe/recipes-support/neon/neon_0.30.2.bb   |  15 ++-
>  ...dparty-ippicv-Use-pre-downloaded-ipp.patch |   4 +-
>  .../opencv/opencv/0001-Dont-use-isystem.patch |   4 +-
>  ...-around-deprecated-ffmpeg-RAW-functi.patch |   4 +-
>  ...-ipcp-unit-growth-with-ipa-cp-unit-g.patch |   9 +-
>  ...reate-share-library-intead-of-static.patch |   4 +-
>  .../0003-To-fix-errors-as-following.patch     |   8 +-
>  .../opencv/opencv/CVE-2019-14491.patch        |  56 +++++-----
>  .../opencv/opencv/CVE-2019-14493.patch        | 104 +++++++++---------
>  .../opencv/opencv/CVE-2019-15939.patch        |  20 ++--
>  .../opencv/opencv/CVE-2019-19624.patch        |  22 ++--
>  .../opencv/opencv/download.patch              |   9 ++
>  .../thin-provisioning-tools_0.8.5.bb          |   2 +-
>  21 files changed, 256 insertions(+), 170 deletions(-)
>  create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-=
compat-icmp_ndo_send-functions-were-backported-exten.patch
>  delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
>  create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>  create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest
>=20
> --=20
> 2.17.1
>=20

>=20
>=20
>=20


--hb6r25p3dhbm62k3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYGyOUAAKCRA3VSO3ZXaA
HLvAAKCvBojIicsd8yaUq4BQ1+ch4jpc+wCfeLe6aNyBMeWLDeGRWGHhlh+8LFo=
=Eq6E
-----END PGP SIGNATURE-----

--hb6r25p3dhbm62k3--
