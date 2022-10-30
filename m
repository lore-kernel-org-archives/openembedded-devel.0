Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC8DECAAA1
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 20:55:06 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2123.1667163299748745727
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Oct 2022 13:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cSgJzLR7;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id g12so13469708wrs.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eRAeQT6s8u9SMnpc4GGe2KVJJfzAyQRcrN64TIdoLXg=;
        b=cSgJzLR7WJ+Wwmz0BTYcz90kWUv3PfjjJ6IZUStY/QZhcbbbbwkLs1KVM9AOFSKLO8
         tcaA/JeXCeOTJ7v+zrsAZRZ+kzRy/6zDsBL4AGIiqYWNQcIWzOq70u1Bf+O+fdzD+R+n
         xWQf2WDj5symN42ElvMo2P29pjIGh91s8xWGC68ZMXGA/qpBK7HBGXF12epcj/XWo9jx
         zu2vF0CJI26kBndFTdq5ofqB/dfNYVjlxby/LRaRA46z8kT8ZZKtqX2aLR5ZX+g3E4bR
         xPpSrpMbaG7uIx4oY1xdfZp1RKWWVeV3zvjRhoXflBphQDPsB2QnJfAJuUisBKps0nEP
         iGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRAeQT6s8u9SMnpc4GGe2KVJJfzAyQRcrN64TIdoLXg=;
        b=heDDifqIP1gXrWtx2e6NdN1RRYavCzxXEo3sI+5kaHWCPD0C5qPU82KI8VME/ZflD4
         YEU25mEDnxvosxuZOt3jfiX9jbJi20SS3kOrH0grK8jcYCIrHW++TyZoT8pyrniEwK1l
         b4muA/sj9NZ/LPmAey6+v/r5XfEQN5Sqk7ZcvRZxzAOquXoxWvqwmlhNcO3RtRmS9j7p
         Uc+/0qbUUR/3YiaordvqEXrCY1/PleJ2m9S4t6xn9/xd2tOmVvsa6YDLRXCdqlhDUDw/
         2rhAS7l4y7X6YLqqapWNc8Fjb/tezl+ZBmhBF/YX3Wj9Sj40i3OYQCUisgrvopxMl5RT
         nxNg==
X-Gm-Message-State: ACrzQf2u8OcnTYk5X1FXgw7KBGLdbVCjA8Tsm0tjg2xCC3FoDaEaA2by
	GZXj+ZAesnniLJ3QW79mhLlRFibhvjhmwKIGM08=
X-Google-Smtp-Source: AMsMyM4bBwMpYrQ/y47Mb37/rYemhtiOWykh3pNmHMAC15u+hqWffZbwg89j7J3YcirYbSUO2haWYJnSVL9/pS2fHZg=
X-Received: by 2002:a5d:4b45:0:b0:236:501f:7a41 with SMTP id
 w5-20020a5d4b45000000b00236501f7a41mr5928766wrs.516.1667163298078; Sun, 30
 Oct 2022 13:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221018173118.784429-1-raj.khem@gmail.com> <7f680b57-19b4-d43e-df23-e774b259416e@windriver.com>
 <CAMKF1spqB47ApZms=BVwe3eCpLZbDLj4e4jKYqShmeCZ9uOgDA@mail.gmail.com> <77bd11cb-1a37-44f0-6931-e9aa9619bc03@windriver.com>
In-Reply-To: <77bd11cb-1a37-44f0-6931-e9aa9619bc03@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 30 Oct 2022 21:54:47 +0100
Message-ID: <CA+chaQdsTfyXD2T2ZH_WQV6Nyz6MZdiMRcPN6CQKS_EAxvw6=A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Update to 1.50.x release
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002a24ca05ec46b464"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Oct 2022 20:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99352

--0000000000002a24ca05ec46b464
Content-Type: text/plain; charset="UTF-8"

I can confirm that grpc upgrade fixed compatibility with abseil-cpp upgrade
from:
https://git.openembedded.org/meta-openembedded/commit/?id=3ab22400d180529d2ad9d18a77c1d2863c3d838e

FWIW: We had around 5 more failing recipes in internal layers caused by
this abseil-cpp upgrade, explicitly setting std to c++14 worked for all of
them, e.g. in pulseaudio:
https://github.com/shr-project/meta-webosose/commit/b04f44b2bcf3bb2a1dd2387ae454df388e8dd819

Cheers,

On Sun, Oct 30, 2022 at 3:07 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2022-10-29 19:56, Khem Raj wrote:
> > On Sat, Oct 29, 2022 at 2:08 PM Randy MacLeod
> > <randy.macleod@windriver.com> wrote:
> >>
> >> On 2022-10-18 13:31, Khem Raj wrote:
> >>
> >> License-update: Include MPL-2.0 [1]
> >>
> >> Add missing BSD 3-clause and MPL-2.0 to license field
> >>
> >> Switch to git submodules since its using locked versions of some
> >> components like opencensus-proto
> >>
> >> [1]
> https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>   .../grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb}            | 10
> +++++-----
> >>
> >>
> >> Is anyone else seeing:
> >>
> >> error: #error "C++ versions less than C++14 are not supported."
> >>
> >>
> >> i.e.
> >>
> >> TOPDIR/tmp-glibc/hosttools/g++ -Dgpr_EXPORTS \
> >> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/include \
> >> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git \
> >>
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/address_sorting/include
> \
> >>
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upb-generated
> \
> >>
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upbdefs-generated
> \
> >>
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/upb
> \
> >>
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/xxhash
> \
> >>
> -isystemTOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include
> \
> >> -O2 -pipe -Wl,--no-as-needed -fPIC -std=c++11 \
> >> -MD -MT \
> >> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
> >> -MF \
> >> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o.d \
> >> -o \
> >> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
> >> -c \
> >>
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc
> >> In file included from
> >>
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/config.h:86,
> >> from
> >>
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/attributes.h:37,
> \
> >> from \
> >>
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc:25:
> \
> >>
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/policy_checks.h:79:2:
> \
> >> error: #error "C++ versions less than C++14 are not supported."
> >> 79 | #error "C++ versions less than C++14 are not supported." \
> >> | ^~~~~
> >>
> >>
> >> Happening for a variety of distros.
> >>
> >> fedora: 34, 35, 36, ubuntu: 1804, 2004, opensuse153
> >
> > you seem to be still building 1.45.2 and the upgrade to 1.50x fixed
> > exactly this.
>
> Huh, look at that.
>
> Thanks Khem.
> ../Randy
>
> >
> >>
> >>
> >> ../Randy
> >>
> >>   1 file changed, 5 insertions(+), 5 deletions(-)
> >>   rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb =>
> grpc_1.50.0.bb} (90%)
> >>
> >> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> >> similarity index 90%
> >> rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> >> rename to meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> >> index c2f952fc64..8efd9321ca 100644
> >> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> >> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> >> @@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages written
> on top of shared C core l
> >>   (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
> >>   HOMEPAGE = "https://github.com/grpc/grpc"
> >>   SECTION = "libs"
> >> -LICENSE = "Apache-2.0"
> >> -LIC_FILES_CHKSUM =
> "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
> >> +LICENSE = "Apache-2.0 && BSD-3-Clause && MPL-2.0"
> >> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
> >>
> >>   DEPENDS = "c-ares protobuf protobuf-native protobuf-c
> protobuf-c-native openssl libnsl2 abseil-cpp re2"
> >>   DEPENDS:append:class-target = " googletest grpc-native "
> >> @@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = "
> ${PN}-compiler"
> >>   # RDEPENDS:${PN}-dev += "${PN}-compiler"
> >>
> >>   S = "${WORKDIR}/git"
> >> -SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
> >> -BRANCH = "v1.45.x"
> >> -SRC_URI = "git://
> github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH}
> <http://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=$%7BBRANCH%7D>
> \
> >> +SRCREV_grpc = "91091e3668144de9c6aa392f496bb7639f7025a7"
> >> +BRANCH = "v1.50.x"
> >> +SRC_URI = "gitsm://
> github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH}
> <http://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=$%7BBRANCH%7D>
> \
> >>
> file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
> >>
> file://0001-cmake-add-separate-export-for-plugin-targets.patch \
> >>              file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
> >>
> >>
> >>
> >>
> >>
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99347):
> https://lists.openembedded.org/g/openembedded-devel/message/99347
> Mute This Topic: https://lists.openembedded.org/mt/94413640/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002a24ca05ec46b464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can confirm that grpc upgrade fixed compatibility with a=
bseil-cpp upgrade from:<div><a href=3D"https://git.openembedded.org/meta-op=
enembedded/commit/?id=3D3ab22400d180529d2ad9d18a77c1d2863c3d838e">https://g=
it.openembedded.org/meta-openembedded/commit/?id=3D3ab22400d180529d2ad9d18a=
77c1d2863c3d838e</a><br></div><div><br></div><div>FWIW: We had around 5 mor=
e failing recipes in internal layers caused by this abseil-cpp upgrade, exp=
licitly setting std to=C2=A0c++14 worked for all of them, e.g. in pulseaudi=
o:</div><div><a href=3D"https://github.com/shr-project/meta-webosose/commit=
/b04f44b2bcf3bb2a1dd2387ae454df388e8dd819">https://github.com/shr-project/m=
eta-webosose/commit/b04f44b2bcf3bb2a1dd2387ae454df388e8dd819</a><br></div><=
div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022 at 3:07 AM Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 2022-10-29 19:56, Khem Raj wrote:<br>
&gt; On Sat, Oct 29, 2022 at 2:08 PM Randy MacLeod<br>
&gt; &lt;<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">r=
andy.macleod@windriver.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 2022-10-18 13:31, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; License-update: Include MPL-2.0 [1]<br>
&gt;&gt;<br>
&gt;&gt; Add missing BSD 3-clause and MPL-2.0 to license field<br>
&gt;&gt;<br>
&gt;&gt; Switch to git submodules since its using locked versions of some<b=
r>
&gt;&gt; components like opencensus-proto<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://github.com/grpc/grpc/commit/05fcd826f477ef1=
a024a2defa5e4b3d78f5e6eb4" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4</a><br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0.../grpc/{<a href=3D"http://grpc_1.45.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">grpc_1.45.2.bb</a> =3D&gt; <a href=3D"http://grp=
c_1.50.0.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.0.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Is anyone else seeing:<br>
&gt;&gt;<br>
&gt;&gt; error: #error &quot;C++ versions less than C++14 are not supported=
.&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; i.e.<br>
&gt;&gt;<br>
&gt;&gt; TOPDIR/tmp-glibc/hosttools/g++ -Dgpr_EXPORTS \<br>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/inc=
lude \<br>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git \<b=
r>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/thi=
rd_party/address_sorting/include \<br>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src=
/core/ext/upb-generated \<br>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src=
/core/ext/upbdefs-generated \<br>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/thi=
rd_party/upb \<br>
&gt;&gt; -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/thi=
rd_party/xxhash \<br>
&gt;&gt; -isystemTOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/r=
ecipe-sysroot-native/usr/include \<br>
&gt;&gt; -O2 -pipe -Wl,--no-as-needed -fPIC -std=3Dc++11 \<br>
&gt;&gt; -MD -MT \<br>
&gt;&gt; CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \<br>
&gt;&gt; -MF \<br>
&gt;&gt; CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o.d \<br>
&gt;&gt; -o \<br>
&gt;&gt; CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \<br>
&gt;&gt; -c \<br>
&gt;&gt; TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/c=
ore/lib/gpr/murmur_hash.cc<br>
&gt;&gt; In file included from<br>
&gt;&gt; TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sy=
sroot-native/usr/include/absl/base/config.h:86,<br>
&gt;&gt; from<br>
&gt;&gt; TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sy=
sroot-native/usr/include/absl/base/attributes.h:37, \<br>
&gt;&gt; from \<br>
&gt;&gt; TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/c=
ore/lib/gpr/murmur_hash.cc:25: \<br>
&gt;&gt; TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sy=
sroot-native/usr/include/absl/base/policy_checks.h:79:2: \<br>
&gt;&gt; error: #error &quot;C++ versions less than C++14 are not supported=
.&quot;<br>
&gt;&gt; 79 | #error &quot;C++ versions less than C++14 are not supported.&=
quot; \<br>
&gt;&gt; | ^~~~~<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Happening for a variety of distros.<br>
&gt;&gt;<br>
&gt;&gt; fedora: 34, 35, 36, ubuntu: 1804, 2004, opensuse153<br>
&gt; <br>
&gt; you seem to be still building 1.45.2 and the upgrade to 1.50x fixed<br=
>
&gt; exactly this.<br>
<br>
Huh, look at that.<br>
<br>
Thanks Khem.<br>
../Randy<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ../Randy<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0rename meta-oe/recipes-devtools/grpc/{<a href=3D"http:=
//grpc_1.45.2.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.45.2.bb</a> =
=3D&gt; <a href=3D"http://grpc_1.50.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">grpc_1.50.0.bb</a>} (90%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_=
1.45.2.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.45.2.bb</a> b/meta-o=
e/recipes-devtools/grpc/<a href=3D"http://grpc_1.50.0.bb" rel=3D"noreferrer=
" target=3D"_blank">grpc_1.50.0.bb</a><br>
&gt;&gt; similarity index 90%<br>
&gt;&gt; rename from meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1=
.45.2.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.45.2.bb</a><br>
&gt;&gt; rename to meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.5=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.0.bb</a><br>
&gt;&gt; index c2f952fc64..8efd9321ca 100644<br>
&gt;&gt; --- a/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.45.2.=
bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.45.2.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.50.0.=
bb" rel=3D"noreferrer" target=3D"_blank">grpc_1.50.0.bb</a><br>
&gt;&gt; @@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages wri=
tten on top of shared C core l<br>
&gt;&gt;=C2=A0 =C2=A0(C++, Node.js, Python, Ruby, Objective-C, PHP, C#)&quo=
t;<br>
&gt;&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/grpc/=
grpc" rel=3D"noreferrer" target=3D"_blank">https://github.com/grpc/grpc</a>=
&quot;<br>
&gt;&gt;=C2=A0 =C2=A0SECTION =3D &quot;libs&quot;<br>
&gt;&gt; -LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6e4cf218112648d22=
420a84281b68b88&quot;<br>
&gt;&gt; +LICENSE =3D &quot;Apache-2.0 &amp;&amp; BSD-3-Clause &amp;&amp; M=
PL-2.0&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D731e401b36f8077ae=
0c134b59be5c906&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0DEPENDS =3D &quot;c-ares protobuf protobuf-native prot=
obuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2&quot;<br>
&gt;&gt;=C2=A0 =C2=A0DEPENDS:append:class-target =3D &quot; googletest grpc=
-native &quot;<br>
&gt;&gt; @@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native =3D &quot=
; ${PN}-compiler&quot;<br>
&gt;&gt;=C2=A0 =C2=A0# RDEPENDS:${PN}-dev +=3D &quot;${PN}-compiler&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; -SRCREV_grpc =3D &quot;b39ffcc425ea990a537f98ec6fe6a1dcb90470d7&qu=
ot;<br>
&gt;&gt; -BRANCH =3D &quot;v1.45.x&quot;<br>
&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/grpc/grpc.gi=
t;protocol=3Dhttps;name=3Dgrpc;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;bran=
ch=3D${BRANCH}</a> \<br>
&gt;&gt; +SRCREV_grpc =3D &quot;91091e3668144de9c6aa392f496bb7639f7025a7&qu=
ot;<br>
&gt;&gt; +BRANCH =3D &quot;v1.50.x&quot;<br>
&gt;&gt; +SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/grpc/grpc.=
git;protocol=3Dhttps;name=3Dgrpc;branch=3D$%7BBRANCH%7D" rel=3D"noreferrer"=
 target=3D"_blank">github.com/grpc/grpc.git;protocol=3Dhttps;name=3Dgrpc;br=
anch=3D${BRANCH}</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Revert=
-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmake-=
add-separate-export-for-plugin-targets.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmake-=
Link-with-libatomic-on-rv32-rv64.patch \<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; # Randy MacLeod<br>
&gt;&gt; # Wind River Linux<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99347): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99347" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99347</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94413640/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94413640/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002a24ca05ec46b464--

