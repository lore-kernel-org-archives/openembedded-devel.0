Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0988D607F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 19:49:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b9so7016693wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 12:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bodPhLWJ7My+J5h655C/kCusTH3HxHx8OjnnS1n5bKc=;
	b=ejsNiZ9CyTIOIgO91TCKp+mJFN7yEnWO3Hpp7A3SqyRNC4OTHqa3JgswIgW3i+joCN
	m7np3bHEq6LYZprwov8SXlCuqMnUoZ5kiSg+xrrkdq9+MiWhmB0jITs3q71T9giSJMwd
	5HwvMlcbYYG1v8U2zKU1NcNRcwKhUlwZplUYt8ubNxaAaMgyh033O82FdELgqX019RGJ
	/kjdvjQ9JRFURhee5HjsRHTNGMs9QI3XQarbZeHF9dhhNYLHMYCnMkGWdxMvtwV04DUw
	7GqkagwQDa2uVg4yr+5TvFp+EXJJcSfQEQMpFjijpOrwP1z0PzJKGyF7evEmC16Y/gxj
	Y+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bodPhLWJ7My+J5h655C/kCusTH3HxHx8OjnnS1n5bKc=;
	b=GgA57K0iqFD5pE/CSzFPFu91NvsREFFEad8KrRWHnbL3lCu2//PLpMg4xuB7Xo+U95
	o/2Lwv9FFXNXeadUb7qk06pA9qnz5lYuuNI/2wCAj5VZhUqF4sgDEm5i0mxtJENhqJ2G
	v5LAB4YpJdJk9SIU6ft0zlF+OEM562hhjDuJjkCzd1zAbCCgnQaD30eZWQzU/fZvzBag
	aHmTXTn+akwGZmuLTlrc94tQ8M7DJPQJbPh+aslldLt4wek9eX5YYNPmJgxC74PUpdaU
	5fjoHm5r9EMvBYgrPnlQeUXi5TtsEqmyxQ++loDGtK0s1qTQG9e4B3tNYzwxtghNZWa0
	uatg==
X-Gm-Message-State: AMCzsaUKX1h5mPriGPumkXY/Ry8IEZZWEaz5btpFppLmFCdNjTd7sSpz
	rSNn4/p+IpZijud8796NJVs=
X-Google-Smtp-Source: ABhQp+Tl/k6motbQEWLfWeg+LhcPTk2X9dcAs4WfSw/rfjoumxLVyI+nH52t/0MeATHFMME70Nzk3A==
X-Received: by 10.28.43.130 with SMTP id r124mr1051201wmr.111.1509565750959;
	Wed, 01 Nov 2017 12:49:10 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a21sm833957wme.3.2017.11.01.12.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Nov 2017 12:49:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Nov 2017 20:52:43 +0100
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20171101195243.GA4578@jama>
References: <20171017195649.8657-1-s.sonski@gmail.com>
	<20171017195649.8657-2-s.sonski@gmail.com>
	<CA+chaQcK6+mS9SgBTaNdzgLdDS=nhoHNj1crFtPeirxnK1m87Q@mail.gmail.com>
	<8cfe1d21-f003-031b-ae42-024f3be91910@zonque.org>
	<20171026125505.GW9221@denix.org>
	<689fd8ec-97bf-2451-0c7a-1bc4606458e5@zonque.org>
	<20171026133646.GX9221@denix.org>
	<50f1d37c-2b92-e26b-2403-57c438b43381@zonque.org>
	<CA+chaQcd+9G5=BTnQTzrGVwj3AKz2tGB3zPc19ze0bkTtSq3JQ@mail.gmail.com>
	<20171101185701.GH9221@denix.org>
MIME-Version: 1.0
In-Reply-To: <20171101185701.GH9221@denix.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: "Chris E. Rallis" <Chris.Rallis@ravenind.net>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY
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
X-List-Received-Date: Wed, 01 Nov 2017 19:49:10 -0000
X-Groupsio-MsgNum: 69447
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2017 at 02:57:01PM -0400, Denys Dmytriyenko wrote:
> On Fri, Oct 27, 2017 at 09:05:39PM +0200, Martin Jansa wrote:
> > I've dropped the "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY"
> > change, so now I have only following 3 included:
> >=20
> >=20
> > =3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
> > latest upstream commit:
> > 2c3ef00 qt5: add missing commercial license
> > not included in master yet:
> > bbb3044 meta-qt5: Update to 5.9.2 release
> > 8fd20e8 nativesdk-qtbase Enable objcopy for qmake
> > 60329bc qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order =
call
> >=20
> >=20
> > and it still fails the same as shown in:
> >=20
> > http://errors.yoctoproject.org/Errors/Build/47776/
> >=20
> > I'm going to drop the 2nd objcopy change and retrigger the builds.
>=20
> Martin,
>=20
> What's the latest status on this? I noticed you merged the other patch to=
=20
> master now...

I've merged:
bbb3044 meta-qt5: Update to 5.9.2 release
60329bc qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call

and dropped both objcopy related changes from master-next.

If somebody still needs them, then they will need to debug why it causes
the qtbase-native failures and send v2 with this issue fixed.

Regards,

>=20
> --=20
> Denys
>=20
>=20
> > On Fri, Oct 27, 2017 at 7:53 AM, Daniel Mack <daniel@zonque.org> wrote:
> >=20
> > > On Thursday, October 26, 2017 03:36 PM, Denys Dmytriyenko wrote:
> > > > On Thu, Oct 26, 2017 at 03:07:36PM +0200, Daniel Mack wrote:
> > > >> On Thursday, October 26, 2017 02:55 PM, Denys Dmytriyenko wrote:
> > > >>> On Tue, Oct 24, 2017 at 03:33:10PM +0200, Daniel Mack wrote:
> > > >>>> Hi,
> > > >>>>
> > > >>>> On Saturday, October 21, 2017 12:54 AM, Martin Jansa wrote:
> > > >>>>> Either this or the ptest change seems to cause:
> > > >>>>> http://errors.yoctoproject.org/Errors/Details/157417/
> > > >>>>
> > > >>>> FTR, I see the same error locally. Reverting both 8fd20e8b1
> > > >>>> ("nativesdk-qtbase Enable objcopy for qmake") and 5ec6b97a8
> > > >>>> ("qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY") in the master=
-next
> > > >>>> branch of meta-qt5 fixes things for me.
> > > >>>
> > > >>> Have you tried bisecting by any chance?
> > > >>
> > > >> bisect what exactly? If I take your patch out of my stack, qtbase
> > > >> builds. If I don't it doesn't. Can I provide more information some=
how?
> > > >
> > > > That's not what you said above - we are trying to figure out which =
of
> > > the 2
> > > > (*two*) patches causes the breakage, hence the question about
> > > bisecting...
> > >
> > > Ah, sorry, my bad.
> > >
> > > Only reverting "qmake5_base: add OE_QMAKE_OBJCOPY from OBJCOPY" fixes=
 a
> > > build that does not have a native sdk target. I assume the 2nd patch
> > > would break a native sdk, but I can't tell.
> > >
> > > I can provide full build logs if you want.
> > >
> > >
> > > Thanks,
> > > Daniel
> > >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWfomCgAKCRA3VSO3ZXaA
HLpjAJsFr+UVvtiSwoVIjvIpIqnA7g+1cgCeL/0qf3KmyHVGsPDlWUO/FcxxL0k=
=33KM
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
