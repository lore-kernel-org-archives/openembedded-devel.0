Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDA8776F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 21:34:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so38353817wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 13:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/dHn325jFR8vX2Q/RvZCWfZBmu1y6o0HPS2YYJdsPOo=;
	b=LmuIYLufcH+1q3AGdlyW12xZorcseeQQfzC4S51tSfJS+mNXIJkIXMenCbLN7aRGi+
	qdXIinp/i7jAaOowdGntRcE2FUzlXW5rPoC9z/GFz9qJmEbdz8SP9qydIZCEr1plMVBF
	N0Gf+dFmUuwPZlinhpqdZPi2m7hJ0jrRT608Ie7W0Qi5gv7Ne+8oIVtTnEXY1rKtdne8
	pENBMOvsrLsZc7rp78V32JHGu+ooF9sEWuLzAoN4Rfkzg235xlipQ6oTQSMEme8rIupE
	LHXpQSnQaCQ1ockKBsA/ox4cRa0Nmx9OtJYNRpNBJAsKnKY7sjuL5E/sRa7FB43a0ugV
	3iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/dHn325jFR8vX2Q/RvZCWfZBmu1y6o0HPS2YYJdsPOo=;
	b=oMn5xgNN1mPdJ5GWQ2t4xI1Nh75UcYpEeMT8RVJxuRaybsbVzmMbIejiWPoH2ldfhr
	hI7FgZZxTqIhuw7aBAk1G1nZJ2JPoonpYCGfAEZCgDtk3pJBSJhcWRVxYojxheN8fcDn
	kLVEw7gPv44KRbAIsPoqJTOXZmbu23HahdL5fNWGcp5if03CsI51dmWDX2QELs+09N3v
	RNT/NHn8jsq4mmpYnWqmfTHNWcLr7ftfKI5xQSCEBsLXio17PA2SxP40KS1OAcHXCyPS
	PGDmIokZ/3uY8ntH49nzlRkmTTga8KYHLLeRgPkmOiZbdN5w0VP5Mrf6xkTn4pIqgR+x
	YybA==
X-Gm-Message-State: AIkVDXJTo3iyv2JbN+YeLXDuuKZq6wEGRXDUsKX8x7kNorBVS/RL2s8duNQ0S3gVxHWlAWYf1uueUsGiY0AXTQ==
X-Received: by 10.28.0.210 with SMTP id 201mr12631756wma.49.1482442492379;
	Thu, 22 Dec 2016 13:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Thu, 22 Dec 2016 13:34:51 -0800 (PST)
In-Reply-To: <20161222200250.23273-1-haris.okanovic@ni.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Dec 2016 22:34:51 +0100
Message-ID: <CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [PATCH] hwloc: Add
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
X-List-Received-Date: Thu, 22 Dec 2016 21:34:51 -0000
Content-Type: text/plain; charset=UTF-8

SUMMARY is for short summary, put long one into DESCRIPTION and create
short one for SUMMARY.

Also missing sha265sum, so I doubt it was tested properly.

On Thu, Dec 22, 2016 at 9:02 PM, Haris Okanovic <haris.okanovic@ni.com>
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
>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 25
> +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>
> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> new file mode 100644
> index 0000000..3a88f5b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "The Portable Hardware Locality (hwloc) software package \
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
> +
> +inherit autotools
> +
> +# Split hwloc library into separate subpackage
> +PACKAGES_prepend = "lib${PN}"
> +FILES_lib${PN} += "${libdir}/lib${PN}.so*"
> +${PN}_RDEPENDS += "lib${PN}"
> +
> +do_install_append() {
> +    # Let ldconfig do it's thing, no need for these symlinks
> +    test -L "${D}${libdir}/lib${PN}.so.5"
> +    test -L "${D}${libdir}/lib${PN}.so"
> +    rm "${D}${libdir}/lib${PN}.so.5"
> +    rm "${D}${libdir}/lib${PN}.so"
> +}
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

