Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 887156BA1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:30:50 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so7748654eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1p0251Mirb68/t4B7YC+lgZLlK2W4IPgTiT7ksuL5tk=;
	b=z+F2pKgPEC15qyeiphDoQIQiNqWdu+9W6J/D88xLB343LSRXbGNOyR+fb5kFyRXJsD
	dCWYbDhvqpcmIFIXoGYQ0TcsMTjeVtwSbAakKY09XrV+soPdZuIk2U2JrWD82x15Rp67
	sU0RDtfKM/ZA1HWcwmaRQFOIbegWmPI28sDVPMkOVYrY4jTsrVpnapI7h0JJTAe4LYnj
	OlH3h2Qd30nStzCqWajStLktqmpw74bZz/h5Ppv3Bz0aplUi2aRy9FmKL3MkwBqe/mTA
	j4GLKs9ngDVWOkrbwOpYBEl4IguTDeYdYxnYY7Nj30456SVJbLil4o/QWBlXxxMlER6X
	DDFw==
X-Received: by 10.14.246.203 with SMTP id q51mr3262617eer.86.1392726650732;
	Tue, 18 Feb 2014 04:30:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g1sm69522982eet.6.2014.02.18.04.30.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 04:30:49 -0800 (PST)
Date: Tue, 18 Feb 2014 13:31:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140218123121.GI4067@jama>
References: <CAMCfZKFpTVoRJJ68m+vLdD_Pv-WkocXWKcxh6F0DnwP_sJ4t0Q@mail.gmail.com>
	<20140218114855.GH4067@jama>
	<CAMCfZKFwMmcmTmQ+EyYwaDJXu0o2kzh+KYwnH4h5Q4R2kuqQ0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFwMmcmTmQ+EyYwaDJXu0o2kzh+KYwnH4h5Q4R2kuqQ0A@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: libao build fails on dora and master
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
X-List-Received-Date: Tue, 18 Feb 2014 12:30:50 -0000
X-Groupsio-MsgNum: 48195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QxIEt88oQPsT6QmF"
Content-Disposition: inline

--QxIEt88oQPsT6QmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 09:17:58AM -0300, Diego Sueiro wrote:
> Hi Martin,
>=20
> On Tue, Feb 18, 2014 at 8:48 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > > libao compiling is failing because of a dependency on esound.
> > > Adding EXTRA_OECONF +=3D "--disable-esd" to recipe fix the issue.
> >
> > Please add PACKAGECONFIG for esound and send such patch, thanks.
>=20
> Something link this?
>=20
> PACKAGECONFIG ??=3D ""
> PACKAGECONFIG[esound] =3D "--enable-esd,--disable-esd,esound"

Yes, just replace ??=3D with ?=3D.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QxIEt88oQPsT6QmF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMDUpkACgkQN1Ujt2V2gBypOwCfWOWrpWCjcMT7uGbIjvobDe5t
UXAAoLfFh6ck5eLr+atHxoZJpXvFAeUr
=MJEb
-----END PGP SIGNATURE-----

--QxIEt88oQPsT6QmF--
