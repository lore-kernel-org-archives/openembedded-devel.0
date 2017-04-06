Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E25160103
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:30:31 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id t20so8673409wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W8ru4qcTWOYuLXhDxiuQ24CeHI1x/BO6YFmUfA1KVzc=;
	b=AkTUB7kBIsO3TfZ0grJ7U9Mk1W0mm+9rqof+bjCGYd9E8HiD3Wu4JxZLdHUq6XsvWJ
	yT6bmzZcFsUq+Xy9A+viOud3iNiI0eVZzxyP0sL28o6krcV2wM57Ia2Fq/OofNVMBBGg
	alzBGT08ywg7riMs2sFARqBZnWhYOYYxNEcCfXNsFqRoEnvYfZN+XCUIdEUeGRwKo8Dv
	86xahA9FV782ms8dyZFyn1cfzlOlOkJSyWMtHujtET2+xdSNBV7lyUik23pbNpcKXZtt
	17b/R4VGwuOcAc9Rt1jAmxjMhZaY/lIGUoSa5gRy9M1IeeH/nKpqB7WZ5945of/9lzsY
	9Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W8ru4qcTWOYuLXhDxiuQ24CeHI1x/BO6YFmUfA1KVzc=;
	b=BWtAtZrLVAE958rSUNG+VPXMwyyL6ETFCKhd1i9ZxE2wHOrEnT9w5v/PGy5U7uGc0a
	PjnzITxWo2kMw+j3ZlikhEUhqINNJLVJ3xdcFy4MdRggGGhSSHVZghqaU98RqCP13HBL
	yDN1HtWKvBdjwJ7EoIBgUxj4SkdtkC+/hVEhCqpfbFH72zGKSC9gZQ2ApkYf9lxcoNKY
	qqbCpmLNaxa6ecqx96nN/8dNvv/F2peWuyePVW1xY80euvKACdxXrp8M88rsMRZSnsmJ
	ZMP5n3Yzd0G3XIWERDhda3ZaMSGM4GbBoFrPNXHz4zp+MdZRin3WnF1XJdqyvfzYmieQ
	mGGA==
X-Gm-Message-State: AN3rC/7vyAl5gM3Sp9LwG9Ze8dNS7pv1bF6XKaVLFHXreodxqM0NS0uu
	A6d3RFOnxl5bGGT2HKphPHuR8GkuDA==
X-Received: by 10.28.153.140 with SMTP id b134mr3664293wme.124.1491463832282; 
	Thu, 06 Apr 2017 00:30:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 00:30:31 -0700 (PDT)
In-Reply-To: <CAMKF1srGq39nu5h3YAQXNrORFTbYjUP3mxRxdsvG=8+4izZR5g@mail.gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-29-raj.khem@gmail.com>
	<20170403141806.GD3311@jama>
	<CAMKF1srGq39nu5h3YAQXNrORFTbYjUP3mxRxdsvG=8+4izZR5g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 09:30:31 +0200
Message-ID: <CA+chaQeRA8BuFOasjwzd2z-opF-O=TbpfOA7Er7AfF8_e=GY_w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 29/43] libqb: Upgrade to 1.0.1 release
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
X-List-Received-Date: Thu, 06 Apr 2017 07:30:31 -0000
Content-Type: text/plain; charset=UTF-8

It was there with older corosync as well, but are you willing to look at:

corosync-2.4.2: ELF binary
'/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
has relocations in .text [textrel]

?

On Wed, Apr 5, 2017 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Apr 3, 2017 at 7:18 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Fri, Mar 31, 2017 at 09:42:33AM -0700, Khem Raj wrote:
> >> Add a patch needed for cross compiling
> >
> > This breaks corosync:
> > http://errors.yoctoproject.org/Errors/Details/138932/
> >
>
> This needed updated too. I have pushed a recipe update for corosync
> https://github.com/kraj/meta-openembedded/commit/
> 6d4e506ecf2ae4effee4e70b3ff0e3d7c1a18542
>
>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  ...-Remove-runtime-check-for-CLOCK_MONOTONIC.patch | 43
> ++++++++++++++++++++++
> >>  .../libqb/{libqb_0.17.2.bb => libqb_1.0.1.bb}      | 14 +++----
> >>  2 files changed, 49 insertions(+), 8 deletions(-)
> >>  create mode 100644 meta-oe/recipes-extended/libqb/libqb/0001-Remove-
> runtime-check-for-CLOCK_MONOTONIC.patch
> >>  rename meta-oe/recipes-extended/libqb/{libqb_0.17.2.bb =>
> libqb_1.0.1.bb} (67%)
> >>
> >> diff --git a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-
> runtime-check-for-CLOCK_MONOTONIC.patch b/meta-oe/recipes-extended/
> libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
> >> new file mode 100644
> >> index 000000000..28bc5c07d
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-
> runtime-check-for-CLOCK_MONOTONIC.patch
> >> @@ -0,0 +1,43 @@
> >> +From e6fbad0c122ba8e87b67a9e2447505adcaafe204 Mon Sep 17 00:00:00 2001
> >> +From: Khem Raj <raj.khem@gmail.com>
> >> +Date: Wed, 29 Mar 2017 16:31:38 -0700
> >> +Subject: [PATCH] Remove runtime check for CLOCK_MONOTONIC
> >> +
> >> +Does not work during cross compile
> >> +
> >> +use a compile-time check to detect whether the
> >> +monotonic clock is available. This check can run just fine when we are
> >> +cross-compiling.
> >> +
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> + configure.ac | 12 ++++++++++--
> >> + 1 file changed, 10 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/configure.ac b/configure.ac
> >> +index fa13ae6..f4f0f46 100644
> >> +--- a/configure.ac
> >> ++++ b/configure.ac
> >> +@@ -175,9 +175,17 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> >> +                  )
> >> +
> >> + AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
> >> +-AC_RUN_IFELSE([AC_LANG_PROGRAM(
> >> ++AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> >> + [[#include <time.h>]],
> >> +-[[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return
> -1;]])],
> >> ++[[
> >> ++#include <unistd.h>
> >> ++int main() {
> >> ++#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0
> && defined(CLOCK_MONOTONIC))
> >> ++        #error No monotonic clock
> >> ++#endif
> >> ++    return 0;
> >> ++
> >> ++]])],
> >> +                     [
> >> +                       AC_MSG_RESULT([yes])
> >> +                       AC_DEFINE_UNQUOTED([HAVE_CLOCK_GETRES_MONOTONIC],
> 1, [Define to 1 if clock_getres(CLOCK_MONOTONIC, &ts) works])
> >> +--
> >> +2.12.1
> >> +
> >> diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> b/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
> >> similarity index 67%
> >> rename from meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> >> rename to meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
> >> index 94030b2ea..e26bb7c19 100644
> >> --- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
> >> +++ b/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
> >> @@ -4,22 +4,20 @@ It provides high performance logging, tracing, ipc,
> and poll."
> >>
> >>  HOMEPAGE = "https://github.com/clusterlabs/libqb/wiki"
> >>  SECTION = "libs"
> >> -
> >>  LICENSE = "LGPL-2.1"
> >>  LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b377
> 85"
> >>
> >> -inherit autotools-brokensep pkgconfig
> >> -
> >> -PV = "0.17.2+git${SRCPV}"
> >> +inherit autotools pkgconfig
> >>
> >> -SRCREV = "bd2c587f6ccacd8a5644b275d99324d200c2b378"
> >> -SRC_URI = "git://github.com/ClusterLabs/${BPN}.git"
> >> +PV .= "+git${SRCPV}"
> >>
> >> +SRCREV = "0a329683a76bc6aeb36f20f2bf6b43ba0440c4dc"
> >> +SRC_URI = "git://github.com/ClusterLabs/${BPN}.git \
> >> +           file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
> \
> >> +          "
> >>  S = "${WORKDIR}/git"
> >>
> >>  do_configure_prepend() {
> >>      ( cd ${S}
> >>      ${S}/autogen.sh )
> >>  }
> >> -
> >> -
> >> --
> >> 2.12.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

