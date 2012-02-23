Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0SQF-0006EW-HO
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 07:44:59 +0100
Received: by eaal10 with SMTP id l10so395271eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 22:36:38 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.202.130 as permitted sender) client-ip=10.14.202.130; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.202.130 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.202.130])
	by 10.14.202.130 with SMTP id d2mr20138eeo.83.1329978998591 (num_hops =
	1); Wed, 22 Feb 2012 22:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MCGozcCn6r2jWcl3rtLaxNKXoS4XMDe9xO7Sn/wuhyw=;
	b=gbX02MnF1oR5HRXYTz7A6VYteG6Te0pIKlUiqCSnp6PU/hYb5wqepnH4pFEh1xJBVV
	5C6TUs/vGPIgaNaTCOl6W9CJS/qNbf2WmNh2DTcHlBDb23UCH+udtEbHNrfMnAufjv24
	SFpC3I9qsMNAlR2OxBWfhU186pKLwbhI8UrhU=
Received: by 10.14.202.130 with SMTP id d2mr15875eeo.83.1329978998354;
	Wed, 22 Feb 2012 22:36:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm1885266eem.0.2012.02.22.22.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 22:36:37 -0800 (PST)
Date: Thu, 23 Feb 2012 07:36:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120223063635.GM3769@jama.jama.net>
References: <1329949688-15070-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1329949688-15070-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH] linux_3.2: update from 3.2.1 to 3.2.7
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
X-List-Received-Date: Thu, 23 Feb 2012 06:44:59 -0000
X-Groupsio-MsgNum: 37363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EOHJn1TVIJfeVXv2"
Content-Disposition: inline

--EOHJn1TVIJfeVXv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 11:28:08PM +0100, Andrea Adami wrote:
> * apply latest patchset
> * bump INC_PR

Looking at this commit and almost the same in meta-initramfs, why
haven't you moved linux-3.2.inc to meta-initramfs and use that from
meta-handheld as it already depends on meta-initramfs layer for
kexecboot?

Cheers,

> ---
>  recipes-kernel/linux/linux-3.2.inc |    6 +++---
>  recipes-kernel/linux/linux_3.2.bb  |    2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-3.2.inc b/recipes-kernel/linux/li=
nux-3.2.inc
> index 8dd30d9..3a37200 100644
> --- a/recipes-kernel/linux/linux-3.2.inc
> +++ b/recipes-kernel/linux/linux-3.2.inc
> @@ -3,12 +3,12 @@ DEFAULT_PREFERENCE =3D "-1"
>  COMPATIBLE_MACHINE =3D "(spitz)"
> =20
>  SRC_URI +=3D "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;=
name=3Dkernel \
> -           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.1.bz2;apply=
=3Dyes;name=3Dstablepatch \
> +           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=
=3Dyes;name=3Dstablepatch \
>             file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> =20
>  SRC_URI[kernel.md5sum] =3D "7ceb61f87c097fc17509844b71268935"
>  SRC_URI[kernel.sha256sum] =3D "c881fc2b53cf0da7ca4538aa44623a7de043a41f7=
6fd5d0f51a31f6ed699d463"
> -SRC_URI[stablepatch.md5sum] =3D "31fc34340f11118873463a1d59d47b7f"
> -SRC_URI[stablepatch.sha256sum] =3D "e9a26dc5faa309ae5172e3c65081fa98b60b=
efab160fb14d9a75816bbde15626"
> +SRC_URI[stablepatch.md5sum] =3D "899624bffed6a19578613b672cc9483f"
> +SRC_URI[stablepatch.sha256sum] =3D "779c548f4418f0baa782252d15a54fadf3c8=
8d79fc547ee5801d31798020e701"
> diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/lin=
ux_3.2.bb
> index 28564b6..6c15a88 100644
> --- a/recipes-kernel/linux/linux_3.2.bb
> +++ b/recipes-kernel/linux/linux_3.2.bb
> @@ -1,4 +1,4 @@
>  require linux.inc
>  require linux-${PV}.inc
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EOHJn1TVIJfeVXv2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9F3nMACgkQN1Ujt2V2gBz67QCbBnSwZDIoMCqzozVxMoc8rshH
Z8MAoJpRKHazlJMFmxz1x1t2TRjMPSTo
=EaHx
-----END PGP SIGNATURE-----

--EOHJn1TVIJfeVXv2--
