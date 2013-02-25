Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UA43k-0005bY-I7
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2013 20:50:01 +0100
Received: by mail-da0-f45.google.com with SMTP id v40so1614649dad.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2013 11:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=akckwJEO/GaS4PSSYxVeslsbQqFElEzSVEjAU0dfvL0=;
	b=v9Nz5phCZRn2GX/EN+VY1JIqhCyDxIOWiDBWADLQjUWAMxg6bfbWaDtnhlfMgWdlGN
	swHq1kWUVcauYoXlMEjRhdWwHZPnwq8cWfR8ZGn31C1k5QFdQpRITc1CeV3QP9s2Q1fY
	4UcIv4VsjeVL9P+/w1geiE7BBOfPZkbg2WYiecUmZxmq9r+3c8u7275gvGLeMujytCV0
	1kuqq0zfLuGtco0Fh3oSB8WEoE19r84bnFjeXRieAplM6/h63dVDLmOkYPiTQYI3P0d2
	WnCoV7csPYIMQ7fXt9Xg6JvyAbdQUH9ukWhHy4FimFlI+1KLJKGM1t3HxiOTBCI+df2M
	5G/g==
X-Received: by 10.66.11.196 with SMTP id s4mr20411289pab.207.1361820821773;
	Mon, 25 Feb 2013 11:33:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wm3sm13647770pbc.4.2013.02.25.11.33.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 11:33:40 -0800 (PST)
Date: Mon, 25 Feb 2013 20:33:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130225193350.GF3239@jama>
References: <1361470483-15230-1-git-send-email-jeffrey.honig@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1361470483-15230-1-git-send-email-jeffrey.honig@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] Resolve sysvinit and util-linux conflicting man pages.
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
X-List-Received-Date: Mon, 25 Feb 2013 19:50:01 -0000
X-Groupsio-MsgNum: 43301
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="27ZtN5FSuKKSZcBU"
Content-Disposition: inline

--27ZtN5FSuKKSZcBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2013 at 01:14:43PM -0500, jeffrey.honig@windriver.com wrote:
> From: Jeffrey C Honig <jch@honig.net>
>=20
> [ CQID: WIND00404316 ]

This belongs to oe-core ML.

>=20
> Use alternatives mechanism to prevent sysvlinux and util-linux
> man pages from causing conflicts.
> ---
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |   11 ++++++++++-
>  meta/recipes-core/util-linux/util-linux.inc       |    9 +++++++++
>  meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>  3 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipe=
s-core/sysvinit/sysvinit_2.88dsf.bb
> index 0a11139..e64b67a 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -5,7 +5,7 @@ SECTION =3D "base"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
>                      file://COPYRIGHT;endline=3D15;md5=3D349c872e0066155e=
1818b786938876a4"
> -PR =3D "r10"
> +PR =3D "r11"
> =20
>  RDEPENDS_${PN} =3D "${PN}-inittab"
> =20
> @@ -45,6 +45,15 @@ ALTERNATIVE_LINK_NAME[poweroff] =3D "${base_sbindir}/p=
oweroff"
>  ALTERNATIVE_${PN}-pidof =3D "pidof"
>  ALTERNATIVE_LINK_NAME[pidof] =3D "${base_bindir}/pidof"
> =20
> +ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 u=
tmpdump.1"
> +
> +ALTERNATIVE_LINK_NAME[last.1] =3D "${mandir}/man1/last.1"
> +ALTERNATIVE_LINK_NAME[mesg.1] =3D "${mandir}/man1/mesg.1"
> +ALTERNATIVE_LINK_NAME[mountpoint.1] =3D "${mandir}/man1/mountpoint.1"
> +ALTERNATIVE_LINK_NAME[sulogin.8] =3D "${mandir}/man8/sulogin.8"
> +ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/man1/utmpdump.1"
> +ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> +
>  PACKAGES =3D+ "sysvinit-pidof sysvinit-sulogin"
>  FILES_${PN} +=3D "${base_sbindir}/* ${base_bindir}/*"
>  FILES_sysvinit-pidof =3D "${base_bindir}/pidof.sysvinit ${base_sbindir}/=
killall5"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 10439c0..c91f4a3 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -154,6 +154,15 @@ ALTERNATIVE_LINK_NAME[pivot_root] =3D "${base_sbindi=
r}/pivot_root"
>  ALTERNATIVE_LINK_NAME[mkfs.minix] =3D "${base_sbindir}/mkfs.minix"
>  ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
> =20
> +ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 u=
tmpdump.1"
> +
> +ALTERNATIVE_LINK_NAME[last.1] =3D "${mandir}/man1/last.1"
> +ALTERNATIVE_LINK_NAME[mesg.1] =3D "${mandir}/man1/mesg.1"
> +ALTERNATIVE_LINK_NAME[mountpoint.1] =3D "${mandir}/man1/mountpoint.1"
> +ALTERNATIVE_LINK_NAME[sulogin.8] =3D "${mandir}/man8/sulogin.8"
> +ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/man1/utmpdump.1"
> +ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> +
>  # There seems to be problem, atleast on nslu2, with these, untill they a=
re
>  # fixed the busybox ones have higher priority
>  ALTERNATIVE_PRIORITY[hwclock] =3D "10"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.22.2.bb
> index dd95573..f91784b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION =3D "2.22"
> -PR =3D "r0"
> +PR =3D "r1"
>  require util-linux.inc
> =20
>  # note that `lscpu' is under GPLv3+
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--27ZtN5FSuKKSZcBU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlErvJ4ACgkQN1Ujt2V2gBycmwCghCXWz1Kg5iZNh+Y3yJEnCEQN
gOMAoKKBmmuQ52szoUEh+Jo6V1Vr3EeU
=E5R6
-----END PGP SIGNATURE-----

--27ZtN5FSuKKSZcBU--
