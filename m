Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id B5EBD7D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 14:09:34 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id x134so102879qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=13E+k0i/QG9D1h3442k8NOnBK4joEFUd4pQIP+gZ3Gw=;
	b=bAYTih225fx7VFFwP70gnhxn3q3DU+5vNqltVaxUnGVMfTjelYAiO/FfQpp9lWaWTH
	rhcB8F+4oqBfnAnJ+Bd9dwrOclQc7ks+G8xU+HZi4tJvGdHJuGUQo0Dojuldd8MRXxIx
	3H/YpbWR8RS0lqpEM7W3kJ8a5582iyFv1LAznrWfO8Z3AzNLQYzjCPJB1ZLPo3TBvNL6
	811Tx3nb+vXXp5W5f0ThJ7Ou+OeFQ20ta6KNlREMkVQOXHV/s7ChPZGxuiclXKHB1j58
	+RQRuvhK2wGXLA7fymYYZBUKA3Tqgq5jWur6bNiMN7CT1HDxBVLr5eVd0ThLEH8pzHJi
	jMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=13E+k0i/QG9D1h3442k8NOnBK4joEFUd4pQIP+gZ3Gw=;
	b=ZbvW/Aw54llSVX6X8zouqF44+qxJfcCbk29HzflnOOacOopzw7E1hqCCGEgryI04BF
	RAjRHdypJ8IeiX/CegcZQbxv45Moh8EL3YMS345daEWFLG/neAQsy47727BgsUXZKCVK
	zWWjUZKdBLsgSwRIL3M3T2hPkOaeiyR/z+R5ATxh9L69nJ8ukOgxwtvN3vzSo0oWclLY
	idPMS9r8oOefLjeBNK0tEI3NtvskCge+/stckqejU1BiFllGmj9uRMUXTJFV8j0dzNGy
	KCouqgMXrLqilJuAnvVtnyGGmSXtBQZdaECp7UiuZ2yfQ5wa5EHSTRvv+i9CBP2nHSHh
	pp7w==
X-Gm-Message-State: APjAAAUGF3z1R/7NP3f8sCk3zO0peAIi9KnMkzxlI+N7eR732Xhc3CY/
	Tonk3enDc+45sc7y1SOJFIEoDKbm0PNqSbURe4I=
X-Google-Smtp-Source: APXvYqz0MPD3YopUI5FHgLkF9NApIcysLougrbXMEe8mRhVLq8AsCkfuxCUO6R7Spez/PU2mKc+ponJRKptSEaDBQfE=
X-Received: by 2002:a37:6651:: with SMTP id a78mr109542qkc.474.1568642975489; 
	Mon, 16 Sep 2019 07:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190915212810.27364-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190915212810.27364-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2019 07:09:09 -0700
Message-ID: <CAMKF1spG5nXwFLdePxckqH0O6hAf7joBaBO_o5GXKG3chMu67w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 1/2] gelg: update to 0.4.16
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
X-List-Received-Date: Mon, 16 Sep 2019 14:09:35 -0000
Content-Type: text/plain; charset="UTF-8"

gimp fails like below

checking for gegl-0.3 >= 0.3.0... no
configure: error: Package requirements (gegl-0.3 >= 0.3.0) were not met:

No package 'gegl-0.3' found

seems to be related see
https://errors.yoctoproject.org/Errors/Details/270690/

On Sun, Sep 15, 2019 at 2:28 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License checksum was changed because http links in the file were
> replaced with https (see @758b21f68438c53496078fb5cf177166f32e603a).
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../gegl/{gegl_0.3.18.bb => gegl_0.4.16.bb}        | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-graphics/gegl/{gegl_0.3.18.bb => gegl_0.4.16.bb} (70%)
>
> diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb b/meta-oe/recipes-graphics/gegl/gegl_0.4.16.bb
> similarity index 70%
> rename from meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
> rename to meta-oe/recipes-graphics/gegl/gegl_0.4.16.bb
> index 0053c0c68..0a8064478 100644
> --- a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
> +++ b/meta-oe/recipes-graphics/gegl/gegl_0.4.16.bb
> @@ -1,11 +1,11 @@
>  SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
>  LICENSE = "LGPL-3.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f1a8bfcbc85304df454b65d378b299c7"
>  DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl json-glib intltool-native"
>
>  EXTRA_OECONF = "--disable-docs"
>
> -inherit distro_features_check gnomebase vala gobject-introspection
> +inherit distro_features_check gnomebase vala gobject-introspection gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> @@ -16,16 +16,16 @@ PACKAGECONFIG[lcms] = "--with-lcms,--without-lcms,lcms"
>  PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
>  PACKAGECONFIG[webp] = "--with-webp,--without-webp,webp"
>
> -SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
> +SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.4/${BP}.tar.bz2 \
>             file://pkgconfig.patch "
> -SRC_URI[md5sum] = "6e5c6f229261478dc436a38c84405b2a"
> -SRC_URI[sha256sum] = "d7858ef26ede136d14e3de188a9e9c0de7707061a9fb96d7d615fab4958491fb"
> +SRC_URI[md5sum] = "cb17ac529a882f25f54c0115c63d4027"
> +SRC_URI[sha256sum] = "0112df690301d9eb993cc48965fc71b7751c9021a4f4ee08fcae366c326b5e5a"
>
>  LDFLAGS += "-lm"
>
>  # There are a couple of non-symlink .so files installed into libdir, which need to go into main package
> -FILES_${PN}_append = " ${libdir}/gegl-0.3/*.so ${libdir}/gegl-0.3/*.json ${libdir}/libgegl-npd-0.3.so ${libdir}/libgegl-sc-0.3.so"
> -FILES_${PN}-dev_append = " ${libdir}/gegl-0.3/*.la ${libdir}/libgegl-0.3.so"
> +FILES_${PN}_append = " ${libdir}/gegl-0.4/*.so ${libdir}/gegl-0.4/*.json ${libdir}/libgegl-npd-0.4.so ${libdir}/libgegl-sc-0.4.so"
> +FILES_${PN}-dev_append = " ${libdir}/gegl-0.4/*.la ${libdir}/libgegl-0.4.so"
>  FILES_${PN}-dev_remove = "${libdir}/lib*.so"
>
>  # Fails to build with thumb-1 (qemuarm)
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

