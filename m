Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id EAF3F606A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 22:54:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id c17so1041090ioc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r5sXIzoi+7+DOj87kEsjs+mcdL7T2vdZc3SuIVbMZrk=;
	b=epf7v/h6XFcI6zwIAPq9qGntLPQ0wg3JGA4PDMCUzc1d8plWYRt+Fb1tuS+2WUcIgc
	Ajl0FQQiM5HIdS21wPPfTJY5LLqTF9TKpHVJdnVl7z1Pz1aiGEuucY3/n8fj7/gtDRDO
	oNFKMkjZI5TBMRgqtIVshXKee8HeyCU2XzE54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r5sXIzoi+7+DOj87kEsjs+mcdL7T2vdZc3SuIVbMZrk=;
	b=VPHmifUwTNqsuNz9cZiKocI9Vobx/+GyAnGAhbQt9XYLLYNBZob29ErUnkwGtl+YpQ
	Xn1g6iG64/aYsKdUvQG1B6FcNXB4Ou1291Qj1lCjfaxgaubFyxIt8AkIH3EeYA39uTTd
	wkUjLWiExZlS/Nld+5UG5S1AtZq0aYaeD9UTACZc65zdJYEnRteZEKyjI2i+NYyqwsEz
	PztgjGgZaUx7rXZngsx0iHW4RjQDzFMjFJhH+WAuDC/3CbIUtj3MYKJO/gCSbE9QmMq4
	HZHKrosKRHXSG24rSd41kte+sxEY2y2j9TI21LsTviQhPWAMHQ9Ij1+7FXZ4zoGYewUJ
	1E6A==
X-Gm-Message-State: APjAAAWyMC5JrGcSWRnMFM1XBVRlW+02EbvLNMfvkv7yNx24KGnAHTjs
	lcd+/up+miW8hx4DKINgKXuwR70OniA1Gu9Un3vCQQ==
X-Google-Smtp-Source: APXvYqw4Nj57FcPsFqucUlsUyYUZiS3g91X98gZcv1oIYnDqW2mQGx9joDhr69/FyPCErnrjbxQcoAaIhcZSYdgsRTs=
X-Received: by 2002:a02:c773:: with SMTP id k19mr1857844jao.61.1582757658602; 
	Wed, 26 Feb 2020 14:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20200226202909.18208-1-jonathan.richardson@broadcom.com>
	<d9064877-aec4-47c8-f2d4-093d3b02174f@gmail.com>
In-Reply-To: <d9064877-aec4-47c8-f2d4-093d3b02174f@gmail.com>
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Date: Wed, 26 Feb 2020 14:54:07 -0800
Message-ID: <CAHrpVsX4JUU-zFzu_KSz6DufwAQXKv0eHNUmq=0aOKuRMv7RdQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/1] open-lldp: Add initial version 1.0.1
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
X-List-Received-Date: Wed, 26 Feb 2020 22:54:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 12:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks Jonathan, I have few more comments.
>
> On 2/26/20 12:29 PM, Jonathan Richardson via Openembedded-devel wrote:
> > Open-LLDP provides a Link Layer Discovery Protocol agent that supports
> > DCB (Data Center Bridging). The tc utility from iproute is needed to
> > manipulate  traffic control settings in the kernel.
> >
> > Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> > ---
> >   .../0001-Fix-musl-libc-build-issue.patch      | 25 ++++++++
> >   ...tion-to-disable-installation-of-syst.patch | 57 +++++++++++++++++++
> >   .../openlldp/openlldp_1.0.1.bb                | 39 +++++++++++++
> >   3 files changed, 121 insertions(+)
> >   create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
> >   create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
> >   create mode 100644 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> >
> > diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
> > new file mode 100644
> > index 000000000..d8d5df218
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
> > @@ -0,0 +1,25 @@
> > +From b20d64f814c15efbd6a19aacfbfecf15083a83dc Mon Sep 17 00:00:00 2001
> > +From: Jonathan Richardson <jonathan.richardson@broadcom.com>
> > +Date: Wed, 26 Feb 2020 12:16:38 -0800
> > +Subject: [PATCH] Fix musl libc build issue
> > +
> > +clif.h should include sys/types.h for the definition of pid_t. It fails
> > +to compile when using musl libc.
> > +
> > +Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> > +---
> > + include/clif.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/include/clif.h b/include/clif.h
> > +index 648eedf..92f4fd8 100644
> > +--- a/include/clif.h
> > ++++ b/include/clif.h
> > +@@ -32,6 +32,7 @@
> > + #ifndef CLIF_H
> > + #define CLIF_H
> > +
> > ++#include <sys/types.h>
> > + #include <sys/un.h>
> > + #include "clif_sock.h"
> > +
> > diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
> > new file mode 100644
> > index 000000000..86c9f4463
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
> > @@ -0,0 +1,57 @@
> > +From 1c1e01b2414ca5b3cf5a21b6e6389f9ca82fd7e9 Mon Sep 17 00:00:00 2001
> > +From: Jonathan Richardson <jonathan.richardson@broadcom.com>
> > +Date: Fri, 6 Apr 2018 10:49:04 -0700
> > +Subject: [PATCH 1/1] autotools: Add option to disable installation of systemd
> > + conf files
> > +
> > +Add option to configure.ac to enable or disable install of systemd conf
> > +files. If --with-systemdsystemunitdir is passed to configure then the
> > +files will be installed to the provided directory. If the option isn't
> > +provided then the value is determined from the systemd pkgconfig file,
> > +if found in PKG_CONFIG_PATH.
> > +
> > +This change is required because Makefile.am always installed the files
> > +to a hard coded path that couldn't be changed.
> > +---
> > + Makefile.am  | 3 ++-
> > + configure.ac | 9 +++++++++
> > + 2 files changed, 11 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index 551d4c7..5491c61 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -133,8 +133,9 @@ install-data-hook:       installdirs-local
> > + pkgconfigdir = ${libdir}/pkgconfig
> > + pkgconfig_DATA = lldpad.pc liblldp_clif.pc
> > +
> > +-systemdsystemunitdir = $(prefix)/lib/systemd/system
> > ++if HAVE_SYSTEMD
> > + dist_systemdsystemunit_DATA = lldpad.service lldpad.socket
> > ++endif
> > +
> > + bashcompletiondir = $(sysconfdir)/bash_completion.d
> > + dist_bashcompletion_DATA = contrib/bash_completion/lldpad contrib/bash_completion/lldptool
> > +diff --git a/configure.ac b/configure.ac
> > +index 0667446..f75f433 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -95,6 +95,15 @@ AC_TYPE_UINT16_T
> > + AC_TYPE_UINT32_T
> > + AC_TYPE_UINT8_T
> > +
> > ++# Support for systemd unit files.
> > ++AC_ARG_WITH([systemdsystemunitdir],
> > ++        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
> > ++        [], [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
> > ++if test "x$with_systemdsystemunitdir" != xno; then
> > ++        AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
> > ++fi
> > ++AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
> > ++
> > + AC_CONFIG_FILES([Makefile include/version.h lldpad.spec lldpad.pc liblldp_clif.pc])
> > + AC_CONFIG_MACRO_DIR([m4])
> > + AC_OUTPUT
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> > new file mode 100644
> > index 000000000..ef8d780c6
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
> > @@ -0,0 +1,39 @@
> > +SUMMARY = "Open-LLDP"
> > +DESCRIPTION = "Link Layer Discovery Protocol for Linux that includes support for DCBX"
> > +HOMEPAGE = "http://open-lldp.org/start"
> > +
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit pkgconfig autotools
> > +inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', '', d)}
> > +
> > +DEPENDS = "libnl libconfig readline"
> > +
> > +SRCREV = "36d729de7ce5b56cf061d94d610cf0510154820c"
> > +SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master \
> > +           file://0001-autotools-Add-option-to-disable-installation-of-syst.patch \
> > +           file://0001-Fix-musl-libc-build-issue.patch \
> > +           "
> > +
> > +# Even though .ac allows disabling -Werror, Makefile.am adds it to AM_CFLAGS
> > +# causing it to always be enabled. There are warnings so disable it.
> > +TARGET_CFLAGS += "-Wno-error"
>
> is there configure option --disable-werror, we should use that if available.

No unfortunately it's not supported. I'll fix the comment. .ac doesn't
allow disabling
of Werror. Support would have to be added to .ac.

>
> > +
> > +# configure.ac generates version.h from include/version.h.in but autotools puts
> > +# build artefacts in $B, not $S and the header can't be found. To avoid
> > +# inheriting autotools-brokensep and messing up the source dir just tell Makefile
> > +# where it is.
> > +TARGET_CFLAGS += "-I ${B}/include"
>
> Can we avoid using B here.

The output file from AC_CONFIG_FILES goes to $B and this path isn't included
automatically by autoconf. inheriting autotools-brokensep would avoid
the problem.
I can add another patch but there doesn't seem to be a variable for
the output dir
of this macro that I could use in cflags.. or at least I can't find it.

>
> > +
> > +# Enable install of systemd conf files.
> > +EXTRA_OECONF += "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"
>
> we should be checking for systemd in DISTRO_FEATURES here.

Ok.

>
> > +
> > +SYSTEMD_SERVICE_${PN} = "lldpad.service lldpad.socket"
> > +
> > +# To enable service at boot set to enable in local.conf.
> > +SYSTEMD_AUTO_ENABLE ?= "disable"
> > +
> > +RRECOMMENDS_${PN} = "iproute2-tc"
> >

