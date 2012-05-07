Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRULB-0004ZQ-15
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 22:15:29 +0200
Received: by wibhn14 with SMTP id hn14so1112623wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 13:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aDtWxTtNDv0wmOAE/IwV06v6ZRXygys2fWPuv39ZTkM=;
	b=mxLBP1s8R9mLWa5OP0z86Nziegvxm2kntROqYyWnY56c75fKn8fA7BRkzfE5WhjAPx
	5BdFNoIzTeyvFIDJNW1HUkOBLWAGiSEW+FWjpgryz/AWE8l5UyrqFrzc/6Osf3VpRbE5
	jfPUHMMUbaaNNT69gp5zrn8zznXsNYpALK62o8CNVMlxoPtaUaW05Uz17bbJxTJi8gpC
	sTvjISGM/H+9p3rAeL/4zHxqTpHdTBjmVi3A3F46DV1tVnyoSkZ7chHa4E6krJCPIh+p
	tIo6ndbIdIPUPqXe+iDusVtXTFv6Ndege/QKcvSpfETaDJDfmo/RgGcoEppXsFlopsOl
	YpTg==
Received: by 10.216.137.149 with SMTP id y21mr10606646wei.110.1336421138225;
	Mon, 07 May 2012 13:05:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm37441667wib.9.2012.05.07.13.05.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 13:05:37 -0700 (PDT)
Date: Mon, 7 May 2012 22:05:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120507200536.GB3146@jama.jama.net>
References: <1336420791-4944-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1336420791-4944-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] kmod: Delete in favor of OE-Core
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
X-List-Received-Date: Mon, 07 May 2012 20:15:29 -0000
X-Groupsio-MsgNum: 38609
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline

--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 07, 2012 at 12:59:51PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

We should delete it only after issues reported on oe-core and here in=20
"[meta-oe][meta-efl][meta-gpe][PATCH 7/7] kernel.bbclass"
are resolved..

and that kernel.bbclass change seems wrong.. removing depmod from
DEPENDS is not enough.. better to use your patch from oe-core which was
included in my patchset here..

Cheers,

> ---
>  meta-oe/classes/kernel.bbclass          |    2 +-
>  meta-oe/recipes-kernel/kmod/kmod_git.bb |   24 ------------------------
>  2 files changed, 1 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-oe/recipes-kernel/kmod/kmod_git.bb
>=20
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbcl=
ass
> index 98320fe..81612da 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
> =20
>  PROVIDES +=3D "virtual/kernel"
> -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod=
 virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> +DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_P=
REFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> =20
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS =3D "1"
> diff --git a/meta-oe/recipes-kernel/kmod/kmod_git.bb b/meta-oe/recipes-ke=
rnel/kmod/kmod_git.bb
> deleted file mode 100644
> index aae9e7f..0000000
> --- a/meta-oe/recipes-kernel/kmod/kmod_git.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION =3D "kmod - handle kernel modules"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -PR =3D "r3"
> -
> -inherit autotools gitpkgv
> -
> -PKGV =3D "${GITPKGVTAG}"
> -SRCREV =3D "8885ced062131214448fae056ef453f094303805"
> -SRC_URI =3D "git://git.profusion.mobi/kmod.git \
> -           file://0001-man-disable-man-page-generation-because-we-don-t-=
hav.patch \
> -"
> -
> -S =3D "${WORKDIR}/git"
> -
> -do_configure_prepend() {
> -	gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc=
=2Emake
> -}
> -
> -PACKAGES =3D+ "libkmod"
> -FILES_libkmod =3D "${libdir}/lib*${SOLIBS}"
> -
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+oKxAACgkQN1Ujt2V2gByX+QCfcTcMkbOSlXM7v+rmBEglvnHA
tVAAoIacR3t8xr7qlyrsbsTL3CWr9ld5
=prbu
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
