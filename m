Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD3371C9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 07:37:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so13300384wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uTp8jV4tU8/Wc7AUrhUT2PmHRY59Z+CQI3LfxaKhcQc=;
	b=bo1mB+exMP7szSTSvx2xAyY1PubKdsq2ihvIF69rNbPDBY5W+nTy9KTrWDsQvVdV54
	iRhm6eKfeIQ4DzAmWCRjCuND0DgqVf53WauhrNU3EzSA3AFFy7xLM6j2mLNDXxbl2vW9
	BY0gxncR0DwzRXFh79jBPP4BAK2EfPPFaq1ks+W4K7GxQ41pdiXRrtIpUwuWx3FkffCJ
	xSGRov0sJeKRUTEnQlZLUff1LtbRbcEfjkC6ZaxaGE2pcFNkPdC6s0nsXE9d+dgW1PHh
	oHUOTEKJLu+k1gEAUzM8tykxNs0t5s7ciHOboEpRUI+q1JDf5nwlOnAv6jP8Sl5hoyz4
	k5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uTp8jV4tU8/Wc7AUrhUT2PmHRY59Z+CQI3LfxaKhcQc=;
	b=YaEXF2NVa+oYAcRVa36+RBGybZx+XuyVSTzA5uuYpd86JbnXwOAVj3b/P45kmn6XKo
	VAkBI2CcCLlbSbZglUIfuF7y/ads23G5gdfQzd41jKSwRgdmSOgsP2loBJW70emeEvBv
	fK+mxx9lAVP8rsFBbmDXngaXXi5xKEIQ+wFVj1GcL8VW+5g552NAwalc69l5EiNN7MzP
	FzuVmeng1O6JGYY+VJcds8HmUVFlolP7aAgiSpCS8ZqWEZjQohB+BoiiEH15kFs/MWpN
	MO1i1YvoTYdZOAUQYhMr/KGU16ZDmQ/+OK9YmlmRpBr3utjLhiMHL3xa60HUBLXRI7oT
	1JTQ==
X-Gm-Message-State: ALKqPwernKFlDFiBjZKnIrQAOwz67kO4hTXpdBKgksrDfxRxWADG7+kS
	FEm29K0wMPz/oleCXS5Eai4=
X-Google-Smtp-Source: AB8JxZqJxQZrMTJUswkJXiHNH3geg0H+s0Q+46/aGqLeQVPXn3++GTvhq7FzXc27Xh/tAjBUz0udWg==
X-Received: by 2002:a1c:5b02:: with SMTP id p2-v6mr3700805wmb.20.1526629048492;
	Fri, 18 May 2018 00:37:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c50-v6sm12140927wrc.11.2018.05.18.00.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 May 2018 00:37:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 May 2018 09:37:28 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20180518073728.GB1715@jama>
References: <20180517232110.22663-1-raj.khem@gmail.com>
	<20180518072308.GA1715@jama>
	<CALbNGRT4t-neLiZ3aEzTmsCtpkp3ToPeYTgAz3aXS_S2wjSFdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRT4t-neLiZ3aEzTmsCtpkp3ToPeYTgAz3aXS_S2wjSFdw@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 1/5] evince: Reset PR to 0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 07:37:28 -0000
X-Groupsio-MsgNum: 72251
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline

--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 09:35:40AM +0200, Andreas M=FCller wrote:
> On Fri, May 18, 2018 at 9:23 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, May 17, 2018 at 04:21:06PM -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta-gnome/recipes-gnome/evince/evince_3.28.1.bb | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb b/meta-g=
nome/recipes-gnome/evince/evince_3.28.1.bb
> >> index ce73620b09..97fe769c5d 100644
> >> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
> >> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
> >> @@ -3,7 +3,6 @@ LICENSE =3D "GPLv2"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576a2163977938ea=
36fa7b"
> >>  SECTION =3D "x11/office"
> >>  DEPENDS =3D "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','=
x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-=
icon-theme intltool-native gnome-common-native"
> >> -PR =3D "r5"
> >
> > Why, it makes the version going backwards without any good reason to do
> > that.
> >
> * master still has evince 3.24.0
> * I sent a patch a week ago to update to 3.28.1 and forgot to reset
> PR. This patch is pending.
>=20
> -> If the update and this patch are applied in same series version
> should not go backwards.

OK then.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv6CuAAKCRA3VSO3ZXaA
HGjGAKCWKJvAfOU2xCnFTiErbaKWGm+yDwCeJEE1nfqVMui0+fXpIz4t+BEqWCk=
=58Vp
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
