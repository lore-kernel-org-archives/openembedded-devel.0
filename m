Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8BA7E6CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 20:04:12 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id c26so21922635edt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zk4K1613PeUBXkvCGuRfd3DZ2TBgNDq/prRKFCd9hPM=;
	b=I/84P+msNN5M7EHq/ealVC0e1n9VfVFVu1S7JtXrVDCmuXDDyu8G0fNEazbO8vA5pQ
	gcF6iVwSlpzt0IvtsTKlByypMpBaeN7JlvyfbHyhzZ9pLVtObHQuGIQCRPy0qPaQoNSX
	VydOD8ex6L8+NtjRJKtmPLnxiK2ujkx3IuDiJMy5e1aK8fX0q5Avtw0pebmjQH3ZAhqO
	cPk2I/tRDvUTn1ahdfI7wsyYWHqbszuQPIJMcBC1BoJVO9rQaJVHqsfaEp275DmPmS3V
	8WCKH7f89CX9q5zYbGe4ZMgE+bQ+UdvVbZZdoPWCoBvvk5BpFPYEYGH5wptZbxkAeWJi
	g9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zk4K1613PeUBXkvCGuRfd3DZ2TBgNDq/prRKFCd9hPM=;
	b=kMFm98PNRzJ4SIP+t0BquDo2j2sdtZbUy2iH3i8aTbcKD9LImAR4DtUsbwa2E/Bq+c
	xXTnT8eOTuizItH+xzcBCQflrKywGT707Tmp+53e/XyS8c3teyC985NLj411mkQKsgs9
	ZXhk9sTw23iLlsKwhyf1tlfaA/OqTF8ToDnpcam5QFLf1VIo6ToHPVx9+eEqEQiWzckX
	liLbFzkKWsrhaDZInaeQcQyM5fe6klDERUcFhQIrG5wtZAMnx84yPwdiMkSF4uSh2M1+
	nCpitUf5Xx2AbPMoHU20pelb2Wi/WL9gIxId2dLsyvu56fVl959hwXW1iUBMBf6cOAfW
	pcNA==
X-Gm-Message-State: APjAAAWqvKzaRr7T2iQXaQigziQNtAmzpdpM+nENuA2mbmYtxPHAllah
	xfLP1Oi2Ynmog3eLOTwy18fRdaiJ5nPJrr/ViTFQENrz
X-Google-Smtp-Source: APXvYqxBnpigB68sth+5eKurL6wCqM4rbeJ3/lE7j4do6fXg67F5NqIXaYwjvJ0V7F37cxNvUmNnn4xq+Kez6j0Xaj8=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr37857269eda.98.1560283453006; 
	Tue, 11 Jun 2019 13:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
	<20190611165504.23049-3-Martin.Jansa@gmail.com>
	<20190611193339.GA18027@localhost>
In-Reply-To: <20190611193339.GA18027@localhost>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jun 2019 22:04:03 +0200
Message-ID: <CA+chaQe8r6WkwAmMTXk6bd9SPGxymV_AhUOzMvNFai37FYiDQQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][warrior][PATCH 03/11] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Tue, 11 Jun 2019 20:04:12 -0000
Content-Type: text/plain; charset="UTF-8"

fair point, I'll try to remove the dependency and see what breaks, it was
added couple years ago in:
https://git.openembedded.org/openembedded-core/commit/?id=16bc366877a2e02d96adb91b90e30710777e6f09
are you sure that the explanation from back then is no longer valid?

Looking at the oprofile history, oprofile->virtual/kernel was
in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS back when oprofile was in oe-core:
http://git.openembedded.org/openembedded-core/commit/?id=5f470aed944c941b339652961a13266389288739

but this wasn't added to meta-oe/conf/layer.conf when it was imported from
oe-core in:
http://git.openembedded.org/meta-openembedded/commit/?id=22e6e7d5a8dd94de2986a9ce7c33e403b5ddb08d

On Tue, Jun 11, 2019 at 9:33 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Jun 11, 2019 at 04:54:56PM +0000, Martin Jansa wrote:
> > * fixes:
> > ERROR: oprofile different signature for task do_configure.sigdata
> between hammerhead and mako
> > Hash for dependent task
> oprofile/oprofile_1.3.0.bb.do_prepare_recipe_sysroot changed from
> deecd34bc94f47935ce3dc7f83f9a8407269959e446518bd9700a2ebae4324bb to
> d4d6301a72fcd061c167a6715372a6e35f57bf08152a6223b1571957834428f0
> > Unable to find matching sigdata for
> /OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb.do_prepare_recipe_sysroot
> with hashes
> deecd34bc94f47935ce3dc7f83f9a8407269959e446518bd9700a2ebae4324bb or
> d4d6301a72fcd061c167a6715372a6e35f57bf08152a6223b1571957834428f0
> >
> > $ bitbake-diffsigs
> /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/oprofile/*do_prepare*.sigdata*
> > runtaskdeps changed:
> > ['autoconf/autoconf_2.69.bb.do_populate_sysroot:virtual:native automake/
> automake_1.16.1.bb.do_populate_sysroot:virtual:native
> binutils/binutils_2.32.bb.do_populate_sysroot
> gcc/gcc-cross_7.3.bb.do_populate_sysroot
> gcc/gcc-runtime_7.3.bb.do_populate_sysroot
> glibc/glibc_2.29.bb.do_populate_sysroot gnu-config/gnu-config_git.bb.do_populate_sysroot:virtual:native
> libtool/libtool-cross_2.4.6.bb.do_populate_sysroot
> libtool/libtool-native_2.4.6.bb.do_populate_sysroot',
> -linux/linux-lg-hammerhead_git.bb.do_populate_sysroot, +linux/
> linux-lg-mako_git.bb.do_populate_sysroot, 'oprofile/oprofile_1.3.0.bb.do_fetch
> pkgconfig/pkgconfig_git.bb.do_populate_sysroot:virtual:native
> popt/popt_1.16.bb.do_populate_sysroot']
> > linux/linux-lg-hammerhead_git.bb.do_populate_sysroot with hash
> e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438
> >  changed to
> > linux/linux-lg-mako_git.bb.do_populate_sysroot with hash
> 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
> > Dependency on task linux/linux-lg-mako_git.bb.do_populate_sysroot was
> added with hash
> 4c7372d0063be9d5c96bfad20a2052ded3a7121a06027c21a75e79a4f6a678e3
> > Dependency on task linux/linux-lg-hammerhead_git.bb.do_populate_sysroot
> was removed with hash
> e58e94601af73831ea51ca6cc18578c26b9b491bcadb82a2c590b22498447438
> >
> > * as detected with:
> > openembedded-core/scripts/sstate-diff-machines.sh --targets=world
> --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> > index 1dc535ed8d..8d706e4a50 100644
> > --- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> > +++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
> > @@ -3,6 +3,9 @@ require oprofile.inc
> >  DEPENDS += "virtual/kernel"
> >  DEPENDS_append_powerpc64 = " libpfm4"
> >
> > +# Depends on MACHINE_ARCH kernel
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >...
>
> Sorry that I missed this when it went into master,
> but this looks bogus to me:
>
> oprofile only needs the userspace kernel headers and shouldn't depend
> on virtual/kernel.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

