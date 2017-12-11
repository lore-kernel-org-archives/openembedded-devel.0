Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 60F987864B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:28:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u19so12033228pfa.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IaoF9/mrxbrEF/MNop/HVv9iD5bzGz633VHoysRYjOw=;
	b=Vuh3hQ69c45TY/D4X4vdTzGbQ+oiECHV5H8NQqKlMsVDuBFwB2lp4kVdPeAFWCn0Jn
	mEWwWl4gG0BltiRLV1tr/i5CRtRwE2aZpiddn8jjC5WxITbnR1gZ/jUrluzDIYTyLIi7
	BvK1yLVwri7N4kjMu6HQL0Qri8ehYkwo2p4R7PHTMbY25qH8XtWyY5jyqjQvRvXJmjJD
	+g+ljO0H2rO5F5GIULwaSUooyUGrQL/AtCHABiEiccRBtLCCNND1UULGdeRXTOGgTBoA
	+qBQdRZWBinI7/5SVsijmPMTpBbnWjxXrSJk667NSGmrmzvzUvUitzaPEgc2ZsOlDXcG
	PSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IaoF9/mrxbrEF/MNop/HVv9iD5bzGz633VHoysRYjOw=;
	b=FR+UUHik+g9XzXqrg//dpxYDyf+IULK7/tyTQ6gFnj+zQPkC7ni2Ra/aCOuWAGY3xi
	DX9xKXiW/Woqp3RiqXiAQ22NkLt596zn772ZaeUk7jIqGJg1AuJsHbbbyQ/Y8DBVfEIa
	ayOCIJMdMYP+gfYr+QJS1Y5Ppn9uUgR8205zwSUn4LQ2On8E6G7kVkKwU/CIHtT8Nj2x
	J4uiAVt3o8f/vAIdLbBxjP6VjaR/Rx8seajGi9G/Vl9cq71EPbscUEDsHRp4pBftrS2u
	rD1WzNsAa/hOdXuu/NP4GIOVYN+3+dKi0QCGE+shKKAt6tvrO/9fKTy7jG5MyN8HLFGl
	Ucsw==
X-Gm-Message-State: AKGB3mLddW7hG/Woy5lVpe0pg9seMJsPgdN4JRCJdh0+fKl3yFAUOzia
	V5cUiNT6dZcZh9Dga7fOHeKXdN4ShXpR7gRoicQ=
X-Google-Smtp-Source: ACJfBovnVluUKToGZo/ILLbQX5sSzIRQk+76oo/+3QxXoTByu/5Oh3S/frKa7SyziOPdWMPpBlE6VXz8LGNOvdu5DjY=
X-Received: by 10.84.241.137 with SMTP id b9mr1012000pll.441.1513013316129;
	Mon, 11 Dec 2017 09:28:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Mon, 11 Dec 2017 09:28:05 -0800 (PST)
In-Reply-To: <20171210110531.89035-1-fathi.boudra@linaro.org>
References: <20171210110531.89035-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Dec 2017 09:28:05 -0800
Message-ID: <CAMKF1sqKii2bZG+VcB5iHVsUOmeZ5ms36qCJxxY3KQhG5M6x-A@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: naresh.kamboju@linaro.org, Koen Kooi <koen.kooi@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libhugetlbfs: use next branch instead of master
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
X-List-Received-Date: Mon, 11 Dec 2017 17:28:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 10, 2017 at 3:05 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Master hasn't been updated since 2 years (December 2015). Next branch
> received some fixes/updates and is only 23 commits ahead of master.
>
> Switch from master to next branch:

next branches are prone to rebase and can be problematic. Its probably better
to have each patch backported on top of master.

> * update PV to include SRCPV and "+next" string
> * update SRCREV
> * update SRC_URI to use next branch
> * drop Force-text-segment-alignment-to-0x08000000-for-i386-.patch which is
>   a backported patch from next branch
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ...segment-alignment-to-0x08000000-for-i386-.patch | 92 ----------------------
>  .../libhugetlbfs/libhugetlbfs_git.bb               |  7 +-
>  2 files changed, 3 insertions(+), 96 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
> deleted file mode 100644
> index ce6974d7c..000000000
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/Force-text-segment-alignment-to-0x08000000-for-i386-.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From 3c6f8d0e3c0694f79244ec6ad5ad9ba3ca26bc0a Mon Sep 17 00:00:00 2001
> -From: Yang Shi <yang.shi@linaro.org>
> -Date: Mon, 7 Dec 2015 14:12:13 -0800
> -Subject: [PATCH] Force text segment alignment to 0x08000000 for i386 with gold
> - linker
> -
> -Upstream-Status: Backport
> -
> -When build libhugetlbfs tests with gold linker for i386, the below error occurs:
> -
> -i586-oe-linux-gcc  -m32 -march=i586 -Wl,-O1 -Wl,--hash-style=gnu
> --Wl,--as-needed
> ---sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -I..
> --O2
> --Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
> -| i586-oe-linux-gcc  -m32 -march=i586 -Wl,-O1 -Wl,--hash-style=gnu
> --Wl,--as-needed
> ---sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86
> --B./obj32
> --Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,noexecstack -ldl
> --L../obj32
> --o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl -lhugetlbfs_privutils
> --Wl,--hugetlbfs-align obj32/linkhuge_rw.o obj32/testutils.o
> -| i586-oe-linux-ld: internal error in do_write, at
> -/home/jenkins/oe/world/shr-core/tmp-glibc/work/x86_64-oe-linux/binutils-cross-i586/2.25-r0/git/gold/output.cc:464
> -| collect2: error: ld returned 1 exit status
> -
> -But, it works well with GNU linker. --hugetlbfs-align flag passes
> -"-zcommon-page-size=$SLICE_SIZE -zmax-page-size=$SLICE_SIZE", that are supported by gold linker too.
> -But, it looks gold linker deal with them in a different way from gnu linker for i586.
> -
> -The readelf shows the below result with GNU linker:
> -
> -Elf file type is EXEC (Executable file)
> -Entry point 0x8048fbd
> -There are 8 program headers, starting at offset 52
> -
> -Program Headers:
> -  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> -  PHDR           0x000034 0x08000034 0x08000034 0x00100 0x00100 R E 0x4
> -  INTERP         0x048134 0x08048134 0x08048134 0x00013 0x00013 R   0x1
> -      [Requesting program interpreter: /lib/ld-linux.so.2]
> -  LOAD           0x000000 0x08000000 0x08000000 0x5a5bc 0x5a5bc R E 0x400000
> -  LOAD           0x05a5bc 0x0845a5bc 0x0845a5bc 0x1028c 0x202cc RW 0x400000
> -  DYNAMIC        0x05a5d0 0x0845a5d0 0x0845a5d0 0x000e8 0x000e8 RW  0x4
> -  NOTE           0x048148 0x08048148 0x08048148 0x00044 0x00044 R   0x4
> -  GNU_EH_FRAME   0x059e5c 0x08059e5c 0x08059e5c 0x0009c 0x0009c R   0x4
> -  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
> -
> -"--relax" linker option doesn't solve this problem.
> -Forced textsegment alignment to 0x08000000 with gold linker, the build will pass and
> -readelf shows the same result with GNU linker:
> -
> -Elf file type is EXEC (Executable file)
> -Entry point 0x8048fbd
> -There are 8 program headers, starting at offset 52
> -
> -Program Headers:
> -  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> -  PHDR           0x000034 0x08000034 0x08000034 0x00100 0x00100 R E 0x4
> -  INTERP         0x048134 0x08048134 0x08048134 0x00013 0x00013 R   0x1
> -      [Requesting program interpreter: /lib/ld-linux.so.2]
> -  LOAD           0x000000 0x08000000 0x08000000 0x5a5bc 0x5a5bc R E 0x400000
> -  LOAD           0x05a5bc 0x0845a5bc 0x0845a5bc 0x1028c 0x202cc RW 0x400000
> -  DYNAMIC        0x05a5d0 0x0845a5d0 0x0845a5d0 0x000e8 0x000e8 RW  0x4
> -  NOTE           0x048148 0x08048148 0x08048148 0x00044 0x00044 R   0x4
> -  GNU_EH_FRAME   0x059e5c 0x08059e5c 0x08059e5c 0x0009c 0x0009c R   0x4
> -  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
> -
> -The fix just have impact on hugelink_rw test case, which needs --hugetlbfs-align flag.
> -
> -Signed-off-by: Yang Shi <yang.shi@linaro.org>
> -Signed-off-by: Eric B Munson <emunson@mgebm.net>
> ----
> - ld.hugetlbfs | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/ld.hugetlbfs b/ld.hugetlbfs
> -index 4417442..32bc6fb 100755
> ---- a/ld.hugetlbfs
> -+++ b/ld.hugetlbfs
> -@@ -98,6 +98,7 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
> -       # otherwise it will be NULL.
> -       case "$EMU" in
> -       armelf*_linux_eabi)     HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE" ;;
> -+      elf_i386)               HTLBOPTS="$HTLBOPTS -Ttext-segment=0x08000000" ;;
> -       esac
> - fi
> -
> ---
> -2.0.2
> -
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index a63494a62..499e99f91 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -7,18 +7,17 @@ DEPENDS = "sysfsutils perl"
>  RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource ${PN}-perl"
>  RDEPENDS_${PN}-tests += "bash"
>
> -PV = "2.20"
> +PV = "2.20+git${SRCPV}+next"
>  PE = "1"
>
> -SRCREV = "e44180072b796c0e28e53c4d01ef6279caaa2a99"
> +SRCREV = "02df38e93e25e07f4d54edae94fb4ec90b7a2824"
>  SRC_URI = " \
> -    git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
> +    git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https;branch=next \
>      file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
>      file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
>      file://tests-Makefile-install-static-4G-edge-testcases.patch \
>      file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
>      file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
> -    file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

