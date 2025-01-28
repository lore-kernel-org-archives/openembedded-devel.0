Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FB8C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 19:02:29 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.5299.1738090943694539207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 11:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JhGEks+0;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f89aa7a101so2320358eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 11:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738090943; x=1738695743; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8Bxd9pawWdDjagBi9ndrIus+Nuy3NtERBG6vrWv+hg=;
        b=JhGEks+0/TZ1OWkl0YjA95QrNZxzgkIkkK5czUpml1lYmZ1aJtUEjUpu92rFy3eZki
         MmeiIH+1p5yr4muqtbyGhxam5ter57s8IkmW722sa53ID5SpCiid2/swsZ/TQNiadEYX
         396W74mKErMdPsAGpI80lPgfozUXOvYN85Xt+WFLoFzfvd1YTCPUGsXWQrrHuVZn/a2e
         MUjK6VX3O97OTa0UcaNayPJM5kO3fn1Q5U5ubP5mXVbP00W/3SeiYtiXpQjugmBOsIhI
         FCbVHARi3ndQkNzuyDyapjSwpNSVCO6vBupdyD4RMRcoEjTVnB2eKR3aB42BqYW/XZBh
         sc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738090943; x=1738695743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8Bxd9pawWdDjagBi9ndrIus+Nuy3NtERBG6vrWv+hg=;
        b=Jk71Zz7WHyaCERnSeIo32X9S37+g/MspMYGWUGGE91Q4VLHsk8EF3dF3NK7vxxjqIT
         gGwdRCnFhfU5xkry1w9I5iY8InXtAY27gL9J86N0DlHayepf7Fur3kIFCKF7EDFOjGyT
         A0lpTf3QdTxtEd6FYtm0p1HyA+t9dMH0otBto9Tz93uwBUs6U91/p+ofRDe0D01v1L+i
         upWv56aJvde5lgHC7zUopTmehB4RZDY0b/zK0NTiGCcTZUOgzC0hi8gLv49YlrIe9ffU
         di0/7OUsOkQyprnqlj+92QMQAJJEC/tM8JuIS8gfaVXpXlhKPxo30c1cjIe8oYV9EcK8
         0+XA==
X-Gm-Message-State: AOJu0YyhZe7/Sv1iiGOT1M9plZKh99x6W9i5YUKwL+/ouqPU19GluD2s
	TBv9ksXyeMb+Hfz/njxVE0VDB2iumd6v/C/5Kz/WFpgAAZ1ySbYc1a/2yKPhrhzUjL3a0JK7fXW
	kFLuVhCKyOV/dHz1jkORbauBnHdM=
X-Gm-Gg: ASbGnctRg2C0mti8PM2EhR5v/PF3+nPaOYULfgTUYDkPc2GZPMwwDYa/yzhxLEoQbOL
	dy0PMRKUdogSNcAlBzhFPSDnV1bcmEUEtymzSbe0IqH2WRpB+boa41YARKbsUlwY2S3SHGqn90c
	jGjtyXTsIiA8PfloIZO2T0sOQBSg==
X-Google-Smtp-Source: AGHT+IE5Lq31zLMHWknGym5Zat03Jp07GDGln5q3P/qaISUCwy6PRdQETxVinwzyzzxBwhw6WnM3mxEt3thEFqgIeKw=
X-Received: by 2002:a05:6870:17a2:b0:29d:c86b:cdec with SMTP id
 586e51a60fabf-2b32f37097emr183477fac.29.1738090942815; Tue, 28 Jan 2025
 11:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20250127145533.1510728-1-a-christidis@ti.com>
In-Reply-To: <20250127145533.1510728-1-a-christidis@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2025 11:01:57 -0800
X-Gm-Features: AWEUYZl5G2HMTp6Kbz2zaHf0hj9_kEhPUwNhr3hQxzTISaooonxmWA85nHVabww
Message-ID: <CAMKF1spxHVe8Y1jCzFUY_1BG9WkwAmQz4ngjyNxSsa3=YLfE8Q@mail.gmail.com>
Subject: Re: [master][PATCH] opencl-cts: add recipe
To: a-christidis@ti.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 19:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115121

it is not yet supported in RISCV so please add COMPATIBLE_HOST accordingly

see - https://errors.yoctoproject.org/Errors/Details/841674/

On Mon, Jan 27, 2025 at 6:55=E2=80=AFAM <a-christidis@ti.com> wrote:
>
> From: Antonios Christidis <a-christidis@ti.com>
>
> This recipe provides the opecl-cts suite.  This is a pre-release version
> v2024-08-08, which I have tested to work with opencl-headers version v202=
4.05.08
> . The pre-release version was picked due to incompatibility issues with o=
ther
> versions of headers.
>
> The recipe also includes a patch, to allow it to compile and build proper=
ly.
> Further information below.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../files/0001-Ignore-Compiler-Warnings.patch | 37 +++++++++++++++++++
>  .../opencl/opencl-cts_2024.08.08.bb           | 26 +++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta-oe/recipes-core/opencl/files/0001-Ignore-Compile=
r-Warnings.patch
>  create mode 100644 meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
>
> diff --git a/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warni=
ngs.patch b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings=
.patch
> new file mode 100644
> index 000000000..2515c7f16
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl/files/0001-Ignore-Compiler-Warnings.pat=
ch
> @@ -0,0 +1,37 @@
> +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Fri, 17 Jan 2025 15:05:39 -0600
> +Subject: [PATCH] Ignore Compiler Warnings
> +
> +
> +Within the cmake build system, the compiler -Werror flag is enabeled.  T=
his
> +turns all warnings into errors and doens't allow the system to compile
> +correctly.  Change the system to ignore the 3 warning rules that show up=
 when
> +compiling.
> +
> +Upstream-Status: Inappropriate [oe specific - compilation errors due to =
cross-compiling]
> +
> +Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> +
> +---
> + CMakeLists.txt | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5cfef6b3..71b6ddb4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_=
ID}" MATCHES "(Apple)?Clang"
> +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warning direct=
ive
> +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths) # Issue =
#784
> +-
> ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> +     # -msse -mfpmath=3Dsse to force gcc to use sse for float math,
> +     # avoiding excess precision problems that cause tests like int2floa=
t
> +     # to falsely fail. -ffloat-store also works, but WG suggested
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb b/meta-=
oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> new file mode 100644
> index 000000000..f6f4e9466
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl/opencl-cts_2024.08.08.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "OpenCL CTS"
> +DESCRIPTION =3D "OpenCL CTS test suite"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
> +
> +inherit pkgconfig cmake
> +
> +DEPENDS +=3D "opencl-headers opencl-icd-loader"
> +RDEPENDS:${PN} +=3D "python3-core python3-io"
> +
> +S =3D "${WORKDIR}/git"
> +
> +SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=3Dhtt=
ps;branch=3Dmain;lfs=3D0 \
> +          file://0001-Ignore-Compiler-Warnings.patch"
> +
> +SRCREV =3D "a406b340913f622da089b00f284a597656c10239"
> +
> +EXTRA_OECMAKE:append =3D " -DCL_INCLUDE_DIR=3D${STAGING_INCDIR} -DCL_LIB=
_DIR=3D${STAGING_LIBDIR} -DOPENCL_LIBRARIES=3DOpenCL"
> +
> +do_install() {
> +        install -d ${D}${bindir}/opencl_test_conformance
> +        cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conforma=
nce
> +        sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/open=
cl_test_conformance/run_conformance.py
> +        find "${D}${bindir}/opencl_test_conformance" -name cmake_install=
.cmake -type f -delete
> +        find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -t=
ype d -exec rm -rf "{}" \; -depth
> +}
> --
> 2.34.1
>

