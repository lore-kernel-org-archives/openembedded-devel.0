Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.29075.1620636452952398717
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 01:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hPKNRe/R;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id gx5so23256515ejb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kTB/3FYqe10fTG5nzdyK16Uhj68l5TfbUW21IVgbgGQ=;
        b=hPKNRe/RKivXMTLVNbMO8Zi+XFXdoObhDuMByuiPRT5/9HK15tJqBYo0ll6q3v0UwJ
         xbq4RlyFBQ9QDHBfPCdPzD6OAAnjOYEi4g7dNl68qzqOYVGc3zJOLOYPPFU2Nr/iDgZd
         2zO2weDrkJSO2FmeWEjAuJz+2AZhCULIU6x0adVCbxQVP6e43vnFajMqL4JFqtJxr0bg
         UJRjmL50sqBCttjt8cL9R9givqCxKldUPQder+pUiqVhWPbX9UG3FS79e2iNmWtpx/aB
         Cq1vWxn1UKi2K0IEAmqCpA7d6vzEi42TCCEqA4Jmwo23ZOu8WASxqVBCoVRyB4Zi6mWn
         p5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kTB/3FYqe10fTG5nzdyK16Uhj68l5TfbUW21IVgbgGQ=;
        b=cMLiMTJuKXN72noJOg1VYq65aTqQvaNq5m2x1+eGCk9NyXZMpvm4oRVmQSvKXUKLIV
         /Ind7GdHaII5fDG2R662R2p95KUHf/dLwarmFEcXpKupECF4Yjj8sIP251BvyyU1NSfH
         KWkwBTeMsR98BAFkpX6aOL4up9gb7UDS/mSY4lTzyGbpcB0M4AncUiNwURNcVTvC/liv
         46Z4Mcmuy2GWmIl6Aw5E26PyjX9e93gRqbYTOXD9qEdM8yBwN4+yFqClEKYd5gVvHjzG
         1eDw1EtIwLPziwVRIbHfx0uEFamhjfKDtrBiIVAhgo8Dz+A5PhzBnEztUo/flnB0nCgs
         hSxQ==
X-Gm-Message-State: AOAM530mALOp4ttLpWmYoIPgNCCV91ylTEzL0S3Q4ILZEYP+vTUroy1c
	zge1y3kukhvOW2FRYuLl2qA=
X-Google-Smtp-Source: ABdhPJxZX+fPMNNAywbZ+W8WKe3xxQ5t+VfQvzVzzFQSj8PlZHotrk26d7eDUWlFyI9oUv7CkSwTyg==
X-Received: by 2002:a17:906:564f:: with SMTP id v15mr23962738ejr.96.1620636451260;
        Mon, 10 May 2021 01:47:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w14sm10947755edj.6.2021.05.10.01.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 01:47:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 10 May 2021 10:47:29 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] python3-m2crypto: Pass correct ABI defines to swig
Message-ID: <20210510084729.udt6iiekqis36jwa@jama>
References: <20210508155739.3380129-1-raj.khem@gmail.com>
 <20210508155739.3380129-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210508155739.3380129-2-raj.khem@gmail.com>
X-Groupsio-MsgNum: 91203
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="63s7gemce77c7een"
Content-Disposition: inline

--63s7gemce77c7een
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 08, 2021 at 08:57:39AM -0700, Khem Raj wrote:
> This ensures that WORDSIZE is as per the target, currently this does not
> get it right for cross-compilation env, and OE uses multilib headers by
> default ( even when you do not use multilib ) which means if WORDSIZE
> is wrong it will go on to include wrong headers due to these artificial s=
tubs
>=20
> Fixes
> swig -python -py3 -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2cr=
ypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aar=
ch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp-glibc/work/c=
ortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/=
aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/inc=
lude-fixed -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37=
=2E1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include -ITOPDIR/tmp=
-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/us=
r/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.=
1-r0/recipe-sysroot/usr/include -ITOPDIR/tmp-glibc/work/cortexa57-oe-linux/=
python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9 -I/usr/incl=
ude/openssl -includeall -modern -builtin -outdir TOPDIR/tmp-glibc/work/cort=
exa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWIG/=
_m2crypto_wrap.c SWIG/_m2crypto.i
>   TOPDIR/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/rec=
ipe-sysroot/usr/include/openssl/opensslconf.h:23: Error: Unable to find 'op=
enssl/opensslconf-32.h'
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v1->v2:
> - Fix typos in commit
> - Drop do_configure_prepend as its no longer needed

Thanks Khem

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--63s7gemce77c7een
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYJjzIAAKCRA3VSO3ZXaA
HFP7AJ9Z5rOlIn6wN6qhfruJ8Ks/zj6E+ACgoPX3S2DIbLToDMBOxUcCF7jVF1M=
=QCTf
-----END PGP SIGNATURE-----

--63s7gemce77c7een--
