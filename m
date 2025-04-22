Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A837FC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 07:00:12 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.34230.1745305210120779554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 00:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDC+aCFM;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bf1d48843so41471771fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 00:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745305208; x=1745910008; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlBJAIdw5Nlz5vYfEMQ3EmFXDOHy8GDQaZRiXiGW4Yw=;
        b=mDC+aCFMNGkwF9p/roAqfHy2WES/Z2bKhbmc4UlnfYHzWM+XC/B7/wgKyipJpUKdia
         qwXSAUSgX2Ck0wEzxRGsC3lgtdT2hOX5cxd1N6pdfIw0igjwE8jpEKqhT3T6XQsOIyO0
         WkO0lECR0WmfFHW/QuKDE8C3sJaOKuqSfE7JLHkR6mAJ/hevcTQ4fOMweRcai4ZM4mgn
         272JCLv7AoUVuiv5QmYzSEg0mP4HWURwaV1lWhjZU8fhpobJXwmh4AUoLmt3F+Vlqg96
         G6xSncDxZJdlcv4A4PEOfreoA5YssJdTcqkgpfg12E0gYDNlpgiHfxbMVDodRxpr4Rwu
         Tgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305208; x=1745910008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlBJAIdw5Nlz5vYfEMQ3EmFXDOHy8GDQaZRiXiGW4Yw=;
        b=jcz8H544hGiz2XV48AYbQHNlR5yLk45ALO7TfFxGPmg3LqhmyOFtaWQHXhrxC2t+TG
         NYwvr4Ti3pafz784vsXTwZXRgAqh+1iKr+qFbAe4MrtfoxpRUX0WMxoI2JOfCkR4gbAS
         qjgBhUlrN2MCUPYUObyZ806/9tyQPhCrZlfxgvkF1PIwVjdeaSJ4WTZb44xCY9RrF42y
         kWdfVHoyY3ygT0PysyFTshAqIa6Tifi2xLZCqZyAS1+jLim9N7LH9WiCWfWw1I+Ae/wj
         6eYPzj9Pt1Twjv9BzFQLhU9p0T073UWxW08XRSQfjS1FOKhxs1Pw8xABWda286P3W3AM
         z4tw==
X-Gm-Message-State: AOJu0YyhO+vT0J7r2KXFtMJ+sjSTw2D+aswuUeqpz6/cVj8JMJHViteZ
	sAooFtRpcqezQf9bgKkuFRsrjDagtmNje9eQVNULe1f89Zffz0OiINVF6rW3y+ct1jB/SwUNoTh
	puzKPu/K34exgL4M46WC5OqpycHw=
X-Gm-Gg: ASbGnctlZJUlJ+7x54GYrOQgpbWQcFPYAHCVZ4M/sEEiFPlHjxtzHE/3VzLpyVmrFnZ
	cLijc/IardNken+wF1iiAVgD5eAiOxeiXW/YIBG7p0R0/jM9C43Ocwx8crST1oyOrWiw9f9dUcY
	9GMiOfZnlQUGKpcAReiBHsDj07
X-Google-Smtp-Source: AGHT+IG9NCR3+2ITzjsgNsCzM18csF5+aORbr7yUx7JRaz3A6bePScIdLzjukXUobO3lIiV1umDrrA/imawYfq5vx4U=
X-Received: by 2002:a05:651c:19ac:b0:30b:f775:bae0 with SMTP id
 38308e7fff4ca-31090559978mr44374921fa.36.1745305207903; Tue, 22 Apr 2025
 00:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250417075342.7405-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250417075342.7405-1-nguyenthaithuanalg@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Apr 2025 08:59:56 +0200
X-Gm-Features: ATxdqUFIx6tdTQNYIMEWqoFqGyI96iInhN_ZZUXifuyn1M-EjbH4k_sVpdciCRM
Message-ID: <CA+chaQfmN5SAtqbuZQVQ7gERmMQR=L0t8Vz8hmM70kJ_LcyyJA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Add C89-C++20 logger for cross-OS.
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 07:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117020

This fails to build with mulitlib, because it doesn't respect libdir value.

e.g. for lib32-libsimplelog with libdir /usr/lib32 it installs into
/usr/lib and fails with:

ERROR: QA Issue: lib32-libsimplelog: Files/directories were installed
but not shipped in any package:
  /usr/lib/libsimplelog.so.1
  /usr/lib/libsimplelog.so.1.0.4
  /usr/lib/libsimplelog.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
lib32-libsimplelog: 3 installed and not shipped files. [installed-vs-shippe=
d]

Please change https://github.com/thuanalg/simplelog-topic/blob/main/CMakeLi=
sts.txt#L81
to allow configuring libdir (e.g. with CMAKE_INSTALL_LIBDIR) instead
of hardcoding "lib".

On Thu, Apr 17, 2025 at 12:06=E2=80=AFPM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> - Edit CMake
> - Re-test Windows, Linux, MAC OSX.
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../libsimplelog/libsimplelog_git.bb          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelo=
g_git.bb
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> new file mode 100644
> index 000000000..461b96035
> --- /dev/null
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -0,0 +1,20 @@
> +
> +SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful of logging librar=
y in ANSI C/C++. Ready for billion records."
> +DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o external dependencies."
> +HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517=
952ac7c"
> +
> +SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
> +
> +PV =3D "1.0.4+git"
> +SRCREV =3D "781f5eaa1713e7f60e9ee79ab5143c0bacfcccef"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> +EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
> +
> +
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116928): https://lists.openembedded.org/g/openembedde=
d-devel/message/116928
> Mute This Topic: https://lists.openembedded.org/mt/112310851/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

