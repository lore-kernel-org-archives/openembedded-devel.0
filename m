Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94705E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 17:06:04 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.16802.1733418355716725192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 09:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nGtPGYlQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3ea552bb91aso541386b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733418355; x=1734023155; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4pjOAcF36aHiiwiyIraslmnBl6sbHV1uLVxS6wxdnw=;
        b=nGtPGYlQgIUJlfSpR6DJWVLKJgWs2quwsYEyGCM/Bx9NpZnQAFT8XuJyqJGoE2yaYh
         ECHXyBN9TMYd5cPZ6Zk3DIZaNtCyMRZpcXuaQMemSlG0CWAtsanL+1kLVicNprcRbxbj
         cBOX0PFPaJrTTH3f7a0HhbkIuWZdGJli2iD+ep+MZ6kgSmyGkZ6sBnaAOGUdFSP9+Uwm
         JTqeB7X0mnqA/q8FqIYysI+O/uUG2bP3xSoF8nakSl+436aRqyCppeFZ4Zva6RgD9jms
         ixb+LmALuOSGTXLgemvChVr8ihMz41IXlZJ3nrik0teWJ/LaxG+4V1V2O4BkeVIFnDVP
         c//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418355; x=1734023155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4pjOAcF36aHiiwiyIraslmnBl6sbHV1uLVxS6wxdnw=;
        b=Z/C3FowzRNYpgUuSFH1vpmcuKYPCxteH2mDUvJe37y1n+h+3B2kVwsfU1wdMwBiFyq
         NGadJRklS2BSemHDFmEhJr3xT1nIjX3OkHFTh11FgWyIXcV4AuGtAGG9Xbkk9y4jeyVx
         UmCSGT7X6aUNMgvM4XfoF4SGLLQ7Oci1VFyVzjktVzUmLpXr2ZfbJOxH3tKR34wd85Yb
         BCOdjq+Fwiv1RdQCQb4PpWQMOQT1ONam6jspw8UY0kR7eeBicUeh189Sr+ANgxGOkVKa
         ZqayGSNz5At3d5xsSO300afiX30+8D4NP76iRk0h7C7xvR/sgLYUSJA2dNxP6MUWXJjU
         +bDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBbdk8RNuosm7zXfARTWI8dfNKPyr27kRr3qHIAdCVn6Lwj/EPpla/7dvlZ/puejsn5Lh9ctqBNAHr4YoQtsQFzGE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzK4Pm+A+LwsWCh3xZt+epb4y6r12PWy3E1hYm3hS5l14il/NV7
	XL91Yxm+x5LXUIvFi2W1T3rNDpCxrEvv4JxYiV2fsm3tiFyLNbY+Yhian+KzHKcDaA/X61MZrbO
	ojb/a50jjsHytMan5cuKgPtClGEA=
X-Gm-Gg: ASbGncukRGs7OepkW5/BP4rbI2s9q2WAggfdeaiQj1ieYqE24WbVvgkbFlBbWES0uCB
	aAf1w1yvU+C+73fU7W3l0oZT4yAbXNDE=
X-Google-Smtp-Source: AGHT+IHZ/kYemDylkznu4TWeV6lVG/5S5R3XACMgHn+IHCAEgNnZWKhjBgk5X2pGKMJV/yYgqxmMlsOHhEUbFcfm1r4=
X-Received: by 2002:a05:6808:444a:b0:3ea:3851:f51f with SMTP id
 5614622812f47-3eb183c07c5mr42408b6e.5.1733418354888; Thu, 05 Dec 2024
 09:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20241203054957.1925390-1-deepan.shivap@lge.com>
 <CAMKF1sohKYx3a8thv8Dwg8BWe0nSXVDyF0vLGV9mRZdA9e1rWA@mail.gmail.com> <CA+chaQdVHbkT8+HMX8E-VKRvyOdQe+KsPpBiXVoiV9zG=m5PaQ@mail.gmail.com>
In-Reply-To: <CA+chaQdVHbkT8+HMX8E-VKRvyOdQe+KsPpBiXVoiV9zG=m5PaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2024 09:05:29 -0800
Message-ID: <CAMKF1sp2KEbjwfDZYJtShqGTo-6wAuV93L-f2oRK3pNB4UzmZw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ot-br-posix: Fix Musl build error
To: Martin Jansa <martin.jansa@gmail.com>
Cc: deepan.shivap@lge.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 17:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114210

On Thu, Dec 5, 2024 at 8:59=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> I've asked to deepan to test it with musl, but not with musl+clang, so
> the CXXFLAGS:append:libc-musl:toolchain-clang line in the recipe is
> still needed (at least for the sign-compare, maybe both).
>
> Deepan please send v2.

I think a separate patch is in order since I have accepted v1.
right way to fix might be to initialize  msghdr elements individually see

https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extende=
d/canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-wa=
y.patch

this might be upstreamable as well.

>
> On Thu, Dec 5, 2024 at 5:55=E2=80=AFPM Khem Raj via lists.openembedded.or=
g
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Mon, Dec 2, 2024 at 9:50=E2=80=AFPM deepan.shivap via
> > lists.openembedded.org <deepan.shivap=3Dlge.com@lists.openembedded.org>
> > wrote:
> > >
> > > From: "deepan.shivap" <deepan.shivap@lge.com>
> > >
> > > Mistakenly removed musl-fixes.patch in previous commit.
> > >
> > > update & Include 0001-Musl-build-fix.patch based on latest upstream o=
f ot-br-posix
> > >
> > > Remove CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Ds=
ign-compare
> > > -Wno-error=3Dunused-but-set-variable", as issue is not reproducible w=
ith
> > > current SRCREV of ot-br-posix.
> > >
> > > Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> > > ---
> > >  .../ot-br-posix/0001-Musl-build-fix.patch     | 27 +++++++++++++++++=
++
> > >  .../openthread/ot-br-posix_git.bb             |  4 +--
> > >  2 files changed, 28 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta-networking/recipes-connectivity/openthread/o=
t-br-posix/0001-Musl-build-fix.patch
> > >
> > > diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-po=
six/0001-Musl-build-fix.patch b/meta-networking/recipes-connectivity/openth=
read/ot-br-posix/0001-Musl-build-fix.patch
> > > new file mode 100644
> > > index 000000000..108ed76b3
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/000=
1-Musl-build-fix.patch
> > > @@ -0,0 +1,27 @@
> > > +From 502aa4ab4bbc790fb2999ff2b5f10dabd7085190 Mon Sep 17 00:00:00 20=
01
> > > +From: "deepan.shivap" <deepan.shivap@lge.com>
> > > +Date: Mon, 2 Dec 2024 23:12:17 +0900
> > > +Subject: [PATCH] Musl build fix
> > > +
> > > +usage of getaddrinfo_a creates dependency on libanl, which is  speci=
fic
> > > +to glibc.
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> > > +---
> > > + src/posix/platform/CMakeLists.txt | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/src/posix/platform/CMakeLists.txt b/src/posix/platform/=
CMakeLists.txt
> > > +index b4ac241f5..7b2028e45 100644
> > > +--- a/src/posix/platform/CMakeLists.txt
> > > ++++ b/src/posix/platform/CMakeLists.txt
> > > +@@ -175,7 +175,7 @@ target_link_libraries(openthread-posix
> > > + )
> > > +
> > > + option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OFF)
> > > +-if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT)
> > > ++if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT =
AND NOT OT_TARGET_MUSL)
> > > +     target_compile_definitions(ot-posix-config
> > > +         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABLE=
=3D1"
> > > +     )
> > > diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-po=
six_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_gi=
t.bb
> > > index 8183f5203..f4c193a8e 100644
> > > --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git=
.bb
> > > +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git=
.bb
> > > @@ -19,15 +19,13 @@ SRC_URI =3D "gitsm://github.com/openthread/ot-br-=
posix.git;protocol=3Dhttps;branch=3Dm
> > >             file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.=
patch \
> > >             file://default-cxx-std.patch \
> > >             file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=
=3Dthird_party/openthread/repo \
> > > +           file://0001-Musl-build-fix.patch;patchdir=3Dthird_party/o=
penthread/repo \
> > >             "
> > >
> > >  S =3D "${WORKDIR}/git"
> > >  SYSTEMD_SERVICE:${PN} =3D "otbr-agent.service"
> > >
> > >  inherit pkgconfig cmake systemd
> > > -# openthread/repo/src/cli/cli.cpp:1786:18: fatal error: variable 'i'=
 set but not used [-Wunused-but-set-variable]
> > > -#    for (uint8_t i =3D 0;; i++)
> > > -CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsign-co=
mpare -Wno-error=3Dunused-but-set-variable"
> > >
> >
> > While this fixes one problem it exposes another error seen in couple of=
 places
> >
> > | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix/0.=
3.0+git/git/src/backbone_router/nd_proxy.cpp:187:67:
> > fatal error: comparison of integers of
> >    =E2=86=AA different signs: 'unsigned long' and 'int' [-Wsign-compare=
]
> >    |   187 |         for (cmsghdr =3D CMSG_FIRSTHDR(&msghdr); cmsghdr;
> > cmsghdr =3D CMSG_NXTHDR(&msghdr, cmsghdr))
> >    |       |
> >         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix=
/0.3.0+git/recipe-sysroot/usr/include/sys/socket.h:358:44:
> > note: expanded from macro 'CMSG_NXTHDR'
> >    =E2=86=AA
> >    |   358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >=3D
> > __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
> >    |       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    | 1 error generated.
> >
> >
> >
> > >  LDFLAGS:append:riscv32 =3D " -latomic"
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114208): https://lists.openembedded.org/g/openembed=
ded-devel/message/114208
> > Mute This Topic: https://lists.openembedded.org/mt/109895644/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

