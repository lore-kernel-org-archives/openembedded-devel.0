Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.225.1587779831046647533
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 18:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KBu+8oe+;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id t11so5519389pgg.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=AZPVgC3gFa6T3vFx0XmXPptDy1Y6Bg1CczgflcqsdyE=;
        b=KBu+8oe+Fh/krLg2sO/xKMthCmfliGHR+0pm4bbTaGTaodSL6cxKRjXzhQ9KjtGhRW
         SblKE7Mma0P10YxjNl+KE5IuQb8eM1gmf0D7mWNPh2H2PRtLxbw/YjQhxovcB+cEkpDh
         lZjbuPpy+KG2uj3Azoz2dlP4GyiEBypqaQhIEue4EEPg/TEyYbWE0PURI/Ds7+hhLQud
         MMnKpTomgEdGuZsKstVS2WpixhbL6zUwOdECRTKKrJxhZBPB3SHXivo/ANrWE7iLtb7U
         +unFBzzuXb370EAvHaU9e6TMXMkvr7TzFDD1yszVZqyniV2aB8pB/6+wfr2Y3akfugBv
         tVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=AZPVgC3gFa6T3vFx0XmXPptDy1Y6Bg1CczgflcqsdyE=;
        b=DW9wpedTCHq4Fd53uctdSXH69CP45mIH+oFUCSyZnH4Iu/dDPJGR1Trjf7D2I6MuMM
         lx1ltlXZd5JJXwTq6eSHz1mFLqPDPRduGXfSZ0IRlUATt81Wvnwg3G6UFzn8F+AsLDdG
         liIXi+UBOgocZuWU1sSMcYrRFjBrAp4APW4YRKLUNVoT49eoOUe0lSy0FhULkEbEYiwF
         TbKnF+KRVK4xSmPc6wwunAYTE6EPLJZ4Su8eKoJ3gj7tDE5iS5zyuFs8s67RVV6tqGY3
         tLOCbCMGi3CSL4WtaixSN3nIuifuOBS58AQ5S+oEOm4U6RnmGCEIj/32S+Um2HDbWFuM
         2JDw==
X-Gm-Message-State: AGi0PuaG786mqqmQJ6Pv9AQaq0xwIcW8a7S4nqPLE2Swmrs3uHI9Wexp
	gASE07hqyaxby9Bjfy3ObiIKjCoge14=
X-Google-Smtp-Source: APiQypLlfZ6BO8Ui5SHKQVGD/4i1Wu+9ryLGdcI3LdSrM9F0r6pr0zhLXMZTU19RlWnOO+Px9nQZOw==
X-Received: by 2002:aa7:9683:: with SMTP id f3mr13126665pfk.278.1587779830169;
        Fri, 24 Apr 2020 18:57:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id a19sm7183868pfd.91.2020.04.24.18.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 18:57:09 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-pexpect: change shebang to python3
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200424011328.191909-1-changqing.li@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <bac9fe56-5f04-1cd4-6cc8-10c77ccfc4c8@gmail.com>
Date: Fri, 24 Apr 2020 18:57:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424011328.191909-1-changqing.li@windriver.com>
X-Groupsio-MsgNum: 84076
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="C0jqC9fXvAKkxkEdGNIU16VkgIVQdgB7S"

--C0jqC9fXvAKkxkEdGNIU16VkgIVQdgB7S
Content-Type: multipart/mixed; boundary="pWTSRPi0bgTsOCzeZRIDgvGMUrJgJ6ylb";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
Message-ID: <bac9fe56-5f04-1cd4-6cc8-10c77ccfc4c8@gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pexpect: change shebang to
 python3
References: <20200424011328.191909-1-changqing.li@windriver.com>
In-Reply-To: <20200424011328.191909-1-changqing.li@windriver.com>

--pWTSRPi0bgTsOCzeZRIDgvGMUrJgJ6ylb
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/23/20 6:13 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> we have offcially dropped python2, so it is possible
> that our code run on python3 only host, so change
> shebang to python3 to avoid error like:
> python: command not found
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../python/python-pexpect.inc                 |  2 ++
>  ...hange-shebang-from-python-to-python3.patch | 25 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pexpect/=
0001-FSM.py-change-shebang-from-python-to-python3.patch
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pexpect.inc b/me=
ta-python/recipes-devtools/python/python-pexpect.inc
> index f02aa994e..c6230b2b5 100644
> --- a/meta-python/recipes-devtools/python/python-pexpect.inc
> +++ b/meta-python/recipes-devtools/python/python-pexpect.inc
> @@ -4,6 +4,8 @@ SECTION =3D "devel/python"
>  LICENSE =3D "ISC"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1c7a725251880af8c6a148181665=
385b"
>  
> +SRC_URI +=3D "file://0001-FSM.py-change-shebang-from-python-to-python3.=
patch"
> +

This .inc file should be merged into .bb, as well, also check if
meta-python2 depends on this .inc file, if it does then the patching
should happen inside py3 version of bb file and not .inc

>  SRC_URI[md5sum] =3D "153eb25184249d6a85fde9acf4804085"
>  SRC_URI[sha256sum] =3D "fc65a43959d153d0114afe13997d439c22823a27cefceb5=
ff35c2178c6784c0c"
>  
> diff --git a/meta-python/recipes-devtools/python/python3-pexpect/0001-FS=
M.py-change-shebang-from-python-to-python3.patch b/meta-python/recipes-devt=
ools/python/python3-pexpect/0001-FSM.py-change-shebang-from-python-to-pytho=
n3.patch
> new file mode 100644
> index 000000000..bee772da6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pexpect/0001-FSM.py-ch=
ange-shebang-from-python-to-python3.patch
> @@ -0,0 +1,25 @@
> +From 35462d7b778eea32fd0cc0bbc79d6e6f53d942b4 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 23 Apr 2020 08:01:42 +0000
> +Subject: [PATCH] FSM.py: change shebang from python to python3
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + pexpect/FSM.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pexpect/FSM.py b/pexpect/FSM.py
> +index 46b392e..4e77654 100644
> +--- a/pexpect/FSM.py
> ++++ b/pexpect/FSM.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +=20
> + '''This module implements a Finite State Machine (FSM). In addition to=
 state
> + this FSM also maintains a user defined "memory". So this FSM can be us=
ed as a
> +--=20
> +2.24.1
> +
>=20
>=20
>=20
>=20


--pWTSRPi0bgTsOCzeZRIDgvGMUrJgJ6ylb--

--C0jqC9fXvAKkxkEdGNIU16VkgIVQdgB7S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqOY7gAKCRC7BTNVkZ0z
FAJ8AJ4hYuAwWxqzhmB4S/1SN6usiR7Y0ACfVcEP40gRby9UosbrLisVLNfI5gk=
=qkXr
-----END PGP SIGNATURE-----

--C0jqC9fXvAKkxkEdGNIU16VkgIVQdgB7S--
