Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7640C65C91
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 01:38:46 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ex7so3223475wid.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 17:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=bs/+JZ1PyB8U720huIaaOUWPtYyHyfpvy3TItlYQS2g=;
	b=Pr/fxpQ3n+HZU8mcjywnAFaiPkzGsWg0MIg9QPTa0bCv052itbkHrJ01eikvnae2Zt
	NORsxTmd+vG4pqaqd1Kf6j2yVoBuGEpOn3BFRF1lcIcoD90uM1arc8OMV6yWiwBp+BNm
	1XgcPsaUydKjIftcgk7SPSisf1D9cjf71bqgqZzn2QIGnuw0XRWKtphIz/mbumBDxGLs
	5S5mHrNKjw2RiMSl+OrEqvdanHHxoGLsssBKPCd+yUmP/jSPP3EQmWTLbhFScTHfF6Vh
	O8iLL2DSdqzQxgaU3005C7sepRYKxrXPVunPZfP5k2BFZSQGSp7KGipL+S+m9V0IpFih
	jpBQ==
X-Gm-Message-State: ALoCoQlp8qfbE8HBO1kkZGTOGVB/YZHSgQEQTZrF9KHztpk/xLtO6/LfOoBKN/yBYDQ6so5MroKK
MIME-Version: 1.0
X-Received: by 10.194.48.116 with SMTP id k20mr11405706wjn.7.1415324326434;
	Thu, 06 Nov 2014 17:38:46 -0800 (PST)
Received: by 10.216.180.73 with HTTP; Thu, 6 Nov 2014 17:38:46 -0800 (PST)
In-Reply-To: <1415301783-5342-4-git-send-email-gary.robertson@linaro.org>
References: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
	<1415301783-5342-4-git-send-email-gary.robertson@linaro.org>
Date: Thu, 6 Nov 2014 19:38:46 -0600
Message-ID: <CAF7YWnx7sv_qozPznSqeUF5xkiDKq2UKYt2AqoNQ+ODqfAkB0w@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 3/3] libhugetlbfs: fix page size and text offset for arm arches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Nov 2014 01:38:50 -0000
Content-Type: text/plain; charset=UTF-8

As per the other patches sent in this series, please ignore for now...
looks like it may be better to update the version of libhugetlbfs used in
the recipe after these patches are accepted there.

On Thu, Nov 6, 2014 at 1:23 PM, Gary S. Robertson <gary.robertson@linaro.org
> wrote:

> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> Fixed computation of page size and text segment offset for various arm
> architectures - including both LE and BE variants of armv7 as well as
> aarch64
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  ...rch64-fix-page-size-not-properly-computed.patch |   32 -----------
>  ...s-arm-arches-fix-page-size-and-text-offse.patch |   57
> ++++++++++++++++++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
>  3 files changed, 58 insertions(+), 32 deletions(-)
>  delete mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
>  create mode 100644
> meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
>
> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
> deleted file mode 100644
> index da60ba0..0000000
> ---
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-page-size-not-properly-computed.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Subject: [PATCH] aarch64: fix page size not properly computed
> -
> -There's 2 issues fixed:
> -* typo on MB variable (MB -> $MB)
> -* some linker variants are missing (linux and big endian)
> -  - aarch64elfb
> -  - aarch64linux
> -  - aarch64linuxb
> -
> -Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> -
> -Upstream-Status: Submitted
> ----
> - ld.hugetlbfs | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ld.hugetlbfs b/ld.hugetlbfs
> -index df446dd..6553547 100755
> ---- a/ld.hugetlbfs
> -+++ b/ld.hugetlbfs
> -@@ -87,7 +87,7 @@ elf32ppclinux|elf64ppc)      HPAGE_SIZE=$((16*$MB))
> SLICE_SIZE=$((256*$MB)) ;;
> - elf64lppc)            HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
> - elf_i386|elf_x86_64)  HPAGE_SIZE=$((4*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
> - elf_s390|elf64_s390)  HPAGE_SIZE=$((1*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
> --armelf_linux_eabi|aarch64elf) HPAGE_SIZE=$((2*MB))
> SLICE_SIZE=$HPAGE_SIZE ;;
> -+armelf_linux_eabi|aarch64elf*|aarch64linux*)  HPAGE_SIZE=$((2*$MB))
> SLICE_SIZE=$HPAGE_SIZE ;;
> - esac
> -
> - if [ "$HTLB_ALIGN" == "slice" ]; then
> ---
> -1.9.2
> -
> diff --git
> a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
> new file mode 100644
> index 0000000..68cd71b
> --- /dev/null
> +++
> b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
> @@ -0,0 +1,57 @@
> +From 1ab6f7f9b34fc745451140fc21db6763dffc5785 Mon Sep 17 00:00:00 2001
> +From: "Gary S. Robertson" <gary.robertson@linaro.org>
> +Date: Thu, 25 Sep 2014 14:57:06 -0500
> +Subject: [libhugetlbfs][PATCH] ld.hugetlbfs: arm arches - fix page size
> and text offset
> + setup
> +
> +There's 3 issues fixed:
> +* typo on MB variable (MB -> $MB)
> +* some linker variants are missing (linux and big endian)
> +  - armelfb_linux_eabi
> +  - aarch64elfb
> +  - aarch64linux
> +  - aarch64linuxb
> +* text segment offset was not specified for armv7 BE
> +
> +NOTE: This patch replaces and makes obsolete the following previously
> +      submitted patch:
> +
> +      aarch64: fix page size not properly computed
> +      by: Fathi Boudra <fathi.boudra@linaro.org>
> +
> +Upstream Status: Submitted
> +
> +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> +---
> + ld.hugetlbfs |    8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/ld.hugetlbfs b/ld.hugetlbfs
> +index df446dd..4417442 100755
> +--- a/ld.hugetlbfs
> ++++ b/ld.hugetlbfs
> +@@ -87,7 +87,7 @@ elf32ppclinux|elf64ppc)      HPAGE_SIZE=$((16*$MB))
> SLICE_SIZE=$((256*$MB)) ;;
> + elf64lppc)            HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
> + elf_i386|elf_x86_64)  HPAGE_SIZE=$((4*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
> + elf_s390|elf64_s390)  HPAGE_SIZE=$((1*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
> +-armelf_linux_eabi|aarch64elf) HPAGE_SIZE=$((2*MB))
> SLICE_SIZE=$HPAGE_SIZE ;;
> ++armelf*_linux_eabi|aarch64elf*|aarch64linux*) HPAGE_SIZE=$((2*$MB))
> SLICE_SIZE=$HPAGE_SIZE ;;
> + esac
> +
> + if [ "$HTLB_ALIGN" == "slice" ]; then
> +@@ -96,9 +96,9 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
> +
> +       # targeting the ARM platform one needs to explicitly set the text
> segment offset
> +       # otherwise it will be NULL.
> +-      if [ "$EMU" == "armelf_linux_eabi" ]; then
> +-              HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE"
> +-      fi
> ++      case "$EMU" in
> ++      armelf*_linux_eabi)     HTLBOPTS="$HTLBOPTS
> -Ttext-segment=$SLICE_SIZE" ;;
> ++      esac
> + fi
> +
> + ${LD} "${args[@]}" ${HTLBOPTS}
> +--
> +1.7.9.5
> +
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 0af77f1..e490848 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -20,6 +20,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
>
>  file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
>      file://0001-Extend-arm32-support-to-include-BE-variants.patch \
>      file://0001-libhugetlbfs-Recognize-all-ix86-arches.patch \
> +
> file://0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 1.7.9.5
>
>

