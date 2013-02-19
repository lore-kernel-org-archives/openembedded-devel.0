Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7bjg-00029U-EH
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 02:11:10 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so1929715pbb.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 16:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TZugA88sg2+VynOJJlPYod6dSrx8av3mknmyO3YOYVU=;
	b=molFiPsE2SiZoLtaxw7AE8vppaxBFU6I8dIjUiuewXXfFsya/uyK5UCrqU7z36XRxV
	O5oWGMtULtD5dNRcPJSkCqiTdO7Elw67wzufOX8F/jR8hiVgFRi/SqFulCLHWhd7jVrZ
	gTYbGD9cgIfD24qwMJSBg5Uk6u5K+yiyCSXud6mXX6JkBrjNWczpQEQEUX5ggYgX0JDG
	mCgd684N4D+o3jW7OFT+HrsVha3OQ2hEqjuZriETVkMiR2xi1aA0J4eQvp4bfIUz+Y8i
	msedrUW5UgcDaNEekGJRy+xg95w3tKpiGeKs/knp3gkl86/OO0h8vmWwmnJFR9Oib5Qg
	gJTw==
X-Received: by 10.68.42.9 with SMTP id j9mr35451901pbl.142.1361235299003;
	Mon, 18 Feb 2013 16:54:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u10sm55318595pax.14.2013.02.18.16.54.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 16:54:57 -0800 (PST)
Date: Tue, 19 Feb 2013 01:54:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130219005459.GL3300@jama>
References: <1360860928-2466-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1360860928-2466-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] python-numpy: update to 1.7.0
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
X-List-Received-Date: Tue, 19 Feb 2013 01:11:22 -0000
X-Groupsio-MsgNum: 43229
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="guYUoZW38XEuSLXo"
Content-Disposition: inline

--guYUoZW38XEuSLXo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 05:55:28PM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Merged, thanks!

> ---
>  .../python/python-numpy/aarch64.patch              | 41 ----------------=
------
>  ...hon-numpy_1.7.0rc1.bb =3D> python-numpy_1.7.0.bb} | 17 ++++-----
>  2 files changed, 7 insertions(+), 51 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64.=
patch
>  rename meta-oe/recipes-devtools/python/{python-numpy_1.7.0rc1.bb =3D> py=
thon-numpy_1.7.0.bb} (81%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch b=
/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
> deleted file mode 100644
> index 8d66615..0000000
> --- a/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 7d7a5939dcf5821d9f381d57bfa2012568ef6b82 Mon Sep 17 00:00:00 2001
> -From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -Date: Thu, 10 Jan 2013 21:49:01 +0100
> -Subject: [PATCH] Added support for AArch64 architecture
> -
> -Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: backport
> ----
> - numpy/core/include/numpy/npy_cpu.h    | 2 ++
> - numpy/core/include/numpy/npy_endian.h | 1 +
> - 2 files changed, 3 insertions(+)
> -
> -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/num=
py/npy_cpu.h
> -index 8a29788..9707a7a 100644
> ---- a/numpy/core/include/numpy/npy_cpu.h
> -+++ b/numpy/core/include/numpy/npy_cpu.h
> -@@ -66,6 +66,8 @@
> -     #define NPY_CPU_MIPSEL
> - #elif defined(__MIPSEB__)
> -     #define NPY_CPU_MIPSEB
> -+#elif defined(__aarch64__)
> -+    #define NPY_CPU_AARCH64
> - #else
> -     #error Unknown CPU, please report this to numpy maintainers with \
> -     information about your platform (OS, CPU and compiler)
> -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/=
numpy/npy_endian.h
> -index aa5ed8b..4e3349f 100644
> ---- a/numpy/core/include/numpy/npy_endian.h
> -+++ b/numpy/core/include/numpy/npy_endian.h
> -@@ -25,6 +25,7 @@
> -             || defined(NPY_CPU_IA64)    \
> -             || defined(NPY_CPU_ALPHA)   \
> -             || defined(NPY_CPU_ARMEL)   \
> -+            || defined(NPY_CPU_AARCH64) \
> -             || defined(NPY_CPU_SH_LE)   \
> -             || defined(NPY_CPU_MIPSEL)
> -         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
> ---=20
> -1.8.0
> -
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0rc1.bb b/m=
eta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> similarity index 81%
> rename from meta-oe/recipes-devtools/python/python-numpy_1.7.0rc1.bb
> rename to meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> index 2e4bd6a..bbe4e63 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0rc1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> @@ -2,14 +2,10 @@ DESCRIPTION =3D "A sophisticated Numeric Processing Pac=
kage for Python"
>  SECTION =3D "devel/python"
>  LICENSE =3D "PSF"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df87832d854acbade6e9f5c601=
c8b30b1"
> -PR =3D "r0"
> -PV =3D "1.6.99+1.7.0rc1"
> -REALPV =3D "1.7.0rc1"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${REALPV}.tar.gz \
> -           ${CONFIGFILESURI} \
> -           file://aarch64.patch \
> -	  "
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
> +           ${CONFIGFILESURI} "
> +
>  CONFIGFILESURI ?=3D ""
> =20
>  CONFIGFILESURI_aarch64 =3D "file://config.h \
> @@ -22,7 +18,7 @@ CONFIGFILESURI_mipsel =3D "file://config.h \
>  	   file://numpyconfig.h \
>  	  "
> =20
> -S =3D "${WORKDIR}/numpy-${REALPV}"
> +S =3D "${WORKDIR}/numpy-${PV}"
> =20
>  inherit distutils
> =20
> @@ -36,8 +32,9 @@ do_compile_prepend() {
>  }
> =20
>  FILES_${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.=
a"
> -SRC_URI[md5sum] =3D "a4719f5a1853bc0f8892a5956d5c4229"
> -SRC_URI[sha256sum] =3D "45ea23622f72d86bc3614446d668ee962c0475ee7b91a93e=
f85a5e0493962de5"
> +
> +SRC_URI[md5sum] =3D "4fa54e40b6a243416f0248123b6ec332"
> +SRC_URI[sha256sum] =3D "f4fa70b7edbab65ee6432eb63743f5489f1919c614632b20=
b2fb45aa7e682ac6"
> =20
>  # install what is needed for numpy.test()
>  RDEPENDS_${PN} =3D "python-unittest \
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

--guYUoZW38XEuSLXo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEizWMACgkQN1Ujt2V2gBy8xwCeLBqM7JkJp7+1aSGuikseb8Z9
+akAmwWhP/rami7kppceIGbWQ3yTU/U9
=VvRr
-----END PGP SIGNATURE-----

--guYUoZW38XEuSLXo--
