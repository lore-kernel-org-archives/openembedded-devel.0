Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.7458.1605367726662587271
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 07:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EeobAvIa;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id i12so9512232qtj.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2kTuC8SjJVvhYY2dkWrMUsELKKk3VDkUTiSoSQHh3ok=;
        b=EeobAvIaeGdydubHv8+Q9ybSjsuud5KGSZexPr/e/+AiAbGf9Q45H4HFupRG/cMfR+
         ib5khIayumhxgWDAuiJ1B0V8YxXIOEThTVvuWDP5C1yNKYnC1qxtGlktNSSBqZj09whg
         gGtc8cFTzR8eeJh1sG7pxzCMNxlnBNDxh9yZg6GI5XNMWmhIs3VCHjERbqBz+bQHDmSQ
         uItp+N4eoqrZ8/fWv+d+vegKPlcMtRSDi85tAWHYKJnsE17s8f/SBR1oh6mTh1AmQWzj
         zMvxR3Vk6g0HFjtN4z1hoNcYgQuq1vPD34x/X62+NW2LTkDCm8sSy8GcHOiYQ3VxqBED
         rKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kTuC8SjJVvhYY2dkWrMUsELKKk3VDkUTiSoSQHh3ok=;
        b=PR4SqCCeJ/5E0eBYff/9aVTicNmbQWSFRQAHq1GYXL/EZAVNmns4A4ES5C58+v3R9J
         aYNedqLlxs4gg5e95tRFwBZX92zfxF9QbEots+byZ7HWprZRujujwaz/YxET6zlERYzH
         4jxEcQTF0KgE6QMClbmu1kL6oBkTO2NmTR83UaQ0QOAjwLIJh+hg2gJ2yf7m6tfTPV+n
         IFUuSiXwiI6W1DhBtpff03S7hjbXaxBHXvjI/0ONOde4vOOJ712iMvWdEdw83rgAFDTn
         TdybbQ20Dela0101NUz+zrES1RkZugqvksPjZBXsa6IYEWphQLMAyT3+RbYPZCIId8QZ
         Xo+Q==
X-Gm-Message-State: AOAM533Y0SvO9hC4VmV+9w/IzNhU/+BYdBdpZRP/CqcuXWsTrH9+ZcJ9
	XvWXYjIW/rLc9uy9ehaBgRPY9YHKZlcvrtCCiig=
X-Google-Smtp-Source: ABdhPJxaM0RpBB97wGsQGBS3VZGFuyp/pdrNnn72hCrqlb3CsSDp3HWg2hiLL9eUkuO4VkjCxPyomvEKCf8OoQyyt8k=
X-Received: by 2002:ac8:3805:: with SMTP id q5mr7038079qtb.53.1605367725467;
 Sat, 14 Nov 2020 07:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20201114150443.2647350-1-quaresma.jose@gmail.com>
In-Reply-To: <20201114150443.2647350-1-quaresma.jose@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 14 Nov 2020 07:28:18 -0800
Message-ID: <CAMKF1srwKRGRsqWyWx08fWdGicfa077HsGbOUNd2bjhe2Yd2kQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] srt: add receipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks Jose this also should be added to
meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb

On Sat, Nov 14, 2020 at 7:04 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Secure Reliable Transport (SRT) Protocol
>
> Secure Reliable Transport (SRT) is an open source transport technology that
> optimizes streaming performance across unpredictable networks, such as the Internet.
>
> SRT is applied to contribution and distribution endpoints as part of a video
> stream workflow to deliver the best quality and lowest latency video at all times.
>
> As audio/video packets are streamed from a source to a destination device,
> SRT detects and adapts to the real-time network conditions between the two endpoints.
> SRT helps compensate for jitter and bandwidth fluctuations due to congestion
> over noisy networks, such as the Internet. Its error recovery mechanism minimizes
> the packet loss typical of Internet connections. And SRT supports AES encryption for
> end-to-end security, keeping your streams safe from prying eyes.
>
>     * 0001-don-t-install-srt-ffplay.patch
>       Upstream-Status: Pending
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../srt/0001-don-t-install-srt-ffplay.patch   | 28 +++++++++++++++++++
>  .../recipes-support/srt/srt_1.4.2.bb          | 27 ++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
>  create mode 100644 meta-multimedia/recipes-support/srt/srt_1.4.2.bb
>
> diff --git a/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
> new file mode 100644
> index 0000000000..5b76b16328
> --- /dev/null
> +++ b/meta-multimedia/recipes-support/srt/srt/0001-don-t-install-srt-ffplay.patch
> @@ -0,0 +1,28 @@
> +From a45b43a2acd4c29bc8a204f51a3fa5e7b9815613 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sat, 14 Nov 2020 12:29:56 +0000
> +Subject: [PATCH] don't install srt-ffplay
> +
> +srt-ffplay is a simple bash scripts that pipes the output of srt-live-transmit to ffplay.
> +It need ffmpeg as dependencie and requeire that libsrt is builded with -DENABLE_APPS=ON.
> +So remove it because there are no option to disable the instalation.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index ed6e603..ef53dc5 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1224,7 +1224,6 @@ if (ENABLE_UNITTESTS AND ENABLE_CXX11)
> + endif()
> +
> +
> +-install(PROGRAMS scripts/srt-ffplay DESTINATION ${CMAKE_INSTALL_BINDIR})
> +
> +
> + if (DEFINED SRT_EXTRA_APPS_INC)
> diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> new file mode 100644
> index 0000000000..567ea68edf
> --- /dev/null
> +++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Secure Reliable Transport (SRT) Protocol"
> +DESCRIPTION = "Secure Reliable Transport (SRT) is an open source transport technology \
> +that optimizes streaming performance across unpredictable networks, such as the Internet."
> +SECTION = "libs"
> +HOMEPAGE = "https://github.com/Haivision/srt"
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
> +
> +SRCREV = "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
> +SRC_URI = "git://github.com/Haivision/srt;protocol=https \
> +           file://0001-don-t-install-srt-ffplay.patch \
> +           "
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DENABLE_UNITTESTS=OFF"
> +
> +PACKAGECONFIG ??= "crypt"
> +PACKAGECONFIG[debug] = "-DENABLE_DEBUG=1,,"
> +PACKAGECONFIG[crypt] = "-DENABLE_ENCRYPTION=ON,-DENABLE_ENCRYPTION=OFF,openssl"
> +PACKAGECONFIG[utils] = "-DENABLE_APPS=ON,-DENABLE_APPS=OFF,"
> +
> +PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'utils', '${PN}-utils', '', d)}"
> +FILES_${PN}-utils += "${bindir}"
> +RDEPENDS_${PN}-utils += "${PN}"
> --
> 2.29.2
>
>
> 
>
