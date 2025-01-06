Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5D5E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 12:44:12 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.58223.1736167446633880008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 04:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYbdCoEf;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3022c6155edso85630561fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736167445; x=1736772245; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boCBhK++PPe6Mp/lRnRJ/T0lepwfveV0eUsy+mpQ9ws=;
        b=OYbdCoEfqBhRKda4GNzKdvw6Q8B5SWjkzRleUnUUT+956rSUk2P4WH+nm8CSRuad0m
         QqY+0mQNr2ecW5YuAJlM4im2OCQW46RdZDiH5xNoKya2Xv3u3655OgYu73vp4g9JHuTw
         jQAr6MQS7JQgKgfVPrJ/imCVCRNtmykb9fZmxfED1ylFmU3OR396smASSno0CH94H53j
         S1MRc/oGNv5u6zImvi3LxMhN4qA+pJMBAE+d2f3I82ic3cP8rt174sQIynXJxW6d8d1N
         eed5XMssAP3LMsTT61jN8ZXBUEro69mbouClAZsQEfvwegoiaqVBAOONLPwGHxNnAg0F
         PQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736167445; x=1736772245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boCBhK++PPe6Mp/lRnRJ/T0lepwfveV0eUsy+mpQ9ws=;
        b=T53dGUy8bPY1D4F3Asvc0e8lW6hsYYOeRh6xzXu8aZpoXcAaoFimBuh0G6qDVM61mw
         w/R0umj+CY1FOkqqwd4ZHkNuHPLHp4BXUraV50PC3A+lSkoIy0yceJOKmsaSQsz5994e
         YJOvtG/+Bfn8Zs1UubuufzBSJ2E6jBGfqyDnsA8wXcrsudAsj8PHF8ARB1JP1ZKmF/WK
         suqD6VBp0M6YsHQqe3a9YTHGLJpfy0TKLeIP7RJJIpw35vsMmuyapg165p0EP0DXkimz
         2HM8mcxMcR/p8fyCBAH/o2Kh78bwVDJK5q26OJSec6DdgEKo4jIk+86tfk5qRZRf79KR
         hk+g==
X-Gm-Message-State: AOJu0YzgWbuvzJoNPNeoGqQoOVxFiyMBaHQZXv/Wn5lG0+PS21hNiB8w
	gyeCFF+WGeTeXT6EJ5krfm8dSCH14EIPRPv/+1dZLWaYDnk3PVcaOwJRZqbLGwUvsrEMA7t9fyv
	3h1ueaAqHtqBizqfLjenwBYu2eiI=
X-Gm-Gg: ASbGncujhZ7sA6I/2q8Q3ykFuoazn1Eioe6Kf3CPblF+wl9rYM7rbDrizN9rI/mOcqB
	1h/HczyD2vb3FXU9ZEQZnkHZvCUBVOr3EZyCzS28i
X-Google-Smtp-Source: AGHT+IHxDSffOAZF6GG53Wi0x9GFuyNa8KdELzTKR5ToHGrLM5aht8YyGH9ZNb4OQQgJbXfK4W0vzjnI9vwQUGQVrYg=
X-Received: by 2002:a2e:bb8d:0:b0:300:f5bc:95b3 with SMTP id
 38308e7fff4ca-304686057a5mr106186531fa.41.1736167444201; Mon, 06 Jan 2025
 04:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20250103084525.1990937-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20250103084525.1990937-1-peng.zhang1.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 6 Jan 2025 13:43:52 +0100
Message-ID: <CA+chaQe7QsX5-ZMfRYFDpY8CRJ3Cp2fU=TArP9Ucm_OK55K7DQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] lapack: fix TMPDIR reference in do_package_qa
To: peng.zhang1.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 12:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114661

Thank you for looking into this.

I've tried your change and with ptest in DISTRO_FEATURES I'm still
seeing quite a few errors:

NOTE: recipe lapack-3.12.0-r0: task do_package_qa: Started
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfs in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfd in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3c in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2d in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintsts in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfz in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstd in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3d in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstrfc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3s in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1z in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat3z in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2c in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstz in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtstd in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtsts in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtstc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2z in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1s in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xeigtstz in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstds in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1d in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat1c in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xlintstzc in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: QA Issue: File
/usr/lib/lapack/ptest/bin/xblat2s in package lapack-ptest contains
reference to TMPDIR [buildpaths]
ERROR: lapack-3.12.0-r0 do_package_qa: Fatal QA errors were found, failing =
task.
ERROR: Logfile of failure stored in:
/OE/build/oe-core/tmp/work/core2-64-oe-linux/lapack/3.12.0/temp/log.do_pack=
age_qa.3908379

Can you please check with ptest enabled?

On Fri, Jan 3, 2025 at 9:45=E2=80=AFAM Zhang, Peng (Paul) (CN) via
lists.openembedded.org
<peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> When building the `lapack` package, the following QA error occurs:
> "File /usr/lib64/libblas.so.3.12.0 in package lapack contains reference t=
o TMPDIR [buildpaths]"
>
> The issue arises because the `xerbla.o` object file embeds the absolute h=
ost path of `xerbla.f`.
> This occurs during compilation, where the build command in `build.make` (=
generated by CMake) specifies:
> `gfortran -c <absolute path>/xerbla.f -o`.
>
> As a result, the absolute path is included in `xerbla.o`. Unfortunately, =
`gfortran` does not support
> flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such pat=
hs.
>
> To resolve this, the fix involves replacing the absolute path of `xerbla.=
f` in the generated
> `build.make` file with a relative path before the compilation step. This =
ensures that the
> resulting `xerbla.o` does not contain any references to TMPDIR, passing t=
he `do_package_qa` check.
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  .../recipes-devtools/lapack/lapack_3.12.0.bb  | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/r=
ecipes-devtools/lapack/lapack_3.12.0.bb
> index fef9d3a80e..ef5726eeaa 100644
> --- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
> +++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
> @@ -33,6 +33,29 @@ OECMAKE_GENERATOR =3D "Unix Makefiles"
>  inherit cmake pkgconfig ptest
>  EXCLUDE_FROM_WORLD =3D "1"
>
> +# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the=
 options
> +# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gf=
ortran does not support them.
> +# To address this issue, we manually replace the absolute path with a re=
lative path
> +# in the generated `build.make` file.
> +#
> +# An issue has been reported: https://github.com/Reference-LAPACK/lapack=
/issues/1087,
> +# requesting a fix in the source code.
> +#
> +# This workaround resolves the TMPDIR [buildpaths] issue by converting t=
he absolute path
> +# of `xerbla.f` to a relative path. The steps are as follows:
> +#
> +# 1. Locate all `build.make` files after the `do_configure` step is comp=
leted.
> +# 2. Compute the relative path for `xerbla.f` based on the current build=
 directory.
> +# 3. Replace the absolute path with the calculated relative path in the =
`build.make` files
> +
> +do_configure:append(){
> +    for file in `find ${B} -name build.make`; do
> +        sed -i -e "s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbla\.=
f' $file | awk -F'cd ' '{print $2}'| \
> +                awk '{src=3D$1; sub(/.*-c /, ""); sub(/xerbla\.f.*/, "")=
; obj=3D$0; print src, obj}' | \
> +                while read src obj; do echo "$(realpath --relative-to=3D=
"$src" "$obj")"; done)\2#g" $file
> +        done
> +}
> +
>  do_install_ptest () {
>      rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
>            --exclude CMakeFiles \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114623): https://lists.openembedded.org/g/openembedde=
d-devel/message/114623
> Mute This Topic: https://lists.openembedded.org/mt/110403421/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

