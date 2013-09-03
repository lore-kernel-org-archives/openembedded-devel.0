Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id CBF086BD11
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:54:09 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3189973eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3NoKvcR83AhyV9wH7dgFCHFe+Ew5zAEflFgz9K+lJtU=;
	b=TND22mR3VwmR42MOaKlTWMGCCoA4PjTfOMO2WKokPc8UZAY1dgRMBENzcnWrlsYHX6
	pB//ZJJkiiAcMj6Plf1xI/lMcKeyROTokh0PLPO77FcXLhsYKd/gBvLqZKQi+KvE7/FV
	BQDleqZLTEdUJZApAfZf9GI3gDRM0ZQnq6pBPQGaGe87//mDA1Mo6pGGFVs3DrarNmT+
	1xtb1iGcHlORpKsttakN+4Qfpc8NvxQ0j3SgrpcGxM6Aftj/sgPSrN4yJ8u4H7bUaAT5
	CtKsDrRjbfAsSpr4svVBGdk0HOtEoz/Mn2ZzxLPh+KqbwZGKCQGo71tL1qttWuKWWLVl
	WtjQ==
X-Received: by 10.15.64.1 with SMTP id n1mr48660234eex.15.1378230850202;
	Tue, 03 Sep 2013 10:54:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm33376608eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:54:09 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:55:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175528.GC3553@jama>
References: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-filesystems][PATCH] cramfs: remove, we use mkfs.cramfs from util-linux
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
X-List-Received-Date: Tue, 03 Sep 2013 17:54:10 -0000
X-Groupsio-MsgNum: 46046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline

--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2013 at 01:39:54AM +0200, Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Applied, thanks

> ---
>  .../recipes-filesystems/cramfs/cramfs_1.1.bb       | 29 ----------------=
------
>  1 file changed, 29 deletions(-)
>  delete mode 100644 meta-filesystems/recipes-filesystems/cramfs/cramfs_1.=
1.bb
>=20
> diff --git a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb b/=
meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
> deleted file mode 100644
> index 0bca0e1..0000000
> --- a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION =3D "Builds cramfs filesystems for embedded systems"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833"
> -DEPENDS =3D "zlib"
> -
> -PE =3D "1"
> -
> -SRC_URI =3D "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${B=
PN}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "d3912b9f7bf745fbfea68f6a9b9de30f"
> -SRC_URI[sha256sum] =3D "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2e=
b86baee997d22368"
> -
> -EXTRA_OEMAKE =3D "\
> -    'CC=3D${CC}' \
> -    'CFLAGS=3D${CFLAGS}' \
> -    'LDFLAGS=3D${LDFLAGS}' \
> -"
> -
> -do_compile_prepend() {
> -    ln -sf GNUmakefile Makefile
> -}
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install mkcramfs ${D}${bindir}
> -    install cramfsck ${D}${bindir}
> -}
> -
> -BBCLASSEXTEND =3D "native"
> --=20
> 1.8.1.5
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImIpAACgkQN1Ujt2V2gBwSDACfdutKx5KcnFpnqFpaDQdx8vvu
FsoAoK5+7+13xWwkDbAmNhzdmMSF7TPG
=d4dM
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
