Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id BCFB07067B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:45:20 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so3009617wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jgFJoLx0M8q0EV+J0al/x5Q1TDmtQRdYcrlotp1Evls=;
	b=ZgrBBmGEUIoL7NYb7zsITx2JeZPBfNuzoK47VZ545PxuIXtOZQilhvcC1kg2StQfAZ
	OKHcdPoAOojdX3Uat5BhHjs3ySGewTIfReHqbLsTQp2qn6lfA7cfDntOfl/SaYYWI34C
	vmwxUDuwqfjb98i4RFozUzzIWl8vBLi1GE4WPvx5O2+0NOPLNEOa6yJBJl1tIYu6A1qa
	TBhkgWwokXgq4ug8DBHe7MjynDaOQSImtdKt4PZWn66tJdgy7TIYS9CVEkPuIENxzZPl
	wviIVPNZ7TVsDRolm2SYFuYE+ZGnvQToXBmB6fuvuc/M3GFaJQ8w9r+hi2KbwUthCYT4
	Em+w==
X-Received: by 10.180.81.234 with SMTP id d10mr22704050wiy.79.1405604719038;
	Thu, 17 Jul 2014 06:45:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o12sm68748911wiw.5.2014.07.17.06.45.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jul 2014 06:45:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Jul 2014 15:45:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140717134529.GK2433@jama>
References: <1405604143.3668.20.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1405604143.3668.20.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: libgc: Drop, its bwdgc in OE-Core
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
X-List-Received-Date: Thu, 17 Jul 2014 13:45:23 -0000
X-Groupsio-MsgNum: 51038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVQB43uFympFEer4"
Content-Disposition: inline

--EVQB43uFympFEer4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 02:35:43PM +0100, Richard Purdie wrote:
> There is not point in having two of this piece of software, I've merged
> the missing PACKAGECONFIG into the OE-Core version, we can drop this one.

You probably meant bdwgc in the subject

bdwgc doesn't provide libgc, so you should update
meta-oe/recipes-support/zile/zile_2.4.9.bb:DEPENDS =3D "ncurses libgc"

in the same commit

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta-oe/recipes-support/libgc/libgc_7.2d.bb b/meta-oe/recipe=
s-support/libgc/libgc_7.2d.bb
> deleted file mode 100644
> index 82a7f13..0000000
> --- a/meta-oe/recipes-support/libgc/libgc_7.2d.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY =3D "Garbage Collection Library"
> -DESCRIPTION =3D "The GC library provides a garbage collector for C and C=
++."
> -HOMEPAGE =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
> -
> -LICENSE =3D "GPLv2 & MIT"
> -LIC_FILES_CHKSUM =3D "file://doc/README;beginline=3D1;endline=3D37;md5=
=3D9f4fd307082acf7a8af3e3897245163b  \
> -                    file://README.QUICK;beginline=3D1;endline=3D23;md5=
=3D293ea42f3f606426deefadd5dd8ddd15 \
> -"
> -
> -SRC_URI =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-$=
{PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "91340b28c61753a789eb6077675d87d2"
> -SRC_URI[sha256sum] =3D "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8e=
bd16aa985b511c5e"
> -
> -S =3D "${WORKDIR}/gc-7.2"
> -
> -inherit autotools pkgconfig
> -
> -# by default use external libatomic-ops
> -PACKAGECONFIG ??=3D "libatomic-ops"
> -PACKAGECONFIG[libatomic-ops] =3D "--with-libatomic-ops=3Dyes,--with-liba=
tomic-ops=3Dno,libatomics-ops"
> -
> -PACKAGES =3D+ "${PN}-docs"
> -FILES_${PN}-docs =3D "/usr/share/gc"
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVQB43uFympFEer4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPH03kACgkQN1Ujt2V2gByzegCfRfU73/GzGV7q/wEhEtOZPJGq
guEAoKv7S5OoLKpiP6z5wccnKJg12rdR
=oVoe
-----END PGP SIGNATURE-----

--EVQB43uFympFEer4--
