Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1017D34A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 04:07:02 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id w5so25855649qtb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 21:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y0pVl2XIfVw0nfhMGUGARE6Dvc2iwuqu+N+7zpb7/j8=;
	b=Bfs376Nyo3/l+lJUXD9Rph7d9CIi+ubFvhfihSG2ZI2CI2LtN0DCUUp6O4SixQ+RKk
	57Prnh+unn54ta+gAkVCwHvjjXA+onjC4FNbXOOoFWFR0p1HBlR3obo3Q0XvTVmNJjMp
	19t3OLaZR8A93zUGyLALX0JZtAoA/k6sDP98/PN6MAwt1wa62zGg6yoYWXd08c3bOdSk
	dtJTYZ/Uu0noZ1jO44upGJce9ifoQSubbeOUzbkGh0HaJaJAYohHG9vqXh8hu8cnFTes
	b+bS3QTc88tXA79RsEVj+rPra7hstHibjiK+z7V3C1f+oWX8U0qIB0ymCATEq0cdvHYG
	XGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y0pVl2XIfVw0nfhMGUGARE6Dvc2iwuqu+N+7zpb7/j8=;
	b=UXlvRKESWSXIMdN+oeGwPY02fSL/SKnI+F8hlvrfOoLTyUW9HkFn8XNB0HwRICf+m1
	752mZhOltLjU3IDqQMiLC023qe1apxzc1HN4ZgDfXxUsjSUcIYvFQJdW/aXLu5O3S8Ki
	0BV5URw+an1u9Uo+ncczXPGoD1JWqzkCVGhFSVgfK71lShxiJaFe9MV5cpgPQQUdW0Nv
	RMT4ZnDnK8fwgCw7iGzjT2hFZaNNUkrg/A2uumRcwkpmDdEZgQa2Hz0uk4jEiJZJ97ws
	1lTWc4JdSJYoBJ1CtxPuASlAVhYJwTqnhPSsaLk1nvmFgejtpXfKunVA9jYWB9dI5oqg
	P+AQ==
X-Gm-Message-State: APjAAAVydFWZgzluTkKVeOzJlPEubTSmnuBL9y9s+5GgJ69/4fmkEOsT
	sGzzA9AOBPviccSt8EG5IkNYH0i0yklhNDYf8c8=
X-Google-Smtp-Source: APXvYqwzx2ryvn0UxTe8RuWr9qz4t2igiLwAF3fFirxxPfcHNe8P8ovhn23qoeIIo9JZ5S8DxcBwMQhko8C93Gjy2Ks=
X-Received: by 2002:ac8:2aa4:: with SMTP id b33mr68700804qta.127.1555474023297;
	Tue, 16 Apr 2019 21:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190415013750.59316-1-aaron.chun.yew.chan@intel.com>
In-Reply-To: <20190415013750.59316-1-aaron.chun.yew.chan@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Apr 2019 21:06:37 -0700
Message-ID: <CAMKF1spKdKKjOsyuS0KMSDpQbW1Y7B1Krto3+=poQqtLLSL4aA@mail.gmail.com>
To: "Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] php: Fix libzip extension
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
X-List-Received-Date: Wed, 17 Apr 2019 04:07:02 -0000
Content-Type: text/plain; charset="UTF-8"

I think this breaks php itself

https://errors.yoctoproject.org/Errors/Details/237658/

On Sun, Apr 14, 2019 at 6:38 PM <aaron.chun.yew.chan@intel.com> wrote:
>
> From: Aaron Chun Yew Chan <aaron.chun.yew.chan@intel.com>
>
> Phoronix Test Suite 8.x requires zlib and zip extension in PHP 7.x
>
> Signed-off-by: Aaron Chun Yew Chan <aaron.chun.yew.chan@intel.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 6f893ad85..d2cd05f8e 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -47,7 +47,6 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --enable-fpm \
>                  --with-libdir=${baselib} \
>                  --with-gettext=${STAGING_LIBDIR}/.. \
> -                --with-libzip=${STAGING_LIBDIR}/.. \
>                  --with-iconv=${STAGING_LIBDIR}/.. \
>                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
> @@ -64,7 +63,7 @@ EXTRA_OECONF_class-native = " \
>                  ${COMMON_EXTRA_OECONF} \
>  "
>
> -PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
> +PACKAGECONFIG ??= "zip mysql sqlite3 imap opcache openssl \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
>  "
>  PACKAGECONFIG_class-native = ""
> @@ -90,6 +89,7 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
>  PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> +PACKAGECONFIG[zip] = "--enable-zip --with-libzip=${STAGING_LIBDIR}/..,--disable-zip, libzip"
>
>  export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
>  export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

