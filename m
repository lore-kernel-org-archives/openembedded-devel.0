Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E44C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 15:21:20 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.10573.1657639279270269322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jrDXbLIe;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d18so8442508qtw.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e077b/w3LjkGqxja06BfxMcYGQVlOzCy3rne2Z3lO2E=;
        b=jrDXbLIeaWuKn5ovVCCiJHKD7QWlx3W8M0Rhx9Ml5Vyc+79N9DbVz/i7sYuyKs48UT
         yETOc95NeCOMCLgX7Gyfetok9v4aWbKwWK4tR6f9Fh4AqwMH3QquyHCrauMtc3XTw9Ix
         D0Q1M77lmz4K5b+BOAhc66Kt5B+bsVsAPXVFDkAl/OXjnqW4/gmf5IckbVK5N83BYbjh
         9c5q8A+TawCCXzEtnZkuMdaa5g7hbwWIU9ciZQTUYsyTR/gHIp0FdaoNEeKjd0IzA8U6
         Z3UmQygXKiBR+0haPrcDq8LAcDkMhwOyAwd4cFjvR/Q8D1ulRab6riTWwmYrx4P38LgK
         zo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e077b/w3LjkGqxja06BfxMcYGQVlOzCy3rne2Z3lO2E=;
        b=NlBRHzzCmdXARoK8i46qFgZAZ6dPX2PFKiV3cVfHFCPhTZ1eTe8IhpOglv2aWpQTlB
         s7F6pN0QkUAmGv0pNEtJIwk/cCqLdeJhaGPqBc+cp4EiVtSJdzjXmijtQrtjgtfGBjdM
         RQbygh138a3tdMGR66J71sxc7MnmIHqqKWWvMxfrLtPh0mDMLB6kLu4e4PmeHwILmwBc
         mq0PlZP6/FbxUXDsN5NrMBpwBYUFkfokoIYriFkDnnnT5VCvKh0gbJVDwC763FyH13pt
         2NIiBUH/HrZ113poZz0kDI0lv4NBAHSAPDt8F9XRBClMUDkAvz0Iqa6wpbQpyf27ak7z
         LqDw==
X-Gm-Message-State: AJIora/1TGGcilMKgFlf+r799a9ZeT4/iqOzc7E8CgUnpl/0Qraerolr
	TLXNaiEnU138k+oDlVcR0/qqs5AzPh3RW0ZsWsw=
X-Google-Smtp-Source: 
 AGRyM1vr9qKJJBDVAUA2lu+vZUjuTQ4VP43LhPUGgzmj0noxqK1Alc0LjshUX3nAqrxgrpU0Yr5VuiqF3NXi1n1rMdw=
X-Received: by 2002:a05:622a:13ce:b0:31a:b4ce:1679 with SMTP id
 p14-20020a05622a13ce00b0031ab4ce1679mr18787719qtk.330.1657639278237; Tue, 12
 Jul 2022 08:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220712091052.21871-1-alex.kiernan@gmail.com>
In-Reply-To: <20220712091052.21871-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2022 16:20:51 +0100
Message-ID: 
 <CAMKF1srEerG9WjKu6x7GdrvrfBnovv_iEco5uKVx4GSap4t+Pg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] nftables: Upgrade 1.0.2 -> 1.0.4
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Jul 2022 15:21:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97817

I am seeing new build QA warnings related to python modules see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1835

On Tue, Jul 12, 2022 at 10:13 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Drop backported patch, switch PACKAGECONFIG assignment to ?= (matches
> current practice), add in editline, linenoise CLI options and xtables
> option. Switch to --disable-python when building without python to avoid
> a configure time warning.
>
> We can drop UPSTREAM_CHECK_REGEX as the version no longer gets confused
> by the 0.099 version which exists.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 -------------------
>  .../{nftables_1.0.2.bb => nftables_1.0.4.bb}  | 16 ++++----
>  2 files changed, 8 insertions(+), 47 deletions(-)
>  delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
>  rename meta-networking/recipes-filter/nftables/{nftables_1.0.2.bb => nftables_1.0.4.bb} (77%)
>
> diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch b/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
> deleted file mode 100644
> index 65ab2dfd8c49..000000000000
> --- a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 18a08fb7f0443f8bde83393bd6f69e23a04246b3 Mon Sep 17 00:00:00 2001
> -From: Pablo Neira Ayuso <pablo@netfilter.org>
> -Date: Tue, 22 Feb 2022 00:56:36 +0100
> -Subject: [PATCH] examples: compile with `make check' and add AM_CPPFLAGS
> -
> -Compile examples via `make check' like libnftnl does. Use AM_CPPFLAGS to
> -specify local headers via -I.
> -
> -Unfortunately, `make distcheck' did not catch this compile time error in
> -my system, since it was using the nftables/libnftables.h file of the
> -previous nftables release.
> -
> -Fixes: 5b364657a35f ("build: missing SUBIRS update")
> -Fixes: caf2a6ad2d22 ("examples: add libnftables example program")
> -Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> -
> -Upstream-Status: Backport
> -[http://git.netfilter.org/nftables/commit/?id=18a08fb7f0443f8bde83393bd6f69e23a04246b3]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - examples/Makefile.am | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/examples/Makefile.am b/examples/Makefile.am
> -index c972170d..3b8b0b67 100644
> ---- a/examples/Makefile.am
> -+++ b/examples/Makefile.am
> -@@ -1,4 +1,6 @@
> --noinst_PROGRAMS       = nft-buffer            \
> -+check_PROGRAMS        = nft-buffer            \
> -                 nft-json-file
> -
> -+AM_CPPFLAGS = -I$(top_srcdir)/include
> -+
> - LDADD = $(top_builddir)/src/libnftables.la
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> similarity index 77%
> rename from meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> rename to meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> index e078be79a1df..e2d0bd66812c 100644
> --- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> +++ b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> @@ -6,26 +6,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
>  DEPENDS = "libmnl libnftnl bison-native \
>             ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
>
> -# Ensure we reject the 0.099 version by matching at least two dots
> -UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
> -
>  SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
> -           file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
>             file://run-ptest \
>            "
>
> -SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
> +SRC_URI[sha256sum] = "927fb1fea1f685a328c10cf791eb655d7e1ed49d310eea5cb3101dfd8d6cba35"
>
>  inherit autotools manpages pkgconfig ptest
>
> -PACKAGECONFIG ??= "python readline json"
> +PACKAGECONFIG ?= "python readline json"
> +PACKAGECONFIG[editline] = "--with-cli=editline, , libedit, , , linenoise readline"
>  PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
> +PACKAGECONFIG[linenoise] = "--with-cli=linenoise, , linenoise, , , editline readline"
>  PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
>  PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
> -PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
> -PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
> +PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --disable-python, python3"
> +PACKAGECONFIG[readline] = "--with-cli=readline, , readline, , , editline linenoise"
>  PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
>
> +EXTRA_OECONF = "${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise readline', '', '--without-cli', d)}"
> +
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
>
>  RRECOMMENDS:${PN} += "kernel-module-nf-tables"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97815): https://lists.openembedded.org/g/openembedded-devel/message/97815
> Mute This Topic: https://lists.openembedded.org/mt/92329338/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

