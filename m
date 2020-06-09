Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.857.1591715984024520226
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 08:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=KFpMFprt;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id q19so2848232lji.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMoVbLC/zmg+Yqgwkcpie3wG3QPR6ikfOaavnEGuoh4=;
        b=KFpMFprtXsYK3r3EDDQqmzboQsnG5kOi3pK7cE7s3YoxUE5Vd2JsY0wrHiom/4wdQI
         NKbdCvrLdnvWJaI62A6kRIcEpIToESbS3LCJ0Dccj/UcoYrWHjtbCsFYXgnKRp+ftjhM
         /htGlzNRiplYxLsV96Yd4OR5tcVLSfS80ed0GWV4sEvWpnMH3X5By2cNFnnmnN1BvjrD
         cuoQhLh88pfsBKZOFFQ6U/VJs5nhqHkVApZhdS1sMHBIrwHvBF6Y4ikKDAZael/Mw3Xs
         QHbsMmqklaMbh+2SzF+3ZJO62bAQ417xlBdOHmy80QC3Q0jU6tA5ro3fHUWjHBVnH3jE
         qqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMoVbLC/zmg+Yqgwkcpie3wG3QPR6ikfOaavnEGuoh4=;
        b=rPvSbIAdBq/357WDXl/KW3oR980HoRtk/lg1smxzPckbL4nU61XeGYhMgxoSSnuCYW
         6qbWjWjyBM1oIa8S3+kGSLWAv5Nf+ldaNpObYHjPRKwrQOjQxXV7rWhMnLl2sQjBQol2
         bcsH0VqDGNv0pzJoCmhEDA8l2LtamK1pe9Ry0ENPfYf+d4j9ojmSG+GOpZ5sY9E9ODWz
         lytkQeXTOPosq4MECsbRoqc/4FgJK9lO8bG0PaDKnmTJ7/bUovoOdZPv8JDRZbyqFDJx
         0Nc4gem0TwkYFjzBHRK3RgnXB1FJDq1R9zcLW/IEHHIA8qag1DOUDiwrMFaAAjaeJNlM
         mv0A==
X-Gm-Message-State: AOAM531RIy4cLWOahG+9OmzJv689tst+HNefzgyXtvLNPyBpgkNKi6lh
	T1ieAM4zW8ec2zQJ6lEqclaXSxLa48iJmp4t90k/DA==
X-Google-Smtp-Source: ABdhPJwcF8pn9ZaQonwkrprORMVF1bqEseLqsjqxsx8M6LyyOpI4enTQh47pnEfWRngXh01SMQTeyM6cEegjkpcpKUQ=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr1955048ljj.340.1591715982225;
 Tue, 09 Jun 2020 08:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200609142957.187352-1-arthur.she@linaro.org>
In-Reply-To: <20200609142957.187352-1-arthur.she@linaro.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 9 Jun 2020 16:19:31 +0100
Message-ID: <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
To: Arthur She <arthur.she@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Also I guess you should mention that this is basically copied from
meta-intel, and talk about how to handle duplicate recipes.

Ross

On Tue, 9 Jun 2020 at 15:30, Arthur She <arthur.she@linaro.org> wrote:
>
> igt-gpu-tools is a collection of tools for development and testing of the DRM
> drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
>
> Signed-off-by: Arthur She <arthur.she@linaro.org>
> ---
>  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
>
> diff --git a/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> new file mode 100644
> index 000000000..761df1cbb
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "IGT GPU Tools"
> +DESCRIPTION = "IGT GPU Tools is a collection of tools for development and testing of the DRM drivers"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
> +
> +LICENSE_append = " & ISC"
> +
> +inherit meson gtk-doc
> +
> +SRCREV = "${AUTOREV}"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
> +RDEPENDS_${PN} += "bash python3-mako python3-six git net-snmp"
> +
> +PACKAGE_BEFORE_PN = "${PN}-benchmarks"
> +
> +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
> +
> +gputools_sysroot_preprocess() {
> +       rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
> +}
> +SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
> +
> +do_install_append() {
> +    install -d ${D}/usr/share/${BPN}/scripts
> +    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
> +    install -d ${D}/usr/share/${BPN}/runner
> +    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
> +    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
> +}
> +
> +FILES_${PN} += "\
> +        ${libexecdir}/${BPN}/*\
> +        ${libdir}/intel_aubdump.so \
> +        ${datadir}/${BPN}/1080p-right.png \
> +        ${datadir}/${BPN}/1080p-left.png \
> +        ${datadir}/${BPN}/pass.png \
> +        ${datadir}/${BPN}/test-list.txt \
> +        ${libexecdir}/${BPN}/benchmarks \
> +        "
> --
> 2.25.1
>
> 
