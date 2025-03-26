Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F4FC3600B
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 14:42:50 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.24322.1743000166067916435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 07:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kLejAilI;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3fa58dc37c5so566280b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000165; x=1743604965; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUjTNXOPCqEE1mM0cWId/ZL/GYfUX3pAD8EtBRD0CAk=;
        b=kLejAilIPFTya/b15cNe7HXMd/45CX5QYNwbBJ+b9ZppopZd0o+X9zOQF+guB8+ClC
         S1BetO8txdD3+7W7Hb2n7s8CCYAVp7xGi6XplvwhoqhOSvRZUQZCjlgo6AK7aLSpcu/j
         3piBQPtp3evFbOU58LTcBPaaMKOmIall6ZQNnNXmcqPH7zGH/Cg+RexQ8iM2A5uQa+Eb
         lz0q1OLcspGr51kVeV1XVJ5xMTwZ5M05MsmZd6OUT7COnjXKd5FLQB38HtgHGw2LeYrO
         yoFypkHCgdrfx3pGeczAw0iLUNzZjOHMoujK01B3uanljXmgUOjUJBJ8oS/DbuEUlrpv
         6bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000165; x=1743604965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUjTNXOPCqEE1mM0cWId/ZL/GYfUX3pAD8EtBRD0CAk=;
        b=JZLZcd30hyceC8SKzVExtEr5WvkcuLpoaKZ8xeIC6KkvuU5GOdcm0o7o2tjqkqZeCY
         NzO5zULeBQWiUj3i9WmysAcywt0gek/zl4lYdc0Gm+Eu2uzgFXcy9T6OSc2LP5WfClkM
         X30NlZtfahzWDHG4BT9zLZgRODiZfeNdG+xxlvdDnWLw+opo/FjmGWze1D6dNlJWr4sF
         6ErQ+9kLb+vrfhf0BFMWk0aQAssxT9PBuCsBlqLt1uyVhRj7oIGr2jZLdbcobvmPCWLC
         M4bBqdTVg+DOn3mEQ9pckkMVJr0x7dpeOklkxo67dngu6g3bxd0TJc+5YPz/7e3ldh8W
         ofjQ==
X-Gm-Message-State: AOJu0YwGZWVKZmoI0SMpPmscKO22c9s+T80EeMuJGEUIVVoMOZKu4AJT
	kiFDDfoSW5u3Bzuh5bfv4c+O5EfUOJ2tUN12NGJThbTLmNuppIo2Aa3Xl5xUIF6uTWSRnyxEofY
	uwgQbTvx5bqhGxzNrZVC7+Xt8V0E=
X-Gm-Gg: ASbGnctxSOOoFBqNilzXpgki2tcAODkOOsBFuThBYlQRo/GUGAnol5pRIwetfJ9ZzOZ
	qdYlAcpVP6Ihn046fJyF8SmP9BH/UpSEB2s99iqR+Fifq6M4if5USSgtO6wf/3rK4nCPihZceyR
	2tarLgNJM+r+BIIF/NL+tyOItU
X-Google-Smtp-Source: AGHT+IHMoPxSO8/aCsjAipAibpo8nc6iiXIFIBb/yM2wttZqIGXyBN9TvqBZnzCbRJDEmyh67fG2Xl0IS1gXjLX+4aw=
X-Received: by 2002:a05:6808:189b:b0:3f9:aeb6:6e92 with SMTP id
 5614622812f47-3feef102ceemr2585001b6e.9.1743000164978; Wed, 26 Mar 2025
 07:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250326114318.1272291-1-mark.yang@lge.com>
In-Reply-To: <20250326114318.1272291-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2025 07:42:18 -0700
X-Gm-Features: AQ5f1JojHRuuFf14YEgFn9FtCKdupwqoPXutwV99YSwtIkIj2JwOXvCyvI5wgFQ
Message-ID: <CAMKF1srfdGhxYN48NRx1_xnoGPSZNYBznmczExNULe+wUa9k1w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] crash: fix build with gcc-15
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 14:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116296

is this same as the 2/2 patch in series you sent earlier ?

https://patchwork.yoctoproject.org/project/oe/list/?series=3D32971

On Wed, Mar 26, 2025 at 4:43=E2=80=AFAM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * to fix: following erros occured in gcc-15.0.1 environment.
> signals.c: In function '_rl_signal_handler':
> signals.c:62:36: error: 'return' with a value, in function returning void=
 [-Wreturn-mismatch]
>    62 | #  define SIGHANDLER_RETURN return (0)
>       |                                    ^
> signals.c:160:3: note: in expansion of macro 'SIGHANDLER_RETURN'
>   160 |   SIGHANDLER_RETURN;
>       |   ^~~~~~~~~~~~~~~~~
> signals.c:141:1: note: declared here
>   141 | _rl_signal_handler (int sig)
>       | ^~~~~~~~~~~~~~~~~~
> signals.c: In function 'rl_set_sighandler':
> signals.c:343:18: error: assignment to '__sighandler_t' {aka 'void (*)(in=
t)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointe=
r-types]
>   343 |   act.sa_handler =3D handler;
>       |                  ^
> In file included from signals.c:30:
> recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declare=
d here
>    72 | typedef void (*__sighandler_t) (int);
>       |                ^~~~~~~~~~~~~~
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta-oe/recipes-kernel/crash/crash.inc        |   3 +
>  ...sk-to-better-support-gdb-stack-unwin.patch |  85 +++++++++++
>  ...03-Fix-build-failure-in-readline-lib.patch | 136 ++++++++++++++++++
>  ...se-keywords-nullptr-as-a-variable-in.patch |  60 ++++++++
>  4 files changed, 284 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac=
-mask-to-better-support-gdb-stack-unwin.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash/0003-Fix-build-fai=
lure-in-readline-lib.patch
>  create mode 100644 meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-no=
t-use-keywords-nullptr-as-a-variable-in.patch
>
> diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-ker=
nel/crash/crash.inc
> index 3d712592df..6425c4ba7a 100644
> --- a/meta-oe/recipes-kernel/crash/crash.inc
> +++ b/meta-oe/recipes-kernel/crash/crash.inc
> @@ -23,6 +23,9 @@ SRC_URI =3D "git://github.com/crash-utility/${BPN}.git;=
branch=3Dmaster;protocol=3Dhttp
>             file://donnot-extract-gdb-during-do-compile.patch \
>             file://gdb_build_jobs_and_not_write_crash_target.patch \
>             file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.pat=
ch \
> +           file://0002-arm64-add-pac-mask-to-better-support-gdb-stack-un=
win.patch \
> +           file://0003-Fix-build-failure-in-readline-lib.patch \
> +           file://0004-tools.c-do-not-use-keywords-nullptr-as-a-variable=
-in.patch \
>             "
>  SRCREV =3D "f13853cef53f5c5463a51021edbc81977e2b1405"
>
> diff --git a/meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac-mask-t=
o-better-support-gdb-stack-unwin.patch b/meta-oe/recipes-kernel/crash/crash=
/0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch
> new file mode 100644
> index 0000000000..42a585d366
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac-mask-to-bette=
r-support-gdb-stack-unwin.patch
> @@ -0,0 +1,85 @@
> +From 0f39e33d3504f3a17b83574c3be97640460b7eef Mon Sep 17 00:00:00 2001
> +From: "Guanyou.Chen" <chenguanyou@xiaomi.com>
> +Date: Wed, 25 Dec 2024 23:50:28 +0800
> +Subject: [PATCH] arm64: add pac mask to better support gdb stack unwind
> +
> +Currently, gdb passthroughs of 'bt', 'frame', 'up', 'down',
> +'info, locals' don't work on arm64 machine enabled pauth.
> +This is because gdb does not know the lr register actual values
> +to unwind the stack frames.
> +
> +Without the patch:
> +    crash> gdb bt
> +    #0  __switch_to (prev=3D0xffffff8001af92c0, next=3D0xffffff889da7a58=
0) at /proc/self/cwd/common/arch/arm64/kernel/process.c:569
> +    #1  0x9fc5c5d3602132c0 in ?? ()
> +    Backtrace stopped: previous frame identical to this frame (corrupt s=
tack?)
> +
> +With the patch:
> +    crash> gdb bt
> +    #0  __switch_to (prev=3Dprev@entry=3D0xffffff8001af92c0, next=3Dnext=
@entry=3D0xffffff889da7a580) at /proc/self/cwd/common/arch/arm64/kernel/pro=
cess.c:569
> +    #1  0xffffffd3602132c0 in context_switch (rq=3D0xffffff8a7295a080, p=
rev=3D0xffffff8001af92c0, next=3D0xffffff889da7a580, rf=3D<optimized out>) =
at /proc/self/cwd/common/kernel/sched/core.c:5515
> +    #2  __schedule (sched_mode=3D<optimized out>, sched_mode@entry=3D214=
7859424) at /proc/self/cwd/common/kernel/sched/core.c:6843
> +    #3  0xffffffd3602136d8 in schedule () at /proc/self/cwd/common/kerne=
l/sched/core.c:6917
> +    ...
> +
> +Signed-off-by: Guanyou.Chen <chenguanyou@xiaomi.com>
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +
> +Upstream-Status: Backport [0f39e33 arm64: add pac mask to better support=
 gdb stack unwind]
> +---
> + gdb-10.2.patch  | 23 +++++++++++++++++++++++
> + gdb_interface.c | 10 ++++++++++
> + 2 files changed, 33 insertions(+)
> +
> +diff --git a/gdb-10.2.patch b/gdb-10.2.patch
> +index c867660..fd6fadb 100644
> +--- a/gdb-10.2.patch
> ++++ b/gdb-10.2.patch
> +@@ -16216,3 +16216,26 @@ exit 0
> +           printf_filtered (_("Backtrace stopped: %s\n"),
> +                            frame_stop_reason_string (trailing));
> +       }
> ++--- gdb-10.2/gdb/frame.c.orig
> +++++ gdb-10.2/gdb/frame.c
> ++@@ -944,6 +944,10 @@ frame_find_by_id (struct frame_id id)
> ++   return NULL;
> ++ }
> ++
> +++#ifdef CRASH_MERGE
> +++extern "C" void crash_decode_ptrauth_pc(ulong* pc);
> +++#endif
> +++
> ++ static CORE_ADDR
> ++ frame_unwind_pc (struct frame_info *this_frame)
> ++ {
> ++@@ -974,6 +978,9 @@ frame_unwind_pc (struct frame_info *this_frame)
> ++       try
> ++      {
> ++        pc =3D gdbarch_unwind_pc (prev_gdbarch, this_frame);
> +++#ifdef CRASH_MERGE
> +++       crash_decode_ptrauth_pc(&pc);
> +++#endif
> ++        pc_p =3D true;
> ++      }
> ++       catch (const gdb_exception_error &ex)
> +diff --git a/gdb_interface.c b/gdb_interface.c
> +index 315711e..e108d09 100644
> +--- a/gdb_interface.c
> ++++ b/gdb_interface.c
> +@@ -1083,3 +1083,13 @@ int crash_get_current_task_reg (int regno, const =
char *regname,
> +       return machdep->get_current_task_reg(regno, regname, regsize, val=
ue);
> + }
> +
> ++/* arm64 kernel lr maybe has patuh */
> ++void crash_decode_ptrauth_pc(ulong *pc);
> ++void crash_decode_ptrauth_pc(ulong *pc)
> ++{
> ++#ifdef ARM64
> ++      struct machine_specific *ms =3D machdep->machspec;
> ++      if (is_kernel_text(*pc | ms->CONFIG_ARM64_KERNELPACMASK))
> ++              *pc |=3D ms->CONFIG_ARM64_KERNELPACMASK;
> ++#endif /* !ARM64 */
> ++}
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash/0003-Fix-build-failure-in=
-readline-lib.patch b/meta-oe/recipes-kernel/crash/crash/0003-Fix-build-fai=
lure-in-readline-lib.patch
> new file mode 100644
> index 0000000000..f3318b3a6a
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0003-Fix-build-failure-in-readli=
ne-lib.patch
> @@ -0,0 +1,136 @@
> +From 772fbb1022911410b5fb773fde37910fc8286041 Mon Sep 17 00:00:00 2001
> +From: Lianbo Jiang <lijiang@redhat.com>
> +Date: Fri, 24 Jan 2025 16:12:40 +0800
> +Subject: [PATCH] Fix build failure in readline lib
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This is a backported patch from gdb upstream, see the commit
> +425f843d58c5 ("Import GNU Readline 8.2"), and only backported
> +patch related to compilation errors.
> +
> +Without the patch:
> +
> +  signals.c: In function =E2=80=98_rl_handle_signal=E2=80=99:
> +  signals.c:62:36: error: =E2=80=98return=E2=80=99 with a value, in func=
tion returning void [-Wreturn-mismatch]
> +     62 | #  define SIGHANDLER_RETURN return (0)
> +        |                                    ^
> +  signals.c:290:3: note: in expansion of macro =E2=80=98SIGHANDLER_RETUR=
N=E2=80=99
> +    290 |   SIGHANDLER_RETURN;
> +        |   ^~~~~~~~~~~~~~~~~
> +  signals.c:178:1: note: declared here
> +    178 | _rl_handle_signal (int sig)
> +        | ^~~~~~~~~~~~~~~~~
> +  signals.c: In function =E2=80=98rl_sigwinch_handler=E2=80=99:
> +  signals.c:306:32: error: passing argument 2 of =E2=80=98rl_set_sighand=
ler=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-types]
> +    306 |   rl_set_sighandler (SIGWINCH, rl_sigwinch_handler, &dummy_win=
ch);
> +        |                                ^~~~~~~~~~~~~~~~~~~
> +        |                                |
> +        |                                void (*)(int)
> +  In file included from rldefs.h:31,
> +                   from signals.c:37:
> +  signals.c:81:51: note: expected =E2=80=98void (*)(void)=E2=80=99 but a=
rgument is of type =E2=80=98void (*)(int)=E2=80=99
> +     81 | static SigHandler *rl_set_sighandler PARAMS((int, SigHandler *=
, sighandler_cxt *));
> +
> +Note: the current build failure was observed on gcc (GCC) 15.0.0.
> +
> +Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +
> +Upstream-Status: Backport [772fbb1 Fix build failure in readline lib]
> +---
> + gdb-10.2.patch | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 82 insertions(+)
> +
> +diff --git a/gdb-10.2.patch b/gdb-10.2.patch
> +index fd6fadb..8f5d7db 100644
> +--- a/gdb-10.2.patch
> ++++ b/gdb-10.2.patch
> +@@ -16239,3 +16239,85 @@ exit 0
> +         pc_p =3D true;
> +       }
> +        catch (const gdb_exception_error &ex)
> ++--- gdb-10.2/readline/readline/signals.c.orig
> +++++ gdb-10.2/readline/readline/signals.c
> ++@@ -48,23 +48,11 @@
> ++
> ++ #if defined (HANDLE_SIGNALS)
> ++
> ++-#if !defined (RETSIGTYPE)
> ++-#  if defined (VOID_SIGHANDLER)
> ++-#    define RETSIGTYPE void
> ++-#  else
> ++-#    define RETSIGTYPE int
> ++-#  endif /* !VOID_SIGHANDLER */
> ++-#endif /* !RETSIGTYPE */
> ++-
> ++-#if defined (VOID_SIGHANDLER)
> ++-#  define SIGHANDLER_RETURN return
> ++-#else
> ++-#  define SIGHANDLER_RETURN return (0)
> ++-#endif
> +++#define SIGHANDLER_RETURN return
> ++
> ++ /* This typedef is equivalent to the one for Function; it allows us
> ++    to say SigHandler *foo =3D signal (SIGKILL, SIG_IGN); */
> ++-typedef RETSIGTYPE SigHandler ();
> +++typedef void SigHandler (int);
> ++
> ++ #if defined (HAVE_POSIX_SIGNALS)
> ++ typedef struct sigaction sighandler_cxt;
> ++@@ -78,12 +66,12 @@ typedef struct { SigHandler *sa_handler; int sa_mas=
k, sa_flags; } sighandler_cxt
> ++ #  define SA_RESTART 0
> ++ #endif
> ++
> ++-static SigHandler *rl_set_sighandler PARAMS((int, SigHandler *, sighan=
dler_cxt *));
> ++-static void rl_maybe_set_sighandler PARAMS((int, SigHandler *, sighand=
ler_cxt *));
> ++-static void rl_maybe_restore_sighandler PARAMS((int, sighandler_cxt *)=
);
> +++static SigHandler *rl_set_sighandler (int, SigHandler *, sighandler_cx=
t *);
> +++static void rl_maybe_set_sighandler (int, SigHandler *, sighandler_cxt=
 *);
> +++static void rl_maybe_restore_sighandler (int, sighandler_cxt *);
> ++
> ++-static RETSIGTYPE rl_signal_handler PARAMS((int));
> ++-static RETSIGTYPE _rl_handle_signal PARAMS((int));
> +++static void rl_signal_handler (int);
> +++static void _rl_handle_signal (int);
> ++
> ++ /* Exported variables for use by applications. */
> ++
> ++@@ -137,7 +125,7 @@ void *_rl_sigcleanarg;
> ++ /* Readline signal handler functions. */
> ++
> ++ /* Called from RL_CHECK_SIGNALS() macro */
> ++-RETSIGTYPE
> +++void
> ++ _rl_signal_handler (int sig)
> ++ {
> ++   _rl_caught_signal =3D 0;     /* XXX */
> ++@@ -160,7 +148,7 @@ _rl_signal_handler (int sig)
> ++   SIGHANDLER_RETURN;
> ++ }
> ++
> ++-static RETSIGTYPE
> +++static void
> ++ rl_signal_handler (int sig)
> ++ {
> ++   if (_rl_interrupt_immediately)
> ++@@ -174,7 +162,7 @@ rl_signal_handler (int sig)
> ++   SIGHANDLER_RETURN;
> ++ }
> ++
> ++-static RETSIGTYPE
> +++static void
> ++ _rl_handle_signal (int sig)
> ++ {
> ++ #if defined (HAVE_POSIX_SIGNALS)
> ++@@ -291,7 +279,7 @@ _rl_handle_signal (int sig)
> ++ }
> ++
> ++ #if defined (SIGWINCH)
> ++-static RETSIGTYPE
> +++static void
> ++ rl_sigwinch_handler (int sig)
> ++ {
> ++   SigHandler *oh;
> +
> diff --git a/meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-not-use-k=
eywords-nullptr-as-a-variable-in.patch b/meta-oe/recipes-kernel/crash/crash=
/0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch
> new file mode 100644
> index 0000000000..e4bd4cd3a9
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-not-use-keywords=
-nullptr-as-a-variable-in.patch
> @@ -0,0 +1,60 @@
> +From 325a9d1b3b4ce76bf4556235c885e619e219622c Mon Sep 17 00:00:00 2001
> +From: Lianbo Jiang <lijiang@redhat.com>
> +Date: Fri, 24 Jan 2025 15:32:59 +0800
> +Subject: [PATCH] tools.c: do not use keywords 'nullptr' as a variable in=
 code
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Without the patch:
> +
> +  tools.c: In function =E2=80=98drop_core=E2=80=99:
> +  tools.c:6251:23: error: expected identifier or =E2=80=98(=E2=80=99 bef=
ore =E2=80=98nullptr=E2=80=99
> +   6251 |         volatile int *nullptr;
> +        |                       ^~~~~~~
> +  tools.c:6259:17: error: lvalue required as left operand of assignment
> +   6259 |         nullptr =3D NULL;
> +        |                 ^
> +  tools.c:6261:21: error: invalid type argument of unary =E2=80=98*=E2=
=80=99 (have =E2=80=98typeof (nullptr)=E2=80=99)
> +   6261 |                 i =3D *nullptr;
> +        |                     ^~~~~~~~
> +  make[6]: *** [Makefile:345: tools.o] Error 1
> +
> +Note: this was observed on gcc version 15.0.1
> +
> +Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +
> +Upstream-Status: Backport [325a9d1 tools.c: do not use keywords 'nullptr=
' as a variable in code]
> +---
> + tools.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/tools.c b/tools.c
> +index 85d8b6f..c9305be 100644
> +--- a/tools.c
> ++++ b/tools.c
> +@@ -6248,7 +6248,7 @@ lowest_bit_long(ulong val)
> + void
> + drop_core(char *s)
> + {
> +-      volatile int *nullptr;
> ++      volatile int *ptr;
> +       int i ATTRIBUTE_UNUSED;
> +
> +       if (s && ascii_string(s))
> +@@ -6256,9 +6256,9 @@ drop_core(char *s)
> +
> +       kill((pid_t)pc->program_pid, 3);
> +
> +-      nullptr =3D NULL;
> ++      ptr =3D NULL;
> +       while (TRUE)
> +-              i =3D *nullptr;
> ++              i =3D *ptr;
> + }
> +
> +
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116295): https://lists.openembedded.org/g/openembedde=
d-devel/message/116295
> Mute This Topic: https://lists.openembedded.org/mt/111914975/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

