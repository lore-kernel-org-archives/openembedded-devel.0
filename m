Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 244F260248
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 22:33:40 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l2so58571593wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 14:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SISu6Gn4uEzKHYb++ugRdBs7GLbiq5svEdWeA/Ow9Oc=;
	b=H50Gt8Jx8/YhKv1AbYdtfQZOlRkjfjxOc4jz7OuONEWH/Yy/x7NviLTPAxt8jJ9NDE
	U+sLcaYExTYMiy6GtLoxWWReSFS4hcboykI4iQ77ot0NwEi0yTp4Jqs2G0WWBcYha17B
	nEIqmM4t9EQEt1WI17Ick4kkphMV4yYGvrR2hOHD7wJ2fipCK3eSfeNmhsEj5lo5jUWh
	r2qZB2nXGjNvP/jRX93CaXO3hM0L2ADZWac91+oJ19feW+S09lIKfHLqajzGkrAgBbcc
	fTGfqwvGf9t/0GNlkzXf6gBWSfVsV8yx+XpCn+EMn5P2ooWWq4iSaq6jtrXfWg+yBVSW
	R8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SISu6Gn4uEzKHYb++ugRdBs7GLbiq5svEdWeA/Ow9Oc=;
	b=KSUNYj5hJd/WjBtdhXGGsPJxIukpYA2pj+GfR4miqCQMXUbX0NRRICFUVW00A4ndBs
	gAowRqVpqaH3Jk11AuDMI0oKC38wsgXJh073ePkGvBr4xQzx1dhQ1MDHP5wQQDbcjGLI
	yJ1A63DALETfoiKdqK+7KAIxzbrzxOYZORqZVKPyRqVf+E1GCMhS+QVvYb+eoBx72CYx
	T9LCzn+otAJdIX+x6iwJdXtFLZad19QEVRh7DPgeJA/p/Qz2ta9e2G9eokROUAb5b0Gp
	mbs9nWj+0LXCnIH35/y6MTLIk/wvEswx26HicDbIhq+qwDROTii5Du3ylLp1x2MlYm7y
	udKw==
X-Gm-Message-State: AIkVDXK63j+8y1nGJTdE0W42E65zcTQknYMi3fTJIGpUDu3gis9V2jHcIxzB5KU800kY/w0FliglPFAM1COMYA==
X-Received: by 10.28.18.194 with SMTP id 185mr50351860wms.124.1483396420772;
	Mon, 02 Jan 2017 14:33:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 2 Jan 2017 14:33:40 -0800 (PST)
In-Reply-To: <20161227190617.6358-1-haris.okanovic@ni.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
	<20161227190617.6358-1-haris.okanovic@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Jan 2017 23:33:40 +0100
Message-ID: <CA+chaQc2H42_1M5Asu8XDJnRW=SWgWSjn=yGCaL4+vBbJ2DcvQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [meta-oe][PATCH v2] hwloc: Add
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
X-List-Received-Date: Mon, 02 Jan 2017 22:33:41 -0000
Content-Type: text/plain; charset=UTF-8

By ${PN}_RDEPENDS you probably meant RDEPENDS_${PN}.

On Tue, Dec 27, 2016 at 8:06 PM, Haris Okanovic <haris.okanovic@ni.com>
wrote:

> https://www.open-mpi.org/projects/hwloc/
>
> "The Portable Hardware Locality (hwloc) software package provides a
> portable abstraction (across OS, versions, architectures, ...) of the
> hierarchical topology of modern architectures, including NUMA memory
> nodes, sockets, shared caches, cores and simultaneous multithreading.
> It also gathers various system attributes such as cache and memory
> information as well as the locality of I/O devices such as network
> interfaces, InfiniBand HCAs or GPUs."
>
> This recipe adds libhwloc and lstopo utility as two packages.
>
> Testing: Built in OE/Krogoth. Installed to x86_64 machine. Successfully
> ran `lstopo` and verified it printed correct CPU and cache info.
>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 22
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>
> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> new file mode 100644
> index 0000000..812f70d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Portable Hardware Locality (hwloc) software package"
> +DESCRIPTION = "The Portable Hardware Locality (hwloc) software package \
> + provides a portable abstraction of the hierarchical topology of modern \
> + architectures."
> +HOMEPAGE = "https://www.open-mpi.org/software/hwloc/"
> +SECTION = "base"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
> +
> +SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/
> downloads/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
> +SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac9069878
> 2bb36e5504f4bac1bba2394ba14dbbad24"
> +
> +inherit autotools
> +
> +# Split hwloc library into separate subpackage
> +PACKAGES_prepend = " lib${PN} "
> +FILES_lib${PN} += "${libdir}/lib${PN}.so*"
> +${PN}_RDEPENDS += "lib${PN}"
> +
> +# XXX dev-so QA check doesn't like soname symlinks in non-dev packages
> +INSANE_SKIP_lib${PN} += "dev-so"
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

