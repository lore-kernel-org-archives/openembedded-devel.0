Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C4BC860043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:44:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u132so10657551wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/xqrrc2tflVW3itMUOHp6w6qq2QFynBufTdC3fdMIh8=;
	b=Nyf6XbnR/n5nK2AwO+Ol+23S4UoX6fbsXNhmYuWvda3c0Csrj2SgBAqHviFBsgtSi4
	XoG715e0wwhz6kTotCxHTHGhEyPfZz7Ly35BuAINi1jmvaNTl+7wOGPUT8ok/0S2NUkn
	iZV1fjuUB++1GXTW/AX6/x1fzb6vAsEgjMxULMCj6qEEKyFOtb4CvGAWJn6QU4fvGMx4
	wVZvU3AeMUzo6fjEFekFAMcrZvHPI2XIBUgZdIwpyMkgOgnzgkaGGPiT9OGwIInjTzUl
	sQggOi1yNglDi+jeNKiFztdB8kPhDXUcB8EPTvHKte8VUr9H7p0TEUDHwxpD2FkX7VNl
	jTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/xqrrc2tflVW3itMUOHp6w6qq2QFynBufTdC3fdMIh8=;
	b=cMAYNUzkRXJgORZS5Itvt5+tXk0xmAmB1WfgPVXUdq9r5GPdVEV0CkgOp0wW6eoxfp
	3923ytNcdR45UERadf9r1tnZs9FiWWPPDOOHtxXvloRja3ePUOybFZnj1fZUcdDepPFs
	zk8L41OZ/xWNQfemdLCvsbcZXevRhAZ3oesPACbLZNGCpBh9bR9IG0NybMp4a2aaPpiN
	tD+cEAMVGVw1TiwaSM1vSz/Ce6uVEpRZibAgtK5UQm2HDpSHCscOykE+kbrwQIwrwYwq
	Oab7acng+spEWgeuvNYyU+8VNm6fuRbI56l8AL9jDHQCSyJFQ2ukUCivdWAr0YfmoV3s
	/BJQ==
X-Gm-Message-State: AFeK/H3sZv2By7Boe4pc/tbtYeHdK70Y2cMni/g6Eu9mtdcFCT8vIGHQfBC8hFJ210vyeA==
X-Received: by 10.28.15.12 with SMTP id 12mr7603175wmp.22.1489682645560;
	Thu, 16 Mar 2017 09:44:05 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q75sm4928895wmd.27.2017.03.16.09.44.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Mar 2017 09:44:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Mar 2017 17:44:05 +0100
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20170316164405.GA3298@jama>
References: <20170316084053.26807-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20170316084053.26807-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gperftools: fix do_compile failure for qemuppc
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
X-List-Received-Date: Thu, 16 Mar 2017 16:44:05 -0000
X-Groupsio-MsgNum: 65823
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2017 at 04:40:53PM +0800, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Please rebase and test on recent master.

> ---
>  .../files/0001-Fix-build-failure-for-ppc.patch     | 28 ++++++++++++++++=
++++++
>  .../recipes-support/gperftools/gperftools_2.5.bb   |  3 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/gperftools/files/0001-Fix-bui=
ld-failure-for-ppc.patch
>=20
> diff --git a/meta-oe/recipes-support/gperftools/files/0001-Fix-build-fail=
ure-for-ppc.patch b/meta-oe/recipes-support/gperftools/files/0001-Fix-build=
-failure-for-ppc.patch
> new file mode 100644
> index 0000000..27f855d
> --- /dev/null
> +++ b/meta-oe/recipes-support/gperftools/files/0001-Fix-build-failure-for=
-ppc.patch
> @@ -0,0 +1,28 @@
> +Subject: Fix build failure for ppc
> +
> +Upstream-Status: Pending
> +
> +Fix the following build failure.
> +
> +  error: 'siginfo_t' does not name a type
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/stacktrace_powerpc-linux-inl.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc=
-linux-inl.h
> +index 5d16fa1..a9bf775 100644
> +--- a/src/stacktrace_powerpc-linux-inl.h
> ++++ b/src/stacktrace_powerpc-linux-inl.h
> +@@ -44,6 +44,7 @@
> +=20
> + #include <stdint.h>   // for uintptr_t
> + #include <stdlib.h>   // for NULL
> ++#include <signal.h>   // for siginfo_t
> + #include <gperftools/stacktrace.h>
> + #include <base/vdso_support.h>
> +=20
> +--=20
> +2.8.3
> +
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-=
oe/recipes-support/gperftools/gperftools_2.5.bb
> index 2e4479c..64766c6 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
> @@ -4,7 +4,8 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D762732742c73dc6c7fbe8632f06c0=
59a"
>  DEPENDS =3D "libunwind"
> =20
> -SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftoo=
ls-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz"
> +SRC_URI =3D "http://pkgs.fedoraproject.org/repo/pkgs/gperftools/gperftoo=
ls-2.5.tar.gz/aa1eaf95dbe2c9828d0bd3a00f770f50/gperftools-2.5.tar.gz \
> +           file://0001-Fix-build-failure-for-ppc.patch"
> =20
>  SRC_URI[md5sum] =3D "aa1eaf95dbe2c9828d0bd3a00f770f50"
>  SRC_URI[sha256sum] =3D "6fa2748f1acdf44d750253e160cf6e2e72571329b42e563b=
455bde09e9e85173"
> --=20
> 2.8.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMrA1AAKCRA3VSO3ZXaA
HLjsAJ0XCwHn/6dE5xiWMJLRV4AY8pF13QCfbvNXju+ns3K3+b+rvTWgvKvTmiQ=
=ialJ
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
