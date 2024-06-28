Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2C2C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 04:48:03 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.10219.1719550082339159692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 21:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdMMpVds;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-63036fa87dbso1396667b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 21:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719550081; x=1720154881; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3wsNND3i9zB/yK78yV8+C2sawJdd7SoKEaaAH6FM6qQ=;
        b=MdMMpVdsZRjqZ4hp1k6fUDpjt66e1JOmDl3DDvuUI2lXCml3rsluqh0Ed1HwHrT1gd
         oywnEeo/vK2KLjx4BXGsStetfPHyWeTd2Osx+loImQBDqTekIRpYHbqJj2vqT5zw75F4
         A4Q0+zcKRGG74sCJUAtJ28QMu4PHtnL6YpLR7bmR1K2icTctiRWJ33E1tiNAjfsPuepr
         5Ad7nAOn8jGeiELEVPTSl/WUwPorGOtYhyVeSdSH6jFVrnkL90mdu7bBllxbBsv+2+WP
         QfHer270cBgtkdKCn7eUuNVNwGpuxV4Tg8ub/7bL4xrK5JhOSS2jCuphLedsKfM+R3tB
         WLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719550081; x=1720154881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wsNND3i9zB/yK78yV8+C2sawJdd7SoKEaaAH6FM6qQ=;
        b=EAOnsXchRnv2pBpPV4iTS3ee/ndDG/x6iVIfm7rghqEDWEPjjWX155vGWQMru9xl1b
         XUy07YivPO0E/q9i7FtbxE+zRSLiDJR8DITMSYn0vSfZvCMn/t6UeDZ3JqJOwSTopFUA
         t53LJup7FGbzAcDaxConEq/7H5DqmKp705ezVcStvHlJS/iXfKXAQ8Jh+eN4w2k8qVWQ
         kaQU8dQQ3uXLg4EqiKkcctjvTZfb4+8b7pkbop42rVMN6U54TMfLFAXcglbOyWh0yAAO
         2CJNRfpeSOv3y4tQ73UwQbtgyppjWR9bnULqLTEcbSTjjGBlULnTOhuO0PboWZaT0Cgr
         cEWA==
X-Gm-Message-State: AOJu0YwtZ15RiM12Y3gtBN6Zagtxe6GvGQdfmKw5lwuaMYvx3DPvGfSJ
	uemyYR2FtRMc+oLVoAp8FdpClSh5duJ2faaT9wRXq1NiMzRulOa/uOvTUUL5b8qWGU2qldOZ6dT
	6NyjjEVrNmMWlngEjap9W09fDjgrL2w==
X-Google-Smtp-Source: AGHT+IGhOPv3yo3DiFfhfbYHV4NjDWAbN0LYkBVujRclLs8HuTZGA8ai0VkW+LIFTah3DGLHjx59usIKa44+w0WHXAo=
X-Received: by 2002:a05:690c:7107:b0:62f:83c9:4f60 with SMTP id
 00721157ae682-64af5437a0dmr3095077b3.23.1719550081152; Thu, 27 Jun 2024
 21:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240628044013.4771-1-hprajapati@mvista.com>
In-Reply-To: <20240628044013.4771-1-hprajapati@mvista.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 27 Jun 2024 21:47:49 -0700
Message-ID: <CANx9H-Bkp5T8a3nBu7rv0tQQss-saJbDnHCsowyE3KiZVTmdjw@mail.gmail.com>
Subject: Re: [oe] [meta-java][kirkstone][PATCH] openjdk-8: Fix CVE-2024-20919
 & CVE-2024-20921
To: hprajapati@mvista.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c2bbe1061bebf3d7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 04:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111139

--000000000000c2bbe1061bebf3d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pretty sure we need all of these CVEs fixed on master first before we back
port to a stable branch.

On Thu, Jun 27, 2024 at 9:40=E2=80=AFPM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org> wro=
te:

> Backport fixes for:
>
> * CVE-2024-20919 - Upstream-Status: Backport from
> https://github.com/openjdk/jdk8u/commit/77d38b78e4993381ddb113d012b30ab2d=
7cd9215
> * CVE-2024-20921 - Upstream-Status: Backport from
> https://github.com/openjdk/jdk8u/commit/f7cb28de01117f598ecf48ad58e277c3a=
4590436
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openjdk/openjdk-8-release-common.inc      |   2 +
>  .../patches-openjdk-8/CVE-2024-20919.patch    | 126 ++++
>  .../patches-openjdk-8/CVE-2024-20921.patch    | 657 ++++++++++++++++++
>  3 files changed, 785 insertions(+)
>  create mode 100644
> recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch
>  create mode 100644
> recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch
>
> diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc
> b/recipes-core/openjdk/openjdk-8-release-common.inc
> index c977c96..985d0d7 100644
> --- a/recipes-core/openjdk/openjdk-8-release-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> @@ -22,6 +22,8 @@ PATCHES_URI =3D "\
>      file://2008-jdk-no-unused-deps.patch \
>
>  file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch \
>      file://CVE-2022-40433.patch \
> +    file://CVE-2024-20919.patch \
> +    file://CVE-2024-20921.patch \
>  "
>  HOTSPOT_UB_PATCH =3D "\
>      file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch
> b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch
> new file mode 100644
> index 0000000..566e01c
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch
> @@ -0,0 +1,126 @@
> +From 77d38b78e4993381ddb113d012b30ab2d7cd9215 Mon Sep 17 00:00:00 2001
> +From: Martin Balao <mbalao@openjdk.org>
> +Date: Fri, 29 Sep 2023 13:01:13 +0000
> +Subject: [PATCH] 8314295: Enhance verification of verifier
> +
> +Reviewed-by: yan, andrew
> +Backport-of: 08980a0a60bc48c17eacd57fd2d7065ac2d986a8
> +
> +Upstream-Status: Backport [
> https://github.com/openjdk/jdk8u/commit/77d38b78e4993381ddb113d012b30ab2d=
7cd9215
> ]
> +CVE: CVE-2024-20919
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + hotspot/src/share/vm/classfile/verifier.cpp   |  5 +++--
> + .../src/share/vm/interpreter/bytecodes.cpp    | 22 ++++++++++++++-----
> + jdk/src/share/native/common/check_code.c      | 11 ++++++----
> + 3 files changed, 26 insertions(+), 12 deletions(-)
> +
> +diff --git a/hotspot/src/share/vm/classfile/verifier.cpp
> b/hotspot/src/share/vm/classfile/verifier.cpp
> +index 2a572058..3a3e04ba 100644
> +--- a/hotspot/src/share/vm/classfile/verifier.cpp
> ++++ b/hotspot/src/share/vm/classfile/verifier.cpp
> +@@ -2078,11 +2078,12 @@ void ClassVerifier::verify_switch(
> +           "low must be less than or equal to high in tableswitch");
> +       return;
> +     }
> +-    keys =3D high - low + 1;
> +-    if (keys < 0) {
> ++    int64_t keys64 =3D ((int64_t)high - low) + 1;
> ++    if (keys64 > 65535) {  // Max code length
> +       verify_error(ErrorContext::bad_code(bci), "too many keys in
> tableswitch");
> +       return;
> +     }
> ++    keys =3D (int)keys64;
> +     delta =3D 1;
> +   } else {
> +     keys =3D (int)Bytes::get_Java_u4(aligned_bcp + jintSize);
> +diff --git a/hotspot/src/share/vm/interpreter/bytecodes.cpp
> b/hotspot/src/share/vm/interpreter/bytecodes.cpp
> +index 24adc4d9..f0753735 100644
> +--- a/hotspot/src/share/vm/interpreter/bytecodes.cpp
> ++++ b/hotspot/src/share/vm/interpreter/bytecodes.cpp
> +@@ -111,12 +111,18 @@ int Bytecodes::special_length_at(Bytecodes::Code
> code, address bcp, address end)
> +       if (end !=3D NULL && aligned_bcp + 3*jintSize >=3D end) {
> +         return -1; // don't read past end of code buffer
> +       }
> ++      // Promote calculation to signed 64 bits to do range checks, used
> by the verifier.
> +       jlong lo =3D (jint)Bytes::get_Java_u4(aligned_bcp + 1*jintSize);
> +       jlong hi =3D (jint)Bytes::get_Java_u4(aligned_bcp + 2*jintSize);
> +       jlong len =3D (aligned_bcp - bcp) + (3 + hi - lo + 1)*jintSize;
> +-      // only return len if it can be represented as a positive int;
> +-      // return -1 otherwise
> +-      return (len > 0 && len =3D=3D (int)len) ? len : -1;
> ++      // Only return len if it can be represented as a positive int and
> lo <=3D hi.
> ++      // The caller checks for bytecode stream overflow.
> ++      if (lo <=3D hi && len =3D=3D (int)len) {
> ++        assert(len > 0, "must be");
> ++        return (int)len;
> ++      } else {
> ++        return -1;
> ++      }
> +     }
> +
> +   case _lookupswitch:      // fall through
> +@@ -128,9 +134,13 @@ int Bytecodes::special_length_at(Bytecodes::Code
> code, address bcp, address end)
> +       }
> +       jlong npairs =3D (jint)Bytes::get_Java_u4(aligned_bcp + jintSize)=
;
> +       jlong len =3D (aligned_bcp - bcp) + (2 + 2*npairs)*jintSize;
> +-      // only return len if it can be represented as a positive int;
> +-      // return -1 otherwise
> +-      return (len > 0 && len =3D=3D (int)len) ? len : -1;
> ++      // Only return len if it can be represented as a positive int and
> npairs >=3D 0.
> ++      if (npairs >=3D 0 && len =3D=3D (int)len) {
> ++        assert(len > 0, "must be");
> ++        return (int)len;
> ++      } else {
> ++        return -1;
> ++      }
> +     }
> +   }
> +   // Note: Length functions must return <=3D0 for invalid bytecodes.
> +diff --git a/jdk/src/share/native/common/check_code.c
> b/jdk/src/share/native/common/check_code.c
> +index 96091720..491b95cd 100644
> +--- a/jdk/src/share/native/common/check_code.c
> ++++ b/jdk/src/share/native/common/check_code.c
> +@@ -1,5 +1,5 @@
> + /*
> +- * Copyright (c) 1994, 2014, Oracle and/or its affiliates. All rights
> reserved.
> ++ * Copyright (c) 1994, 2023, Oracle and/or its affiliates. All rights
> reserved.
> +  * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
> +  *
> +  * This code is free software; you can redistribute it and/or modify it
> +@@ -84,6 +84,7 @@
> + #include <assert.h>
> + #include <limits.h>
> + #include <stdlib.h>
> ++#include <stdint.h>
> +
> + #include "jni.h"
> + #include "jvm.h"
> +@@ -1202,7 +1203,7 @@ verify_opcode_operands(context_type *context,
> unsigned int inumber, int offset)
> +             }
> +         }
> +         if (opcode =3D=3D JVM_OPC_tableswitch) {
> +-            keys =3D _ck_ntohl(lpc[2]) -  _ck_ntohl(lpc[1]) + 1;
> ++            keys =3D _ck_ntohl(lpc[2]) - _ck_ntohl(lpc[1]) + 1;
> +             delta =3D 1;
> +         } else {
> +             keys =3D _ck_ntohl(lpc[1]); /* number of pairs */
> +@@ -1682,11 +1683,13 @@ static int instruction_length(unsigned char
> *iptr, unsigned char *end)
> +     switch (instruction) {
> +         case JVM_OPC_tableswitch: {
> +             int *lpc =3D (int *)UCALIGN(iptr + 1);
> +-            int index;
> +             if (lpc + 2 >=3D (int *)end) {
> +                 return -1; /* do not read pass the end */
> +             }
> +-            index =3D _ck_ntohl(lpc[2]) - _ck_ntohl(lpc[1]);
> ++            int64_t low  =3D _ck_ntohl(lpc[1]);
> ++            int64_t high =3D _ck_ntohl(lpc[2]);
> ++            int64_t index =3D high - low;
> ++            // The value of low must be less than or equal to high -
> i.e. index >=3D 0
> +             if ((index < 0) || (index > 65535)) {
> +                 return -1;      /* illegal */
> +             } else {
> +--
> +2.25.1
> +
> diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch
> b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch
> new file mode 100644
> index 0000000..edce6f0
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch
> @@ -0,0 +1,657 @@
> +From f7cb28de01117f598ecf48ad58e277c3a4590436 Mon Sep 17 00:00:00 2001
> +From: Roland Westrelin <rwestrel@redhat.com>
> +Date: Tue, 7 Nov 2023 11:08:30 +0000
> +Subject: [PATCH] 8314307: Improve loop handling
> +
> +Reviewed-by: mbalao, fferrari, andrew
> +Backport-of: 62ac93d145ca9fa1ab0c040533c62c42c202703a
> +
> +Upstream-Status: Backport [
> https://github.com/openjdk/jdk8u/commit/f7cb28de01117f598ecf48ad58e277c3a=
4590436
> ]
> +CVE: CVE-2024-20921
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + hotspot/src/share/vm/opto/ifnode.cpp   |  59 +++-
> + hotspot/src/share/vm/opto/loopnode.cpp | 422 ++++++++++++++++++++-----
> + hotspot/src/share/vm/opto/loopnode.hpp |   4 +
> + hotspot/src/share/vm/opto/phaseX.hpp   |   6 +-
> + 4 files changed, 404 insertions(+), 87 deletions(-)
> +
> +diff --git a/hotspot/src/share/vm/opto/ifnode.cpp
> b/hotspot/src/share/vm/opto/ifnode.cpp
> +index 68f068d0..51579032 100644
> +--- a/hotspot/src/share/vm/opto/ifnode.cpp
> ++++ b/hotspot/src/share/vm/opto/ifnode.cpp
> +@@ -882,6 +882,46 @@ Node *IfNode::Ideal(PhaseGVN *phase, bool
> can_reshape) {
> +     // then we are guaranteed to fail, so just start interpreting there=
.
> +     // We 'expand' the top 3 range checks to include all post-dominatin=
g
> +     // checks.
> ++    //
> ++    // Example:
> ++    // a[i+x] // (1) 1 < x < 6
> ++    // a[i+3] // (2)
> ++    // a[i+4] // (3)
> ++    // a[i+6] // max =3D max of all constants
> ++    // a[i+2]
> ++    // a[i+1] // min =3D min of all constants
> ++    //
> ++    // If x < 3:
> ++    //   (1) a[i+x]: Leave unchanged
> ++    //   (2) a[i+3]: Replace with a[i+max] =3D a[i+6]: i+x < i+3 <=3D i=
+6
> -> (2) is covered
> ++    //   (3) a[i+4]: Replace with a[i+min] =3D a[i+1]: i+1 < i+4 <=3D i=
+6
> -> (3) and all following checks are covered
> ++    //   Remove all other a[i+c] checks
> ++    //
> ++    // If x >=3D 3:
> ++    //   (1) a[i+x]: Leave unchanged
> ++    //   (2) a[i+3]: Replace with a[i+min] =3D a[i+1]: i+1 < i+3 <=3D i=
+x
> -> (2) is covered
> ++    //   (3) a[i+4]: Replace with a[i+max] =3D a[i+6]: i+1 < i+4 <=3D i=
+6
> -> (3) and all following checks are covered
> ++    //   Remove all other a[i+c] checks
> ++    //
> ++    // We only need the top 2 range checks if x is the min or max of al=
l
> constants.
> ++    //
> ++    // This, however, only works if the interval [i+min,i+max] is not
> larger than max_int (i.e. abs(max - min) < max_int):
> ++    // The theoretical max size of an array is max_int with:
> ++    // - Valid index space: [0,max_int-1]
> ++    // - Invalid index space: [max_int,-1] // max_int, min_int, min_int
> - 1 ..., -1
> ++    //
> ++    // The size of the consecutive valid index space is smaller than th=
e
> size of the consecutive invalid index space.
> ++    // If we choose min and max in such a way that:
> ++    // - abs(max - min) < max_int
> ++    // - i+max and i+min are inside the valid index space
> ++    // then all indices [i+min,i+max] must be in the valid index space.
> Otherwise, the invalid index space must be
> ++    // smaller than the valid index space which is never the case for
> any array size.
> ++    //
> ++    // Choosing a smaller array size only makes the valid index space
> smaller and the invalid index space larger and
> ++    // the argument above still holds.
> ++    //
> ++    // Note that the same optimization with the same maximal accepted
> interval size can also be found in C1.
> ++    const jlong maximum_number_of_min_max_interval_indices =3D
> (jlong)max_jint;
> +
> +     // The top 3 range checks seen
> +     const int NRC =3D3;
> +@@ -915,13 +955,18 @@ Node *IfNode::Ideal(PhaseGVN *phase, bool
> can_reshape) {
> +             found_immediate_dominator =3D true;
> +             break;
> +           }
> +-          // Gather expanded bounds
> +-          off_lo =3D MIN2(off_lo,offset2);
> +-          off_hi =3D MAX2(off_hi,offset2);
> +-          // Record top NRC range checks
> +-          prev_checks[nb_checks%NRC].ctl =3D prev_dom;
> +-          prev_checks[nb_checks%NRC].off =3D offset2;
> +-          nb_checks++;
> ++
> ++          // "x - y" -> must add one to the difference for number of
> elements in [x,y]
> ++          const jlong diff =3D (jlong)MIN2(offset2, off_lo) -
> (jlong)MAX2(offset2, off_hi);
> ++          if (ABS(diff) < maximum_number_of_min_max_interval_indices) {
> ++            // Gather expanded bounds
> ++            off_lo =3D MIN2(off_lo, offset2);
> ++            off_hi =3D MAX2(off_hi, offset2);
> ++            // Record top NRC range checks
> ++            prev_checks[nb_checks % NRC].ctl =3D prev_dom;
> ++            prev_checks[nb_checks % NRC].off =3D offset2;
> ++            nb_checks++;
> ++          }
> +         }
> +       }
> +       prev_dom =3D dom;
> +diff --git a/hotspot/src/share/vm/opto/loopnode.cpp
> b/hotspot/src/share/vm/opto/loopnode.cpp
> +index b2d5dccd..8bc9dd29 100644
> +--- a/hotspot/src/share/vm/opto/loopnode.cpp
> ++++ b/hotspot/src/share/vm/opto/loopnode.cpp
> +@@ -260,6 +260,49 @@ void PhaseIdealLoop::set_subtree_ctrl( Node *n ) {
> +   set_early_ctrl( n );
> + }
> +
> ++void PhaseIdealLoop::insert_loop_limit_check(ProjNode* limit_check_proj=
,
> Node* cmp_limit, Node* bol) {
> ++  Node* new_predicate_proj =3D
> create_new_if_for_predicate(limit_check_proj, NULL,
> ++
>  Deoptimization::Reason_loop_limit_check);
> ++  Node* iff =3D new_predicate_proj->in(0);
> ++  assert(iff->Opcode() =3D=3D Op_If, "bad graph shape");
> ++  Node* conv =3D iff->in(1);
> ++  assert(conv->Opcode() =3D=3D Op_Conv2B, "bad graph shape");
> ++  Node* opaq =3D conv->in(1);
> ++  assert(opaq->Opcode() =3D=3D Op_Opaque1, "bad graph shape");
> ++  cmp_limit =3D _igvn.register_new_node_with_optimizer(cmp_limit);
> ++  bol =3D _igvn.register_new_node_with_optimizer(bol);
> ++  set_subtree_ctrl(bol);
> ++  _igvn.replace_input_of(iff, 1, bol);
> ++
> ++#ifndef PRODUCT
> ++  // report that the loop predication has been actually performed
> ++  // for this loop
> ++  if (TraceLoopLimitCheck) {
> ++    tty->print_cr("Counted Loop Limit Check generated:");
> ++    debug_only( bol->dump(2); )
> ++  }
> ++#endif
> ++}
> ++
> ++static int check_stride_overflow(jlong final_correction, const TypeInt*
> limit_t) {
> ++  if (final_correction > 0) {
> ++    if (limit_t->_lo > (max_jint - final_correction)) {
> ++      return -1;
> ++    }
> ++    if (limit_t->_hi > (max_jint - final_correction)) {
> ++      return 1;
> ++    }
> ++  } else {
> ++    if (limit_t->_hi < (min_jint - final_correction)) {
> ++      return -1;
> ++    }
> ++    if (limit_t->_lo < (min_jint - final_correction)) {
> ++      return 1;
> ++    }
> ++  }
> ++  return 0;
> ++}
> ++
> +
> //------------------------------is_counted_loop--------------------------=
------
> + bool PhaseIdealLoop::is_counted_loop( Node *x, IdealLoopTree *loop ) {
> +   PhaseGVN *gvn =3D &_igvn;
> +@@ -463,51 +506,256 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +   assert(x->Opcode() =3D=3D Op_Loop, "regular loops only");
> +   C->print_method(PHASE_BEFORE_CLOOPS, 3);
> +
> +-  Node *hook =3D new (C) Node(6);
> ++  Node* adjusted_limit =3D limit;
> +
> +   if (LoopLimitCheck) {
> +
> +   // =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +-  // Generate loop limit check to avoid integer overflow
> +-  // in cases like next (cyclic loops):
> ++  // We can only convert this loop to a counted loop if we can guarante=
e
> that the iv phi will never overflow at runtime.
> ++  // This is an implicit assumption taken by some loop optimizations. W=
e
> therefore must ensure this property at all cost.
> ++  // At this point, we've already excluded some trivial cases where an
> overflow could have been proven statically.
> ++  // But even though we cannot prove that an overflow will *not* happen=
,
> we still want to speculatively convert this loop
> ++  // to a counted loop. This can be achieved by adding additional iv ph=
i
> overflow checks before the loop. If they fail,
> ++  // we trap and resume execution before the loop without having
> executed any iteration of the loop, yet.
> +   //
> +-  // for (i=3D0; i <=3D max_jint; i++) {}
> +-  // for (i=3D0; i <  max_jint; i+=3D2) {}
> ++  // These additional iv phi overflow checks can be inserted as Loop
> Limit Check Predicates above the Loop Limit Check
> ++  // Parse Predicate which captures a JVM state just before the entry o=
f
> the loop. If there is no such Parse Predicate,
> ++  // we cannot generate a Loop Limit Check Predicate and thus cannot
> speculatively convert the loop to a counted loop.
> +   //
> ++  // In the following, we only focus on int loops with stride > 0 to
> keep things simple. The argumentation and proof
> ++  // for stride < 0 is analogously. For long loops, we would replace
> max_int with max_long.
> +   //
> +-  // Limit check predicate depends on the loop test:
> +   //
> +-  // for(;i !=3D limit; i++)       --> limit <=3D (max_jint)
> +-  // for(;i <  limit; i+=3Dstride) --> limit <=3D (max_jint - stride + =
1)
> +-  // for(;i <=3D limit; i+=3Dstride) --> limit <=3D (max_jint - stride =
   )
> ++  // The loop to be converted does not always need to have the often
> used shape:
> +   //
> ++  //                                                 i =3D init
> ++  //     i =3D init                                loop:
> ++  //     do {                                        ...
> ++  //         // ...               equivalent         i+=3Dstride
> ++  //         i+=3Dstride               <=3D=3D>            if (i < limi=
t)
> ++  //     } while (i < limit);                          goto loop
> ++  //                                             exit:
> ++  //                                                 ...
> ++  //
> ++  // where the loop exit check uses the post-incremented iv phi and a
> '<'-operator.
> ++  //
> ++  // We could also have '<=3D'-operator (or '>=3D'-operator for negativ=
e
> strides) or use the pre-incremented iv phi value
> ++  // in the loop exit check:
> ++  //
> ++  //         i =3D init
> ++  //     loop:
> ++  //         ...
> ++  //         if (i <=3D limit)
> ++  //             i+=3Dstride
> ++  //             goto loop
> ++  //     exit:
> ++  //         ...
> ++  //
> ++  // Let's define the following terms:
> ++  // - iv_pre_i: The pre-incremented iv phi before the i-th iteration.
> ++  // - iv_post_i: The post-incremented iv phi after the i-th iteration.
> ++  //
> ++  // The iv_pre_i and iv_post_i have the following relation:
> ++  //      iv_pre_i + stride =3D iv_post_i
> ++  //
> ++  // When converting a loop to a counted loop, we want to have a
> canonicalized loop exit check of the form:
> ++  //     iv_post_i < adjusted_limit
> ++  //
> ++  // If that is not the case, we need to canonicalize the loop exit
> check by using different values for adjusted_limit:
> ++  // (LE1) iv_post_i < limit: Already canonicalized. We can directly us=
e
> limit as adjusted_limit.
> ++  //           -> adjusted_limit =3D limit.
> ++  // (LE2) iv_post_i <=3D limit:
> ++  //           iv_post_i < limit + 1
> ++  //           -> adjusted limit =3D limit + 1
> ++  // (LE3) iv_pre_i < limit:
> ++  //           iv_pre_i + stride < limit + stride
> ++  //           iv_post_i < limit + stride
> ++  //           -> adjusted_limit =3D limit + stride
> ++  // (LE4) iv_pre_i <=3D limit:
> ++  //           iv_pre_i < limit + 1
> ++  //           iv_pre_i + stride < limit + stride + 1
> ++  //           iv_post_i < limit + stride + 1
> ++  //           -> adjusted_limit =3D limit + stride + 1
> ++  //
> ++  // Note that:
> ++  //     (AL) limit <=3D adjusted_limit.
> ++  //
> ++  // The following loop invariant has to hold for counted loops with n
> iterations (i.e. loop exit check true after n-th
> ++  // loop iteration) and a canonicalized loop exit check to guarantee
> that no iv_post_i over- or underflows:
> ++  // (INV) For i =3D 1..n, min_int <=3D iv_post_i <=3D max_int
> ++  //
> ++  // To prove (INV), we require the following two conditions/assumption=
s:
> ++  // (i): adjusted_limit - 1 + stride <=3D max_int
> ++  // (ii): init < limit
> ++  //
> ++  // If we can prove (INV), we know that there can be no over- or
> underflow of any iv phi value. We prove (INV) by
> ++  // induction by assuming (i) and (ii).
> ++  //
> ++  // Proof by Induction
> ++  // ------------------
> ++  // > Base case (i =3D 1): We show that (INV) holds after the first
> iteration:
> ++  //     min_int <=3D iv_post_1 =3D init + stride <=3D max_int
> ++  // Proof:
> ++  //     First, we note that (ii) implies
> ++  //         (iii) init <=3D limit - 1
> ++  //     max_int >=3D adjusted_limit - 1 + stride   [using (i)]
> ++  //             >=3D limit - 1 + stride            [using (AL)]
> ++  //             >=3D init + stride                 [using (iii)]
> ++  //             >=3D min_int                       [using stride > 0, =
no
> underflow]
> ++  // Thus, no overflow happens after the first iteration and (INV) hold=
s
> for i =3D 1.
> ++  //
> ++  // Note that to prove the base case we need (i) and (ii).
> ++  //
> ++  // > Induction Hypothesis (i =3D j, j > 1): Assume that (INV) holds
> after the j-th iteration:
> ++  //     min_int <=3D iv_post_j <=3D max_int
> ++  // > Step case (i =3D j + 1): We show that (INV) also holds after the
> j+1-th iteration:
> ++  //     min_int <=3D iv_post_{j+1} =3D iv_post_j + stride <=3D max_int
> ++  // Proof:
> ++  // If iv_post_j >=3D adjusted_limit:
> ++  //     We exit the loop after the j-th iteration, and we don't execut=
e
> the j+1-th iteration anymore. Thus, there is
> ++  //     also no iv_{j+1}. Since (INV) holds for iv_j, there is nothing
> left to prove.
> ++  // If iv_post_j < adjusted_limit:
> ++  //     First, we note that:
> ++  //         (iv) iv_post_j <=3D adjusted_limit - 1
> ++  //     max_int >=3D adjusted_limit - 1 + stride    [using (i)]
> ++  //             >=3D iv_post_j + stride             [using (iv)]
> ++  //             >=3D min_int                        [using stride > 0,=
 no
> underflow]
> ++  //
> ++  // Note that to prove the step case we only need (i).
> ++  //
> ++  // Thus, by assuming (i) and (ii), we proved (INV).
> ++  //
> ++  //
> ++  // It is therefore enough to add the following two Loop Limit Check
> Predicates to check assumptions (i) and (ii):
> ++  //
> ++  // (1) Loop Limit Check Predicate for (i):
> ++  //     Using (i): adjusted_limit - 1 + stride <=3D max_int
> ++  //
> ++  //     This condition is now restated to use limit instead of
> adjusted_limit:
> ++  //
> ++  //     To prevent an overflow of adjusted_limit -1 + stride itself, w=
e
> rewrite this check to
> ++  //         max_int - stride + 1 >=3D adjusted_limit
> ++  //     We can merge the two constants into
> ++  //         canonicalized_correction =3D stride - 1
> ++  //     which gives us
> ++  //        max_int - canonicalized_correction >=3D adjusted_limit
> ++  //
> ++  //     To directly use limit instead of adjusted_limit in the
> predicate condition, we split adjusted_limit into:
> ++  //         adjusted_limit =3D limit + limit_correction
> ++  //     Since stride > 0 and limit_correction <=3D stride + 1, we can
> restate this with no over- or underflow into:
> ++  //         max_int - canonicalized_correction - limit_correction >=3D
> limit
> ++  //     Since canonicalized_correction and limit_correction are both
> constants, we can replace them with a new constant:
> ++  //         final_correction =3D canonicalized_correction +
> limit_correction
> ++  //     which gives us:
> ++  //
> ++  //     Final predicate condition:
> ++  //         max_int - final_correction >=3D limit
> ++  //
> ++  // (2) Loop Limit Check Predicate for (ii):
> ++  //     Using (ii): init < limit
> ++  //
> ++  //     This Loop Limit Check Predicate is not required if we can prov=
e
> at compile time that either:
> ++  //        (2.1) type(init) < type(limit)
> ++  //             In this case, we know:
> ++  //                 all possible values of init < all possible values
> of limit
> ++  //             and we can skip the predicate.
> ++  //
> ++  //        (2.2) init < limit is already checked before (i.e. found as
> a dominating check)
> ++  //            In this case, we do not need to re-check the condition
> and can skip the predicate.
> ++  //            This is often found for while- and for-loops which have
> the following shape:
> ++  //
> ++  //                if (init < limit) { // Dominating test. Do not need
> the Loop Limit Check Predicate below.
> ++  //                    i =3D init;
> ++  //                    if (init >=3D limit) { trap(); } // Here we wou=
ld
> insert the Loop Limit Check Predicate
> ++  //                    do {
> ++  //                        i +=3D stride;
> ++  //                    } while (i < limit);
> ++  //                }
> ++  //
> ++  //        (2.3) init + stride <=3D max_int
> ++  //            In this case, there is no overflow of the iv phi after
> the first loop iteration.
> ++  //            In the proof of the base case above we showed that init
> + stride <=3D max_int by using assumption (ii):
> ++  //                init < limit
> ++  //            In the proof of the step case above, we did not need
> (ii) anymore. Therefore, if we already know at
> ++  //            compile time that init + stride <=3D max_int then we ha=
ve
> trivially proven the base case and that
> ++  //            there is no overflow of the iv phi after the first
> iteration. In this case, we don't need to check (ii)
> ++  //            again and can skip the predicate.
> ++
> ++
> ++  // Accounting for (LE3) and (LE4) where we use pre-incremented phis i=
n
> the loop exit check.
> ++  const jlong limit_correction_for_pre_iv_exit_check =3D (phi_incr !=3D
> NULL) ? stride_con : 0;
> ++
> ++  // Accounting for (LE2) and (LE4) where we use <=3D or >=3D in the lo=
op
> exit check.
> ++  const bool includes_limit =3D (bt =3D=3D BoolTest::le || bt =3D=3D Bo=
olTest::ge);
> ++  const jlong limit_correction_for_le_ge_exit_check =3D (includes_limit=
 ?
> (stride_con > 0 ? 1 : -1) : 0);
> ++
> ++  const jlong limit_correction =3D limit_correction_for_pre_iv_exit_che=
ck
> + limit_correction_for_le_ge_exit_check;
> ++  const jlong canonicalized_correction =3D stride_con + (stride_con > 0=
 ?
> -1 : 1);
> ++  const jlong final_correction =3D canonicalized_correction +
> limit_correction;
> ++
> ++  int sov =3D check_stride_overflow(final_correction, limit_t);
> ++
> ++  // If sov=3D=3D0, limit's type always satisfies the condition, for
> ++  // example, when it is an array length.
> ++  if (sov !=3D 0) {
> ++    if (sov < 0) {
> ++      return false;  // Bailout: integer overflow is certain.
> ++    }
> ++    // (1) Loop Limit Check Predicate is required because we could not
> statically prove that
> ++    //     limit + final_correction =3D adjusted_limit - 1 + stride <=
=3D
> max_int
> ++    ProjNode *limit_check_proj =3D
> find_predicate_insertion_point(init_control,
> Deoptimization::Reason_loop_limit_check);
> ++    if (!limit_check_proj) {
> ++      // The Loop Limit Check Parse Predicate is not generated if this
> method trapped here before.
> ++#ifdef ASSERT
> ++      if (TraceLoopLimitCheck) {
> ++        tty->print("missing loop limit check:");
> ++        loop->dump_head();
> ++        x->dump(1);
> ++      }
> ++#endif
> ++      return false;
> ++    }
> +
> +-  // Check if limit is excluded to do more precise int overflow check.
> +-  bool incl_limit =3D (bt =3D=3D BoolTest::le || bt =3D=3D BoolTest::ge=
);
> +-  int stride_m  =3D stride_con - (incl_limit ? 0 : (stride_con > 0 ? 1 =
:
> -1));
> +-
> +-  // If compare points directly to the phi we need to adjust
> +-  // the compare so that it points to the incr. Limit have
> +-  // to be adjusted to keep trip count the same and the
> +-  // adjusted limit should be checked for int overflow.
> +-  if (phi_incr !=3D NULL) {
> +-    stride_m  +=3D stride_con;
> +-  }
> ++    IfNode* check_iff =3D limit_check_proj->in(0)->as_If();
> +
> +-  if (limit->is_Con()) {
> +-    int limit_con =3D limit->get_int();
> +-    if ((stride_con > 0 && limit_con > (max_jint - stride_m)) ||
> +-        (stride_con < 0 && limit_con < (min_jint - stride_m))) {
> +-      // Bailout: it could be integer overflow.
> ++    if (!is_dominator(get_ctrl(limit), check_iff->in(0))) {
> +       return false;
> +     }
> +-  } else if ((stride_con > 0 && limit_t->_hi <=3D (max_jint - stride_m)=
) ||
> +-             (stride_con < 0 && limit_t->_lo >=3D (min_jint - stride_m)=
)) {
> +-      // Limit's type may satisfy the condition, for example,
> +-      // when it is an array length.
> +-  } else {
> +-    // Generate loop's limit check.
> +-    // Loop limit check predicate should be near the loop.
> ++
> ++    Node* cmp_limit;
> ++    Node* bol;
> ++
> ++    if (stride_con > 0) {
> ++      cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(max_jint -
> final_correction));
> ++      bol =3D new (C) BoolNode(cmp_limit, BoolTest::le);
> ++    } else {
> ++      cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(min_jint -
> final_correction));
> ++      bol =3D new (C) BoolNode(cmp_limit, BoolTest::ge);
> ++    }
> ++
> ++    insert_loop_limit_check(limit_check_proj, cmp_limit, bol);
> ++  }
> ++
> ++  // (2.3)
> ++  const bool init_plus_stride_could_overflow =3D
> ++          (stride_con > 0 && init_t->_hi > max_jint - stride_con) ||
> ++          (stride_con < 0 && init_t->_lo < min_jint - stride_con);
> ++  // (2.1)
> ++  const bool init_gte_limit =3D (stride_con > 0 && init_t->_hi >=3D
> limit_t->_lo) ||
> ++                              (stride_con < 0 && init_t->_lo <=3D
> limit_t->_hi);
> ++
> ++  if (init_gte_limit && // (2.1)
> ++     ((bt =3D=3D BoolTest::ne || init_plus_stride_could_overflow) && //=
 (2.3)
> ++      !has_dominating_loop_limit_check(init_trip, limit, stride_con,
> init_control))) { // (2.2)
> ++    // (2) Iteration Loop Limit Check Predicate is required because
> neither (2.1), (2.2), nor (2.3) holds.
> ++    // We use the following condition:
> ++    // - stride > 0: init < limit
> ++    // - stride < 0: init > limit
> ++    //
> ++    // This predicate is always required if we have a non-equal-operato=
r
> in the loop exit check (where stride =3D 1 is
> ++    // a requirement). We transform the loop exit check by using a
> less-than-operator. By doing so, we must always
> ++    // check that init < limit. Otherwise, we could have a different
> number of iterations at runtime.
> ++
> +     ProjNode *limit_check_proj =3D
> find_predicate_insertion_point(init_control,
> Deoptimization::Reason_loop_limit_check);
> +     if (!limit_check_proj) {
> +       // The limit check predicate is not generated if this method
> trapped here before.
> +@@ -520,41 +768,38 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> + #endif
> +       return false;
> +     }
> +-
> +     IfNode* check_iff =3D limit_check_proj->in(0)->as_If();
> ++
> ++    if (!is_dominator(get_ctrl(limit), check_iff->in(0)) ||
> ++        !is_dominator(get_ctrl(init_trip), check_iff->in(0))) {
> ++      return false;
> ++    }
> ++
> +     Node* cmp_limit;
> +     Node* bol;
> +
> +     if (stride_con > 0) {
> +-      cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(max_jint -
> stride_m));
> +-      bol =3D new (C) BoolNode(cmp_limit, BoolTest::le);
> ++      cmp_limit =3D new (C) CmpINode(init_trip, limit);
> ++      bol =3D new (C) BoolNode(cmp_limit, BoolTest::lt);
> +     } else {
> +-      cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(min_jint -
> stride_m));
> +-      bol =3D new (C) BoolNode(cmp_limit, BoolTest::ge);
> ++      cmp_limit =3D new (C) CmpINode(init_trip, limit);
> ++      bol =3D new (C) BoolNode(cmp_limit, BoolTest::gt);
> +     }
> +-    cmp_limit =3D _igvn.register_new_node_with_optimizer(cmp_limit);
> +-    bol =3D _igvn.register_new_node_with_optimizer(bol);
> +-    set_subtree_ctrl(bol);
> +-
> +-    // Replace condition in original predicate but preserve Opaque node
> +-    // so that previous predicates could be found.
> +-    assert(check_iff->in(1)->Opcode() =3D=3D Op_Conv2B &&
> +-           check_iff->in(1)->in(1)->Opcode() =3D=3D Op_Opaque1, "");
> +-    Node* opq =3D check_iff->in(1)->in(1);
> +-    _igvn.hash_delete(opq);
> +-    opq->set_req(1, bol);
> +-    // Update ctrl.
> +-    set_ctrl(opq, check_iff->in(0));
> +-    set_ctrl(check_iff->in(1), check_iff->in(0));
> +
> +-#ifndef PRODUCT
> +-    // report that the loop predication has been actually performed
> +-    // for this loop
> +-    if (TraceLoopLimitCheck) {
> +-      tty->print_cr("Counted Loop Limit Check generated:");
> +-      debug_only( bol->dump(2); )
> ++    insert_loop_limit_check(limit_check_proj, cmp_limit, bol);
> ++  }
> ++
> ++  if (bt =3D=3D BoolTest::ne) {
> ++    // Now we need to canonicalize the loop condition if it is 'ne'.
> ++    assert(stride_con =3D=3D 1 || stride_con =3D=3D -1, "simple increme=
nt only -
> checked before");
> ++    if (stride_con > 0) {
> ++      // 'ne' can be replaced with 'lt' only when init < limit. This is
> ensured by the inserted predicate above.
> ++      bt =3D BoolTest::lt;
> ++    } else {
> ++      assert(stride_con < 0, "must be");
> ++      // 'ne' can be replaced with 'gt' only when init > limit. This is
> ensured by the inserted predicate above.
> ++      bt =3D BoolTest::gt;
> +     }
> +-#endif
> +   }
> +
> +   if (phi_incr !=3D NULL) {
> +@@ -567,26 +812,15 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +     // is converted to
> +     //   i =3D init; do {} while(++i < limit+1);
> +     //
> +-    limit =3D gvn->transform(new (C) AddINode(limit, stride));
> +-  }
> +-
> +-  // Now we need to canonicalize loop condition.
> +-  if (bt =3D=3D BoolTest::ne) {
> +-    assert(stride_con =3D=3D 1 || stride_con =3D=3D -1, "simple increme=
nt only");
> +-    // 'ne' can be replaced with 'lt' only when init < limit.
> +-    if (stride_con > 0 && init_t->_hi < limit_t->_lo)
> +-      bt =3D BoolTest::lt;
> +-    // 'ne' can be replaced with 'gt' only when init > limit.
> +-    if (stride_con < 0 && init_t->_lo > limit_t->_hi)
> +-      bt =3D BoolTest::gt;
> ++    adjusted_limit =3D gvn->transform(new (C) AddINode(limit, stride));
> +   }
> +
> +-  if (incl_limit) {
> ++  if (includes_limit) {
> +     // The limit check guaranties that 'limit <=3D (max_jint - stride)'=
 so
> +     // we can convert 'i <=3D limit' to 'i < limit+1' since stride !=3D=
 0.
> +     //
> +     Node* one =3D (stride_con > 0) ? gvn->intcon( 1) : gvn->intcon(-1);
> +-    limit =3D gvn->transform(new (C) AddINode(limit, one));
> ++    adjusted_limit =3D gvn->transform(new (C) AddINode(adjusted_limit,
> one));
> +     if (bt =3D=3D BoolTest::le)
> +       bt =3D BoolTest::lt;
> +     else if (bt =3D=3D BoolTest::ge)
> +@@ -594,10 +828,11 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +     else
> +       ShouldNotReachHere();
> +   }
> +-  set_subtree_ctrl( limit );
> ++  set_subtree_ctrl(adjusted_limit);
> +
> +   } else { // LoopLimitCheck
> +
> ++  Node *hook =3D new (C) Node(6);
> +   // If compare points to incr, we are ok.  Otherwise the compare
> +   // can directly point to the phi; in this case adjust the compare so
> that
> +   // it points to the incr by adjusting the limit.
> +@@ -691,6 +926,11 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +   limit =3D gvn->transform(new (C) AddINode(span,init_trip));
> +   set_subtree_ctrl( limit );
> +
> ++  adjusted_limit =3D limit;
> ++
> ++  // Free up intermediate goo
> ++  _igvn.remove_dead_node(hook);
> ++
> +   } // LoopLimitCheck
> +
> +   if (!UseCountedLoopSafepoints) {
> +@@ -728,7 +968,7 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +   }
> +   cmp =3D cmp->clone();
> +   cmp->set_req(1,incr);
> +-  cmp->set_req(2,limit);
> ++  cmp->set_req(2, adjusted_limit);
> +   cmp =3D _igvn.register_new_node_with_optimizer(cmp);
> +   set_ctrl(cmp, iff->in(0));
> +
> +@@ -802,9 +1042,6 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +     }
> +   }
> +
> +-  // Free up intermediate goo
> +-  _igvn.remove_dead_node(hook);
> +-
> + #ifdef ASSERT
> +   assert(l->is_valid_counted_loop(), "counted loop shape is messed up")=
;
> +   assert(l =3D=3D loop->_head && l->phi() =3D=3D phi && l->loopexit() =
=3D=3D lex, ""
> );
> +@@ -821,6 +1058,37 @@ bool PhaseIdealLoop::is_counted_loop( Node *x,
> IdealLoopTree *loop ) {
> +   return true;
> + }
> +
> ++// Check if there is a dominating loop limit check of the form 'init <
> limit' starting at the loop entry.
> ++// If there is one, then we do not need to create an additional Loop
> Limit Check Predicate.
> ++bool PhaseIdealLoop::has_dominating_loop_limit_check(Node* init_trip,
> Node* limit, const int stride_con,
> ++                                                     Node* loop_entry) =
{
> ++  // Eagerly call transform() on the Cmp and Bool node to common them u=
p
> if possible. This is required in order to
> ++  // successfully find a dominated test with the If node below.
> ++  Node* cmp_limit;
> ++  Node* bol;
> ++  if (stride_con > 0) {
> ++    cmp_limit =3D _igvn.transform(new (C) CmpINode(init_trip, limit));
> ++    bol =3D _igvn.transform(new (C) BoolNode(cmp_limit, BoolTest::lt));
> ++  } else {
> ++    cmp_limit =3D _igvn.transform(new (C) CmpINode(init_trip, limit));
> ++    bol =3D _igvn.transform(new (C) BoolNode(cmp_limit, BoolTest::gt));
> ++  }
> ++
> ++  // Check if there is already a dominating init < limit check. If so,
> we do not need a Loop Limit Check Predicate.
> ++  IfNode* iff =3D new (C) IfNode(loop_entry, bol, PROB_MIN, COUNT_UNKNO=
WN);
> ++  // Also add fake IfProj nodes in order to call transform() on the
> newly created IfNode.
> ++  IfFalseNode* if_false =3D new (C) IfFalseNode(iff);
> ++  IfTrueNode* if_true =3D new (C) IfTrueNode(iff);
> ++  Node* dominated_iff =3D _igvn.transform(iff);
> ++  // ConI node? Found dominating test (IfNode::dominated_by() returns a
> ConI node).
> ++  const bool found_dominating_test =3D dominated_iff !=3D NULL &&
> dominated_iff->Opcode() =3D=3D Op_ConI;
> ++
> ++  // Kill the If with its projections again in the next IGVN round by
> cutting it off from the graph.
> ++  _igvn.replace_input_of(iff, 0, C->top());
> ++  _igvn.replace_input_of(iff, 1, C->top());
> ++  return found_dominating_test;
> ++}
> ++
> +
> //----------------------exact_limit--------------------------------------=
-----
> + Node* PhaseIdealLoop::exact_limit( IdealLoopTree *loop ) {
> +   assert(loop->_head->is_CountedLoop(), "");
> +diff --git a/hotspot/src/share/vm/opto/loopnode.hpp
> b/hotspot/src/share/vm/opto/loopnode.hpp
> +index 55a7def3..3ae41f8d 100644
> +--- a/hotspot/src/share/vm/opto/loopnode.hpp
> ++++ b/hotspot/src/share/vm/opto/loopnode.hpp
> +@@ -896,6 +896,10 @@ public:
> +   // Create a new if above the uncommon_trap_if_pattern for the
> predicate to be promoted
> +   ProjNode* create_new_if_for_predicate(ProjNode* cont_proj, Node*
> new_entry,
> +                                         Deoptimization::DeoptReason
> reason);
> ++  void insert_loop_limit_check(ProjNode* limit_check_proj, Node*
> cmp_limit, Node* bol);
> ++  bool has_dominating_loop_limit_check(Node* init_trip, Node* limit, in=
t
> stride_con,
> ++                                       Node* loop_entry);
> ++
> +   void register_control(Node* n, IdealLoopTree *loop, Node* pred);
> +
> +   // Clone loop predicates to cloned loops (peeled, unswitched)
> +diff --git a/hotspot/src/share/vm/opto/phaseX.hpp
> b/hotspot/src/share/vm/opto/phaseX.hpp
> +index a2a2a538..bd7393ac 100644
> +--- a/hotspot/src/share/vm/opto/phaseX.hpp
> ++++ b/hotspot/src/share/vm/opto/phaseX.hpp
> +@@ -431,9 +431,6 @@ private:
> +
> + protected:
> +
> +-  // Idealize new Node 'n' with respect to its inputs and its value
> +-  virtual Node *transform( Node *a_node );
> +-
> +   // Warm up hash table, type table and initial worklist
> +   void init_worklist( Node *a_root );
> +
> +@@ -447,6 +444,9 @@ public:
> +   PhaseIterGVN( PhaseGVN *gvn ); // Used after Parser
> +   PhaseIterGVN( PhaseIterGVN *igvn, const char *dummy ); // Used after
> +VerifyOpto
> +
> ++  // Idealize new Node 'n' with respect to its inputs and its value
> ++  virtual Node *transform( Node *a_node );
> ++
> +   virtual PhaseIterGVN *is_IterGVN() { return this; }
> +
> +   Unique_Node_List _worklist;       // Iterative worklist
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111138):
> https://lists.openembedded.org/g/openembedded-devel/message/111138
> Mute This Topic: https://lists.openembedded.org/mt/106923033/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c2bbe1061bebf3d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Pretty sure we need all of these CVEs fixed on master fir=
st before we back port to a stable branch.</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 27, 2024 at 9:40=
=E2=80=AFPM Hitendra Prajapati via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;hprajapati=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">Backport fixes for:<br>
<br>
* CVE-2024-20919 - Upstream-Status: Backport from <a href=3D"https://github=
.com/openjdk/jdk8u/commit/77d38b78e4993381ddb113d012b30ab2d7cd9215" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openjdk/jdk8u/commit/77d38=
b78e4993381ddb113d012b30ab2d7cd9215</a><br>
* CVE-2024-20921 - Upstream-Status: Backport from <a href=3D"https://github=
.com/openjdk/jdk8u/commit/f7cb28de01117f598ecf48ad58e277c3a4590436" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openjdk/jdk8u/commit/f7cb2=
8de01117f598ecf48ad58e277c3a4590436</a><br>
<br>
Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.c=
om" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openjdk/openjdk-8-release-common.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../patches-openjdk-8/CVE-2024-20919.patch=C2=A0 =C2=A0 | 126 ++++<br=
>
=C2=A0.../patches-openjdk-8/CVE-2024-20921.patch=C2=A0 =C2=A0 | 657 +++++++=
+++++++++++<br>
=C2=A03 files changed, 785 insertions(+)<br>
=C2=A0create mode 100644 recipes-core/openjdk/patches-openjdk-8/CVE-2024-20=
919.patch<br>
=C2=A0create mode 100644 recipes-core/openjdk/patches-openjdk-8/CVE-2024-20=
921.patch<br>
<br>
diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc b/recipes-co=
re/openjdk/openjdk-8-release-common.inc<br>
index c977c96..985d0d7 100644<br>
--- a/recipes-core/openjdk/openjdk-8-release-common.inc<br>
+++ b/recipes-core/openjdk/openjdk-8-release-common.inc<br>
@@ -22,6 +22,8 @@ PATCHES_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://2008-jdk-no-unused-deps.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocke=
tOptionRe.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-40433.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2024-20919.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2024-20921.patch \<br>
=C2=A0&quot;<br>
=C2=A0HOTSPOT_UB_PATCH =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch=
 \<br>
diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch b/=
recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch<br>
new file mode 100644<br>
index 0000000..566e01c<br>
--- /dev/null<br>
+++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20919.patch<br>
@@ -0,0 +1,126 @@<br>
+From 77d38b78e4993381ddb113d012b30ab2d7cd9215 Mon Sep 17 00:00:00 2001<br>
+From: Martin Balao &lt;<a href=3D"mailto:mbalao@openjdk.org" target=3D"_bl=
ank">mbalao@openjdk.org</a>&gt;<br>
+Date: Fri, 29 Sep 2023 13:01:13 +0000<br>
+Subject: [PATCH] 8314295: Enhance verification of verifier<br>
+<br>
+Reviewed-by: yan, andrew<br>
+Backport-of: 08980a0a60bc48c17eacd57fd2d7065ac2d986a8<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/openjdk/jdk8u/com=
mit/77d38b78e4993381ddb113d012b30ab2d7cd9215" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openjdk/jdk8u/commit/77d38b78e4993381ddb113d012b=
30ab2d7cd9215</a>]<br>
+CVE: CVE-2024-20919<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ hotspot/src/share/vm/classfile/verifier.cpp=C2=A0 =C2=A0|=C2=A0 5 +++--<b=
r>
+ .../src/share/vm/interpreter/bytecodes.cpp=C2=A0 =C2=A0 | 22 ++++++++++++=
++-----<br>
+ jdk/src/share/native/common/check_code.c=C2=A0 =C2=A0 =C2=A0 | 11 ++++++-=
---<br>
+ 3 files changed, 26 insertions(+), 12 deletions(-)<br>
+<br>
+diff --git a/hotspot/src/share/vm/classfile/verifier.cpp b/hotspot/src/sha=
re/vm/classfile/verifier.cpp<br>
+index 2a572058..3a3e04ba 100644<br>
+--- a/hotspot/src/share/vm/classfile/verifier.cpp<br>
++++ b/hotspot/src/share/vm/classfile/verifier.cpp<br>
+@@ -2078,11 +2078,12 @@ void ClassVerifier::verify_switch(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;low must be less than or eq=
ual to high in tableswitch&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 keys =3D high - low + 1;<br>
+-=C2=A0 =C2=A0 if (keys &lt; 0) {<br>
++=C2=A0 =C2=A0 int64_t keys64 =3D ((int64_t)high - low) + 1;<br>
++=C2=A0 =C2=A0 if (keys64 &gt; 65535) {=C2=A0 // Max code length<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0verify_error(ErrorContext::bad_code(bci), &quot=
;too many keys in tableswitch&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 keys =3D (int)keys64;<br>
+=C2=A0 =C2=A0 =C2=A0delta =3D 1;<br>
+=C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0keys =3D (int)Bytes::get_Java_u4(aligned_bcp + jintSiz=
e);<br>
+diff --git a/hotspot/src/share/vm/interpreter/bytecodes.cpp b/hotspot/src/=
share/vm/interpreter/bytecodes.cpp<br>
+index 24adc4d9..f0753735 100644<br>
+--- a/hotspot/src/share/vm/interpreter/bytecodes.cpp<br>
++++ b/hotspot/src/share/vm/interpreter/bytecodes.cpp<br>
+@@ -111,12 +111,18 @@ int Bytecodes::special_length_at(Bytecodes::Code cod=
e, address bcp, address end)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (end !=3D NULL &amp;&amp; aligned_bcp + 3*ji=
ntSize &gt;=3D end) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1; // don&#39;t read past end of=
 code buffer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 // Promote calculation to signed 64 bits to do range=
 checks, used by the verifier.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jlong lo =3D (jint)Bytes::get_Java_u4(aligned_b=
cp + 1*jintSize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jlong hi =3D (jint)Bytes::get_Java_u4(aligned_b=
cp + 2*jintSize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jlong len =3D (aligned_bcp - bcp) + (3 + hi - l=
o + 1)*jintSize;<br>
+-=C2=A0 =C2=A0 =C2=A0 // only return len if it can be represented as a pos=
itive int;<br>
+-=C2=A0 =C2=A0 =C2=A0 // return -1 otherwise<br>
+-=C2=A0 =C2=A0 =C2=A0 return (len &gt; 0 &amp;&amp; len =3D=3D (int)len) ?=
 len : -1;<br>
++=C2=A0 =C2=A0 =C2=A0 // Only return len if it can be represented as a pos=
itive int and lo &lt;=3D hi.<br>
++=C2=A0 =C2=A0 =C2=A0 // The caller checks for bytecode stream overflow.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 if (lo &lt;=3D hi &amp;&amp; len =3D=3D (int)len) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(len &gt; 0, &quot;must be&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)len;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0case _lookupswitch:=C2=A0 =C2=A0 =C2=A0 // fall through<br>
+@@ -128,9 +134,13 @@ int Bytecodes::special_length_at(Bytecodes::Code code=
, address bcp, address end)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jlong npairs =3D (jint)Bytes::get_Java_u4(align=
ed_bcp + jintSize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jlong len =3D (aligned_bcp - bcp) + (2 + 2*npai=
rs)*jintSize;<br>
+-=C2=A0 =C2=A0 =C2=A0 // only return len if it can be represented as a pos=
itive int;<br>
+-=C2=A0 =C2=A0 =C2=A0 // return -1 otherwise<br>
+-=C2=A0 =C2=A0 =C2=A0 return (len &gt; 0 &amp;&amp; len =3D=3D (int)len) ?=
 len : -1;<br>
++=C2=A0 =C2=A0 =C2=A0 // Only return len if it can be represented as a pos=
itive int and npairs &gt;=3D 0.<br>
++=C2=A0 =C2=A0 =C2=A0 if (npairs &gt;=3D 0 &amp;&amp; len =3D=3D (int)len)=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(len &gt; 0, &quot;must be&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (int)len;<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0// Note: Length functions must return &lt;=3D0 for invalid by=
tecodes.<br>
+diff --git a/jdk/src/share/native/common/check_code.c b/jdk/src/share/nati=
ve/common/check_code.c<br>
+index 96091720..491b95cd 100644<br>
+--- a/jdk/src/share/native/common/check_code.c<br>
++++ b/jdk/src/share/native/common/check_code.c<br>
+@@ -1,5 +1,5 @@<br>
+ /*<br>
+- * Copyright (c) 1994, 2014, Oracle and/or its affiliates. All rights res=
erved.<br>
++ * Copyright (c) 1994, 2023, Oracle and/or its affiliates. All rights res=
erved.<br>
+=C2=A0 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.<br>
+=C2=A0 *<br>
+=C2=A0 * This code is free software; you can redistribute it and/or modify=
 it<br>
+@@ -84,6 +84,7 @@<br>
+ #include &lt;assert.h&gt;<br>
+ #include &lt;limits.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
++#include &lt;stdint.h&gt;<br>
+ <br>
+ #include &quot;jni.h&quot;<br>
+ #include &quot;jvm.h&quot;<br>
+@@ -1202,7 +1203,7 @@ verify_opcode_operands(context_type *context, unsign=
ed int inumber, int offset)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opcode =3D=3D JVM_OPC_tableswitch) {=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keys =3D _ck_ntohl(lpc[2]) -=C2=
=A0 _ck_ntohl(lpc[1]) + 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keys =3D _ck_ntohl(lpc[2]) - _c=
k_ntohl(lpc[1]) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delta =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0keys =3D _ck_ntohl(lpc[1])=
; /* number of pairs */<br>
+@@ -1682,11 +1683,13 @@ static int instruction_length(unsigned char *iptr,=
 unsigned char *end)<br>
+=C2=A0 =C2=A0 =C2=A0switch (instruction) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case JVM_OPC_tableswitch: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *lpc =3D (int *)UCALIG=
N(iptr + 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc + 2 &gt;=3D (int *=
)end) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1; /=
* do not read pass the end */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D _ck_ntohl(lpc[2]) - _=
ck_ntohl(lpc[1]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t low=C2=A0 =3D _ck_ntohl=
(lpc[1]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t high =3D _ck_ntohl(lpc[=
2]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t index =3D high - low;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // The value of low must be les=
s than or equal to high - i.e. index &gt;=3D 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((index &lt; 0) || (ind=
ex &gt; 65535)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;=
=C2=A0 =C2=A0 =C2=A0 /* illegal */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch b/=
recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch<br>
new file mode 100644<br>
index 0000000..edce6f0<br>
--- /dev/null<br>
+++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-20921.patch<br>
@@ -0,0 +1,657 @@<br>
+From f7cb28de01117f598ecf48ad58e277c3a4590436 Mon Sep 17 00:00:00 2001<br>
+From: Roland Westrelin &lt;<a href=3D"mailto:rwestrel@redhat.com" target=
=3D"_blank">rwestrel@redhat.com</a>&gt;<br>
+Date: Tue, 7 Nov 2023 11:08:30 +0000<br>
+Subject: [PATCH] 8314307: Improve loop handling<br>
+<br>
+Reviewed-by: mbalao, fferrari, andrew<br>
+Backport-of: 62ac93d145ca9fa1ab0c040533c62c42c202703a<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/openjdk/jdk8u/com=
mit/f7cb28de01117f598ecf48ad58e277c3a4590436" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openjdk/jdk8u/commit/f7cb28de01117f598ecf48ad58e=
277c3a4590436</a>]<br>
+CVE: CVE-2024-20921<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ hotspot/src/share/vm/opto/ifnode.cpp=C2=A0 =C2=A0|=C2=A0 59 +++-<br>
+ hotspot/src/share/vm/opto/loopnode.cpp | 422 ++++++++++++++++++++-----<br=
>
+ hotspot/src/share/vm/opto/loopnode.hpp |=C2=A0 =C2=A04 +<br>
+ hotspot/src/share/vm/opto/phaseX.hpp=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
+ 4 files changed, 404 insertions(+), 87 deletions(-)<br>
+<br>
+diff --git a/hotspot/src/share/vm/opto/ifnode.cpp b/hotspot/src/share/vm/o=
pto/ifnode.cpp<br>
+index 68f068d0..51579032 100644<br>
+--- a/hotspot/src/share/vm/opto/ifnode.cpp<br>
++++ b/hotspot/src/share/vm/opto/ifnode.cpp<br>
+@@ -882,6 +882,46 @@ Node *IfNode::Ideal(PhaseGVN *phase, bool can_reshape=
) {<br>
+=C2=A0 =C2=A0 =C2=A0// then we are guaranteed to fail, so just start inter=
preting there.<br>
+=C2=A0 =C2=A0 =C2=A0// We &#39;expand&#39; the top 3 range checks to inclu=
de all post-dominating<br>
+=C2=A0 =C2=A0 =C2=A0// checks.<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // Example:<br>
++=C2=A0 =C2=A0 // a[i+x] // (1) 1 &lt; x &lt; 6<br>
++=C2=A0 =C2=A0 // a[i+3] // (2)<br>
++=C2=A0 =C2=A0 // a[i+4] // (3)<br>
++=C2=A0 =C2=A0 // a[i+6] // max =3D max of all constants<br>
++=C2=A0 =C2=A0 // a[i+2]<br>
++=C2=A0 =C2=A0 // a[i+1] // min =3D min of all constants<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // If x &lt; 3:<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0(1) a[i+x]: Leave unchanged<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0(2) a[i+3]: Replace with a[i+max] =3D a[i+6]=
: i+x &lt; i+3 &lt;=3D i+6=C2=A0 -&gt; (2) is covered<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0(3) a[i+4]: Replace with a[i+min] =3D a[i+1]=
: i+1 &lt; i+4 &lt;=3D i+6=C2=A0 -&gt; (3) and all following checks are cov=
ered<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0Remove all other a[i+c] checks<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // If x &gt;=3D 3:<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0(1) a[i+x]: Leave unchanged<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0(2) a[i+3]: Replace with a[i+min] =3D a[i+1]=
: i+1 &lt; i+3 &lt;=3D i+x=C2=A0 -&gt; (2) is covered<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0(3) a[i+4]: Replace with a[i+max] =3D a[i+6]=
: i+1 &lt; i+4 &lt;=3D i+6=C2=A0 -&gt; (3) and all following checks are cov=
ered<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0Remove all other a[i+c] checks<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // We only need the top 2 range checks if x is the min or m=
ax of all constants.<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // This, however, only works if the interval [i+min,i+max] =
is not larger than max_int (i.e. abs(max - min) &lt; max_int):<br>
++=C2=A0 =C2=A0 // The theoretical max size of an array is max_int with:<br=
>
++=C2=A0 =C2=A0 // - Valid index space: [0,max_int-1]<br>
++=C2=A0 =C2=A0 // - Invalid index space: [max_int,-1] // max_int, min_int,=
 min_int - 1 ..., -1<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // The size of the consecutive valid index space is smaller=
 than the size of the consecutive invalid index space.<br>
++=C2=A0 =C2=A0 // If we choose min and max in such a way that:<br>
++=C2=A0 =C2=A0 // - abs(max - min) &lt; max_int<br>
++=C2=A0 =C2=A0 // - i+max and i+min are inside the valid index space<br>
++=C2=A0 =C2=A0 // then all indices [i+min,i+max] must be in the valid inde=
x space. Otherwise, the invalid index space must be<br>
++=C2=A0 =C2=A0 // smaller than the valid index space which is never the ca=
se for any array size.<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // Choosing a smaller array size only makes the valid index=
 space smaller and the invalid index space larger and<br>
++=C2=A0 =C2=A0 // the argument above still holds.<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // Note that the same optimization with the same maximal ac=
cepted interval size can also be found in C1.<br>
++=C2=A0 =C2=A0 const jlong maximum_number_of_min_max_interval_indices =3D =
(jlong)max_jint;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0// The top 3 range checks seen<br>
+=C2=A0 =C2=A0 =C2=A0const int NRC =3D3;<br>
+@@ -915,13 +955,18 @@ Node *IfNode::Ideal(PhaseGVN *phase, bool can_reshap=
e) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found_immediate_dominator =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Gather expanded bounds<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_lo =3D MIN2(off_lo,offset2);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_hi =3D MAX2(off_hi,offset2);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Record top NRC range checks<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_checks[nb_checks%NRC].ctl =3D pre=
v_dom;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_checks[nb_checks%NRC].off =3D off=
set2;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nb_checks++;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;x - y&quot; -&gt; must add on=
e to the difference for number of elements in [x,y]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const jlong diff =3D (jlong)MIN2(offse=
t2, off_lo) - (jlong)MAX2(offset2, off_hi);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ABS(diff) &lt; maximum_number_of_m=
in_max_interval_indices) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Gather expanded bounds<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_lo =3D MIN2(off_lo, offset2=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_hi =3D MAX2(off_hi, offset2=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Record top NRC range checks<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_checks[nb_checks % NRC].ct=
l =3D prev_dom;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_checks[nb_checks % NRC].of=
f =3D offset2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nb_checks++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prev_dom =3D dom;<br>
+diff --git a/hotspot/src/share/vm/opto/loopnode.cpp b/hotspot/src/share/vm=
/opto/loopnode.cpp<br>
+index b2d5dccd..8bc9dd29 100644<br>
+--- a/hotspot/src/share/vm/opto/loopnode.cpp<br>
++++ b/hotspot/src/share/vm/opto/loopnode.cpp<br>
+@@ -260,6 +260,49 @@ void PhaseIdealLoop::set_subtree_ctrl( Node *n ) {<br=
>
+=C2=A0 =C2=A0set_early_ctrl( n );<br>
+ }<br>
+ <br>
++void PhaseIdealLoop::insert_loop_limit_check(ProjNode* limit_check_proj, =
Node* cmp_limit, Node* bol) {<br>
++=C2=A0 Node* new_predicate_proj =3D create_new_if_for_predicate(limit_che=
ck_proj, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Deoptimization::Reas=
on_loop_limit_check);<br>
++=C2=A0 Node* iff =3D new_predicate_proj-&gt;in(0);<br>
++=C2=A0 assert(iff-&gt;Opcode() =3D=3D Op_If, &quot;bad graph shape&quot;)=
;<br>
++=C2=A0 Node* conv =3D iff-&gt;in(1);<br>
++=C2=A0 assert(conv-&gt;Opcode() =3D=3D Op_Conv2B, &quot;bad graph shape&q=
uot;);<br>
++=C2=A0 Node* opaq =3D conv-&gt;in(1);<br>
++=C2=A0 assert(opaq-&gt;Opcode() =3D=3D Op_Opaque1, &quot;bad graph shape&=
quot;);<br>
++=C2=A0 cmp_limit =3D _igvn.register_new_node_with_optimizer(cmp_limit);<b=
r>
++=C2=A0 bol =3D _igvn.register_new_node_with_optimizer(bol);<br>
++=C2=A0 set_subtree_ctrl(bol);<br>
++=C2=A0 _igvn.replace_input_of(iff, 1, bol);<br>
++<br>
++#ifndef PRODUCT<br>
++=C2=A0 // report that the loop predication has been actually performed<br=
>
++=C2=A0 // for this loop<br>
++=C2=A0 if (TraceLoopLimitCheck) {<br>
++=C2=A0 =C2=A0 tty-&gt;print_cr(&quot;Counted Loop Limit Check generated:&=
quot;);<br>
++=C2=A0 =C2=A0 debug_only( bol-&gt;dump(2); )<br>
++=C2=A0 }<br>
++#endif<br>
++}<br>
++<br>
++static int check_stride_overflow(jlong final_correction, const TypeInt* l=
imit_t) {<br>
++=C2=A0 if (final_correction &gt; 0) {<br>
++=C2=A0 =C2=A0 if (limit_t-&gt;_lo &gt; (max_jint - final_correction)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (limit_t-&gt;_hi &gt; (max_jint - final_correction)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 } else {<br>
++=C2=A0 =C2=A0 if (limit_t-&gt;_hi &lt; (min_jint - final_correction)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return -1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (limit_t-&gt;_lo &lt; (min_jint - final_correction)) {<b=
r>
++=C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 }<br>
++=C2=A0 return 0;<br>
++}<br>
++<br>
+ //------------------------------is_counted_loop--------------------------=
------<br>
+ bool PhaseIdealLoop::is_counted_loop( Node *x, IdealLoopTree *loop ) {<br=
>
+=C2=A0 =C2=A0PhaseGVN *gvn =3D &amp;_igvn;<br>
+@@ -463,51 +506,256 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, Idea=
lLoopTree *loop ) {<br>
+=C2=A0 =C2=A0assert(x-&gt;Opcode() =3D=3D Op_Loop, &quot;regular loops onl=
y&quot;);<br>
+=C2=A0 =C2=A0C-&gt;print_method(PHASE_BEFORE_CLOOPS, 3);<br>
+ <br>
+-=C2=A0 Node *hook =3D new (C) Node(6);<br>
++=C2=A0 Node* adjusted_limit =3D limit;<br>
+ <br>
+=C2=A0 =C2=A0if (LoopLimitCheck) {<br>
+ <br>
+=C2=A0 =C2=A0// =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
+-=C2=A0 // Generate loop limit check to avoid integer overflow<br>
+-=C2=A0 // in cases like next (cyclic loops):<br>
++=C2=A0 // We can only convert this loop to a counted loop if we can guara=
ntee that the iv phi will never overflow at runtime.<br>
++=C2=A0 // This is an implicit assumption taken by some loop optimizations=
. We therefore must ensure this property at all cost.<br>
++=C2=A0 // At this point, we&#39;ve already excluded some trivial cases wh=
ere an overflow could have been proven statically.<br>
++=C2=A0 // But even though we cannot prove that an overflow will *not* hap=
pen, we still want to speculatively convert this loop<br>
++=C2=A0 // to a counted loop. This can be achieved by adding additional iv=
 phi overflow checks before the loop. If they fail,<br>
++=C2=A0 // we trap and resume execution before the loop without having exe=
cuted any iteration of the loop, yet.<br>
+=C2=A0 =C2=A0//<br>
+-=C2=A0 // for (i=3D0; i &lt;=3D max_jint; i++) {}<br>
+-=C2=A0 // for (i=3D0; i &lt;=C2=A0 max_jint; i+=3D2) {}<br>
++=C2=A0 // These additional iv phi overflow checks can be inserted as Loop=
 Limit Check Predicates above the Loop Limit Check<br>
++=C2=A0 // Parse Predicate which captures a JVM state just before the entr=
y of the loop. If there is no such Parse Predicate,<br>
++=C2=A0 // we cannot generate a Loop Limit Check Predicate and thus cannot=
 speculatively convert the loop to a counted loop.<br>
+=C2=A0 =C2=A0//<br>
++=C2=A0 // In the following, we only focus on int loops with stride &gt; 0=
 to keep things simple. The argumentation and proof<br>
++=C2=A0 // for stride &lt; 0 is analogously. For long loops, we would repl=
ace max_int with max_long.<br>
+=C2=A0 =C2=A0//<br>
+-=C2=A0 // Limit check predicate depends on the loop test:<br>
+=C2=A0 =C2=A0//<br>
+-=C2=A0 // for(;i !=3D limit; i++)=C2=A0 =C2=A0 =C2=A0 =C2=A0--&gt; limit =
&lt;=3D (max_jint)<br>
+-=C2=A0 // for(;i &lt;=C2=A0 limit; i+=3Dstride) --&gt; limit &lt;=3D (max=
_jint - stride + 1)<br>
+-=C2=A0 // for(;i &lt;=3D limit; i+=3Dstride) --&gt; limit &lt;=3D (max_ji=
nt - stride=C2=A0 =C2=A0 )<br>
++=C2=A0 // The loop to be converted does not always need to have the often=
 used shape:<br>
+=C2=A0 =C2=A0//<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D init<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0i =3D init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 loop:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// ...=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0equivalent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
i+=3Dstride<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i+=3Dstride=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=3D=3D&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (i &lt; limit)<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0} while (i &lt; limit);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto =
loop<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0exit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
++=C2=A0 //<br>
++=C2=A0 // where the loop exit check uses the post-incremented iv phi and =
a &#39;&lt;&#39;-operator.<br>
++=C2=A0 //<br>
++=C2=A0 // We could also have &#39;&lt;=3D&#39;-operator (or &#39;&gt;=3D&=
#39;-operator for negative strides) or use the pre-incremented iv phi value=
<br>
++=C2=A0 // in the loop exit check:<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D init<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0loop:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i &lt;=3D limit)<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i+=3Dstride<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto loop<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0exit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
++=C2=A0 //<br>
++=C2=A0 // Let&#39;s define the following terms:<br>
++=C2=A0 // - iv_pre_i: The pre-incremented iv phi before the i-th iteratio=
n.<br>
++=C2=A0 // - iv_post_i: The post-incremented iv phi after the i-th iterati=
on.<br>
++=C2=A0 //<br>
++=C2=A0 // The iv_pre_i and iv_post_i have the following relation:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 iv_pre_i + stride =3D iv_post_i<br>
++=C2=A0 //<br>
++=C2=A0 // When converting a loop to a counted loop, we want to have a can=
onicalized loop exit check of the form:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0iv_post_i &lt; adjusted_limit<br>
++=C2=A0 //<br>
++=C2=A0 // If that is not the case, we need to canonicalize the loop exit =
check by using different values for adjusted_limit:<br>
++=C2=A0 // (LE1) iv_post_i &lt; limit: Already canonicalized. We can direc=
tly use limit as adjusted_limit.<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; adjusted_limit =
=3D limit.<br>
++=C2=A0 // (LE2) iv_post_i &lt;=3D limit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iv_post_i &lt; limit + =
1<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; adjusted limit =
=3D limit + 1<br>
++=C2=A0 // (LE3) iv_pre_i &lt; limit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iv_pre_i + stride &lt; =
limit + stride<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iv_post_i &lt; limit + =
stride<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; adjusted_limit =
=3D limit + stride<br>
++=C2=A0 // (LE4) iv_pre_i &lt;=3D limit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iv_pre_i &lt; limit + 1=
<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iv_pre_i + stride &lt; =
limit + stride + 1<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iv_post_i &lt; limit + =
stride + 1<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; adjusted_limit =
=3D limit + stride + 1<br>
++=C2=A0 //<br>
++=C2=A0 // Note that:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0(AL) limit &lt;=3D adjusted_limit.<br>
++=C2=A0 //<br>
++=C2=A0 // The following loop invariant has to hold for counted loops with=
 n iterations (i.e. loop exit check true after n-th<br>
++=C2=A0 // loop iteration) and a canonicalized loop exit check to guarante=
e that no iv_post_i over- or underflows:<br>
++=C2=A0 // (INV) For i =3D 1..n, min_int &lt;=3D iv_post_i &lt;=3D max_int=
<br>
++=C2=A0 //<br>
++=C2=A0 // To prove (INV), we require the following two conditions/assumpt=
ions:<br>
++=C2=A0 // (i): adjusted_limit - 1 + stride &lt;=3D max_int<br>
++=C2=A0 // (ii): init &lt; limit<br>
++=C2=A0 //<br>
++=C2=A0 // If we can prove (INV), we know that there can be no over- or un=
derflow of any iv phi value. We prove (INV) by<br>
++=C2=A0 // induction by assuming (i) and (ii).<br>
++=C2=A0 //<br>
++=C2=A0 // Proof by Induction<br>
++=C2=A0 // ------------------<br>
++=C2=A0 // &gt; Base case (i =3D 1): We show that (INV) holds after the fi=
rst iteration:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0min_int &lt;=3D iv_post_1 =3D init + stride =
&lt;=3D max_int<br>
++=C2=A0 // Proof:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0First, we note that (ii) implies<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(iii) init &lt;=3D limit - 1<b=
r>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0max_int &gt;=3D adjusted_limit - 1 + stride=
=C2=A0 =C2=A0[using (i)]<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D limit - =
1 + stride=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [using (AL)]<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D init + s=
tride=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[using (=
iii)]<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D min_int=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[using stride &gt; 0, no underflow]<br>
++=C2=A0 // Thus, no overflow happens after the first iteration and (INV) h=
olds for i =3D 1.<br>
++=C2=A0 //<br>
++=C2=A0 // Note that to prove the base case we need (i) and (ii).<br>
++=C2=A0 //<br>
++=C2=A0 // &gt; Induction Hypothesis (i =3D j, j &gt; 1): Assume that (INV=
) holds after the j-th iteration:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0min_int &lt;=3D iv_post_j &lt;=3D max_int<br=
>
++=C2=A0 // &gt; Step case (i =3D j + 1): We show that (INV) also holds aft=
er the j+1-th iteration:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0min_int &lt;=3D iv_post_{j+1} =3D iv_post_j =
+ stride &lt;=3D max_int<br>
++=C2=A0 // Proof:<br>
++=C2=A0 // If iv_post_j &gt;=3D adjusted_limit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0We exit the loop after the j-th iteration, a=
nd we don&#39;t execute the j+1-th iteration anymore. Thus, there is<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0also no iv_{j+1}. Since (INV) holds for iv_j=
, there is nothing left to prove.<br>
++=C2=A0 // If iv_post_j &lt; adjusted_limit:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0First, we note that:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(iv) iv_post_j &lt;=3D adjuste=
d_limit - 1<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0max_int &gt;=3D adjusted_limit - 1 + stride=
=C2=A0 =C2=A0 [using (i)]<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D iv_post_=
j + stride=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[using (iv)]<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=3D min_int=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [using stride &gt; 0, no underflow]<br>
++=C2=A0 //<br>
++=C2=A0 // Note that to prove the step case we only need (i).<br>
++=C2=A0 //<br>
++=C2=A0 // Thus, by assuming (i) and (ii), we proved (INV).<br>
++=C2=A0 //<br>
++=C2=A0 //<br>
++=C2=A0 // It is therefore enough to add the following two Loop Limit Chec=
k Predicates to check assumptions (i) and (ii):<br>
++=C2=A0 //<br>
++=C2=A0 // (1) Loop Limit Check Predicate for (i):<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0Using (i): adjusted_limit - 1 + stride &lt;=
=3D max_int<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0This condition is now restated to use limit =
instead of adjusted_limit:<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0To prevent an overflow of adjusted_limit -1 =
+ stride itself, we rewrite this check to<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_int - stride + 1 &gt;=3D a=
djusted_limit<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0We can merge the two constants into<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0canonicalized_correction =3D s=
tride - 1<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0which gives us<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_int - canonicalized_correction &=
gt;=3D adjusted_limit<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0To directly use limit instead of adjusted_li=
mit in the predicate condition, we split adjusted_limit into:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adjusted_limit =3D limit + lim=
it_correction<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0Since stride &gt; 0 and limit_correction &lt=
;=3D stride + 1, we can restate this with no over- or underflow into:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_int - canonicalized_correc=
tion - limit_correction &gt;=3D limit<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0Since canonicalized_correction and limit_cor=
rection are both constants, we can replace them with a new constant:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0final_correction =3D canonical=
ized_correction + limit_correction<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0which gives us:<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0Final predicate condition:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_int - final_correction &gt=
;=3D limit<br>
++=C2=A0 //<br>
++=C2=A0 // (2) Loop Limit Check Predicate for (ii):<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0Using (ii): init &lt; limit<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0This Loop Limit Check Predicate is not requi=
red if we can prove at compile time that either:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2.1) type(init) &lt; type(limit)<br=
>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In this case, we=
 know:<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0al=
l possible values of init &lt; all possible values of limit<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and we can skip =
the predicate.<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2.2) init &lt; limit is already che=
cked before (i.e. found as a dominating check)<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In this case, we do no=
t need to re-check the condition and can skip the predicate.<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is often found fo=
r while- and for-loops which have the following shape:<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (init=
 &lt; limit) { // Dominating test. Do not need the Loop Limit Check Predica=
te below.<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 i =3D init;<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (init &gt;=3D limit) { trap(); } // Here we would insert the Loop=
 Limit Check Predicate<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 do {<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 i +=3D stride;<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } while (i &lt; limit);<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 //<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2.3) init + stride &lt;=3D max_int<=
br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In this case, there is=
 no overflow of the iv phi after the first loop iteration.<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In the proof of the ba=
se case above we showed that init + stride &lt;=3D max_int by using assumpt=
ion (ii):<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 init &lt=
; limit<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In the proof of the st=
ep case above, we did not need (ii) anymore. Therefore, if we already know =
at<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compile time that init=
 + stride &lt;=3D max_int then we have trivially proven the base case and t=
hat<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 there is no overflow o=
f the iv phi after the first iteration. In this case, we don&#39;t need to =
check (ii)<br>
++=C2=A0 //=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 again and can skip the=
 predicate.<br>
++<br>
++<br>
++=C2=A0 // Accounting for (LE3) and (LE4) where we use pre-incremented phi=
s in the loop exit check.<br>
++=C2=A0 const jlong limit_correction_for_pre_iv_exit_check =3D (phi_incr !=
=3D NULL) ? stride_con : 0;<br>
++<br>
++=C2=A0 // Accounting for (LE2) and (LE4) where we use &lt;=3D or &gt;=3D =
in the loop exit check.<br>
++=C2=A0 const bool includes_limit =3D (bt =3D=3D BoolTest::le || bt =3D=3D=
 BoolTest::ge);<br>
++=C2=A0 const jlong limit_correction_for_le_ge_exit_check =3D (includes_li=
mit ? (stride_con &gt; 0 ? 1 : -1) : 0);<br>
++<br>
++=C2=A0 const jlong limit_correction =3D limit_correction_for_pre_iv_exit_=
check + limit_correction_for_le_ge_exit_check;<br>
++=C2=A0 const jlong canonicalized_correction =3D stride_con + (stride_con =
&gt; 0 ? -1 : 1);<br>
++=C2=A0 const jlong final_correction =3D canonicalized_correction + limit_=
correction;<br>
++<br>
++=C2=A0 int sov =3D check_stride_overflow(final_correction, limit_t);<br>
++<br>
++=C2=A0 // If sov=3D=3D0, limit&#39;s type always satisfies the condition,=
 for<br>
++=C2=A0 // example, when it is an array length.<br>
++=C2=A0 if (sov !=3D 0) {<br>
++=C2=A0 =C2=A0 if (sov &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 // Bailout: integer overflow is =
certain.<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 // (1) Loop Limit Check Predicate is required because we co=
uld not statically prove that<br>
++=C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0limit + final_correction =3D adjusted=
_limit - 1 + stride &lt;=3D max_int<br>
++=C2=A0 =C2=A0 ProjNode *limit_check_proj =3D find_predicate_insertion_poi=
nt(init_control, Deoptimization::Reason_loop_limit_check);<br>
++=C2=A0 =C2=A0 if (!limit_check_proj) {<br>
++=C2=A0 =C2=A0 =C2=A0 // The Loop Limit Check Parse Predicate is not gener=
ated if this method trapped here before.<br>
++#ifdef ASSERT<br>
++=C2=A0 =C2=A0 =C2=A0 if (TraceLoopLimitCheck) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tty-&gt;print(&quot;missing loop limit check:=
&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 loop-&gt;dump_head();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 x-&gt;dump(1);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++#endif<br>
++=C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+-=C2=A0 // Check if limit is excluded to do more precise int overflow chec=
k.<br>
+-=C2=A0 bool incl_limit =3D (bt =3D=3D BoolTest::le || bt =3D=3D BoolTest:=
:ge);<br>
+-=C2=A0 int stride_m=C2=A0 =3D stride_con - (incl_limit ? 0 : (stride_con =
&gt; 0 ? 1 : -1));<br>
+-<br>
+-=C2=A0 // If compare points directly to the phi we need to adjust<br>
+-=C2=A0 // the compare so that it points to the incr. Limit have<br>
+-=C2=A0 // to be adjusted to keep trip count the same and the<br>
+-=C2=A0 // adjusted limit should be checked for int overflow.<br>
+-=C2=A0 if (phi_incr !=3D NULL) {<br>
+-=C2=A0 =C2=A0 stride_m=C2=A0 +=3D stride_con;<br>
+-=C2=A0 }<br>
++=C2=A0 =C2=A0 IfNode* check_iff =3D limit_check_proj-&gt;in(0)-&gt;as_If(=
);<br>
+ <br>
+-=C2=A0 if (limit-&gt;is_Con()) {<br>
+-=C2=A0 =C2=A0 int limit_con =3D limit-&gt;get_int();<br>
+-=C2=A0 =C2=A0 if ((stride_con &gt; 0 &amp;&amp; limit_con &gt; (max_jint =
- stride_m)) ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (stride_con &lt; 0 &amp;&amp; limit_con &lt; =
(min_jint - stride_m))) {<br>
+-=C2=A0 =C2=A0 =C2=A0 // Bailout: it could be integer overflow.<br>
++=C2=A0 =C2=A0 if (!is_dominator(get_ctrl(limit), check_iff-&gt;in(0))) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 } else if ((stride_con &gt; 0 &amp;&amp; limit_t-&gt;_hi &lt;=3D (=
max_jint - stride_m)) ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(stride_con &lt; 0 &amp;&=
amp; limit_t-&gt;_lo &gt;=3D (min_jint - stride_m))) {<br>
+-=C2=A0 =C2=A0 =C2=A0 // Limit&#39;s type may satisfy the condition, for e=
xample,<br>
+-=C2=A0 =C2=A0 =C2=A0 // when it is an array length.<br>
+-=C2=A0 } else {<br>
+-=C2=A0 =C2=A0 // Generate loop&#39;s limit check.<br>
+-=C2=A0 =C2=A0 // Loop limit check predicate should be near the loop.<br>
++<br>
++=C2=A0 =C2=A0 Node* cmp_limit;<br>
++=C2=A0 =C2=A0 Node* bol;<br>
++<br>
++=C2=A0 =C2=A0 if (stride_con &gt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(m=
ax_jint - final_correction));<br>
++=C2=A0 =C2=A0 =C2=A0 bol =3D new (C) BoolNode(cmp_limit, BoolTest::le);<b=
r>
++=C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(m=
in_jint - final_correction));<br>
++=C2=A0 =C2=A0 =C2=A0 bol =3D new (C) BoolNode(cmp_limit, BoolTest::ge);<b=
r>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 insert_loop_limit_check(limit_check_proj, cmp_limit, bol);<=
br>
++=C2=A0 }<br>
++<br>
++=C2=A0 // (2.3)<br>
++=C2=A0 const bool init_plus_stride_could_overflow =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (stride_con &gt; 0 &amp;&amp; init_t-&=
gt;_hi &gt; max_jint - stride_con) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (stride_con &lt; 0 &amp;&amp; init_t-&=
gt;_lo &lt; min_jint - stride_con);<br>
++=C2=A0 // (2.1)<br>
++=C2=A0 const bool init_gte_limit =3D (stride_con &gt; 0 &amp;&amp; init_t=
-&gt;_hi &gt;=3D limit_t-&gt;_lo) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (stride_con &lt; 0 &amp;&amp; init_t-&gt;_l=
o &lt;=3D limit_t-&gt;_hi);<br>
++<br>
++=C2=A0 if (init_gte_limit &amp;&amp; // (2.1)<br>
++=C2=A0 =C2=A0 =C2=A0((bt =3D=3D BoolTest::ne || init_plus_stride_could_ov=
erflow) &amp;&amp; // (2.3)<br>
++=C2=A0 =C2=A0 =C2=A0 !has_dominating_loop_limit_check(init_trip, limit, s=
tride_con, init_control))) { // (2.2)<br>
++=C2=A0 =C2=A0 // (2) Iteration Loop Limit Check Predicate is required bec=
ause neither (2.1), (2.2), nor (2.3) holds.<br>
++=C2=A0 =C2=A0 // We use the following condition:<br>
++=C2=A0 =C2=A0 // - stride &gt; 0: init &lt; limit<br>
++=C2=A0 =C2=A0 // - stride &lt; 0: init &gt; limit<br>
++=C2=A0 =C2=A0 //<br>
++=C2=A0 =C2=A0 // This predicate is always required if we have a non-equal=
-operator in the loop exit check (where stride =3D 1 is<br>
++=C2=A0 =C2=A0 // a requirement). We transform the loop exit check by usin=
g a less-than-operator. By doing so, we must always<br>
++=C2=A0 =C2=A0 // check that init &lt; limit. Otherwise, we could have a d=
ifferent number of iterations at runtime.<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0ProjNode *limit_check_proj =3D find_predicate_insertio=
n_point(init_control, Deoptimization::Reason_loop_limit_check);<br>
+=C2=A0 =C2=A0 =C2=A0if (!limit_check_proj) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// The limit check predicate is not generated i=
f this method trapped here before.<br>
+@@ -520,41 +768,38 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, Ideal=
LoopTree *loop ) {<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0IfNode* check_iff =3D limit_check_proj-&gt;in(0)-&gt;a=
s_If();<br>
++<br>
++=C2=A0 =C2=A0 if (!is_dominator(get_ctrl(limit), check_iff-&gt;in(0)) ||<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !is_dominator(get_ctrl(init_trip), check_iff-=
&gt;in(0))) {<br>
++=C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0Node* cmp_limit;<br>
+=C2=A0 =C2=A0 =C2=A0Node* bol;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (stride_con &gt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(m=
ax_jint - stride_m));<br>
+-=C2=A0 =C2=A0 =C2=A0 bol =3D new (C) BoolNode(cmp_limit, BoolTest::le);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 cmp_limit =3D new (C) CmpINode(init_trip, limit);<br=
>
++=C2=A0 =C2=A0 =C2=A0 bol =3D new (C) BoolNode(cmp_limit, BoolTest::lt);<b=
r>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 cmp_limit =3D new (C) CmpINode(limit, _igvn.intcon(m=
in_jint - stride_m));<br>
+-=C2=A0 =C2=A0 =C2=A0 bol =3D new (C) BoolNode(cmp_limit, BoolTest::ge);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 cmp_limit =3D new (C) CmpINode(init_trip, limit);<br=
>
++=C2=A0 =C2=A0 =C2=A0 bol =3D new (C) BoolNode(cmp_limit, BoolTest::gt);<b=
r>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 cmp_limit =3D _igvn.register_new_node_with_optimizer(cmp_li=
mit);<br>
+-=C2=A0 =C2=A0 bol =3D _igvn.register_new_node_with_optimizer(bol);<br>
+-=C2=A0 =C2=A0 set_subtree_ctrl(bol);<br>
+-<br>
+-=C2=A0 =C2=A0 // Replace condition in original predicate but preserve Opa=
que node<br>
+-=C2=A0 =C2=A0 // so that previous predicates could be found.<br>
+-=C2=A0 =C2=A0 assert(check_iff-&gt;in(1)-&gt;Opcode() =3D=3D Op_Conv2B &a=
mp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_iff-&gt;in(1)-&gt;in(1)-&g=
t;Opcode() =3D=3D Op_Opaque1, &quot;&quot;);<br>
+-=C2=A0 =C2=A0 Node* opq =3D check_iff-&gt;in(1)-&gt;in(1);<br>
+-=C2=A0 =C2=A0 _igvn.hash_delete(opq);<br>
+-=C2=A0 =C2=A0 opq-&gt;set_req(1, bol);<br>
+-=C2=A0 =C2=A0 // Update ctrl.<br>
+-=C2=A0 =C2=A0 set_ctrl(opq, check_iff-&gt;in(0));<br>
+-=C2=A0 =C2=A0 set_ctrl(check_iff-&gt;in(1), check_iff-&gt;in(0));<br>
+ <br>
+-#ifndef PRODUCT<br>
+-=C2=A0 =C2=A0 // report that the loop predication has been actually perfo=
rmed<br>
+-=C2=A0 =C2=A0 // for this loop<br>
+-=C2=A0 =C2=A0 if (TraceLoopLimitCheck) {<br>
+-=C2=A0 =C2=A0 =C2=A0 tty-&gt;print_cr(&quot;Counted Loop Limit Check gene=
rated:&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 debug_only( bol-&gt;dump(2); )<br>
++=C2=A0 =C2=A0 insert_loop_limit_check(limit_check_proj, cmp_limit, bol);<=
br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (bt =3D=3D BoolTest::ne) {<br>
++=C2=A0 =C2=A0 // Now we need to canonicalize the loop condition if it is =
&#39;ne&#39;.<br>
++=C2=A0 =C2=A0 assert(stride_con =3D=3D 1 || stride_con =3D=3D -1, &quot;s=
imple increment only - checked before&quot;);<br>
++=C2=A0 =C2=A0 if (stride_con &gt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 // &#39;ne&#39; can be replaced with &#39;lt&#39; on=
ly when init &lt; limit. This is ensured by the inserted predicate above.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 bt =3D BoolTest::lt;<br>
++=C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 assert(stride_con &lt; 0, &quot;must be&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 // &#39;ne&#39; can be replaced with &#39;gt&#39; on=
ly when init &gt; limit. This is ensured by the inserted predicate above.<b=
r>
++=C2=A0 =C2=A0 =C2=A0 bt =3D BoolTest::gt;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-#endif<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0if (phi_incr !=3D NULL) {<br>
+@@ -567,26 +812,15 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, Ideal=
LoopTree *loop ) {<br>
+=C2=A0 =C2=A0 =C2=A0// is converted to<br>
+=C2=A0 =C2=A0 =C2=A0//=C2=A0 =C2=A0i =3D init; do {} while(++i &lt; limit+=
1);<br>
+=C2=A0 =C2=A0 =C2=A0//<br>
+-=C2=A0 =C2=A0 limit =3D gvn-&gt;transform(new (C) AddINode(limit, stride)=
);<br>
+-=C2=A0 }<br>
+-<br>
+-=C2=A0 // Now we need to canonicalize loop condition.<br>
+-=C2=A0 if (bt =3D=3D BoolTest::ne) {<br>
+-=C2=A0 =C2=A0 assert(stride_con =3D=3D 1 || stride_con =3D=3D -1, &quot;s=
imple increment only&quot;);<br>
+-=C2=A0 =C2=A0 // &#39;ne&#39; can be replaced with &#39;lt&#39; only when=
 init &lt; limit.<br>
+-=C2=A0 =C2=A0 if (stride_con &gt; 0 &amp;&amp; init_t-&gt;_hi &lt; limit_=
t-&gt;_lo)<br>
+-=C2=A0 =C2=A0 =C2=A0 bt =3D BoolTest::lt;<br>
+-=C2=A0 =C2=A0 // &#39;ne&#39; can be replaced with &#39;gt&#39; only when=
 init &gt; limit.<br>
+-=C2=A0 =C2=A0 if (stride_con &lt; 0 &amp;&amp; init_t-&gt;_lo &gt; limit_=
t-&gt;_hi)<br>
+-=C2=A0 =C2=A0 =C2=A0 bt =3D BoolTest::gt;<br>
++=C2=A0 =C2=A0 adjusted_limit =3D gvn-&gt;transform(new (C) AddINode(limit=
, stride));<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 if (incl_limit) {<br>
++=C2=A0 if (includes_limit) {<br>
+=C2=A0 =C2=A0 =C2=A0// The limit check guaranties that &#39;limit &lt;=3D =
(max_jint - stride)&#39; so<br>
+=C2=A0 =C2=A0 =C2=A0// we can convert &#39;i &lt;=3D limit&#39; to &#39;i =
&lt; limit+1&#39; since stride !=3D 0.<br>
+=C2=A0 =C2=A0 =C2=A0//<br>
+=C2=A0 =C2=A0 =C2=A0Node* one =3D (stride_con &gt; 0) ? gvn-&gt;intcon( 1)=
 : gvn-&gt;intcon(-1);<br>
+-=C2=A0 =C2=A0 limit =3D gvn-&gt;transform(new (C) AddINode(limit, one));<=
br>
++=C2=A0 =C2=A0 adjusted_limit =3D gvn-&gt;transform(new (C) AddINode(adjus=
ted_limit, one));<br>
+=C2=A0 =C2=A0 =C2=A0if (bt =3D=3D BoolTest::le)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bt =3D BoolTest::lt;<br>
+=C2=A0 =C2=A0 =C2=A0else if (bt =3D=3D BoolTest::ge)<br>
+@@ -594,10 +828,11 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, Ideal=
LoopTree *loop ) {<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ShouldNotReachHere();<br>
+=C2=A0 =C2=A0}<br>
+-=C2=A0 set_subtree_ctrl( limit );<br>
++=C2=A0 set_subtree_ctrl(adjusted_limit);<br>
+ <br>
+=C2=A0 =C2=A0} else { // LoopLimitCheck<br>
+ <br>
++=C2=A0 Node *hook =3D new (C) Node(6);<br>
+=C2=A0 =C2=A0// If compare points to incr, we are ok.=C2=A0 Otherwise the =
compare<br>
+=C2=A0 =C2=A0// can directly point to the phi; in this case adjust the com=
pare so that<br>
+=C2=A0 =C2=A0// it points to the incr by adjusting the limit.<br>
+@@ -691,6 +926,11 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, IdealL=
oopTree *loop ) {<br>
+=C2=A0 =C2=A0limit =3D gvn-&gt;transform(new (C) AddINode(span,init_trip))=
;<br>
+=C2=A0 =C2=A0set_subtree_ctrl( limit );<br>
+ <br>
++=C2=A0 adjusted_limit =3D limit;<br>
++<br>
++=C2=A0 // Free up intermediate goo<br>
++=C2=A0 _igvn.remove_dead_node(hook);<br>
++<br>
+=C2=A0 =C2=A0} // LoopLimitCheck<br>
+ <br>
+=C2=A0 =C2=A0if (!UseCountedLoopSafepoints) {<br>
+@@ -728,7 +968,7 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, IdealLo=
opTree *loop ) {<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0cmp =3D cmp-&gt;clone();<br>
+=C2=A0 =C2=A0cmp-&gt;set_req(1,incr);<br>
+-=C2=A0 cmp-&gt;set_req(2,limit);<br>
++=C2=A0 cmp-&gt;set_req(2, adjusted_limit);<br>
+=C2=A0 =C2=A0cmp =3D _igvn.register_new_node_with_optimizer(cmp);<br>
+=C2=A0 =C2=A0set_ctrl(cmp, iff-&gt;in(0));<br>
+ <br>
+@@ -802,9 +1042,6 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, IdealL=
oopTree *loop ) {<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 // Free up intermediate goo<br>
+-=C2=A0 _igvn.remove_dead_node(hook);<br>
+-<br>
+ #ifdef ASSERT<br>
+=C2=A0 =C2=A0assert(l-&gt;is_valid_counted_loop(), &quot;counted loop shap=
e is messed up&quot;);<br>
+=C2=A0 =C2=A0assert(l =3D=3D loop-&gt;_head &amp;&amp; l-&gt;phi() =3D=3D =
phi &amp;&amp; l-&gt;loopexit() =3D=3D lex, &quot;&quot; );<br>
+@@ -821,6 +1058,37 @@ bool PhaseIdealLoop::is_counted_loop( Node *x, Ideal=
LoopTree *loop ) {<br>
+=C2=A0 =C2=A0return true;<br>
+ }<br>
+ <br>
++// Check if there is a dominating loop limit check of the form &#39;init =
&lt; limit&#39; starting at the loop entry.<br>
++// If there is one, then we do not need to create an additional Loop Limi=
t Check Predicate.<br>
++bool PhaseIdealLoop::has_dominating_loop_limit_check(Node* init_trip, Nod=
e* limit, const int stride_con,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Node* loop_entry) {<br>
++=C2=A0 // Eagerly call transform() on the Cmp and Bool node to common the=
m up if possible. This is required in order to<br>
++=C2=A0 // successfully find a dominated test with the If node below.<br>
++=C2=A0 Node* cmp_limit;<br>
++=C2=A0 Node* bol;<br>
++=C2=A0 if (stride_con &gt; 0) {<br>
++=C2=A0 =C2=A0 cmp_limit =3D _igvn.transform(new (C) CmpINode(init_trip, l=
imit));<br>
++=C2=A0 =C2=A0 bol =3D _igvn.transform(new (C) BoolNode(cmp_limit, BoolTes=
t::lt));<br>
++=C2=A0 } else {<br>
++=C2=A0 =C2=A0 cmp_limit =3D _igvn.transform(new (C) CmpINode(init_trip, l=
imit));<br>
++=C2=A0 =C2=A0 bol =3D _igvn.transform(new (C) BoolNode(cmp_limit, BoolTes=
t::gt));<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 // Check if there is already a dominating init &lt; limit check. I=
f so, we do not need a Loop Limit Check Predicate.<br>
++=C2=A0 IfNode* iff =3D new (C) IfNode(loop_entry, bol, PROB_MIN, COUNT_UN=
KNOWN);<br>
++=C2=A0 // Also add fake IfProj nodes in order to call transform() on the =
newly created IfNode.<br>
++=C2=A0 IfFalseNode* if_false =3D new (C) IfFalseNode(iff);<br>
++=C2=A0 IfTrueNode* if_true =3D new (C) IfTrueNode(iff);<br>
++=C2=A0 Node* dominated_iff =3D _igvn.transform(iff);<br>
++=C2=A0 // ConI node? Found dominating test (IfNode::dominated_by() return=
s a ConI node).<br>
++=C2=A0 const bool found_dominating_test =3D dominated_iff !=3D NULL &amp;=
&amp; dominated_iff-&gt;Opcode() =3D=3D Op_ConI;<br>
++<br>
++=C2=A0 // Kill the If with its projections again in the next IGVN round b=
y cutting it off from the graph.<br>
++=C2=A0 _igvn.replace_input_of(iff, 0, C-&gt;top());<br>
++=C2=A0 _igvn.replace_input_of(iff, 1, C-&gt;top());<br>
++=C2=A0 return found_dominating_test;<br>
++}<br>
++<br>
+ //----------------------exact_limit--------------------------------------=
-----<br>
+ Node* PhaseIdealLoop::exact_limit( IdealLoopTree *loop ) {<br>
+=C2=A0 =C2=A0assert(loop-&gt;_head-&gt;is_CountedLoop(), &quot;&quot;);<br=
>
+diff --git a/hotspot/src/share/vm/opto/loopnode.hpp b/hotspot/src/share/vm=
/opto/loopnode.hpp<br>
+index 55a7def3..3ae41f8d 100644<br>
+--- a/hotspot/src/share/vm/opto/loopnode.hpp<br>
++++ b/hotspot/src/share/vm/opto/loopnode.hpp<br>
+@@ -896,6 +896,10 @@ public:<br>
+=C2=A0 =C2=A0// Create a new if above the uncommon_trap_if_pattern for the=
 predicate to be promoted<br>
+=C2=A0 =C2=A0ProjNode* create_new_if_for_predicate(ProjNode* cont_proj, No=
de* new_entry,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0De=
optimization::DeoptReason reason);<br>
++=C2=A0 void insert_loop_limit_check(ProjNode* limit_check_proj, Node* cmp=
_limit, Node* bol);<br>
++=C2=A0 bool has_dominating_loop_limit_check(Node* init_trip, Node* limit,=
 int stride_con,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Node* loo=
p_entry);<br>
++<br>
+=C2=A0 =C2=A0void register_control(Node* n, IdealLoopTree *loop, Node* pre=
d);<br>
+ <br>
+=C2=A0 =C2=A0// Clone loop predicates to cloned loops (peeled, unswitched)=
<br>
+diff --git a/hotspot/src/share/vm/opto/phaseX.hpp b/hotspot/src/share/vm/o=
pto/phaseX.hpp<br>
+index a2a2a538..bd7393ac 100644<br>
+--- a/hotspot/src/share/vm/opto/phaseX.hpp<br>
++++ b/hotspot/src/share/vm/opto/phaseX.hpp<br>
+@@ -431,9 +431,6 @@ private:<br>
+ <br>
+ protected:<br>
+ <br>
+-=C2=A0 // Idealize new Node &#39;n&#39; with respect to its inputs and it=
s value<br>
+-=C2=A0 virtual Node *transform( Node *a_node );<br>
+-<br>
+=C2=A0 =C2=A0// Warm up hash table, type table and initial worklist<br>
+=C2=A0 =C2=A0void init_worklist( Node *a_root );<br>
+ <br>
+@@ -447,6 +444,9 @@ public:<br>
+=C2=A0 =C2=A0PhaseIterGVN( PhaseGVN *gvn ); // Used after Parser<br>
+=C2=A0 =C2=A0PhaseIterGVN( PhaseIterGVN *igvn, const char *dummy ); // Use=
d after +VerifyOpto<br>
+ <br>
++=C2=A0 // Idealize new Node &#39;n&#39; with respect to its inputs and it=
s value<br>
++=C2=A0 virtual Node *transform( Node *a_node );<br>
++<br>
+=C2=A0 =C2=A0virtual PhaseIterGVN *is_IterGVN() { return this; }<br>
+ <br>
+=C2=A0 =C2=A0Unique_Node_List _worklist;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Iter=
ative worklist<br>
+-- <br>
+2.25.1<br>
+<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111138): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111138" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111138</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106923033/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106923033/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c2bbe1061bebf3d7--

