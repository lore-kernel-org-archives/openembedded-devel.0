Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.108106.1597918222735954389
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 03:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=qXlnN4KH;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1597918222; x=1629454222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bvapssDo2wCxft/g3lQ3BVXZYIcFY6KAura8H9x3wHw=;
  b=qXlnN4KH5OBOlVUgAv1EtxPoskDJZ/NDQ6H+B992SAJ33MnBD6cmg+62
   rzbPI3/MUJImuAYu55osOm+02EY4wv79ZNUYYZ1/+Gh672iD0OXCIhTHv
   2ZJHhihbmzkwzRiZQRGeLypJdQzVFyQxv3zgaTnpbaYzQATag8XPV0xWi
   MA5+z9DpohIhjH2yJV+GzWDveXfuFitmtlB7TEtBWZ6H7a/20u5x+xFxf
   Z/uwTRj6Wr0N5GM6aBrgKYvaBOhAT9ws/R42Kurv5/8XCYH1glfqqSLMo
   JCLNw5Rh780afFlQMsw6IDd2HA9nsL9k85U901oAzi0Eesg+dKU8zN2xw
   g==;
IronPort-SDR: ccX54mwZjtGaXD7knEY7nabUtLItmEp6J5k/YwAzJBan31I7aPOsneQOQZzJutK5pPxKFACZFy
 F1RjnFTksf+2dVvrZFWHk958B36Tg9W2ooBBuF/T0lUeDfTPkUfBFbHVibcItJg+kKWnftsjR+
 FwtIG97tO9CaP0tYQvJPRgtZAa3W6zGxzh/ndN1+WrYaIIB/g4anI0CtefNGwSSZZTg/WzwNdD
 EaGAzprztF9AB7F7o0NAs1Zeif97uEkI8CuKaI9sNQiH6uDRjRkVzk+euAb2SqVYxWZIH8nvqM
 /kI=
X-IronPort-AV: E=Sophos;i="5.76,332,1592863200"; 
   d="scan'208";a="26246936"
Date: Thu, 20 Aug 2020 12:10:19 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCHv2] openjdk-8: add a glibc 2.32 compatibility patch
Message-ID: <20200820101019.GB51054@pcleri>
References: <20200813162756.24193-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200813162756.24193-1-alex.kanavin@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,
thank you for your patch!

This is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;rl

On Thu, Aug 13, 2020 at 06:27:56PM +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../openjdk/openjdk-8-release-common.inc      |  1 +
>  .../2010-Remove-usage-of-sys-sysctl.h.patch   | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-core/openjdk/openjdk-8-release-common.inc
> index 02210a1..c43fd22 100644
> --- a/recipes-core/openjdk/openjdk-8-release-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> @@ -20,6 +20,7 @@ PATCHES_URI = "\
>      file://2007-jdk-no-genx11-in-headless.patch \
>      file://2008-jdk-no-unused-deps.patch \
>      file://2009-jdk-use-gcc-instead-of-ld-to-link-genSocketOptionRegistry.patch \
> +    file://2010-Remove-usage-of-sys-sysctl.h.patch \
>  "
>  HOTSPOT_UB_PATCH = "\
>      file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> new file mode 100644
> index 0000000..f6d7681
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/2010-Remove-usage-of-sys-sysctl.h.patch
> @@ -0,0 +1,39 @@
> +From 3ed9b4a109cf2f31b97ab8ba317d67886452523c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 13 Aug 2020 17:59:42 +0200
> +Subject: [PATCH] Remove usage of sys/sysctl.h
> +
> +This header has been removed in glibc 2.32, and isn't used for
> +anything.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c | 1 -
> + jdk/src/solaris/native/java/net/PlainSocketImpl.c         | 1 -
> + 2 files changed, 2 deletions(-)
> +
> +diff --git a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> +index cd15654e..4d8abe03 100644
> +--- a/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> ++++ b/jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c
> +@@ -41,7 +41,6 @@
> + #endif
> + #ifdef __linux__
> + #include <unistd.h>
> +-#include <sys/sysctl.h>
> + #include <sys/utsname.h>
> + #include <netinet/ip.h>
> + 
> +diff --git a/jdk/src/solaris/native/java/net/PlainSocketImpl.c b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> +index 170957e7..9aafbc09 100644
> +--- a/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> ++++ b/jdk/src/solaris/native/java/net/PlainSocketImpl.c
> +@@ -43,7 +43,6 @@
> + #endif
> + #ifdef __linux__
> + #include <unistd.h>
> +-#include <sys/sysctl.h>
> + #endif
> + 
> + #include "jvm.h"
> -- 
> 2.28.0
> 
