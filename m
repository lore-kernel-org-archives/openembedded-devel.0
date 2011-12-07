Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYJd9-0006wT-7P
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 16:41:59 +0100
Received: by eaao14 with SMTP id o14so553119eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 07:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LWB91466kwPmLE8ozHiG9PCHJ0w6ny2vYk9Fl2FN8+A=;
	b=jiYaPZtVAS49id/dXYEUDhgQ8Oqq92mZlCB4KSEIuc2e9Miiiw38brP/TtKL8pwpsF
	vxv2SXcDfZVkb/rGKqvVWAQyLfGFoXGjNR2q3Qm8ewHYreJ0akGB6dmgPL2HggUdMU/8
	jMirEyGTfiQHiYlSLZZ8pVegMSR3pQ5n4dFw0=
Received: by 10.213.17.70 with SMTP id r6mr673384eba.100.1323272107720;
	Wed, 07 Dec 2011 07:35:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm6854939eec.10.2011.12.07.07.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 07:35:05 -0800 (PST)
Date: Wed, 7 Dec 2011 16:34:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111207153453.GG3897@jama.jama.net>
References: <1323271091-8549-1-git-send-email-ospite@studenti.unina.it>
MIME-Version: 1.0
In-Reply-To: <1323271091-8549-1-git-send-email-ospite@studenti.unina.it>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core][PATCH] gcc-4.6.inc: remove gcc-arm-set-cost.patch merged upstream
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
X-List-Received-Date: Wed, 07 Dec 2011 15:41:59 -0000
X-Groupsio-MsgNum: 35967
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline

--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 04:18:11PM +0100, Antonio Ospite wrote:
> gcc-arm-set-cost.patch is not needed anymore as it has been merged
> upstream, remove it.

I belive this is because you're using meta-oe from where this patch was
moved to oe-core and it wasn't removed from meta-oe at the same time when=
=20
it was applied in oe-core.

So right fix is to update your meta-oe checkout
http://git.openembedded.org/meta-openembedded/commit/?id=3D9e0a23fcb4e2c0c5=
7de5e7b0ee8ed253b11d15b8

Regards,
=20
> Having it around breaks compilation with messages like:
>=20
> .../gcc-4.6.2+svnr181430-r22/gcc-4_6-branch/gcc/config/arm/arm.c:7945:5: =
error: duplicate case value
>=20
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>=20
> Hi,
>=20
> please review this one with extra care ;)
>=20
> Thanks,
>    Antonio Ospite
>    http://ao2.it
>=20
>  meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
>  .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |   34 --------------=
------
>  2 files changed, 1 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.pa=
tch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtool=
s/gcc/gcc-4.6.inc
> index 18e0536..e6a9b1a 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
> =20
> -PR =3D "r19"
> +PR =3D "r20"
> =20
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -72,7 +72,6 @@ SRC_URI =3D "svn://gcc.gnu.org/svn/gcc/branches;module=
=3D${BRANCH};proto=3Dhttp \
>  	   file://pr46934.patch \
>  	   file://pr32219.patch \
>  	   file://pr47551.patch \
> -	   file://gcc-arm-set-cost.patch \
>  	  "
> =20
>  SRC_URI_append_sh3  =3D " file://sh3-installfix-fixheaders.patch "
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch b/m=
eta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
> deleted file mode 100644
> index 04dabaf..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
> -
> - 	gcc/
> - 	Backport from mainline:
> -=20
> -	2011-08-18  Richard Sandiford  <richard.sandiford@linaro.org>
> -
> -	* config/arm/arm.c (arm_rtx_costs_1): Don't modify the costs of SET.
> -	(arm_size_rtx_costs): Likewise.
> -
> -=3D=3D=3D modified file 'gcc/config/arm/arm.c'
> ---- old/gcc/config/arm/arm.c	2011-08-12 08:08:31 +0000
> -+++ new/gcc/config/arm/arm.c	2011-08-18 13:53:37 +0000
> -@@ -7464,6 +7464,9 @@
> - 	*total =3D COSTS_N_INSNS (4);
> -       return true;
> -=20
> -+    case SET:
> -+      return false;
> -+
> -     default:
> -       *total =3D COSTS_N_INSNS (4);
> -       return false;
> -@@ -7811,6 +7814,9 @@
> -       *total =3D COSTS_N_INSNS (1) + 1;
> -       return true;
> -=20
> -+    case SET:
> -+      return false;
> -+
> -     default:
> -       if (mode !=3D VOIDmode)
> - 	*total =3D COSTS_N_INSNS (ARM_NUM_REGS (mode));
> -
> --=20
> 1.7.7.3
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fh50ACgkQN1Ujt2V2gBz4sQCffgVgO4ANqNyM8lMgI0X/lRt3
II4An0UTThMsO/WAruiW8vXEW7iZnUxl
=4Zr4
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
