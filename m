Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4pec-0003sQ-Mj
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 10:54:11 +0200
Received: by wgbdr1 with SMTP id dr1so1043881wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zcab8mHu18vPMFsgBi8RPoRqFC0kD8UTlUpTO8/LlUk=;
	b=S3lfIdndx8gH3m2WFLg0N9EwGSfLLRaaIZ3hcd4StHOWw02cldOj323WEK1I3b66TP
	9o2yrBHieQCMioL6ZH5Vs18o7nrqk5R2QZcMNPbqCZ/w0g1RxP2DIciebtgeT+Wy+WqQ
	wnmukp8HvAGp6NTCUkzkuNtT4+q02zihluDW/WlirGYLTsvETZ4OUf/JF8DrbbYRTToX
	rYq78XpsRXXAzRNEAh07b5HEuHqWZyBFFHfA0slPRasVCaOa8N3Zs0kasb8ZTxN6adnl
	ayuH9jQ6T8CkDM/eUH44KbArdiqqG048HpUB0CvjOIRnnCyyTq6o/cCqi9UVDzqrNuL5
	4pYQ==
Received: by 10.180.106.97 with SMTP id gt1mr3793916wib.5.1345797723480;
	Fri, 24 Aug 2012 01:42:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm3275733wib.2.2012.08.24.01.42.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 01:42:02 -0700 (PDT)
Date: Fri, 24 Aug 2012 10:42:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120824084209.GT3029@jama.jama.net>
References: <1345797366-17322-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1345797366-17322-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] pixman: fix qemu workaround
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
X-List-Received-Date: Fri, 24 Aug 2012 08:54:11 -0000
X-Groupsio-MsgNum: 40346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l4+/aJnPlhOv5JVj"
Content-Disposition: inline

--l4+/aJnPlhOv5JVj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 10:36:06AM +0200, Andreas M=FCller wrote:
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Fixes my emacs build again

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  ...lated-workarounds-in-cpu-features-detecti.patch |   63 ++++++++++----=
------
>  .../xorg-lib/pixman_0.27.2.bbappend                |    2 +
>  2 files changed, 33 insertions(+), 32 deletions(-)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qem=
u-related-workarounds-in-cpu-features-detecti.patch b/meta-oe/recipes-graph=
ics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-related-workarounds-in-cpu-feature=
s-detecti.patch
> index 8a1c524..4569dca 100644
> --- a/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-relat=
ed-workarounds-in-cpu-features-detecti.patch
> +++ b/meta-oe/recipes-graphics/xorg-lib/pixman-0.27.2/0001-ARM-qemu-relat=
ed-workarounds-in-cpu-features-detecti.patch
> @@ -1,25 +1,27 @@
> -From d140e69c1d76ed61d1feb53b79820951707ee5a6 Mon Sep 17 00:00:00 2001
> +From a0f53e1dbb3851bb0f0efcfdbd565b05e4be9cac Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Sun, 19 Aug 2012 15:15:45 +0200
> +Date: Thu, 23 Aug 2012 18:10:57 +0200
>  Subject: [PATCH 1/2] ARM: qemu related workarounds in cpu features detec=
tion
>   code
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> =20
> -This was ported from meta-oe's patch [1]
> +This was ported from meta-oe's patch [1]. The original pixman patch is f=
ound
> +at [2].
> =20
>  [1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-=
graphics/xorg-lib/pixman-0.26.2/0001-ARM-qemu-related-workarounds-in-cpu-fe=
atures-detecti.patch
> +[2] http://lists.freedesktop.org/archives/pixman/2011-January/000906.html
> =20
>  Upstream-Status: Inappropriate [other] qemu fix
> =20
>  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>  ---
> - pixman/pixman-arm.c |   74 ++++++++++++++++++++++++++++++++++++++++++++=
+++---
> - 1 files changed, 69 insertions(+), 5 deletions(-)
> + pixman/pixman-arm.c |   82 ++++++++++++++++++++++++++++++++++++++++----=
------
> + 1 files changed, 65 insertions(+), 17 deletions(-)
> =20
>  diff --git a/pixman/pixman-arm.c b/pixman/pixman-arm.c
> -index 23374e4..d0771fd 100644
> +index 23374e4..d98bda6 100644
>  --- a/pixman/pixman-arm.c
>  +++ b/pixman/pixman-arm.c
>  @@ -129,16 +129,35 @@ detect_cpu_features (void)
> @@ -58,40 +60,34 @@ index 23374e4..d0771fd 100644
>  =20
>       fd =3D open ("/proc/self/auxv", O_RDONLY);
>       if (fd >=3D 0)
> -@@ -147,22 +166,23 @@ detect_cpu_features (void)
> +@@ -147,32 +166,61 @@ detect_cpu_features (void)
>   	{
>   	    if (aux.a_type =3D=3D AT_HWCAP)
>   	    {
>  -		uint32_t hwcap =3D aux.a_un.a_val;
> -+		hwcap =3D aux.a_un.a_val;
> -=20
> - 		/* hardcode these values to avoid depending on specific
> - 		 * versions of the hwcap header, e.g. HWCAP_NEON
> - 		 */
> +-
> +-		/* hardcode these values to avoid depending on specific
> +-		 * versions of the hwcap header, e.g. HWCAP_NEON
> +-		 */
>  -		if ((hwcap & 64) !=3D 0)
> -+		if ((hwcap & ARM_HWCAP_VFP) !=3D 0)
> - 		    features |=3D ARM_VFP;
> +-		    features |=3D ARM_VFP;
>  -		if ((hwcap & 512) !=3D 0)
> -+		if ((hwcap & ARM_HWCAP_IWMMXT) !=3D 0)
> - 		    features |=3D ARM_IWMMXT;
> - 		/* this flag is only present on kernel 2.6.29 */
> +-		    features |=3D ARM_IWMMXT;
> +-		/* this flag is only present on kernel 2.6.29 */
>  -		if ((hwcap & 4096) !=3D 0)
> -+		if ((hwcap & ARM_HWCAP_NEON) !=3D 0)
> - 		    features |=3D ARM_NEON;
> +-		    features |=3D ARM_NEON;
> ++		hwcap =3D aux.a_un.a_val;
>   	    }
>   	    else if (aux.a_type =3D=3D AT_PLATFORM)
>   	    {
>  -		const char *plat =3D (const char*) aux.a_un.a_val;
> +-
> +-		if (strncmp (plat, "v7l", 3) =3D=3D 0)
>  +		plat =3D (const char*) aux.a_un.a_val;
>  +		plat_cnt++;
> -=20
> - 		if (strncmp (plat, "v7l", 3) =3D=3D 0)
> - 		    features |=3D (ARM_V7 | ARM_V6);
> -@@ -171,8 +191,52 @@ detect_cpu_features (void)
> - 	    }
> - 	}
> - 	close (fd);
> -+
> ++	    }
> ++	}
> ++	close (fd);
>  +	if (plat =3D=3D NULL || plat_cnt !=3D 1 || *plat !=3D 'v')
>  +	{
>  +	    /*
> @@ -106,17 +102,19 @@ index 23374e4..d0771fd 100644
>  +	    {
>  +		if (strcmp (u.machine, "armv7l") =3D=3D 0)
>  +		{
> -+		    features |=3D (ARM_V7 | ARM_V6);
> + 		    features |=3D (ARM_V7 | ARM_V6);
> +-		else if (strncmp (plat, "v6l", 3) =3D=3D 0)
>  +		    hwcap |=3D ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
>  +		    hwcap |=3D ARM_HWCAP_NEON; /* qemu is supposed to emulate neon */
>  +		}
>  +		else if (strcmp (u.machine, "armv6l") =3D=3D 0)
>  +		{
> -+		    features |=3D ARM_V6;
> + 		    features |=3D ARM_V6;
>  +		    hwcap |=3D ARM_HWCAP_VFP;  /* qemu is supposed to emulate vfp */
>  +		}
> -+	    }
> -+	}
> + 	    }
> + 	}
> +-	close (fd);
>  +	else if (strncmp (plat, "v7l", 3) =3D=3D 0)
>  +	{
>  +	    features |=3D (ARM_V7 | ARM_V6);
> @@ -134,6 +132,7 @@ index 23374e4..d0771fd 100644
>  +        features |=3D ARM_VFP;
>  +    if ((hwcap & ARM_HWCAP_IWMMXT) !=3D 0)
>  +        features |=3D ARM_IWMMXT;
> ++    /* this flag is only present on kernel 2.6.29 */
>  +    if ((hwcap & ARM_HWCAP_NEON) !=3D 0)
>  +        features |=3D ARM_NEON;
>  +
> @@ -141,5 +140,5 @@ index 23374e4..d0771fd 100644
>   }
>  =20
>  --=20
> -1.7.4.4
> +1.7.6.5
> =20
> diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend b/m=
eta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> index a04a549..c677167 100644
> --- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> +++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
> @@ -1,5 +1,7 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
> =20
> +PRINC :=3D "${@int(PRINC) + 1}"
> +
>  SRC_URI +=3D " \
>    file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch=
 \
>    file://0002-Generic-C-implementation-of-pixman_blt-with-overlapp.patch=
 \
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l4+/aJnPlhOv5JVj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA3PmEACgkQN1Ujt2V2gBwLRgCgj8bD4rsMKSBPLxBK0qoU2mRt
ab8An0myhbJEeqoSBITeHn0VpqAMnkgJ
=FTRo
-----END PGP SIGNATURE-----

--l4+/aJnPlhOv5JVj--
