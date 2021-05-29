Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.22914.1622308604224329500
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 10:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mSm7f9X8;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so6264445wmf.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HUvUWRiRxwAvIdWOhel1/a3L6YVr/SnR+H8aKJmm0vc=;
        b=mSm7f9X8CHAGCxpobSrPQtE3CIfm9Dqmj2q5z36IQwFSNWx5F0C+OoaHRUZz3b5A/Z
         gg8t1RNP101eokjl6vmx1gccY6zjrylmVeHWidM6PMuKKmpYztNAGDaeqy+Pfk6SFQZP
         MCWgLTzkb5XsmJAzPyVMMKC3NIxGHMQqyKO7TI5X1z80w097nzEz4n+P6QMyCLD5anG6
         qV1+we+Rr/00KJFJAXfVDVtMDZWJSV6F84CHME/0T4tDkR6mU/uUj9WM8bV0SgLxIf4W
         JVx/SiW9cpb3nNTUJARkqPFdLyQnDunsPVOHLW0oM53f5S30o2vq2i3QMm6EBP8UIskR
         6H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HUvUWRiRxwAvIdWOhel1/a3L6YVr/SnR+H8aKJmm0vc=;
        b=pH+nBgz3YQvSpCCeSFwG5rZg/Lo83ExKthMsniW/i72HNSjfehfpZDi8r3Z8OhBm2z
         HhTSnB/1K13JehienJBUH0R0etEaLoZ8yoGsoa9+bQXYyvOAsyBoOr9LvzQXy1UBE+BD
         IZmB03tgNE8mN7QjVKcedCXHb43zHIFEWfZ+2kXJQeg3PkCioLWoHp3y6UrPtYd6CMV1
         wHmOW+u0jfd3v2sf4SThNzuBhrXs36xtYjBxxWvmeF0n4llt24c79j9WeZHpgN5DABcr
         5lZd6ClGpaazrBXYmtZiEGO9uxdT4mrr4pdsAMzbcdlbLXur4Y4ifAJ7AQVZo7bnIzY+
         Z2kQ==
X-Gm-Message-State: AOAM532GQFYevsSFIYJurGKqQYhmq7HDeXVofxfvWZ8Ue11J9L32xIea
	kqKw2q2KTnWGeaYjJXwG0kY=
X-Google-Smtp-Source: ABdhPJwSq/VpSW88+oC51seq0gXxrUUUiJ9cVJgkT+Pj/vfhLvUlVoxV7kyEg+uLQCM1BzQ34R10QQ==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id n11mr13780226wmq.11.1622308602705;
        Sat, 29 May 2021 10:16:42 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t12sm496448wre.9.2021.05.29.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 10:16:42 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 29 May 2021 19:16:41 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
Message-ID: <20210529171641.6pbvt37failkvqcn@jama>
References: <20210526173229.553-1-Nisha.Parrakat@kpit.com>
 <57321835-c8d5-754f-b974-6ee35912f88d@gmail.com>
 <PN0PR01MB52838F54DAB2752439C8C9BEEE249@PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM>
 <CAMKF1sqZ1B1CXha8DPVPZxz+JOjyLoqVCptuLfexJStnjroAhw@mail.gmail.com>
 <CA+chaQeQruUasefzSrxG1YuaFvNer85RwduAA=Om4HYYQFFFfA@mail.gmail.com>
 <9cb3d254-988e-ddbe-60e2-cdc61e45e822@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9cb3d254-988e-ddbe-60e2-cdc61e45e822@gmail.com>
X-Groupsio-MsgNum: 91623
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5udnpz746rf7nnw"
Content-Disposition: inline

--b5udnpz746rf7nnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 29, 2021 at 10:06:33AM -0700, Khem Raj wrote:
>=20
>=20
> On 5/29/21 1:55 AM, Martin Jansa wrote:
> > The version merged in master with:
> > https://git.openembedded.org/meta-openembedded/commit/?id=3D3c36a8efe2a=
964c3aa9bfcd836cee3f80a837fcd <https://git.openembedded.org/meta-openembedd=
ed/commit/?id=3D3c36a8efe2a964c3aa9bfcd836cee3f80a837fcd>
> >=20
> > still doesn't apply cleanly:
> >=20
>=20
> yes infact and CI reported it too
>=20
> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/2665/console
>=20
> and I missed loooking beyond the gensio issue there.

Understood, you still do a great job catching (and fixing) most issues.

> >=20
> > Will send a fix for this.
> >=20
>=20
> really appreacite that.

Maintaining meta-oe for many years, before Armin and then you finally
removed that burden from me has taught me how much work it is just to
keep it build-able and how little help maintainer gets - so I'm trying
to continue submitting fixes in the little spare time I've left.

Thanks Khem!!!

Cheers,

--b5udnpz746rf7nnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYLJ29wAKCRA3VSO3ZXaA
HL6HAJ9Mc0vpdpdG36pK0Stg/vSHiDa1FwCfRn6oh4TBXQGDubx6ikbAOrAty+I=
=i9Oc
-----END PGP SIGNATURE-----

--b5udnpz746rf7nnw--
