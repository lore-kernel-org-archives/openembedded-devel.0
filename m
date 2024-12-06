Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601DCE7716E
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 01:43:47 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.27996.1733449423913081595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 17:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqCJmXQb;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ea5e405870so491219b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 17:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733449423; x=1734054223; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uua2OV0zkLTlkWp4GadHf0R01Bb2c6/kyF5oNHevBIc=;
        b=lqCJmXQbJEbNddWXxF5pHqg5JTKeHyjKgWDbG/XECWkItOcaGSmv58/Fm8Ymfmq0TC
         oUOfPft9LbKAeIZwY0H+NF9RBnPF6HMMU5RvH/G/ITkRMZjc5vqe+OgpaqZAR79FfDRk
         8//Fy2/wUhHtDmS5vHhUrGNTniNOyNcqLrr7eulFlcF8a15hDkrDtOGODEU6za6Koo+F
         9QLt+O0BCwJQDUBPJDSB3BY0CTUI4XKIDoW9RLchgFj03FdhlaE3I6CBRFXRZIm0qEMd
         f9GrHUzYBKwbTuJifh1rpFZCcnLOb4E5s5NJOF0ZqlqeFyIHnnXhjnGAc0Kdl/sgmICQ
         Y0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733449423; x=1734054223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uua2OV0zkLTlkWp4GadHf0R01Bb2c6/kyF5oNHevBIc=;
        b=qcHNdyd+FCAVIneTuIurUNw4YFWdK5lyC0oNcJ3dwUrZwEFZIUOQ0OaazvmBB4MKsl
         t41irA6vDH6wfGxAKHngsGDf8SABZzjS/J0e/Hpzm+k0GJMhd/AJeyNBlnSEri7d1NTu
         DQ8ApeaDUdlwGCD+5sQvXqVy23VTW+NKs3NTZ+HUTLhmfH9WI3exAhQ2dcuaR2fTBixX
         EHuN2krIvv5tlxAj+uCc0tv7l8WBKii30uIc5tyzmgIUoaxWIziDo2KUAh+4erceRMr0
         D0Q297MJrlnsNo3q2gNI3M+5jA8ThKGVa0q9+fD1sbyenp4pdC9BGqoLXSBLOwmmGOEl
         eruw==
X-Forwarded-Encrypted: i=1; AJvYcCVx2KqMyWrlH8gUxzQ7GPc1UcgYr2AT4U7Ycs4ERLw4VluB8UsdRyGHE8WyZ9ntWpp8k8xHM5oDDiYGrmm9a/N/XPc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtAi4fPaAf6LXtGQy+N+prXuUW0k/JagEbVI00e1r0q65d2Lcl
	FY09oh/HHeOSc72PKBj9G3v2pxG6JsYxZAQY6KV3LnDolDbUechA272K+b3NBtSx3U3YM34Dd7F
	7UgSOMrG/VsyHW6v7UkOTVUjrV+A=
X-Gm-Gg: ASbGncsGll/gkpu8DVIJr+HWa/zr+Y6+M7cq+0mEyOM9aqj0Jhe7hElVNB4Ru4hHjl4
	06nMJ07cedcJxoJ5kTH2a9qX5hMOKyyyRyxA9CbB0kpzxqA==
X-Google-Smtp-Source: AGHT+IHhvOK8cqS9m0XBPTMS14e+77DA7i7S6YnKp74zVx26Sy/y11RZ3PDkIzJ7o1jUSRPTWOPIg545e/VUUR2CZHY=
X-Received: by 2002:a05:6808:15a8:b0:3e7:9d40:1195 with SMTP id
 5614622812f47-3eb19cbd7acmr589180b6e.18.1733449423074; Thu, 05 Dec 2024
 17:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20241203054957.1925390-1-deepan.shivap@lge.com>
 <CAMKF1sohKYx3a8thv8Dwg8BWe0nSXVDyF0vLGV9mRZdA9e1rWA@mail.gmail.com>
 <CA+chaQdVHbkT8+HMX8E-VKRvyOdQe+KsPpBiXVoiV9zG=m5PaQ@mail.gmail.com> <CAMKF1sp2KEbjwfDZYJtShqGTo-6wAuV93L-f2oRK3pNB4UzmZw@mail.gmail.com>
In-Reply-To: <CAMKF1sp2KEbjwfDZYJtShqGTo-6wAuV93L-f2oRK3pNB4UzmZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2024 17:43:17 -0800
Message-ID: <CAMKF1sq46wgb2wpTA7KN5qmwaBXyAHj7PbupbqsOhGdN12=tmA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ot-br-posix: Fix Musl build error
To: Martin Jansa <martin.jansa@gmail.com>
Cc: deepan.shivap@lge.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 01:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114211

On Thu, Dec 5, 2024 at 9:05=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 5, 2024 at 8:59=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >
> > I've asked to deepan to test it with musl, but not with musl+clang, so
> > the CXXFLAGS:append:libc-musl:toolchain-clang line in the recipe is
> > still needed (at least for the sign-compare, maybe both).
> >
> > Deepan please send v2.
>
> I think a separate patch is in order since I have accepted v1.
> right way to fix might be to initialize  msghdr elements individually see
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-exten=
ded/canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-=
way.patch
>
> this might be upstreamable as well.
>

meanwhile I have staged a fix in meta-clang
https://github.com/kraj/meta-clang/pull/1038

> >
> > On Thu, Dec 5, 2024 at 5:55=E2=80=AFPM Khem Raj via lists.openembedded.=
org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > On Mon, Dec 2, 2024 at 9:50=E2=80=AFPM deepan.shivap via
> > > lists.openembedded.org <deepan.shivap=3Dlge.com@lists.openembedded.or=
g>
> > > wrote:
> > > >
> > > > From: "deepan.shivap" <deepan.shivap@lge.com>
> > > >
> > > > Mistakenly removed musl-fixes.patch in previous commit.
> > > >
> > > > update & Include 0001-Musl-build-fix.patch based on latest upstream=
 of ot-br-posix
> > > >
> > > > Remove CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=
=3Dsign-compare
> > > > -Wno-error=3Dunused-but-set-variable", as issue is not reproducible=
 with
> > > > current SRCREV of ot-br-posix.
> > > >
> > > > Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> > > > ---
> > > >  .../ot-br-posix/0001-Musl-build-fix.patch     | 27 +++++++++++++++=
++++
> > > >  .../openthread/ot-br-posix_git.bb             |  4 +--
> > > >  2 files changed, 28 insertions(+), 3 deletions(-)
> > > >  create mode 100644 meta-networking/recipes-connectivity/openthread=
/ot-br-posix/0001-Musl-build-fix.patch
> > > >
> > > > diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-=
posix/0001-Musl-build-fix.patch b/meta-networking/recipes-connectivity/open=
thread/ot-br-posix/0001-Musl-build-fix.patch
> > > > new file mode 100644
> > > > index 000000000..108ed76b3
> > > > --- /dev/null
> > > > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0=
001-Musl-build-fix.patch
> > > > @@ -0,0 +1,27 @@
> > > > +From 502aa4ab4bbc790fb2999ff2b5f10dabd7085190 Mon Sep 17 00:00:00 =
2001
> > > > +From: "deepan.shivap" <deepan.shivap@lge.com>
> > > > +Date: Mon, 2 Dec 2024 23:12:17 +0900
> > > > +Subject: [PATCH] Musl build fix
> > > > +
> > > > +usage of getaddrinfo_a creates dependency on libanl, which is  spe=
cific
> > > > +to glibc.
> > > > +
> > > > +Upstream-Status: Pending
> > > > +Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> > > > +---
> > > > + src/posix/platform/CMakeLists.txt | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/src/posix/platform/CMakeLists.txt b/src/posix/platfor=
m/CMakeLists.txt
> > > > +index b4ac241f5..7b2028e45 100644
> > > > +--- a/src/posix/platform/CMakeLists.txt
> > > > ++++ b/src/posix/platform/CMakeLists.txt
> > > > +@@ -175,7 +175,7 @@ target_link_libraries(openthread-posix
> > > > + )
> > > > +
> > > > + option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OF=
F)
> > > > +-if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWR=
T)
> > > > ++if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWR=
T AND NOT OT_TARGET_MUSL)
> > > > +     target_compile_definitions(ot-posix-config
> > > > +         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABL=
E=3D1"
> > > > +     )
> > > > diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-=
posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb
> > > > index 8183f5203..f4c193a8e 100644
> > > > --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_g=
it.bb
> > > > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_g=
it.bb
> > > > @@ -19,15 +19,13 @@ SRC_URI =3D "gitsm://github.com/openthread/ot-b=
r-posix.git;protocol=3Dhttps;branch=3Dm
> > > >             file://0001-cmake-Disable-nonnull-compare-warning-on-gc=
c.patch \
> > > >             file://default-cxx-std.patch \
> > > >             file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdi=
r=3Dthird_party/openthread/repo \
> > > > +           file://0001-Musl-build-fix.patch;patchdir=3Dthird_party=
/openthread/repo \
> > > >             "
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >  SYSTEMD_SERVICE:${PN} =3D "otbr-agent.service"
> > > >
> > > >  inherit pkgconfig cmake systemd
> > > > -# openthread/repo/src/cli/cli.cpp:1786:18: fatal error: variable '=
i' set but not used [-Wunused-but-set-variable]
> > > > -#    for (uint8_t i =3D 0;; i++)
> > > > -CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsign-=
compare -Wno-error=3Dunused-but-set-variable"
> > > >
> > >
> > > While this fixes one problem it exposes another error seen in couple =
of places
> > >
> > > | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix/=
0.3.0+git/git/src/backbone_router/nd_proxy.cpp:187:67:
> > > fatal error: comparison of integers of
> > >    =E2=86=AA different signs: 'unsigned long' and 'int' [-Wsign-compa=
re]
> > >    |   187 |         for (cmsghdr =3D CMSG_FIRSTHDR(&msghdr); cmsghdr=
;
> > > cmsghdr =3D CMSG_NXTHDR(&msghdr, cmsghdr))
> > >    |       |
> > >         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-pos=
ix/0.3.0+git/recipe-sysroot/usr/include/sys/socket.h:358:44:
> > > note: expanded from macro 'CMSG_NXTHDR'
> > >    =E2=86=AA
> > >    |   358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >=3D
> > > __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
> > >    |       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
> > > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    | 1 error generated.
> > >
> > >
> > >
> > > >  LDFLAGS:append:riscv32 =3D " -latomic"
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#114208): https://lists.openembedded.org/g/openemb=
edded-devel/message/114208
> > > Mute This Topic: https://lists.openembedded.org/mt/109895644/3617156
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

