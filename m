Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDABCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 22:03:03 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.1226.1758664973855988387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 15:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RYqVM0va;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-74526ca7a46so2429283a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 15:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758664973; x=1759269773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qje3vKJBklMqQoExXKVhx/nUByjQuC+RFaiI7yZcnWA=;
        b=RYqVM0vaGPNlF6Jr+/HmRAX/W2GzAIarcsK7AANmQ+Qu/L2sd9ZBTV6olClghRgi36
         HPrfkHrOVM6JC1C2GZP7JQSvdRbblf3pwZjfgzu2f+N9idTWdeTOtWFeklGS6OT2phKx
         9HJJNqPm0magbrpcANyJjahGl9sXvoYDCIkRC3C9vsCRYl/Pk8eTcaP5ZO4U7puZe/LJ
         xbYQlv9BNhkFAdoTRSfSDUcYw+zIhPqra9uy3evCSuK/Z+uO2Cmgkxm25wxcfpy7dy8d
         wwpwOVk5Kvm0b5+58c9G5TJ+KtGd8mk5WJxtvo7+Yj+JECi8lSodj83S4oD1f94OnHj+
         yvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758664973; x=1759269773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qje3vKJBklMqQoExXKVhx/nUByjQuC+RFaiI7yZcnWA=;
        b=jaO8Ic0zPIqKhJ4fkwBBewvpl0Sn621yhaxId9dSq1G8XI1f2xYNj9xs63ObEpxiLP
         uPlMq9/Or+F55BEY7Tb/mCsN1jAZFuNqxSkPq3YTTAfK+UETA8JIg1uNdjeGU/eqzyCI
         JhbGvPzFUaJT71aROWE3HEs+OPINwrXoz0WhucL4PaW/cQF9p/C0EPRxpp6EC+45bB7l
         kV8z0lE1mCp+d3S5a+CSB03fIGA0SnUN6Ed+7/PM3KGcCYx/VWYREyPDXzeBdIkBur8E
         1HMImJ5IrOeyHhQhgCfH8wiofoUH1GIcEgEzGQjYARdbN738w+F+D38/Qb9nS0FvV6bj
         jclQ==
X-Gm-Message-State: AOJu0Yz4tUJBiwWw6quKIB15uxGR9DCBVxJkQHPTLQER0TZniDZnqQCA
	0FGEeH4nbhhYrMfRxUxRxqtkLId27jjR9w7MoUN1NujaUXl9FXsKdiKib2LRBxLLPayphplf6nT
	yQbTxXiL4tvIxYLDVmBTv42dOvtS+x0E=
X-Gm-Gg: ASbGnctjeH3vxSBtCm2HNkWCMDAOsMJAYrs8g4o1nKJs3hs0ST93oHuvaR9nnmH0j1/
	mVEzSin3vV/L4kbqhZZB9AIrVXSJ2vI1ax0FdnyecfYMxwiUCbRIzwxRTbbMHxgJRJIA/wiz86f
	1sm62EHOgL4kEU0PC4z5CmgJ4D6qvt2my9XbwHVKbXG6guUBYTNYlsOtEyd3OVjOKz0YFoiDE7y
	4YpR7OR4w==
X-Google-Smtp-Source: AGHT+IH11EQ8poiBb/NLDr+vod5EePVnhWL3ozR+RtrjiIPtcPMqDUw/F0LhRQEnhv9KvjzYzdq3LHfkr2HzRInlsZE=
X-Received: by 2002:a05:6808:2124:b0:438:3e15:2431 with SMTP id
 5614622812f47-43f2d2cec97mr2043165b6e.15.1758664972638; Tue, 23 Sep 2025
 15:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250923154124.2726663-1-archana.polampalli@windriver.com>
In-Reply-To: <20250923154124.2726663-1-archana.polampalli@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 24 Sep 2025 10:02:40 +1200
X-Gm-Features: AS18NWDXMuOYdX7J0TFFQTobcM_b98k4SgUtq-6ggKCztWKoen-3YDA1XX73Qvk
Message-ID: <CADySD0HGiic0OogZZnSZaszmJUWH2MBjxQQoJj7cSvWrQ3iCpQ@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH 1/1] tcpreplay: upgrade 4.5.1 -> 4.5.2
To: archana.polampalli@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 22:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119737

Can you please also send this patch for the walnascar branch as well, thank=
s

On Wed, Sep 24, 2025 at 3:41=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> Changelog:
> https://github.com/appneta/tcpreplay/releases/tag/v4.5.2
>
> Drop patches that have been merged upstream.
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../0001-Fix-linker-error-for-TX_RING.patch   | 71 -------------------
>  ...mpatible-type-assignment-in-txring.c.patch | 31 --------
>  ...{tcpreplay_4.5.1.bb =3D> tcpreplay_4.5.2.bb} |  4 +-
>  3 files changed, 1 insertion(+), 105 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0=
001-Fix-linker-error-for-TX_RING.patch
>  delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0=
002-fix-incompatible-type-assignment-in-txring.c.patch
>  rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.1.bb =3D=
> tcpreplay_4.5.2.bb} (75%)
>
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix=
-linker-error-for-TX_RING.patch b/meta-networking/recipes-support/tcpreplay=
/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
> deleted file mode 100644
> index d8f0ab270c..0000000000
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker=
-error-for-TX_RING.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 36e038d9e4047ae42a148f671f18971cc6a68558 Mon Sep 17 00:00:00 2001
> -From: "mark.yang" <mark.yang@lge.com>
> -Date: Thu, 10 Apr 2025 18:30:52 +0900
> -Subject: [PATCH] Fix linker error for TX_RING
> -
> -Found similar issue in gcc 15 build environment.
> -- See more details at: http://errors.yoctoproject.org/Errors/Details/851=
800/
> -```
> -TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
5.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
> -/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be)=
: undefined reference to `txring_put'
> -TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
5.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_=
pf':
> -/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea=
): undefined reference to `txring_init'
> -TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
5.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
> -/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be)=
: undefined reference to `txring_put'
> -TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
5.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_=
pf':
> -/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea=
): undefined reference to `txring_init'
> -TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
5.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
> -/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be)=
: undefined reference to `txring_put'
> -TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/=
usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/1=
5.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_=
pf':
> -/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea=
): undefined reference to `txring_init'
> -```
> -- The result of "nm -u txring.o" shows no symbols exist.
> -
> -- The config.h has HAVE_TX_RING defined but txring.c is not aware of it.
> -  txring.c and txring.h include config.h at the beginning.
> -
> -- This resulted in a successful build in my build environment.
> -
> -It may
> -Fixes #731
> -Fixes #904
> -
> -Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/92=
4]
> -Signed-off-by: mark.yang <mark.yang@lge.com>
> ----
> - src/common/txring.c | 3 +++
> - src/common/txring.h | 4 ++--
> - 2 files changed, 5 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/common/txring.c b/src/common/txring.c
> -index d5768d75..f522893d 100644
> ---- a/src/common/txring.c
> -+++ b/src/common/txring.c
> -@@ -31,6 +31,9 @@
> -  * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -  */
> -
> -+#include "defines.h"
> -+#include "config.h"
> -+
> - #ifdef HAVE_TX_RING
> -
> - #include "txring.h"
> -diff --git a/src/common/txring.h b/src/common/txring.h
> -index 309da84c..3f14cac0 100644
> ---- a/src/common/txring.h
> -+++ b/src/common/txring.h
> -@@ -33,11 +33,11 @@
> -
> - #pragma once
> -
> --#ifdef HAVE_TX_RING
> --
> - #include "defines.h"
> - #include "config.h"
> -
> -+#ifdef HAVE_TX_RING
> -+
> - #if __GLIBC__ >=3D 2 && __GLIBC_MINOR >=3D 1
> - #include <net/ethernet.h> /* the L2 protocols */
> - #include <netpacket/packet.h>
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix=
-incompatible-type-assignment-in-txring.c.patch b/meta-networking/recipes-s=
upport/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.=
c.patch
> deleted file mode 100644
> index 906c30e147..0000000000
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incomp=
atible-type-assignment-in-txring.c.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 5615e8f7bbf83f03acacd6d6ba9ff8dc6fdc91df Mon Sep 17 00:00:00 2001
> -From: "mark.yang" <mark.yang@lge.com>
> -Date: Thu, 10 Apr 2025 18:49:51 +0900
> -Subject: [PATCH] fix incompatible type assignment in txring.c
> -
> -* There is an incompatible type assignment error in txring.c.
> -  txring.c:200:12: error: incompatible types when assigning to type 'txr=
ing_t' {aka 'struct txring_s'} from type 'txring_t *' {aka 'struct txring_s=
 *'}
> -  200 |     *txp =3D (txring_t *)safe_malloc(sizeof(txring_t));
> -      |            ^
> -
> -  txp is allocated as txring_t *, so I fixed it.
> -
> -Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/92=
4]
> -Signed-off-by: mark.yang <mark.yang@lge.com>
> ----
> - src/common/txring.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/common/txring.c b/src/common/txring.c
> -index f522893d..b062dac2 100644
> ---- a/src/common/txring.c
> -+++ b/src/common/txring.c
> -@@ -197,7 +197,7 @@ txring_init(int fd, unsigned int mtu)
> -     txring_t *txp;
> -
> -     /* allocate memory for structure and fill it with different stuff*/
> --    *txp =3D (txring_t *)safe_malloc(sizeof(txring_t));
> -+    txp =3D (txring_t *)safe_malloc(sizeof(txring_t));
> -     txp->treq =3D (struct tpacket_req *)safe_malloc(sizeof(struct tpack=
et_req));
> -
> -     txring_mkreq(txp->treq, mtu);
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb=
 b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
> similarity index 75%
> rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
> rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
> index 46e06a928e..96a7087b0b 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
> @@ -9,11 +9,9 @@ LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3D10f0474a=
2f0e5dccfca20f69d6598ad8"
>
>  SRC_URI =3D "https://github.com/appneta/${BPN}/releases/download/v${PV}/=
${BP}.tar.gz \
>      file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
> -    file://0001-Fix-linker-error-for-TX_RING.patch \
> -    file://0002-fix-incompatible-type-assignment-in-txring.c.patch \
>  "
>
> -SRC_URI[sha256sum] =3D "2de79bfd67ec92ca9ae2ffb50456dd1d53ff40f3fa71b422=
c65e8062013c9e85"
> +SRC_URI[sha256sum] =3D "ccff3bb29469a04ccc20ed0b518e3e43c4a7b5a876339d94=
35bfd9db7fe5d0f1"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/appneta/tcpreplay/releases"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119716): https://lists.openembedded.org/g/openembedde=
d-devel/message/119716
> Mute This Topic: https://lists.openembedded.org/mt/115396111/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

