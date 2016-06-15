Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 421D86057B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:01:40 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 34so2738684qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SDDArYkvvVjePKDveAQqWl6SI+AuRiNZ7hZoEap6iRg=;
	b=vwkzHmeqWNOdVIkdWG61c+FolRLge/Z9oKKVbyKAHCOmHeWMXPmkgkISGFiocNNEJk
	j531FVN8M1IyfbtM7VZQ5LrBxr7ol+SLGaB/Tnpd2+6LnRJNhDB5AZ39hJhH/9kWNXWP
	h4xn1Sktljt6OuEr2dm+g76VCb8+HwsmxAWg/wld2CQBzyYwxs8+H9AZkwvFGljos+nT
	CmPskMgTmhFZ89k8fj+L95ioJYMbR1En51YJrAMMUDwG4LCIo+bdW/txx7pa88K8hsof
	jGITdNg3d/9bfzMol64qyKF3S8S5D02FBnHmHbOJMYugt5GoiQE4oTX/myLDoogB956o
	5o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SDDArYkvvVjePKDveAQqWl6SI+AuRiNZ7hZoEap6iRg=;
	b=DwQWVfWM96sEAPUzS5+b3w60G7HdyQRg8OH5e9nB8YALIaGqHCeIVNeKz3Z4nc+YAZ
	W4G7gbLwvd4TE6mqlaAdkptobJMfrWj+CitakqGfv3i+E0bBfSkh/nuMmG2UP/wyZj4m
	P6ZuIIDgHSukuKfSjadN7R9VKSdIMTx0huig+ClG/Zix99HIZ4CO4QfJNwuQFElmkJJ7
	Iz2CRvJqWt58n1/+hfLE52XEYlzLwDtUKZmTUR32jIE/epDJYnN7Yzb3sX48RWNhQu4k
	6xJFAQ/SJYgyaWIhPL+/EnKZSml7YQTgfRzj8t4/ty967NQL3IA7fCw5o58OdAHJq/ub
	+lFg==
X-Gm-Message-State: ALyK8tKF5FktCxd9GQ9zOOjjeXAOfX+g1XfyqnwgxyNrt2/aG5j/e+zPOkd8M2sVUU49oJ4TwEOVae9MXHDuow==
X-Received: by 10.140.84.231 with SMTP id l94mr850314qgd.44.1466024500975;
	Wed, 15 Jun 2016 14:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 14:01:11 -0700 (PDT)
In-Reply-To: <1465817617-3212-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1465817617-3212-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 14:01:11 -0700
Message-ID: <CAMKF1sphe_xTR8Z-fsni_SusRm27MeAhxjOFNxETAwtV+xpRZw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libeigen: update to 3.2.8
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
X-List-Received-Date: Wed, 15 Jun 2016 21:01:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 4:33 AM, Lukas Bulwahn
<lukas.bulwahn@oss.bmw-carit.de> wrote:
> Due to the update, the pkg_config_libdir configuration has become
> obsolete, and instead the pkgconfig directory must be added to the
> dev-package.

Generally its good to use -M when creating patch to git works hard on
detecting renames. Reviewing is easier that way.

>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
>  meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb | 23 ----------------=
------
>  meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb | 21 ++++++++++++++++=
++++
>  2 files changed, 21 insertions(+), 23 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
>  create mode 100644 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
>
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.2.6.bb
> deleted file mode 100644
> index 89a25a9..0000000
> --- a/meta-oe/recipes-support/libeigen/libeigen_3.2.6.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION =3D "Eigen is a C++ template library for linear algebra: mat=
rices, vectors, numerical solvers, and related algorithms."
> -AUTHOR =3D "Beno=C3=AEt Jacob and Ga=C3=ABl Guennebaud and others"
> -HOMEPAGE =3D "http://eigen.tuxfamily.org/"
> -LICENSE =3D "MPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619b=
ab123dad"
> -
> -SRC_URI =3D "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
> -           file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.pa=
tch"
> -SRC_URI[md5sum] =3D "87274966745d2d3e7964fcc654d0a24b"
> -SRC_URI[sha256sum] =3D "8a3352f9a5361fe90e451a7305fb1896fc7f771dc16cc0ed=
d8e6b157f52c343e"
> -
> -S =3D "${WORKDIR}/eigen-eigen-c58038c56923"
> -
> -inherit cmake
> -
> -EXTRA_OECMAKE +=3D "-Dpkg_config_libdir=3D${libdir}"
> -
> -FILES_${PN} =3D "${includedir} ${libdir}"
> -FILES_${PN}-dev =3D "${datadir}/cmake/Modules"
> -
> -# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> -RDEPENDS_${PN}-dev =3D ""
> -RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb b/meta-oe=
/recipes-support/libeigen/libeigen_3.2.8.bb
> new file mode 100644
> index 0000000..9e14ee1
> --- /dev/null
> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION =3D "Eigen is a C++ template library for linear algebra: mat=
rices, vectors, numerical solvers, and related algorithms."
> +AUTHOR =3D "Beno=C3=AEt Jacob and Ga=C3=ABl Guennebaud and others"
> +HOMEPAGE =3D "http://eigen.tuxfamily.org/"
> +LICENSE =3D "MPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING.MPL2;md5=3D815ca599c9df247a0c7f619b=
ab123dad"
> +
> +SRC_URI =3D "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2 \
> +           file://0001-CMakeLists.txt-install-FindEigen3.cmake-script.pa=
tch"
> +SRC_URI[md5sum] =3D "9e3bfaaab3db18253cfd87ea697b3ab1"
> +SRC_URI[sha256sum] =3D "722a63d672b70f39c271c5e2a4a43ba14d12015674331790=
414fcb167c357e55"
> +
> +S =3D "${WORKDIR}/eigen-eigen-07105f7124f9"
> +
> +inherit cmake
> +
> +FILES_${PN} =3D "${includedir} ${libdir}"
> +FILES_${PN}-dev =3D "${datadir}/cmake/Modules ${datadir}/pkgconfig"
> +
> +# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> +RDEPENDS_${PN}-dev =3D ""
> +RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

