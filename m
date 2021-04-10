Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.5780.1618066315266468906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Apr 2021 07:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fOBDou6e;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u17so13137195ejk.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Apr 2021 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aO8tbnh0UIQXYfIcAQ+d3K1pKUVpj0gI1qT2E6LqJLo=;
        b=fOBDou6eBVS/mkZX/QJnSVSnvI2cQicygi73vpPdVqlOzhpVAZzTY3yZcgcH7xTTK2
         Eh9Iqb1VfJ+4YGhmvTDJ7GUL6bFle41/bu7aEl+XUTcUJ+aUAmJcMZTLoOYLYmyghgoU
         RZwpifLceOG24p5BlTxDIilJmhuuZfU0wPqHD1bydLI7CZuU/mgvszUCcA0Nw5agPisr
         Xsl5fuyWL3RPPsPTYh8ho84zhzCRqSCefKndT7jpE/IvHZ4+24VHhGJSxnb+uyk0naS5
         01DjK1NivsDoEgDGPmOhoz+AG6PTh+bMtiHGjNJtLvB1TVJac1vGYPGEELcpUgX0Lhhk
         oNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aO8tbnh0UIQXYfIcAQ+d3K1pKUVpj0gI1qT2E6LqJLo=;
        b=MRSKMb95ljv+ecCVnUKPCBDOMcMkVZgM7RFy7l6Cdaxd7+M4xdWb47uEcUV5YouRt+
         1PuhgrxmX0nD4lA+bo7zKfx8tjkncPJra3Nvo9xYhmh/cPdtk6zfODQaEPG6XshnHnUd
         5jzKxCCZy4p0BJtCoqhHlUMB91gDuE5PJUMPZ2uVBDASKJ+hMJRgg8t/5WwVJ8lYi8TH
         uqgqLk2Mef7VKUKxsUC8tJDDfDo1bTlWDp58VehEHj2e6d6OViOvJ9DKuUqTu2272y0T
         TQbZkEoDDn/ofaRBNnNdRMWXZpLsjugi5ysGVuM6Usj6KGptfRD3UhyvtIisVtyNfqll
         lfgg==
X-Gm-Message-State: AOAM531FR31OcdWOkVwXJRtvctzhpi8bOtJCOtTNW32p9uT9b2XLW7p4
	AhirIDlQsI55txYaJdXVew4=
X-Google-Smtp-Source: ABdhPJxCN8KhQbNT2bIOkzew5DskIdbiibAMZu1Q9Ww7iyIHTzcv5aRBYeu8NXERCtlSwCeCcRSLVQ==
X-Received: by 2002:a17:907:c08:: with SMTP id ga8mr20280834ejc.376.1618066313494;
        Sat, 10 Apr 2021 07:51:53 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ju23sm2770558ejc.17.2021.04.10.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:51:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 10 Apr 2021 16:51:51 +0200
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [gatesgarth 0/6] patch review Arpil 10th
Message-ID: <20210410145151.42i3a2c2fl7s6iz5@jama>
References: <cover.1618064877.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1618064877.git.akuster808@gmail.com>
X-Groupsio-MsgNum: 90777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dvpwuwj7plj6uwqd"
Content-Disposition: inline

--dvpwuwj7plj6uwqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2021 at 07:29:28AM -0700, akuster wrote:
> Please have comments back by Sunday
>=20
> The following changes since commit 317c2dd540c84556127ad07739c0c930a0741b=
50:
>=20
>   packagegroup-meta-multimedia: include projucer only with x11 in DISTRO_=
FEATURES (2021-04-04 12:39:22 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib stable/gatesgarth-=
nut
>   http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/=
gatesgarth-nut
>=20
> Kartikey Rameshbhai Parmar (1):
>   fluidsynth: update SRC_URI to remove non-existing 2.1.x branch
>=20
> Martin Jansa (2):
>   libsmi: use /bin/sh instead of ${base_bindir}/sh to silence QA error
>     with usrmerge
>   libyui: switch to libyui-old repo which still has this SRCREV

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

FWIW: contrib/stable/dunfell-nut contains 2 more commits which aren't inclu=
ded here:

penembedded$ git log --oneline contrib/stable/dunfell-nut
95ace3c621 (contrib/stable/dunfell-nut) libyui: switch to libyui-old repo w=
hich still has this SRCREV
144b07682a telepathy-glib: respect GI_DATA_ENABLED when enabling vala-bindi=
ngs
1097d3cc70 uml-utilities: fix installed-vs-shipped with usrmerge

--dvpwuwj7plj6uwqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYHG7hQAKCRA3VSO3ZXaA
HLpcAJsHbJ5hT9pdqinooDyJLekaOWxRPwCfQ+nqsGlr0NJEM/E+vFPXwVbqcHo=
=KzQV
-----END PGP SIGNATURE-----

--dvpwuwj7plj6uwqd--
