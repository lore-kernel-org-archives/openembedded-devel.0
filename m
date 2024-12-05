Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ED6E77178
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 16:59:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.16625.1733417975236404133
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 08:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fXOT8AqJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffdd9fc913so11282821fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 08:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733417973; x=1734022773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj2YDI2PwMjd0ruBkGH49hlUrvlRSUSOkMvp8Ct80H0=;
        b=fXOT8AqJDStVyMrrsTsD5vcWIpAN0RVSGsbLCqejY1nRIGleS/om8to+t1VhwRK6PO
         dpUjv7j1DZKIxX+u2BpjxS+fcH0wgL1EaHMmNinLFbv8jJj6WKrfmtrKdtGB/5WlqINt
         Y1XFwgjsNVqfzCkgMIolXZAGB5tXJcO2i/5+KoTClrJNUOmZ5gHuf3U6V1NskAnj9LL+
         SvG/r05NyXUxNdfZOYDP1c1IvbK6cCY4Vdwaxyq0JHB9ph5XjiR7BNVnfVMnlQdsBoot
         uVoTaJda25b+Ofz3QhVkLs02PzqVPeCl1sxVE7B/5J6+uQvAjA2MAaaKUt7RCy1hMGn2
         LSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417973; x=1734022773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj2YDI2PwMjd0ruBkGH49hlUrvlRSUSOkMvp8Ct80H0=;
        b=iMsTlFIAb4z9gU9mTtc1gsR2DWNQtCKgM7zErLD2YsqDYSfmMhVQYSIpwHnl2Z98lc
         CnocPT03FmTJmyWKFeZvExfaSmfaa8rdshXESHobiO8OCIg4ikBz4QPTkTm6GWhKoDTz
         VUcGIV0vSjeKKaF7oDFp4zvmxL65P3dwaTiDzLIRzJkPHV3xLolqjWx3c5jgC+W1Qhze
         uMnfCyF+zAvMBCPv9MELbEDmxEocL2jvOSW9X7rwgKseBaOuWGvJ1gmg5XKX5yrqJeov
         FcxNRjXAFV/tuAFe0vkayijxAPmoK1ce+zmYAdQdjNClEUSVx06Ibhz9stoZ8edihJzL
         Jpig==
X-Forwarded-Encrypted: i=1; AJvYcCWn7LAupP0YfcW+FvhVBkK4HXWxszDSnES+n3Gbxb0dXgpxa5w+DvxpcEif11pilitDW2cja21T8u33FzlKITTh23E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzT1MpEzni0ryzvtXCFLmcgh50+Z+XZHVJfQWRgqVz3qrwXzpJo
	aZds6uA/sg778EvrITx+imYJBOUuabA38uUFCtRWjQa6ejPmogjJ0qVetXGHJd92sgzC1YJYuug
	CDLyT5xjf/KA0uuzH5aznDzeq5AA=
X-Gm-Gg: ASbGncuddCvx5j8nCd3kbCw8Swva9U7YJlkOywOqSknTi53B8pNBe90f+jQPLJBBIB+
	k3G3bApnWK+DI1sGFaR0ZehBmwHwR0SIrqg==
X-Google-Smtp-Source: AGHT+IHliWVyQYpqxFUD6fqhKjNb115Fu605+bkBSpZiwFuTNCT+UfnS1Fx0VLReqwZcGjrmDrBsgOhAAzsmTIebXWA=
X-Received: by 2002:a05:651c:b1f:b0:2ff:d81f:2d34 with SMTP id
 38308e7fff4ca-30009c0de15mr63382751fa.8.1733417972417; Thu, 05 Dec 2024
 08:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20241203054957.1925390-1-deepan.shivap@lge.com> <CAMKF1sohKYx3a8thv8Dwg8BWe0nSXVDyF0vLGV9mRZdA9e1rWA@mail.gmail.com>
In-Reply-To: <CAMKF1sohKYx3a8thv8Dwg8BWe0nSXVDyF0vLGV9mRZdA9e1rWA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 5 Dec 2024 17:59:21 +0100
Message-ID: <CA+chaQdVHbkT8+HMX8E-VKRvyOdQe+KsPpBiXVoiV9zG=m5PaQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ot-br-posix: Fix Musl build error
To: raj.khem@gmail.com
Cc: deepan.shivap@lge.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114209

I've asked to deepan to test it with musl, but not with musl+clang, so
the CXXFLAGS:append:libc-musl:toolchain-clang line in the recipe is
still needed (at least for the sign-compare, maybe both).

Deepan please send v2.

On Thu, Dec 5, 2024 at 5:55=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Dec 2, 2024 at 9:50=E2=80=AFPM deepan.shivap via
> lists.openembedded.org <deepan.shivap=3Dlge.com@lists.openembedded.org>
> wrote:
> >
> > From: "deepan.shivap" <deepan.shivap@lge.com>
> >
> > Mistakenly removed musl-fixes.patch in previous commit.
> >
> > update & Include 0001-Musl-build-fix.patch based on latest upstream of =
ot-br-posix
> >
> > Remove CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsig=
n-compare
> > -Wno-error=3Dunused-but-set-variable", as issue is not reproducible wit=
h
> > current SRCREV of ot-br-posix.
> >
> > Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> > ---
> >  .../ot-br-posix/0001-Musl-build-fix.patch     | 27 +++++++++++++++++++
> >  .../openthread/ot-br-posix_git.bb             |  4 +--
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-=
br-posix/0001-Musl-build-fix.patch
> >
> > diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posi=
x/0001-Musl-build-fix.patch b/meta-networking/recipes-connectivity/openthre=
ad/ot-br-posix/0001-Musl-build-fix.patch
> > new file mode 100644
> > index 000000000..108ed76b3
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-=
Musl-build-fix.patch
> > @@ -0,0 +1,27 @@
> > +From 502aa4ab4bbc790fb2999ff2b5f10dabd7085190 Mon Sep 17 00:00:00 2001
> > +From: "deepan.shivap" <deepan.shivap@lge.com>
> > +Date: Mon, 2 Dec 2024 23:12:17 +0900
> > +Subject: [PATCH] Musl build fix
> > +
> > +usage of getaddrinfo_a creates dependency on libanl, which is  specifi=
c
> > +to glibc.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> > +---
> > + src/posix/platform/CMakeLists.txt | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/posix/platform/CMakeLists.txt b/src/posix/platform/CM=
akeLists.txt
> > +index b4ac241f5..7b2028e45 100644
> > +--- a/src/posix/platform/CMakeLists.txt
> > ++++ b/src/posix/platform/CMakeLists.txt
> > +@@ -175,7 +175,7 @@ target_link_libraries(openthread-posix
> > + )
> > +
> > + option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OFF)
> > +-if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT)
> > ++if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT AN=
D NOT OT_TARGET_MUSL)
> > +     target_compile_definitions(ot-posix-config
> > +         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABLE=3D=
1"
> > +     )
> > diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posi=
x_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.=
bb
> > index 8183f5203..f4c193a8e 100644
> > --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.b=
b
> > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.b=
b
> > @@ -19,15 +19,13 @@ SRC_URI =3D "gitsm://github.com/openthread/ot-br-po=
six.git;protocol=3Dhttps;branch=3Dm
> >             file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.pa=
tch \
> >             file://default-cxx-std.patch \
> >             file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=3D=
third_party/openthread/repo \
> > +           file://0001-Musl-build-fix.patch;patchdir=3Dthird_party/ope=
nthread/repo \
> >             "
> >
> >  S =3D "${WORKDIR}/git"
> >  SYSTEMD_SERVICE:${PN} =3D "otbr-agent.service"
> >
> >  inherit pkgconfig cmake systemd
> > -# openthread/repo/src/cli/cli.cpp:1786:18: fatal error: variable 'i' s=
et but not used [-Wunused-but-set-variable]
> > -#    for (uint8_t i =3D 0;; i++)
> > -CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsign-comp=
are -Wno-error=3Dunused-but-set-variable"
> >
>
> While this fixes one problem it exposes another error seen in couple of p=
laces
>
> | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix/0.3.=
0+git/git/src/backbone_router/nd_proxy.cpp:187:67:
> fatal error: comparison of integers of
>    =E2=86=AA different signs: 'unsigned long' and 'int' [-Wsign-compare]
>    |   187 |         for (cmsghdr =3D CMSG_FIRSTHDR(&msghdr); cmsghdr;
> cmsghdr =3D CMSG_NXTHDR(&msghdr, cmsghdr))
>    |       |
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix/0=
.3.0+git/recipe-sysroot/usr/include/sys/socket.h:358:44:
> note: expanded from macro 'CMSG_NXTHDR'
>    =E2=86=AA
>    |   358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >=3D
> __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
>    |       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    | 1 error generated.
>
>
>
> >  LDFLAGS:append:riscv32 =3D " -latomic"
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114208): https://lists.openembedded.org/g/openembedde=
d-devel/message/114208
> Mute This Topic: https://lists.openembedded.org/mt/109895644/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

