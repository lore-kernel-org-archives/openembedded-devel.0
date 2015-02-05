Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 679FC71E68
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 19:05:45 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so12659591wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 11:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pqLbCzNEqdKUS0dcEss5PInSFTlfHgNWFsx4r7t/YSs=;
	b=POT7sntooSrh9Zzy5teSYu5uMIkpfEcbbsQhCubA3KWObNLj1kGYpQ6uNvvynRWdyJ
	/mdaFSxD6gTODZJ4ZnBJawA3vnat1+Wi/18HyivDyTr0NdcYzRfTrJQVWp2rCRqpEOQ5
	pMesKge4vjxM3i6nh0N+kwP2OO3GWKJ8BnixPiEH7ETCDXn7WE1EhWQFo9H1CV4fp31K
	CjLH96ECWhCEAiKp2v7v/WarXkma0yB4TJSoVzQmHUtK5vqCxr7fFihgMh0IeAQT1+8f
	9ucS3m/1MGhAV+T2k1ghI0LG7cpnWvJk5UQOfqwdXI3l+55RaG31yao4dEcQvmJqMG/g
	zlbg==
X-Received: by 10.180.101.65 with SMTP id fe1mr37623194wib.66.1423163145950;
	Thu, 05 Feb 2015 11:05:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id n6sm70460wjy.8.2015.02.05.11.05.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 11:05:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Feb 2015 20:06:01 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150205190601.GB2444@jama>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
	<C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
	<CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
	<CAK8F28kB5SDdjm76_DgReMSFJuZ60-hpHjUhnAVkPw14eELpoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8F28kB5SDdjm76_DgReMSFJuZ60-hpHjUhnAVkPw14eELpoA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Viguera,
	Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Feb 2015 19:05:53 -0000
X-Groupsio-MsgNum: 54124
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline

--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2015 at 10:49:23AM -0800, Ash Charles wrote:
> Hi,
>=20
> Why clean the downloads directory?
>=20
> Roughly how big is the download directory after a world build?

42G with unpacked SCMs, but without BB_GENERATE_MIRROR_TARBALLS so it
will be only a bit smaller after excluding git2 and svn dirs.

But I agree that we should keep it all.

> For gumstix, I maintain a source mirror on AWS S3 populated by our
> automated builders running BB_GENERATE_MIRROR_TARBALLS =3D "1".  If it
> would be useful to the community, I can see about adding files to this
> as an additional mirror.
>=20
> --Ash
>=20
> On Thu, Feb 5, 2015 at 10:04 AM, Tom King <ka6sox@gmail.com> wrote:
> > We have the BW, Jenkins can do the rsync from the World Builds (if we
> >  clean the downloads directory) and I'll have to add some space to the
> > Mirror Server but thats doable.
> >
> > Tom
> >
> > On Thu, Feb 5, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >> > On Feb 5, 2015, at 8:49 AM, Paul Eggleton <paul.eggleton@linux.intel=
=2Ecom>
> >> wrote:
> >> >
> >> > On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
> >> >>> -----Original Message-----
> >> >>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> >> >>>
> >> >>> I agree, #2 is the best option to take care of the older branches.
> >> >>>
> >> >>> Tom, can you please fetch the following files and add them to the =
OE
> >> >>> source
> >> >>>
> >> >>> mirror:
> >> >>>  http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
> >> >>>  http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> >> >>>
> >> >>> I've verified the md5sums match the recipe:
> >> >>>  29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
> >> >>>  e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
> >> >>
> >> >> Good to know we agree on the best option.
> >> >>
> >> >> Could I make a humble request to speed up the copy of the packages =
to OE
> >> >> source mirror?
> >> >>
> >> >> We have a BSP layer that depends on this and currently our build is
> >> broken
> >> >> fetching crda.
> >> >
> >> > I've been thinking about this, and this is getting ridiculous. Inste=
ad of
> >> > manually adding files to the OE source mirror, I think it's time we
> >> simply had
> >> > a populated fallback source mirror that has all the sources for at l=
east
> >> the
> >> > recipes in layers hosted on openembedded.org (if not other commonly =
used
> >> > layers) aside from OE-Core which is already handled by the
> >> yoctoproject.org
> >> > mirrors. This issue keeps coming up far too often.
> >> >
> >> > Is there a possibility we can set this up?
> >>
> >> We can infact setup a rsync from download directory of Martin=E2=80=99=
s world
> >> build jobs
> >> looking at Tom for help
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTTvxkACgkQN1Ujt2V2gBwaowCeKQ7kKPZSb5vNF/A8ozh4FO2w
VskAn0Xk4OXaW50I7REDkwdqVGSfe2yW
=PZI1
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
