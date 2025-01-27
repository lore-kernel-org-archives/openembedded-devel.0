Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1724C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 19:50:52 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.509.1738007450386550320
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jan 2025 11:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHznBmmH;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2a3d8857a2bso2710742fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 11:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738007449; x=1738612249; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veBZwb1G9eTEhThWP0lLPcKIgjQ6n5dI5GzU3dMJHbA=;
        b=OHznBmmHTQ7Kr6d799YQMpJymXAQhRHZugV5b+MZusou7yofMit55RdTEYzcsW2nxA
         /r2zb2+bN3TIn013TrIM2z9lsX7F0tmh5kTNk7cQOckJRB6eHeEz3fqUv5LtHQgQ6mIz
         QNPphTBXtO/C/DFQml879HtaXiopRVU8OZnVswFkudP9ko0vsnhwYGSXzrQ3uYX7sauW
         iVCH9OGLb3tkbbKK+wrGeiEV+qmtJgtR5veHe+e4gS6xetqam/SMTPm8hlSmEkkUjJiz
         zuEMJHeuA/RAOyB4WfVepYmCctW350qNCD9XAP4J4nMzY99hz3BvPMu4vPOIjpHlKcVn
         ydSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738007449; x=1738612249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veBZwb1G9eTEhThWP0lLPcKIgjQ6n5dI5GzU3dMJHbA=;
        b=Gz+AhXwxrzleoyDb5EqBDiTvao9zPKjUZIfeDblMePYWKQJ3dshYb4qFaDUKx7zb4w
         L8SC83lfU28oxyIBWGYA3BEOU+cSnanIq/x5mUOuB/i0FFLTvC4TFZhziZRrzLSbu3rx
         5yBHzVSmbN2U8PcgEsHNSdcQ21I7jYau1Vjer56mDEbuqIai12aQbQU+aUkwsNsNbI+C
         jXOb6cx01w9TOpQ0eEZkaA8Azkg4HYd3jpov/etYOf2A8Q2qHKBTpjXdxuF5uWlClcuP
         ofsUfI2d0NkLOdxl0qHcORacVP9rRcM38Gdp27EJ3HdFz8/pRWuJKUFqN1sOjDoDyrsw
         Nkdg==
X-Gm-Message-State: AOJu0Yzye6vHfBs+LPqhx5z6NaIrTPmsMpnL39kPGqrQdy08+LU53/6G
	6poCWICroIaUtjhQ64zcgmaSvhNkBgfWVyh3r3RNyPQVu16h1QlIc+kFQc6X/VMvHhWP2X3cVkO
	jg0seMZHLjaqznQngv0f35nLZhUM=
X-Gm-Gg: ASbGncuCUUCNGkZR0BqntXlzG+Ohm7WX3rybJ75lABgkuqOsif4DAqylUQs98st0ooz
	Zi0vGZt7ghspR/QN3UytmGJVHgrDvp3cBcDwXmuxL82ff0GZJBIWpqh7rGUSV
X-Google-Smtp-Source: AGHT+IE0Pu9h1AkrRam/QEn0vIRhdjWIfxIIFjK1WyDarGu5o+LxkUO/HePyw3prAg4IX2a/UOX/m14n1oovW79DacE=
X-Received: by 2002:a05:6870:2a42:b0:287:886:2e62 with SMTP id
 586e51a60fabf-2b1c08c63ddmr22158935fac.12.1738007449608; Mon, 27 Jan 2025
 11:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20250127145533.1510728-1-a-christidis@ti.com>
In-Reply-To: <20250127145533.1510728-1-a-christidis@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jan 2025 11:50:23 -0800
X-Gm-Features: AWEUYZkDY4N4V2vLp5cmIuLIajIKTfM7HM0h3EbGCo8FN7Fy65FAYPZwSYg0zxc
Message-ID: <CAMKF1sq-vDu4S5jPPH6yxHX=SGuK3syJ+0oOjeEdyUcCc-iL1A@mail.gmail.com>
Subject: Re: [master][PATCH] opencl-cts: add recipe
To: a-christidis@ti.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jan 2025 19:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115111

fails with master here

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/320/step=
s/14/logs/stdio

cc1plus: error: '-Wformat-security' ignored without '-Wformat'
[-Werror=3Dformat-security]
| cc1plus: all warnings being treated as errors

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

