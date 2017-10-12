Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4A860068
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:05:02 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id b79so3367813pfk.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 22:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XjS+AgCR7U77akL/NWMELBhesh05j+UB2zOsG674iLk=;
	b=Nc44EtGIHAV5GlBHZ4+VNsOSDjbxACRV/JedF4vbq2c6i0/pFwCurj1p84aHV4icum
	D+PVd5mGV/vMTtZ7iTgM/LYGFPbJqFIMPvY9wRQyrbndvZsaBQTrHBB5eZGQkOldTPh6
	3+PEk/jqN6PO1d20t9eZW4WGD9FkXq9I8lmDLnkdG6OBWOsGvWXL6jat67JahnQTQjea
	CyDoa2RrEaFZ/IYg3JR5le+6YKgtlNPivibmvAjjUVRxw4EcA/aL3jWWPh6V8b7QP4+T
	5HQdq53vp8pcZxYGputJTMUryF77hu88nPyCwFFzd2qJRc8cIh2lR2MpOGJL3W2+q0cM
	/++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XjS+AgCR7U77akL/NWMELBhesh05j+UB2zOsG674iLk=;
	b=G4HGLx8X5FUJP2IvdEb8PZ/LaOmnLq/YnhJfYgjVUOXcrElMn6MgE44oQNsA6gaEwE
	dA1IaQdTaD8+26uR7I8Kq+7GpowJ7fFAz3x6r13f/fbYgc/aK4ZHzc0pl/3oZ9b+gZUF
	NDd2zf54IeX8m4iiLYbUwJqGpaumI2H9DHLHVU5ogVG9Y76s+8RARWQcY69GNkjp7y7u
	KzyVyDVOxl1OziIvL+P5+YwnpI2MtyMONSFoHBX69tmDFVfThdwuozOB3wbby6AURYGK
	tUNfmqLu9PolFVMdjDcu/RHs00RDYFVwhRWmnAenFpfMmVdMLzTnJmLq5qpnHsjlFXVV
	hd0w==
X-Gm-Message-State: AMCzsaXKmSuB/Ga6jcRUNGIyvZtLLo/ZazCThtwl8bkp7hVY7rh/dqSq
	x/KQ4rXfzs8vzIefebbBo3hKDUjamYlSvjA3MAA=
X-Google-Smtp-Source: AOwi7QDF/He6whbfsbGI0xn2ZKV3lbLrLmGOzbxlhqNmNGyHqe43J9tpMwCcLUbmhOLeT7aGnTUjcp4YPULlIwAjtuA=
X-Received: by 10.84.204.133 with SMTP id b5mr1126712ple.440.1507784703824;
	Wed, 11 Oct 2017 22:05:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 11 Oct 2017 22:04:33 -0700 (PDT)
In-Reply-To: <20171011143144.23691-1-limon.anibal@gmail.com>
References: <20171011143144.23691-1-limon.anibal@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2017 22:04:33 -0700
Message-ID: <CAMKF1spJt3boF3g=2kTu-wYzm8wZDTRo7hZ-5QzZ2YVU7R61MA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 05:05:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 7:31 AM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail=
.com> wrote:
> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> A tool to generate load and stress a system, currently this recipe
> is on a couple of layers [1] and is not updated, a good reason to
> have in meta-oe.
>
> [1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=
=3Dstress-ng
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb | 18 +++++++++++++++=
+++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
>
> diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-o=
e/recipes-test/stress-ng/stress-ng_0.08.17.bb
> new file mode 100644
> index 000000000..f8b0a0d27
> --- /dev/null
> +++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "A tool to load and stress a computer system"
> +HOMEPAGE =3D "http://kernel.ubuntu.com/~cking/stress-ng/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +DEPENDS =3D "zlib libaio"
> +
> +SRC_URI =3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.g=
z"
> +
> +SRC_URI[md5sum] =3D "e0f6497a8c06f5d652bc2ad88d449c12"
> +SRC_URI[sha256sum] =3D "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2=
231c1058b1a5dd18"
> +
> +CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"' -O2"

do we need -O2 always?

> +
> +do_install_append() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

