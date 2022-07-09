Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E652C43334
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 11:08:16 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.5248.1657364888804409280
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jul 2022 04:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y4kXLQi3;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id e15so1236138edj.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jul 2022 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ANrdAIRKsab2nrqXgOEMW4GXQrxA9ZFNPOCP9G2fqfc=;
        b=Y4kXLQi3b/8d57Da284qXVQ090JCuI1HG2+HVCe3E2YtL2cPyACHNrCOeMWuf3gYQ+
         CupYttr0LJLnC59ugtLrzV+4vKe04Un2SMdpTL/cR0LAQuazuD0ZwG5xQrAf02Hupltp
         n2RljDS+nXWqvsIpZawMrdxg1AlueCgfrJwriF1rEnMRx0FNn7s9/729vOWHdnYqjsY+
         A+D5a4QIVCCZV3TUHioUxp/sp2JuZKQdj6JYM/tj0ThsIM6XyKCIoVwCuNnUlrSlecZ3
         Gr6K8SdW/Qf+YQWu00qqN7B53EJz1j0iGYQs5O/QTsbk4c1xVkUP4E/nbL4Y/6MJ8NnP
         ke7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ANrdAIRKsab2nrqXgOEMW4GXQrxA9ZFNPOCP9G2fqfc=;
        b=6yC/V+MhcKxQHuYjrq1WckYmsVE8veDzd2HXS2Y3wbYSCJge8x4PQjqsIz4AXh2m5y
         oVsvIq5qyUCDnIrFwt8C/vq8TSwEQeiy5z7o5CwfnYHrj2at/uO78c8g96tuR+roJZnk
         r+Okm5owwGqsqPGTWusvTjQEf7pgAZlgdnfNQj/G1AyagjbTlegd7cO6ISNK4qYJCWCg
         LPLQIfskGnp1piEQnecmM6vwhMulIhq7ohHpSmO/yS8UwwtG44/lPH2FuZXtOT/hTz0B
         jI8bNUQvRsRJd9QXl1720vguoD13K+j4+2rSXDwqh5AM6wAh8fvn86Sjf1J5o2rCV04x
         K+iQ==
X-Gm-Message-State: AJIora95r5oN6JXj7Z4syiALl77Vp9LoT3RlnlRVnd+5MV18/q8dZw5S
	P3J1072t1bEduGz3qSR4Xl+eoK0ntngLbBJpkyfJY19k
X-Google-Smtp-Source: 
 AGRyM1vO/AJ1TrEOqu++dGtahA2Tx+kAvweGjUM5oac8gEkLMfjddeTP2MspVUEuX5vtAFGWwrwL9+3wszdb5lOIwvs=
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id
 ef3-20020a05640228c300b0043a6d781b64mr10680334edb.93.1657364886743; Sat, 09
 Jul 2022 04:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220708205048.11990-1-alex.kiernan@gmail.com>
 <20220708205048.11990-2-alex.kiernan@gmail.com>
In-Reply-To: <20220708205048.11990-2-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 9 Jul 2022 12:07:55 +0100
Message-ID: 
 <CAO5Uq5QnbkKA9q9bk4xoJj2X4GT7+p3z5_QPLp2Zm1kUPRCVkg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] nftables: Upgrade 1.0.2 -> 1.0.4
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Jul 2022 11:08:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97795

Ignore this, need to send a v2

On Fri, Jul 8, 2022 at 9:51 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Drop backported patch.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 -------------------
>  .../{nftables_1.0.2.bb => nftables_1.0.4.bb}  |  9 +++--
>  2 files changed, 5 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
>  rename meta-networking/recipes-filter/nftables/{nftables_1.0.2.bb => nftables_1.0.4.bb} (85%)
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
> similarity index 85%
> rename from meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> rename to meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> index f1cfb4910138..78d71fb4c0fc 100644
> --- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> +++ b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> @@ -10,20 +10,21 @@ DEPENDS = "libmnl libnftnl bison-native \
>  UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
>
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
> -PACKAGECONFIG ??= "readline json"
> +PACKAGECONFIG ?= "readline json"
> +PACKAGECONFIG[editline] = "--with-cli=editline, --without-cli, libedit, , , linenoise readline"
>  PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
> +PACKAGECONFIG[linenoise] = "--with-cli=linenoise, --without-cli, linenoise, , , editline readline"
>  PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
>  PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
>  PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
> -PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
> +PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline, , , editline linenoise"
>  PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
> --
> 2.35.1
>


-- 
Alex Kiernan

