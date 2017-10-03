Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3426D60116
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:16:30 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z1so6562506wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pwXCOP6JEXxFzd6jxFRIBfWRLXcg2JzWY0b6vIAqYoM=;
	b=WvbiIc8Zf4emFcvrDrr9CZvjn/J6O+4tdlp6I5BiUp9Fm2TZDFZrUSJorI+YoqNeMj
	jkvBNarfuG2teFP+ij/9ehJVg2/Zif18AzDsx7xd75gFaV6j+ZctUKgTa7kK4Wggkzbq
	EoOkoVi73ae2ZSC3FSfhZPwffH1OMI7Lu9DxIGDzajaAEqEfgDEdqy58ysr5W52Ftn1i
	Bs9pGlroN/k3UdmM/ZZ1x5GxbikjvZ11MxCTDPn+bxIgcI8gelyZFivVGqhMlsE0JXr7
	H16y5DzES8XvZLyhTVjZleHcs+ErKGXsUD6u/I7TsNnrgnN6+Q5uNX5W4mdp1Vc9YTN+
	UveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pwXCOP6JEXxFzd6jxFRIBfWRLXcg2JzWY0b6vIAqYoM=;
	b=R6+5FOd08RbY8oC7SPQhxZ4tdys7QLuxDdre9HxYvIBhGasbQWvcmD0ueqApxOjjIX
	cKsTRxK7gVjvPaLOoaURrhAqW8CqA50WLu6Q4DAzPHnNXPg0zvfykcQ32NEQbWddLSJw
	i5HCoGWNMTRqj5+kzepjbP29kEVuJhhdHJgLouygOG6At2bzowkrUW4inyyM6YJyN24P
	VSKfy2t9Frxoo2LR1jDE+vcNiwv807u9x5bAyOLgq7gjsRM/eSyu9Trp3OsvsfjOzdN7
	DxgtO0YO54ITgiRRJGc9jRMru6kQdgNG34iVP7FtMNA6xGkTwGJ4YWDGqihJpSpROZIp
	ipig==
X-Gm-Message-State: AMCzsaX6DNzL7BHe5v9AN3g70mPXfV5acnX1WbHIeazG0Darj9wRCr/N
	44n/VJ4j7QEM5n+dCv+iAhrrVp93Pzc64iu/pfo=
X-Google-Smtp-Source: AOwi7QDI+RcIXIxSHfhVQ7B07zN6YdbpKJmarBBbNdnuvJ+5n4x3JOg7T4J2thIcva+Zaaj8FEXrhRzGSY6NmoRGlnI=
X-Received: by 10.223.134.68 with SMTP id 4mr4360663wrw.67.1507058191866; Tue,
	03 Oct 2017 12:16:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 12:16:31 -0700 (PDT)
In-Reply-To: <CAMKF1sp-182TDatwwPePc13qBWcUR-empq6joHzoRnbk1aZskg@mail.gmail.com>
References: <20170927081522.32576-1-adrian.ratiu@ni.com>
	<CAMKF1sp-182TDatwwPePc13qBWcUR-empq6joHzoRnbk1aZskg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 21:16:31 +0200
Message-ID: <CA+chaQfHfO=167wGWXj2CjZFpjFyZh-3Vh+cQLwjH25-DAHveA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Haris Okanovic <haris.okanovic@ni.com>, Brad Mouring <brad.mouring@ni.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-initramfs][PATCH] mkinitcpio: add new recipe
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
X-List-Received-Date: Tue, 03 Oct 2017 19:16:31 -0000
Content-Type: text/plain; charset="UTF-8"

It also fails with:

ERROR: mkinitcpio-v23+gitAUTOINC+12e4431972-r0 do_package:
SYSTEMD_SERVICE_mkinitcpio value
mkinitcpio-generate-shutdown-ramfs.service does not exist

as reported in latest "state of bitbake world" e-mail.


I've dropped this from master-next until both issues are fixed.


On Mon, Oct 2, 2017 at 7:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Sep 27, 2017 at 1:15 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
> > This recipe provides a very flexible and useful tool for building
> > initfamfs'es from custom directories, having the ability to
> > auto-detect kernel module dependencies (for kernels built outside OE),
> > add custom build/runtime hooks, etc.
> >
> > It can also be used on deployed systems (installed images on targets)
> > to re-generate the initramfs when a new kernel is installed from a
> > package feed.
> >
>
> I see these errors
> ERROR: mkinitcpio-v23+gitAUTOINC+12e4431972-r0 do_package_qa: QA
> Issue: /usr/lib/initcpio/shutdown contained in package mkinitcpio
> requires /usr/bin/ash, but no providers found in RDEPENDS_mkinitcpio?
> [file-rdeps]
> NOTE: recipe mkinitcpio-v23+gitAUTOINC+12e4431972-r0: task
> do_populate_sysroot: Started
> ERROR: mkinitcpio-v23+gitAUTOINC+12e4431972-r0 do_package_qa: QA run
> found fatal errors. Please consider fixing them.
>
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  ...0001-Makefile-don-t-check-asciidoc-output.patch | 35
> ++++++++++++++++++++++
> >  ...efile-don-t-preserve-ownership-on-install.patch | 28
> +++++++++++++++++
> >  .../recipes-devtools/mkinitcpio/mkinitcpio_git.bb  | 30
> +++++++++++++++++++
> >  3 files changed, 93 insertions(+)
> >  create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0001-Makefile-don-t-check-asciidoc-output.patch
> >  create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0002-Makefile-don-t-preserve-ownership-on-install.patch
> >  create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/
> mkinitcpio_git.bb
> >
> > diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0001-Makefile-don-t-check-asciidoc-output.patch b/meta-initramfs/recipes-
> devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
> > new file mode 100644
> > index 000000000..30ce60b6f
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0001-Makefile-don-t-check-asciidoc-output.patch
> > @@ -0,0 +1,35 @@
> > +From 6388c79f5d9458c58451c231eb6163184d6801bc Mon Sep 17 00:00:00 2001
> > +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +Date: Tue, 26 Sep 2017 15:28:19 +0300
> > +Subject: [PATCH 1/2] Makefile: don't check asciidoc output
> > +
> > +Don't use xmllint to validate the doc xsl schema because mkinitcpio's
> > +use of docbook is broken in a cross-compile environment (docbookx.dtd
> > +can't be found even though it's present in the recipe's sysroot).
> > +
> > +Investigating this is time consuming and this check is 99.9% benign
> > +anyway so it's safe to disable it.
> > +
> > +Upstream-Status: Inappropriate [embedded-specific]
> > +
> > +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +---
> > + Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 264f077..dbbf0a8 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -72,7 +72,7 @@ install: all
> > +
> > + doc: $(MANPAGES)
> > + man/%: man/%.txt Makefile
> > +-      a2x -d manpage \
> > ++      a2x -L -d manpage \
> > +               -f manpage \
> > +               -a manversion=$(VERSION) \
> > +               -a manmanual="mkinitcpio manual" $<
> > +--
> > +2.14.1
> > +
> > diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0002-Makefile-don-t-preserve-ownership-on-install.patch
> b/meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0002-Makefile-don-t-preserve-ownership-on-install.patch
> > new file mode 100644
> > index 000000000..a22b0631c
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-devtools/mkinitcpio/files/
> 0002-Makefile-don-t-preserve-ownership-on-install.patch
> > @@ -0,0 +1,28 @@
> > +From ed9ce55000e26801b69a38be7c53c8c529313492 Mon Sep 17 00:00:00 2001
> > +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +Date: Tue, 26 Sep 2017 18:03:05 +0300
> > +Subject: [PATCH 2/2] Makefile: don't preserve ownership on install
> > +
> > +Upstream-Status: Inappropriate [embedded-specific]
> > +
> > +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +---
> > + Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index dbbf0a8..db31313 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -53,7 +53,7 @@ install: all
> > +       install -m644 -t $(DESTDIR)/usr/lib/initcpio init_functions
> functions
> > +       install -m644 udev/01-memdisk.rules $(DESTDIR)/usr/lib/initcpio/
> udev/01-memdisk.rules
> > +
> > +-      cp -at $(DESTDIR)/usr/lib/initcpio hooks install
> > ++      cp -rt $(DESTDIR)/usr/lib/initcpio hooks install
> > +       install -m644 -t $(DESTDIR)/usr/share/mkinitcpio mkinitcpio.d/*
> > +       install -m644 systemd/mkinitcpio-generate-shutdown-ramfs.service
> \
> > +                       $(DESTDIR)/usr/lib/systemd/
> system/mkinitcpio-generate-shutdown-ramfs.service
> > +--
> > +2.14.1
> > +
> > diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio
> _git.bb b/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
> > new file mode 100644
> > index 000000000..2ecbf0bf4
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
> > @@ -0,0 +1,30 @@
> > +SUMMARY = "mkinitcpio is the next generation of initramfs creation."
> > +DESCRIPTION = "mkinitcpio is a modular tool for building an initramfs
> CPIO image, offering many advantages over alternative methods."
> > +
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c5
> 0a"
> > +
> > +PV = "v23+git${SRCPV}"
> > +
> > +# v23 tag
> > +SRCREV = "12e44319725517b869796bd71dbfd8db6521343a"
> > +
> > +SRC_URI = "\
> > +       git://git.archlinux.org/mkinitcpio.git \
> > +       file://0001-Makefile-don-t-check-asciidoc-output.patch \
> > +       file://0002-Makefile-don-t-preserve-ownership-on-install.patch \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +RDEPENDS_${PN} += "bash"
> > +
> > +DEPENDS += "asciidoc-native libxml2-native xmlto-native"
> > +
> > +inherit autotools-brokensep systemd
> > +
> > +SYSTEMD_PACKAGES = "${PN}"
> > +SYSTEMD_SERVICE_${PN} = "mkinitcpio-generate-shutdown-ramfs.service"
> > +SYSTEMD_AUTO_ENABLE = "enable"
> > +
> > +FILES_${PN} = "${bindir} ${sysconfdir} ${libdir} /usr/share"
> > --
> > 2.14.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

