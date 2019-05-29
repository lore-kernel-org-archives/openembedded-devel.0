Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 63AA97DED3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 09:11:48 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m18so941322qki.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0xZ8tRL0pkkNdRMNAZc+15Q3g2dIpDhL1SDXk8d7Bys=;
	b=ouCg3AOfwQ6N5eqwgYQvTdnla65sr4tj84vz7x8XB1Dao4qtmCwu2eho1oUptc5BA7
	ydAVtXyplBHqdZgI5mkQT/nARjx8W/imyP8rwpqxJXWkMkiDGPlk+3yF76uOspbwUmMw
	LOQYdx3FWsO77l8zNRj8phRvf2A3atbBcoC3h6VJY9UVdBsONka4DR3wDmtRRNd3ejf4
	gpwXgvYzAo+mlAoyOltz/SAUCmeLlDqFQnPvJeRJxVCoZnS0j8z+JK4JR7QihpyWofq7
	PJkMXBEQZs7rBY0clU6AYnEHvzOAZfZEnSNUQGmBwnVfeDc8VVKRKLgCcMmXh0Z04KpA
	Wxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0xZ8tRL0pkkNdRMNAZc+15Q3g2dIpDhL1SDXk8d7Bys=;
	b=oYcxQUhEV5p1E4oBiX/6Y1G22iiPqEp5riTtrb6sMqk5/nPk6OS9neCv9GUNj8MIhx
	IliEBZ2LH6IErtw7JLcOk49RBn0q8yPh8PaRjJW3xURbvDDtl4wBep8L53B87lKT++qW
	sbYV2QwvtXXngjtXVbbPhijbOHQRwHMF/HWNH+TLfqo8B3uIFv63WvnfzbBMRaEiIFJ0
	zqOLr2cA4XDxu0sXe/mGdH0eZLyuo/VvQ60TiCb3+J/MMCHjuz8WoQ2VN2xBHQbUTUWH
	3gol6bi6IKCsPVbFvLkPKbHsy1jiozkiFW0iz3hDeq4hLmidIeLfehoZ3V4DLcrDGANt
	e0aA==
X-Gm-Message-State: APjAAAVsvFqDIxe8ikKYrS3gAatxz/g+8B6n0oMzuWnnactptWKpzNcb
	YJ6MszfwTbLlP7k/8+0SoLPcvAdQb6pJ3ERP67YbWI9Id2k=
X-Google-Smtp-Source: APXvYqySVLj1qgkjZzIkzKQFcp4Szq2UV3YohHz1FVD0MwQYb9PKLI4EB8PEaEuesaJNaOlHUpmjNFLSVnKL671dYRU=
X-Received: by 2002:a37:66cb:: with SMTP id a194mr7590629qkc.312.1559121109152;
	Wed, 29 May 2019 02:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190528192804.15712-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190528192804.15712-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2019 11:11:23 +0200
Message-ID: <CAMKF1sopyc2vK7D+-tJROnKzAc0AKyGwqDCZsQPtKNPQy3mPqg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] libghttpd: update to 1.4.54
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
X-List-Received-Date: Wed, 29 May 2019 09:11:48 -0000
Content-Type: text/plain; charset="UTF-8"

should go to oe-core ml

On Tue, May 28, 2019 at 9:28 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../lighttpd/{lighttpd_1.4.53.bb => lighttpd_1.4.54.bb}       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/lighttpd/{lighttpd_1.4.53.bb => lighttpd_1.4.54.bb} (96%)
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> similarity index 96%
> rename from meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
> rename to meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> index a0b350f358..ba1a2c54bf 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> @@ -19,8 +19,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
>          file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
>          "
>
> -SRC_URI[md5sum] = "f93436d8d400b2b0e26ee4bcc60b9ac7"
> -SRC_URI[sha256sum] = "3bdfce1cf3e9650a556a8c26fb15342c5717c63f530c54693db632b0371dcb78"
> +SRC_URI[md5sum] = "7abc776243c811e9872f73ab38b7f8b5"
> +SRC_URI[sha256sum] = "cf14cce2254a96d8fcb6d3181e1a3c29a8f832531c3e86ff6f2524ecda9a8721"
>
>  PACKAGECONFIG ??= "openssl pcre zlib \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

