Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 34E09789A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 15:35:35 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id g8so751044pgq.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DcF0bPKBZaMbCAnyqqupy2g3xGo5xtkCxpZuCutjG5E=;
	b=g8mmUj2dhTMm3g9bxQpvb0nBPQXEbUBr8JB320+d1hpsCDpHSVUqPkvtIusSGhMd6S
	GIeZUk50TBrP0N65PHo+4O5b2GXnlTfKru37p7yU/Ud707fp9kO3siOxitQa4SlEtrtb
	Q4ltTasLNshiE6m1nxyRMFscVlPfGIPOrbkPrdKBxBJumvQSSJWGdmqOF4A7Mi0RoPsT
	eUEWeDCjPEr1s+oeND06v0kNbR+AXIjWkc+phDVLtTRgnD9GvhcqV1JKoam6eQRgOwgk
	00RhgPbw6jC42xIdgaPZsjK/tWYibbSduYKTGu5Xw7JkFkVUQBWulrYTuirCtqWsj4mX
	uJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DcF0bPKBZaMbCAnyqqupy2g3xGo5xtkCxpZuCutjG5E=;
	b=hNXvUJsZZ4YJWCnUgLYK1lPo7jzq+oKH+ds5RbG11AFln1EMsR0K0nTLcYol2nQxEK
	Ke7D4daSOyxPJJaOeSuxGQ60UPSIOwNd0M0/LGUZ6H/18JjCFJBXQ9LUWrW7oI3bBBdU
	KlioiF8zEzylalIZY9vZY4w9q0rvI3BJPLVhkJXosZuRo36RSLeMKttFuHFe+CPH8VXZ
	ZOmkZCZjHHItqQjrxg7mhdYJ1zws18Hv9ji5/oEqjj69HP5EWN71CYBpfw5Dz+IiyaXY
	R3v2CZCYPxFgYqNukpjVnMVwa1sh5ByhWJdeWq6fH1Rf7TeQcbuSDkaNIKNWGKFy4w5Q
	GHJA==
X-Gm-Message-State: AElRT7GMNpQEO48idi8UozlmHIBMhustmj5viUe9p4De9OnkwwWy0Wbe
	HrpgCRvDDuNVbUqaC+8R5vK0uKu55ImE0TGM+kM=
X-Google-Smtp-Source: AG47ELuy3wbLIIosu2HGCXZc3ax02y0rngZVRcYdQTf5FqXUCQSi6f8XbDOM2Fyk95TGlo4jFNA9jNYBcWeHJmeRxXw=
X-Received: by 10.101.73.207 with SMTP id t15mr11897341pgs.204.1521560136161; 
	Tue, 20 Mar 2018 08:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180319060300.5366-1-raj.khem@gmail.com>
	<20180319060300.5366-14-raj.khem@gmail.com>
	<fb3b399e-822d-3820-b7f9-3f5eb9de3cd9@gmail.com>
In-Reply-To: <fb3b399e-822d-3820-b7f9-3f5eb9de3cd9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2018 15:35:25 +0000
Message-ID: <CAMKF1sr1XNBbmfpU_1D_Up9C38_oRyQbFe34jEmQAyVe5o5HQw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 14/18] flashrom: Upgrade to 1.0
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
X-List-Received-Date: Tue, 20 Mar 2018 15:35:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 8:22 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 03/18/2018 11:02 PM, Khem Raj wrote:
> > - Fix build on risc-v
> > - Drop upstreamed patches
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Please check SRC_URI
>
> ERROR: flashrom-1.0-r0 do_fetch: Fetcher failure for URL:
> 'http://download.flashrom.org/releases/flashrom-1.0.tar.bz2'. Unable to
> fetch URL from any source.
>
> I tried wget of the same url and it failed.


https://download.flashrom.org/releases/flashrom-1.0.tar.bz2

Is available now may that=E2=80=99s the problem

>
>
> - armin
> > ---
> >  .../flashrom/0001-Remove-undefined-behavior.patch  | 82
> ----------------------
> >  ...001-platform-Add-riscv-to-known-platforms.patch | 37 ++++++++++
> >  ...fine-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch | 28 --------
> >  .../{flashrom_0.9.9.bb =3D> flashrom_1.0.bb}         |  7 +-
> >  4 files changed, 40 insertions(+), 114 deletions(-)
> >  delete mode 100644
> meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patc=
h
> >  create mode 100644
> meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-pl=
atforms.patch
> >  delete mode 100644
> meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-en=
able-ffs-libc-API.patch
> >  rename meta-oe/recipes-bsp/flashrom/{flashrom_0.9.9.bb =3D>
> flashrom_1.0.bb} (63%)
> >
> > diff --git
> a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.pa=
tch
> b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.pa=
tch
> > deleted file mode 100644
> > index 51397dc55..000000000
> > ---
> a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.pa=
tch
> > +++ /dev/null
> > @@ -1,82 +0,0 @@
> > -From d2a03b3e43043b596a79803bcb93f70e513bbb50 Mon Sep 17 00:00:00 2001
> > -From: Patrick Georgi <pgeorgi@google.com>
> > -Date: Mon, 13 Mar 2017 13:48:03 +0100
> > -Subject: [PATCH] Remove undefined behavior
> > -
> > -Per clang-3.9, the compiler fails on #define ...defined(...) statement=
s
> > -as they're undefined behavior (apparently with different behavior
> > -between gcc/clang and msvc, too).
> > -
> > -See clang's cfe repo commit r258128 for details.
> > -
> > -Change-Id: I82b6235e11b425fae45eebbe06b08f81c5bdbb98
> > -Signed-off-by: Patrick Georgi <pgeorgi@google.com>
> > -Reviewed-on: https://review.coreboot.org/18792
> > -Reviewed-by: Stefan Reinauer <stefan.reinauer@coreboot.org>
> > -Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
> > ----
> > - hwaccess.c | 18 +++++++++++++++---
> > - platform.h | 18 +++++++++++++++---
> > - 2 files changed, 30 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/hwaccess.c b/hwaccess.c
> > -index aede7e3..2bf6f42 100644
> > ---- a/hwaccess.c
> > -+++ b/hwaccess.c
> > -@@ -37,9 +37,21 @@
> > - #error "Unknown operating system"
> > - #endif
> > -
> > --#define USE_IOPL    (IS_LINUX || IS_MACOSX || defined(__NetBSD__) ||
> defined(__OpenBSD__))
> > --#define USE_DEV_IO  (defined(__FreeBSD__) ||
> defined(__FreeBSD_kernel__) || defined(__DragonFly__))
> > --#define USE_IOPERM  (defined(__gnu_hurd__))
> > -+#if IS_LINUX || IS_MACOSX || defined(__NetBSD__) ||
> defined(__OpenBSD__)
> > -+#define USE_IOPL 1
> > -+#else
> > -+#define USE_IOPL 0
> > -+#endif
> > -+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) ||
> defined(__DragonFly__)
> > -+#define USE_DEV_IO 1
> > -+#else
> > -+#define USE_DEV_IO 0
> > -+#endif
> > -+#if defined(__gnu_hurd__)
> > -+#define USE_IOPERM 1
> > -+#else
> > -+#define USE_IOPERM 0
> > -+#endif
> > -
> > - #if USE_IOPERM
> > - #include <sys/io.h>
> > -diff --git a/platform.h b/platform.h
> > -index c5a52ef..b2fdcd0 100644
> > ---- a/platform.h
> > -+++ b/platform.h
> > -@@ -25,9 +25,21 @@
> > - #define __PLATFORM_H__ 1
> > -
> > - // Helper defines for operating systems
> > --#define IS_LINUX    (defined(__gnu_linux__) || defined(__linux__))
> > --#define IS_MACOSX   (defined(__APPLE__) && defined(__MACH__)) /* yes,
> both. */
> > --#define IS_WINDOWS  (defined(_WIN32) || defined(_WIN64) ||
> defined(__WIN32__) || defined(__WINDOWS__))
> > -+#if defined(__gnu_linux__) || defined(__linux__)
> > -+#define IS_LINUX 1
> > -+#else
> > -+#define IS_LINUX 0
> > -+#endif
> > -+#if defined(__APPLE__) && defined(__MACH__) /* yes, both. */
> > -+#define IS_MACOSX 1
> > -+#else
> > -+#define IS_MACOSX 0
> > -+#endif
> > -+#if defined(_WIN32) || defined(_WIN64) || defined(__WIN32__) ||
> defined(__WINDOWS__)
> > -+#define IS_WINDOWS 1
> > -+#else
> > -+#define IS_WINDOWS 0
> > -+#endif
> > -
> > - // Likewise for target architectures
> > - #if defined (__i386__) || defined (__x86_64__) || defined(__amd64__)
> > ---
> > -2.13.3
> > -
> > diff --git
> a/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-=
platforms.patch
> b/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-=
platforms.patch
> > new file mode 100644
> > index 000000000..7ba69a917
> > --- /dev/null
> > +++
> b/meta-oe/recipes-bsp/flashrom/flashrom/0001-platform-Add-riscv-to-known-=
platforms.patch
> > @@ -0,0 +1,37 @@
> > +From d2a28dcdbd1051d2f48320e2eda3393581fe0519 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 17 Mar 2018 23:08:29 -0700
> > +Subject: [PATCH] platform: Add riscv to known platforms
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Submitted [
> https://review.coreboot.org/#/c/flashrom/+/25260/]
> > + platform.h | 5 ++++-
> > + 1 file changed, 4 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/platform.h b/platform.h
> > +index b2fdcd0..2cadbb3 100644
> > +--- a/platform.h
> > ++++ b/platform.h
> > +@@ -69,6 +69,9 @@
> > + #elif defined (__m68k__)
> > +     #define __FLASHROM_ARCH__ "m68k"
> > +     #define IS_M68K 1
> > ++#elif defined (__riscv)
> > ++    #define __FLASHROM_ARCH__ "riscv"
> > ++    #define IS_RISCV 1
> > + #elif defined (__sh__)
> > +     #define __FLASHROM_ARCH__ "sh"
> > +     #define IS_SH 1
> > +@@ -77,7 +80,7 @@
> > +     #define IS_S390 1
> > + #endif
> > +
> > +-#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA |=
|
> IS_HPPA || IS_M68K || IS_SH || IS_S390)
> > ++#if !(IS_X86 || IS_MIPS || IS_PPC || IS_ARM || IS_SPARC || IS_ALPHA |=
|
> IS_HPPA || IS_M68K || IS_RISCV || IS_SH || IS_S390)
> > + #error Unknown architecture
> > + #endif
> > +
> > +--
> > +2.16.2
> > +
> > diff --git
> a/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-=
enable-ffs-libc-API.patch
> b/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-=
enable-ffs-libc-API.patch
> > deleted file mode 100644
> > index 4170fefd2..000000000
> > ---
> a/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-=
enable-ffs-libc-API.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From 7c65a465a3ddeb7afb9a7c49d010ae7e5d5b1ad1 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 18 Jul 2017 20:25:49 -0700
> > -Subject: [PATCH] spi: Define _XOPEN_SOURCE to enable ffs() libc API
> > -
> > -musl exposes this issue
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - spi.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/spi.c b/spi.c
> > -index 894f73f..aeb6518 100644
> > ---- a/spi.c
> > -+++ b/spi.c
> > -@@ -21,7 +21,7 @@
> > - /*
> > -  * Contains the generic SPI framework
> > -  */
> > --
> > -+#define _XOPEN_SOURCE
> > - #include <strings.h>
> > - #include <string.h>
> > - #include "flash.h"
> > ---
> > -2.13.3
> > -
> > diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
> b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
> > similarity index 63%
> > rename from meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
> > rename to meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
> > index 4cdd8ad23..6f5c037a8 100644
> > --- a/meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
> > +++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
> > @@ -6,12 +6,11 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
> >  DEPENDS =3D "pciutils libusb libusb-compat"
> >
> >  SRC_URI =3D "http://download.flashrom.org/releases/flashrom-${PV}.tar.=
bz2
> \
> > -
>  file://0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch \
> >             file://sst26.patch \
> > -           file://0001-Remove-undefined-behavior.patch \
> > +           file://0001-platform-Add-riscv-to-known-platforms.patch \
> >             "
> > -SRC_URI[md5sum] =3D "aab9c98925d9cfb5ffb28b67a6112530"
> > -SRC_URI[sha256sum] =3D
> "cb3156b0f63eb192024b76c0814135930297aac41f80761a5d293de769783c45"
> > +SRC_URI[md5sum] =3D "42d999990c735d88653627cefcc13b9a"
> > +SRC_URI[sha256sum] =3D
> "3702fa215ba5fb5af8e54c852d239899cfa1389194c1e51cb2a170c4dc9dee64"
> >
> >  inherit pkgconfig
> >
>
>

