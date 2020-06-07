Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14277.1591558131754800745
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2020 12:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB00240BAA;
	Sun,  7 Jun 2020 19:28:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsE8Zj3CXmBh; Sun,  7 Jun 2020 19:28:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80C3440A35;
	Sun,  7 Jun 2020 19:28:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C80B717320C; Sun,  7 Jun 2020 15:28:48 -0400 (EDT)
Date: Sun, 7 Jun 2020 15:28:48 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joris Offouga <offougajoris@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] c-periphery: add recipe
Message-ID: <20200607192848.GS17660@denix.org>
References: <20200607160532.415655-1-offougajoris@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200607160532.415655-1-offougajoris@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 07, 2020 at 06:05:32PM +0200, Joris Offouga wrote:
> Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> ---
>  .../c-periphery/c-periphery_2.2.1.bb          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
> 
> diff --git a/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb b/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
> new file mode 100644
> index 000000000..b53cd6b19
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
> @@ -0,0 +1,21 @@
> +SUMMURY = "C-Periphery lib used to access GPIO, LED, PWM, SPI, I2C, MMIO, Serial"
> +DESCRIPTION = "A C library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"

libsoc?

If this one gets in, should probably go to recipes-support where libsoc 
lives...


> +HOMEPAGE = "https://github.com/vsergeev/c-periphery"
> +
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
> +
> +SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
> +SRCREV = "c2aa7d164f87b807077daeeb3443a56b89e1d1c9"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> -- 
> 2.25.1
> 

> 

