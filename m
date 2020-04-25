Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.198.1587779647956828916
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 18:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RzTgdqX+;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id h69so5504533pgc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=iYbQQ/S/ZMGopEnWnd8gHtcLVFhZNOX9Nc/ZwTc2XOU=;
        b=RzTgdqX+QB+M1QfbAvnKo29HEuxX1wYbbaBVxhLzZFACvJ28UvnYc6RuB5jo0oDSAp
         b2jkG/nLCiPwtfXH7Niey79DTp03fPVDdhUbIxO2OOVcxHqHWfhmqQr0V9qB1rsxrnns
         hqUdUvsADusmwv8lBtbsYCV1EllAGh7IpM/gHaJ4rBQG0GfbJjJWIlaxJRX0Q1fWrAXi
         Bsgp7ng8JUltp3YvlYCwxAGBLSMGavnXOBUloVi3W8ji369K1eT0Pu0Hpxi84d1wXo2+
         UsTCCl/vM2hFJUIRnqT0dzDeJftVn+He+//rbd1Of3PMrOLnZE9Ccu41M+iKEXSV4Kih
         pBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=iYbQQ/S/ZMGopEnWnd8gHtcLVFhZNOX9Nc/ZwTc2XOU=;
        b=BdOfdw5Qi+cdcJTHj7vvBr1i6teFPN6dedEZhQZXgXiDX4ny/wnbt4f0kmmt2VAG7D
         1TvqmE4cZUDeL3e6CeINh8NK5IvbaEbZKabZwFsJiFFG2OQYdcRPVAHpj3mGhwTS7PIN
         orPl2Xy5ftFJ3kkyLnaXOeo8NI9kuCucDGekLV9w16wnzvGSlq88vqGeLU/niTuUDwjh
         LLaT/A7A5e0Ou789jMbmu/q0+Skia46O9qrq16vjbbraAeC4/uRRvo6u6D/rkkrVJbzJ
         xWWPsG/T1H6Qa+j94urWVl3+xfL96NKW/MmHSmqm44zffp3MvG4Wur2WAhaNq4Wjmlpj
         EZ4Q==
X-Gm-Message-State: AGi0PuaNhhO87Y8zXeTZucJZIT1S6XjsUie1n188+YKb/zcjXJoCEv3p
	P2w3sBaRKznSLp67m2jIV6cy86N7XyM=
X-Google-Smtp-Source: APiQypJHtqkSeQdo8fMHX0DLiT+r8dtx/Sb437SGQqCa1Za6tJUBzjfOrDSNNTmm+22VCpaGfMM0EA==
X-Received: by 2002:a62:38cc:: with SMTP id f195mr12641879pfa.85.1587779647055;
        Fri, 24 Apr 2020 18:54:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id i14sm5929642pgh.47.2020.04.24.18.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 18:54:06 -0700 (PDT)
Subject: Re: [oe][meta-oe][PATCH] libwebsockets: upgrade 3.2.2 -> 4.0.1
To: Martin Balik <martin.balik@siemens.com>,
 openembedded-devel@lists.openembedded.org
References: <20200423200418.10856-1-martin.balik@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <a1bd8357-97f7-f3cc-4b97-e63656c01452@gmail.com>
Date: Fri, 24 Apr 2020 18:53:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423200418.10856-1-martin.balik@siemens.com>
X-Groupsio-MsgNum: 84075
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="JWCxX335YyPcpZT0TKuQi7FHXzDwAXQTX"

--JWCxX335YyPcpZT0TKuQi7FHXzDwAXQTX
Content-Type: multipart/mixed; boundary="wKsLQtxGP8IkYWbGwsnlhJ0sJhtw7ipj3";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Balik <martin.balik@siemens.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <a1bd8357-97f7-f3cc-4b97-e63656c01452@gmail.com>
Subject: Re: [oe][meta-oe][PATCH] libwebsockets: upgrade 3.2.2 -> 4.0.1
References: <20200423200418.10856-1-martin.balik@siemens.com>
In-Reply-To: <20200423200418.10856-1-martin.balik@siemens.com>

--wKsLQtxGP8IkYWbGwsnlhJ0sJhtw7ipj3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/23/20 1:04 PM, Martin Balik wrote:
> Signed-off-by: Martin Balik <martin.balik@siemens.com>
> ---
>  .../{libwebsockets_3.2.2.bb =3D> libwebsockets_4.0.1.bb}    | 8 ++++---=
-
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_3.2.2.=
bb =3D> libwebsockets_4.0.1.bb} (86%)
>=20
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.=
2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
> similarity index 86%
> rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2=
.2.bb
> rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1=
.bb
> index 32ba51db0..0d1f57ab8 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.2.2.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.0.1.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Canonical libwebsockets.org websocket library"
>  HOMEPAGE =3D "https://libwebsockets.org/"
> -LICENSE =3D "LGPL-2.1"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ce87f3facb6f911c142c8bef9bf=
b380"
> +LICENSE =3D "MIT & Zlib & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c47b078124308a4e1354e8d59f6=
06b7"

why did checksum change ? perhaps mention the reason in commit message.

>  
>  DEPENDS =3D "zlib"
>  
>  S =3D "${WORKDIR}/git"
> -SRCREV =3D "d880fe233020b74e058cbca95b5fb67823bbf258"
> -SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttp=
s;branch=3Dv3.2-stable"
> +SRCREV =3D "6eb39388f43f6e2a27f0efcbf8cb2391e38824e9"
> +SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttp=
s;branch=3Dv4.0-stable"
>  
>  UPSTREAM_CHECK_URI =3D "https://github.com/warmcat/${BPN}/releases"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>=20
>=20
>=20
>=20


--wKsLQtxGP8IkYWbGwsnlhJ0sJhtw7ipj3--

--JWCxX335YyPcpZT0TKuQi7FHXzDwAXQTX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqOYNwAKCRC7BTNVkZ0z
FE3JAJ0QQ0Yf2/Q2iVNfpDRPW229a3COWQCfe7AzAqwJ8lVg3a3J5YF4A8GEBoQ=
=fa+a
-----END PGP SIGNATURE-----

--JWCxX335YyPcpZT0TKuQi7FHXzDwAXQTX--
