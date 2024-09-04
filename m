Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B84CD37B8
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 00:47:34 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.39374.1725410851610238686
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 17:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Smbe8MoR;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e0059dc06bso1454801b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 17:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725410851; x=1726015651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0JNqEbSd3tovqbioODdNdayqa4JF5Sa+07pmpD8BZg=;
        b=Smbe8MoRAn/eFRBpXLJlwiESQgQCIuq1ngUiJFi50WO2F7hrWDMM4JarHb7VArM/Qq
         m+L5YjvlWq4UYDibBLNV+9oZc9Dgt2YkpT93opCF6bu0kHJQHiU5d4xhkWWkaWqryTGs
         n1w3NimefgFVfMwEO/379p/XjDzYpjHWltzNEuNtCaeDwxU2UAqy7GG/8FsTDFgxZwwq
         lADKT/FfLHv8MwNOBZppMB73h2EJInHHe3Hvt/KgFih0BLbjLEcQFBcFgcKgE5Bq2K+n
         rK1LVnMCyBQjtvLoVG+BEuF9Od+ydx/2JWVYJOjetEZq9/tD70JgW/8NAy7f/hkdLx8V
         Ra2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725410851; x=1726015651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0JNqEbSd3tovqbioODdNdayqa4JF5Sa+07pmpD8BZg=;
        b=ps/3LUIbZx1OHe7RKh5MsS8r2FgRXY2i7RTf1WXCOJSnyV06vr6qA3zGANR5Y814nt
         bSh093+Tz5Fv+KL9jnrNDRbCXmgx0i7PcQ/u+O50EEqBAR/3d/gmPzOQpWn/9jcqaXGM
         IoMHktqkXpgJFrA3RQOT57v2mfafhzs/+s2CIwFAzZHm0rBkP0W6U9p2gctzSA2+gR4E
         cp45BOt+Q2bf4B4C1ok+3xRdiAxAD/jYkiwA+PRgsvThl2XHWxxLvqEdWf1f2P4BOjca
         XTL62iUqQpNNVrrvMVwpxXHimPnammpz1kQLh10fdWLuriSOJMQ1vA8VMd7Sv2JAmm/W
         Pvtw==
X-Gm-Message-State: AOJu0YyT4+NLVu1KUzh4DfqZ3vo+H+IXaR8DeODIwfPtNjYvsGU/fKLR
	EBhrjoGb4SJcO1oAI0CStGgK9cgs1ClWhfzRzEWI14uU9dTzhbVYwOVutxMEQ5I0LIF/65wEe7f
	veCPo/vLXI97Z70/nR5AYXoe/p00=
X-Google-Smtp-Source: AGHT+IHrgpR3D3V0OjKPpNfk2moplVaHi5TrL50d5FZ+5635q2u8deqCO47pb25fAcRdXunf6ty6WGEoQ9kmTuiA2Z8=
X-Received: by 2002:a05:6870:96a9:b0:277:ea7b:dac3 with SMTP id
 586e51a60fabf-27810b249f3mr6126492fac.4.1725410850515; Tue, 03 Sep 2024
 17:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240903045247.275642-1-changqing.li@windriver.com>
 <CAMKF1sreQCYaJfH7iWN3-QF1i_c2gHgmB5ORiUw3d4BoofZEHA@mail.gmail.com> <556188c9-c36e-4654-98c5-600acc1933a4@windriver.com>
In-Reply-To: <556188c9-c36e-4654-98c5-600acc1933a4@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2024 17:47:19 -0700
Message-ID: <CAMKF1soJP_LTk6QxgQS4ypr9sNS59zro3rri_b=yNem5iHRCFw@mail.gmail.com>
Subject: Re: [oe] [scarthgap][PATCH] mariadb: fix runtime failure on riscv
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d631730621408447"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 00:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112083

--000000000000d631730621408447
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 5:15=E2=80=AFPM Changqing Li <changqing.li@windriver=
.com>
wrote:

>
> On 9/3/24 22:03, Khem Raj wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> do we need this on master as well ? if so please rebase on master-next
> or master
>
> No,  master is mariadb 10.11.9,  this issue is fixed since 10.11.8.
>

Yeah I realised thanks for confirmation

> //Changqing
>
> On Mon, Sep 2, 2024 at 9:52=E2=80=AFPM Changqing Li via lists.openembedde=
d.org<changqing.li=3Dwindriver.com@lists.openembedded.org> <changqing.li=3D=
windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.c=
om>
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
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@wi=
ndriver.com>
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
>            " <https://archive.mariadb.org/$%7BBP%7D/source/$%7BBP%7D.tar.=
gz%5Cfile://0001-Add-missing-includes-cstdint-and-cstdio.patch%5Cfile://000=
1-Remove-the-compile_time_assert-lines.patch%5Cfile://0001-MDEV-33439-Fix-b=
uild-with-libxml2-2.12.patch%5C+file://0001-RISC-V-use-RDTIME-instead-of-RD=
CYCLE.patch%5C>
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
> +From: Aurelien Jarno <aurelien@aurel32.net> <aurelien@aurel32.net>
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
> +Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@w=
indriver.com>
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
>
>

--000000000000d631730621408447
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 3, 2024 at 5:15=E2=80=AFPM Changqing Li &lt;<a =
href=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><u></u>

 =20
  <div text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div>On 9/3/24 22:03, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

do we need this on master as well ? if so please rebase on master-next
or master
</pre>
    </blockquote>
    <p>No,=C2=A0 master is mariadb 10.11.9,=C2=A0 this issue is fixed since
      10.11.8.</p></div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yeah I realised thanks for confirmation=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div text=3D"#000000" bgcolor=3D"#cceed0"><p dir=3D"auto">=
</p></div><div text=3D"#000000" bgcolor=3D"#cceed0">
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite">
      <pre>On Mon, Sep 2, 2024 at 9:52=E2=80=AFPM Changqing Li via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a>
<a href=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org" targ=
et=3D"_blank">&lt;changqing.li=3Dwindriver.com@lists.openembedded.org&gt;</=
a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

Starting with Linux 6.6, RDCYCLE is a privileged instruction on RISC-V
and can&#39;t be used directly from userland. This causes &#39;systemctl st=
art
mysqld.service&#39; failed with error:
[ 1456.918172] mariadbd[12115]: unhandled signal 4 code 0x1 at 0x0000555586=
89d134 in mariadbd[555585bfa000+14a7000]
[ 1456.921772] CPU: 1 PID: 12115 Comm: mariadbd Not tainted 6.6.43-yocto-st=
andard #1
[ 1456.922327] Hardware name: riscv-virtio,qemu (DT)
[ 1456.923045] epc : 000055558689d134 ra : 000055558620ea48 sp : 00007fffdc=
487770
[ 1456.923525]  gp : 00005555872ec400 tp : 00007fff89560780 t0 : 0000555587=
be32e8
[ 1456.923951]  t1 : 0000555586886042 t2 : 000000002d6a89f0 s0 : 00007fffdc=
4877b0

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 ...RISC-V-use-RDTIME-instead-of-RDCYCLE.patch | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIM=
E-instead-of-RDCYCLE.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc
index 33da32fb2..124a49ff9 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -25,6 +25,7 @@ SRC_URI =3D <a href=3D"https://archive.mariadb.org/$%7BBP=
%7D/source/$%7BBP%7D.tar.gz%5Cfile://0001-Add-missing-includes-cstdint-and-=
cstdio.patch%5Cfile://0001-Remove-the-compile_time_assert-lines.patch%5Cfil=
e://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch%5C+file://0001-RISC-V=
-use-RDTIME-instead-of-RDCYCLE.patch%5C" target=3D"_blank">&quot;https://ar=
chive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Remove-the-compile_time_assert-lines.patch \
            file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
+           file://0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch \
           &quot;</a>
 SRC_URI:append:libc-musl =3D <a>&quot; file://ppc-remove-glibc-dep.patch&q=
uot;</a>
 SRC_URI[sha256sum] =3D &quot;5239a245ed90517e96396605cd01ccd8f73cd7442d1b3=
076b6ffe258110e5157&quot;
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-inste=
ad-of-RDCYCLE.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDT=
IME-instead-of-RDCYCLE.patch
new file mode 100644
index 000000000..25a2c399c
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-R=
DCYCLE.patch
@@ -0,0 +1,66 @@
+From 342f0dd9b4f9fc49dcb589cd98933ea330de55d8 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <a href=3D"mailto:aurelien@aurel32.net" target=3D"_bl=
ank">&lt;aurelien@aurel32.net&gt;</a>
+Date: Thu, 4 Jan 2024 11:30:34 +0100
+Subject: [PATCH] RISC-V: use RDTIME instead of RDCYCLE
+
+Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on
+RISC-V and can&#39;t be used directly from userland. There is a sysctl
+option to change that as a transition period, but it will eventually
+disappear.
+
+Use RDTIME instead, which while less accurate has the advantage of being
+synchronized between CPU (and thus monotonic) and of constant frequency.
+
+[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3Dcc4c07c89aada16229084eeb93895c95b7eabaa3" target=3D"_b=
lank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Dcc4c07c89aada16229084eeb93895c95b7eabaa3</a>
+
+Upstream-Status: Backport [<a href=3D"https://github.com/MariaDB/server/co=
mmit/656f8867720efc1b4dd0969319f35a3e1a2a005e" target=3D"_blank">https://gi=
thub.com/MariaDB/server/commit/656f8867720efc1b4dd0969319f35a3e1a2a005e</a>=
]
+Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
+---
+ include/my_rdtsc.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/include/my_rdtsc.h b/include/my_rdtsc.h
+index 8b9b0046bc0..21e44847d9a 100644
+--- a/include/my_rdtsc.h
++++ b/include/my_rdtsc.h
+@@ -111,7 +111,7 @@ C_MODE_START
+   On AARCH64, we use the generic timer base register. We override clang
+   implementation for aarch64 as it access a PMU register which is not
+   guaranteed to be active.
+-  On RISC-V, we use the rdcycle instruction to read from mcycle register.
++  On RISC-V, we use the rdtime instruction to read from mtime register.
+
+   Sadly, we have nothing for the Digital Alpha, MIPS, Motorola m68k,
+   HP PA-RISC or other non-mainstream (or obsolete) processors.
+@@ -211,15 +211,15 @@ static inline ulonglong my_timer_cycles(void)
+   }
+ #elif defined(__riscv)
+   #define MY_TIMER_ROUTINE_CYCLES MY_TIMER_ROUTINE_RISCV
+-  /* Use RDCYCLE (and RDCYCLEH on riscv32) */
++  /* Use RDTIME (and RDTIMEH on riscv32) */
+   {
+ # if __riscv_xlen =3D=3D 32
+     ulong result_lo, result_hi0, result_hi1;
+     /* Implemented in assembly because Clang insisted on branching. */
+     __asm __volatile__(
+-        &quot;rdcycleh %0\n&quot;
+-        &quot;rdcycle %1\n&quot;
+-        &quot;rdcycleh %2\n&quot;
++        &quot;rdtimeh %0\n&quot;
++        &quot;rdtime %1\n&quot;
++        &quot;rdtimeh %2\n&quot;
+         &quot;sub %0, %0, %2\n&quot;
+         &quot;seqz %0, %0\n&quot;
+         &quot;sub %0, zero, %0\n&quot;
+@@ -228,7 +228,7 @@ static inline ulonglong my_timer_cycles(void)
+     return (static_cast&lt;ulonglong&gt;(result_hi1) &lt;&lt; 32) | resul=
t_lo;
+ # else
+     ulonglong result;
+-    __asm __volatile__(&quot;rdcycle %0&quot; : &quot;=3Dr&quot;(result))=
;
++    __asm __volatile__(&quot;rdtime %0&quot; : &quot;=3Dr&quot;(result));
+     return result;
+   }
+ # endif
+--
+2.25.1
+
--
2.46.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#112078): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112078" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/112078</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108240112/199=
7914" target=3D"_blank">https://lists.openembedded.org/mt/108240112/1997914=
</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-dev=
el/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000d631730621408447--

