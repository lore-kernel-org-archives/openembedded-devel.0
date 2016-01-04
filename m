Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 01B47731BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:24:59 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so226257004wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R5gBuWBv6mXAX7khbAkLJmD9W4uWjsBj/4JMyuAQkKM=;
	b=cH/QManE4S5nEjIfKAXAAlI8wkA/FyOglLGUw5gqrsCyLWmxHYPzICRbzS5o++Q8XC
	wvagj7lDnfhnS/mlQkYO3eRAclSIMycx2dmwR/Bf6268uYTyhiccn64EuDeUaoGpKrki
	ySg0krweBYia+TsapdU57VNJ2gAPX5XnfakXWopxhV/fOamLgbYFZHA1+TM3QOVh7AMd
	nyAT1CDpzI44qmRBkdsyOuAZmeUSZlXieKXgkstXrxAWlHs8fW6PI3xgHNVOuX+Gkl8Y
	5Op/t0WDmCDtpQhSd5mw4cEmFTOAVg5LQ1Ac56Sdqpua2eXqcwIS+9t+gN3QSKSutlal
	/41w==
X-Received: by 10.28.97.135 with SMTP id v129mr87073792wmb.78.1451931900043;
	Mon, 04 Jan 2016 10:25:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	75sm38924828wmo.22.2016.01.04.10.24.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 10:24:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Jan 2016 19:24:58 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160104182458.GB5744@jama>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<20160104175200.GA5744@jama>
	<CAMKF1soMFt_EGLUF8T61+7BcaureScErMsDyRdc-ZxLk3x1eFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soMFt_EGLUF8T61+7BcaureScErMsDyRdc-ZxLk3x1eFA@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Jan 2016 18:25:00 -0000
X-Groupsio-MsgNum: 59323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline

--7iMSBzlTiPOCCT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2016 at 10:15:23AM -0800, Khem Raj wrote:
> On Mon, Jan 4, 2016 at 9:52 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Wed, Dec 30, 2015 at 02:57:55PM +0100, Koen Kooi wrote:
> >> When the host distro uses gold mariadb-native fails to build.
> >>
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >>  meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recip=
es-support/mysql/mariadb.inc
> >> index a6826c3..6a55476 100644
> >> --- a/meta-oe/recipes-support/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
> >> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] =3D ", ,,${PN}-setupdb"
> >>  # https://mariadb.atlassian.net/browse/MDEV-5982
> >>  TARGET_CFLAGS +=3D "-fuse-ld=3Dbfd"
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
> >
>=20
> Its still maintained and supported until 2017 I believe.

By Canonical yes:
http://www.ubuntu.com/info/release-end-of-life
but that doesn't automatically make it good distribution for OE builds, I'm=
 playing
devils advocate here, because most jenkins slaves I have access to are
currently using 12.04 (that's why I've noticed this issue in first place).

I was already considering upgrading them to 14.04 and people can use
build-appliance-image if they cannot just upgrade their host distro.

FWIW: Poky already dropped it from SANITY_TESTED_DISTROS in Fido release:

commit b528712a076ad2fd08ec8a3cbcd7aefd612d999f
Author: Lucian Musat <george.l.musat@intel.com>
Date:   Mon Mar 23 12:35:12 2015 +0200

    meta-yocto/distro: Updated SANITY_TESTED_DISTROS.
   =20
    Added OpenSUSE-13.2, Fedora 21. Removed poky 1.6 and Ubuntu 12.04.

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaKuPkACgkQN1Ujt2V2gBw+MwCeL0c3HRoOWcvlN0rgPB21YaPd
ktsAn2FMMnLUPotFzGECJ3Vb2d3s6hG7
=GWJH
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--
