Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 784FD60767
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:08:45 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id 137so217142841vkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=K6db6HpUxDmVDaQtrOsOyOtlFOYxMq/e3Ivvbhdd3YU=;
	b=IfaCyT/H8PjNZX1YdbMLN/UDnaDDFV1p07Mjp0HgLqvmAT0a9IKqKbXEM671/XoJIo
	oP+zcVtEC4HDpiohMuaMf3SB27GymM2bEoK3ryqscmZjblwfMnz7qrCwjWs0Htk3BILV
	QiJY7kQkkHnde7yUjYaYWIg6n01dYKUrdEcAYP3LeyCeDAyqUxwFqoyRIGB3PJAwdCKF
	qYdgy6NWItIFUgCjhVe973DQ7gf9VXwtAxJAAc9FvjQGWkvkqmaOZq0snguTVmUSZoGb
	q2P7SAnBKL91K8e7ukPksRl35cjQ6L30WY/dedx0oS84y2J3Ws3p9aqqTq1gNijtP5sr
	mSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=K6db6HpUxDmVDaQtrOsOyOtlFOYxMq/e3Ivvbhdd3YU=;
	b=DVma4Etu7B0uW7X7mxieDylKQ9ytDJvOmm6LKCaG4JPjjwIxVRoZkCzZf8oANa7rLr
	kN/FyQvIl3Fsb5Xsk93mC2feKLr8s4Lgbfkxob50Fnf2yw7pbVnHIAuAh8+AVCTVj+O7
	XtziD2VHV6QwzW44Cxt3a7T2wbSVlc4/vyfGSpmExTslkj/4OK1PdKlXli6Rn4y16Yz4
	P0VjNYvHIBsqc6u9ZXNbKhKjN9vK2cDXhwnGqNulRVcr38BCetQMGnAF5Z6bhjmLBqsb
	si6sslc8FlfwscAQ9OdJ+cpT7Z31UMWZlkxJFswsoGeB7QymAjQUVT4B6e01CchYYTMy
	Uoxg==
X-Gm-Message-State: AKaTC02T79HHWtKhb/vAsGVTt4UJW5YRjPBjDSHhB/rz/TuOBCJ5IwMY/GszQL9pguL1oWEUa4MhN7DKUCoHCw==
X-Received: by 10.31.161.65 with SMTP id k62mr6634683vke.12.1479730126177;
	Mon, 21 Nov 2016 04:08:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 21 Nov 2016 04:08:45 -0800 (PST)
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 21 Nov 2016 13:08:45 +0100
Message-ID: <CALbNGRTLPKdreTpRBxgfT8Rq6bK3rzGKnpx7EN-DUp7s=ag_DA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python-distutils-extra: initial add 2.39
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
X-List-Received-Date: Mon, 21 Nov 2016 12:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 11:10 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> add version for python2 and python3
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-devtools/python/python-distutils-extra.bb  |  9 ++++++++=
+
>  meta-oe/recipes-devtools/python/python-distutils-extra.inc | 13 ++++++++=
+++++
>  meta-oe/recipes-devtools/python/python3-distutils-extra.bb | 11 ++++++++=
+++
>  3 files changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-distutils-extr=
a.bb
>  create mode 100644 meta-oe/recipes-devtools/python/python-distutils-extr=
a.inc
>  create mode 100644 meta-oe/recipes-devtools/python/python3-distutils-ext=
ra.bb
>
> diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.bb b/=
meta-oe/recipes-devtools/python/python-distutils-extra.bb
> new file mode 100644
> index 0000000..56dd33d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-distutils-extra.bb
> @@ -0,0 +1,9 @@
> +require python-distutils-extra.inc
> +
> +inherit setuptools
> +
> +DISTUTILS_INSTALL_ARGS +=3D "--install-lib=3D${libdir}/${PYTHON_DIR}/sit=
e-packages"
> +
> +RDEPENDS_${PN} =3D "\
> +    python-distutils \
> +"
> diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.inc b=
/meta-oe/recipes-devtools/python/python-distutils-extra.inc
> new file mode 100644
> index 0000000..4d87d77
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-distutils-extra.inc
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "python-distutils extension"
> +DESCRITION =3D "python-distutils extension integrating gettext support, =
themed icons and scrollkeeper based documentation"
> +HOMEPAGE =3D "https://launchpad.net/python-distutils-extra"
> +SECTION =3D "devel/python"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4325afd396febcb659c36b4953313=
5d4"
> +
> +PV =3D "2.39"
> +SRC_URI =3D "https://launchpad.net/python-distutils-extra/trunk/${PV}/+d=
ownload/python-distutils-extra-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "16e06db0ef73a35b4bff4b9eed5699b5"
> +SRC_URI[sha256sum] =3D "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085b=
f37f3997ae8063af"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra.bb b=
/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
> new file mode 100644
> index 0000000..af242b8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
> @@ -0,0 +1,11 @@
> +require python-distutils-extra.inc
> +
> +inherit setuptools3
> +
> +S =3D "${WORKDIR}/python-distutils-extra-${PV}"
> +
> +DISTUTILS_INSTALL_ARGS +=3D "--install-lib=3D${libdir}/${PYTHON_DIR}/sit=
e-packages"
> +
> +RDEPENDS_${PN} =3D "\
> +    python3-setuptools \
> +"
> --
> 2.5.5
>

ping on whole series

