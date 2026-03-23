Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4069BF483ED
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:55:38 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4127.1774295733520580756
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qNHaGyCw;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-662f30d3f1fso3189357eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 12:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774295733; cv=none;
        d=google.com; s=arc-20240605;
        b=eIEFlaPq2LbZjS53HztrNl19YyHeVqQ7bfKaYvc3Lw/26roAmtlobESAw2J2ztvcOI
         wdxTDU5ew1D07mBLGK67u5f5lfD37PTstBuKAnlBCrIZG4GJjuIJsiD2+JS5J11YisBK
         zphXmyIyP7x5UXuvIPAM46UUGjcf6t79bGCwbqlYpQ98FVKA43ItaF26NHRj0nxDqsbZ
         CVjTWDaHkCi2kuZdvuYUiS8iA9i8tXTAqwmyQW1EjGo2xF1EL+1C8r6mZdI0OXnGIlHU
         0dLImVsOFXpqxb11B0caa4MeP9inQVIAcM/TVgvlKMglYCsR3TLfXopR9WvDeHG3KcIe
         dVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LO1pBXbs/UGLfDqtS0rkbNmDoSZIB+bXQ/qk6ZVQuE=;
        fh=EqFFGVnRn0qz4znwnmk0n+hFhLaJvAVW0pujP36Ql9U=;
        b=BBD7xNpqzWd1ctsGfqYP6ZBiaRdi7vgb3GcQdDXtps1g+tMGjiGIVkPX1EeXxNUZWS
         9IEKabYOHTnyQTN75cjVfzZQVmP/mA8YVgy6Ss2Z8ZLXmdsdVqIlcN8NogBYYrabDBfw
         fcv+t5TrJA0BOPMo51DKI7FRhi1nHjm8e5SBZH9jEkfcGPUvaKUOljJVLEaKRVfCQ40q
         2scoqL5+GBaHOHcE2yPes5ymsPGHzK72f7+xkWeX7BPk5HY8q2vkfaopxGYouteC77AD
         pi/LqLmG8SIA0/+R5tEHrNtLGACvGnLcrof44UAohP0c3dcCNcHskdLFO4+d0KE1atMu
         4buA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295733; x=1774900533; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LO1pBXbs/UGLfDqtS0rkbNmDoSZIB+bXQ/qk6ZVQuE=;
        b=qNHaGyCwhaZfrKfj0wNztbMT5K/d8ZOFWv0In5jPR8r5DD2Iq7ewHjexxhjqIT/5vh
         /HPpRwTmejz8lj2JBOMcrgmoHSPgRnT6lwtyskssK/DNmyQDzu967X0TPjuVM1lN5UBZ
         i7BfL6O/KcuKQbYBtSWDzLOkmZViy0DYTYytH5WpZspSP+ME0hD9aAWxoBGKln47DQQx
         pkApNzeG3FH4aK5L8EHtDIkUddQFNm7qw/kHxP4Y+cewokH+thEoREmOyfnd8fB4r8e8
         0pn5ae0xo1mgGfvttQpRnNlQN3O2RaqsY7E+1soVEA5nyJVcqX/7/f1AwVBzZ6nv3sDv
         LqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295733; x=1774900533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LO1pBXbs/UGLfDqtS0rkbNmDoSZIB+bXQ/qk6ZVQuE=;
        b=aDEDzspxbw4d5S5xpuBg4A4xrD7JNO/IjNlaZIECrpTW9Wkc+AgwyotWjhkdkJBbsG
         KM4A6LI/GbaTOcb4lzhVQD+N6K5ZBGQAzbCDrFdFW2bOLycXrf+oKF6f+6KSlYIb+PqA
         59YayzrwahNsqjfUP4G+lTGfKLaYkU9VCvehqLDf4eqT8ij5e6KmDDlLpWqluFaRN0dr
         KJ/pNq2ouChfKOQa1DILQtdPtJEV5AGBVfLU+JES5F/B95D9/OV8oza1I5HfEIpfC3/8
         3TAX6sUVmSOxO+S12dsGrj4F3neSu3D0/wyyOtWK+Xkg0yXSKQjwAjvhyEDQ62adv3Lr
         coCg==
X-Gm-Message-State: AOJu0Yzxost7u+g6VG79UYmk/MQSUdu9k81C8y5XOHy0xzApONmKzO5h
	UrRrGbxC9+/IJgHPRq93ZB9VO/kilqk5hGNLAsBY8WTqBYVuXHJw2vpmvwlMM8Iu+FdZIC8JpqH
	z57Zk8cKhsN9r7GqPQK/5MMCWkFvPH0M=
X-Gm-Gg: ATEYQzx3Rkdi7BIiTyqwzQxA8wGDfBxodeVyh23JJ7WUhwTu470eSVIZ3w15M6B2o2p
	DOpG40TzXZgGNqLLlOhv6vDhNw/6NCQVkdW5xzIxMqCvc9tG+nWJLbgAjM7emHng0XOP/lXWk8I
	odloRIAFzTvC6HJP6DkNXFEVYiDB12p9Wt2XAzs/lk+qcxMpPqgtaKRCCvCB7hCYBpyg7CY0GZe
	R8sCjUTPN+Rheh1NlWe8EkM/sxxxs0urherqyesdADUGDMeuQFF3R9hz/voMYqrZHGx0letnF1v
	2VOlSUI71JDKW8gHQbQ=
X-Received: by 2002:a05:6820:1999:b0:67d:b2f2:6e73 with SMTP id
 006d021491bc7-67df5d03f02mr620702eaf.8.1774295732666; Mon, 23 Mar 2026
 12:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260323162731.8483-1-peter.marko@siemens.com> <20260323162731.8483-3-peter.marko@siemens.com>
In-Reply-To: <20260323162731.8483-3-peter.marko@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 24 Mar 2026 08:55:21 +1300
X-Gm-Features: AQROBzCZBsCF3K93ZYVx8mhJKAH13Gs4mF62GmkdDWNEVHwxJBzEiSZ66IiY_vA
Message-ID: <CADySD0FW89Hz_7Q=D9RqkRqpwOX5sQ6t0F_QiKSOxzwhF0i9uQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] jsoncpp: upgrade 1.9.6 -> 1.9.7
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 19:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125528

On Tue, Mar 24, 2026 at 5:27=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Release information [1]:
>
> 1.9.7: Bugfixes, build system cleanups
> What's Changed
> * Fixes PreventInSourceBuilds.cmake to work with add_subdirectory by @mor=
bo84 in #1383
> * json_value.cpp bug in the edges of uint/int by @YaalLek in #1519
> * Release 1.9.6 and move versions to 1.9.7 by @baylesj in #1566
> * Fixed work secure_allocator on old compiers by @TsynkPavel in #1478
> * Fix flag -DJSONCPP_USE_SECURE_MEMORY:BOOL=3DTRUE by @tfc in #1567
> * fix(build): remove check_required_components for meson build by @chenru=
i333 in #1570
> * the cgi module was removed from Python3.13 by @a-detiste in #1578
> * Fix name of static library when targeting MinGW. by @mmuetzel in #1579
> * Fix comparison warnings caused by 54fc4e2 by @JensMertelmeyer in #1575
> * Drop pre-C++11 alternatives by @BillyDonahue in #1593
> * feat: support std::string_view in Value API by @evalon32 in #1584
> * Added Value::findType with String key by @SwintonStreet in #1574
> * Set up for Bazel module builds. by @bcsgh in #1597
> * Add a BUILD.bazel file for //example. by @bcsgh in #1602
> * Fix "include what you use" issue by @victorvianna in #1625
> * Make the build configuration under Bazel more correct. by @bcsgh in #16=
00
> * Add Bazel tests by @bcsgh in #1601
> * Return false in Reader::readValue when stack limit is exceeded by @xuhd=
ev in #1619
> * Remove deprecated/removed clang-tidy key AnalyzeTemporaryDtors (#1614) =
by @bmagistro in #1615
> * [docs] Consuming JSONCpp via Conan package manager by @uilianries in #1=
622
> * Cleanup README.md, fix broken link. by @baylesj in #1633
> * Add gcovr.cfg to fix CI coverage merge errors by @baylesj in #1635
> * Remove build directory exclusion from gcovr config by @baylesj in #1640
> * Add test for allowDroppedNullPlaceholders by @baylesj in #1648
> * Prevent test colision when running in parallel via RESOURCE_LOCK by @ma=
rty1885 in #1637
> * fixup project version updater by @baylesj in #1649
> * Update README with project status and focus by @baylesj in #1639
> * Adding a cmake option to exclude the jsoncpp files from install. by @nv=
-jdeligiannis in #1596
> * Change stack depth limit to 256 by @baylesj in #1657
> * Fix uninitialized CMake variable in version.in by @baylesj in #1658
> * Fix CMake deprecation warning for compatibility with CMake < 3.10 by @b=
aylesj in #1659
> * Scope JSON_DLL_BUILD to shared lib target only by @baylesj in #1660
> * Fix number parsing failing under non-C locales by @baylesj in #1662
> * Reject unescaped control characters in JSON strings by @baylesj in #166=
3
> * Fix MSAN issue in #1626 by @baylesj in #1654
> * Fix string_view ABI mismatch between library and consumers by @baylesj =
in #1661
> * Revert "Fix number parsing failing under non-C locales" by @baylesj in =
#1664
> * Fix use-after-free in Reader::parse(std::istream&) by @baylesj in #1665
> * Update bazel config for 9.x by @keith in #1655
>
> [1] https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../jsoncpp/{jsoncpp_1.9.6.bb =3D> jsoncpp_1.9.7.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.6.bb =3D> jsoncpp_1=
.9.7.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb b/meta-oe/=
recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> index f68ffd2c0f..c44422071e 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.6.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d73c165a0f9=
e86a1342f32d19ec5926"
>
>  PE =3D "1"
>
> -SRCREV =3D "89e2973c754a9c02a49974d839779b151e95afd6"
> +SRCREV =3D "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
>  SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmaste=
r;protocol=3Dhttps"

can please also include tag=3D${PV} in the SRC_URI

>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125523): https://lists.openembedded.org/g/openembedde=
d-devel/message/125523
> Mute This Topic: https://lists.openembedded.org/mt/118468191/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

