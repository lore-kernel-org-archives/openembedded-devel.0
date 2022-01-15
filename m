Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634B2C433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 01:26:23 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.2293.1642209982057529578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kvoUCZlp;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id bb9so7111094qtb.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zdtVG2MexwbXLVNBS3s1tSNtSBm8Y3yjrdyQJWohl6o=;
        b=kvoUCZlpxZ6eczkkdMoNnv6zgyu1xdV5+Mou7nCxOq/HGLf9HlOLtraYKdqc4H+jWU
         hEKs5x4/IecfsTTGydrSwv+TfZmS4n/hOMGgW0TWweW0wPIBUcmMzYnJsa4wlZ50QtNv
         DrQCt2E7XV8Icqc2OEBFKn2pMKmKUigfxLTe6qdOwfHe/tF6e1oDJisOhXw9Sns4tlbP
         QY9zsBlC3I94gbokwl5ak2fh0ERUiNwMaJKDqu1DUw/7VtakwaBI11uOelZHDakwSQY/
         9+EoW86fBPyOKzuRgArP5x2Dg+SbYfcU7wU0cB3ZWHuqSd0kJHtZjJ8r7nDRP3N9gYqZ
         wSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zdtVG2MexwbXLVNBS3s1tSNtSBm8Y3yjrdyQJWohl6o=;
        b=tJt4KgZvfFHshzOk0x+TWf/OMDue02/Slkqkrl3YHnb5HuggMTYbMdY92EmbHIeTVK
         J0cA0w/RqFwqj6XWkmHAfAut/nAZiOKXwIqk0b3YctHh+gb79W3uHilEwsFuwOc7QUXD
         D/VxRDxPYu2nUEmKAMOPsiJUnfDlCZQcMZBrNRfQM6Lv6U6VmsuII8c+MCGkeyYxUcVz
         LQ25tiDIf0zoNfKC3+PnOMw2bpO9gN2wlKBQaqfCFpuoUx1pw1GEGq1a4InxvH74MOJM
         QUsn1DLSpyz8IK+y9Cjkq3Pap49A7B6VxQ9V2l1Nqw4Ibi9cTMDdWqa1Z4xluKQ4nbY0
         zbBw==
X-Gm-Message-State: AOAM531xS5r4O8+r2XEFfW7WC71fQ7BMgR/ZZORjW9O0C5HEslFq5VXa
	C54R0WpQocRpCgg6yHjqVJUN+SEwbDOeQpaFlsw=
X-Google-Smtp-Source: 
 ABdhPJwbwPNOpXEsjaa/25HEuPPWnTrerQsy7yrfLzWnsNFD9f5SPoX+eAPJLzCvKrMiHZof/c4L2vdHi0zY/KAoqmM=
X-Received: by 2002:ac8:134c:: with SMTP id f12mr9787109qtj.229.1642209981010;
 Fri, 14 Jan 2022 17:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20220114115246.3985850-1-ross.burton@arm.com>
 <20220114115246.3985850-2-ross.burton@arm.com>
In-Reply-To: <20220114115246.3985850-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jan 2022 17:25:54 -0800
Message-ID: 
 <CAMKF1sqe8REidDKhe+VxwSSB9EPHtqVcdfQCXSvH4KPRqUuhGQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] iotop: move to the C port of iotop
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 01:26:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94848

It fails on clang/arm see
https://errors.yoctoproject.org/Errors/Details/622623/

On Fri, Jan 14, 2022 at 3:52 AM Ross Burton <ross@burtonini.com> wrote:
>
> The Python iotop implentation hasn't had a release since 2013[1], and
> there is a C port which is actively maintained and will have a lower
> impact on the system being monitored.
>
> [1] https://repo.or.cz/iotop.git/tag/10c60fedf5051421f4e62b89e2e51e7cc669ce34
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-extended/iotop/iotop_0.6.bb  | 29 --------------------
>  meta-oe/recipes-extended/iotop/iotop_1.20.bb | 17 ++++++++++++
>  2 files changed, 17 insertions(+), 29 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/iotop/iotop_0.6.bb
>  create mode 100644 meta-oe/recipes-extended/iotop/iotop_1.20.bb
>
> diff --git a/meta-oe/recipes-extended/iotop/iotop_0.6.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
> deleted file mode 100644
> index 97958dd4a2..0000000000
> --- a/meta-oe/recipes-extended/iotop/iotop_0.6.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY = "Simple top-like I/O monitor"
> -DESCRIPTION = "iotop does for I/O usage what top(1) does for CPU usage. \
> -    It watches I/O usage information output by the Linux kernel and displays \
> -    a table of current I/O usage by processes on the system."
> -HOMEPAGE = "http://guichaz.free.fr/iotop/"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
> -
> -PV .= "+git${SRCPV}"
> -
> -SRCREV = "1bfb3bc70febb1ffb95146b6dcd65257228099a3"
> -SRC_URI = "git://repo.or.cz/iotop.git;branch=master"
> -
> -S = "${WORKDIR}/git"
> -
> -UPSTREAM_CHECK_URI = "http://repo.or.cz/iotop.git/tags"
> -UPSTREAM_CHECK_REGEX = "iotop-(?P<pver>\d+(\.\d+)+)"
> -
> -inherit distutils3
> -
> -do_install:append() {
> -    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo || true
> -    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
> -}
> -
> -RDEPENDS:${PN} = "python3-curses \
> -                  python3-codecs python3-ctypes python3-pprint \
> -                  python3-shell python3-core"
> diff --git a/meta-oe/recipes-extended/iotop/iotop_1.20.bb b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
> new file mode 100644
> index 0000000000..17c567095b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/iotop/iotop_1.20.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "A top utility for I/O"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=48e7be78bd2671d08c9c3bad71f1cfaa"
> +
> +DEPENDS = "ncurses"
> +
> +SRC_URI = "https://github.com/Tomas-M/iotop/releases/download/v1.20/iotop-1.20.tar.xz"
> +SRC_URI[sha256sum] = "e0227dd4b71ce3ffe50225b85cf9abb38a99c1d2dff69e3f1db7d059d7490d51"
> +UPSTREAM_CHECK_URI = "https://github.com/Tomas-M/iotop/releases"
> +
> +inherit pkgconfig
> +
> +EXTRA_OEMAKE = "V=1 STRIP=true"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D}
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94828): https://lists.openembedded.org/g/openembedded-devel/message/94828
> Mute This Topic: https://lists.openembedded.org/mt/88418863/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

