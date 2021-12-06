Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902A0C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 06:33:42 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.48039.1638772421855482294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Dec 2021 22:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ATx9xbMO;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id a2so9848762qtx.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Dec 2021 22:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ai5B/y7Ndby6bzdy+2M2IMgdvSp0YsaXep9RqwRzx6g=;
        b=ATx9xbMO5UhNPulaRiD2Fct0soN3/yaf6wUxfqFjkEkwMTFij5sfAvG5DvKar4yDdJ
         zwFfylFDXlW0MhetTbhGujO5QkS1047dQ1oPqz8aF5SMiDq+9y/5ugqehKPJKObl5e8B
         h2oHWwUnYIhEftMQV4kZpHFyvjqTA7lJqhJyqFmdmTgqB2VZUTuG+mBK5964tEn854j1
         4wYAJwSzW8dGNBZm7HcF7JEfwPKU0yVOOAYpJ7YlUuyVG9yTMRpyY2bJwFg/MOkbUe/z
         TO8hsF0xuYIKqL6g12+u7fZ6EqeZQU1UaX0pn6e2Zd9poTcmvEPNxrSU76esXCAuoxor
         tw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ai5B/y7Ndby6bzdy+2M2IMgdvSp0YsaXep9RqwRzx6g=;
        b=RQD6TY5/1+07Fy/DLWsSC9BkWPs2BquL4Ni9oSY3CoBshuCk0zC8Psuh7rijXBHLwg
         QsOB1LGkKtx/FiiI3drLtXhzGOwenBnzUhr5CibMC+z2mN0ImIV+Qa6DuO1uXSfxDQmZ
         VIeCbJs0xOUXRGfpbCywp+24ng/8koWMsx9kmyj0o/AvoxwttN+yuOFwxbGtT2QUjC+R
         MxU+4JfNkeFOhBCeWlZ7LtHviZhNTx7U7SUbMky5LMFw4fTE9KlGmO3zShcuU8nW3s2J
         n87PsCH0GKgK4DnqOK1NA+SwNU8eCvHZzL7dt3kFVsxMU3+qRbyQipNUIHzJzKPVEI4G
         lLYQ==
X-Gm-Message-State: AOAM531rLgY2hCwkrntVUcdcVk1vQYERMADp9IBZTI0JLZDrzN2rft7O
	F6agxuN++x26Xj/PCKyJsuVHfiqKswKrySJjoqKBE5gukEA=
X-Google-Smtp-Source: 
 ABdhPJzOwbkYGBZjR3T6pGoy3/hjZNS7mbcpNaPa0A/mlnZGg5EmiBufaiwyHCVLIe+CuVLowuKPwTxeh6Gc76/PWvc=
X-Received: by 2002:ac8:7f4d:: with SMTP id
 g13mr37496528qtk.215.1638772420714;
 Sun, 05 Dec 2021 22:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20211206062630.1314-1-matthias@extraklein.de>
In-Reply-To: <20211206062630.1314-1-matthias@extraklein.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Dec 2021 22:33:14 -0800
Message-ID: 
 <CAMKF1srrCUk2ffzDrdDHxcYhEGKhZAU-V0gOs8JXGaEA--K2jA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gdb: fix aarch64 remote debugging gdb/28355
To: Matthias Klein <matthias@extraklein.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Dec 2021 06:33:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94213

please submit this to openembedded-core mailing list as gdb is part of oe-core.

On Sun, Dec 5, 2021 at 10:27 PM Matthias Klein <matthias@extraklein.de> wrote:
>
> The raspberry3-64 machine from meta-raspberrypi is affected by this bug.
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=28355
> https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=eb79b2318066cafb75ffdce310e3bbd44f7c79e3
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=7fd8546853e3f0333ba8d8238413aba7eb45c69f
>
> Signed-off-by: Matthias Klein <matthias@extraklein.de>
> ---
>  meta/recipes-devtools/gdb/gdb-11.1.inc        |   1 +
>  ...erver-register-set-selection-dynamic.patch | 317 ++++++++++++++++++
>  2 files changed, 318 insertions(+)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch
>
> diff --git a/meta/recipes-devtools/gdb/gdb-11.1.inc b/meta/recipes-devtools/gdb/gdb-11.1.inc
> index 686627926d..a480997220 100644
> --- a/meta/recipes-devtools/gdb/gdb-11.1.inc
> +++ b/meta/recipes-devtools/gdb/gdb-11.1.inc
> @@ -15,5 +15,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0008-resolve-restrict-keyword-conflict.patch \
>             file://0009-Fix-invalid-sigprocmask-call.patch \
>             file://0010-gdbserver-ctrl-c-handling.patch \
> +           file://0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch \
>             "
>  SRC_URI[sha256sum] = "cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94"
> diff --git a/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch b/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch
> new file mode 100644
> index 0000000000..6fc1859391
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch
> @@ -0,0 +1,317 @@
> +From eb79b2318066cafb75ffdce310e3bbd44f7c79e3 Mon Sep 17 00:00:00 2001
> +From: Luis Machado <luis.machado@linaro.org>
> +Date: Fri, 29 Oct 2021 14:54:36 -0300
> +Subject: [PATCH] [AArch64] Make gdbserver register set selection dynamic
> +
> +The current register set selection mechanism for AArch64 is static, based
> +on a pre-populated array of register sets.
> +
> +This means that we might potentially probe register sets that are not
> +available. This is OK if the kernel errors out during ptrace, but probing the
> +tag_ctl register, for example, does not result in a ptrace error if the kernel
> +supports the tagged address ABI but not MTE (PR 28355).
> +
> +Making the register set selection dynamic, based on feature checks, solves
> +this and simplifies the code a bit. It allows us to list all of the register
> +sets only once, and pick and choose based on HWCAP/HWCAP2 or other properties.
> +
> +gdb/ChangeLog:
> +
> +2021-11-03  Luis Machado  <luis.machado@linaro.org>
> +
> +       PR gdb/28355
> +
> +       * arch/aarch64.h (struct aarch64_features): New struct.
> +
> +gdbserver/ChangeLog:
> +
> +2021-11-03  Luis Machado  <luis.machado@linaro.org>
> +
> +       PR gdb/28355
> +
> +       * linux-aarch64-low.cc (is_sve_tdesc): Remove.
> +       (aarch64_target::low_arch_setup): Rework to adjust the register sets.
> +       (aarch64_regsets): Update to list all register sets.
> +       (aarch64_regsets_info, regs_info_aarch64): Replace NULL with nullptr.
> +       (aarch64_sve_regsets, aarch64_sve_regsets_info)
> +       (regs_info_aarch64_sve): Remove.
> +       (aarch64_adjust_register_sets): New.
> +       (aarch64_target::get_regs_info): Remove references to removed structs.
> +       (initialize_low_arch): Likewise.
> +
> +[ChangeLog entry stripped so that patch applies cleanly]
> +Upstream-Status: Accepted
> +---
> +
> +diff --git a/gdb/arch/aarch64.h b/gdb/arch/aarch64.h
> +index 0eb702c5b5e..95edb664b55 100644
> +--- a/gdb/arch/aarch64.h
> ++++ b/gdb/arch/aarch64.h
> +@@ -22,6 +22,15 @@
> +
> + #include "gdbsupport/tdesc.h"
> +
> ++/* Holds information on what architectural features are available.  This is
> ++   used to select register sets.  */
> ++struct aarch64_features
> ++{
> ++  bool sve = false;
> ++  bool pauth = false;
> ++  bool mte = false;
> ++};
> ++
> + /* Create the aarch64 target description.  A non zero VQ value indicates both
> +    the presence of SVE and the Vector Quotient - the number of 128bit chunks in
> +    an SVE Z register.  HAS_PAUTH_P indicates the presence of the PAUTH
> +diff --git a/gdbserver/linux-aarch64-low.cc b/gdbserver/linux-aarch64-low.cc
> +index daccfef746e..9a8cb4169a7 100644
> +--- a/gdbserver/linux-aarch64-low.cc
> ++++ b/gdbserver/linux-aarch64-low.cc
> +@@ -196,16 +196,6 @@ is_64bit_tdesc (void)
> +   return register_size (regcache->tdesc, 0) == 8;
> + }
> +
> +-/* Return true if the regcache contains the number of SVE registers.  */
> +-
> +-static bool
> +-is_sve_tdesc (void)
> +-{
> +-  struct regcache *regcache = get_thread_regcache (current_thread, 0);
> +-
> +-  return tdesc_contains_feature (regcache->tdesc, "org.gnu.gdb.aarch64.sve");
> +-}
> +-
> + static void
> + aarch64_fill_gregset (struct regcache *regcache, void *buf)
> + {
> +@@ -680,40 +670,6 @@ aarch64_target::low_new_fork (process_info *parent,
> +   *child->priv->arch_private = *parent->priv->arch_private;
> + }
> +
> +-/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
> +-#define AARCH64_HWCAP_PACA (1 << 30)
> +-
> +-/* Implementation of linux target ops method "low_arch_setup".  */
> +-
> +-void
> +-aarch64_target::low_arch_setup ()
> +-{
> +-  unsigned int machine;
> +-  int is_elf64;
> +-  int tid;
> +-
> +-  tid = lwpid_of (current_thread);
> +-
> +-  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
> +-
> +-  if (is_elf64)
> +-    {
> +-      uint64_t vq = aarch64_sve_get_vq (tid);
> +-      unsigned long hwcap = linux_get_hwcap (8);
> +-      unsigned long hwcap2 = linux_get_hwcap2 (8);
> +-      bool pauth_p = hwcap & AARCH64_HWCAP_PACA;
> +-      /* MTE is AArch64-only.  */
> +-      bool mte_p = hwcap2 & HWCAP2_MTE;
> +-
> +-      current_process ()->tdesc
> +-      = aarch64_linux_read_description (vq, pauth_p, mte_p);
> +-    }
> +-  else
> +-    current_process ()->tdesc = aarch32_linux_read_description ();
> +-
> +-  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
> +-}
> +-
> + /* Wrapper for aarch64_sve_regs_copy_to_reg_buf.  */
> +
> + static void
> +@@ -730,21 +686,36 @@ aarch64_sve_regs_copy_from_regcache (struct regcache *regcache, void *buf)
> +   return aarch64_sve_regs_copy_from_reg_buf (regcache, buf);
> + }
> +
> ++/* Array containing all the possible register sets for AArch64/Linux.  During
> ++   architecture setup, these will be checked against the HWCAP/HWCAP2 bits for
> ++   validity and enabled/disabled accordingly.
> ++
> ++   Their sizes are set to 0 here, but they will be adjusted later depending
> ++   on whether each register set is available or not.  */
> + static struct regset_info aarch64_regsets[] =
> + {
> ++  /* GPR registers.  */
> +   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
> +-    sizeof (struct user_pt_regs), GENERAL_REGS,
> ++    0, GENERAL_REGS,
> +     aarch64_fill_gregset, aarch64_store_gregset },
> ++  /* Floating Point (FPU) registers.  */
> +   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_FPREGSET,
> +-    sizeof (struct user_fpsimd_state), FP_REGS,
> ++    0, FP_REGS,
> +     aarch64_fill_fpregset, aarch64_store_fpregset
> +   },
> ++  /* Scalable Vector Extension (SVE) registers.  */
> ++  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
> ++    0, EXTENDED_REGS,
> ++    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
> ++  },
> ++  /* PAC registers.  */
> +   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
> +-    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
> +-    NULL, aarch64_store_pauthregset },
> ++    0, OPTIONAL_REGS,
> ++    nullptr, aarch64_store_pauthregset },
> ++  /* Tagged address control / MTE registers.  */
> +   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
> +-    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
> +-    aarch64_store_mteregset },
> ++    0, OPTIONAL_REGS,
> ++    aarch64_fill_mteregset, aarch64_store_mteregset },
> +   NULL_REGSET
> + };
> +
> +@@ -752,47 +723,95 @@ static struct regsets_info aarch64_regsets_info =
> +   {
> +     aarch64_regsets, /* regsets */
> +     0, /* num_regsets */
> +-    NULL, /* disabled_regsets */
> ++    nullptr, /* disabled_regsets */
> +   };
> +
> + static struct regs_info regs_info_aarch64 =
> +   {
> +-    NULL, /* regset_bitmap */
> +-    NULL, /* usrregs */
> ++    nullptr, /* regset_bitmap */
> ++    nullptr, /* usrregs */
> +     &aarch64_regsets_info,
> +   };
> +
> +-static struct regset_info aarch64_sve_regsets[] =
> ++/* Given FEATURES, adjust the available register sets by setting their
> ++   sizes.  A size of 0 means the register set is disabled and won't be
> ++   used.  */
> ++
> ++static void
> ++aarch64_adjust_register_sets (const struct aarch64_features &features)
> + {
> +-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
> +-    sizeof (struct user_pt_regs), GENERAL_REGS,
> +-    aarch64_fill_gregset, aarch64_store_gregset },
> +-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
> +-    SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE), EXTENDED_REGS,
> +-    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
> +-  },
> +-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
> +-    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
> +-    NULL, aarch64_store_pauthregset },
> +-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
> +-    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
> +-    aarch64_store_mteregset },
> +-  NULL_REGSET
> +-};
> ++  struct regset_info *regset;
> +
> +-static struct regsets_info aarch64_sve_regsets_info =
> +-  {
> +-    aarch64_sve_regsets, /* regsets.  */
> +-    0, /* num_regsets.  */
> +-    NULL, /* disabled_regsets.  */
> +-  };
> ++  for (regset = aarch64_regsets; regset->size >= 0; regset++)
> ++    {
> ++      switch (regset->nt_type)
> ++      {
> ++      case NT_PRSTATUS:
> ++        /* General purpose registers are always present.  */
> ++        regset->size = sizeof (struct user_pt_regs);
> ++        break;
> ++      case NT_FPREGSET:
> ++        /* This is unavailable when SVE is present.  */
> ++        if (!features.sve)
> ++          regset->size = sizeof (struct user_fpsimd_state);
> ++        break;
> ++      case NT_ARM_SVE:
> ++        if (features.sve)
> ++          regset->size = SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE);
> ++        break;
> ++      case NT_ARM_PAC_MASK:
> ++        if (features.pauth)
> ++          regset->size = AARCH64_PAUTH_REGS_SIZE;
> ++        break;
> ++      case NT_ARM_TAGGED_ADDR_CTRL:
> ++        if (features.mte)
> ++          regset->size = AARCH64_LINUX_SIZEOF_MTE;
> ++        break;
> ++      default:
> ++        gdb_assert_not_reached ("Unknown register set found.");
> ++      }
> ++    }
> ++}
> +
> +-static struct regs_info regs_info_aarch64_sve =
> +-  {
> +-    NULL, /* regset_bitmap.  */
> +-    NULL, /* usrregs.  */
> +-    &aarch64_sve_regsets_info,
> +-  };
> ++/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
> ++#define AARCH64_HWCAP_PACA (1 << 30)
> ++
> ++/* Implementation of linux target ops method "low_arch_setup".  */
> ++
> ++void
> ++aarch64_target::low_arch_setup ()
> ++{
> ++  unsigned int machine;
> ++  int is_elf64;
> ++  int tid;
> ++
> ++  tid = lwpid_of (current_thread);
> ++
> ++  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
> ++
> ++  if (is_elf64)
> ++    {
> ++      struct aarch64_features features;
> ++
> ++      uint64_t vq = aarch64_sve_get_vq (tid);
> ++      features.sve = (vq > 0);
> ++      /* A-profile PAC is 64-bit only.  */
> ++      features.pauth = linux_get_hwcap (8) & AARCH64_HWCAP_PACA;
> ++      /* A-profile MTE is 64-bit only.  */
> ++      features.mte = linux_get_hwcap2 (8) & HWCAP2_MTE;
> ++
> ++      current_process ()->tdesc
> ++      = aarch64_linux_read_description (vq, features.pauth, features.mte);
> ++
> ++      /* Adjust the register sets we should use for this particular set of
> ++       features.  */
> ++      aarch64_adjust_register_sets (features);
> ++    }
> ++  else
> ++    current_process ()->tdesc = aarch32_linux_read_description ();
> ++
> ++  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
> ++}
> +
> + /* Implementation of linux target ops method "get_regs_info".  */
> +
> +@@ -802,9 +821,7 @@ aarch64_target::get_regs_info ()
> +   if (!is_64bit_tdesc ())
> +     return &regs_info_aarch32;
> +
> +-  if (is_sve_tdesc ())
> +-    return &regs_info_aarch64_sve;
> +-
> ++  /* AArch64 64-bit registers.  */
> +   return &regs_info_aarch64;
> + }
> +
> +@@ -3294,5 +3311,4 @@ initialize_low_arch (void)
> +   initialize_low_arch_aarch32 ();
> +
> +   initialize_regsets_info (&aarch64_regsets_info);
> +-  initialize_regsets_info (&aarch64_sve_regsets_info);
> + }
> +--
> +2.27.0
> +
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94212): https://lists.openembedded.org/g/openembedded-devel/message/94212
> Mute This Topic: https://lists.openembedded.org/mt/87535227/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

