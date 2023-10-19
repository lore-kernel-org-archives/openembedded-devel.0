Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1492CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 13:45:40 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.28262.1697723137808354251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 06:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=htpX7E0t;
 spf=pass (domain: konsulko.com, ip: 209.85.219.177, mailfrom: trini@konsulko.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d8a000f6a51so8859290276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 06:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1697723137; x=1698327937; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QfmbLpxEJ0IswY3jqb1sBkQvbI0ztie/fQsqd/f3wY=;
        b=htpX7E0tfZXFFRXXuau1E1M7Wo5s0VHrnJcciJcq6ncc4ae4IDRV8BpET2eG1hFM2S
         /LM6Mi4XikA4Zh0GnabYfFMkrc93bGU68EfRJfc6WYScvWyIf/1NXeSRhm+sga8RqMC5
         m7r+M2xcR8vczcgK9pF8j3sj8vGp705uc6gDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697723137; x=1698327937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QfmbLpxEJ0IswY3jqb1sBkQvbI0ztie/fQsqd/f3wY=;
        b=ZLeFrcvY+m857MlzJQtLte6ExipQhOP/I/qvasashtk27YjSKXBnOjDH501cB/eRoZ
         5ucsPCIdsHIyMBvQshSc7mnmrbWYnmHLt1f3xuC8IPgmQl6m+yyF6FM9KO5kLxsuJ66Y
         3o2xHP12mgEn5u3+Dp7glVfcbwumd6mJjsbWJV3oT6v+a+7rlyaUkpT/WD8C2RUkV2R+
         IrnBKUN68Mxuy305hEeoVTXvLF3Ww8T0ine58Te7I5Ec+tZ59x5c6iDfJiUvSVHX9f9N
         xGbDVPcJ1f0QKssQxSugIEiOhz9FoaY4+vC9ieNcac2zF2UZAG7uxgIiAbJjyW7sfOA5
         oUdA==
X-Gm-Message-State: AOJu0YzD5W4Rqxh/+CIoEKO6DXW05QifIsGYtlPpfbJIkyw9jsvaq5SN
	1Ycc1OnElt2FSrMBLO7oFhVEcw==
X-Google-Smtp-Source: AGHT+IEyNn4u8RBo+ZDlbxzz1Hvh3P0NdxyPS70rU3+UxKDtGtyi77Vgtdb+F4y59s7+8FUL+4C/Zg==
X-Received: by 2002:a25:2417:0:b0:d78:f32:5849 with SMTP id k23-20020a252417000000b00d780f325849mr2267005ybk.24.1697723136987;
        Thu, 19 Oct 2023 06:45:36 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-0000-0000-0000-0f48.res6.spectrum.com. [2603:6081:7b00:6400::f48])
        by smtp.gmail.com with ESMTPSA id y63-20020a253242000000b00d9cc606c78csm189785yby.41.2023.10.19.06.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:45:36 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:45:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 2/2] debsums: remove old recipe
Message-ID: <20231019134534.GX3119521@bill-the-cat>
References: <20231019011326.3535316-1-ticotimo@gmail.com>
 <20231019011326.3535316-2-ticotimo@gmail.com>
 <CAMKF1srBaFgMyRDjXimfYyX1=mWvZDwbG6KckjJp8rgsrgFk-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xn9ACPv2PWzJCobB"
Content-Disposition: inline
In-Reply-To: <CAMKF1srBaFgMyRDjXimfYyX1=mWvZDwbG6KckjJp8rgsrgFk-Q@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 13:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105600


--Xn9ACPv2PWzJCobB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 08:30:27PM -0700, Khem Raj wrote:
> Adding Tom since he added it back in 2017.
>=20
> On Wed, Oct 18, 2023 at 6:14=E2=80=AFPM Tim Orling <ticotimo@gmail.com> w=
rote:
> >
> > The debsums recipe has not been substantially touched since 2020
> > when it was moved to dynamic-layers.
> >
> > In meta-openembedded ecosystem, it is the only known recipe that
> > depends on po4a, which is being removed in a separate commit.
> >
> > According to the layerindex, no known recipes depend on debsums:
> > https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dd=
epends%3Adebsums
> >
> > Signed-off-by: Tim Orling <ticotimo@gmail.com>

Thanks for checking.  We no longer have a use case for this recipe.

Acked-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--Xn9ACPv2PWzJCobB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUxMv4ACgkQFHw5/5Y0
tyxWPAv/TQrLSO6dlxZNrPBsQhdlL0+mo1HYpN7SBQze5OQ0vcShdlf7SbXzQqPW
BgvTmppZgDYuLFXadTCq67rnywFvBatUb/OVpMzk50z6CGFKxgva0XEmzFeGSuPw
2fl75/LE+RtpZzxRRNGtqwis1lGahfBuHhd+EL13sV4DVYh96lAt9odf46EZY2dG
Sp/Ro09NaT6rakjTs6sd9qB0bY1GzgYmDZwbJpbJP2aazzsHa6AyAqQ1iJFhdjlb
Cxflg2E/hbk78xCLG8BmMOXq34qyuyqREeqhp+On0U76qbjKR3+RiIvcNx4Aw6ba
cC8ul/OgbegGQOgPkgv5/XCPYF4MsXOfguxqkSMGZp9ec9peJ/ATxiPS6BF9LTmh
UmeBujNsbEr8KLke8fUuzF7OaKjmkv6BFSq7CZGNKaL92TEjjMrQfDNMQIwpYqAA
a2dICW5/qpf0vc+nBkIr/A/O68Z7nzzqP7VUdi75wXFaBud+hxCr1lMLc+Mp2iuE
Bhv9fWo0
=NNs5
-----END PGP SIGNATURE-----

--Xn9ACPv2PWzJCobB--

