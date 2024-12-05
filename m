Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EDEE77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 16:55:24 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.16515.1733417722561751345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Dec 2024 08:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cd1MX4aR;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71d46ace74aso590932a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733417722; x=1734022522; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTLrMOk6CtYT5yJ5J5ozpOC/rGmfMv4cHa1v0JLR8pg=;
        b=cd1MX4aRyySOFOx1xydzx5qRVdsIHA0i1baoSzIAIKaOEv6o8qlY55DNIbcLyggF93
         jkisuHMxru/cpCIz+Ro+sbGQeQDCFWUhKmTRM33R5nwaHmEZZPu+2OGLVk3L0mahzVwT
         olW8MgU+d60sD32CDnWY6j5vzlh0HjTE3MVXojidRbzdxU2ym2RlVmF03nWq4oul8ORN
         pEVfAGXnxW28/BVm5hBXl4qGh8Cut9tI7drqa2Td4e9ph1tjXvJsHzGHTDlRYeblsn+G
         zQIDcLf+R8WARgLKpooCCeTXejyQBgEF/NYvaZhidRJxa/zatuFnkgfyR4MjCKc2Mv5y
         WQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417722; x=1734022522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTLrMOk6CtYT5yJ5J5ozpOC/rGmfMv4cHa1v0JLR8pg=;
        b=N7h1ZkQtCKbjFGFFexRuqZh/KOKEyW56uB/3o+7DPJJII4HLKUHIs9CWfLz5vBXvjN
         0kuba+Lps93VQoo3+zAA0fl6dCQLrQ4MwxtH7esoJb6igSGKDHLxbkL89xRzwv/tWons
         NJ8wesoM/sb3vkTEDuMWE+9LV6LMr5iNi4RmSJPQAkiLwFboY0YtAEqZFEZVVat1n8nn
         AksCQHdiT/z31tKH0EJWswlgPSSk5rr+XuXJJUOMW++5z1lzkSnuzFz+BfJeN1J3ALWq
         Y+MFAyP/yJPNY+aQ4csb49m3kGl5pYksTprRBBgVKlUr1C2HoOwRNZTRgypBkzekiPpc
         O6cA==
X-Gm-Message-State: AOJu0YwygcdIJIyhWCx93ZLLiE89azIbzeTqEgch83HefSzILlPU+c+d
	AgOadw/eLizpL1E8ky7KqdI7mWEN2A1NjsZEg+hlKMCftfem3tsyU8hRJ/307gYbTqb9NkMYrDb
	NN3NsVEdPe/m4aCSx5lNYFW55zJw=
X-Gm-Gg: ASbGnctAn/s5zRIeyhsbRAYvvE2XlIU4Ggi5WHGM05HHQMhT2ASoztEnZ9EvfMVbW7f
	QslRA2YyGBGrq9CHvq/EVQcbM3xwLDDA=
X-Google-Smtp-Source: AGHT+IErYfq6h1uqydYNg5Zf4NDyfqHpSq6HegLDeHitZae7wIsiE6aODbXLqgw+6ahz9POJn+BQFfFmOSsvE1h9KZQ=
X-Received: by 2002:a05:6830:2110:b0:718:5a53:cc61 with SMTP id
 46e09a7af769-71dad701765mr13821979a34.30.1733417721712; Thu, 05 Dec 2024
 08:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20241203054957.1925390-1-deepan.shivap@lge.com>
In-Reply-To: <20241203054957.1925390-1-deepan.shivap@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2024 08:54:55 -0800
Message-ID: <CAMKF1sohKYx3a8thv8Dwg8BWe0nSXVDyF0vLGV9mRZdA9e1rWA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ot-br-posix: Fix Musl build error
To: deepan.shivap@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Dec 2024 16:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114208

On Mon, Dec 2, 2024 at 9:50=E2=80=AFPM deepan.shivap via
lists.openembedded.org <deepan.shivap=3Dlge.com@lists.openembedded.org>
wrote:
>
> From: "deepan.shivap" <deepan.shivap@lge.com>
>
> Mistakenly removed musl-fixes.patch in previous commit.
>
> update & Include 0001-Musl-build-fix.patch based on latest upstream of ot=
-br-posix
>
> Remove CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsign-=
compare
> -Wno-error=3Dunused-but-set-variable", as issue is not reproducible with
> current SRCREV of ot-br-posix.
>
> Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> ---
>  .../ot-br-posix/0001-Musl-build-fix.patch     | 27 +++++++++++++++++++
>  .../openthread/ot-br-posix_git.bb             |  4 +--
>  2 files changed, 28 insertions(+), 3 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br=
-posix/0001-Musl-build-fix.patch
>
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/=
0001-Musl-build-fix.patch b/meta-networking/recipes-connectivity/openthread=
/ot-br-posix/0001-Musl-build-fix.patch
> new file mode 100644
> index 000000000..108ed76b3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/0001-Mu=
sl-build-fix.patch
> @@ -0,0 +1,27 @@
> +From 502aa4ab4bbc790fb2999ff2b5f10dabd7085190 Mon Sep 17 00:00:00 2001
> +From: "deepan.shivap" <deepan.shivap@lge.com>
> +Date: Mon, 2 Dec 2024 23:12:17 +0900
> +Subject: [PATCH] Musl build fix
> +
> +usage of getaddrinfo_a creates dependency on libanl, which is  specific
> +to glibc.
> +
> +Upstream-Status: Pending
> +Signed-off-by: deepan.shivap <deepan.shivap@lge.com>
> +---
> + src/posix/platform/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/posix/platform/CMakeLists.txt b/src/posix/platform/CMak=
eLists.txt
> +index b4ac241f5..7b2028e45 100644
> +--- a/src/posix/platform/CMakeLists.txt
> ++++ b/src/posix/platform/CMakeLists.txt
> +@@ -175,7 +175,7 @@ target_link_libraries(openthread-posix
> + )
> +
> + option(OT_TARGET_OPENWRT "enable openthread posix for OpenWRT" OFF)
> +-if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT)
> ++if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux" AND NOT OT_TARGET_OPENWRT AND =
NOT OT_TARGET_MUSL)
> +     target_compile_definitions(ot-posix-config
> +         INTERFACE "OPENTHREAD_POSIX_CONFIG_NAT64_AIL_PREFIX_ENABLE=3D1"
> +     )
> diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_=
git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> index 8183f5203..f4c193a8e 100644
> --- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> +++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
> @@ -19,15 +19,13 @@ SRC_URI =3D "gitsm://github.com/openthread/ot-br-posi=
x.git;protocol=3Dhttps;branch=3Dm
>             file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patc=
h \
>             file://default-cxx-std.patch \
>             file://0001-fix-build-on-GCC-14-for-yocto.patch;patchdir=3Dth=
ird_party/openthread/repo \
> +           file://0001-Musl-build-fix.patch;patchdir=3Dthird_party/opent=
hread/repo \
>             "
>
>  S =3D "${WORKDIR}/git"
>  SYSTEMD_SERVICE:${PN} =3D "otbr-agent.service"
>
>  inherit pkgconfig cmake systemd
> -# openthread/repo/src/cli/cli.cpp:1786:18: fatal error: variable 'i' set=
 but not used [-Wunused-but-set-variable]
> -#    for (uint8_t i =3D 0;; i++)
> -CXXFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsign-compar=
e -Wno-error=3Dunused-but-set-variable"
>

While this fixes one problem it exposes another error seen in couple of pla=
ces

| /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix/0.3.0+=
git/git/src/backbone_router/nd_proxy.cpp:187:67:
fatal error: comparison of integers of
   =E2=86=AA different signs: 'unsigned long' and 'int' [-Wsign-compare]
   |   187 |         for (cmsghdr =3D CMSG_FIRSTHDR(&msghdr); cmsghdr;
cmsghdr =3D CMSG_NXTHDR(&msghdr, cmsghdr))
   |       |
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   | /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux-musl/ot-br-posix/0.3=
.0+git/recipe-sysroot/usr/include/sys/socket.h:358:44:
note: expanded from macro 'CMSG_NXTHDR'
   =E2=86=AA
   |   358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >=3D
__MHDR_END(mhdr) - (unsigned char *)(cmsg) \
   |       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   | 1 error generated.



>  LDFLAGS:append:riscv32 =3D " -latomic"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114179): https://lists.openembedded.org/g/openembedde=
d-devel/message/114179
> Mute This Topic: https://lists.openembedded.org/mt/109895644/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

