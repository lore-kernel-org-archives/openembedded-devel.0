Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D54E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 21:14:36 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.3623.1736284473515010836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 13:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e09NlgAR;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f31e8c2bfaso3483308eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736284473; x=1736889273; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImeXC1ABtr4ls338ZV3XUx5d0ayP4r8LIGPZjjN1qGc=;
        b=e09NlgARk3LMIroa1ODynvi1NcAL6oN1pZaBKUf1NmOTis4Os7YJohjZ13mU+pxzv5
         8RThfjvjqGe9me6KDWw8gab2Int9IWf+9rGJKtNM1078LQ5bnR8L3rFluCNUkzke1a9d
         w2SI/VOeKUuwKSzkIjxRTqTkkWe8VRAyGtT/R7xQ6L/2rfY/qqVnMlKoC4QzYp0lDOf6
         0xi4PbTI9gH0x7NeRAI1rUhN8d8HmQ3IaWt72x1YJIbt+fh29ARPL49ZAyGKaYO2rDZb
         aVXJhOqEL+sjlqASy2tVuv0SLRvOCJJ5+qCw5lUMAuUY+7c+vStuX6NtwQUZF+nDAy7L
         9NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736284473; x=1736889273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImeXC1ABtr4ls338ZV3XUx5d0ayP4r8LIGPZjjN1qGc=;
        b=lvEm8H7SG8HRjLOms2+cGCAEV7gN36KSGkW9n9/mQ2WHsuSOmuAh3dKcL6tDfpP0o6
         MwgD2XfRAoJpv5v01Lum5KqjGK4l+JBGwxlShod5umJKJnwkNWqy1HVlYFeASbYZb2G9
         dPRC9s76Kdjc+NNyNndy1UQ50u9Cyk8E5sFdt/3UfBWugJZPTzBmt1ujAsH6N5Oh0kQX
         pGWUivjH9yN7Q/fZ3HyiCdQ6v1V58sgwmvzj54E0sSeh5s7FkapGKHmEVsf882q0BwjP
         sezuNIwKCOdkrnMmaLGs8E1NBw7q7Q770P4wwZ6XWfPuy3IzrqaYg448wo+uH3HUWsic
         igfg==
X-Gm-Message-State: AOJu0YyWjlJdwZT6O0chqajMXOmTcFJlo/+B6U/jNaXi0j85F8gZvqg+
	J/zv7g6ebCfUM6qrcEiVlUkLqYSZUMlb0F4y27MABJz3LKF85q3PoHz/+BCXNAt//3YA866Z+8c
	6O3pg+uTIm67qAbulAAHGT0BW6Ys=
X-Gm-Gg: ASbGnculQP44zRo1CBEXb2GOziOLXUkt2+0oI7hzigcytsy3adfsaA4fOPvIceL9L+c
	Jg36sv7ayO+IV1klU8rRGC8msvSqGDseMLHYj+A==
X-Google-Smtp-Source: AGHT+IEtlZXOlD1GOKnNfInyCv7+Rhxd8R4HTZhCrbOu7hhdHZ7pNC+1ubpxxZVM8VCIw/OM9W0EMQrTHP96eKD6UBs=
X-Received: by 2002:a05:6871:6212:b0:29e:353b:8f25 with SMTP id
 586e51a60fabf-2aa06704957mr238022fac.12.1736284472674; Tue, 07 Jan 2025
 13:14:32 -0800 (PST)
MIME-Version: 1.0
References: <18187887BF14CFCD.5240@lists.openembedded.org> <5PAQPS.HDRNZM5FNZBD1@t-online.de>
 <CAMKF1sq+D3Uwz4oU2H0mK1Td0+LujU8Pz8Qy_Os7dfAqxUj2Rg@mail.gmail.com>
In-Reply-To: <CAMKF1sq+D3Uwz4oU2H0mK1Td0+LujU8Pz8Qy_Os7dfAqxUj2Rg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jan 2025 13:14:06 -0800
X-Gm-Features: AbW1kvajRdkcqjS6FywbvwM8kw6GvNdnPh-z1_BlDQpppisXop2JQqubmEPZ8QA
Message-ID: <CAMKF1sqdHepQFzjue7PNkHJA5EpHjLH+uCtbqA6uE1TV3HP2Bw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv3] x265: update 3.2.1 -> 4.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114727

On Tue, Jan 7, 2025 at 1:13=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> We need to keep -DENABLE_PIC=3DON if we have -DENABLE_PIC=3DON
>

meant to say -DENABLE_SHARED=3DON

> On Tue, Jan 7, 2025 at 9:17=E2=80=AFAM Markus Volk via lists.openembedded=
.org
> <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> >
> > fix typo
> >
> > On Tue, Jan 7 2025 at 18:16:31 +01:00:00, Markus Volk <f_l_k@t-online.d=
e> wrote:
> >
> > - add PACKAGECONFIG for hdr10plus and 10bit - add numa support - build =
shared library by default - do manual packaging to avoid dev-elf error: x26=
5-4.1-r0 do_package_qa: QA Issue: -dev package x265-dev contains non-symlin=
k .so '/usr/lib/libhdr10plus.so' [dev-elf] Signed-off-by: Markus Volk <f_l_=
k@t-online.de> --- .../recipes-multimedia/x265/x265_3.2.1.bb | 26 ---------=
-------- .../recipes-multimedia/x265/x265_4.1.bb | 29 +++++++++++++++++++ 2=
 files changed, 29 insertions(+), 26 deletions(-) delete mode 100644 meta-m=
ultimedia/recipes-multimedia/x265/x265_3.2.1.bb create mode 100644 meta-mul=
timedia/recipes-multimedia/x265/x265_4.1.bb diff --git a/meta-multimedia/re=
cipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x2=
65/x265_3.2.1.bb deleted file mode 100644 index 225fbdee87..0000000000 --- =
a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb +++ /dev/null @@ -1=
,26 +0,0 @@ -SUMMARY =3D "H.265/HEVC video encoder" -DESCRIPTION =3D "A fre=
e software library and application for encoding video streams into the H.26=
5/HEVC format." -HOMEPAGE =3D "http://www.videolan.org/developers/x265.html=
" - -LICENSE =3D "GPL-2.0-only" -LICENSE_FLAGS =3D "commercial" -LIC_FILES_=
CHKSUM =3D "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4ad4091" - -DE=
PENDS =3D "nasm-native gnutls zlib libpcre" - -SRC_URI =3D "http://ftp.vide=
olan.org/pub/videolan/x265/x265_${PV}.tar.gz" - -S =3D "${WORKDIR}/x265_${P=
V}/source" - -SRC_URI[sha256sum] =3D "fb9badcf92364fd3567f8b5aa0e5e952aeea7=
a39a2b864387cec31e3b58cbbcc" - -inherit lib_package pkgconfig cmake - -do_g=
enerate_toolchain_file:append() { - echo "set(CMAKE_ASM_NASM_FLAGS --debug-=
prefix-map ${S}=3D${TARGET_DBGSRC_DIR})" >> ${WORKDIR}/toolchain.cmake -} -=
 -EXTRA_OECMAKE:append:x86 =3D " -DENABLE_ASSEMBLY=3DOFF" -EXTRA_OECMAKE:ap=
pend:aarch64 =3D " -DENABLE_PIC=3DON" - -AS[unexport] =3D "1" diff --git a/=
meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recip=
es-multimedia/x265/x265_4.1.bb new file mode 100644 index 0000000000..17677=
4e359 --- /dev/null +++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.=
bb @@ -0,0 +1,29 @@ +SUMMARY =3D "H.265/HEVC video encoder" +DESCRIPTION =
=3D "A free software library and application for encoding video streams int=
o the H.265/HEVC format." +HOMEPAGE =3D "https://bitbucket.org/multicorewar=
e/x265_git" + +LICENSE =3D "GPL-2.0-only" +LICENSE_FLAGS =3D "commercial" +=
LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3Dc9e0427bc58f129f99728c62d4ad4=
091" + +DEPENDS =3D "nasm-native gnutls zlib libpcre numactl" + +SRC_URI =
=3D "https://bitbucket.org/multicoreware/x265_git/downloads/x265_${PV}.tar.=
gz" +SRC_URI[sha256sum] =3D "a31699c6a89806b74b0151e5e6a7df65de4b49050482fe=
5ebf8a4379d7af8f29" +S =3D "${WORKDIR}/x265_${PV}/source" + +inherit lib_pa=
ckage cmake pkgconfig + +EXTRA_OECMAKE +=3D "-DENABLE_SHARED=3DON -DENABLE_=
CLI=3DON" + +do_generate_toolchain_file:append() { + echo "set(CMAKE_ASM_NA=
SM_FLAGS --debug-prefix-map ${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR})" >> ${WORKDIR}/toolchain.cmake +} + +PACKAGECONFIG ?=3D "hdr10plus 10b=
it" +PACKAGECONFIG[hdr10plus] =3D "-DENABLE_HDR10_PLUS=3DON,-DENABLE_HDR10_=
PLUS=3DOFF" +PACKAGECONFIG[10bit] =3D "-DHIGH_BIT_DEPTH=3DON,-DHIGH_BIT_DEP=
TH=3DOFF" + +FILES:${PN} +=3D "${libdir}/libhdr10plus.so" +FILES:${PN}-dev =
=3D "${includedir} ${libdir}/pkgconfig ${libdir}/libx265.so" +
> > --
> > 2.47.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114719): https://lists.openembedded.org/g/openembed=
ded-devel/message/114719
> > Mute This Topic: https://lists.openembedded.org/mt/110480967/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

