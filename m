Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.299.1587780158319417858
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 19:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lU/TpjdL;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id d24so4429329pll.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 19:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=GsnGpqYZSFeJqBhzKhx0UDuYFj41G9U6eV64atVWviQ=;
        b=lU/TpjdL+TWQRk3EW9bjVIC4S4ogQEozu5EWujdqyaNpv4fWwYY/o0mVh1neuYsRLe
         FLnLVhi6EOzWdofz9RJxre9FFNl11/omLodU0SZUTKu4lzPpMbkor0yWh36ChthLZBUz
         1axqEIiPvWHyY5FTvEcM8s2cO/+7rZi+HwuSgvosV+w7TNk9YQKE8ZbVBZh8zvUK6Gtj
         eVZoTRNXMShf+EYQzYq/z+KMo9e4FSVNmNajDHdI4AI/ubD3IXX2kiu28HOoDsDz4Qym
         KCghwrD0OZbnmG/Oz2Sk2Hj/yBAAkHyjCa9ZNm48pqfpe4f+2tSvBo/5TqF5GQTGjEL7
         UAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=GsnGpqYZSFeJqBhzKhx0UDuYFj41G9U6eV64atVWviQ=;
        b=jEhA2XNpiFiNlMh8JNd7CwaCJrTpqEhxoCBM4DPh8LryMMBoST7FUj62TdIQ100UeS
         LyDlm4llQwlWs0jRRQ94zqqSpkfl50Dj40YQtYh63rR7BeSehaomU6xFny28xYb0pzEw
         5oxMmU7SpvIKIU8PpthXRPx7WvPUucsZxmMF+yDu58Cz4xTSZBYb2u/ooED/sS1ga5fS
         foB7vi6u7i/45KnABAt4R2C6YFOi9EOu1q+E335q1H1vJMYmdu+FG0atZBw8+CswSYMU
         1NpBLPqm9iYOhonNY8z3Pd21/+bXeC3j8JACQR/QgNbFgSOPf9BpnQfvG75RyZk6Mc0M
         0jLQ==
X-Gm-Message-State: AGi0PuYp/n1XYHvt0PzRK1aEcYeGWbJTkxqSPdLagUWVIrQn4UmpxbnN
	Xydoag6wTnPB+Y0m5e4r3saOCdy/pVM=
X-Google-Smtp-Source: APiQypKmmOUm9sBVym7dibx3O9DZm9xlmd3iQi2CzdaLSvGwr8zsS0iFScstyWI0OaIcJ1pficvJ7Q==
X-Received: by 2002:a17:902:8485:: with SMTP id c5mr12683745plo.242.1587780157552;
        Fri, 24 Apr 2020 19:02:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id t126sm6693950pfb.29.2020.04.24.19.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 19:02:37 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] cjson: add recipe for v1.7.13
To: Ting Liu <ting.liu@nxp.com>, openembedded-devel@lists.openembedded.org
References: <20200424065545.28012-1-ting.liu@nxp.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <8f6b2032-a2f4-2785-afdf-188ad9f3ec75@gmail.com>
Date: Fri, 24 Apr 2020 19:02:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424065545.28012-1-ting.liu@nxp.com>
X-Groupsio-MsgNum: 84077
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="KhuDBoMV62D32OKZJygVOmwHgahNmILBa"

--KhuDBoMV62D32OKZJygVOmwHgahNmILBa
Content-Type: multipart/mixed; boundary="JAgB3J0HByrGNLlw5kynR4TVW0QITnW6j";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ting Liu <ting.liu@nxp.com>, openembedded-devel@lists.openembedded.org
Message-ID: <8f6b2032-a2f4-2785-afdf-188ad9f3ec75@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cjson: add recipe for v1.7.13
References: <20200424065545.28012-1-ting.liu@nxp.com>
In-Reply-To: <20200424065545.28012-1-ting.liu@nxp.com>

--JAgB3J0HByrGNLlw5kynR4TVW0QITnW6j
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/23/20 11:55 PM, Ting Liu wrote:
> From: Ting Liu <ting.liu@nxp.com>
>=20
> cJSON aims to be the dumbest possible parser that you can get your
> job done with. It's a single file of C, and a single header file.
>=20
> Homepage: https://github.com/DaveGamble/cJSON
>=20
> Signed-off-by: Ting Liu <ting.liu@nxp.com>
> ---
>  meta-oe/recipes-devtools/cjson/cjson_git.bb | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cjson/cjson_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/cjson/cjson_git.bb b/meta-oe/recip=
es-devtools/cjson/cjson_git.bb
> new file mode 100644
> index 000000000..7a9ebf07b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cjson/cjson_git.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "Ultralightweight JSON parser in ANSI C"
> +AUTHOR =3D "Dave Gamble"
> +HOMEPAGE =3D "https://github.com/DaveGamble/cJSON"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D218947f77e8cb8e2fa02918dc41c=
50d0"
> +
> +SRC_URI =3D "git://github.com/DaveGamble/cJSON.git"
> +SRCREV =3D "39853e5148dad8dc5d32ea2b00943cf4a0c6f120"
> +

Pleae set PV =3D "1.7.13" if thats what SRCREV is pointing to

> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE +=3D "\
> +    -DENABLE_CUSTOM_COMPILER_FLAGS=3DOFF \
> +    -DBUILD_SHARED_AND_STATIC_LIBS=3DOn \
> +"
> +
> +FILES_${PN}-dev +=3D "\
> +    ${libdir}/cmake \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>=20

There are few more implementations around see
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dcjson

please consolidate best changes from all of them so they can also use
this version.

>=20
>=20
>=20


--JAgB3J0HByrGNLlw5kynR4TVW0QITnW6j--

--KhuDBoMV62D32OKZJygVOmwHgahNmILBa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqOaOAAKCRC7BTNVkZ0z
FGHUAJwLBDIsA/iIH2nvkC39kq5hBrPRXQCeL05F67UtMif01GLr2f2pZdg2a1M=
=HR6Y
-----END PGP SIGNATURE-----

--KhuDBoMV62D32OKZJygVOmwHgahNmILBa--
