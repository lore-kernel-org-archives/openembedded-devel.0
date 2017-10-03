Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0332371B13
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 01:46:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m28so7262846pfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 18:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v3gokKbgr0KmW5qd0IirTjySrq3BDLWkjRx/3rUmsDQ=;
	b=GaXd37yKxQ1wK8hJV46IavIZtORf27rehuyzRCZCvFL7Mr/KOYsb8C28HNEAYcfil2
	YBKEa/EWe4XjRnmOb5NXVW08hByinoMov5+0ZOiEDsVuUK8G5LMyqx3eK8oHFA4pvxa5
	odo7xUFwUPgSiY1hGIhRthKKDGPrKfbyTOkSfTqiZKFb7DqZwakbrBzsdj7h4MtR/0VC
	xtCgPOgR3xqQjuN8ZVdmOcnf/r/67IavmTXobT3wk30ak8yx4KUfLI6CV+AI/uOkk1Bv
	Mbpiazc3i55SrYxqd6Hf35Rr2gjmCiQlE4u7q/Mw54+y7wvu+PISPLsZhaxgHbGtWtxM
	mF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v3gokKbgr0KmW5qd0IirTjySrq3BDLWkjRx/3rUmsDQ=;
	b=XD2GQCOxSWL3SKo0EfMijdz9Yd4Y+poXhfudMzeR2XraRcqloSLHgzVGAl/vtAujPZ
	JoV+RtsdLSKsB6AycJJYxYJrnvm1/NZbgLGNdusKZ0fivzWdklWb8S4MBUTZtiOWQvZQ
	8WMKv28AmcL1gQzibJ7tMgP6hC+zvGkfK7fcZV8b2nTbkhLEgl8F8s5xSkODahNgzK4a
	KoHT7lB+vfQszjOXqCZKO4ug8GMqWa5ZNUTibxZlj5VZmaltejrmx6gU251NGVNax6GK
	TPe3A2wWZKhap+IXFNuA13fa+vmLr43C92hZiuaE5tey3DQlTkkM0xn9+2mw2QPug/G3
	0AkQ==
X-Gm-Message-State: AHPjjUjXmhJxZiiqcBowD4iZDSCtXwj75oI8JuX5xCLsUHenwyiS+8o7
	E7fdT+95nSxxHWj/hDW2F/nAc6Tj7lisgrUJhJA=
X-Google-Smtp-Source: AOwi7QCYo48huPOaybCWgfwW3w/2r5UyJ8iIZog9V3aZgZwiUfPBSDiOkTyIfKLlrc8aLQD6lzU7aQC2f0xQbJjg3Tw=
X-Received: by 10.99.152.17 with SMTP id q17mr13855664pgd.287.1506995165788;
	Mon, 02 Oct 2017 18:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Mon, 2 Oct 2017 18:45:35 -0700 (PDT)
In-Reply-To: <2184b0a74f70b5b5e4fc628ed4e48e9282b555a6.1506973045.git.paul.eggleton@linux.intel.com>
References: <cover.1506973045.git.paul.eggleton@linux.intel.com>
	<2184b0a74f70b5b5e4fc628ed4e48e9282b555a6.1506973045.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2017 18:45:35 -0700
Message-ID: <CAMKF1soN=5DqaviTuLXY5==aLd5AfCJq94Y3bsYU7zSHPc34Qw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/2] mraa: move recipe from meta-refkit-core
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
X-List-Received-Date: Tue, 03 Oct 2017 01:46:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 12:40 PM, Paul Eggleton
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
> * Set COMPATIBLE_HOST to match what is checked by mraa's CMakeLists.txt
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-extended/mraa/mraa_git.bb | 51 +++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/mraa/mraa_git.bb
>
> diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
> new file mode 100644
> index 0000000..616048f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
> @@ -0,0 +1,51 @@
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
> +# CMakeLists.txt checks the architecture, only x86 and ARM supported for now
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"

May be it should be "linux*" at the end so musl is covered too.

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

