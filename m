Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 10A9771B04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:58:06 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y10so1886660wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 01:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UYeFfDOiiPKdl3APi8CVb8KBJ+tkbVptj8QCti0Tgj0=;
	b=MbrRyxgNWxFxCj6NdYTkjewgVWMxoveJZ2qVk38KIPJWqljE/bvhSk21vtOLqZpycw
	t8CyHWi4clPdB5Rx35nqI+qSFU+jY0XIXgsXg8oFo9abgRIXHC273LTElADOiV+NPP0C
	L4urjq/OoBQ4nvG6w61r2pHzGigRdlv69ReUW6d/ChmYDMC6fn8YK3AV1LzmOQ3HylZv
	UrGq3LtntWJ4jcQqtAAXXUChTqvgcE2QHUfgxZakVGLlOJhnblproFFpDivaubXRriaN
	BDo73rJpbmASM87SmBTviFVO/1Kkj2qE7Z7fpHYsXLjIrFtJ56B8CHbZn/cWtl0MIXgV
	D+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UYeFfDOiiPKdl3APi8CVb8KBJ+tkbVptj8QCti0Tgj0=;
	b=Qm/tMyYzGes4i5whhZTW3qIosD59T2+28PGnuOVFSWDR15Ji2/sgBDqN6TJgpT9MQO
	myVirctgnLZPq9otyAADnustcBFp8QcK7u+Jdo3Uxc2IBAdt7Nl01BE7gllk4j6pIhSb
	+qv+rpc4VEq95dZEH6ShD+ik+zepotByeK9f1yKCDcU3AR20mzU3eUDZ/uQ7iy7SHkPk
	9DcIJz/nm6HPcPyLqbVZb1X3H4gMhLuneecNScqxNsr9ylz32D5C/5p0inyDmIgtG0qx
	45q/UPapxPPx58exv7+cuNT2p4STxc9Gy42tJYjQyII5jcPrcJ95QqAbZRRgpizjaZbu
	ZjZg==
X-Gm-Message-State: AODbwcDW5MzVgiYD7uKkB/bJaT0JiN4zyWt20J0mzuIZMne9dYOSqgXf
	2h60O+hEO2Oh0g==
X-Received: by 10.28.166.12 with SMTP id p12mr1544395wme.23.1495011487305;
	Wed, 17 May 2017 01:58:07 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 17sm19283021wmn.7.2017.05.17.01.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 May 2017 01:58:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 17 May 2017 10:58:58 +0200
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Message-ID: <20170517085858.GB3086@jama>
References: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
In-Reply-To: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] wxstreams: fix build with gcc-6 (patch from Debian). Remove blacklists for wvstreams and wvdial
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
X-List-Received-Date: Wed, 17 May 2017 08:58:08 -0000
X-Groupsio-MsgNum: 66778
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2017 at 02:28:11PM +0200, Gianfranco Costamagna wrote:
> From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
>=20
> Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Was wvdial build tested? wvdial fails to build because it's missing pkgconf=
ig
inherit:

http://errors.yoctoproject.org/Errors/Details/142780/

> ---
>  meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |  2 --
>  .../wvdial/wvstreams/gcc-6.patch                   | 42 ++++++++++++++++=
++++++
>  .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |  4 +--
>  3 files changed, 43 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.p=
atch
>=20
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe=
/recipes-connectivity/wvdial/wvdial_1.61.bb
> index 80e72bd..f7adf4c 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
> @@ -28,5 +28,3 @@ do_configure() {
>  do_install() {
>      oe_runmake prefix=3D${D}/usr PPPDIR=3D${D}/etc/ppp/peers install
>  }
> -
> -PNBLACKLIST[wvdial] ?=3D "Depends on broken wvstreams - the recipe will =
be removed on 2017-09-01 unless the issue is fixed"
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch b/=
meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
> new file mode 100644
> index 0000000..b084887
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
> @@ -0,0 +1,42 @@
> +Description: Fix compilation with gcc-6
> +Author: Gert Wollny <gw.fossdev@gmail.com>
> +Last-Updated: 2016-07-26
> +Forwarded: No
> +Bug-Debian: https://bugs.debian.org/811659
> +Bug-Debian: https://bugs.debian.org/831146
> +
> +--- a/streams/wvstream.cc
> ++++ b/streams/wvstream.cc
> +@@ -907,9 +907,9 @@
> +    =20
> +     if (forceable)
> +     {
> +-	si.wants.readable =3D readcb;
> +-	si.wants.writable =3D writecb;
> +-	si.wants.isexception =3D exceptcb;
> ++	si.wants.readable =3D static_cast<bool>(readcb);
> ++	si.wants.writable =3D static_cast<bool>(writecb);
> ++	si.wants.isexception =3D static_cast<bool>(exceptcb);
> +     }
> +     else
> +     {
> +@@ -1019,7 +1019,8 @@
> +=20
> + IWvStream::SelectRequest WvStream::get_select_request()
> + {
> +-    return IWvStream::SelectRequest(readcb, writecb, exceptcb);
> ++    return IWvStream::SelectRequest(static_cast<bool>(readcb), static_c=
ast<bool>(writecb),
> ++				    static_cast<bool>(exceptcb));
> + }
> +=20
> +=20
> +@@ -1107,7 +1108,8 @@
> +     // inefficient, because if the alarm was expired then pre_select()
> +     // returned true anyway and short-circuited the previous select().
> +     TRACE("hello-%p\n", this);
> +-    return !alarm_was_ticking || select(0, readcb, writecb, exceptcb);
> ++    return !alarm_was_ticking || select(0, static_cast<bool>(readcb),
> ++					static_cast<bool>(writecb), static_cast<bool>(exceptcb));
> + }
> +=20
> +=20
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/met=
a-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index fe79dc1..607a617 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "http://${BPN}.googlecode.com/files/${BP}.t=
ar.gz \
>             file://05_gcc.diff \
>             file://06_gcc-4.7.diff \
>             file://07_buildflags.diff \
> +           file://gcc-6.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
> @@ -46,6 +47,3 @@ FILES_libwvstreams-extras-dbg =3D "${libdir}/.debug/lib=
wvbase.so.* ${libdir}/.debu
> =20
>  FILES_${PN}-valgrind =3D "${libdir}/valgrind/wvstreams.supp"
>  RDEPENDS_${PN} +=3D "perl"
> -
> -# http://errors.yoctoproject.org/Errors/Details/68614/
> -PNBLACKLIST[wvstreams] ?=3D "BROKEN: fails to build with gcc-6 - the rec=
ipe will be removed on 2017-09-01 unless the issue is fixed"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWRwQ0QAKCRA3VSO3ZXaA
HF3BAKC1Vc/MxEKv2w/BxKyczeKuMZ41AQCgpXBa6F/PQvLEfwJM1gj6tSG+/7o=
=IQk9
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
