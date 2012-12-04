Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfquX-0003n9-AH
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:43:38 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1526599eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 03:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FTBLQTPQd3yntM0Sy6itrq+pck4Bkg/qSmg4Oza2BmA=;
	b=E8V+ZgzOG0i4pHes1DspqPsEA+CPiCSuda0U67a1BcKAalT4Ba9qtee6kpdjb75+6Z
	VXrW26XkspgIqJURj5RG3jjAQA6TTilc6oACuDHhG1jWn0KMDHtFIkXqXgGHoVv0d4k1
	CzkKzkmP0scBgmaNRb4mYa7XiGmPq9uOw9LH8lsQ2yg/AnV3n0dzDIYBHcdu7tvS/jqx
	xDBmmMfiIHI5q13t8Wi0Lk6y+B5QfJWPGRWNxTDePQBgA3v4VjF4ENtTKRHPBkOIJ+/p
	uRtQmKAc2F10Y4daEFk18ORic6cbXo32Y9ZKryFPbbbiyTcxgbg5uXZ0zemVL6xYxd97
	MHAw==
Received: by 10.14.174.198 with SMTP id x46mr40907565eel.23.1354620554927;
	Tue, 04 Dec 2012 03:29:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm2061039eep.9.2012.12.04.03.29.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 03:29:14 -0800 (PST)
Date: Tue, 4 Dec 2012 12:29:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121204112910.GC14870@jama.jama.net>
References: <1353937823-29509-1-git-send-email-ross.burton@intel.com>
	<20121204101412.GB14870@jama.jama.net>
	<CAJTo0LbFWM01+1T6yB0WO6VA3bL+=GJe+-nypizr3roAzRNJpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbFWM01+1T6yB0WO6VA3bL+=GJe+-nypizr3roAzRNJpw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] meta-oe: remove guile, it's in oe-core now
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 11:43:38 -0000
X-Groupsio-MsgNum: 41958
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2012 at 11:18:57AM +0000, Burton, Ross wrote:
> On 4 December 2012 10:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Mon, Nov 26, 2012 at 01:50:23PM +0000, Ross Burton wrote:
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >
> > Also there is bad charset defined in this patch:
> > Content-Type: text/plain; charset=3Dy
> > Content-Transfer-Encoding: 8bit
> >
> > $ git am -s patches/cur/1354615270.14870_19.jama\:2\,RS
> > fatal: cannot convert from y to UTF-8
> >
> > I'll apply it manually.
>=20
> I had the option of not sending a patch via email, or sending a patch
> that won't apply cleanly. :/

Why? I guess it was because you replied 'y' to:
Which 8bit encoding should I declare [UTF-8]?=20

Sorry for 2 CCed emails now.. I just tested this :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC93oYACgkQN1Ujt2V2gByrEwCdHSoUDfVkFWs2fol7Ic5MAu4w
nfoAoISL1vY+L4XhdELAkSHY2H+tRVjh
=oesL
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
