Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BD8CD8C90
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:31:30 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.93256.1696948284783992798
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E3NKTDJp;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6c64a3c4912so4066347a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696948284; x=1697553084; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfmHybRHRXoNNyQYTTh0arr/lGBjfXh2JTBxzA6Q+Tg=;
        b=E3NKTDJpkYsWDQX2yIMD72AWbuNY4V1Kx+XxmGyLHwoELX8+ZcWKj8+JUIMktMCXKj
         lRbyd232FUIKFqNELvcGiBfrkB40gcG2ifvgL5XrOn1LXjQhY8Bw76x3XxSklhs9FDVO
         MtpVsTj8oKv4ucjy4yeTgDvQ9C0/N3VXQoekhSb5AdTYnF+J9Omv4Sg9TpGvFP+F3KOW
         yPA6y46SjLqrmwtC5tNmSOs9zLdp9La011O4+aDkjwCuZmI13crTEO1pI4z0uKQSHwBt
         7nkaqhTuX6BzFw9Iks//01BQ9+NGWgV/hJYaSkp5yl3ObGhCPLdzzol7wzcAVfjNGrie
         s2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696948284; x=1697553084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfmHybRHRXoNNyQYTTh0arr/lGBjfXh2JTBxzA6Q+Tg=;
        b=fWiZpgGRMTUPZCiLy7OFn5Rf1/q8FJSrqSsCvNRcGDIvrbuyjiMmRPVSKqY6eRR+6E
         hjuQ5D2ViwnWeq2CtzMZDWS040gGKObh2+ZJlL9RmshJHo5g6U647BusHqbCNfhJDpeS
         iyqEGG/hEP0kpaEm7yBkXvK0HClLKidwX6FjTXOyYq/znSOBNK61KK/WcPMH7y8ucEbH
         uL7kWXJNv8KiuTYxlO2tme/I4Btu0IZy47+XtyVtzKdn2tO0DA+D7wbT1gfIhhAhRmXN
         Ya5BeIXdeQUQT4wtLbHDwJoYsiSW7BgdHCxWniIkqTcoJpTfyCweqrfUCSAP5kXNsBsW
         ofPg==
X-Gm-Message-State: AOJu0YzvBSV3/TSxcNE1hAeFDG1PoY2q1ObCX00+FlAUULB7KfI7O2Hg
	hm/+TKYca9I3eYGl7vqJGGnndPn2W/3yWP2DrA8=
X-Google-Smtp-Source: AGHT+IFfFTbVDYhEYSmO69nFV4tR7+DcrtkZ104y4EwGFdcn8lHYvO/pqwgjU3hbPYL7bdIXL0Gsey6v9Bw64xvuk10=
X-Received: by 2002:a05:6871:a68f:b0:1e5:6f60:c0cd with SMTP id
 wh15-20020a056871a68f00b001e56f60c0cdmr14385581oab.55.1696948283688; Tue, 10
 Oct 2023 07:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231005213631.390714-1-raj.khem@gmail.com> <074cb098-5f31-47bd-85a9-f4db89a65659@ti.com>
In-Reply-To: <074cb098-5f31-47bd-85a9-f4db89a65659@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2023 07:31:12 -0700
Message-ID: <CAMKF1sopMx_wWPfdYY82pLUVh3cY29+s-vrCMPTCEmbavQUeEQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] kernel-selftest: Build bpf tests again
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a6cdfe06075d8f68"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 14:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105408

--000000000000a6cdfe06075d8f68
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2023 at 7:11 AM Ryan Eatmon <reatmon@ti.com> wrote:

>
> Does this patch introduce a requirement on clang?  We are seeing build
> failures in our nightly master builds on kernel-selftst with clang not
> being found.
>

Clang dependency was already there but I think some portions are specific
to clang which perhaps can be covered with a bbappend eg the settings in
extra oe make

>
>
> On 10/5/2023 4:36 PM, Khem Raj wrote:
> > Fix run-ptest script to run all compiled selftests
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   .../kernel-selftest/kernel-selftest.bb        | 34 ++++++++++++++-----
> >   .../kernel-selftest/kernel-selftest/run-ptest | 10 ++----
> >   2 files changed, 29 insertions(+), 15 deletions(-)
> >
> > diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> > index 4d6e0e3717..8fab1df391 100644
> > --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> > +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> > @@ -18,7 +18,7 @@ SRC_URI += "file://run-ptest \
> >   # we will append other kernel selftest in the future
> >   # bpf was added in 4.10 with:
> https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
> >   # if you have older kernel than that you need to remove it from
> PACKAGECONFIG
> > -PACKAGECONFIG ??= "firmware"
> > +PACKAGECONFIG ??= "firmware bpf"
> >   PACKAGECONFIG:remove:x86 = "bpf"
> >   PACKAGECONFIG:remove:arm = "bpf vm"
> >   # host ptrace.h is used to compile BPF target but mips ptrace.h is
> needed
> > @@ -31,30 +31,39 @@ PACKAGECONFIG:remove:qemumips = "bpf vm"
> >   PACKAGECONFIG:remove:riscv64 = "vm"
> >   PACKAGECONFIG:remove:riscv32 = "vm"
> >
> > -PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
> > +PACKAGECONFIG[bpf] = ",,elfutils elfutils-native libcap libcap-ng
> rsync-native python3-docutils-native,"
> >   PACKAGECONFIG[firmware] = ",,libcap, bash"
> >   PACKAGECONFIG[vm] = ",,libcap libhugetlbfs,libgcc bash"
> >
> >   do_patch[depends] += "virtual/kernel:do_shared_workdir"
> > +do_compile[depends] += "virtual/kernel:do_install"
> >
> > -inherit linux-kernel-base kernel-arch ptest
> > +inherit linux-kernel-base module-base kernel-arch ptest siteinfo
> >
> >   S = "${WORKDIR}/${BP}"
> >
> > +DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
> > +
> >   TEST_LIST = "\
> >       ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
> >       rtc \
> >   "
> > -
> >   EXTRA_OEMAKE = '\
> >       CROSS_COMPILE=${TARGET_PREFIX} \
> >       ARCH=${ARCH} \
> >       CC="${CC}" \
> > -    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH}
> ${TOOLCHAIN_OPTIONS}" \
> >       AR="${AR}" \
> >       LD="${LD}" \
> > +    LLVM=1 \
> > +    CONFIG_CC_IS_GCC= \
> > +    CONFIG_CC_IS_CLANG=y \
> > +    CONFIG_CC_IMPLICIT_FALLTHROUGH= \
> > +    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH}
> ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\'
> -Wno-error=unused-command-line-argument" \
> > +    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
> > +    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc
> -stdlib=libstdc++" \
> >       DESTDIR="${D}" \
> >       MACHINE="${ARCH}" \
> > +    V=1 \
> >   '
> >
> >   KERNEL_SELFTEST_SRC ?= "Makefile \
> > @@ -66,7 +75,6 @@ KERNEL_SELFTEST_SRC ?= "Makefile \
> >                           arch \
> >                           LICENSES \
> >   "
> > -
> >   do_compile() {
> >       if [ ${@bb.utils.contains('PACKAGECONFIG', 'bpf', 'True', 'False',
> d)} = 'True' ]; then
> >       if [ ${@bb.utils.contains('DEPENDS', 'clang-native', 'True',
> 'False', d)} = 'False' ]; then
> > @@ -74,7 +82,17 @@ do_compile() {
> >   either install it and add it to HOSTTOOLS, or add clang-native from
> meta-clang to dependency"
> >       fi
> >       fi
> > +    mkdir -p ${S}/include/config ${S}/bits
> > +    touch ${S}/include/config/auto.conf
> > +    if [ "${SITEINFO_BITS}" != "32" ]; then
> > +        for f in long-double endianness floatn struct_rwlock; do
> > +            cp ${RECIPE_SYSROOT}${includedir}/bits/$f-64.h
> ${S}/bits/$f-32.h
> > +        done
> > +    fi
> >       oe_runmake -C ${S} headers
> > +    sed -i -e 's|^all: docs|all:|'
> ${S}/tools/testing/selftests/bpf/Makefile
> > +    sed -i -e '/mrecord-mcount/d' ${S}/Makefile
> > +    sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
> >       for i in ${TEST_LIST}
> >       do
> >           oe_runmake -C ${S}/tools/testing/selftests/${i}
> > @@ -133,9 +151,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >   INHIBIT_PACKAGE_DEBUG_SPLIT="1"
> >   FILES:${PN} += "/usr/kernel-selftest"
> >
> > -RDEPENDS:${PN} += "python3 perl"
> > +RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
> >   # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and
> tools/testing/selftests/Makefile explicitly overrides to empty
> > -INSANE_SKIP:${PN} += "ldflags"
> > +INSANE_SKIP:${PN} += "ldflags libdir"
> >
> >   SECURITY_CFLAGS = ""
> >   COMPATIBLE_HOST:libc-musl = 'null'
> > diff --git
> a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> > index d40b9576d8..0903d097e1 100755
> > --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> > +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
> > @@ -1,11 +1,7 @@
> >   #!/bin/sh
> > -export PATH=$PATH:/usr/kernel-selftest/bpf
> > -
> > -# test_align
> > -test_align | grep "12 pass" &> /dev/null
> > +/usr/kernel-selftest/run_kselftest.sh -s
> >   if [ $? == 0 ]; then
> > -    echo "[PASS]: test_align"
> > +    echo "PASS: kernel-selftest"
> >   else
> > -    echo "[FAIL]: test_align"
> > +    echo "[FAIL]: kernel-selftest"
> >   fi
> > -
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105362):
> https://lists.openembedded.org/g/openembedded-devel/message/105362
> > Mute This Topic: https://lists.openembedded.org/mt/101786204/6551054
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> reatmon@ti.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>

--000000000000a6cdfe06075d8f68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 10, 2023 at 7:11 AM Ryan Eatmon &lt;<a href=3D"=
mailto:reatmon@ti.com">reatmon@ti.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><br>
Does this patch introduce a requirement on clang?=C2=A0 We are seeing build=
 <br>
failures in our nightly master builds on kernel-selftst with clang not <br>
being found.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Clang dependency=
 was already there but I think some portions are specific to clang which pe=
rhaps can be covered with a bbappend eg the settings in extra oe make=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
<br>
On 10/5/2023 4:36 PM, Khem Raj wrote:<br>
&gt; Fix run-ptest script to run all compiled selftests<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../kernel-selftest/<a href=3D"http://kernel-selftest.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 34 ++++++++++++++-----<br>
&gt;=C2=A0 =C2=A0.../kernel-selftest/kernel-selftest/run-ptest | 10 ++----<=
br>
&gt;=C2=A0 =C2=A02 files changed, 29 insertions(+), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://=
kernel-selftest.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb=
</a> b/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-self=
test.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a><br>
&gt; index 4d6e0e3717..8fab1df391 100644<br>
&gt; --- a/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-=
selftest.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a><br=
>
&gt; +++ b/meta-oe/recipes-kernel/kernel-selftest/<a href=3D"http://kernel-=
selftest.bb" rel=3D"noreferrer" target=3D"_blank">kernel-selftest.bb</a><br=
>
&gt; @@ -18,7 +18,7 @@ SRC_URI +=3D &quot;file://run-ptest \<br>
&gt;=C2=A0 =C2=A0# we will append other kernel selftest in the future<br>
&gt;=C2=A0 =C2=A0# bpf was added in 4.10 with: <a href=3D"https://github.co=
m/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d" rel=3D"no=
referrer" target=3D"_blank">https://github.com/torvalds/linux/commit/5aa5bd=
14c5f8660c64ceedf14a549781be47e53d</a><br>
&gt;=C2=A0 =C2=A0# if you have older kernel than that you need to remove it=
 from PACKAGECONFIG<br>
&gt; -PACKAGECONFIG ??=3D &quot;firmware&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;firmware bpf&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG:remove:x86 =3D &quot;bpf&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG:remove:arm =3D &quot;bpf vm&quot;<br>
&gt;=C2=A0 =C2=A0# host ptrace.h is used to compile BPF target but mips ptr=
ace.h is needed<br>
&gt; @@ -31,30 +31,39 @@ PACKAGECONFIG:remove:qemumips =3D &quot;bpf vm&quo=
t;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG:remove:riscv64 =3D &quot;vm&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG:remove:riscv32 =3D &quot;vm&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PACKAGECONFIG[bpf] =3D &quot;,,elfutils libcap libcap-ng rsync-native=
,&quot;<br>
&gt; +PACKAGECONFIG[bpf] =3D &quot;,,elfutils elfutils-native libcap libcap=
-ng rsync-native python3-docutils-native,&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[firmware] =3D &quot;,,libcap, bash&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[vm] =3D &quot;,,libcap libhugetlbfs,libgcc b=
ash&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_patch[depends] +=3D &quot;virtual/kernel:do_shared_work=
dir&quot;<br>
&gt; +do_compile[depends] +=3D &quot;virtual/kernel:do_install&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -inherit linux-kernel-base kernel-arch ptest<br>
&gt; +inherit linux-kernel-base module-base kernel-arch ptest siteinfo<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/${BP}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +DEBUG_PREFIX_MAP:remove =3D &quot;-fcanon-prefix-map&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0TEST_LIST =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, =
&#39;bpf firmware vm&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rtc \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0EXTRA_OEMAKE =3D &#39;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D${TARGET_PREFIX} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;${CC}&quot; \<br>
&gt; -=C2=A0 =C2=A0 CLANG=3D&quot;clang -fno-stack-protector -target ${TARG=
ET_ARCH} ${TOOLCHAIN_OPTIONS}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AR=3D&quot;${AR}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;${LD}&quot; \<br>
&gt; +=C2=A0 =C2=A0 LLVM=3D1 \<br>
&gt; +=C2=A0 =C2=A0 CONFIG_CC_IS_GCC=3D \<br>
&gt; +=C2=A0 =C2=A0 CONFIG_CC_IS_CLANG=3Dy \<br>
&gt; +=C2=A0 =C2=A0 CONFIG_CC_IMPLICIT_FALLTHROUGH=3D \<br>
&gt; +=C2=A0 =C2=A0 CLANG=3D&quot;clang -fno-stack-protector -target ${TARG=
ET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=3D\&#39;64\&#39; -=
Wno-error=3Dunused-command-line-argument&quot; \<br>
&gt; +=C2=A0 =C2=A0 HOSTCC=3D&quot;clang -unwindlib=3Dlibgcc -rtlib=3Dlibgc=
c -stdlib=3Dlibstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=3Dunused-=
command-line-argument&quot; \<br>
&gt; +=C2=A0 =C2=A0 HOSTLD=3D&quot;clang ${BUILD_LDFLAGS} -unwindlib=3Dlibg=
cc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D&quot;${D}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MACHINE=3D&quot;${ARCH}&quot; \<br>
&gt; +=C2=A0 =C2=A0 V=3D1 \<br>
&gt;=C2=A0 =C2=A0&#39;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0KERNEL_SELFTEST_SRC ?=3D &quot;Makefile \<br>
&gt; @@ -66,7 +75,6 @@ KERNEL_SELFTEST_SRC ?=3D &quot;Makefile \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0arch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;bpf&#39;, &#39;True&#39;, &#39;False&#39;, d)} =3D &#39;True&#3=
9; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${@bb.utils.contains(&#39;DEPENDS&#39;,=
 &#39;clang-native&#39;, &#39;True&#39;, &#39;False&#39;, d)} =3D &#39;Fals=
e&#39; ]; then<br>
&gt; @@ -74,7 +82,17 @@ do_compile() {<br>
&gt;=C2=A0 =C2=A0either install it and add it to HOSTTOOLS, or add clang-na=
tive from meta-clang to dependency&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 mkdir -p ${S}/include/config ${S}/bits<br>
&gt; +=C2=A0 =C2=A0 touch ${S}/include/config/auto.conf<br>
&gt; +=C2=A0 =C2=A0 if [ &quot;${SITEINFO_BITS}&quot; !=3D &quot;32&quot; ]=
; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in long-double endianness floatn st=
ruct_rwlock; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${RECIPE_SYSROOT}${inclu=
dedir}/bits/$f-64.h ${S}/bits/$f-32.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${S} headers<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s|^all: docs|all:|&#39; ${S}/tools/testi=
ng/selftests/bpf/Makefile<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &#39;/mrecord-mcount/d&#39; ${S}/Makefile<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &#39;/Wno-alloc-size-larger-than/d&#39; ${S}/=
Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in ${TEST_LIST}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${S}/tools/testi=
ng/selftests/${i}<br>
&gt; @@ -133,9 +151,9 @@ PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;=C2=A0 =C2=A0INHIBIT_PACKAGE_DEBUG_SPLIT=3D&quot;1&quot;<br>
&gt;=C2=A0 =C2=A0FILES:${PN} +=3D &quot;/usr/kernel-selftest&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -RDEPENDS:${PN} +=3D &quot;python3 perl&quot;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;python3 perl perl-module-io-handle&quot;<br=
>
&gt;=C2=A0 =C2=A0# tools/testing/selftests/vm/Makefile doesn&#39;t respect =
LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty<=
br>
&gt; -INSANE_SKIP:${PN} +=3D &quot;ldflags&quot;<br>
&gt; +INSANE_SKIP:${PN} +=3D &quot;ldflags libdir&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SECURITY_CFLAGS =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0COMPATIBLE_HOST:libc-musl =3D &#39;null&#39;<br>
&gt; diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/ru=
n-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest<=
br>
&gt; index d40b9576d8..0903d097e1 100755<br>
&gt; --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest=
<br>
&gt; +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest=
<br>
&gt; @@ -1,11 +1,7 @@<br>
&gt;=C2=A0 =C2=A0#!/bin/sh<br>
&gt; -export PATH=3D$PATH:/usr/kernel-selftest/bpf<br>
&gt; -<br>
&gt; -# test_align<br>
&gt; -test_align | grep &quot;12 pass&quot; &amp;&gt; /dev/null<br>
&gt; +/usr/kernel-selftest/run_kselftest.sh -s<br>
&gt;=C2=A0 =C2=A0if [ $? =3D=3D 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 echo &quot;[PASS]: test_align&quot;<br>
&gt; +=C2=A0 =C2=A0 echo &quot;PASS: kernel-selftest&quot;<br>
&gt;=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 echo &quot;[FAIL]: test_align&quot;<br>
&gt; +=C2=A0 =C2=A0 echo &quot;[FAIL]: kernel-selftest&quot;<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt; -<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105362): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105362" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105362</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10178620=
4/6551054" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101786204/6551054</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:reatmon@ti.com" tar=
get=3D"_blank">reatmon@ti.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
</blockquote></div></div>

--000000000000a6cdfe06075d8f68--

