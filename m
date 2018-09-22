Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id DAC6579448
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Sep 2018 13:17:08 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i10-v6so4518568qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Sep 2018 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PnWOSs4ckv291wrZ98DDLdnlyC0DslOruoF+JlSy+0E=;
	b=Xmr0iUBboeumCBWbx9lzEz9PYSgSjw1ITHVzy7Ni57NJo6SltKiUA+UfR9P93TDifd
	1s1YiN+pdkzYtN1aoi56yMGg7ZHInmSwQq2A7ZSNyZRu7bWKJ0FdRntchwoBfDiYuGvR
	VIOi6IFZjmQeiDo+i+XQtPC2ZGp+rzmYSCcG4RkF61L7KWOZ3vnmyTiiIqeTVvKyGUp6
	Uxt8etu+Pih8WK1ts6EEn1bj2ZM/B0ohXC3b0q0oafUMTb4GN5AkxCWoPv2VlOBlOomI
	QXTZyeTy8sIOEOKSlBQsEKuzdSy08A78la4tPhVUPgsC8Vd1+VqTXo2osd0X4evYijXt
	il3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PnWOSs4ckv291wrZ98DDLdnlyC0DslOruoF+JlSy+0E=;
	b=NAjNiMxdzaBRI26zUvgPdqRGUV+C44mzYZPSjQftYmWFwHDW6HnCQdLwMOgWYO8hMf
	EAX3CsQHbrwXqVjZBwSMTL0Bn+kcYwBt2hDNxqsz46CX6GwmWOMxT0j4uMK2uTj/DCPU
	KJsP9T1sre5XhTXAxofKHA0PHXmUlEzSCaQJIvK7btM80zcJIqOyfb+QCxknQfbzNaIg
	nuYdx3QOAjUw1LhTK3Lc4aORHMfzKx+9hgqY0liRkz/Eb4xGPrTsFJlsuVdhkn4f4tf8
	oCkDq/bjGtig5MDnvg2o4IKbZs11v2t8VCNDLpH0OA2EeZEXKsOvMhQ94nyFUyKciXny
	nZoA==
X-Gm-Message-State: ABuFfohrLVhzXjIy6vnPSu4Wbzt4tQyM9vfOO3Yh249qlw7MhpdeUtl3
	9aqUeFniFgcEIeINNJVLbeBJ/LN5fKvLQ0m9lq4LFj7BsWI=
X-Google-Smtp-Source: ACcGV61ixc1Oqx24v8xLK5qOoNJFT0/rTo5B/ofJRHXOJ2eKAR3+Dxlqwc6ZPs/qOTT+PikLZys2gD6sMCg124o3kQY=
X-Received: by 2002:a0c:f94e:: with SMTP id
	i14-v6mr1420334qvo.50.1537622229527; 
	Sat, 22 Sep 2018 06:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <1537510551-128643-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1537510551-128643-1-git-send-email-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Sep 2018 06:16:43 -0700
Message-ID: <CAMKF1spt0HYHxVTTGgerYxR6LgqbhDx4Jeqfd0MbMpuzmtbB0A@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] php: Upgrade 7.2.9 -< 7.2.10
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
X-List-Received-Date: Sat, 22 Sep 2018 13:17:09 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/193970/
On Thu, Sep 20, 2018 at 11:16 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. Upgrade 7.2.9 -> 7.2.10
> 2. php 5.x not support valgrind config, so move it to php_7.x.bb
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc                         | 1 -
>  meta-oe/recipes-devtools/php/{php_7.2.9.bb => php_7.2.10.bb} | 5 +++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php_7.2.9.bb => php_7.2.10.bb} (80%)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 65dfd2d..9eacabe 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -92,7 +92,6 @@ PACKAGECONFIG[imap] = "--with-imap=${STAGING_DIR_HOST} \
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"
>  PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
> -PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
>
>  export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
>  export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
> diff --git a/meta-oe/recipes-devtools/php/php_7.2.9.bb b/meta-oe/recipes-devtools/php/php_7.2.10.bb
> similarity index 80%
> rename from meta-oe/recipes-devtools/php/php_7.2.9.bb
> rename to meta-oe/recipes-devtools/php/php_7.2.10.bb
> index a5d5afe..8dc64bb 100644
> --- a/meta-oe/recipes-devtools/php/php_7.2.9.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.2.10.bb
> @@ -13,12 +13,13 @@ SRC_URI_append_class-target = " \
>                                  file://0001-opcache-config.m4-enable-opcache.patch \
>                                  "
>
> -SRC_URI[md5sum] = "175023bc43fd8f883e60849a02a03b93"
> -SRC_URI[sha256sum] = "e9e3aaa6c317b7fea78246a758b017544366049d2789ad5a44fe9398464c53a8"
> +SRC_URI[md5sum] = "0ce8ff615bfb9de7a89bab8d742c11c0"
> +SRC_URI[sha256sum] = "01b6129a0921a1636b07da9bc598a876669e45a462cef4b5844fc26862dbda9d"
>
>  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
>                          ,--without-mysqli --without-pdo-mysql \
>                          ,mysql5"
> +PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
>
>  FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

