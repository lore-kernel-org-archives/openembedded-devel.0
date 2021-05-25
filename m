Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.3521.1621903999728557538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 17:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AoKhXhkM;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id q6so15195517qvb.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 17:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NOkG+Lc3FOC0kP821X7k8g0/pxl/ll2iSJLF1PxuPQU=;
        b=AoKhXhkMD1Toj2VQrbwjs/oWo8a/cUSGFPes08IXaGotogGo3HwhfGYB50XLuiw69a
         TsnDyaRYRo/cKLKKBc/6dFFMB5y4ZxWTQaQBJlsZufeFP55h6g4yM1SndoX0zBofVj82
         EWDXSyQgylR/DBef6osRL5VhsJaQ9LqSgDZr3U54Qxid6TKuLRdUtDMBT9voZGzfjePX
         q3LP1S1c8wq9bpb3Kfo9VbAwiq/oFKJ+uUSmUIL2Y+VMKZSLVpJ2u/PIes5lYWQA6QIs
         OprXIjBiIJoGw8juMoEGLw5ohAGP9C4J2slx4+GicAuaMwzqyQAgST0RZRQacNk7XLsM
         +FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NOkG+Lc3FOC0kP821X7k8g0/pxl/ll2iSJLF1PxuPQU=;
        b=NRc0OGgheOxvH21KI+mXyADcKeJHgN7y9qV6z2CS5LJW/pz+/FZSRTMjIVsqdpG9Pn
         r7q7ufvrtuLADX749XsYiGSEZPWZsBcLkWyTEp2UnLP3HoyNIhZe7ZhHgiY84aRjnzBN
         GOI4zjpVn9xs9VIEPM+FMve1NXvUO7ZMsE9m3Z+XuEtnN7xuvL3ZpJJyD2oA+06kn7Qw
         SLDFEcUA/mJGyurzdXEOrJ1NnTvVHSxY1uFxxyjPR5TEsZnSqPfMb6zFF+YZy3r4LsZ3
         ckFB0JBrixbBkCkvv+eJSe1uiledCzzibJAlxJs06cNNzfPkN1BSTeefY88k/36XOpxc
         Sv1g==
X-Gm-Message-State: AOAM531/hn7+NMPtiENk4Pd2iPq856ZkWwA4lqim8E2F2DDn6/GJf7ID
	b7gdAio6PQtZM0KY7cbpHNHciuelo/MzkAH581g=
X-Google-Smtp-Source: ABdhPJxTpKtrBWmKTeOBpm9hmqUxD+7Z5ODiS8Qyj4r6tniztuCtwI8ObX0HOR9BngRBE4Ghm3mAedBqpTAwyi4/bWg=
X-Received: by 2002:a0c:80c1:: with SMTP id 59mr33759886qvb.31.1621903998494;
 Mon, 24 May 2021 17:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210519060041.9004-1-nicolas.dechesne@linaro.org>
 <CAMKF1spip2JaKp4EM7mvgYJ-a7joLSmQe6hff8bB_HEtMrx2kw@mail.gmail.com> <CAP71WjwDBLc6MDpb8W4WS6Tcg9VmXrR0GbxV3pXaQGfEOkWXiQ@mail.gmail.com>
In-Reply-To: <CAP71WjwDBLc6MDpb8W4WS6Tcg9VmXrR0GbxV3pXaQGfEOkWXiQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 24 May 2021 17:52:52 -0700
Message-ID: <CAMKF1so2uPyXTx6OQQKoppcReo0++2=rN69iJH7iExu3QqyPeg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sysbench: upgrade to 1.0.20
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 24, 2021 at 9:29 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
>
>
> On Wed, May 19, 2021 at 6:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> seeing this failure
>>
>> https://errors.yoctoproject.org/Errors/Details/584952/
>
>
> hmm. Sorry about the delay.. Looks like I am not able to reproduce the error, it builds for me with oe-core only and with:
>
> Build Configuration:
> BB_VERSION           = "1.51.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "debian-10"
> TARGET_SYS           = "arm-oe-linux-gnueabi"
> MACHINE              = "qemuarm"
> DISTRO               = "nodistro"
> DISTRO_VERSION       = "nodistro.0"
> TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
>
> Do you have any idea why it would work for me, and not for you?

you need really old compiler which does not implement
-fmacro-prefix-map cmdline option e.g. gcc 7 on ubuntu 18.04 build
host.
perhaps this package should ensure these options are not used in BUILD_CFLAGS

>
>>
>>
>>
>> On Tue, May 18, 2021 at 11:01 PM Nicolas Dechesne
>> <nicolas.dechesne@linaro.org> wrote:
>> >
>> > * Upstream moved to Github, let's use it for SRC_URI
>> > * COPYING file was changed, but with no impact on license
>> > * sysbench includes a copy of luajit project and it's compiled by
>> >   default. However the internal copy of luajit won't cross compile
>> >   properly, without patching it (it uses 'gcc'). So instead use the
>> >   'system' luajit, e.g. the one package from OE (which is what most
>> >   distro do anyways)
>> > * Does not compile with different built folder. Lua generated files
>> >   have things like that:
>> > unsigned char __/__/__/__/sysbench-1_0_20/src/lua/internal/sysbench_lua[] =
>> >
>> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> > ---
>> >  ...{sysbench_0.4.12.bb => sysbench_1.0.20.bb} | 21 ++++++++++++-------
>> >  1 file changed, 14 insertions(+), 7 deletions(-)
>> >  rename meta-oe/recipes-benchmark/sysbench/{sysbench_0.4.12.bb => sysbench_1.0.20.bb} (56%)
>> >
>> > diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
>> > similarity index 56%
>> > rename from meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
>> > rename to meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
>> > index 708c71f4f..555477ab0 100644
>> > --- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
>> > +++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
>> > @@ -2,16 +2,17 @@ SUMMARY = "System performance benchmark"
>> >  HOMEPAGE = "http://github.com/akopytov/sysbench"
>> >  SECTION = "console/tests"
>> >  LICENSE = "GPLv2"
>> > -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> >
>> > -inherit autotools
>> > +DEPENDS = "luajit"
>> >
>> > -# The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
>> > -# Launchpad until the next release is available from Github.
>> > -SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
>> > +inherit autotools pkgconfig
>> >
>> > -SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
>> > -SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
>> > +SRC_URI = "git://github.com/akopytov/${BPN}.git"
>> > +
>> > +SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
>> > +
>> > +S = "${WORKDIR}/git"
>> >
>> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
>> >  PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
>> > @@ -21,6 +22,12 @@ PACKAGECONFIG[mysql] = "--with-mysql \
>> >                          --with-mysql-libs=${STAGING_LIBDIR}, \
>> >                          --without-mysql,mysql5"
>> >
>> > +# the internal luajit won't cross compile
>> > +EXTRA_OECONF += "--with-system-luajit"
>> > +
>> > +# lua.h generated files are bogus when using B != S
>> > +B = "${S}"
>> > +
>> >  do_configure_prepend() {
>> >      touch ${S}/NEWS ${S}/AUTHORS
>> >  }
>> > --
>> > 2.29.2
>> >
>> >
>> > 
>> >
