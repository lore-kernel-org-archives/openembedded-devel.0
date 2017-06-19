Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A7147780C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 17:36:54 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id e201so26276660ybb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jun 2017 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hFNpPErdXkvRghUYmuMbvUEI7BnohthzVyNhEqXBMok=;
	b=f07NhNV8b/XLakCXl21YdY66lrvZU56e/4HBsZr7xlYo1wm/qqvmBdtEmf+bWsTmHs
	q1lHoXmjynvPTBRY5dLvUN9QM3FRCkNB7nZG9QJ1fpfsTfWxLtu+eoEVf3cNvKpuRd3/
	EmtioRpEFJ4YfclLWEfJ/pnAf5po75AGx9fqVidIiXn/DMHT0ttbWmjRD/hlFN/vL60P
	VrmNtHx5aJC2BzyMekfpw3mo3N9sKT3TeauJLIPhl8RKcfELVBSeZ9jcN/DpidpfDLi2
	Yk1kJIXRKijmzFdUZKpTSZvory0nq7pLzLERUi6JAxX8Q7J39S15j7nakg4Ri9d6+eOv
	8pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hFNpPErdXkvRghUYmuMbvUEI7BnohthzVyNhEqXBMok=;
	b=r9+Bn5B64D08/3AeXb2Q6J/OZ2wZubgXCN6CdwZID3iSyxML1f0U+N5wTDP0FDmOCh
	h+RKroh4LAAKG8AvR1kVxyrMmj5dKshIJ4xk4mU9k4VRTKfAmEvlEVCiFsg/BO3wfWyb
	H8lO0KfUghfaPFu+9Ryn3Yw6wb+dlSepH2P2CzMCmhYmobxwU9IhTHhyXAasLt7F4oM/
	NSzROR+U+rW2k94HztEOCGAKA4QuzVVw/rgm99tbb3kM1yNC8rKrp9eX/ynasRG/jzhS
	MnTCgR8ueIWoWP07umaY9CBUYvObG2j9qOmcSLUdsvrZFaaFjL9v5VnoxVGWcsKJ6PYB
	y/1Q==
X-Gm-Message-State: AKS2vOwQlM/uJIyvZGtQSJBEPnPseZcU8caRHb8Kd0YLdcNA6xOBN27K
	5pLSHQhOqkVsFoeLUjFTU8cvQl+8oA==
X-Received: by 10.37.176.140 with SMTP id f12mr14685047ybj.231.1497893815593; 
	Mon, 19 Jun 2017 10:36:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Mon, 19 Jun 2017 10:36:55 -0700 (PDT)
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Jun 2017 19:36:55 +0200
Message-ID: <CA+chaQcE2hi77vDUTj+2=MwOfTdAfowK6hsU0jAm6privxUQow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH 1/9] xfsprogs: Remove .la files in ${libdir}
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
X-List-Received-Date: Mon, 19 Jun 2017 17:36:54 -0000
Content-Type: text/plain; charset="UTF-8"

Causes:
http://errors.yoctoproject.org/Errors/Details/145596/

On Sat, Jun 17, 2017 at 7:21 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Delete .la files and remove ${libdir} if empty
> Fix build with musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...fine-__-prefixed-version-of-intXY_t-types.patch | 58
> ++++++++++++++++++++++
>  .../recipes-utils/xfsprogs/xfsprogs_4.10.0.bb      |  5 +-
>  2 files changed, 62 insertions(+), 1 deletion(-)
>  create mode 100644 meta-filesystems/recipes-utils/xfsprogs/files/0001-
> define-__-prefixed-version-of-intXY_t-types.patch
>
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/files/0001-
> define-__-prefixed-version-of-intXY_t-types.patch
> b/meta-filesystems/recipes-utils/xfsprogs/files/0001-
> define-__-prefixed-version-of-intXY_t-types.patch
> new file mode 100644
> index 000000000..951a1442c
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xfsprogs/files/0001-
> define-__-prefixed-version-of-intXY_t-types.patch
> @@ -0,0 +1,58 @@
> +From 2b4714123cdecb558babb76074d0ab945bf5b177 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 16 Jun 2017 18:59:10 -0700
> +Subject: [PATCH] define __ prefixed version of intXY_t types
> +
> +This is required since musl does not define them
> +unlike glibc
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/linux.h | 29 +++++++++++++++++++++++++++++
> + 1 file changed, 29 insertions(+)
> +
> +diff --git a/include/linux.h b/include/linux.h
> +index 6a676ca..6976d83 100644
> +--- a/include/linux.h
> ++++ b/include/linux.h
> +@@ -40,6 +40,35 @@
> + # undef fsxattr
> + #endif
> +
> ++#ifndef loff_t
> ++#define loff_t off_t
> ++#endif
> ++#ifndef __uint8_t
> ++#define __uint8_t uint8_t
> ++#endif
> ++#ifndef __uint16_t
> ++#define __uint16_t uint16_t
> ++#endif
> ++#ifndef __uint32_t
> ++#define __uint32_t uint32_t
> ++#endif
> ++#ifndef __uint64_t
> ++#define __uint64_t uint64_t
> ++#endif
> ++
> ++#ifndef __int8_t
> ++#define __int8_t int8_t
> ++#endif
> ++#ifndef __int16_t
> ++#define __int16_t int16_t
> ++#endif
> ++#ifndef __int32_t
> ++#define __int32_t int32_t
> ++#endif
> ++#ifndef __int64_t
> ++#define __int64_t int64_t
> ++#endif
> ++
> + static __inline__ int xfsctl(const char *path, int fd, int cmd, void *p)
> + {
> +       return ioctl(fd, cmd, p);
> +--
> +2.13.1
> +
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
> b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
> index f7e10cdfb..a9aee31b7 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=
> 102f7fec3d53c7c8f0b7baf9bf9d76a8"
>  DEPENDS = "util-linux util-linux-native"
>  SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${
> BP}.tar.xz \
>             file://link_needed_libs.patch \
> -"
> +           file://0001-define-__-prefixed-version-of-intXY_t-types.patch
> \
> +           "
>  SRC_URI[md5sum] = "ddbb04493addf014db07a7e2b96b2804"
>  SRC_URI[sha256sum] = "d8cb9ab2c686699d37914354ce3992
> b4aff3677093cbce06ad18bf798da8a8a7"
>
> @@ -54,4 +55,6 @@ do_configure_prepend () {
>
>  do_install_append() {
>          oe_runmake 'DESTDIR=${D}' install install-dev
> +        rm ${D}${libdir}/*.la
> +        rmdir ${D}${libdir}
>  }
> --
> 2.13.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

