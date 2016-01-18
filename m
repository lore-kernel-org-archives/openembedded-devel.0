Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 61C5760667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:56:20 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b14so119073804wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2016 03:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nvOBH2mIedk2iZylmxPIE2i8/lD4Y3jkrKrhaod1sEE=;
	b=MR+k7p7sf1u/8OQu5qmE/cJfjnByk946xZ/siOfin6A8pPlbGJjchyA7Op+U5GL6pn
	h/aIYblxLBscx7L5oUuZD6Y9Mb5+VsH+9QFYNcGSMtN/o5SP6GfMGaojDaNUC9OpmTGy
	cd0sjhgvIa0VshpR+67hxlkQ4ubSuWQMYwv+0RTv2BVev8ZrgvrQoVmOC03KlXjA3azu
	YbRylv7vROXlA0NhDZ3FFsroAKvei8kojit43jaHQFDN3d6MMVw5PnAenzeNKjrPGk8g
	HhnO+t4I7fXTK8U2tXosDF6UyT3MPw2TF4F5AVmes+jh/e09c/gPFhQT8e3HqJ/DcTVu
	69Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=nvOBH2mIedk2iZylmxPIE2i8/lD4Y3jkrKrhaod1sEE=;
	b=ADu4ofmsUtTvJtXxLSZ7rH6ai5wscobfqd2PlhBQ84wWoIeQYZWtwuMx/COf/PtG4K
	I1/mAuZj2UzJeMLd/ByBum38MIyi5iEhEnH1NdP85FQ3jngBIAsF4lCeiYDR9QjCO9X7
	BvCAwLBfl4D4bhdSciBG+6j3+v+TG+0lN1abIEUWFFgRA1yrMD8sTvzsV+gEmWSyxzwE
	pZueM42DwBAohKjlVjwnyZwIBS01OkJFFz+TTOgVFi9YJ7SKcFwuiC83SfLktw7tfjO5
	uBCamJk9CQ5b9V0Dw16qrxEJ3ugjl8vU0642Y+7lFs9QOvpxM+3xgvJg0wUa4pCstqPW
	AcAw==
X-Gm-Message-State: AG10YOQQu1u5JqH/MW8r8LM/MInSw3GdebKgu5/fx8FoP1nKC/lvL2YpVj34ai8+JFouYQ==
X-Received: by 10.28.87.21 with SMTP id l21mr12172194wmb.8.1453118180880;
	Mon, 18 Jan 2016 03:56:20 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i2sm23409398wjx.42.2016.01.18.03.56.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 03:56:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Jan 2016 12:57:33 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160118115733.GA2614@jama>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<20160104175200.GA5744@jama> <569CB4A5.1040602@windriver.com>
MIME-Version: 1.0
In-Reply-To: <569CB4A5.1040602@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Mon, 18 Jan 2016 11:56:21 -0000
X-Groupsio-MsgNum: 59580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 05:47:17PM +0800, Robert Yang wrote:
>=20
>=20
> On 01/05/2016 01:52 AM, Martin Jansa wrote:
> > On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
> >> When the host distro uses gold mariadb-native fails to build.
> >>
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >>   meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recip=
es-support/mysql/mariadb.inc
> >> index a6826c3..6a55476 100644
> >> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> >> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] =3D ", ,,${PN}-setupdb"
> >>   # https://mariadb.atlassian.net/browse/MDEV-5982
> >>   TARGET_CFLAGS +=3D "-fuse-ld=3Dbfd"
> >>
> >> +BUILD_CFLAGS +=3D "-fuse-ld=3Dbfd"
> >> +BUILD_CXXFLAGS +=3D "-fuse-ld=3Dbfd"
> >
> > Unfortunately this breaks builds on older hosts with older gcc
> >
> > |   cc1: error: unrecognized command line option '-fuse-ld=3Dbfd'
> > http://errors.yoctoproject.org/Errors/Details/25859/
> >
> > Should we consider Ubuntu-12.04 insanely old?
>=20
> This patch has been merged, so we don't support Ubuntu 12.04 any more?

Correct, I don't want to push back incompatible changes anymore, so I've
upgraded my jenkins slaves and merge this change.

>=20
> // Robert
>=20
> >
> >> +
> >>   EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
> >>                    -DWITH_JEMALLOC=3Dno \
> >>                    -DWITHOUT_TOKUDB=3DTRUE \
> >> --
> >> 2.0.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlac0yUACgkQN1Ujt2V2gBw78gCgtqVTQlDWLe9u20AofQynhClD
JNcAnR6t2IXwH7gF8OMTwvVBH69uoUBT
=0+E0
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
