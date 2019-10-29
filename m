Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A49EB7D265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:07:54 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z22so124505qtq.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ET89vuxDmzt+bUCmF+SW0EFa6eRqzBvK/X3xRhUW6tw=;
	b=bBSPUCF9xscFwaiEJsaTr3+uO0rJ0SkoFy9khq6+XzD896zzJyHb+RGF5EhAkC9PRb
	1Vpk/g1PtttvEfWZUhm8V+umQtFF8SvC5zLdIHPhenvayGRjmEP7xWzkQZoU3v8NoCa6
	SM90GoqaKwJhbA0+3jmtQHtjxM9UsKf8csQLxh7VkxulYj8DyDu5I9NPxCbdNit8MKj1
	ypf2i6DYujsNF03RcnPoQFud8NVwNK/UoJzoQWnqIq0Oc1bTmKwSO3Tac3eewaODaCfJ
	KwsA/Lq6kaiD8JlMRjon6ursiqI0Phg2ZO0UQ7Aas8tICqXPyhjvEFTmoz16DRQL/tEN
	Fy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ET89vuxDmzt+bUCmF+SW0EFa6eRqzBvK/X3xRhUW6tw=;
	b=qYDlTxHvHd1bGpwgpLIcdNbEdSb5Lts9QLuO6imEp5Q3vseodCRQA0Rji/LnE7PHe5
	IOBTmq0yFIuf+/iH76AE+m5gZxe3E5vzoChBlPWkal/ccmDfbprmq60Y8ed6zTAIZvv2
	BgaFDkRXiIXod/2MGPGWEtBztfDO3OfZJAu9Vm7s82K1APBadnkZd03ORocgkRNLuQKE
	bUFwrE++46xdkuLrELvjH0lf+O1dGYoHE2/a+3AhjRL0HDoz1wzjvmo/lvP3dhBBdwB5
	cvrJmQ7bwankr4SjaH09ouzjh+NO0xqOsVKbZpQga/xgaVOwKG0nqjepINljok/BAsbq
	EKXQ==
X-Gm-Message-State: APjAAAVB1om6Vtob0x1nTjAHX69e/GKA0qKtO6d3WzhF6rUWeIuFpccQ
	trz0VPZC+Yteku5qppz6R+kXuQsF5BST7P/B7sz1kmyuL+0=
X-Google-Smtp-Source: APXvYqxna3cIy+teYnKzK/1rP1SbtIsY2rEKxaZgcLuqBkV/nHixvG/TxMtKzNtkMdGN4m3SzNKE6n6S8+XwgadNWik=
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr25659284qvs.185.1572383274689; 
	Tue, 29 Oct 2019 14:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191029205829.17493-1-trevor.gamblin@windriver.com>
In-Reply-To: <20191029205829.17493-1-trevor.gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:07:27 +0100
Message-ID: <CAMKF1spfsKGWftwX1_T_ezH9cDLbAE5Qd-JzJatRRSMA9vqFbQ@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][v2] inotify-tools: remove recipe (migrate to oe-core)
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
X-List-Received-Date: Tue, 29 Oct 2019 21:07:54 -0000
Content-Type: text/plain; charset="UTF-8"

This does not hit the patchwork. Can you resend it where subject is
not prefixed with [oe][meta-oe] but just [meta-oe]


On Tue, Oct 29, 2019 at 9:58 PM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> Remove inotify-tools recipe. Remove reference to recipe in
> packagegroup-meta-oe.bb.
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
>  ...inotify-nosys-fix-system-call-number.patch | 31 -------------------
>  .../inotify-tools/inotify-tools_git.bb        | 23 --------------
>  3 files changed, 1 insertion(+), 55 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
>  delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 1f0a7b947..047a3276b 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -230,7 +230,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
>      dstat eject enca epeg espeak fbset fbset-modes \
>      fftw fltk-native gd gflags glog gnulib gperftools \
>      gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel \
> -    libinih inotify-tools joe lcms lcov libatasmart libbytesize \
> +    libinih joe lcms lcov libatasmart libbytesize \
>      libcereal libcyusbserial libee libeigen libestr libftdi libgit2 \
>      libgpiod libiio libjs-jquery libjs-sizzle liblinebreak libmicrohttpd \
>      libmxml libnih liboauth libol liboop libp11 libraw1394 libsmi libsoc libssh2 \
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
> deleted file mode 100644
> index 89b890dda..000000000
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotify-nosys-fix-system-call-number.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -inotify-tools: fix __NR_inotify_add_watch system call number on _MIPS_SIM_ABI64
> -
> -The correct value should be the same as defined in
> -linux/arch/mips/include/uapi/asm/unistd.h
> -
> -Upstream-Status: Summitted [https://github.com/rvoicilas/inotify-tools/pull/71]
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - libinotifytools/src/inotifytools/inotify-nosys.h |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libinotifytools/src/inotifytools/inotify-nosys.h b/libinotifytools/src/inotifytools/inotify-nosys.h
> -index db76b2c..5f7b11b 100644
> ---- a/libinotifytools/src/inotifytools/inotify-nosys.h
> -+++ b/libinotifytools/src/inotifytools/inotify-nosys.h
> -@@ -100,8 +100,8 @@ struct inotify_event {
> - # endif
> - # if _MIPS_SIM == _MIPS_SIM_ABI64
> - #  define __NR_inotify_init (__NR_Linux + 243)
> --#  define __NR_inotify_add_watch (__NR_Linux + 243)
> --#  define __NR_inotify_rm_watch (__NR_Linux + 243)
> -+#  define __NR_inotify_add_watch (__NR_Linux + 244)
> -+#  define __NR_inotify_rm_watch (__NR_Linux + 245)
> - # endif
> - # if _MIPS_SIM == _MIPS_SIM_NABI32
> - #  define __NR_inotify_init (__NR_Linux + 247)
> ---
> -1.7.10.4
> -
> diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> deleted file mode 100644
> index 05ca4b4ad..000000000
> --- a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY = "Command line tools and C library providing a simple interface to inotify"
> -AUTHOR = "Rohan McGovern <rohan@mcgovern.id.au>"
> -HOMEPAGE = "http://wiki.github.com/rvoicilas/inotify-tools"
> -SECTION = "console/devel"
> -LICENSE = "GPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
> -
> -SRCREV = "e203934e46784bb34c213078423ba1678e0c4936"
> -PV = "3.20.1"
> -
> -SRC_URI = "git://github.com/rvoicilas/${BPN} \
> -           file://inotify-nosys-fix-system-call-number.patch \
> -          "
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "--disable-doxygen"
> -
> -PACKAGES =+ "libinotifytools"
> -
> -FILES_libinotifytools = "${libdir}/lib*.so.*"
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

