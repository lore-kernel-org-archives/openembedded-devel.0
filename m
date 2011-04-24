Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QE7Bt-0008SL-UX
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 23:50:05 +0200
Received: by bwz5 with SMTP id 5so1410620bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Apr 2011 14:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ETBw3DgTF2CM/RrBmh8h5wa30JfvmzFuQEXcN4E8qfY=;
	b=BYHahx3G8N3EMCoxt199fNk8oJdmFq/hs2wk0CXK7q/LHqFzxh7haXgxR7MEqZhim1
	hkLuASMocXr/YNPaoQ8/S6KE/jiD/ah3+UCS3dL3ftFDfVatec4A7WsawaGI+anik9qs
	Yl7UXFX4Efx3IxXR2icxpBmsrn4t790VtI+AY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=crNBnReh9imTNVc2BVqS6QO1LHFqStncl4VankIOSsBX4NmhD1GMm772ywdzTgvMlJ
	rfoDdlbF4Ysvcejct9VDVKqI/Ml5Op0pxVkp+GzcRMXgTCmyWIC19jZk6www/JwEjCPF
	epcLrfrFEgqAITOXwWTVwZ7ts8t5+oXtc36hU=
Received: by 10.204.164.2 with SMTP id c2mr2919730bky.85.1303681656697;
	Sun, 24 Apr 2011 14:47:36 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id w3sm2936957bkt.5.2011.04.24.14.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Apr 2011 14:47:35 -0700 (PDT)
Date: Sun, 24 Apr 2011 23:47:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110424214729.GD6678@jama.jama.net>
References: <E1QE6Cg-000752-Ey@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1QE6Cg-000752-Ey@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Andrea Adami : linux-kexecboot: fix SRCREV for 2.6.39-rc4
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
X-List-Received-Date: Sun, 24 Apr 2011 21:50:06 -0000
X-Groupsio-MsgNum: 31428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline

--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 24, 2011 at 08:46:50PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: e4dc6750f1a9417aa6326708ec20999dff53838c
> URL:    http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=
=3De4dc6750f1a9417aa6326708ec20999dff53838c
>=20
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date:   Sun Apr 24 22:43:42 2011 +0200
>=20
> linux-kexecboot: fix SRCREV for 2.6.39-rc4
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>=20
> ---
>=20
>  recipes/linux/linux-kexecboot_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/linux/linux-kexecboot_git.bb b/recipes/linux/linux-k=
execboot_git.bb
> index 6ff8c96..1228560 100644
> --- a/recipes/linux/linux-kexecboot_git.bb
> +++ b/recipes/linux/linux-kexecboot_git.bb
> @@ -4,7 +4,7 @@ KERNEL_RELEASE =3D "2.6.39-rc4"
>  OLD_KERNEL_RELEASE =3D "2.6.38"
>  PV =3D "${OLD_KERNEL_RELEASE}+${KERNEL_RELEASE}+gitr${SRCPV}"
> =20
> -SRCREV =3D "8fd62c82872a5a721c9fb0071ca0f7a49c1732e4"
> +SRCREV =3D "f0e615c3cb72b42191b558c130409335812621d8"
> =20
>  SRC_URI +=3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux-2.6.git;protocol=3Dgit;branch=3Dmaster \
>              file://defconfig"
> @@ -12,4 +12,4 @@ SRC_URI +=3D "git://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux-2.6.git
>  S =3D "${WORKDIR}/git"
> =20
>  # Mark archs/machines that this kernel supports
> -DEFAULT_PREFERENCE =3D "-2"
> +DEFAULT_PREFERENCE =3D "2"

really?

>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk20mnEACgkQN1Ujt2V2gBynqQCfa23ZGByBi9OlOApxAbdnindZ
ufcAniLYFu46xbZW9MABmzAKz6atM0Xc
=nc/s
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
