Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7B70175F44
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 11:20:39 +0000 (UTC)
Received: by wijp15 with SMTP id p15so97649962wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GbuSSdm0chFKEkd/B3/6wJOKn+fPCRPcnDSYrk8rW4o=;
	b=OfN8rGWWASB1Twuo9nQ9pk/w7NeUw3mSEaw585Q+2NkUNgyTi9+9XTnhFm0OrMHOT7
	iHd6m/+LkgzrKhaNkvjpdlpwoXmRg66QomyooR9Cor1KpCybzG0YFCqGtSHLzYa+uHfT
	yk1GSMjkphF/u8+1AspltENsw/e9sM+g02ErkgvHBoH2v7rxMngbqW8hj9XkSCniez+c
	eRY4YWgAhDVS/32eJhAnb1Q26FOx6KJAPoCx7SIDv8tRrNUbGhzuWtxKZuwBafNG4tHl
	kGKJ3IXHfSvs2oLDIMfWBsBdbVPgUYbNf4LvE+mU0f9mtJQX/i2K6+HXtZSvMnW3VIpx
	N9tw==
X-Received: by 10.180.231.40 with SMTP id td8mr44153218wic.9.1439896839129;
	Tue, 18 Aug 2015 04:20:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	dz4sm20920346wib.17.2015.08.18.04.20.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 04:20:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 13:20:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150818112042.GC30532@jama>
References: <1439137213-18585-1-git-send-email-max.oss.09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1439137213-18585-1-git-send-email-max.oss.09@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libvpx: fix build errors for gcc 5
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
X-List-Received-Date: Tue, 18 Aug 2015 11:20:41 -0000
X-Groupsio-MsgNum: 56771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline

--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2015 at 06:20:13PM +0200, Max Krummenacher wrote:
> Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>

Please test your patches.

gcc-5-max_align_t.patch and in SRC_URI there is:
file://fix_build_with_gcc5.patch

I'll fix it this time when cherry-picking to master-next.

> ---
>  .../webm/libvpx/gcc-5-max_align_t.patch            | 37 ++++++++++++++++=
++++++
>  meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb    |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_alig=
n_t.patch
>=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.pat=
ch b/meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.patch
> new file mode 100644
> index 0000000..e017fc0
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/webm/libvpx/gcc-5-max_align_t.patch
> @@ -0,0 +1,37 @@
> +max_align_t is a type in gcc5 thus the definition here throws a compile
> +time error.
> +patch taken from:
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D777976
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> +--- libvpx-1.3.0/debian/patches/gcc-5.diff	1970-01-01 00:00:00.000000000=
 +0000
> ++++ libvpx-1.3.0/debian/patches/gcc-5.diff	2015-03-05 23:03:15.000000000=
 +0000
> +@@ -0,0 +1,26 @@
> ++Index: b/nestegg/halloc/src/align.h
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++--- a/nestegg/halloc/src/align.h
> +++++ b/nestegg/halloc/src/align.h
> ++@@ -30,7 +30,7 @@ union max_align
> ++ 	void (*q)(void);
> ++ };
> ++=20
> ++-typedef union max_align max_align_t;
> +++typedef union max_align h_max_align_t;
> ++=20
> ++ #endif
> ++=20
> ++Index: b/nestegg/halloc/src/halloc.c
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ++--- a/nestegg/halloc/src/halloc.c
> +++++ b/nestegg/halloc/src/halloc.c
> ++@@ -30,7 +30,7 @@ typedef struct hblock
> ++ #endif
> ++ 	hlist_item_t  siblings; /* 2 pointers */
> ++ 	hlist_head_t  children; /* 1 pointer  */
> ++-	max_align_t   data[1];  /* not allocated, see below */
> +++	h_max_align_t data[1];  /* not allocated, see below */
> ++ =09
> ++ } hblock_t;
> ++=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb b/meta-oe/re=
cipes-multimedia/webm/libvpx_1.3.0.bb
> index eb19a57..cd0af50 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b04755015be9=
01744a78cc30d390d4"
> =20
>  SRC_URI +=3D "http://webm.googlecode.com/files/libvpx-v${PV}.tar.bz2 \
>              file://libvpx-configure-support-blank-prefix.patch \
> -            file://0001-configure.sh-quote-local-variables.patch"
> +            file://0001-configure.sh-quote-local-variables.patch \
> +            file://fix_build_with_gcc5.patch"
>  SRC_URI[md5sum] =3D "14783a148872f2d08629ff7c694eb31f"
>  SRC_URI[sha256sum] =3D "d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f=
4217aef0010451a9"
> =20
> --=20
> 1.8.4.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXTFQkACgkQN1Ujt2V2gBy/egCgnyCzMONBCVk2mnfy7LaWfb4b
BFoAn1KXhGyTqvV6EzgdsVlowMjm8H6y
=kJTT
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--
