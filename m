Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7DA65C8F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2017 06:07:59 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id r136so6376856vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 22:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=rPTvnkV0O8DFEZgOo4CIn5vbJujDaAEsRMjzv4OlTbY=;
	b=HNnWVcyNTWixIH5PvU1zI7Uvw7Nh5x1L/Iy6xoc5HoTUxrL+9Jd4R4lKoo3bv0D7Jk
	pLdmXj+fVJ/8VfPpqzsE0JMCOIItyCVX9UY6Er8VyECuwOr2dbNcVcEsAxL7r1BIUiL8
	uCMxvkRsenjwWts54wmO0/hw9gd8fqjqRGdr89TnhlTqFX4p5rVz5ngJmlkKWx0RdHB4
	xFEMniZPkpZm0o2tXgvRltqPHIKHclDk72MU+A++UQ1199bYfAj9Ka+JEuYhOpzt/Hjd
	Ve5vkSo0bvp0xVThtEqQ5NCkfp0FtIrgsQPlENEigebOd78A1J7j1OkS2IfR6fJf29IC
	OVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=rPTvnkV0O8DFEZgOo4CIn5vbJujDaAEsRMjzv4OlTbY=;
	b=sj30OCMBGl8a9K0ljRCe7FiWadEjua9ATzsm62vEnalwGmY32GBZyFJYbp89UlT8S0
	ZYUSNPMoQnxmoimH2VcZqa5ifSooQfJnKIE/iQBPqjBbY7CHCaUZABNvX6A1xAbO8V/I
	jYjYAPT4/4vzhoiksJJhe5oq9kcaGwJ2lc7eo/e0r+zcZedZQY9HyHjBVAhJecN8RC27
	9Qp0Wmlwpb0cJPTgUJxEJtBpUV+2gCNCCdbdwm/MOYQKdZ4qHBHBXebLawm6MUPNS+Z/
	KIEDvUln1L1nKJWeaF+BYxY2H9idyr+1SmlgZPpnDczGEvoV83r4yCKG3x7Bo0++0bz7
	T93w==
X-Gm-Message-State: AMke39m+hwG31x5QKLLwA+h/3L8ui4cGefh9zUecz4fF6wm1Js0BSIJ7J3Hznp3eY6m5Q9xTblWwtonqnVi5IA==
X-Received: by 10.31.168.145 with SMTP id r139mr7532726vke.148.1487484479164; 
	Sat, 18 Feb 2017 22:07:59 -0800 (PST)
MIME-Version: 1.0
References: <1487466684-16593-1-git-send-email-paul.gortmaker@windriver.com>
In-Reply-To: <1487466684-16593-1-git-send-email-paul.gortmaker@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Feb 2017 06:07:48 +0000
Message-ID: <CAMKF1sqyxtRoLsi1QvABn7kVsskgLcUXXb7N_0JFct5ukiqUwg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] netcat-openbsd: fix implicit dependency on pkg-config
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
X-List-Received-Date: Sun, 19 Feb 2017 06:08:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 18, 2017 at 5:12 PM Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> In the report at http://errors.yoctoproject.org/Errors/Details/130673/
> we see the following:
>
> i586-oe-linux-gcc  -m32 -march=i586 <snip> netcat.o atomicio.o socks.o
> `pkg-config --libs libbsd` -lresolv -o nc
> /bin/sh: 1: pkg-config: not found
>
> What follows is a bunch of link errors for BSD library functions, as
> the backtick didn't return anything but an empty string and hence no
> BSD library was involved in the link.
>
> I was able to reproduce this by temporarily removing my host version
> of pkg-config, and then validated that this fix solves it while still
> having the host binary removed.  So it should fix the reported issue.
> I also confirmed pkg-config was in the sysroot after the change.
>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> diff --git a/meta-networking/recipes-support/netcat/
> netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/
> netcat-openbsd_1.105.bb
> index bb21e0cfeede..06206a5a59d1 100644
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://ftp.debian.org"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM =
> "file://../debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
>
> -DEPENDS += "glib-2.0 libbsd"
> +DEPENDS += "glib-2.0 libbsd pkgconfig-native"


I think inherit pkgconfig should be the way to go here

>
>
>  SRC_URI =
> "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat
> \
>
> ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
> @@ -42,5 +42,3 @@ do_install() {
>      install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>  }
>  ALTERNATIVE_PRIORITY = "60"
> -
> -PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130673/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

