Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rzygp-0004VQ-Mn
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 00:00:07 +0100
Received: by eaal10 with SMTP id l10so2373604eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.40.76 as permitted sender) client-ip=10.14.40.76; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.40.76 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.40.76])
	by 10.14.40.76 with SMTP id e52mr14211407eeb.8.1329864708537 (num_hops
	= 1); Tue, 21 Feb 2012 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hcZQeyzm1C5RJjABxtRsHdiquO14UN6O3s2UKSSjwhA=;
	b=kLaqin/btgNs3mQQxTZg3u/8W3GzLAtOUID44GjQsAsO20zcsYIFVMP5g9HmlDZQ6K
	4XPGLP+CysgH22HGLCv+HhHIjU9ef7JWZyzF2zfbZ6d2UW4bBbDrjGoCKYG9yVUrkNJD
	n7gy+1sm2wEsnhGS1P65Y3TMmgdbh+jSzEpKw=
Received: by 10.14.40.76 with SMTP id e52mr11352329eeb.8.1329864708464;
	Tue, 21 Feb 2012 14:51:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm95177808eeb.7.2012.02.21.14.51.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 14:51:47 -0800 (PST)
Date: Tue, 21 Feb 2012 23:51:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120221225146.GC3769@jama.jama.net>
References: <ef8b93c13cabd9e766e7f4d96df14710b36c3b87.1329780587.git.andrea.adami@gmail.com>
	<1329864496-27641-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1329864496-27641-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH v3 3/3] remove linux-kexecboot_3.1, now in meta-initramfs
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
X-List-Received-Date: Tue, 21 Feb 2012 23:00:08 -0000
X-Groupsio-MsgNum: 37307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline

--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2012 at 11:48:16PM +0100, Andrea Adami wrote:
> * add .bbappend
> * bump PR and INC_PR

AFAIK if you don't move all versions at once then 3.2 will always win
(ignoring D_P between layers).

Cheers,

>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-kexecboot_3.1.bb       |    7 ----
>  recipes-kernel/linux/linux-kexecboot_3.1.bbappend |   36 +++++++++++++++=
++++++
>  2 files changed, 36 insertions(+), 7 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bb
>  create mode 100644 recipes-kernel/linux/linux-kexecboot_3.1.bbappend
>=20
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel=
/linux/linux-kexecboot_3.1.bb
> deleted file mode 100644
> index 28dc370..0000000
> --- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require linux-kexecboot.inc
> -require linux-${PV}.inc
> -
> -PR =3D "${INC_PR}.7"
> -S =3D "${WORKDIR}/linux-${PV}"
> -
> -COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bbappend b/recipes-=
kernel/linux/linux-kexecboot_3.1.bbappend
> new file mode 100644
> index 0000000..74d63bb
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-kexecboot_3.1.bbappend
> @@ -0,0 +1,36 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linux-kexecboot-${PV}:${THISDIR=
}/files:"
> +
> +COMPATIBLE_MACHINE =3D "(akita|c7x0|collie|poodle|tosa|spitz)"
> +
> +# Note we set loglevel=3D3 and master console on serial to protect bootl=
ogo.
> +CMDLINE_c7x0 =3D "console=3Dtty1 console=3DttyS0,115200n8"
> +CMDLINE_tosa =3D "console=3Dtty1 console=3DttyS0,115200n8"
> +CMDLINE_poodle =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drota=
te:1"
> +CMDLINE_akita =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> +CMDLINE_collie =3D "console=3Dtty1 console=3DttySA0,115200n8 fbcon=3Drot=
ate:1 mem=3D64M"
> +CMDLINE_spitz =3D "console=3Dtty1 console=3DttyS0,115200n8 fbcon=3Drotat=
e:1"
> +
> +# Zaurus machines need kernel size-check.
> +KERNEL_IMAGE_MAXSIZE_akita =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_c7x0 =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_collie =3D "1048576"
> +KERNEL_IMAGE_MAXSIZE_poodle =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_tosa =3D "1294336"
> +KERNEL_IMAGE_MAXSIZE_spitz =3D "1294336"
> +
> +LOGO_SIZE ?=3D "."
> +
> +SRC_URI +=3D "file://defconfig \
> +           file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
> +           "
> +
> +SRC_URI_append_collie =3D " \
> +                         file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-st=
ructure-on-collie.patch \
> +                         file://locomo_kbd_tweak-r2.patch \
> +                         "
> +
> +SRC_URI_append_poodle =3D " \
> +                         file://locomo_kbd_tweak-r2.patch \
> +                         "
> +
> +
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

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9EIAIACgkQN1Ujt2V2gByDBgCcDVPU7wEUQSoECB1X/CC9oh8w
4QoAmwXy1u0HUxM9r/PC1unk9KtE4vHd
=RBoP
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
