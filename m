Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F06765CDB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:08:05 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id q59so756110wes.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 01:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BscJXbQolcCwVnLeLgtbp4UqIBDmczV2JrLDX8O2/kY=;
	b=vQ5ZXx/cCKApNAqDh/GonTGqT9lSqWP7IOachnpJ+EQdfebzgxUxVBzlp4NqjM47gu
	A5s521nDYw6uIWtYG6/j3qvbhke4owrhcpdxAfQ6WyWFiGgm106KDEUjX9wjpG1wW502
	5E9pQk+TJ3/rQYnQ7FYow75OPYxCMqmN0vv+Iy2Kbn1hrhy7o0Ht2kLOzrjw0UeBnHKa
	NzHGqHysC4REjxjDUgbUILbZd0pFQcgEVlU6ulLzMTGXSNZNHjjST3xDwUzAF/yc7V6W
	apJNkFjqt5QBtCLDLTrezEXutIDez6mxsLDJ9hZpc4Vxw1K5uZ7qf6nvDgSTeq/RQSvF
	XK6Q==
X-Received: by 10.180.207.211 with SMTP id ly19mr46231462wic.73.1420621685347; 
	Wed, 07 Jan 2015 01:08:05 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gy8sm17011424wib.23.2015.01.07.01.08.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 01:08:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 10:08:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150107090807.GD29986@jama>
References: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
	<20150106162809.GB12498@jama> <54AC9929.8090702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54AC9929.8090702@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 1/2] log4c: fix expat rdepends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 09:08:12 -0000
X-Groupsio-MsgNum: 53716
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline

--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 06:25:45PM -0800, akuster808 wrote:
>=20
>=20
> On 01/06/2015 08:28 AM, Martin Jansa wrote:
> > On Tue, Jan 06, 2015 at 08:01:06AM -0800, Armin Kuster wrote:
> >> add --without-expat
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>   meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/re=
cipes-support/log4c/log4c_1.2.4.bb
> >> index 43e0746..0e58db7 100644
> >> --- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
> >> +++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
> >> @@ -12,5 +12,7 @@ S =3D "${WORKDIR}/${PN}-${PV}"
> >>
> >>   EXTRA_OECONF =3D "--prefix=3D/usr"
> >>
> >> -inherit autotools
> >> +PACKAGECONFIG ??=3D""
> >> +PACKAGECONFIG[expat] =3D ", --without-expat, expat, expat"
> >
> > Is explicit expat runtime dependency needed when enabled?
>=20
> Yep, need both. rdepends by itself did not fix the compile issue I saw.

I'm not suggesting dumping rdepends, I meant that depends should be
enough (rdepends is set automatically)

> =20
> /home/akuster/oss/mywork/poky/build/tmp/work/core2-64-poky-linux/log4c/1.=
2.4-r0/log4c-1.2.4/src/sd/domnode-expat.c:51:19:=20
> fatal error: expat.h: No such file or directory
> |  #include <expat.h>
> |                    ^
> | compilation terminated.
> | make[4]: *** [domnode-expat.lo] Error 1
>=20
>=20
> - armin
> >
> > It was detected by dependency test so I don't think so (so it's
> > correctly added by shlibs providers when enabled/detected).
> >
> >> +inherit autotools
> >> --
> >> 1.9.1
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

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSs93cACgkQN1Ujt2V2gBxucACguz4njICwQ5IhQTDrbyRD2JTv
DF8AoJfS6ZNk6Y+Ja0pEOn7obT1INTLo
=MvFY
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
