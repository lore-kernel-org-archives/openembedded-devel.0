Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 84D8D71DAE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 16:41:48 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id 137so74569278vkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=4junqTOqMEH7qM1KnuMxf94wyQY9N6eNJ3Zk4dbdbec=;
	b=FmlEBZboB9KUMZOVC3Ea4KXh+A9FRaf/18+TswuKi8gTWNMMh4thnkXWhshKyu01tO
	l5ybSj4VYCAhOiqlCydYhi+Xpdcm8VRcG5IYip/9wBe9XuhR1PD9lv1FAB0vHqhW8G/D
	osMGCK+WBfF4zVSwQZt8C731vWrHlzrowG4aY/mxd1yOqzj7oJHXAYlCj30/g0RHorT8
	GZ3PlIHS0NZGVjaQyKDCJo9O5STHRpiPUgi/7dFt4SeoAgET9Zun87I0U/qhYyZ0PlK5
	yYJ29ntuKKEAqlaXJkmGoY2wN/kY/lGoV7vzfPDRXOwJu1c7O56tbbYCzerTiEznHZq+
	+0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=4junqTOqMEH7qM1KnuMxf94wyQY9N6eNJ3Zk4dbdbec=;
	b=ZDbDEmbk+Tyh9L6DXYZqElDG3g9mLOlc0LWXU/TjL4pY6FSTVGDorPhWwK7+MBP5Cc
	fMF1lpap44Qs4c51VtUz4I5eFJjnHDjVi6xbIV2NfeNs+wOhE5Ew3K1tRerURfn/R1MX
	XtCBQPLinhTqLKS1aZtAa3nDjmUGlOEde39IlwULCVZb1gVNFZLApnyHvYCeqeysA4kF
	xkHSAJ7A587K4hFvVXtF607XQ3kI2GcKlSIVLxjHGzbZAysgn0pBlIAF2C87uHJliK8P
	73EiZNcoBRKGJk+If41WoZ/8e1+4eXe6l5ZoCZ3NoPQs7ivf1GvUP6/5be62KQjyE1KK
	NHbQ==
X-Gm-Message-State: AKaTC033GqtdmwNHIv4KLLu2MTkN47kySE12+Oob+/67QVES1ohNDqdxi0tPHZDDfZ03jFvE02/PuMi9QK//rw==
X-Received: by 10.31.168.7 with SMTP id r7mr1630550vke.148.1481820109198; Thu,
	15 Dec 2016 08:41:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 15 Dec 2016 08:41:18 -0800 (PST)
In-Reply-To: <1481817851-17771-1-git-send-email-armccurdy@gmail.com>
References: <1481817851-17771-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Dec 2016 08:41:18 -0800
Message-ID: <CAMKF1sq9Rk1W-8x9JyA9ARvLCkQoQzHcjVdyYPj05e6buvjjsA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dibbler: add initial recipe, dibbler 1.0.1
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
X-List-Received-Date: Thu, 15 Dec 2016 16:41:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 15, 2016 at 8:04 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Dibbler is a portable DHCPv6 implementation.
>
>   http://klub.com.pl/dhcpv6/
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../recipes-connectivity/dibbler/dibbler_1.0.1.bb  | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
>
> diff --git a/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb b/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
> new file mode 100644
> index 0000000..41bb78f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A portable DHCPv6 implementation"
> +DESCRIPTION = "Dibbler is a portable DHCPv6 implementation. It supports stateful \
> +(i.e. IPv6 address granting and IPv6 prefix delegation) as well as stateless (i.e. \
> +option granting) autoconfiguration for IPv6."
> +HOMEPAGE = "http://klub.com.pl/dhcpv6"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3 \
> +                    file://bison++/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> +
> +DEPENDS = "flex-native bison-native"
> +
> +SRC_URI = "http://klub.com.pl/dhcpv6/dibbler/dibbler-${PV}.tar.gz"

its also on sourceforge. perhaps better to use that for SRC_URI
https://sourceforge.net/projects/dibbler/

> +
> +SRC_URI[md5sum] = "93357bea3ec35b0c1d11242055361409"
> +SRC_URI[sha256sum] = "27869877e060c039cbc24a5f6a9dd69006bf67de0ffdf29a645a80aef6e476a1"
> +
> +inherit autotools
> +
> +PACKAGECONFIG ?= "auth bind-reuse dns-update dst-addr-filter link-state"
> +
> +PACKAGECONFIG[auth] = "--enable-auth,--disable-auth"
> +PACKAGECONFIG[bind-reuse] = "--enable-bind-reuse,--disable-bind-reuse"
> +PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
> +PACKAGECONFIG[dns-update] = "--enable-dns-update,--disable-dns-update"
> +PACKAGECONFIG[dst-addr-filter] = "--enable-dst-addr-filter,--disable-dst-addr-filter"
> +PACKAGECONFIG[link-state] = "--enable-link-state,--disable-link-state"
> +PACKAGECONFIG[remote-autoconf] = "--enable-remote-autoconf,--disable-remote-autoconf"
> +PACKAGECONFIG[resolvconf] = "--enable-resolvconf,--disable-resolvconf"
> +
> +EXTRA_OECONF += " \
> +    --disable-efence \
> +    --with-gtest=no \
> +"
> +
> +PACKAGES =+ "${PN}-client ${PN}-relay ${PN}-requestor ${PN}-server"
> +
> +FILES_${PN}-client = "${sbindir}/${PN}-client"
> +FILES_${PN}-relay = "${sbindir}/${PN}-relay"
> +FILES_${PN}-requestor = "${sbindir}/${PN}-requestor"
> +FILES_${PN}-server = "${sbindir}/${PN}-server"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

