Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363F7CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:01:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.10531.1760515304818652190
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ct9Lkz0D;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46b303f755aso54667305e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760515303; x=1761120103; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7f5TWlVXRrV3DohfogZ1bHrO0rrNJ6XPUrMRfnYUYCU=;
        b=Ct9Lkz0DHuf9vSxTe0jRKaRZBYjGjhGYWTnvdjv47x2es0M4ilH6Q8WGmGjAL63LSY
         nU9LbSUGRA2ewc2ENfSzCS4MZP/OcO09NlIyIauzAPrMSC5TXDFwtl101Mj+90QZfnhw
         2DD9oiDdKXMzaFkYrpigHoVraO4j+gFQIpZAw3SV+fU66eGZg8nvzys+wr91ahn5TQEI
         IcHgdVJNHw4xIgK00ZtSEukLGEVzi66oZiBYJavPR4M00guHyF3H0XO+Fp86yUztTCRX
         +GNrbLLoJns++mGAVCesJz9wpaXB9frRAXdIg4SLbKRwuOg/oppv5IkLroLBrdw+BC80
         wzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515303; x=1761120103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7f5TWlVXRrV3DohfogZ1bHrO0rrNJ6XPUrMRfnYUYCU=;
        b=FJJi62fKNjS5dfDDBZSZdBX44P4/c5kkF7d7+RREb+mUyrUL9be5sNMwADyRwZHg4B
         QzgbQqkaoThugEHGP5VPohqt8Zzt0VeFIN/1jsnGqjCxLe7P4P/xANb85JFXYatDf4wx
         HYJYxxE34Ptq7nh1vri9Foub5r1I/K4c8c7YfJSBl1xm6jKeqcaU7jf0Jpk0cRopZyD3
         mYW9jT0fOeFDBiFhjdcxCZo5gSxt53V6b9RhxG1ZZSo7KwrM19k58TV7xuX4lAy+EP+G
         YPqYqafSGxJohPCkhrqUnXYyyrVxTUksGVqHgAUFfTzp77G/mBd1ky02XLy89w1QyfpI
         Wqkw==
X-Forwarded-Encrypted: i=1; AJvYcCWLuXrp90qhUUhbqlQ0SiK5b3YrZY8smav30NBoZTv/vXIkeZqgYtS9hElkwwfra80z9J0l6vYUYVgRDnSqjqbECgA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTGgoHhlIrFbRnbAYnTl7LIcf+KtHFInc/ggH87EC/LqkDyCNr
	b9b5Tl4G1aPxl7MsnHU+QhNDdSJGIm+hhuFsWXtRg+KmMNlpLQsfXYzT
X-Gm-Gg: ASbGncsFXuEX9clkzobL116cQLbPgJI4LxgCq2WlEYwQQTSQv+DkSV0TJSTLC37slps
	pz+foSUvqd+WvyekqURHufej4oI4QRGhNF5cEbQABRfGzNlvdOC7RvpTBYpZUPwMednmVNgLk39
	vqVEga7NqQcTQORfnTMR6Cb18A4QllXMXYBdVZwzIcjSZhO6GtF8BCc6QxXD5iguMMkQW5IpZf/
	Z+13ax8BgEJqN/BkxDzTUXzSr2PHwflibvGLE39gjjPJX234e2YXTtQCO7YG9SdRs1LmPXtF2F7
	k8DjhhVfcd2/NEm0TD1adS0s0IB52vR1XGKYsTbVHIlrcaVy4y9FYCIxiOUcaXoCEiesN0ngkVy
	Jfah9ZM+FqfS6bDuBtIAoFZfdvmpEhJsvaYp4nNhKpjW+zHiCkA==
X-Google-Smtp-Source: AGHT+IFoqlL285cGj8IoybSuUvTqcYnweFEil7kJhByrXj4oQELBkEm3YuhpTo2bs2Ec8MrT0N0tTg==
X-Received: by 2002:a05:600c:a02:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-46fa9b052f2mr207491095e9.30.1760515302605;
        Wed, 15 Oct 2025 01:01:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe4esm26800445f8f.26.2025.10.15.01.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:01:42 -0700 (PDT)
Message-ID: <9ece7dc6-8f86-4b77-86d4-b25270528e56@gmail.com>
Date: Wed, 15 Oct 2025 10:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH V2] libnet: backport patch to
 remove configure time SOCK_PACKET check
To: guocai.he.cn@windriver.com, openembedded-devel@lists.openembedded.org
References: <9d4fbe3f-f7e0-4e2c-a5ea-ce2fe9387d39@gmail.com>
 <20251015023239.2742022-1-guocai.he.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251015023239.2742022-1-guocai.he.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 08:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120695

Thank you so much for the correction.
Just for your information, your first version was included in a previous
merge, and is a part of Kirkstone[1].

[1]:
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-connectivity/libnet?h=kirkstone&id=12824411988d10737a840a97336e1ba7c8e4f525

On 10/15/25 04:32, guocai.he.cn@windriver.com wrote:
> From: Guocai He <guocai.he.cn@windriver.com>
>
> Backport [1] to fix the do_configure error like below:
>
> checking for packet socket (PF_PACKET)... ./pf_packet-test:
> /lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.34' not found
>
> [1] https://github.com/libnet/libnet/commit/19979c4541ddcc817c64ea911a309ee71a8cc250
>
> Signed-off-by: Qi Chen <Qi.Chen@windriver.com>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
> V2:
> Correct the mail client's settings about charset
> ---
>  ...move-support-for-SOCK_PACKET-sockets.patch | 251 ++++++++++++++++++
>  .../libnet/libnet_1.2-rc3.bb                  |   1 +
>  2 files changed, 252 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch
>
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch b/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch
> new file mode 100644
> index 0000000000..2fc7ecd180
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch
> @@ -0,0 +1,251 @@
> +From dd77c43a9773edb895bfe9074315e83a19cac471 Mon Sep 17 00:00:00 2001
> +From: Guocai He <guocai.he.cn@windriver.com>
> +Date: Tue, 26 Aug 2025 06:15:41 +0000
> +Subject: [PATCH] Remove support for SOCK_PACKET sockets
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The current code has a build-time check to verify that PF_PACKET sockets
> +are supported on Linux systems and if not, fallback on SOCK_PACKET sockets.
> +
> +The test implementation relies on FTM (Feature Test Macros) to detect
> +glibc and its version to include correct headers.
> +But, some libc such as the musl libc do not have such macros, making the
> +test program compilation fail and libnet fallback on SOCK_PACKET.
> +
> +Since PF_PACKET support is present in kernel for more than 20 years now,
> +the simplest solution and safe choice is to just drop support for
> +SOCK_PACKET and assume PF_PACKET is always available on any Linux system.
> +
> +Signed-off-by: Hervé Boisse <admin@netgeek.ovh>
> +
> +Upstream-Status: Backport [19979c4541ddcc817c64ea911a309ee71a8cc250]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> +---
> + acinclude.m4            | 87 -----------------------------------------
> + configure.ac            |  3 --
> + src/libnet_link_linux.c | 19 +--------
> + win32/config.h          |  1 -
> + 4 files changed, 1 insertion(+), 109 deletions(-)
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 064b582..f8ab967 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -25,93 +25,6 @@ AC_DEFUN([AC_LIBNET_LINUX_PROCFS],
> +                   [Define if you have the Linux /proc filesystem.])
> +     fi])
> + 
> +-dnl
> +-dnl Checks to see if this linux kernel has a working PF_PACKET
> +-dnl
> +-dnl usage:
> +-dnl
> +-dnl     AC_LIBNET_CHECK_PF_PACKET
> +-dnl
> +-dnl results:
> +-dnl
> +-dnl     HAVE_PACKET_SOCKET (DEFINED)
> +-dnl
> +-
> +-AC_DEFUN([AC_LIBNET_CHECK_PF_PACKET],
> +-[
> +-    AC_MSG_CHECKING(for packet socket (PF_PACKET))
> +-    AC_CACHE_VAL(libnet_cv_have_packet_socket,
> +-
> +-        [
> +-    cat > pf_packet-test.c << EOF
> +-#include <stdio.h>
> +-#include <errno.h>
> +-#include <stdlib.h>
> +-#include <netinet/in.h>
> +-#include <sys/socket.h>
> +-#include <features.h>    /* for the glibc version number */
> +-#if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
> +-#include <netpacket/packet.h>
> +-#include <net/ethernet.h>     /* the L2 protocols */
> +-#else
> +-#include <asm/types.h>
> +-#include <linux/if_packet.h>
> +-#include <linux/if_ether.h>   /* The L2 protocols */
> +-#endif
> +- 
> +-#ifndef SOL_PACKET
> +-#define SOL_PACKET 263
> +-#endif  /* SOL_PACKET */
> +- 
> +-int
> +-main(int argc, char **argv)
> +-{
> +-    int fd;
> +- 
> +-    fd = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
> +-    if (fd == -1)
> +-    {
> +-        if (errno == EPERM)
> +-        {
> +-            /* user's UID != 0 */
> +-            printf("probably");
> +-            exit (EXIT_FAILURE);
> +-        }
> +-        printf("no");
> +-        exit (EXIT_FAILURE);
> +-    }
> +-    printf("yes");
> +-    exit (EXIT_SUCCESS);
> +-}
> +-EOF
> +-    ${CC-cc} -o pf_packet-test $CFLAGS pf_packet-test.c >/dev/null 2>&1
> +-
> +-    # Oopz 4.3 BSD doesn't have this.  Sorry.
> +-    if test ! -x ./pf_packet-test ; then
> +-        libnet_cv_have_packet_socket=choked
> +-    else
> +-        libnet_cv_have_packet_socket=`./pf_packet-test`;
> +-    fi
> +-    if test $libnet_cv_have_packet_socket = choked; then
> +-        AC_MSG_RESULT(test program compile choked... assuming no)
> +-    elif test $libnet_cv_have_packet_socket = yes; then
> +-        AC_MSG_RESULT(yes)
> +-    elif test $libnet_cv_have_packet_socket = probably; then
> +-        AC_MSG_RESULT(test program got EPERM... assuming yes)
> +-    elif test $libnet_cv_have_packet_socket = no; then
> +-        AC_MSG_RESULT(no)
> +-    fi
> +-
> +-    rm -f pf_packet-test* core core.pf_packet-test
> +-
> +-    ])
> +-
> +-    if test $libnet_cv_have_packet_socket = yes -o $libnet_cv_have_packet_socket = probably; then
> +-        AC_DEFINE(HAVE_PACKET_SOCKET, 1,
> +-          [Define if we're running on a Linux system with PF_PACKET sockets.])
> +-    fi
> +-])
> +-
> + dnl
> + dnl Looks for a previous libnet version and attempts to determine which verion
> + dnl it is.  Version 0.8 was the first version that actually knew internally
> +diff --git a/configure.ac b/configure.ac
> +index 4751f62..ad002b9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -51,7 +51,6 @@ AC_LIBNET_ENDIAN_CHECK
> + dnl AC_LBL_LIBRARY_NET
> + 
> + AC_SUBST(ENDIANESS)
> +-AC_SUBST(HAVE_PACKET_SOCKET)
> + AC_SUBST(ADDITIONAL_LIBS)
> + AC_SUBST(LIBNET_CONFIG_DEFINES)
> + AC_SUBST(LIBNET_CONFIG_LIBS)
> +@@ -87,7 +86,6 @@ if test -n "${with_link_layer}"; then
> +         snoop) AC_LIBOBJ([libnet_link_snoop]) ;;
> +         dlpi)  AC_LIBOBJ([libnet_link_dlpi]) ;;
> +         linux) AC_LIBOBJ([libnet_link_linux])
> +-	       AC_LIBNET_CHECK_PF_PACKET
> + 	       AC_LIBNET_LINUX_PROCFS ;;
> +         none) AC_LIBOBJ([libnet_link_none]) ;;
> +         *) AC_MSG_ERROR([Invalid link type "${with_link_layer}"]) ;;
> +@@ -115,7 +113,6 @@ elif test "${ac_cv_header_sys_dlpi_h}" = "yes" ; then
> + elif test "${ac_cv_header_linux_socket_h}" = "yes" ; then
> +     AC_LIBOBJ([libnet_link_linux])
> +     AC_MSG_RESULT(found link layer linux)
> +-    AC_LIBNET_CHECK_PF_PACKET
> +     AC_LIBNET_LINUX_PROCFS
> + elif test "${cross_compiling}" != "yes" -a -c /dev/bpf0 ; then           # check again in case not readable
> +     AC_LIBOBJ([libnet_link_bpf])
> +diff --git a/src/libnet_link_linux.c b/src/libnet_link_linux.c
> +index 3c6df3c..1dd2a42 100644
> +--- a/src/libnet_link_linux.c
> ++++ b/src/libnet_link_linux.c
> +@@ -33,13 +33,11 @@
> + #include <netinet/if_ether.h>
> + #include <net/if_arp.h>
> + 
> +-#if (HAVE_PACKET_SOCKET)
> + #ifndef SOL_PACKET
> + #define SOL_PACKET 263
> + #endif  /* SOL_PACKET */
> + #include <netpacket/packet.h>
> + #include <net/ethernet.h>     /* the L2 protocols */
> +-#endif  /* HAVE_PACKET_SOCKET */
> + 
> + #include "../include/libnet.h"
> + 
> +@@ -69,11 +67,8 @@ libnet_open_link(libnet_t *l)
> +         return (-1);
> +     } 
> + 
> +-#if (HAVE_PACKET_SOCKET)
> +     l->fd = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
> +-#else
> +-    l->fd = socket(PF_INET, SOCK_PACKET, htons(ETH_P_ALL));
> +-#endif
> ++    
> +     if (l->fd == -1)
> +     {
> +         if (errno == EPERM) {
> +@@ -177,7 +172,6 @@ libnet_close_link(libnet_t *l)
> + }
> + 
> + 
> +-#if (HAVE_PACKET_SOCKET)
> + static int
> + get_iface_index(int fd, const char *device)
> + {
> +@@ -194,18 +188,12 @@ get_iface_index(int fd, const char *device)
> +  
> +     return ifr.ifr_ifindex;
> + }
> +-#endif
> +-
> + 
> + int
> + libnet_write_link(libnet_t *l, const uint8_t *packet, uint32_t size)
> + {
> +     int c;
> +-#if (HAVE_PACKET_SOCKET)
> +     struct sockaddr_ll sa;
> +-#else
> +-    struct sockaddr sa;
> +-#endif
> + 
> +     if (l == NULL)
> +     { 
> +@@ -213,7 +201,6 @@ libnet_write_link(libnet_t *l, const uint8_t *packet, uint32_t size)
> +     }
> + 
> +     memset(&sa, 0, sizeof (sa));
> +-#if (HAVE_PACKET_SOCKET)
> +     sa.sll_family    = AF_PACKET;
> +     sa.sll_ifindex   = get_iface_index(l->fd, l->device);
> +     if (sa.sll_ifindex == -1)
> +@@ -221,10 +208,6 @@ libnet_write_link(libnet_t *l, const uint8_t *packet, uint32_t size)
> +         return (-1);
> +     }
> +     sa.sll_protocol  = htons(ETH_P_ALL);
> +-#else
> +-	strncpy(sa.sa_data, l->device, sizeof (sa.sa_data) - 1);
> +-    sa.sa_data[sizeof (sa.sa_data) - 1] = 0;
> +-#endif
> + 
> +     c = sendto(l->fd, packet, size, 0,
> +             (struct sockaddr *)&sa, sizeof (sa));
> +diff --git a/win32/config.h b/win32/config.h
> +index 926f12f..12e1ee7 100644
> +--- a/win32/config.h
> ++++ b/win32/config.h
> +@@ -11,7 +11,6 @@
> + #undef HAVE_HPUX11
> + #undef HAVE_SOCKADDR_SA_LEN
> + #undef HAVE_DLPI
> +-#undef HAVE_PACKET_SOCKET
> + #undef HAVE_STRUCT_IP_CSUM
> + #undef HAVE_LIB_PCAP
> + #undef STUPID_SOLARIS_CHECKSUM_BUG
> +-- 
> +2.35.5
> +
> diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
> index 785abf66d6..5e35fc3391 100644
> --- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
> +++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
> @@ -10,6 +10,7 @@ PROVIDES = "libnet-1.2rc2"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
>             file://0001-Support-musl-libc-remove-support-for-glibc-2.1.patch \
> +           file://0001-Remove-support-for-SOCK_PACKET-sockets.patch \
>            "
>  
>  SRC_URI[md5sum] = "f051e6e5bdecddb90f77c701c2ca1804"


