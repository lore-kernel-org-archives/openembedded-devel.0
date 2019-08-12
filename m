Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8893A7E601
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 19:33:55 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n4so8261922pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 12:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+8Y9bEJPZShe/thwz8EUu9BMtDc6l9mp3ZJBAj5ReJ4=;
	b=jHXWdPZcDi0asidFPVQgTcLH+3b+OzhvrLRQgERtndlFLzomET4pueqeKimnmLA+uA
	WbJHSPDGcepv0zcGJ9Jjwlf3f99bM7dJLStXBrl4v74S+9J3xQY9CS8onXxah+RwIhsp
	sVjzilZWbEYSBKX6LWPcznzzT44BHsCiPKFl0FmLfmVXa2HaohUrI52y6VcTe9sqIbzh
	/5H0ff6um+xpqBQV1iEN/bsjszgUOu/x2aNEkj9RXpvOTH4bwVOp04g2wA4kK5CZ4QRk
	7D289t4bRnXfT8gU8XL4fW5f36FRcvyn+GH36ggCDiKyOGdSzMbxxOjLaTnvxgaBHmYb
	bIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+8Y9bEJPZShe/thwz8EUu9BMtDc6l9mp3ZJBAj5ReJ4=;
	b=KlVCBKXfDINelwH9ncwbHJby4sDEBFSDsif3G/ENqC280wvqwIMl5F/E6avlbLtrCs
	fv5lCXJzVOddOGBirZWW+tIvt5UFOOtVKTNCgP3JuU3PpWglWfo9BFNZT29HKaQj6AfW
	flzwAdaJ4FHrS0and3DgMjFWpkbcSWAmJWePvNqELyngHbeLBRVO5hC6rkRFjtpNCyCa
	w3ESftiO5Xd/9p0VSJ3h1D0Btbib6q9HudIm01hRRP2U1WeMYh1fna7FSK3c1mHqAJ73
	vJHMUpu0De6acnehRsRCTQjmjDMhZTqHDqHuDRM22t/1iXVL8RsyUxnycmaVjc7d0bHL
	RpiQ==
X-Gm-Message-State: APjAAAXPGmu7uqUg8TJ2WSfZ93V5hpC964sXmVP9bz5L5+fkCEAyi4+V
	icogpfBrHop/XYnIgpVsHabcx2oG
X-Google-Smtp-Source: APXvYqzBq/fprKiCW8/u37KcHnpGRtPFU5xjGbftwqLoI2mK1ueceDa24UYUzzOySiGbF/PlvMnGiQ==
X-Received: by 2002:a63:2c8:: with SMTP id 191mr31046933pgc.139.1565638436011; 
	Mon, 12 Aug 2019 12:33:56 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4433:1c24:7cd8:6011?
	([2601:202:4180:c33:4433:1c24:7cd8:6011])
	by smtp.gmail.com with ESMTPSA id
	o35sm100104340pgm.29.2019.08.12.12.33.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 12:33:55 -0700 (PDT)
To: Joe Slater <joe.slater@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20190812192220.238334-1-joe.slater@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d276d252-b4bd-8595-eeb8-4e1b649eca24@gmail.com>
Date: Mon, 12 Aug 2019 12:33:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812192220.238334-1-joe.slater@windriver.com>
Subject: Re: [meta-oe][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Mon, 12 Aug 2019 19:33:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/12/19 12:22 PM, Joe Slater wrote:
> Add back zlib support.  Define zip support but do not enable it.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 33bcf12..08173ea 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -59,7 +59,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --enable-fpm \
>                  --with-libdir=${baselib} \
>                  --with-gettext=${STAGING_LIBDIR}/.. \
> -                --with-libzip=${STAGING_LIBDIR}/.. \
> +                --with-zlib=${STAGING_LIBDIR}/.. \
>                  --with-iconv=${STAGING_LIBDIR}/.. \
>                  --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
>                  --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
> @@ -81,6 +81,11 @@ PACKAGECONFIG ??= "mysql sqlite3 imap opcache openssl \
>  "
>  PACKAGECONFIG_class-native = ""
>  
> +# For zip, select one or none.  oldzip uses a bundled library and is deprecated.
> +#

How would I know which is old or new? is there a version ref we can
mention? is it a gplv2 or gplv3 thing?

-armin
> +PACKAGECONFIG[newzip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
> +PACKAGECONFIG[oldzip] = "--enable-zip --without-libzip,"
> +
>  PACKAGECONFIG[mysql] = "--with-mysql=${STAGING_DIR_TARGET}${prefix} \
>                          --with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \


