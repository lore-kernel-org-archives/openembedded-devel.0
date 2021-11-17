Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2708C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 23:41:14 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.625.1637192473692740125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 15:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJV0P5yx;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id 193so4394635qkh.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 15:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPkQ+YUphcec1cg8J9j6vLNewDdRfC/VW1WSGLxH2Ns=;
        b=UJV0P5yxWOTSCwW5eguNm3gtddiz3LX3X/cbWmN9Tf15fAGMl55F6JfbndiPyFTdxE
         rej6dk21uW22nYhDZKkpKKWRpw6VDlGF821DJMoAQk9ZZfUcYIIAFeUVNh6X2Tf7TSOt
         DMWbEYkv6GOc9z97NYF5sRGFZZb4AFrdOBCoS/NzMwCEsE7QVgd9bai3B1mL2yB/5N3c
         vzJdjSmLKiZXF6kS1NQRAXr7Ofigj53rlkay6LjiRUxjv6aiDhsDwTf/Abil5TNtCV9A
         Kf6qyjsZyqyVFUfCFntMxoKGDe6Npy/pJh09XbeP30MCWnyN2Noh6hQ86Jh0X+HTnXPq
         kJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPkQ+YUphcec1cg8J9j6vLNewDdRfC/VW1WSGLxH2Ns=;
        b=mHSdMUXIMiIWc8x4+A8TLt6TaChQ6aAUzm33nP43inB4BkW1Kmwn9ytJ12P/mbg4Fk
         hRcpn34j/JS2kBze5uZ2yrc0RBXHKY8feD41UpdHevD+popcbnGpsdVDrhdoAVjNir9Y
         qAfQnvqtprVT0FMBMDusZORJY0URnATwZCBuPoZESkQuA7D3jdEpWu1f93nCfQqUxylU
         XkiSVkEyBBxKlB6I8nEOzJaTJ1x5QO/MXBC2RXFcdozBQ7H8qLMqnMbTWE5kd44y94Yz
         wX6iy9jXJ+9UhsFteDe9xh50SZGKeDA16Z2bhRGLoW1zRfCYfw9ZGkKQ+N6uMvMKmYMq
         7e2w==
X-Gm-Message-State: AOAM532RW/00iC0l9gZuPVuhs+ov93ITl0kaufftU7kiBoC08vRNourv
	5iNAN8qEjjLZpyepnf94njHLzHvnUnSzDsxNnrhyxnfV6iRn9Q==
X-Google-Smtp-Source: 
 ABdhPJzQmINMIvByoZJQxQaxmNcOzcpglPUOJq0n7VUV27lWhK+n8snw4QxXgk5P40isrVt70/BKRv/esPgJq0XBn7k=
X-Received: by 2002:a05:620a:4f6:: with SMTP id
 b22mr16393297qkh.98.1637192472613;
 Wed, 17 Nov 2021 15:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20211117095129.1584617-1-fathi.boudra@linaro.org>
In-Reply-To: <20211117095129.1584617-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2021 15:40:46 -0800
Message-ID: 
 <CAMKF1sp4WA-Nn5b2q1vS1wm8pqU3uhqCRR4oSY9-uuQbCRBU6g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] makedumpfile: upgrade from 1.6.9 to
 1.7.0
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 23:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94011

Thanks for patch Fathi

seeing patch fuzz errors can you check it out and resend after fixing them

NOTE: Running task 13434 of 40023
(/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb:do_patch)
NOTE: recipe makedumpfile-1.7.0-r0: task do_patch: Started
WARNING: makedumpfile-1.7.0-r0 do_patch: Fuzz detected:

Applying patch 0001-makedumpfile-replace-hardcode-CFLAGS.patch
patching file Makefile
Hunk #4 succeeded at 66 with fuzz 1.
Hunk #5 succeeded at 105 (offset 14 lines).
Hunk #6 succeeded at 123 (offset 14 lines).


The context lines in the patches can be updated with devtool:

    devtool modify makedumpfile
    devtool finish --force-patch-refresh makedumpfile <layer_path>

Don't forget to review changes done by devtool!

WARNING: makedumpfile-1.7.0-r0 do_patch: QA Issue: Patch log indicates
that patches do not apply cleanly. [patch-fuzz]


On Wed, Nov 17, 2021 at 1:51 AM Fathi Boudra <fathi.boudra@linaro.org> wrote:
>
> * Drop 0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
>   This patch has been introduced in January 2017 for makedumpfile 1.6.1.
>   It has never reached upstream, hence the pending status is
>   inappropriate. Since that time, the upstream code to retrieve
>   MAX_PHYSMEM_BITS has been updated to use vmcoreinfo, with a backward
>   compatibility for older kernels.
> * Remove the deprecated comment about arm/aarch64 would compile but has never
>   been tested upstream, introduced in July 2016. Nowadays, it works just fine
>   on those architectures.
> * Add PACKAGECONFIG option for zstd compression
>   Since 1.7.0 release, Zstandard (zstd) compression support has been added.
>   With zstd, the vmcore size and time consumption can have a better balance
>   than zlib/lzo/snappy.
>   http://lists.infradead.org/pipermail/kexec/2021-September/023011.html
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ...ort-only-46-bit-for-MAX_PHYSMEM_BITS.patch | 90 -------------------
>  ...umpfile_1.6.9.bb => makedumpfile_1.7.0.bb} |  7 +-
>  2 files changed, 3 insertions(+), 94 deletions(-)
>  delete mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
>  rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.9.bb => makedumpfile_1.7.0.bb} (88%)
>
> diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
> deleted file mode 100644
> index f46fb3117..000000000
> --- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 9045b72bdb703bf58a6586d77461eea8f59f50f7 Mon Sep 17 00:00:00 2001
> -From: Alexandru Moise <alexandru.moise@windriver.com>
> -Date: Fri, 29 Apr 2016 07:40:46 +0000
> -Subject: [PATCH] mem_section: Support only 46 bit for MAX_PHYSMEM_BITS on
> - PPC64
> -
> -Related to change:
> -http://lists.infradead.org/pipermail/kexec/2013-January/007849.html
> -
> -Linux on PPC64 has supported only 46 bit MAX_PHYSMEM_BITS since commit:
> -048ee0993ec8360abb0b51bdf8f8721e9ed62ec4
> -
> -Also remove set_ppc64_max_physmem_bits and set info->max_physmem_bits in
> -get_machdep_info_ppc64 instead. set_ppc64_max_physmem_bits is broken
> -for all kernels compiled with CONFIG_SPARSEMEM=n. makedumpfile is
> -unable to get mem_section field from powerpc kernel since commit:
> -fd59d231f81cb02870b9cf15f456a897f3669b4e
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> -
> -[hqBai: adjusted patch for context, no logical change]
> -Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - arch/ppc64.c | 38 ++------------------------------------
> - 1 file changed, 2 insertions(+), 36 deletions(-)
> -
> ---- a/arch/ppc64.c
> -+++ b/arch/ppc64.c
> -@@ -462,44 +462,6 @@ ppc64_vtop_level4(unsigned long vaddr)
> -       return paddr;
> - }
> -
> --int
> --set_ppc64_max_physmem_bits(void)
> --{
> --      long array_len = ARRAY_LENGTH(mem_section);
> --
> --      /* Check if we can get MAX_PHYSMEM_BITS from vmcoreinfo */
> --      if (NUMBER(MAX_PHYSMEM_BITS) != NOT_FOUND_NUMBER) {
> --              info->max_physmem_bits = NUMBER(MAX_PHYSMEM_BITS);
> --              return TRUE;
> --      }
> --
> --      /*
> --       * The older ppc64 kernels uses _MAX_PHYSMEM_BITS as 42 and the
> --       * newer kernels 3.7 onwards uses 46 bits.
> --       */
> --
> --      info->max_physmem_bits  = _MAX_PHYSMEM_BITS_ORIG ;
> --      if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
> --              || (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
> --              return TRUE;
> --
> --      info->max_physmem_bits  = _MAX_PHYSMEM_BITS_3_7;
> --      if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
> --              || (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
> --              return TRUE;
> --
> --      info->max_physmem_bits  = _MAX_PHYSMEM_BITS_4_19;
> --      if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
> --              || (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
> --              return TRUE;
> --
> --      info->max_physmem_bits  = _MAX_PHYSMEM_BITS_4_20;
> --      if ((array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT_EXTREME()))
> --              || (array_len == (NR_MEM_SECTIONS() / _SECTIONS_PER_ROOT())))
> --              return TRUE;
> --
> --      return FALSE;
> --}
> -
> - int
> - get_machdep_info_ppc64(void)
> -@@ -507,10 +469,8 @@ get_machdep_info_ppc64(void)
> -       unsigned long vmlist, vmap_area_list, vmalloc_start;
> -
> -       info->section_size_bits = _SECTION_SIZE_BITS;
> --      if (!set_ppc64_max_physmem_bits()) {
> --              ERRMSG("Can't detect max_physmem_bits.\n");
> --              return FALSE;
> --      }
> -+      info->max_physmem_bits = _MAX_PHYSMEM_BITS_3_7;
> -+
> -       info->page_offset = __PAGE_OFFSET;
> -
> -       if (SYMBOL(_stext) == NOT_FOUND_SYMBOL) {
> diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
> similarity index 88%
> rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
> rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
> index 8de4a7ad6..e703ee71b 100644
> --- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
> +++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
> @@ -11,13 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  LICENSE = "GPLv2.0"
>
>  SRCBRANCH ?= "master"
> -SRCREV = "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
> +SRCREV = "06ef8e2b814feb08a668b7a3783c86674e49a7b1"
>
>  DEPENDS = "bzip2 zlib elfutils xz"
>  RDEPENDS:${PN}-tools = "perl ${PN}"
>
> -# arm and aarch64 would compile but has never been tested upstream.  mips would not compile.
> -#
> +# mips would not compile.
>  COMPATIBLE_HOST = "(x86_64|i.86|powerpc|arm|aarch64).*-linux"
>
>  PACKAGES =+ "${PN}-tools"
> @@ -26,7 +25,6 @@ FILES:${PN}-tools = "${bindir}/*.pl"
>  SRC_URI = "\
>      git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
>      file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
> -    file://0002-mem_section-Support-only-46-bit-for-MAX_PHYSMEM_BITS.patch \
>  "
>
>  S = "${WORKDIR}/git"
> @@ -47,6 +45,7 @@ EXTRA_OEMAKE = "\
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lzo] = "USELZO=on,USELZO=off,lzo"
>  PACKAGECONFIG[snappy] = "USESNAPPY=on,USESNAPPY=off,snappy"
> +PACKAGECONFIG[zstd] = "USEZSTD=on,USEZSTD=off,zstd"
>
>  do_install () {
>      mkdir -p ${D}/usr/bin
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93994): https://lists.openembedded.org/g/openembedded-devel/message/93994
> Mute This Topic: https://lists.openembedded.org/mt/87116123/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

