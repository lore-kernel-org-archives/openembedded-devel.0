Return-Path: <brgl@bgdev.pl>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 095FB78568
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:14:26 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id k101so15486103iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AxjW9daRa4A7rmVL+kQS+tOW78bz6aH79ZkfWvgWl98=;
	b=cz99YZh/MboiXv48Kv5PxyWeQA1VkMPOUgP7I8b7n76jlmT0uby2cyxUZ1zcX8fYmF
	/444UU5VVExwqujBg1zIdrvAnIdGMjDxymHFSpPDbtYNY4krAhCCYkgfj4IrWHSvVB4w
	kkF7Dv06hHuFz0r1flMx+QdFpSRRSOWCvClNB7ubhzhKFOUotrScp2PctyQ90pg1wROr
	aVAYFCGil1Z7+zFRjcX25Dh1NSPgL5twlop+QxYWbWmEaHHXCTgFHCdUmj+2NUD6qGBa
	mp6GV8i0jDmqx0zIa/UUXwRtx2G56COGQolnxnvlCaWCbmMI1idsrmY3lqgWq3onCdyz
	iEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AxjW9daRa4A7rmVL+kQS+tOW78bz6aH79ZkfWvgWl98=;
	b=hub78yGBPQ0AY1mbWJD8p3nlXe7oZbE8qqA4mgtM49zgdRy/O1D++E7/I1Cp55GlfI
	S35WbeFE2WOAAF3sAqwy3AmN8rZ2EsBRy6jzIIgFNZ0+UpqJ4ez96CCWqDIBxNZJbHEJ
	v6W3gIaMvLkyEevn+atfNbkauF+vJsadhGe3X/8ldAo4ADsJN8Ao5AlFpv422zZAYH0y
	QxI4llFz0NR9LwdxJS9HiCNybpWO2luXxJAoNfmc5iol795mSsC49aPpIU+5gkwnZrfw
	9IT45bRoZT6GMMhP1xrZZqNd1vHbPfOx2BRy9SskWkgx0CcL+0jwXV6WSrAzX2oSkaBZ
	yRJA==
X-Gm-Message-State: AHPjjUhwvCfcdyh6ZYAXBMq8hJwgygbXDqCVS9KSKuq2dVXaasnrqEq5
	7kqcWs9BAuFjxXdswRgpz9CcvGb8exrCPFDJgjVMKXFf
X-Google-Smtp-Source: AOwi7QDrLFoNdfwQghL8SC+LzTVn76NfFvm2noLcSchka/BF3XUNP2MLwCPTSEY5G+CqAUfh+uVZTHRGNhG8QVa9xB4=
X-Received: by 10.202.56.214 with SMTP id f205mr11204224oia.91.1505376867810; 
	Thu, 14 Sep 2017 01:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.10.46 with HTTP; Thu, 14 Sep 2017 01:14:27 -0700 (PDT)
X-Originating-IP: [83.150.126.21]
In-Reply-To: <20170913190249.23896-1-brgl@bgdev.pl>
References: <20170913190249.23896-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Sep 2017 10:14:27 +0200
Message-ID: <CAMRc=MeYLAQAnBvorWGhuyRAObs5kLx3tC7PA7tr2TnqsfjkFA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
Subject: Re: [meta-oe][PATCH v2] ceres-solver: add new recipe
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
X-List-Received-Date: Thu, 14 Sep 2017 08:14:27 -0000
Content-Type: text/plain; charset="UTF-8"

2017-09-13 21:02 GMT+02:00 Bartosz Golaszewski <brgl@bgdev.pl>:
> From: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
>
> Ceres Solver is an open source C++ library for modeling and solving
> large, complicated optimization problems.
>
> It's often used in 3D computer vision applications.
>
> Signed-off-by: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
> ---
> v1 -> v2:
> - now fetching the source from git, not github archives
> - only add a specific directory (cmake files) to FILES_${PN}-dev
> - don't create the ${PN} package as the project is not building
>   a shared library
>
>  .../ceres-solver/ceres-solver_1.13.bb               | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
>
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> new file mode 100644
> index 0000000..58d242a
> --- /dev/null
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
> +AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
> +HOMEPAGE = "http://ceres-solver.org/"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
> +
> +SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
> +SRCREV = "19333b0f55c8462381038e70d42af43b52941128"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "libeigen glog"
> +
> +inherit cmake
> +
> +# Only a static library and headers are created
> +PACKAGES = "${PN}-dev ${PN}-staticdev ${PN}-dbg"
> +RDEPENDS_${PN}-dev = ""
> +
> +FILES_${PN}-dev += "${libdir}/cmake/*"
> --
> 2.7.4
>

Superseded by v3.

Bartosz

