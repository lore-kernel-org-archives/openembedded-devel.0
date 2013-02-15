Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U6TH7-0000iN-Kc
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2013 22:57:00 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so1912950pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2013 13:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e0Su4MrLveTsFoUH2l0m+kGzSZGbzGF+kuP0p0Op8sY=;
	b=AEVYhhLkMdERAiu21G814SvuSrZ6w7Mdu/Bbh7hhBn4kJeiVYdNfvIQcrv4XDgm9DL
	M9C446v1FOmLqUQ7/KDpXjU4aq6XgSxm76NT2763LGJ6R589nw1dBSUT7GzPfYspXO3D
	yK+sP1DMc3fEwd8YKc20TEWVc8eL2Y3ERQlx9wqq/BgdyDckekpzr3cGSPXrYiVqGwcW
	mEJbxplMWApUNsArDcnNrmdPF1RS4BMbLL9+208B1101AC7h6k59q8GlzOQgmrtKBFND
	p9gIXdbd5+E1Syj4otlVLuI25We/CM4/+ufS5hkYheLKYbG71xV6qXdKCvtRP69nsWp9
	z6aw==
X-Received: by 10.68.129.9 with SMTP id ns9mr9644226pbb.16.1360964452650;
	Fri, 15 Feb 2013 13:40:52 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qp13sm5828159pbb.3.2013.02.15.13.40.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 15 Feb 2013 13:40:51 -0800 (PST)
Date: Fri, 15 Feb 2013 22:40:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130215214048.GP3300@jama>
References: <20130215071140.GO3300@jama>
	<1360928765-24039-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360928765-24039-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] libmemcached: add 1.0.15 and 1.0.7 versions
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
X-List-Received-Date: Fri, 15 Feb 2013 21:57:00 -0000
X-Groupsio-MsgNum: 43191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4IFtMBbmeqbTM/ox"
Content-Disposition: inline

--4IFtMBbmeqbTM/ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 12:46:05PM +0100, Marcin Juszkiewicz wrote:
> 1.0.15 is latest
> 1.0.7 is required by HipHopVM
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../libmemcached/files/crosscompile.patch          | 30 ++++++++++++++++=
++++++
>  .../recipes-support/libmemcached/libmemcached.inc  | 10 ++++++++
>  .../libmemcached/libmemcached_1.0.15.bb            |  6 +++++
>  .../libmemcached/libmemcached_1.0.7.bb             |  8 ++++++
>  .../recipes-support/libunwind/files/aarch64.patch  |  8 ++++++

does this one belong here?

>  5 files changed, 62 insertions(+)
>  create mode 100644 meta-networking/recipes-support/libmemcached/files/cr=
osscompile.patch
>  create mode 100644 meta-networking/recipes-support/libmemcached/libmemca=
ched.inc
>  create mode 100644 meta-networking/recipes-support/libmemcached/libmemca=
ched_1.0.15.bb
>  create mode 100644 meta-networking/recipes-support/libmemcached/libmemca=
ched_1.0.7.bb
>=20
> diff --git a/meta-networking/recipes-support/libmemcached/files/crosscomp=
ile.patch b/meta-networking/recipes-support/libmemcached/files/crosscompile=
=2Epatch
> new file mode 100644
> index 0000000..63511bf
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmemcached/files/crosscompile.pat=
ch
> @@ -0,0 +1,30 @@
> + libmemcached/backtrace.cc |    3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +--- libmemcached-1.0.15.orig/libmemcached/backtrace.cc
> ++++ libmemcached-1.0.15/libmemcached/backtrace.cc
> +@@ -75,10 +75,11 @@ void custom_backtrace(void)
> +     {
> +       for (int x=3D 0; x < stack_frames; x++)=20
> +       {
> +         bool was_demangled=3D false;
> +=20
> ++#if USE_DEMANGLE =3D=3D 1
> +         if (USE_DEMANGLE)
> +         {
> + #ifdef HAVE_DLFCN_H
> +           Dl_info dlinfo;
> +           if (dladdr(backtrace_buffer[x], &dlinfo))
> +@@ -107,11 +108,11 @@ void custom_backtrace(void)
> +                       dlinfo.dli_fname);
> +             }
> +           }
> + #endif
> +         }
> +-
> ++#endif
> +         if (was_demangled =3D=3D false)
> +         {
> +           fprintf(stderr, "?%d  %p in %s\n", x, backtrace_buffer[x], sy=
mbollist[x]);
> +         }
> +       }
> diff --git a/meta-networking/recipes-support/libmemcached/libmemcached.in=
c b/meta-networking/recipes-support/libmemcached/libmemcached.inc
> new file mode 100644
> index 0000000..448a15d
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmemcached/libmemcached.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION =3D "open source C/C++ client library and tools for the memc=
ached server"
> +DEPENDS =3D "libevent util-linux"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D865490941c91ba790f0ea78dec93b=
d60"
> +
> +SRC_URI =3D "http://launchpad.net/libmemcached/1.0/${PV}/+download/libme=
mcached-${PV}.tar.gz"
> +
> +TARGET_LDFLAGS +=3D "-luuid"
> +
> +inherit autotools gettext pkgconfig
> diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.=
0.15.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.=
bb
> new file mode 100644
> index 0000000..18232b4
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.15.bb
> @@ -0,0 +1,6 @@
> +require libmemcached.inc
> +
> +SRC_URI +=3D "file://crosscompile.patch"
> +
> +SRC_URI[md5sum] =3D "616297a1aedefc52b3f6922eda5d559a"
> +SRC_URI[sha256sum] =3D "dd7e9560029835bddf761a5b4c2339d9e5c7374558659b6c=
11b2c95e7d3a4325"
> diff --git a/meta-networking/recipes-support/libmemcached/libmemcached_1.=
0.7.bb b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
> new file mode 100644
> index 0000000..0aa3050
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmemcached/libmemcached_1.0.7.bb
> @@ -0,0 +1,8 @@
> +require libmemcached.inc
> +
> +SRC_URI[md5sum] =3D "d59a462a92d296f76bff2d9bc72b2516"
> +SRC_URI[sha256sum] =3D "3efa86c9733eaad55d7119cb16769424e2aa6c22b3392e8f=
973946fce6678d81"
> +
> +do_configure_prepend_aarch64() {
> +    export ac_cv_c_endian=3Dlittle
> +}
> diff --git a/meta-oe/recipes-support/libunwind/files/aarch64.patch b/meta=
-oe/recipes-support/libunwind/files/aarch64.patch
> index 9ea8d83..bb19747 100644
> --- a/meta-oe/recipes-support/libunwind/files/aarch64.patch
> +++ b/meta-oe/recipes-support/libunwind/files/aarch64.patch
> @@ -1,3 +1,11 @@
> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: unsuitable
> +
> +We need to port it for AArch64 first. This patch just makes it die during
> +compilation.
> +
> +https://bugs.launchpad.net/linaro-aarch64/+bug/1099810
>  ---
>   configure.ac |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4IFtMBbmeqbTM/ox
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEeq2AACgkQN1Ujt2V2gBzLNQCgi3HV/2T0Aw9i/D/0odyqT59I
ZiYAn3BD/KdLs8kq806QIUCbtSj+au+N
=zPlz
-----END PGP SIGNATURE-----

--4IFtMBbmeqbTM/ox--
