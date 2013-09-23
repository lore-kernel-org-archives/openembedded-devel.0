Return-Path: <raj.khem@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 873F1610F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:51:28 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id k4so1593429qaq.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YYz8AAJBMf0O4fPEJfcLcbd6TnVTnxC9LDWwFQeR9Z8=;
	b=aRApwQgkSr+RZ35cYVkFxdLC9Lsby4mXmN9RVleuD6dIcL7RST42yjU4copfcJ83vD
	YbOFf2IG5HTywONilyeTXQFxQ9Eomy/cHFWyJSTvP9bKh6UO0vLBuVg+gf7Zdb3mfouv
	Vh+2jy7FKQqyAuv5CLWy0Kb3dyi6ZztiPo2Ss69wWUQiwkHz6eAJ1UCxUX9XM04dR93E
	mvAnyIQx6/YAJqH5ZChTnG7164D7bDKiW5xClf1gJ/+QYK+kdxWi5xhUIlC1VCzqhgB+
	ZYw67yIThsPyreFjnvyDcfAWfu+Q0jPap93129eFHmTH0cSCW0p97ZFd9qiwLP5sxl63
	bUpg==
MIME-Version: 1.0
X-Received: by 10.49.50.232 with SMTP id f8mr23740460qeo.63.1379951489489;
	Mon, 23 Sep 2013 08:51:29 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Mon, 23 Sep 2013 08:51:29 -0700 (PDT)
In-Reply-To: <1379927555-17194-1-git-send-email-b40290@freescale.com>
References: <1379927555-17194-1-git-send-email-b40290@freescale.com>
Date: Mon, 23 Sep 2013 08:51:29 -0700
Message-ID: <CAMKF1srbCbiF+0AHSjZSvJyheREkFKqAGnwr=8CjMQc1OfYdzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 2/3] libdnet: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Sep 2013 15:51:28 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, September 23, 2013,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>      *dumb networking library
>      *snort depends libdnet
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../recipes-connectivity/libdnet/libdnet_1.12.bb   |   16
++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/libdnet/
libdnet_1.12.bb
>
> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bbb/meta-networking/recipes-connectivity/libdnet/
libdnet_1.12.bb
> new file mode 100644
> index 0000000..88b893b
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "dumb networking library"
> +HOMEPAGE = "http://code.google.com/p/libdnet/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
> +
> +SRC_URI = "http://libdnet.googlecode.com/files/libdnet-${PV}.tgz"
> +
> +SRC_URI[md5sum] = "9253ef6de1b5e28e9c9a62b882e44cc9"
> +SRC_URI[sha256sum] =
"83b33039787cf99990e977cef7f18a5d5e7aaffc4505548a83d31bd3515eb026"
> +
> +inherit autotools
> +
> +
> +do_configure_prepend() {
> +   cp ${S}/config/acinclude.m4 ${S}/
> +}

adding this path to search paths of m4 will avoid this copying

> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

