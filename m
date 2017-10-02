Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DB78D7309A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 18:22:18 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g65so6478817pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KirIa5EMhvF69Xb9k1607ik5bawOk/k0geK8xhhfsxs=;
	b=OHTdul/j3YVKRCGitAQcEnHZs7sbx9OwDhfAaJjRgv9qshzw7v6+Sp+QQfJTN9I58M
	QUFOk4CS6stHA5FbDZB5aPAHvcXIMa+nQ00mZggUf99kEmfVxJwsllSvOKofDY4CIUUR
	2mYQ1fJWNKkWI2zV7wGR3C9I7NOd/U4wgFlTKo6r5k2yzNTkWypdLF0FjyeYQkm8xbe/
	KowgocAFoNGHYlgb6yF4KFB4EyOTyZNgCJVWzNDMckPpsUtCpzHBYMoMDcb3OTSRDZ55
	3D5KD8qRrO2MUK2mS2IT6ithW3XEjAbNu8O5gtO/6SLEn2UTSQPQeOmx96B5lasIl1ek
	W3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KirIa5EMhvF69Xb9k1607ik5bawOk/k0geK8xhhfsxs=;
	b=K9g0ItaJPAyWTpgGEaRvgxvK9vJkaFO3d2kzRjHxcBG8AYzCBAM+bfB5WVU89sE3qy
	hz4TKNXeEF4d54+HpgcKsMs8qL43olHlZH8n/Y+ugBwHcf4Y36ZA7FDMNbrjV0mptbWH
	aECbnl+uc8haUwppjj6Rt/8KxaXCPsBoHggv7Um9RWANsNiVQFLoQbl7t08bhMCCpa86
	lzdORJiMt0zCIlFoCTyORrxYt5VATVb+4rtxlaPIDgOxT1JA3xO4f+SwHkywKKzk4Xnj
	v5Z0Uzx8PE9CXqsBVD8HYbMWlkAH9kAzcJ8/AYGAp6j6Qto1Y6Y6JF/qHdW4b1sFR3S/
	wWXA==
X-Gm-Message-State: AHPjjUgYaNf8jnwd81ytQREr5wPt1qhTbnYLgBOf/R6x1qLu8YZyfRvk
	F5yKdeR89qwF7u2v5I/30Xk2hzh87Mh3Vijk2zN+2w==
X-Google-Smtp-Source: AOwi7QCTITdZ4WEVxJSsFDrpG8m7BP9BVaWxkTsHrQR63P0ON2XUXmOV8fQjtMP/vbhYXVG3DejwGLPPgZKY7aPF4ig=
X-Received: by 10.98.156.152 with SMTP id u24mr14934231pfk.255.1506968539911; 
	Mon, 02 Oct 2017 11:22:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Mon, 2 Oct 2017 11:21:49 -0700 (PDT)
In-Reply-To: <3a6a9b85a7b6eb726bf8a5cf9d79bfc84745a776.1506424098.git.paul.eggleton@linux.intel.com>
References: <cover.1506424098.git.paul.eggleton@linux.intel.com>
	<3a6a9b85a7b6eb726bf8a5cf9d79bfc84745a776.1506424098.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2017 11:21:49 -0700
Message-ID: <CAMKF1sqJtK__NUqMuSE-x7Fs508GzvOkK8-JeixbnCF5Z=dyAA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] mraa: move recipe from meta-refkit-core
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
X-List-Received-Date: Mon, 02 Oct 2017 18:22:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 4:08 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Make this recipe a little more widely visible (has previously appeared
> in meta-refkit-core and meta-intel-iot-middleware). Also make couple of
> minor tweaks:
>
> * Make SUMMARY more accurate by borrowing the first part of the short
>   description now in the mraa github repo
> * Set HOMEPAGE
> * Drop AUTHOR as this is field is only really intended for older
>   software where there is no real point of contact for upstream other
>   than an author's email address.
>

This is not supported on mips e.g.

| -- INFO - libmraa Version v1.7.0
| -- INFO - cmake Version 3.8.2
| -- INFO - Target arch is unknown
| CMake Error at CMakeLists.txt:173 (message):
|   Only x86, arm, PERIPHERALMAN and mock platforms currently supported
|

Please limit the supported hosts to arm and x86

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-extended/mraa/mraa_git.bb | 48 +++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/mraa/mraa_git.bb
>
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
> new file mode 100644
> index 0000000..9b023ff
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -0,0 +1,48 @@
> +SUMMARY = "Linux Library for low speed I/O Communication"
> +HOMEPAGE = "https://github.com/intel-iot-devkit/mraa"
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=66493d54e65bfc12c7983ff2e884f37f"
> +
> +SRCREV = "8ddbcde84e2d146bc0f9e38504d6c89c14291480"
> +PV = "1.7.0-git${SRCPV}"
> +
> +SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake distutils3-base
> +
> +DEPENDS += "json-c"
> +
> +EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON"
> +
> +# Prepend mraa-utils to make sure bindir ends up in there
> +PACKAGES =+ "${PN}-utils"
> +
> +FILES_${PN}-doc += "${datadir}/mraa/examples/"
> +
> +FILES_${PN}-utils = "${bindir}/"
> +
> +# override this in local.conf to get needed bindings.
> +# BINDINGS_pn-mraa="python"
> +# will result in only the python bindings being built/packaged.
> +BINDINGS ??= "python ${@ 'nodejs' if oe.types.boolean(d.getVar('HAVE_NODEJS') or '0') else '' }"
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
> + ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
> +
> +PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
> +PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
> +PACKAGECONFIG[ft4222] = "-DUSBPLAT=ON -DFTDI4222=ON, -DUSBPLAT=OFF -DFTDI4222=OFF,, libft4222"
> +
> +FILES_${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/"
> +RDEPENDS_${PYTHON_PN}-${PN} += "${PYTHON_PN}"
> +
> +FILES_node-${PN} = "${prefix}/lib/node_modules/"
> +RDEPENDS_node-${PN} += "nodejs"
> +
> +### Include desired language bindings ###
> +PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'nodejs', 'node-${PN}', '', d)}"
> +PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'python', '${PYTHON_PN}-${PN}', '', d)}"
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

