Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6EEE77ABF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 17:05:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u27so6568413pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p/fJovRMcJXTENYN2lR0p2rCil2otd7iallcqSpYLrU=;
	b=ETtB7n5UJWvw+R53cD6tYRBWrsRO+9H8LbWd9redWb+JmySNAY0PfB3d8Gjcw9tRQd
	xCTA42BzJA8yfYIgXssKKH4PXkKNB3bvjyvwhnNnLe4Np8YlHl4ZnLUFFIIzNWkNysS/
	rOOJPGV7hgFtmhZ7N7EYnzdn28sYYB9cFp4XO9iltWnseTYxxKjSLLDhkBqdcYX+6rWi
	N7DfC9mejPP2AJyOv1Gj7GIXBawhh8NaLgjGoNX6+x7uOFaYnMxjJd5FpJ8kpRkoGojD
	CNl0fKZBecHBOcdBfJhUJ4ULokvGfbOGspXICJNNTGSyPbczB6QKsRWOpojQ6kvZFStW
	fZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p/fJovRMcJXTENYN2lR0p2rCil2otd7iallcqSpYLrU=;
	b=KusT+HPRmKRmZI+6piSCyMTMSDufidPzuPqJuxDB3bJ8KXhfQav6GOjhMkIVJWgLHo
	o9yfo0RMz2/2IjyrPTc0uovy8pQj9gu2RqbiOqPO93IU8LP29vTSvn65NC0tAg0jtVTk
	tlosWDExexP3BVWIMrmbAo5E5aAZ0k0shw49Cz9yiDPrdmCcDhDad/l+tJaxyAiCMeh+
	6yE6UrUOXfGE9jk4XugWbbu5Zd1bOJmk6QuJvteHnCGhj24jnhEnI4KBokpIf5Z+1q6d
	35oLoSFl0tz5L6l36DUM9FkVp9lr8z+ipwNq8ADSJJnaALzSFBRVDKK92k/LKRm2P2pI
	/fXw==
X-Gm-Message-State: AHPjjUizn6NwSj04tUOCiQpmhLkJ9Yio8eeHval945OyR2PBwunKgHGO
	1xtPSLeqN8HVXiQ1pl0/tKXknMFJwaC/0+tViG4=
X-Google-Smtp-Source: AOwi7QBsUv87rg+32Ovp6hjMLioeMB2nsEPUgqlQ7+njfZbD4p895lEywkMMg4wTVqJAUfIsUkxXGdE7617wUTuTsIo=
X-Received: by 10.84.177.129 with SMTP id x1mr14914105plb.161.1506963934555;
	Mon, 02 Oct 2017 10:05:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Mon, 2 Oct 2017 10:05:03 -0700 (PDT)
In-Reply-To: <20170927081522.32576-1-adrian.ratiu@ni.com>
References: <20170927081522.32576-1-adrian.ratiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2017 10:05:03 -0700
Message-ID: <CAMKF1sp-182TDatwwPePc13qBWcUR-empq6joHzoRnbk1aZskg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Brad Mouring <brad.mouring@ni.com>
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
X-List-Received-Date: Mon, 02 Oct 2017 17:05:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 1:15 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> This recipe provides a very flexible and useful tool for building
> initfamfs'es from custom directories, having the ability to
> auto-detect kernel module dependencies (for kernels built outside OE),
> add custom build/runtime hooks, etc.
>
> It can also be used on deployed systems (installed images on targets)
> to re-generate the initramfs when a new kernel is installed from a
> package feed.
>

I see these errors
ERROR: mkinitcpio-v23+gitAUTOINC+12e4431972-r0 do_package_qa: QA
Issue: /usr/lib/initcpio/shutdown contained in package mkinitcpio
requires /usr/bin/ash, but no providers found in RDEPENDS_mkinitcpio?
[file-rdeps]
NOTE: recipe mkinitcpio-v23+gitAUTOINC+12e4431972-r0: task
do_populate_sysroot: Started
ERROR: mkinitcpio-v23+gitAUTOINC+12e4431972-r0 do_package_qa: QA run
found fatal errors. Please consider fixing them.

> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  ...0001-Makefile-don-t-check-asciidoc-output.patch | 35 ++++++++++++++++++++++
>  ...efile-don-t-preserve-ownership-on-install.patch | 28 +++++++++++++++++
>  .../recipes-devtools/mkinitcpio/mkinitcpio_git.bb  | 30 +++++++++++++++++++
>  3 files changed, 93 insertions(+)
>  create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
>  create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch
>  create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
>
> diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch b/meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
> new file mode 100644
> index 000000000..30ce60b6f
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
> @@ -0,0 +1,35 @@
> +From 6388c79f5d9458c58451c231eb6163184d6801bc Mon Sep 17 00:00:00 2001
> +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +Date: Tue, 26 Sep 2017 15:28:19 +0300
> +Subject: [PATCH 1/2] Makefile: don't check asciidoc output
> +
> +Don't use xmllint to validate the doc xsl schema because mkinitcpio's
> +use of docbook is broken in a cross-compile environment (docbookx.dtd
> +can't be found even though it's present in the recipe's sysroot).
> +
> +Investigating this is time consuming and this check is 99.9% benign
> +anyway so it's safe to disable it.
> +
> +Upstream-Status: Inappropriate [embedded-specific]
> +
> +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 264f077..dbbf0a8 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -72,7 +72,7 @@ install: all
> +
> + doc: $(MANPAGES)
> + man/%: man/%.txt Makefile
> +-      a2x -d manpage \
> ++      a2x -L -d manpage \
> +               -f manpage \
> +               -a manversion=$(VERSION) \
> +               -a manmanual="mkinitcpio manual" $<
> +--
> +2.14.1
> +
> diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch b/meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch
> new file mode 100644
> index 000000000..a22b0631c
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch
> @@ -0,0 +1,28 @@
> +From ed9ce55000e26801b69a38be7c53c8c529313492 Mon Sep 17 00:00:00 2001
> +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +Date: Tue, 26 Sep 2017 18:03:05 +0300
> +Subject: [PATCH 2/2] Makefile: don't preserve ownership on install
> +
> +Upstream-Status: Inappropriate [embedded-specific]
> +
> +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index dbbf0a8..db31313 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -53,7 +53,7 @@ install: all
> +       install -m644 -t $(DESTDIR)/usr/lib/initcpio init_functions functions
> +       install -m644 udev/01-memdisk.rules $(DESTDIR)/usr/lib/initcpio/udev/01-memdisk.rules
> +
> +-      cp -at $(DESTDIR)/usr/lib/initcpio hooks install
> ++      cp -rt $(DESTDIR)/usr/lib/initcpio hooks install
> +       install -m644 -t $(DESTDIR)/usr/share/mkinitcpio mkinitcpio.d/*
> +       install -m644 systemd/mkinitcpio-generate-shutdown-ramfs.service \
> +                       $(DESTDIR)/usr/lib/systemd/system/mkinitcpio-generate-shutdown-ramfs.service
> +--
> +2.14.1
> +
> diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb b/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
> new file mode 100644
> index 000000000..2ecbf0bf4
> --- /dev/null
> +++ b/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "mkinitcpio is the next generation of initramfs creation."
> +DESCRIPTION = "mkinitcpio is a modular tool for building an initramfs CPIO image, offering many advantages over alternative methods."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
> +
> +PV = "v23+git${SRCPV}"
> +
> +# v23 tag
> +SRCREV = "12e44319725517b869796bd71dbfd8db6521343a"
> +
> +SRC_URI = "\
> +       git://git.archlinux.org/mkinitcpio.git \
> +       file://0001-Makefile-don-t-check-asciidoc-output.patch \
> +       file://0002-Makefile-don-t-preserve-ownership-on-install.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "bash"
> +
> +DEPENDS += "asciidoc-native libxml2-native xmlto-native"
> +
> +inherit autotools-brokensep systemd
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE_${PN} = "mkinitcpio-generate-shutdown-ramfs.service"
> +SYSTEMD_AUTO_ENABLE = "enable"
> +
> +FILES_${PN} = "${bindir} ${sysconfdir} ${libdir} /usr/share"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

