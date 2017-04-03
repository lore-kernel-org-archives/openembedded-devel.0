Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1DA77D0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Apr 2017 14:18:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so33971536wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Apr 2017 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=E2MUEKZmMul7pjRGyJPClamfoO6CNE+fg79jEkVQSTs=;
	b=pq3T7h7cn4elCnhJTF5GbbivMNNJpmUPYimqNSdI3eYiblsj0BHjJUIt+vsgACOdQi
	S7Neb9g+1FwPbhhwYIhR7tcY/dZE1WXrLeVBU1Y5R2P2giocOTGIkYZxBK/CxbeOzQXe
	TcCUkV/O/ZkctacamKpPX/nUVCo0+hrf5IA2AozC4zBeVPxe71DWD7t3O+OGc6fmyqje
	989LADqSNv0/WiPCxavK30aeCyAl5NqSBpZLt7lRwr2fKE9L/Ciz3vI8gAOgmrY6YAn8
	qQxSAESxSAx5ty0ZfKUM/JHq7qmezgIC3RVkefMpkuT2GSwoNUW8LYzZubod8mF4dFe+
	jGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=E2MUEKZmMul7pjRGyJPClamfoO6CNE+fg79jEkVQSTs=;
	b=l2h1dPYg9A4jBuxMapxYE2J0z+KFXvuRRSzxkA6d+y1cljn4qgoZjTt+KkWkUryCYE
	q4YXn46bTQFqXwN2S52gqbPo7mfAoFXD1s/lgHiRmr8RuNaAal/kRLmU/UiiJtctGmUe
	sbacG9jBkB7wWDMBJuZYx32N9YNoRs1LrJ/eiZzZiBCcdOOQ08/2iYomhTIHPLywxRIm
	NeQDj++ziIXhkhQCkVtOBEEd78vr3dnONm7A4Rh2xAsN4zSGdp4x4g8XgtjxCHSvvk6s
	wQl1gVeXwAMhTvLqiCip/k9ohzvRjoO5EjxvSf4wG0qTB7ZXxGp2ty+x/jKgCNP1V0cy
	AhNw==
X-Gm-Message-State: AFeK/H1e/c7+UYEYRNcVtsYker+qpoeaKHK4S9+vs6SESP3lPXCDP3xCmxz0jtlSrU0IuA==
X-Received: by 10.223.173.138 with SMTP id w10mr14869768wrc.38.1491229083229; 
	Mon, 03 Apr 2017 07:18:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o22sm3542654wro.45.2017.04.03.07.18.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Apr 2017 07:18:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Apr 2017 16:18:06 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170403141806.GD3311@jama>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-29-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170331164247.5052-29-raj.khem@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 29/43] libqb: Upgrade to 1.0.1 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Apr 2017 14:18:02 -0000
X-Groupsio-MsgNum: 66073
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Content-Disposition: inline

--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2017 at 09:42:33AM -0700, Khem Raj wrote:
> Add a patch needed for cross compiling

This breaks corosync:
http://errors.yoctoproject.org/Errors/Details/138932/

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-Remove-runtime-check-for-CLOCK_MONOTONIC.patch | 43 ++++++++++++++++=
++++++
>  .../libqb/{libqb_0.17.2.bb =3D> libqb_1.0.1.bb}      | 14 +++----
>  2 files changed, 49 insertions(+), 8 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libqb/libqb/0001-Remove-runt=
ime-check-for-CLOCK_MONOTONIC.patch
>  rename meta-oe/recipes-extended/libqb/{libqb_0.17.2.bb =3D> libqb_1.0.1.=
bb} (67%)
>=20
> diff --git a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-che=
ck-for-CLOCK_MONOTONIC.patch b/meta-oe/recipes-extended/libqb/libqb/0001-Re=
move-runtime-check-for-CLOCK_MONOTONIC.patch
> new file mode 100644
> index 000000000..28bc5c07d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-=
CLOCK_MONOTONIC.patch
> @@ -0,0 +1,43 @@
> +From e6fbad0c122ba8e87b67a9e2447505adcaafe204 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 29 Mar 2017 16:31:38 -0700
> +Subject: [PATCH] Remove runtime check for CLOCK_MONOTONIC
> +
> +Does not work during cross compile
> +
> +use a compile-time check to detect whether the
> +monotonic clock is available. This check can run just fine when we are
> +cross-compiling.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fa13ae6..f4f0f46 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -175,9 +175,17 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> +                  )
> +=20
> + AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
> +-AC_RUN_IFELSE([AC_LANG_PROGRAM(
> ++AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> + [[#include <time.h>]],
> +-[[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return -1;=
]])],
> ++[[
> ++#include <unistd.h>
> ++int main() {
> ++#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >=3D 0 =
&& defined(CLOCK_MONOTONIC))
> ++        #error No monotonic clock
> ++#endif
> ++    return 0;
> ++
> ++]])],
> +                     [
> +                       AC_MSG_RESULT([yes])
> +                       AC_DEFINE_UNQUOTED([HAVE_CLOCK_GETRES_MONOTONIC],=
 1, [Define to 1 if clock_getres(CLOCK_MONOTONIC, &ts) works])
> +--=20
> +2.12.1
> +
> diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb b/meta-oe/rec=
ipes-extended/libqb/libqb_1.0.1.bb
> similarity index 67%
> rename from meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> rename to meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
> index 94030b2ea..e26bb7c19 100644
> --- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> +++ b/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
> @@ -4,22 +4,20 @@ It provides high performance logging, tracing, ipc, and=
 poll."
> =20
>  HOMEPAGE =3D "https://github.com/clusterlabs/libqb/wiki"
>  SECTION =3D "libs"
> -
>  LICENSE =3D "LGPL-2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D321bf41f280cf805086dd5a720b37=
785"
> =20
> -inherit autotools-brokensep pkgconfig
> -
> -PV =3D "0.17.2+git${SRCPV}"
> +inherit autotools pkgconfig
> =20
> -SRCREV =3D "bd2c587f6ccacd8a5644b275d99324d200c2b378"
> -SRC_URI =3D "git://github.com/ClusterLabs/${BPN}.git"
> +PV .=3D "+git${SRCPV}"
> =20
> +SRCREV =3D "0a329683a76bc6aeb36f20f2bf6b43ba0440c4dc"
> +SRC_URI =3D "git://github.com/ClusterLabs/${BPN}.git \
> +           file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch \
> +          "
>  S =3D "${WORKDIR}/git"
> =20
>  do_configure_prepend() {
>      ( cd ${S}
>      ${S}/autogen.sh )
>  }
> -
> -
> --=20
> 2.12.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOJZnQAKCRA3VSO3ZXaA
HAJTAKCWuNPVAuaLwfDrotooxDe5JwgImgCeO8TFCcLunMhtlqNjGj4QPtJXzH8=
=tNwn
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--
