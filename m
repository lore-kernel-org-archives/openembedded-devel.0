Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7dAc-00056U-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 03:43:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so3190458eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 18:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BWlo7KTL96xquLQ+VUcwbGkk1b9318mBKIztMw3uCyE=;
	b=jDpMwbkuzhHcRAiBRoYporXFD9+xkYktOBVaHEhXbaDZLlM0xytoty2YAg8MagoiOr
	ADLUERMXm6U8+rdQ+SoZEXkwoX4c5LCq+GcEKL7YGWcXKzb+Ry95oXNu9F05G9bQ21Fw
	5xveaU+5S3VQ1wkWpx15P4vI9HMP/HkemFw0h930GVvKbi4RsFDm0QG0P+2wAvW49mdr
	GIsH6rzM824DkBT2zGUpjf2LACBc3mFu31I/GMojyQPgXiNlxHJ2COUtNoVUPMKavq3I
	GWxGRmQP1UCnkxrNKAkls6awCrmNnFzBrsvLiqtrmaoK4IwRkmyPXdUVfIKuVMGKtdaI
	7slA==
X-Received: by 10.14.173.67 with SMTP id u43mr51633241eel.22.1361240813458;
	Mon, 18 Feb 2013 18:26:53 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t4sm101478172eel.0.2013.02.18.18.26.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 18:26:52 -0800 (PST)
Date: Tue, 19 Feb 2013 03:27:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130219022702.GQ3300@jama>
References: <1360880153-8526-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1360880153-8526-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-initramfs][PATCH] initramfs-kexecboot-image: update IMAGE_INSTALL after mtd-utils split
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
X-List-Received-Date: Tue, 19 Feb 2013 02:43:03 -0000
X-Groupsio-MsgNum: 43236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZP7cwq+yCXYhlQRU"
Content-Disposition: inline

--ZP7cwq+yCXYhlQRU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 11:15:53PM +0100, Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

merged, thanks

> ---
>  meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.=
bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
> index 7e617ad..01e5b84 100644
> --- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
> +++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
> @@ -9,9 +9,9 @@ IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>  # avoid circular dependencies
>  EXTRA_IMAGEDEPENDS =3D ""
> =20
> -# for ubiattach we have to install full mtd-utils (>700KiB)
> +# for ubiattach we have to install mtd-utils-ubifs
>  # or use ubiattach-klibc instead
> -IMAGE_INSTALL =3D "kexec kexecboot mtd-utils"
> +IMAGE_INSTALL =3D "kexec kexecboot mtd-utils-ubifs"
> =20
>  # Do not pollute the initrd image with rootfs features
>  IMAGE_FEATURES =3D ""
> --=20
> 1.7.12.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZP7cwq+yCXYhlQRU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEi4vYACgkQN1Ujt2V2gBzOCACcDacnTvhmnRozGb7vmVO4W6/w
fPUAnRK6JkMeM+aaWiIWpnhQGisyQthU
=i0sR
-----END PGP SIGNATURE-----

--ZP7cwq+yCXYhlQRU--
