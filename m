Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6F6C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 16:36:41 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.52378.1748018197996538378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 May 2025 09:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kPCMYKCT;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2c76a1b574cso54735fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748018197; x=1748622997; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CPN/140NDWOYb4xehUlqSsKwiUyz5S57NXxFqNNSBY=;
        b=kPCMYKCT+d7ooxVI8onP6+oLETuHOkIiLGL+xKV5uC66PHVOuOUDMy5zRD60lfIkDl
         Lj83GT5uRGExGqg0AtVMT2fpTPRB9UoFTnlSSoCdpvEgDmisVFNDefGenL93sHV9wXZf
         FMeoB/Pf+Nv42x6gp113dkZVMLe07L3pJXmjErfxk2x81h+2wYob4LZ8EZE+Agd84H/F
         DCb5bp7BSMTRFkrzk/sSOpkupcWlsB5qFpGI/X9uvvAm9Yp2TuJ/x8HdXB9tq8gcV+BD
         LJF7GGFBl3uBurge5F15JDTpjJXw6N1z+2kif/rL/QczzhlFZW9i38+uCP70IzUzrYUJ
         TL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748018197; x=1748622997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CPN/140NDWOYb4xehUlqSsKwiUyz5S57NXxFqNNSBY=;
        b=YK4fTL5Gj5y/tUopnL0alr8LHW/YbOhqst/P1iv/6X4bTKPNvrl79UGqDY0tfm4Ywo
         j1F8/DvnlxVqMLqquZ2sQahXOdmo0n88XK8yTBj05oWBVgHVkCDBFlqIUGdm2zIA+ZnX
         pZox0GZt98Gwv6hus9Bki+JX/iLEpABk7cVd1r8LfN6LOd5ZmrHfKr0N6ShT4AsQNok7
         OGfKjZjMrfHwRXV1GEBPqRw40Mz+Dqyi71Iy0R6V0J05wIlY4vbRbhEaVdAU9md2Xo/S
         79mV+kzKVpWGJ1nOIbJemqo9SvGsXoCv7DE32QZP1vW6N051aMf/8OPXEE0vWW88YFb3
         tc4g==
X-Gm-Message-State: AOJu0YzzIBNcwh/3dVSd/EZHyl977D/+X1FBVtNJxSYF5OnlRsfw27OC
	F8Ei15HXLp3G3VeV3X2GaRb67j1ZSCCTyQGjz/Ss+r2wVRbywxVACsBg6KMFd63GRyEvz0Nxxfe
	D4zxW0EN3qsVxALmA3ZVkKbUH9XabuNc9CPd6eYE=
X-Gm-Gg: ASbGnctPasJB9Z2nXBtI5nqqQ1UCg4xs8Y3c8LZy3sFsNyCFBVVcN8R9J86swnKbT4Z
	tpmk5uCAMOyFVZBiSiMgnGWw9xA+O7bFaJm0lBC+Yi6DPBjvm8ZCABK3VTwScJsm/uI/EzGDVrJ
	LQexPgyOI1AuAda6GgkPVCzbqRmLPj114=
X-Google-Smtp-Source: AGHT+IEvHVHybe7V84sqi9uReiLa7mrJanKAcvUyOU02rMVlaDaIGuvzQx/b3UZuBpADU+deYKXtaLnN57ILQ73aFBY=
X-Received: by 2002:a05:6820:178a:b0:604:66b4:a8f2 with SMTP id
 006d021491bc7-60b9fa6253cmr60232eaf.2.1748018197099; Fri, 23 May 2025
 09:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250522224420.107223-1-f_l_k@t-online.de>
In-Reply-To: <20250522224420.107223-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 May 2025 09:36:11 -0700
X-Gm-Features: AX0GCFvBDwlOTXkDf8epNNnMNGfvTY5hfnZfu5bwFHmh0eTnJiJY4wLDo8U2MPo
Message-ID: <CAMKF1sqcC+nvK-HtOsR4R3B75R3SyWma26G6eD=TGjB_40k-pw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] webrtc-audio-processing-2: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 May 2025 16:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117610

I am seeing a failure on riscv32

riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_load_8
   >>> referenced by
/home/kraj200/yoe/build/tmp/work/riscv32-yoe-linux/webrtc-audio-processing-=
2/2.1/recipe-sysroot/usr/lib/libabsl_spinlock_wait.so
(
   =E2=86=AA disallowed by --no-allow-shlib-undefined)

I think we need to add -latomic to LDFLAGS on 32bit arches where 64bit
intriniscs are not available e.g. mips,ppc,rv32 etc. I will test a
patch

On Thu, May 22, 2025 at 3:44=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - add backport patch to fix build with gcc15
> - dont add the patches from webrtc-audio-processing-1
>   The fixes have not been merged but it was said that
>   those issues should have been fixed
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...8dc4712fa6362b0c839ad57b6b46dce1ba83.patch | 50 +++++++++++++++++++
>  .../webrtc-audio-processing-2_2.1.bb          | 20 ++++++++
>  2 files changed, 70 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.pa=
tch
>  create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-proce=
ssing/webrtc-audio-processing-2_2.1.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch b/m=
eta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-proc=
essing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch
> new file mode 100644
> index 0000000000..3e2ac72c69
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-2/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch
> @@ -0,0 +1,50 @@
> +From e9c78dc4712fa6362b0c839ad57b6b46dce1ba83 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Fran=3DC3=3DA7ois=3D20Laignel?=3D <francois@centricula=
r.com>
> +Date: Mon, 14 Apr 2025 16:48:19 +0200
> +Subject: [PATCH] Fix compilation with gcc-15
> +
> +This commit fixes compilation errors with gcc-15 (default for Fedora 42)=
.
> +
> +From [1]:
> +
> +> Common C++ headers (like <memory>) in GCC 15.0.0 (combined with libstd=
c++)
> +> don't transitively include uint64_t anymore.
> +
> +See also [2].
> +
> +[1]: https://github.com/ROCm/rocm_smi_lib/pull/198
> +[2]: https://github.com/root-project/root/issues/17444
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/pulseaudio/web=
rtc-audio-processing/-/commit/e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patc=
h]
> +---
> + .../audio_processing/aec3/multi_channel_content_detector.h       | 1 +
> + webrtc/rtc_base/trace_event.h                                    | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/webrtc/modules/audio_processing/aec3/multi_channel_content_=
detector.h b/webrtc/modules/audio_processing/aec3/multi_channel_content_det=
ector.h
> +index 2b2f3b8..feb29fd 100644
> +--- a/webrtc/modules/audio_processing/aec3/multi_channel_content_detecto=
r.h
> ++++ b/webrtc/modules/audio_processing/aec3/multi_channel_content_detecto=
r.h
> +@@ -12,6 +12,7 @@
> + #define MODULES_AUDIO_PROCESSING_AEC3_MULTI_CHANNEL_CONTENT_DETECTOR_H_
> +
> + #include <stddef.h>
> ++#include <cstdint>
> +
> + #include <memory>
> + #include <optional>
> +diff --git a/webrtc/rtc_base/trace_event.h b/webrtc/rtc_base/trace_event=
.h
> +index 2aee713..f88a68e 100644
> +--- a/webrtc/rtc_base/trace_event.h
> ++++ b/webrtc/rtc_base/trace_event.h
> +@@ -28,6 +28,7 @@
> +
> + #if !defined(RTC_USE_PERFETTO)
> + #include <string>
> ++#include <cstdint>
> +
> + #include "rtc_base/event_tracer.h"
> +
> +--
> +GitLab
> +
> diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/w=
ebrtc-audio-processing-2_2.1.bb b/meta-multimedia/recipes-multimedia/webrtc=
-audio-processing/webrtc-audio-processing-2_2.1.bb
> new file mode 100644
> index 0000000000..00bf26c750
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-a=
udio-processing-2_2.1.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Audio processing bits of the WebRTC reference implement=
ation"
> +HOMEPAGE =3D "https://www.freedesktop.org/software/pulseaudio/webrtc-aud=
io-processing/"
> +SECTION =3D "audio"
> +
> +DEPENDS =3D "abseil-cpp"
> +DEPENDS:append:libc-musl =3D " libexecinfo"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dda08a38a32a340c5d91e13ee86a11=
8f2"
> +
> +SRC_URI =3D " \
> +    http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/w=
ebrtc-audio-processing-${PV}.tar.xz \
> +    file://e9c78dc4712fa6362b0c839ad57b6b46dce1ba83.patch \
> +"
> +SRC_URI[sha256sum] =3D "ae9302824b2038d394f10213cab05312c564a038434269f1=
1dbf68f511f9f9fe"
> +S =3D "${WORKDIR}/webrtc-audio-processing-${PV}"
> +
> +LDFLAGS:append:libc-musl =3D " -lexecinfo"
> +
> +inherit meson pkgconfig
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117598): https://lists.openembedded.org/g/openembedde=
d-devel/message/117598
> Mute This Topic: https://lists.openembedded.org/mt/113256471/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

