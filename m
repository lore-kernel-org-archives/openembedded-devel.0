Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB8178513
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:54:27 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id l24so18232953uaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 02:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cS8zf95ILRu4gaOJQMytvq6v/TxMYqzdJjozP2CVLno=;
	b=u+mdULpLekv9e5j3wVfQTj0Dohp4X9tf736U6gA+mfoGuNzrFD5MVxG/IVvvp6kmmx
	9T4XcMWu5SSy7YDiYm9WmHfN+ggzAtixDlZqJ7fe9GxqNbwQyPZGE2JKPNumYIcyhfY1
	ZPGBpS+8J/RaYPizc22Yz3tlIfQIKRF7NB8/izXASjURSi3WswyVTJnAoYNDtuQXWv7N
	PXv/15OF4Ba1azFi9XLlmZLqVCwER2eC7jUfgUzgy92rAb6vEYXaXEBdD5BhdmEs/cs7
	AHE8NoRk4SVaseKMCXnxyZro7m1KhPIPchpmqoXXMhH5Dlfgm2PD7uRsLs49k7gx5hcW
	/4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cS8zf95ILRu4gaOJQMytvq6v/TxMYqzdJjozP2CVLno=;
	b=QQizQM3hdF4IxLO0rjJFb9l2Ap9vRVfslMhaOymGZKJjfglOcxQjDOykn/jkxIqbtG
	cRCBG9+21JirKHY9zHvpFzxEMOnCuto6/0Tx95rtmETjP6qkhfovfdsovo236mTAyxvr
	oUiHpPglm1thQ/0+rwtnQRYNXlU7bzAxE8fFWbcW9sfXizkeKr1ZoLFSY13Dh0PPL7Bf
	GD6feE52YDnmxF2BLS6rppFxNVIKCFK/Yc9YjPXuwB8OzIZOexVRbrJ+PWBio2V8fPaz
	ZppWFWwv0UOLK/+HpFyq70yehhAsMyUaK42ZC34s7iHTbk6N6Qze7ecXfNVTbimQWYNt
	5t5Q==
X-Gm-Message-State: AHPjjUjS3Gm9OEuZQJRzgoi/nfluXm96kBiQo9JeOX1/hvxRJ0omi6s2
	U9B0u+5fiuTe99AcMy/KdwswyumLM/CLUbdIT2o=
X-Google-Smtp-Source: ADKCNb62AiBk3DNzM4tOfgfTg7CLSrCB0hdR3ynn3zaoyt3bOoQrUNr6T67IXD9MZZxNjVN6Sm7o8gNu9d9nXTuqPXY=
X-Received: by 10.176.83.149 with SMTP id k21mr12848740uaa.183.1505296468479; 
	Wed, 13 Sep 2017 02:54:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 02:54:28 -0700 (PDT)
In-Reply-To: <20170913093821.12746-1-kai.kang@windriver.com>
References: <20170913093821.12746-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 11:54:28 +0200
Message-ID: <CA+chaQfD6QeAiKWQo+u6i5xSQ-bAFvMVL9CMvuA4N6-4dj3pGQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libpng12: add it back from oe-core
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
X-List-Received-Date: Wed, 13 Sep 2017 09:54:27 -0000
Content-Type: text/plain; charset="UTF-8"

All other LSB related recipes are in oe-core, why should libpng12 be
different and live in meta-oe?

On Wed, Sep 13, 2017 at 11:38 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> libpng12 is removed from oe-core. But lsb test 5.0 still requires
> libpng12. So add it back.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb | 36
> +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
>
> diff --git a/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
> b/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
> new file mode 100644
> index 000000000..9f74f5fdb
> --- /dev/null
> +++ b/meta-oe/recipes-lsb/libpng/libpng12_1.2.57.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "PNG image format decoding library"
> +HOMEPAGE = "http://www.libpng.org/"
> +SECTION = "libs"
> +LICENSE = "Libpng"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=597b8a91994a3e27ae6aa79bf02677d9 \
> +                    file://png.h;beginline=19;endline=109;md5=
> 166406397718925b660f0033f7558ef7"
> +DEPENDS = "zlib"
> +
> +PN = "libpng12"
> +S = "${WORKDIR}/libpng-${PV}"
> +
> +SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "307052e5e8af97b82b17b64fb1b3677a"
> +SRC_URI[sha256sum] = "0f4620e11fa283fedafb474427c8e9
> 6bf149511a1804bdc47350963ae5cf54d8"
> +
> +UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/
> libpng12/"
> +UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
> +
> +BINCONFIG_GLOB = "${PN}-config"
> +
> +inherit autotools binconfig pkgconfig
> +
> +do_install_append() {
> +       # The follow link files link to corresponding png12*.h and
> libpng12* files
> +       # They conflict with higher verison, so drop them
> +       rm ${D}/${includedir}/png.h
> +       rm ${D}/${includedir}/pngconf.h
> +
> +       rm ${D}/${libdir}/libpng.la
> +       rm ${D}/${libdir}/libpng.so
> +       rm ${D}/${libdir}/libpng.a || true
> +       rm ${D}/${libdir}/pkgconfig/libpng.pc
> +
> +       rm ${D}/${bindir}/libpng-config
> +}
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

