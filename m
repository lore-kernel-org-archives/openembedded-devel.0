Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.70.1614100365134542823
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:12:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NNIphBw9;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id k13so33853877ejs.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 09:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gTR+ddkO6jD0DVE/8elY+L2qg+KRivEsfGFQcREJu5E=;
        b=NNIphBw9qNY9oyN1xNuVo++yCb4/zeeHsee0NpIFff7jYWsmgjlJ1wMvYc6XaiTokf
         Tj9KeiJ0f5TcRvikqU4DQSaVX54LGQz3v2TSBINnpYV5xSpTRoM331/gOKzg6N/Bjmzv
         M5ZdDSF10cxezJrZyXwnW7a6Unjp6iHo1CwTaGm4JCQQvd+XwximkzsJxj3DAw9Ocppp
         AQosw8jTyTSDiL9SB+k6iQLnrZq+1Rm+3KWiJQ2hfJBlDoRpQ/K/y3dEnYSAM0MFgJjT
         o2Kokqy/m4fpTTWuW8Q84ewC8qWgUaYVpmYWAjHBt3rAbOvNNmjQ+OXicJXKqmi15dV9
         xyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gTR+ddkO6jD0DVE/8elY+L2qg+KRivEsfGFQcREJu5E=;
        b=sss1Q7lRg4QDsMMj+QcbrFXMYqu/PS9LCblSyAru+SPpW/no0GUH5Pn9j1QMT1jOoV
         y2V9gpFimg0cTNeRxpJIaT17KZVh8fnwxcmNwgBeuULNaF0BsrAKJ4rK+FuJiyqiLDt3
         6dCkKK7CcIUl7HeFfn/KnTRjSPFzOuKGIdEBONi3ZjcvVen8x/bdF+RwBTLd11UPjt5R
         wuCjTQCO2s03FbmCjNw95evP3UL3p4i3ONW1lYZLpOdfxaloIMBsoh2BopYV6fQGrJYC
         hT888kiFEblRac91SikbgqeGw2jV3qJm+bUAGAGRomMtjepxOAxzm10t7Ll+AhtCE9Aj
         OkgQ==
X-Gm-Message-State: AOAM530svqTe0SAgXXwNgSqpElpY8V/hJ/DA2aMbtk2yhV1SihOOLwch
	BSh8HpwjhQpY/uEUnXMH5Ss=
X-Google-Smtp-Source: ABdhPJxySYiojw0ZCWig4BNH24Jzp5JVykF5dBgw/SPTk8TZc5J2/s0Fucz28JOSJUyFdJtJpLezxA==
X-Received: by 2002:a17:906:7f16:: with SMTP id d22mr10265028ejr.5.1614100363620;
        Tue, 23 Feb 2021 09:12:43 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k4sm11046214ejv.73.2021.02.23.09.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 09:12:42 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2021 18:12:42 +0100
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Message-ID: <20210223171242.csn2hwn6imsn4ega@jama>
References: <20210223162705.2595483-1-andrei@gherzan.com>
MIME-Version: 1.0
In-Reply-To: <20210223162705.2595483-1-andrei@gherzan.com>
X-Groupsio-MsgNum: 89684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ptexkns6vgp3qac"
Content-Disposition: inline

--4ptexkns6vgp3qac
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> From: Khem Raj <raj.khem@gmail.com>
>=20
> We are seeing warnigs with gcc-10 even on target builds e.g.

Do you use gcc-10 in dunfell builds?

dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
backports or the warning is reproducible also with gcc-9, but I'm not
seeing nss failures in my dunfell builds.

Cheers,

>=20
> | In file included from nsinstall.c:20:
> | /usr/include/unistd.h:520:14: note: in a call to function =E2=80=98get=
cwd=E2=80=99 declared with attribute =E2=80=98write_only (1, 2)=E2=80=99
> |   520 | extern char *getcwd (char *__buf, size_t __size) __THROW __wur
> |       |              ^~~~~~
> | nsinstall.c:70:16: error: argument 1 is null but the corresponding siz=
e argument 2 value is 4096 [-Werror=3Dnonnull]
> |    70 | #define GETCWD getcwd
> |       |                ^
> | nsinstall.c:246:13: note: in expansion of macro =E2=80=98GETCWD=E2=80=
=99
> |   246 |     todir =3D GETCWD(0, PATH_MAX);
> |       |             ^~~~~~
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/nss/nss_3.51.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes=
-support/nss/nss_3.51.1.bb
> index 3e3c3a3fd..348c2c13f 100644
> --- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> @@ -62,7 +62,6 @@ do_configure_prepend_libc-musl () {
>  do_compile_prepend_class-native() {
>      export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR_NATIVE}/nspr
>      export NSPR_LIB_DIR=3D${STAGING_LIBDIR_NATIVE}
> -    export NSS_ENABLE_WERROR=3D0
>  }
>  
>  do_compile_prepend_class-nativesdk() {
> @@ -76,6 +75,7 @@ do_compile_prepend_class-native() {
>  
>  do_compile() {
>      export NSPR_INCLUDE_DIR=3D${STAGING_INCDIR}/nspr
> +    export NSS_ENABLE_WERROR=3D0
>  
>      export CROSS_COMPILE=3D1
>      export NATIVE_CC=3D"${BUILD_CC}"
> --=20
> 2.30.1
>=20

>=20
>=20
>=20


--4ptexkns6vgp3qac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYDU3iAAKCRA3VSO3ZXaA
HIzQAJ0agQAr+KVDS9EHQyBbUyeU2NWyqACffZxyRGoc1g984O1QyP019xlTwtA=
=T+YI
-----END PGP SIGNATURE-----

--4ptexkns6vgp3qac--
