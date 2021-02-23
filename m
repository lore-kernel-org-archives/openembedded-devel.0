Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.13.1614101405221650705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jh6ouV0q;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id d8so35806626ejc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Feb 2021 09:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vAxlX28FFUV+xX/o5smeR5/kILYyCSGEYtXfhrBwxx0=;
        b=jh6ouV0qCNbpMuL0t6SPShX+AGDb6448yxOrxAIhNqoEp7Bk9fnDvhkr9EOe+XWgsc
         Up+zxjlXfzQXncb++j9FOniEUnY8ycX8+Wh51PWgAiTzlwRY2lVOm7sXVFXCO/uV0pgK
         ael8HXS10qsx8MHAgQhaLWBTO+Kg371y+sm88UX0/NhoFB3sRJkQTOa1DwXKkyanF5wm
         gEkY77orp6IEE9eyMmut5NQKhaC1hfu8q/WTSTnLH0nJXS/H6OldqmGib57HOqmWNkcJ
         bNtmZLTZEQoIk7VZRgjLB79oxgqU7NKH4iHKPVBK7ixMMLYWLgV5dVR9Vhl9w4nqdnVK
         5LDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vAxlX28FFUV+xX/o5smeR5/kILYyCSGEYtXfhrBwxx0=;
        b=jA5ABX6pP8tKox3OVZJGDsughqpi0DTN6ko5TTAjnsDqIILU9Poi/4MyiiUVpXbfJw
         Q2ZNPfMRhm/ofwoRvsW6rNISv3bwzPNsjP4FnJrCw4uMeocuVbtSqyZMIo+PBpVUeqdN
         /crOb/1NvILEMyhoo+ivRRBNzfOMrSSc8SLYmETGvd7JKIZc1D/uzNbgx1uGlE0FoRVa
         HUz9Fg0yzFFf/ZEdCuImNIq4y5Swr8tS9KLnJkpm1q4xfMhDwy0/4p+WSr6+CFxz5MWL
         chiu1WmOC7XK83osYPXPxuH8WCQpJieD/ER5Mqrhzbl5sLLE7VNz0SBj8GCst6a0iKko
         pJIA==
X-Gm-Message-State: AOAM530v3qXYtbY2LW1oDwO+5GsmDZ7QiMS/9BpkUWP3OskDPSTwW180
	T4ky47RenP1LREK10a6mzvY=
X-Google-Smtp-Source: ABdhPJz9kiQYdlf1OSM7iyUdWShdzpPQDhsQyRUn6A0qPSgL9AKwWIaSJN3+qoBvtVUUYCO00eh1Eg==
X-Received: by 2002:a17:906:3883:: with SMTP id q3mr26967516ejd.160.1614101403591;
        Tue, 23 Feb 2021 09:30:03 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r6sm15327693edm.23.2021.02.23.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 09:30:03 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2021 18:30:02 +0100
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Message-ID: <20210223173002.aydz4xm65ylvgy4k@jama>
References: <20210223162705.2595483-1-andrei@gherzan.com>
 <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
 <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
X-Groupsio-MsgNum: 89688
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="spd2gohp5tacch6n"
Content-Disposition: inline

--spd2gohp5tacch6n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 05:19:16PM +0000, Andrei Gherzan wrote:
> On Tue, 23 Feb 2021, at 17:15, Khem Raj wrote:
> > On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > >
> > > On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> > > > From: Khem Raj <raj.khem@gmail.com>
> > > >
> > > > We are seeing warnigs with gcc-10 even on target builds e.g.
> > >
> > > Do you use gcc-10 in dunfell builds?
> > >
> > > dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
> > > backports or the warning is reproducible also with gcc-9, but I'm not
> > > seeing nss failures in my dunfell builds.
> >=20
> > I think its the native one he is running into issues. Perhaps he has
> > newer build host OS which has gcc 10
>=20
> That is indeed the case. I'm running 10.2.0 on my host as of now.

_on your host_, but why is it needed for target builds which should use
gcc-cross-* 9.3.0?

--spd2gohp5tacch6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYDU7mgAKCRA3VSO3ZXaA
HMT1AJ9PDQfxZwb3ugErC2AiVKumlCKD6gCfUyfU5nbwX9H+cGBFPm2QI8YZiQ0=
=SBfu
-----END PGP SIGNATURE-----

--spd2gohp5tacch6n--
