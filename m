Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8ABE971C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 21:10:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u138so3602524wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Oct 2017 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WP9nl/jp4aqw9Rw22DMAMgCYBFmaAyw6/9D3QzGeEuk=;
	b=YewGGxMfLTMGtEnm0ng2la/8blIvkGRmb8VhWA7IFWT5U1OSHexwOgahdpUVRqmggw
	XXHrshwCJroZZpXqTepKX6dLniknSxTi+L6O+jQjUqNhLzbbA52V5lkNcM/OVzZ7VyZc
	8ImSTa2QXJ/yLw1VGP+cUq7kebDCdU94LpVO5wnCo3qYCEMz7cCXZlsaGME9+SUIKxcC
	PXpKWlWomQLkXDfvHPClVOE964OY1mUDCgAUqyBK3vRGnVfVX2PcK2dNx0Reg6pUO8I7
	TO3uox9PoWTJimzeQpdreSNEc3V40t+WpOzulS+og3/nrXOdy/L3clU/BXuzDfFUSzTs
	h7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WP9nl/jp4aqw9Rw22DMAMgCYBFmaAyw6/9D3QzGeEuk=;
	b=F9UlKDn4722dyKZ1vVYu4UH5QKPRzmV0Uw5zKiohwhmjSngP2WTsSQPUTQDEFCNNhR
	Db8RQyTp6oxEJau9kH0BVyA8FEx5ZoZScA3FYkUyhlqypqPGyeu6pIFyC1BPocPiKA3D
	qzVZ08DBTaJ/TWeEPs/xFJ5x4jv8fomoFyLOGA8RjCKVGzGJiWDJgKyQv4gvVLx7E498
	lZALlP0OdIJV5WWhK7NJrdjIcLAm0foDuuqZ8AKV3URI4C+EwHPjxK9fGM77xucq+lw+
	XyltvfYamAe6Fje6lZSfagkffm6EL8+LgPhLtOnuf2IW0FnI3NCUURcEJXKdL7QVUV6B
	rEZw==
X-Gm-Message-State: AHPjjUi9xD9GgPqKVFC3RgrfnQoM8vM/DQljUWHZKJA885Jp0m5yIw9u
	I5iItNg9SL79YZoBMkURSu8WIRm2FaTuX784vpN+QA==
X-Google-Smtp-Source: AOwi7QBQxKz6UMFe7/Zl/sruAJhZhroHDuJSYjjamfE+ebA+Ok50E2Bkgo/OIL6fqMKcPKCeUJ+aSAa0gy8Sn1vpfJ4=
X-Received: by 10.80.159.167 with SMTP id c36mr21531672edf.189.1506978616947; 
	Mon, 02 Oct 2017 14:10:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.185 with HTTP; Mon, 2 Oct 2017 14:10:16 -0700 (PDT)
In-Reply-To: <20171002160657.39576-3-raj.khem@gmail.com>
References: <20171002160657.39576-1-raj.khem@gmail.com>
	<20171002160657.39576-3-raj.khem@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 2 Oct 2017 23:10:16 +0200
Message-ID: <CAAQYJAt9hjvi_bL6bC4LZ+=3DeNd_fsA36_xjLvMxu=CUKbYug@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 3/5] ubi-utils-klibc: Update to 1.5.2 release of mtd-utils
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
X-List-Received-Date: Mon, 02 Oct 2017 21:10:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Makefile-only-build-ubi-utils.patch       | 25 ++++++++++------------
>  .../0005-common.h-klibc-fixes-2.patch              | 22 +++++--------------
>  ...ils-klibc_1.5.1.bb => ubi-utils-klibc_1.5.2.bb} |  8 +++----
>  3 files changed, 19 insertions(+), 36 deletions(-)
>  rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_1.5.1.bb => ubi-utils-klibc_1.5.2.bb} (90%)
>
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
> index 9d5e4ebf0..6e1b9ff10 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0001-Makefile-only-build-ubi-utils.patch
> @@ -25,11 +25,11 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>   Makefile | 24 ++----------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)
>
> -diff --git a/Makefile b/Makefile
> -index eade234..2275865 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -16,28 +16,13 @@ endif
> +Index: git/Makefile
> +===================================================================
> +--- git.orig/Makefile
> ++++ git/Makefile
> +@@ -16,28 +16,11 @@ endif
>
>   TESTS = tests
>
> @@ -37,7 +37,7 @@ index eade234..2275865 100644
>  -      ftl_format flash_erase nanddump doc_loadbios \
>  -      ftl_check mkfs.jffs2 flash_lock flash_unlock \
>  -      flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
> --      mtd_debug flashcp nandwrite nandtest \
> +-      mtd_debug flashcp nandwrite nandtest mtdpart \
>  -      jffs2dump \
>  -      nftldump nftl_format docfdisk \
>  -      rfddump rfdformat \
> @@ -51,15 +51,15 @@ index eade234..2275865 100644
>  -BINS += mkfs.ubifs/mkfs.ubifs
>  -BINS += $(addprefix ubi-utils/,$(UBI_BINS))
>  -SCRIPTS = flash_eraseall
> -+BINS = $(addprefix ubi-utils/,$(UBI_BINS))
> -
> - TARGETS = $(BINS)
> +-
> +-TARGETS = $(BINS)
>  -TARGETS += lib/libmtd.a
>  -TARGETS += ubi-utils/libubi.a
> ++BINS = $(addprefix ubi-utils/,$(UBI_BINS))
>
>   OBJDEPS = $(BUILDDIR)/include/version.h
>
> -@@ -61,12 +46,9 @@ endif
> +@@ -61,12 +44,9 @@ endif
>         rm -f $(BUILDDIR)/include/version.h
>         $(MAKE) -C $(TESTS) clean
>
> @@ -73,7 +73,7 @@ index eade234..2275865 100644
>
>   tests::
>         $(MAKE) -C $(TESTS)
> -@@ -91,8 +73,6 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
> +@@ -91,8 +71,6 @@ LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
>   LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
>   LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
>
> @@ -82,6 +82,3 @@ index eade234..2275865 100644
>   #
>   # Common libmtd
>   #
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
> index 2e43d5d97..6b09c14d6 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/0005-common.h-klibc-fixes-2.patch
> @@ -22,20 +22,11 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>   include/common.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> -diff --git a/include/common.h b/include/common.h
> -index 77f3f7d..2cbee0f 100644
> ---- a/include/common.h
> -+++ b/include/common.h
> -@@ -126,7 +126,7 @@ static char __PRIxoff_t_static_assert[sizeof(off_t) == 8 ? 1 : -1];
> -       fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
> - } while(0)
> -
> --#if defined(__UCLIBC__)
> -+#if defined(__UCLIBC__) || defined(__KLIBC__)
> - /* uClibc versions before 0.9.34 don't have rpmatch() */
> - #if __UCLIBC_MAJOR__ == 0 && \
> -               (__UCLIBC_MINOR__ < 9 || \
> -@@ -146,15 +146,17 @@ static inline int __rpmatch(const char *resp)
> +Index: git/include/common.h
> +===================================================================
> +--- git.orig/include/common.h
> ++++ git/include/common.h
> +@@ -161,15 +161,17 @@ static inline int __rpmatch(const char *
>    */
>   static inline bool prompt(const char *msg, bool def)
>   {
> @@ -56,6 +47,3 @@ index 77f3f7d..2cbee0f 100644
>                         printf("failed to read prompt; assuming '%s'\n",
>                                 def ? "yes" : "no");
>                         break;
> ---
> -1.9.1
> -
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
> similarity index 90%
> rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
> rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
> index 8ca1ca727..518c02fc0 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.2.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>  inherit klibc
>
> -SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc306bfda7bddc99 \
> +SRCREV = "aea36417067dade75192bafa03af70b6eb2677b1"
> +SRC_URI = "git://git.infradead.org/mtd-utils.git \
>               file://0001-Makefile-only-build-ubi-utils.patch \
>               file://0002-common.mk-for-klibc-CC-is-klcc.patch \
>               file://0003-libubi.c-add-klibc-specific-fixes.patch \
> @@ -23,10 +24,7 @@ S = "${WORKDIR}/git/"
>  EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
>
>  do_install () {
> -
> -    install -d ${D}${sbindir}

I don't remember if it is actually necessary but here sbindir was
purposedly created for safety.
Maybe building it anew after having wiped tmp makes install fail?

> -    oe_runmake DESTDIR="${D}" install
> -
> +       oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
>  }
>
>  PACKAGES = "ubi-utils-klibc-dbg"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Thanks for taking care of this.
I planned to update to 2.x one day, at least the ubi-utils, but you
know, these old binaries do work perfectly on armv4/armv5 so I never
did it...

For the klibc patchset,

Acked-by: Andrea Adami <andrea.adami@gmail.com>

Cheers
Andrea

