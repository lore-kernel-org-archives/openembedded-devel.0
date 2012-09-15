Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TCyXM-0007hc-E5
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 22:00:20 +0200
Received: by wgbds1 with SMTP id ds1so1739369wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2012 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TPMgFYknkSQjO2quXNQRvQrp4NVyrc7uudMFYzbzmrI=;
	b=N2/O7x0dsbJRehpASCgRTDKNBfrLPEpXyyz9KvI58RbH5ycva7IimfTsHZO+vbLU8x
	P+EM23eIx8kFvMJgOrpG3ePNWaYlgoWTbrtWaVbVWGmPIl00yG3zJNCgewZPKI371Iwg
	uuaIZ4j7n7vQEmEhI/6qcopCb6BJ1TpiIFf3yrjLQ14hnywmbHk7V7cBkv3eOfP3tNHC
	eq4Acnvf/8WWQckc7DiyVj8gu7KcvojZDIfROzCWwWFJQIlSb8VW6XMDLrn2CDj0pz0Q
	qC1xU0aSoEKgiMUcHIPmp0tcz3a08GBMapVV0UOZqalBzM8NGDNXlTF3SRUK3Y76VIEU
	ZhtQ==
Received: by 10.180.20.204 with SMTP id p12mr6307481wie.7.1347738464275;
	Sat, 15 Sep 2012 12:47:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm10189052wib.8.2012.09.15.12.47.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 12:47:43 -0700 (PDT)
Date: Sat, 15 Sep 2012 21:47:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120915194747.GE11051@jama.jama.net>
References: <1347737390-21615-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1347737390-21615-1-git-send-email-andrea.adami@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-initramfs][PATCH] linux-yocto: slob breaks usb networking, use slab
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
X-List-Received-Date: Sat, 15 Sep 2012 20:00:20 -0000
X-Groupsio-MsgNum: 40681
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline

--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 09:29:50PM +0200, Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Subject: Re: [oe] [meta-initramfs][PATCH] linux-yocto: slob breaks usb netw=
orking, use slab

s/meta-initramfs/meta-handheld/g

?

> ---
>  recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    4 ++--
>  recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    4 ++--
>  recipes-kernel/linux/linux-yocto/collie/collie.cfg |    4 ++--
>  recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    4 ++--
>  recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    4 ++--
>  recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/recipes-kernel/linux/linux-yocto/akita/akita.cfg b/recipes-k=
ernel/linux/linux-yocto/akita/akita.cfg
> index 6f0db54..e7ecdde 100644
> --- a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> +++ b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=3Dy
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=3Dy
>  CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=3Dy
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=3Dy
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_OPROFILE=3Dm
>  CONFIG_HAVE_OPROFILE=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg b/recipes-ker=
nel/linux/linux-yocto/c7x0/c7x0.cfg
> index 5655f0d..f8d3f4d 100644
> --- a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> +++ b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=3Dy
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=3Dy
>  CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=3Dy
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=3Dy
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_OPROFILE=3Dm
>  CONFIG_HAVE_OPROFILE=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg b/recipes=
-kernel/linux/linux-yocto/collie/collie.cfg
> index 4cc5f56..2f5ead7 100644
> --- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> +++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> @@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=3Dy
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=3Dy
>  CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=3Dy
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=3Dy
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_OPROFILE=3Dm
>  CONFIG_HAVE_OPROFILE=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg b/recipes=
-kernel/linux/linux-yocto/poodle/poodle.cfg
> index c20557e..644ff69 100644
> --- a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> +++ b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> @@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=3Dy
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=3Dy
>  CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=3Dy
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=3Dy
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_OPROFILE=3Dm
>  CONFIG_HAVE_OPROFILE=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg b/recipes-k=
ernel/linux/linux-yocto/spitz/spitz.cfg
> index f3f6561..6a26182 100644
> --- a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> +++ b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=3Dy
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=3Dy
>  CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=3Dy
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=3Dy
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_OPROFILE=3Dm
>  CONFIG_HAVE_OPROFILE=3Dy
> diff --git a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg b/recipes-ker=
nel/linux/linux-yocto/tosa/tosa.cfg
> index 31c6da3..013112f 100644
> --- a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> +++ b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=3Dy
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=3Dy
>  CONFIG_COMPAT_BRK=3Dy
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=3Dy
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=3Dy
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_OPROFILE=3Dm
>  CONFIG_HAVE_OPROFILE=3Dy
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBU22MACgkQN1Ujt2V2gBwdkwCeLRlBq2FuCOntG8OrMx+Pw3Yp
E7gAniHreC7Lb9zAnhQFmTBcs/jm5SVw
=N9T2
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
