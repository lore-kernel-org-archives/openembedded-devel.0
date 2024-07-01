Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6F1C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 05:18:32 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.12711.1719811101962680913
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 22:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IGIxNHOE;
 spf=pass (domain: mvista.com, ip: 209.85.218.43, mailfrom: rsangam@mvista.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a72420e84feso280257466b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 22:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719811100; x=1720415900; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zz9GnSsIomY9n0urXryO4il0xGmau0OQEflVE29EJig=;
        b=IGIxNHOEpTzGL61/2z3Xo1qnfEJ5498RtSchProVh70XeDPJibmWPZCVaQX4gBBh4q
         FmoYophS8c3kofgcIVCev1ln/x9FOwyG0HPnasp6zIJVNaQ0th02s/2vGmrMdBuabyd6
         llVJdZmXwt82prPxPFibHKQIz6TJ5Qkex0AAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719811100; x=1720415900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zz9GnSsIomY9n0urXryO4il0xGmau0OQEflVE29EJig=;
        b=LOlTnKZGxK5PkQzYP94bCx5s38GVR3mkmG4k1eK/Rkb7hoQOWUkp3qy/XSbrlBJJdr
         aD49Nf0/RYWdkT77ntJ4usdWxOZ3DPh08KWsyEEV1Hgftlp10LR6+65hW9bt63B0J2I0
         j988fameX1dk5jbMEfjteZdrpRl7YyOep4tZqoFAkelvAbej2TEcDcDX33P3gQEk309t
         OXNP1y5qsykczQL3VOqoQUrT6U2y6+OIL8PYghZPic2oKAJjewB2pZIu5JNi/F1vK/ze
         gT+EQfh0S4xCSGc21NeDGo9Pmh5FZYrXuqfOVn06mD9dsFjmpnbOZ+zN4FxJqscvr3+J
         gieA==
X-Gm-Message-State: AOJu0YwVCtY56EOVhCvGwUOSrRxaISGf1cIcyoexb0dV65wuwaQh7w8e
	nt+61uLQYFCd+RcE9dSH5DgqBzWh7D0Ft4yFTE9bcmbiyiWSg9tBdqRnJJEKlltoB9gQxx/8a/G
	aV8sL9XKMRfIJPlzphR3tJT1d5IHJtiSN6VQ2Xw==
X-Google-Smtp-Source: AGHT+IEmQdyMVF9vSDNDAe/T32/6mVyMMyillRsbeqBDrIm1tqSPQ5rFfT9ZUbU1JH9l0HDKINu3SwrYZH9err5kt9I=
X-Received: by 2002:a17:906:8308:b0:a72:4320:19f3 with SMTP id
 a640c23a62f3a-a751449f0a0mr304019366b.39.1719811100095; Sun, 30 Jun 2024
 22:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <17D7E05663617376.5431@lists.openembedded.org>
In-Reply-To: <17D7E05663617376.5431@lists.openembedded.org>
From: Rohini Sangam <rsangam@mvista.com>
Date: Mon, 1 Jul 2024 10:48:07 +0530
Message-ID: <CAL7QmvDDRzAhSj+ggUCNYhnbXt0TMOakcYjnEdOu-=F7Cpjjjw@mail.gmail.com>
Subject: Re: [oe] [meta-java][kirkstone][PATCH] openjdk-8: Security fix for CVE-2024-21094
To: rsangam@mvista.com
Cc: openembedded-devel@lists.openembedded.org, 
	Siddharth Doshi <sdoshi@mvista.com>, tim.orling@konsulko.com
Content-Type: multipart/alternative; boundary="000000000000b3d869061c28b91e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 05:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111168

--000000000000b3d869061c28b91e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle reminder...!!
Any update on this??

Regards,
Rohini Sangam

On Tue, Jun 11, 2024 at 12:17=E2=80=AFPM Rohini Sangam via lists.openembedd=
ed.org
<rsangam=3Dmvista.com@lists.openembedded.org> wrote:

> CVE fixed:
> -CVE-2024-21094 OpenJDK: C2 compilation fails with "Exceeded _node_regs
> array" (8317507)
> Upstream-Status: Backport from
> https://github.com/openjdk/jdk8u/commit/43cb87550865a93c559c9e8eaa59fcb07=
1301bd3
>
> Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../openjdk/openjdk-8-release-common.inc      |   1 +
>  .../patches-openjdk-8/CVE-2024-21094.patch    | 637 ++++++++++++++++++
>  2 files changed, 638 insertions(+)
>  create mode 100644
> recipes-core/openjdk/patches-openjdk-8/CVE-2024-21094.patch
>
> diff --git a/recipes-core/openjdk/openjdk-8-release-common.inc
> b/recipes-core/openjdk/openjdk-8-release-common.inc
> index ff8d96e..f71eb10 100644
> --- a/recipes-core/openjdk/openjdk-8-release-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-common.inc
> @@ -21,6 +21,7 @@ PATCHES_URI =3D "\
>      file://2007-jdk-no-genx11-in-headless.patch \
>      file://2008-jdk-no-unused-deps.patch \
>
>  file://2009-jdk-make-use-gcc-instead-of-ld-for-genSocketOptionRe.patch \
> +    file://CVE-2024-21094.patch \
>  "
>  HOTSPOT_UB_PATCH =3D "\
>      file://1001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/CVE-2024-21094.patch
> b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-21094.patch
> new file mode 100644
> index 0000000..1852bd7
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/CVE-2024-21094.patch
> @@ -0,0 +1,637 @@
> +From 43cb87550865a93c559c9e8eaa59fcb071301bd3 Mon Sep 17 00:00:00 2001
> +From: Martin Balao <mbalao@openjdk.org>
> +Date: Wed, 27 Mar 2024 03:21:25 +0000
> +Subject: [PATCH] CVE-2024-21094: 8317507: C2 compilation fails with
> "Exceeded _node_regs
> + array"
> +
> +Upstream-Status: Backport from
> https://github.com/openjdk/jdk8u/commit/43cb87550865a93c559c9e8eaa59fcb07=
1301bd3
> +CVE: CVE-2024-21094
> +
> +Signed-off-by: Rohini Sangam <rsangam@mvista.com>
> +---
> + .../hotspot/src/share/vm/adlc/output_c.cpp    |   2 +
> + .../regalloc/TestNodeRegArrayOverflow.java    | 599 ++++++++++++++++++
> + 2 files changed, 601 insertions(+)
> + create mode 100644
> hotspot/test/compiler/regalloc/TestNodeRegArrayOverflow.java
> +
> +diff --git a/hotspot/src/share/vm/adlc/output_c.cpp
> b/hotspot/src/share/vm/adlc/output_c.cpp
> +index 19916904..b85123b4 100644
> +--- a/hotspot/src/share/vm/adlc/output_c.cpp
> ++++ b/hotspot/src/share/vm/adlc/output_c.cpp
> +@@ -3023,6 +3023,8 @@ static void define_fill_new_machnode(bool used,
> FILE *fp_cpp) {
> +     fprintf(fp_cpp, "    if( i !=3D cisc_operand() ) \n");
> +     fprintf(fp_cpp, "      to[i] =3D _opnds[i]->clone(C);\n");
> +     fprintf(fp_cpp, "  }\n");
> ++    fprintf(fp_cpp, "  // Do not increment node index counter, since
> node reuses my index\n");
> ++    fprintf(fp_cpp, "  C->set_unique(C->unique() - 1);\n");
> +     fprintf(fp_cpp, "}\n");
> +   }
> +   fprintf(fp_cpp, "\n");
> +diff --git a/hotspot/test/compiler/regalloc/TestNodeRegArrayOverflow.jav=
a
> b/hotspot/test/compiler/regalloc/TestNodeRegArrayOverflow.java
> +new file mode 100644
> +index 00000000..281524cc
> +--- /dev/null
> ++++ b/hotspot/test/compiler/regalloc/TestNodeRegArrayOverflow.java
> +@@ -0,0 +1,599 @@
> ++/*
> ++ * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserve=
d.
> ++ * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
> ++ *
> ++ * This code is free software; you can redistribute it and/or modify it
> ++ * under the terms of the GNU General Public License version 2 only, as
> ++ * published by the Free Software Foundation.
> ++ *
> ++ * This code is distributed in the hope that it will be useful, but
> WITHOUT
> ++ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
> ++ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e
> ++ * version 2 for more details (a copy is included in the LICENSE file
> that
> ++ * accompanied this code).
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> version
> ++ * 2 along with this work; if not, write to the Free Software Foundatio=
n,
> ++ * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
> ++ *
> ++ * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065
> USA
> ++ * or visit www.oracle.com if you need additional information or have
> any
> ++ * questions.
> ++ */
> ++
> ++package compiler.regalloc;
> ++
> ++/**
> ++ * @test
> ++ * @bug 8317507
> ++ * @summary Test that C2's PhaseRegAlloc::_node_regs (a
> post-register-allocation
> ++ *          mapping from machine nodes to assigned registers) does not
> overflow
> ++ *          in the face of a program with a high-density of CISC spilli=
ng
> ++ *          candidate nodes.
> ++ * @run main/othervm -Xcomp
> -XX:CompileOnly=3Dcompiler.regalloc.TestNodeRegArrayOverflow::testWithCom=
pilerUnrolling
> ++
>  -XX:CompileCommand=3Ddontinline,compiler.regalloc.TestNodeRegArrayOverfl=
ow::dontInline
> ++                     compiler.regalloc.TestNodeRegArrayOverflow compile=
r
> ++ * @run main/othervm -Xcomp
> -XX:CompileOnly=3Dcompiler.regalloc.TestNodeRegArrayOverflow::testWithMan=
ualUnrolling
> ++
>  -XX:CompileCommand=3Ddontinline,compiler.regalloc.TestNodeRegArrayOverfl=
ow::dontInline
> ++                     compiler.regalloc.TestNodeRegArrayOverflow manual
> ++ */
> ++
> ++public class TestNodeRegArrayOverflow {
> ++
> ++    static int dontInline() {
> ++        return 0;
> ++    }
> ++
> ++    static float testWithCompilerUnrolling(float inc) {
> ++        int i =3D 0, j =3D 0;
> ++        // This non-inlined method call causes 'inc' to be spilled.
> ++        float f =3D dontInline();
> ++        // This two-level reduction loop is unrolled 512 times, which i=
s
> ++        // requested by the SLP-specific unrolling analysis, but not
> vectorized.
> ++        // Because 'inc' is spilled, each of the unrolled AddF nodes is
> ++        // CISC-spill converted (PhaseChaitin::fixup_spills()). Before
> the fix,
> ++        // this causes the unique node index counter (Compile::_unique)
> to grow
> ++        // beyond the size of the node register array
> ++        // (PhaseRegAlloc::_node_regs), and leads to overflow when
> accessed for
> ++        // nodes that are created later (e.g. during the peephole phase=
).
> ++        while (i++ < 128) {
> ++            for (j =3D 0; j < 16; j++) {
> ++                f +=3D inc;
> ++            }
> ++        }
> ++        return f;
> ++    }
> ++
> ++    // This test reproduces the same failure as
> 'testWithCompilerUnrolling'
> ++    // without relying on loop transformations.
> ++    static float testWithManualUnrolling(float inc) {
> ++        int i =3D 0, j =3D 0;
> ++        float f =3D dontInline();
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        f +=3D inc;
> ++        return f;
> ++    }
> ++
> ++    public static void main(String[] args) {
> ++        switch (args[0]) {
> ++        case "compiler":
> ++            testWithCompilerUnrolling(0);
> ++            break;
> ++        case "manual":
> ++            testWithManualUnrolling(0);
> ++            break;
> ++        default:
> ++            throw new IllegalArgumentException("Invalid mode: " +
> args[0]);
> ++        }
> ++    }
> ++}
> +--
> +2.35.7
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110817):
> https://lists.openembedded.org/g/openembedded-devel/message/110817
> Mute This Topic: https://lists.openembedded.org/mt/106609006/8424465
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> rsangam@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b3d869061c28b91e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+R2VudGxlIHJlbWluZGVyLi4uISE8YnI+PC9k
aXY+QW55IHVwZGF0ZSBvbiB0aGlzPz88YnI+PGJyPjwvZGl2PlJlZ2FyZHMsPGJyPjwvZGl2PlJv
aGluaSBTYW5nYW08c3BhbiBzdHlsZT0iY29sb3I6cmdiKDI5LDI4LDI5KTtmb250LWZhbWlseTpT
bGFjay1MYXRvLFNsYWNrLUZyYWN0aW9ucyxhcHBsZUxvZ28sc2Fucy1zZXJpZjtmb250LXNpemU6
MTVweDtmb250LXN0eWxlOm5vcm1hbDtmb250LXZhcmlhbnQtbGlnYXR1cmVzOmNvbW1vbi1saWdh
dHVyZXM7Zm9udC12YXJpYW50LWNhcHM6bm9ybWFsO2ZvbnQtd2VpZ2h0OjQwMDtsZXR0ZXItc3Bh
Y2luZzpub3JtYWw7dGV4dC1hbGlnbjpsZWZ0O3RleHQtaW5kZW50OjBweDt0ZXh0LXRyYW5zZm9y
bTpub25lO3dvcmQtc3BhY2luZzowcHg7d2hpdGUtc3BhY2U6bm9ybWFsO2JhY2tncm91bmQtY29s
b3I6cmdiKDI1NSwyNTUsMjU1KTt0ZXh0LWRlY29yYXRpb24tc3R5bGU6aW5pdGlhbDt0ZXh0LWRl
Y29yYXRpb24tY29sb3I6aW5pdGlhbDtkaXNwbGF5OmlubGluZTtmbG9hdDpub25lIj48YnI+PC9z
cGFuPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xh
c3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgSnVuIDExLCAyMDI0IGF0IDEyOjE34oCvUE0gUm9oaW5p
IFNhbmdhbSB2aWEgPGEgaHJlZj0iaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmciPmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc8L2E+ICZsdDtyc2FuZ2FtPTxhIGhyZWY9Im1haWx0bzptdmlzdGEu
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciPm12aXN0YS5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVv
dGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlk
IHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Q1ZFIGZpeGVkOjxicj4NCi1DVkUt
MjAyNC0yMTA5NCBPcGVuSkRLOiBDMiBjb21waWxhdGlvbiBmYWlscyB3aXRoICZxdW90O0V4Y2Vl
ZGVkIF9ub2RlX3JlZ3MgYXJyYXkmcXVvdDsgKDgzMTc1MDcpPGJyPg0KVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBmcm9tIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuamRrL2pkazh1
L2NvbW1pdC80M2NiODc1NTA4NjVhOTNjNTU5YzllOGVhYTU5ZmNiMDcxMzAxYmQzIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGs4
dS9jb21taXQvNDNjYjg3NTUwODY1YTkzYzU1OWM5ZThlYWE1OWZjYjA3MTMwMWJkMzwvYT48YnI+
DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBSb2hpbmkgU2FuZ2FtICZsdDs8YSBocmVmPSJtYWlsdG86
cnNhbmdhbUBtdmlzdGEuY29tIiB0YXJnZXQ9Il9ibGFuayI+cnNhbmdhbUBtdmlzdGEuY29tPC9h
PiZndDs8YnI+DQpTaWduZWQtb2ZmLWJ5OiBTaWRkaGFydGggRG9zaGkgJmx0OzxhIGhyZWY9Im1h
aWx0bzpzZG9zaGlAbXZpc3RhLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnNkb3NoaUBtdmlzdGEuY29t
PC9hPiZndDs8YnI+DQotLS08YnI+DQrCoC4uLi9vcGVuamRrL29wZW5qZGstOC1yZWxlYXNlLWNv
bW1vbi5pbmPCoCDCoCDCoCB8wqAgwqAxICs8YnI+DQrCoC4uLi9wYXRjaGVzLW9wZW5qZGstOC9D
VkUtMjAyNC0yMTA5NC5wYXRjaMKgIMKgIHwgNjM3ICsrKysrKysrKysrKysrKysrKzxicj4NCsKg
MiBmaWxlcyBjaGFuZ2VkLCA2MzggaW5zZXJ0aW9ucygrKTxicj4NCsKgY3JlYXRlIG1vZGUgMTAw
NjQ0IHJlY2lwZXMtY29yZS9vcGVuamRrL3BhdGNoZXMtb3Blbmpkay04L0NWRS0yMDI0LTIxMDk0
LnBhdGNoPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29yZS9vcGVuamRrL29wZW5q
ZGstOC1yZWxlYXNlLWNvbW1vbi5pbmMgYi9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgt
cmVsZWFzZS1jb21tb24uaW5jPGJyPg0KaW5kZXggZmY4ZDk2ZS4uZjcxZWIxMCAxMDA2NDQ8YnI+
DQotLS0gYS9yZWNpcGVzLWNvcmUvb3Blbmpkay9vcGVuamRrLTgtcmVsZWFzZS1jb21tb24uaW5j
PGJyPg0KKysrIGIvcmVjaXBlcy1jb3JlL29wZW5qZGsvb3Blbmpkay04LXJlbGVhc2UtY29tbW9u
LmluYzxicj4NCkBAIC0yMSw2ICsyMSw3IEBAIFBBVENIRVNfVVJJID0gJnF1b3Q7XDxicj4NCsKg
IMKgIMKgZmlsZTovLzIwMDctamRrLW5vLWdlbngxMS1pbi1oZWFkbGVzcy5wYXRjaCBcPGJyPg0K
wqAgwqAgwqBmaWxlOi8vMjAwOC1qZGstbm8tdW51c2VkLWRlcHMucGF0Y2ggXDxicj4NCsKgIMKg
IMKgZmlsZTovLzIwMDktamRrLW1ha2UtdXNlLWdjYy1pbnN0ZWFkLW9mLWxkLWZvci1nZW5Tb2Nr
ZXRPcHRpb25SZS5wYXRjaCBcPGJyPg0KK8KgIMKgIGZpbGU6Ly9DVkUtMjAyNC0yMTA5NC5wYXRj
aCBcPGJyPg0KwqAmcXVvdDs8YnI+DQrCoEhPVFNQT1RfVUJfUEFUQ0ggPSAmcXVvdDtcPGJyPg0K
wqAgwqAgwqBmaWxlOi8vMTAwMS1ob3RzcG90LWZpeC1jcmFzaC1vbi1KTklfQ3JlYXRlSmF2YVZN
LnBhdGNoIFw8YnI+DQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL29wZW5qZGsvcGF0Y2hlcy1v
cGVuamRrLTgvQ1ZFLTIwMjQtMjEwOTQucGF0Y2ggYi9yZWNpcGVzLWNvcmUvb3Blbmpkay9wYXRj
aGVzLW9wZW5qZGstOC9DVkUtMjAyNC0yMTA5NC5wYXRjaDxicj4NCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0PGJyPg0KaW5kZXggMDAwMDAwMC4uMTg1MmJkNzxicj4NCi0tLSAvZGV2L251bGw8YnI+DQor
KysgYi9yZWNpcGVzLWNvcmUvb3Blbmpkay9wYXRjaGVzLW9wZW5qZGstOC9DVkUtMjAyNC0yMTA5
NC5wYXRjaDxicj4NCkBAIC0wLDAgKzEsNjM3IEBAPGJyPg0KK0Zyb20gNDNjYjg3NTUwODY1YTkz
YzU1OWM5ZThlYWE1OWZjYjA3MTMwMWJkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDE8YnI+DQor
RnJvbTogTWFydGluIEJhbGFvICZsdDs8YSBocmVmPSJtYWlsdG86bWJhbGFvQG9wZW5qZGsub3Jn
IiB0YXJnZXQ9Il9ibGFuayI+bWJhbGFvQG9wZW5qZGsub3JnPC9hPiZndDs8YnI+DQorRGF0ZTog
V2VkLCAyNyBNYXIgMjAyNCAwMzoyMToyNSArMDAwMDxicj4NCitTdWJqZWN0OiBbUEFUQ0hdIENW
RS0yMDI0LTIxMDk0OiA4MzE3NTA3OiBDMiBjb21waWxhdGlvbiBmYWlscyB3aXRoICZxdW90O0V4
Y2VlZGVkIF9ub2RlX3JlZ3M8YnI+DQorIGFycmF5JnF1b3Q7PGJyPg0KKzxicj4NCitVcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0IGZyb20gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5q
ZGsvamRrOHUvY29tbWl0LzQzY2I4NzU1MDg2NWE5M2M1NTljOWU4ZWFhNTlmY2IwNzEzMDFiZDMi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
amRrL2pkazh1L2NvbW1pdC80M2NiODc1NTA4NjVhOTNjNTU5YzllOGVhYTU5ZmNiMDcxMzAxYmQz
PC9hPjxicj4NCitDVkU6IENWRS0yMDI0LTIxMDk0PGJyPg0KKzxicj4NCitTaWduZWQtb2ZmLWJ5
OiBSb2hpbmkgU2FuZ2FtICZsdDs8YSBocmVmPSJtYWlsdG86cnNhbmdhbUBtdmlzdGEuY29tIiB0
YXJnZXQ9Il9ibGFuayI+cnNhbmdhbUBtdmlzdGEuY29tPC9hPiZndDs8YnI+DQorLS0tPGJyPg0K
KyAuLi4vaG90c3BvdC9zcmMvc2hhcmUvdm0vYWRsYy9vdXRwdXRfYy5jcHDCoCDCoCB8wqAgwqAy
ICs8YnI+DQorIC4uLi9yZWdhbGxvYy9UZXN0Tm9kZVJlZ0FycmF5T3ZlcmZsb3cuamF2YcKgIMKg
IHwgNTk5ICsrKysrKysrKysrKysrKysrKzxicj4NCisgMiBmaWxlcyBjaGFuZ2VkLCA2MDEgaW5z
ZXJ0aW9ucygrKTxicj4NCisgY3JlYXRlIG1vZGUgMTAwNjQ0IGhvdHNwb3QvdGVzdC9jb21waWxl
ci9yZWdhbGxvYy9UZXN0Tm9kZVJlZ0FycmF5T3ZlcmZsb3cuamF2YTxicj4NCis8YnI+DQorZGlm
ZiAtLWdpdCBhL2hvdHNwb3Qvc3JjL3NoYXJlL3ZtL2FkbGMvb3V0cHV0X2MuY3BwIGIvaG90c3Bv
dC9zcmMvc2hhcmUvdm0vYWRsYy9vdXRwdXRfYy5jcHA8YnI+DQoraW5kZXggMTk5MTY5MDQuLmI4
NTEyM2I0IDEwMDY0NDxicj4NCistLS0gYS9ob3RzcG90L3NyYy9zaGFyZS92bS9hZGxjL291dHB1
dF9jLmNwcDxicj4NCisrKysgYi9ob3RzcG90L3NyYy9zaGFyZS92bS9hZGxjL291dHB1dF9jLmNw
cDxicj4NCitAQCAtMzAyMyw2ICszMDIzLDggQEAgc3RhdGljIHZvaWQgZGVmaW5lX2ZpbGxfbmV3
X21hY2hub2RlKGJvb2wgdXNlZCwgRklMRSAqZnBfY3BwKSB7PGJyPg0KK8KgIMKgIMKgZnByaW50
ZihmcF9jcHAsICZxdW90O8KgIMKgIGlmKCBpICE9IGNpc2Nfb3BlcmFuZCgpICkgXG4mcXVvdDsp
Ozxicj4NCivCoCDCoCDCoGZwcmludGYoZnBfY3BwLCAmcXVvdDvCoCDCoCDCoCB0b1tpXSA9IF9v
cG5kc1tpXS0mZ3Q7Y2xvbmUoQyk7XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoGZwcmludGYoZnBf
Y3BwLCAmcXVvdDvCoCB9XG4mcXVvdDspOzxicj4NCisrwqAgwqAgZnByaW50ZihmcF9jcHAsICZx
dW90O8KgIC8vIERvIG5vdCBpbmNyZW1lbnQgbm9kZSBpbmRleCBjb3VudGVyLCBzaW5jZSBub2Rl
IHJldXNlcyBteSBpbmRleFxuJnF1b3Q7KTs8YnI+DQorK8KgIMKgIGZwcmludGYoZnBfY3BwLCAm
cXVvdDvCoCBDLSZndDtzZXRfdW5pcXVlKEMtJmd0O3VuaXF1ZSgpIC0gMSk7XG4mcXVvdDspOzxi
cj4NCivCoCDCoCDCoGZwcmludGYoZnBfY3BwLCAmcXVvdDt9XG4mcXVvdDspOzxicj4NCivCoCDC
oH08YnI+DQorwqAgwqBmcHJpbnRmKGZwX2NwcCwgJnF1b3Q7XG4mcXVvdDspOzxicj4NCitkaWZm
IC0tZ2l0IGEvaG90c3BvdC90ZXN0L2NvbXBpbGVyL3JlZ2FsbG9jL1Rlc3ROb2RlUmVnQXJyYXlP
dmVyZmxvdy5qYXZhIGIvaG90c3BvdC90ZXN0L2NvbXBpbGVyL3JlZ2FsbG9jL1Rlc3ROb2RlUmVn
QXJyYXlPdmVyZmxvdy5qYXZhPGJyPg0KK25ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KK2luZGV4
IDAwMDAwMDAwLi4yODE1MjRjYzxicj4NCistLS0gL2Rldi9udWxsPGJyPg0KKysrKyBiL2hvdHNw
b3QvdGVzdC9jb21waWxlci9yZWdhbGxvYy9UZXN0Tm9kZVJlZ0FycmF5T3ZlcmZsb3cuamF2YTxi
cj4NCitAQCAtMCwwICsxLDU5OSBAQDxicj4NCisrLyo8YnI+DQorKyAqIENvcHlyaWdodCAoYykg
MjAyMywgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4gQWxsIHJpZ2h0cyByZXNlcnZlZC48
YnI+DQorKyAqIERPIE5PVCBBTFRFUiBPUiBSRU1PVkUgQ09QWVJJR0hUIE5PVElDRVMgT1IgVEhJ
UyBGSUxFIEhFQURFUi48YnI+DQorKyAqPGJyPg0KKysgKiBUaGlzIGNvZGUgaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdDxicj4NCisrICog
dW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9u
IDIgb25seSwgYXM8YnI+DQorKyAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uLjxicj4NCisrICo8YnI+DQorKyAqIFRoaXMgY29kZSBpcyBkaXN0cmlidXRlZCBpbiB0
aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLCBidXQgV0lUSE9VVDxicj4NCisrICogQU5Z
IFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YgTUVSQ0hBTlRB
QklMSVRZIG9yPGJyPg0KKysgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS7CoCBT
ZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlPGJyPg0KKysgKiB2ZXJzaW9uIDIgZm9y
IG1vcmUgZGV0YWlscyAoYSBjb3B5IGlzIGluY2x1ZGVkIGluIHRoZSBMSUNFTlNFIGZpbGUgdGhh
dDxicj4NCisrICogYWNjb21wYW5pZWQgdGhpcyBjb2RlKS48YnI+DQorKyAqPGJyPg0KKysgKiBZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSB2ZXJzaW9uPGJyPg0KKysgKiAyIGFsb25nIHdpdGggdGhpcyB3b3JrOyBpZiBub3Qs
IHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sPGJyPg0KKysgKiBJbmMuLCA1
MSBGcmFua2xpbiBTdCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuPGJy
Pg0KKysgKjxicj4NCisrICogUGxlYXNlIGNvbnRhY3QgT3JhY2xlLCA1MDAgT3JhY2xlIFBhcmt3
YXksIFJlZHdvb2QgU2hvcmVzLCBDQSA5NDA2NSBVU0E8YnI+DQorKyAqIG9yIHZpc2l0IDxhIGhy
ZWY9Imh0dHA6Ly93d3cub3JhY2xlLmNvbSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+d3d3Lm9yYWNsZS5jb208L2E+IGlmIHlvdSBuZWVkIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24g
b3IgaGF2ZSBhbnk8YnI+DQorKyAqIHF1ZXN0aW9ucy48YnI+DQorKyAqLzxicj4NCisrPGJyPg0K
KytwYWNrYWdlIGNvbXBpbGVyLnJlZ2FsbG9jOzxicj4NCisrPGJyPg0KKysvKio8YnI+DQorKyAq
IEB0ZXN0PGJyPg0KKysgKiBAYnVnIDgzMTc1MDc8YnI+DQorKyAqIEBzdW1tYXJ5IFRlc3QgdGhh
dCBDMiYjMzk7cyBQaGFzZVJlZ0FsbG9jOjpfbm9kZV9yZWdzIChhIHBvc3QtcmVnaXN0ZXItYWxs
b2NhdGlvbjxicj4NCisrICrCoCDCoCDCoCDCoCDCoCBtYXBwaW5nIGZyb20gbWFjaGluZSBub2Rl
cyB0byBhc3NpZ25lZCByZWdpc3RlcnMpIGRvZXMgbm90IG92ZXJmbG93PGJyPg0KKysgKsKgIMKg
IMKgIMKgIMKgIGluIHRoZSBmYWNlIG9mIGEgcHJvZ3JhbSB3aXRoIGEgaGlnaC1kZW5zaXR5IG9m
IENJU0Mgc3BpbGxpbmc8YnI+DQorKyAqwqAgwqAgwqAgwqAgwqAgY2FuZGlkYXRlIG5vZGVzLjxi
cj4NCisrICogQHJ1biBtYWluL290aGVydm0gLVhjb21wIC1YWDpDb21waWxlT25seT1jb21waWxl
ci5yZWdhbGxvYy5UZXN0Tm9kZVJlZ0FycmF5T3ZlcmZsb3c6OnRlc3RXaXRoQ29tcGlsZXJVbnJv
bGxpbmc8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLVhYOkNvbXBpbGVD
b21tYW5kPWRvbnRpbmxpbmUsY29tcGlsZXIucmVnYWxsb2MuVGVzdE5vZGVSZWdBcnJheU92ZXJm
bG93Ojpkb250SW5saW5lPGJyPg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBpbGVyLnJlZ2FsbG9jLlRlc3ROb2RlUmVnQXJyYXlPdmVyZmxvdyBjb21waWxlcjxicj4NCisr
ICogQHJ1biBtYWluL290aGVydm0gLVhjb21wIC1YWDpDb21waWxlT25seT1jb21waWxlci5yZWdh
bGxvYy5UZXN0Tm9kZVJlZ0FycmF5T3ZlcmZsb3c6OnRlc3RXaXRoTWFudWFsVW5yb2xsaW5nPGJy
Pg0KKyvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC1YWDpDb21waWxlQ29tbWFuZD1k
b250aW5saW5lLGNvbXBpbGVyLnJlZ2FsbG9jLlRlc3ROb2RlUmVnQXJyYXlPdmVyZmxvdzo6ZG9u
dElubGluZTxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21waWxlci5y
ZWdhbGxvYy5UZXN0Tm9kZVJlZ0FycmF5T3ZlcmZsb3cgbWFudWFsPGJyPg0KKysgKi88YnI+DQor
Kzxicj4NCisrcHVibGljIGNsYXNzIFRlc3ROb2RlUmVnQXJyYXlPdmVyZmxvdyB7PGJyPg0KKys8
YnI+DQorK8KgIMKgIHN0YXRpYyBpbnQgZG9udElubGluZSgpIHs8YnI+DQorK8KgIMKgIMKgIMKg
IHJldHVybiAwOzxicj4NCisrwqAgwqAgfTxicj4NCisrPGJyPg0KKyvCoCDCoCBzdGF0aWMgZmxv
YXQgdGVzdFdpdGhDb21waWxlclVucm9sbGluZyhmbG9hdCBpbmMpIHs8YnI+DQorK8KgIMKgIMKg
IMKgIGludCBpID0gMCwgaiA9IDA7PGJyPg0KKyvCoCDCoCDCoCDCoCAvLyBUaGlzIG5vbi1pbmxp
bmVkIG1ldGhvZCBjYWxsIGNhdXNlcyAmIzM5O2luYyYjMzk7IHRvIGJlIHNwaWxsZWQuPGJyPg0K
KyvCoCDCoCDCoCDCoCBmbG9hdCBmID0gZG9udElubGluZSgpOzxicj4NCisrwqAgwqAgwqAgwqAg
Ly8gVGhpcyB0d28tbGV2ZWwgcmVkdWN0aW9uIGxvb3AgaXMgdW5yb2xsZWQgNTEyIHRpbWVzLCB3
aGljaCBpczxicj4NCisrwqAgwqAgwqAgwqAgLy8gcmVxdWVzdGVkIGJ5IHRoZSBTTFAtc3BlY2lm
aWMgdW5yb2xsaW5nIGFuYWx5c2lzLCBidXQgbm90IHZlY3Rvcml6ZWQuPGJyPg0KKyvCoCDCoCDC
oCDCoCAvLyBCZWNhdXNlICYjMzk7aW5jJiMzOTsgaXMgc3BpbGxlZCwgZWFjaCBvZiB0aGUgdW5y
b2xsZWQgQWRkRiBub2RlcyBpczxicj4NCisrwqAgwqAgwqAgwqAgLy8gQ0lTQy1zcGlsbCBjb252
ZXJ0ZWQgKFBoYXNlQ2hhaXRpbjo6Zml4dXBfc3BpbGxzKCkpLiBCZWZvcmUgdGhlIGZpeCw8YnI+
DQorK8KgIMKgIMKgIMKgIC8vIHRoaXMgY2F1c2VzIHRoZSB1bmlxdWUgbm9kZSBpbmRleCBjb3Vu
dGVyIChDb21waWxlOjpfdW5pcXVlKSB0byBncm93PGJyPg0KKyvCoCDCoCDCoCDCoCAvLyBiZXlv
bmQgdGhlIHNpemUgb2YgdGhlIG5vZGUgcmVnaXN0ZXIgYXJyYXk8YnI+DQorK8KgIMKgIMKgIMKg
IC8vIChQaGFzZVJlZ0FsbG9jOjpfbm9kZV9yZWdzKSwgYW5kIGxlYWRzIHRvIG92ZXJmbG93IHdo
ZW4gYWNjZXNzZWQgZm9yPGJyPg0KKyvCoCDCoCDCoCDCoCAvLyBub2RlcyB0aGF0IGFyZSBjcmVh
dGVkIGxhdGVyIChlLmcuIGR1cmluZyB0aGUgcGVlcGhvbGUgcGhhc2UpLjxicj4NCisrwqAgwqAg
wqAgwqAgd2hpbGUgKGkrKyAmbHQ7IDEyOCkgezxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgZm9y
IChqID0gMDsgaiAmbHQ7IDE2OyBqKyspIHs8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAgwqAgwqAg
fTxicj4NCisrwqAgwqAgwqAgwqAgcmV0dXJuIGY7PGJyPg0KKyvCoCDCoCB9PGJyPg0KKys8YnI+
DQorK8KgIMKgIC8vIFRoaXMgdGVzdCByZXByb2R1Y2VzIHRoZSBzYW1lIGZhaWx1cmUgYXMgJiMz
OTt0ZXN0V2l0aENvbXBpbGVyVW5yb2xsaW5nJiMzOTs8YnI+DQorK8KgIMKgIC8vIHdpdGhvdXQg
cmVseWluZyBvbiBsb29wIHRyYW5zZm9ybWF0aW9ucy48YnI+DQorK8KgIMKgIHN0YXRpYyBmbG9h
dCB0ZXN0V2l0aE1hbnVhbFVucm9sbGluZyhmbG9hdCBpbmMpIHs8YnI+DQorK8KgIMKgIMKgIMKg
IGludCBpID0gMCwgaiA9IDA7PGJyPg0KKyvCoCDCoCDCoCDCoCBmbG9hdCBmID0gZG9udElubGlu
ZSgpOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0g
aW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9
IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiAr
PSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYg
Kz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBm
ICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAg
ZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKg
IGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDC
oCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAg
wqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKg
IMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDC
oCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAg
wqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKg
IMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDC
oCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAg
wqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8Kg
IMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvC
oCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisr
wqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQor
K8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0K
KyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4N
CisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+
DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJy
Pg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxi
cj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8
YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7
PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5j
Ozxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBpbmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGlu
Yzs8YnI+DQorK8KgIMKgIMKgIMKgIGYgKz0gaW5jOzxicj4NCisrwqAgwqAgwqAgwqAgZiArPSBp
bmM7PGJyPg0KKyvCoCDCoCDCoCDCoCBmICs9IGluYzs8YnI+DQorK8KgIMKgIMKgIMKgIHJldHVy
biBmOzxicj4NCisrwqAgwqAgfTxicj4NCisrPGJyPg0KKyvCoCDCoCBwdWJsaWMgc3RhdGljIHZv
aWQgbWFpbihTdHJpbmdbXSBhcmdzKSB7PGJyPg0KKyvCoCDCoCDCoCDCoCBzd2l0Y2ggKGFyZ3Nb
MF0pIHs8YnI+DQorK8KgIMKgIMKgIMKgIGNhc2UgJnF1b3Q7Y29tcGlsZXImcXVvdDs6PGJyPg0K
KyvCoCDCoCDCoCDCoCDCoCDCoCB0ZXN0V2l0aENvbXBpbGVyVW5yb2xsaW5nKDApOzxicj4NCisr
wqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KKyvCoCDCoCDCoCDCoCBjYXNlICZxdW90O21h
bnVhbCZxdW90Ozo8YnI+DQorK8KgIMKgIMKgIMKgIMKgIMKgIHRlc3RXaXRoTWFudWFsVW5yb2xs
aW5nKDApOzxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgYnJlYWs7PGJyPg0KKyvCoCDCoCDCoCDC
oCBkZWZhdWx0Ojxicj4NCisrwqAgwqAgwqAgwqAgwqAgwqAgdGhyb3cgbmV3IElsbGVnYWxBcmd1
bWVudEV4Y2VwdGlvbigmcXVvdDtJbnZhbGlkIG1vZGU6ICZxdW90OyArIGFyZ3NbMF0pOzxicj4N
CisrwqAgwqAgwqAgwqAgfTxicj4NCisrwqAgwqAgfTxicj4NCisrfTxicj4NCistLSA8YnI+DQor
Mi4zNS43PGJyPg0KKzxicj4NCi0tIDxicj4NCjIuMzQuMTxicj4NCjxicj4NCjxicj4NCi09LT0t
PS09LT0tPS09LT0tPS09LT0tPGJyPg0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuPGJyPg0KVmlldy9SZXBseSBPbmxpbmUgKCMxMTA4MTcpOiA8YSBo
cmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwv
bWVzc2FnZS8xMTA4MTciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzExMDgx
NzwvYT48YnI+DQpNdXRlIFRoaXMgVG9waWM6IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9tdC8xMDY2MDkwMDYvODQyNDQ2NSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwNjYwOTAwNi84NDI0
NDY1PC9hPjxicj4NCkdyb3VwIE93bmVyOiA8YSBocmVmPSJtYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsJTJCb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPm9wZW5l
bWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPC9hPjxicj4NClVuc3Vi
c2NyaWJlOiA8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtZGV2ZWwvdW5zdWIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YjwvYT4g
WzxhIGhyZWY9Im1haWx0bzpyc2FuZ2FtQG12aXN0YS5jb20iIHRhcmdldD0iX2JsYW5rIj5yc2Fu
Z2FtQG12aXN0YS5jb208L2E+XTxicj4NCi09LT0tPS09LT0tPS09LT0tPS09LT0tPGJyPg0KPGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000b3d869061c28b91e--

