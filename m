Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB69CD3437
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 14:04:30 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.24032.1725372261162443978
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 07:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PXNFaiqG;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5df9343b5b8so3456703eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725372260; x=1725977060; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XHNK/9Ea+v0FrTezUUcCliax7mpVnX0A2OvZjzViS0=;
        b=PXNFaiqG3DYPZKDIf4gHldyhaiWcemESBcs6X/038afS22xHIhgUlYLErVqYFwMEvi
         eWEIlYICp3jUinecWFmTAPKHkqGTvPhpKpni1x2c7XYxH/UxzyXDVWrqIzn6V4Bdl1eR
         EKjlXqHe2sY3Poh1ThbezDOq/wtXMgaKArbuuP37HqWi817V8f0L1uuQOAZVeaooJmMp
         WO2dnQeUWznGTidPsnh5WS/EH67H0iY9zRTmkGb//CUwVR46yaD2OUhbc2jdLwI9/VSX
         y6v2dAL7hWWXqidqceVee473YsRejisKFosTEPZOsvjREgQO/Ir8gD/4cbOFhs1SNIWo
         2RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725372260; x=1725977060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XHNK/9Ea+v0FrTezUUcCliax7mpVnX0A2OvZjzViS0=;
        b=S4NwrAf71NO34OfhIsnKSA5cG0DyWbr7cUIfyG+gZzZ/04sHTzQkfTKt8xYtAq1ygr
         zuhe+njdkkhxOv+/EbWaBCBIHS8Y4iPh0N/+M1MoqCs7Gz/vU/6RfSwFB/meRlpf5psb
         UrBCDDRtNtzxLhafyRo8pHSoQBr4RCh1nMWOMMClbIrWchxHi/rpg5kUxsj230qkarbf
         WagLZYUZhDKXFU6zJxjqwsXW+M3BUHmCuzOse2s5vuRhfT+7fVFHRmpPdft975VRxcJm
         HfGnzk3lkye/jyUj2kGhvkTOODVRE1U11JLRHBaVdGaVG9dNvrGANIaD9c1kqCuOX+ol
         pBWQ==
X-Gm-Message-State: AOJu0YxXHGCVR9qq9hrOvAHX19sYrg07k4l1+h6vgTzQXlqCXX1uJSE0
	UWSfMKtKpdzz8urdyC0DDRokBvQHII1x/7W/9rg8TJC04T60xVFGwk5vDefek4dxyFqgkDZgq7t
	PQqYnkTSYVgWpSanu342/prlahJM=
X-Google-Smtp-Source: AGHT+IFCntDghRVFGVMU3ZK9PM8DsG7yV9iUYB61jMM79eA6FMWtyrF2kTJiPanlLp7kyGQ5k3KMVWHWpNNibeqE3z8=
X-Received: by 2002:a05:6870:330c:b0:261:19a6:41ae with SMTP id
 586e51a60fabf-27810c181a6mr3706435fac.30.1725372260122; Tue, 03 Sep 2024
 07:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240903045247.275642-1-changqing.li@windriver.com>
In-Reply-To: <20240903045247.275642-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2024 07:03:53 -0700
Message-ID: <CAMKF1sreQCYaJfH7iWN3-QF1i_c2gHgmB5ORiUw3d4BoofZEHA@mail.gmail.com>
Subject: Re: [oe] [scarthgap][PATCH] mariadb: fix runtime failure on riscv
To: changqing.li@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 14:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112080

do we need this on master as well ? if so please rebase on master-next
or master

On Mon, Sep 2, 2024 at 9:52=E2=80=AFPM Changqing Li via lists.openembedded.=
org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Starting with Linux 6.6, RDCYCLE is a privileged instruction on RISC-V
> and can't be used directly from userland. This causes 'systemctl start
> mysqld.service' failed with error:
> [ 1456.918172] mariadbd[12115]: unhandled signal 4 code 0x1 at 0x00005555=
8689d134 in mariadbd[555585bfa000+14a7000]
> [ 1456.921772] CPU: 1 PID: 12115 Comm: mariadbd Not tainted 6.6.43-yocto-=
standard #1
> [ 1456.922327] Hardware name: riscv-virtio,qemu (DT)
> [ 1456.923045] epc : 000055558689d134 ra : 000055558620ea48 sp : 00007fff=
dc487770
> [ 1456.923525]  gp : 00005555872ec400 tp : 00007fff89560780 t0 : 00005555=
87be32e8
> [ 1456.923951]  t1 : 0000555586886042 t2 : 000000002d6a89f0 s0 : 00007fff=
dc4877b0
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>  ...RISC-V-use-RDTIME-instead-of-RDCYCLE.patch | 66 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDT=
IME-instead-of-RDCYCLE.patch
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 33da32fb2..124a49ff9 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,6 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>             file://0001-Remove-the-compile_time_assert-lines.patch \
>             file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
> +           file://0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch \
>            "
>  SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
>  SRC_URI[sha256sum] =3D "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076=
b6ffe258110e5157"
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-ins=
tead-of-RDCYCLE.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-R=
DTIME-instead-of-RDCYCLE.patch
> new file mode 100644
> index 000000000..25a2c399c
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of=
-RDCYCLE.patch
> @@ -0,0 +1,66 @@
> +From 342f0dd9b4f9fc49dcb589cd98933ea330de55d8 Mon Sep 17 00:00:00 2001
> +From: Aurelien Jarno <aurelien@aurel32.net>
> +Date: Thu, 4 Jan 2024 11:30:34 +0100
> +Subject: [PATCH] RISC-V: use RDTIME instead of RDCYCLE
> +
> +Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on
> +RISC-V and can't be used directly from userland. There is a sysctl
> +option to change that as a transition period, but it will eventually
> +disappear.
> +
> +Use RDTIME instead, which while less accurate has the advantage of being
> +synchronized between CPU (and thus monotonic) and of constant frequency.
> +
> +[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3Dcc4c07c89aada16229084eeb93895c95b7eabaa3
> +
> +Upstream-Status: Backport [https://github.com/MariaDB/server/commit/656f=
8867720efc1b4dd0969319f35a3e1a2a005e]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + include/my_rdtsc.h | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/include/my_rdtsc.h b/include/my_rdtsc.h
> +index 8b9b0046bc0..21e44847d9a 100644
> +--- a/include/my_rdtsc.h
> ++++ b/include/my_rdtsc.h
> +@@ -111,7 +111,7 @@ C_MODE_START
> +   On AARCH64, we use the generic timer base register. We override clang
> +   implementation for aarch64 as it access a PMU register which is not
> +   guaranteed to be active.
> +-  On RISC-V, we use the rdcycle instruction to read from mcycle registe=
r.
> ++  On RISC-V, we use the rdtime instruction to read from mtime register.
> +
> +   Sadly, we have nothing for the Digital Alpha, MIPS, Motorola m68k,
> +   HP PA-RISC or other non-mainstream (or obsolete) processors.
> +@@ -211,15 +211,15 @@ static inline ulonglong my_timer_cycles(void)
> +   }
> + #elif defined(__riscv)
> +   #define MY_TIMER_ROUTINE_CYCLES MY_TIMER_ROUTINE_RISCV
> +-  /* Use RDCYCLE (and RDCYCLEH on riscv32) */
> ++  /* Use RDTIME (and RDTIMEH on riscv32) */
> +   {
> + # if __riscv_xlen =3D=3D 32
> +     ulong result_lo, result_hi0, result_hi1;
> +     /* Implemented in assembly because Clang insisted on branching. */
> +     __asm __volatile__(
> +-        "rdcycleh %0\n"
> +-        "rdcycle %1\n"
> +-        "rdcycleh %2\n"
> ++        "rdtimeh %0\n"
> ++        "rdtime %1\n"
> ++        "rdtimeh %2\n"
> +         "sub %0, %0, %2\n"
> +         "seqz %0, %0\n"
> +         "sub %0, zero, %0\n"
> +@@ -228,7 +228,7 @@ static inline ulonglong my_timer_cycles(void)
> +     return (static_cast<ulonglong>(result_hi1) << 32) | result_lo;
> + # else
> +     ulonglong result;
> +-    __asm __volatile__("rdcycle %0" : "=3Dr"(result));
> ++    __asm __volatile__("rdtime %0" : "=3Dr"(result));
> +     return result;
> +   }
> + # endif
> +--
> +2.25.1
> +
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112078): https://lists.openembedded.org/g/openembedde=
d-devel/message/112078
> Mute This Topic: https://lists.openembedded.org/mt/108240112/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

