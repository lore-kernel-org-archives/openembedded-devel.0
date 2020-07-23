Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.13543.1595514624546188507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 07:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WWLA7J0o;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id o22so3147166pjw.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2020 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=4feWBG8cHhqH2EJj1FwNgr9lTv5gM7xCnw2gn6MxwME=;
        b=WWLA7J0oh4Csw9e1nuU6yU1FOj2csINz9l2y8RC3slB2BVMS1hjdH8FOp9mNdC6lir
         ePpKErKoNfB0qh6LgerQnlL3uKkwROcypG2dpFGcH26oHSzuBYztsUSFLMsmrjjfplZX
         eGlEUClJlUcPf+YGLjR+a+tqMoWKc9wUiBGTmcB54b7zEa87jy9v37BfPCw7wwUpHWW6
         NEx/fGBfVAdst4iimSfHo9nBbQPVUj+CQeBPzdQH5yRt4geMuI53+fB6x2Q8RDJxHORo
         aYpd7cEmJ0hAlaSCCXWq9Bo8K+UClZGPI78rjUhPlTffBEov54QDU03PYVEB8JA+82Rc
         4anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=4feWBG8cHhqH2EJj1FwNgr9lTv5gM7xCnw2gn6MxwME=;
        b=jnYYOqxia/4henYVTUkp0cdOVk2l0s5f2mebQzxx3BEPUnQo6as5qaz9eTseUWqJi2
         Hera3bdxHc0SsBqd4tzvGQDFtrvGjn/eBrRt/puO5UyYjJx7eOGUT59q44J1VwZbBy7m
         JEWSgGY14YHOwCF2kK4KsA4EQN+RXzv/crd03QqIuifZzgdkOlyFcef+WsD1ZOYF5+7U
         3NVVHnZvq24qymsQr4E/RAeV2riWZRLak++uJLDTrPwXgw7Ys7cgKb4HsHHgBpaHnQ3h
         JDhdwAGKBH6tZNLOJY+Ud7lmrD0DiABwhSc3j6Ky0TXIIHb/WkojAuIfThXYoEefaqmo
         81Ww==
X-Gm-Message-State: AOAM530nzf6D3urqsgZnpAur4Tiw8x/Cql5+WvXkZf1JtT8FPB2atyD6
	cykt93DOdDyYnKE5O19DIt+fC+eD/4w=
X-Google-Smtp-Source: ABdhPJwIHO+577spGfoD0pdu+KRC6vhvT/VNdfOCz2QiXBhqMjuuqhZ9Ti4wFRjEA69Ix5FupgcLIA==
X-Received: by 2002:a17:90a:db87:: with SMTP id h7mr702842pjv.159.1595514623556;
        Thu, 23 Jul 2020 07:30:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::fba5? ([2601:646:9200:4e0::fba5])
        by smtp.gmail.com with ESMTPSA id m26sm3343529pff.84.2020.07.23.07.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 07:30:22 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi and python3-uvicorn: add packages and dependencies
To: "Fagundes, Paulo" <paulohefagundes@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612195425.36226-1-paulohefagundes@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 mQGiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdLQdS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT6IYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
 Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
 4evWolFf5cMmp7kEDQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiiEkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Message-ID: <adda92d5-2ebd-e68b-b19f-84a73b0746b2@gmail.com>
Date: Thu, 23 Jul 2020 07:30:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200612195425.36226-1-paulohefagundes@gmail.com>
X-Groupsio-MsgNum: 85872
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="wsjeR84kDDknItb63ZKFlIsZOJIfBdSEm"

--wsjeR84kDDknItb63ZKFlIsZOJIfBdSEm
Content-Type: multipart/mixed; boundary="3eU2qVR9jvsleEbLwsZ2UVwX8UevzV3E6";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Fagundes, Paulo" <paulohefagundes@gmail.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <adda92d5-2ebd-e68b-b19f-84a73b0746b2@gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-fastapi and python3-uvicorn:
 add packages and dependencies
References: <20200612195425.36226-1-paulohefagundes@gmail.com>
In-Reply-To: <20200612195425.36226-1-paulohefagundes@gmail.com>

--3eU2qVR9jvsleEbLwsZ2UVwX8UevzV3E6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/12/20 12:54 PM, Fagundes, Paulo wrote:
> fastapi depends on
> - pydantic
> - starlette
>=20
> uvicorn depends on
> - click
> - h11
> - httptools
> - uvloop
> - websockets
> - wsproto
> ---
>  .../python/python3-h11_0.9.0.bb                 |  8 ++++++++
>  .../python/python3-httptools_0.1.1.bb           |  8 ++++++++
>  .../python/python3-pydantic_1.5.1.bb            | 12 ++++++++++++
>  .../python/python3-starlette_0.13.4.bb          |  8 ++++++++
>  .../python/python3-uvicorn_0.11.5.bb            | 17 +++++++++++++++++
>  .../python/python3-uvloop_0.14.0.bb             |  8 ++++++++
>  .../python/python3-wsproto_0.15.0.bb            |  8 ++++++++
>  7 files changed, 69 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-h11_0.9.=
0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-httptool=
s_0.1.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pydantic=
_1.5.1.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-starlett=
e_0.13.4.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-uvicorn_=
0.11.5.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-uvloop_0=
.14.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-wsproto_=
0.15.0.bb
>=20

all the recipes are also missing LIC_FILES_CHKSUM
so when you address other comments in v2 consider this too


> diff --git a/meta-python/recipes-devtools/python/python3-h11_0.9.0.bb b/=
meta-python/recipes-devtools/python/python3-h11_0.9.0.bb
> new file mode 100644
> index 000000000..6219032bb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-h11_0.9.0.bb
> @@ -0,0 +1,8 @@
> +SUMMARY =3D "A pure-Python, bring-your-own-I/O implementation of HTTP/1=
.1"
> +HOMEPAGE =3D "https://github.com/python-hyper/h11"
> +LICENSE =3D "MIT"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "53affae306153388512040e038519fa3"
> +SRC_URI[sha256sum] =3D "33d4bca7be0fa039f4e84d50ab00531047e53d6ee8ffbc8=
3501ea602c169cae1"
> diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1=
.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> new file mode 100644
> index 000000000..cd4ac2dda
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
> @@ -0,0 +1,8 @@
> +SUMMARY =3D "A collection of framework independent HTTP protocol utils"
> +HOMEPAGE =3D "https://github.com/MagicStack/httptools"
> +LICENSE =3D "MIT"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "063a9b6f8c79cf5f11592e7a49715275"
> +SRC_URI[sha256sum] =3D "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b=
82b9bd4f0bf7497ce"
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.5.1.=
bb b/meta-python/recipes-devtools/python/python3-pydantic_1.5.1.bb
> new file mode 100644
> index 000000000..4a627e2d4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_1.5.1.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Data validation and settings management using python 3.6 t=
ype hinting"
> +HOMEPAGE =3D "https://github.com/samuelcolvin/pydantic"
> +LICENSE =3D "MIT"
> +RDEPENDS_${PN} +=3D "\
> +    python3-image \
> +    python3-typing \
> +"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "866774950cb506f15c309875b7297240"
> +SRC_URI[sha256sum] =3D "f0018613c7a0d19df3240c2a913849786f21b6539b9f23d=
85ce4067489dfacfa"
> diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.13.=
4.bb b/meta-python/recipes-devtools/python/python3-starlette_0.13.4.bb
> new file mode 100644
> index 000000000..78b26f655
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-starlette_0.13.4.bb
> @@ -0,0 +1,8 @@
> +SUMMARY =3D "The little ASGI library that shines"
> +HOMEPAGE =3D "https://www.starlette.io/"
> +LICENSE =3D "BSD"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "888aa6af0a42e5d1f2aeea4941e8102d"
> +SRC_URI[sha256sum] =3D "04fe51d86fd9a594d9b71356ed322ccde5c9b448fc716ac=
74155e5821a922f8d"
> diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.=
bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.bb
> new file mode 100644
> index 000000000..c394be54f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.11.5.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "The lightning-fast ASGI server"
> +HOMEPAGE =3D "https://www.uvicorn.org/"
> +LICENSE =3D "BSD"
> +RDEPENDS_${PN} +=3D "\
> +    python3-click \
> +    python3-h11 \
> +    python3-httptools \
> +    python3-typing \
> +    python3-uvloop \
> +    python3-websockets \
> +    python3-wsproto \
> +"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "9f82b3674ced119596afe3b7b977f82c"
> +SRC_URI[sha256sum] =3D "596eaa8645b6dbc24d6610e335f8ddf5f925b4c4b86fdc7=
146abb0bf0da65d17"
> diff --git a/meta-python/recipes-devtools/python/python3-uvloop_0.14.0.b=
b b/meta-python/recipes-devtools/python/python3-uvloop_0.14.0.bb
> new file mode 100644
> index 000000000..9c8c8443d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uvloop_0.14.0.bb
> @@ -0,0 +1,8 @@
> +SUMMARY =3D "Fast implementation of asyncio event loop on top of libuv"
> +HOMEPAGE =3D "http://github.com/MagicStack/uvloop"
> +LICENSE =3D "MIT"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "a2f82abb676756f11f544c6b51caf171"
> +SRC_URI[sha256sum] =3D "123ac9c0c7dd71464f58f1b4ee0bbd81285d96cdda8bc35=
19281b8973e3a461e"
> diff --git a/meta-python/recipes-devtools/python/python3-wsproto_0.15.0.=
bb b/meta-python/recipes-devtools/python/python3-wsproto_0.15.0.bb
> new file mode 100644
> index 000000000..f76346aa0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wsproto_0.15.0.bb
> @@ -0,0 +1,8 @@
> +SUMMARY =3D "WebSockets state-machine based protocol implementation"
> +HOMEPAGE =3D "https://github.com/python-hyper/wsproto/"
> +LICENSE =3D "MIT"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] =3D "7d85f66da7ca9945b8bbfb8134900057"
> +SRC_URI[sha256sum] =3D "614798c30e5dc2b3f65acc03d2d50842b97621487350ce7=
9a80a711229edfa9d"
>=20
>=20
>=20
>=20


--3eU2qVR9jvsleEbLwsZ2UVwX8UevzV3E6--

--wsjeR84kDDknItb63ZKFlIsZOJIfBdSEm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXxme+AAKCRC7BTNVkZ0z
FB73AJ9Ysm98w9PHA96Ih8aKyohmXO6pjgCfQeWH2HYpxaQ7Vfdok/DLugzmego=
=/DbH
-----END PGP SIGNATURE-----

--wsjeR84kDDknItb63ZKFlIsZOJIfBdSEm--
