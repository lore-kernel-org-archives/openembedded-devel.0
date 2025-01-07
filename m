Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D71AE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 21:14:06 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.3553.1736284437838639022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 13:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dg2+2zxB;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71df1f45b0cso114743a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736284437; x=1736889237; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXqT2Mqb343ZFSNW11a81fCWdRs/p4S7n73U9USD3Uk=;
        b=Dg2+2zxB6/Kpj/b1AQ6jTvOOw6sbh/si7ghLnnuLS2pMDTmCllkALL9cYvB+PBMxKp
         oRiebsKVxfSikWFocd17RjlKyoRgsV3HRXyA5f/N3YSW+n8FK33EjnYVgfSTl9MV4Dp6
         BdmC8TMMidtx+nwIZUI0EF0IKL9J0NjmXplNzsDXFPJcLu0r5JtvXlYUVqnV6q84hsgk
         y9jmo/DYQlDjxlJDCZlSvCnaT4x6Eqop01t3+wljNHFUTBmKnlNWrjYGNQj6mv2DMC4X
         EVgxSzbXGkYh58rw5QFQupcCglM/XKA91RcEUk7IK9ddtzUUq8ByzIIzFnwibEC8B63q
         exUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736284437; x=1736889237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXqT2Mqb343ZFSNW11a81fCWdRs/p4S7n73U9USD3Uk=;
        b=D2o6hwBTy9IqZNNO+GcND+jlikUpEQsyyKCFPdr+B1krq/4XRM0oxqOY3Okyt3deiL
         2YYp5I0XHMYUt9zcl2q+/btgLSrOecqZHxOb62lYufTlT1lRUvFZ8SDHpGAqMcvXMjao
         +JaJxuIPrGca5q3852JVxE1k7MTbazCUQM8C3ySImYSRl79sG+qljtecd58CKdpoRzeM
         8jKQAvAK2mOOh4F1+6LEEj5Mfl0HaWKwUUZ6vGL0V6sJcZSvNakS84zq+AI3R4sfrM76
         sXf4ifyyie1wgtx7MZIaqQJULUR2jJhVPtrrmGjTCZcKhNltmskMbpvOA4ZojO55MhCZ
         VPhA==
X-Gm-Message-State: AOJu0YyopzkzxEK6pdvHmxkatn+8k0+YM6Zgq+qGab/LoprNFp8/gX4t
	DZ4eeUCwbny8rBrNdR7CqUKnDS6lbbKd1xoYARwCgitbKieyyYbRCIIB1nqmPf5wSWDHgXS5ivJ
	CmBA2DVE5blZKDMK+0hAzzEebiQk=
X-Gm-Gg: ASbGncvlrtGFQdi7K1nQFgKwilMUJyJhm1Y5Zi87P95fkQoe12/O/Dpaw4RUOxR/Lv6
	nlw6MsPrrN+k50QyJFh1wyAGi3e7JhMDvZzWWqg==
X-Google-Smtp-Source: AGHT+IGDCCABYbYOl6CI4Yq3G1cOwCfYZKs78dERNaQlzW7kc7ERw3dH9E6shdQytpb05w/077GZdURpIM2W4clfCZw=
X-Received: by 2002:a05:6870:ef02:b0:2a3:8330:3de4 with SMTP id
 586e51a60fabf-2a9eadea341mr2668237fac.18.1736284437065; Tue, 07 Jan 2025
 13:13:57 -0800 (PST)
MIME-Version: 1.0
References: <18187887BF14CFCD.5240@lists.openembedded.org> <5PAQPS.HDRNZM5FNZBD1@t-online.de>
In-Reply-To: <5PAQPS.HDRNZM5FNZBD1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jan 2025 13:13:31 -0800
X-Gm-Features: AbW1kvbimmEEV1yT2dphHIWlB6dTZRZQFCfV7zG20Ab0YsirBaNasTcTJ26F994
Message-ID: <CAMKF1sq+D3Uwz4oU2H0mK1Td0+LujU8Pz8Qy_Os7dfAqxUj2Rg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv3] x265: update 3.2.1 -> 4.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 21:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114726

We need to keep -DENABLE_PIC=3DON if we have -DENABLE_PIC=3DON

On Tue, Jan 7, 2025 at 9:17=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> fix typo
>
> On Tue, Jan 7 2025 at 18:16:31 +01:00:00, Markus Volk <f_l_k@t-online.de>=
 wrote:
>
> - add PACKAGECONFIG for hdr10plus and 10bit - add numa support - build sh=
ared library by default - do manual packaging to avoid dev-elf error: x265-=
4.1-r0 do_package_qa: QA Issue: -dev package x265-dev contains non-symlink =
.so '/usr/lib/libhdr10plus.so' [dev-elf] Signed-off-by: Markus Volk <f_l_k@=
t-online.de> --- .../recipes-multimedia/x265/x265_3.2.1.bb | 26 -----------=
------ .../recipes-multimedia/x265/x265_4.1.bb | 29 +++++++++++++++++++ 2 f=
iles changed, 29 insertions(+), 26 deletions(-) delete mode 100644 meta-mul=
timedia/recipes-multimedia/x265/x265_3.2.1.bb create mode 100644 meta-multi=
media/recipes-multimedia/x265/x265_4.1.bb diff --git a/meta-multimedia/reci=
pes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265=
/x265_3.2.1.bb deleted file mode 100644 index 225fbdee87..0000000000 --- a/=
meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb +++ /dev/null @@ -1,2=
6 +0,0 @@ -SUMMARY =3D "H.265/HEVC video encoder" -DESCRIPTION =3D "A free =
software library and application for encoding video streams into the H.265/=
HEVC format." -HOMEPAGE =3D "http://www.videolan.org/developers/x265.html" =
- -LICENSE =3D "GPL-2.0-only" -LICENSE_FLAGS =3D "commercial" -LIC_FILES_CH=
KSUM =3D "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4ad4091" - -DEPE=
NDS =3D "nasm-native gnutls zlib libpcre" - -SRC_URI =3D "http://ftp.videol=
an.org/pub/videolan/x265/x265_${PV}.tar.gz" - -S =3D "${WORKDIR}/x265_${PV}=
/source" - -SRC_URI[sha256sum] =3D "fb9badcf92364fd3567f8b5aa0e5e952aeea7a3=
9a2b864387cec31e3b58cbbcc" - -inherit lib_package pkgconfig cmake - -do_gen=
erate_toolchain_file:append() { - echo "set(CMAKE_ASM_NASM_FLAGS --debug-pr=
efix-map ${S}=3D${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake -} - -=
EXTRA_OECMAKE:append:x86 =3D " -DENABLE_ASSEMBLY=3DOFF" -EXTRA_OECMAKE:appe=
nd:aarch64 =3D " -DENABLE_PIC=3DON" - -AS[unexport] =3D "1" diff --git a/me=
ta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes=
-multimedia/x265/x265_4.1.bb new file mode 100644 index 0000000000..176774e=
359 --- /dev/null +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb=
 @@ -0,0 +1,29 @@ +SUMMARY =3D "H.265/HEVC video encoder" +DESCRIPTION =3D =
"A free software library and application for encoding video streams into th=
e H.265/HEVC format." +HOMEPAGE =3D "https://bitbucket.org/multicoreware/x2=
65_git" + +LICENSE =3D "GPL-2.0-only" +LICENSE_FLAGS =3D "commercial" +LIC_=
FILES_CHKSUM =3D "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4ad4091"=
 + +DEPENDS =3D "nasm-native gnutls zlib libpcre numactl" + +SRC_URI =3D "h=
ttps://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.gz" +S=
RC_URI[sha256sum] =3D "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a=
4379d7af8f29" +S =3D "${WORKDIR}/x265_${PV}/source" + +inherit lib_package =
cmake pkgconfig + +EXTRA_OECMAKE +=3D "-DENABLE_SHARED=3DON -DENABLE_CLI=3D=
ON" + +do_generate_toolchain_file:append() { + echo "set(CMAKE_ASM_NASM_FLA=
GS --debug-prefix-map ${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" =
>> ${WORKDIR}/toolchain.cmake +} + +PACKAGECONFIG ?=3D "hdr10plus 10bit" +P=
ACKAGECONFIG[hdr10plus] =3D "-DENABLE_HDR10_PLUS=3DON,-DENABLE_HDR10_PLUS=
=3DOFF" +PACKAGECONFIG[10bit] =3D "-DHIGH_BIT_DEPTH=3DON,-DHIGH_BIT_DEPTH=
=3DOFF" + +FILES:${PN} +=3D "${libdir}/libhdr10plus.so" +FILES:${PN}-dev =
=3D "${includedir} ${libdir}/pkgconfig ${libdir}/libx265.so" +
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114719): https://lists.openembedded.org/g/openembedde=
d-devel/message/114719
> Mute This Topic: https://lists.openembedded.org/mt/110480967/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

