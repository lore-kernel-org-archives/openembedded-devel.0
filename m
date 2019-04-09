Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 436FE7D5B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 18:26:03 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id k2so21057463qtm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 11:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B59FNJEXiD2cVicQVR1A5yk8WRlEydFGoF1EYj80eiI=;
	b=EZQx/yKF6WhMyz/u0b7exq1+HqpR/1E1BYbVWyg/U+pBpVi4ykiTtfet52Fx6Xfiwm
	1+bZ63wKFSOrsHDVLnIBAXXt82h/BV/+2Ajcoo7rTwMCh4Z7s0lfPxoB+ulyXY9Xgn8d
	kjmaf6AkGtOViIT48iBDz1dualVLvZldSiy81HUdnCL8bHgeDAvyCi3Rur8QdHJeBe8j
	6IbsVOnzsZE9vsTv7BXwbYFp1YC5DLxl7RymoiLhVaQOJJZsCOQs2oqKit8dPGnny+1N
	HqYu70+FUIJSYaE3KzXWC4VygiUHAydujeIwNqb0iBitQ4GsF9NOgCvpP2SQaIY4u6l4
	xH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B59FNJEXiD2cVicQVR1A5yk8WRlEydFGoF1EYj80eiI=;
	b=fz+CjQCZr8WnpCcX9IvLmiDFGWZHkd138++PLhwZaAq4VQfc5pUSvrHZnRQLjaK/9e
	Bs0GNjsuY8r89YxywkY2U0azycoDlYMX874RaJJ8OAJexmzjJf0ACUoDtcjbNvY5v2VH
	2cWa6xsa8OqM35Kw0kDUWaz7o5Bl+hGfxPXeVd9jAV8a+dWBGugQgLzaFIeIZlNo8mbU
	NPx2XyFAHHooeh3sekfPnXFJzaHU9s9pwiahYn3xHbFEtqCXPTC/LU2kZjg/4FSH/pLC
	mI8Ms1RqrJbMAVWwfFNFL8UVXozJ9PUD2m/YbzfgNDAIFgj1tK0rAfbywJXy3NJzPB39
	8MMw==
X-Gm-Message-State: APjAAAWOVSQq5wXRmJoqvRgld40hzUcU2mSu7UbqEE5N3loevGPEcQsf
	0ZzBXjMZqMBkHTAF6TZoc7UjmGGylNGol2w4WfM=
X-Google-Smtp-Source: APXvYqxhzDFyvGOUlZe7BBALj9o+3SpHMu9al+MUhPhUAr61wTmNmIqldl9mLTQsMen7yHR5LK+iJwsOex+pizB4RcU=
X-Received: by 2002:ac8:1833:: with SMTP id q48mr31567756qtj.133.1554834363766;
	Tue, 09 Apr 2019 11:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190408205138.29472-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1sq3JHuxAH6cjG1AU6fYN7hj6jkiM836b3BGHr5=01UStA@mail.gmail.com>
	<25f17c05-3d19-5568-7812-33e6f5e1e289@oleksandr-kravchuk.com>
In-Reply-To: <25f17c05-3d19-5568-7812-33e6f5e1e289@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 11:25:37 -0700
Message-ID: <CAMKF1spwa784FC3vGGCP6qtAMp=b=QUQO0qpJtFgNBpAS+=xmw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] ell: remove recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 18:26:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 9, 2019 at 11:21 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> ell has to be added to poky first.
>

send the meta-oe patch after it has landed in oe-core ( not poky )

> On 09/04/2019 20:17, Khem Raj wrote:
> > ERROR: Nothing PROVIDES 'ell' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
> > DEPENDS on or otherwise requires it)
> > ERROR: Nothing RPROVIDES 'ell' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'ell' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable,
> > removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-multimedia', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-dbs', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-devtools', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-bsp', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-extended', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-core', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-security', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-gnome', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-kernel', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-graphics', 'ell']
> > NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable,
> > removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-benchmarks', 'ell']
> > ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-crypto' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'packagegroup-meta-oe-crypto'
> > NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-crypto']
> > ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-support' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'packagegroup-meta-oe-support'
> > NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-support']
> > ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-test' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'packagegroup-meta-oe-test'
> > NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-test']
> > ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
> > NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is
> > unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-connectivity']
> > ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
> > NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable,
> > removing...
> > Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-navigation']
> > ERROR: Nothing RPROVIDES 'packagegroup-meta-oe-ptest-packages' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest-packages'
> > NOTE: Runtime target 'packagegroup-meta-oe-ptest-packages' is
> > unbuildable, removing...
> > Missing or unbuildable dependency chain was:
> > ['packagegroup-meta-oe-ptest-packages']
> > ERROR: Nothing RPROVIDES 'iwd-dev' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'iwd-dev'
> > NOTE: Runtime target 'iwd-dev' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['iwd-dev']
> > ERROR: Nothing RPROVIDES 'iwd' (but
> > /mnt/a/yoe/sources/meta-openembedded/meta-oe/recipes-connectivity/iwd/iwd_0.14.bb
> > RDEPENDS on or otherwise requires it)
> > No eligible RPROVIDERs exist for 'iwd'
> > NOTE: Runtime target 'iwd' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['iwd']
> >
> > On Mon, Apr 8, 2019 at 1:51 PM Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> This recipe will be moved to poky instead as newer versions of some of
> >> its components depend on it.
> >>
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  meta-oe/recipes-core/ell/ell_0.17.bb | 17 -----------------
> >>  1 file changed, 17 deletions(-)
> >>  delete mode 100644 meta-oe/recipes-core/ell/ell_0.17.bb
> >>
> >> diff --git a/meta-oe/recipes-core/ell/ell_0.17.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
> >> deleted file mode 100644
> >> index 27f11cfbe..000000000
> >> --- a/meta-oe/recipes-core/ell/ell_0.17.bb
> >> +++ /dev/null
> >> @@ -1,17 +0,0 @@
> >> -SUMMARY  = "Embedded Linux Library"
> >> -DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
> >> -LICENSE  = "LGPLv2.1"
> >> -LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> >> -SECTION = "libs"
> >> -
> >> -inherit autotools pkgconfig
> >> -
> >> -S = "${WORKDIR}/git"
> >> -SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
> >> -SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
> >> -
> >> -do_configure_prepend () {
> >> -    mkdir -p ${S}/build-aux
> >> -}
> >> -
> >> -DEPENDS = "dbus"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

