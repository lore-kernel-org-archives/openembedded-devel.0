Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE87C6093E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 10:14:46 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id t76so1025059ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MFu2diwmgw5zI1YXdQSRTBCK/N9JYQooIFc6R2UVB6Y=;
	b=Q+u4zo+IJKH2QW3sn75s2Xg8TIisqzAR+Y8hMs4LDJAuVVwjuKxu1eT5WDXhb5B+aj
	53YUOgtQtObLx5GfSuD9/V4E8aRurPm6TO6WLtuXyms9OCUYU5I9ahoMUJem5X95pOzI
	jtDDKblvgmof5DuGXddPf4YVY6eVgcdIHJ2laMu5I5o12wb/y+clvUv4dablGyNYb+UU
	RlCHhbVuZUXyZJcQtJgtIuk4TyvcP4UqboklK7EF5ER2EVM7GZb9pP8FMPQxJvuhyk44
	bfyl82X+4zbO5HR1tsBU7XGqbXN7gzGRbxUUiCGS1yA3FsARKBgUnebt71hvxpVelg9V
	GVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MFu2diwmgw5zI1YXdQSRTBCK/N9JYQooIFc6R2UVB6Y=;
	b=IoCb5hnq+LO4cPUrmG4Q9OEH0jyn/LJjUE7qB4yX2YdSPZ5vk5LZDKZTWJuAYKYdt3
	RwmEv+SWzQEhANhzaMmmx+Lj0XUM39wfW/QiRQT9/vulCDHHH+S4BGSRDkKYPj4oNOMs
	66r7a4NE3+wqVTr6tvPv4TS2eHIAhdnh+wBmja0wT+lkrZgpTH3C6n5KJZRD62d8Zrsp
	MYOQv2ghBnbg2PYS13wNF4sEHmTxkz6sgptyyYOKNzEDYEbEl7xtaBO6EcOPzI3aZvaa
	aNsfIn/FsMDYkZbZxqFPtxXUEeo2nCEqIYp5tcKM5d1e6KS14cdwY4GqRI0CUWsDaHXg
	A6dg==
X-Gm-Message-State: AKS2vOzrq8skj44lx5grYS4nrlFGw/oKnuOr2kqLWhNrZfE1L6wS32zK
	Zbk6vzw8CYMGsN1Kgnw8/ZgRmgFfJiLu
X-Received: by 10.13.255.131 with SMTP id p125mr5322232ywf.243.1498212887682; 
	Fri, 23 Jun 2017 03:14:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Fri, 23 Jun 2017 03:14:47 -0700 (PDT)
In-Reply-To: <20170622064655.16412-1-Qi.Chen@windriver.com>
References: <20170622064655.16412-1-Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Jun 2017 12:14:47 +0200
Message-ID: <CA+chaQfTi=1m7dc9roW3LyHwNMy1RULDa7SOfyqBv+mFm+uWmQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hwloc: add several PACKAGECONFIG items
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
X-List-Received-Date: Fri, 23 Jun 2017 10:14:47 -0000
Content-Type: text/plain; charset="UTF-8"

Should numactl be enabled by default?

numactl.bb currently marks it ARM incompatible:
# ARM does not currently support NUMA
COMPATIBLE_HOST = "^((?!arm).*)$"

and enabling the PACKAGECONFIG here by default would extend the same
restriction to hwloc as well.


On Thu, Jun 22, 2017 at 8:46 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Add PACKAGECONFIG items to allow for more flexiblity.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> index e067f2799..16cd507e6 100644
> --- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> @@ -13,10 +13,16 @@ SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac9069878
> 2bb36e5504f4bac1bba2394ba14d
>
>  inherit autotools
>
> -DEPENDS += "cairo ncurses udev libxml2 zlib libpciaccess"
> -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'virtual/libx11', '', d)}"
> +DEPENDS += "ncurses udev zlib"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> 'libselinux', '', d)}"
>
> +PACKAGECONFIG ?= "numactl pci libxml2 ${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11', '', d)}"
> +
> +PACKAGECONFIG[numactl] = "--enable-libnuma,--disable-
> libnuma,numactl,numactl"
> +PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-
> libxml2,libxml2,libxml2"
> +PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 cairo,cairo"
> +PACKAGECONFIG[pci] = "--enable-pci,--disable-pci,
> libpciaccess,libpciaccess"
> +
>  # Split hwloc library into separate subpackage
>  PACKAGES_prepend = " lib${PN} "
>  FILES_lib${PN} += "${libdir}/lib${PN}.so*"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

