Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5A9C433EF
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 13:48:27 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.6542.1657374505369376759
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jul 2022 06:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WgjHE6Ay;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id bs20so1569839qtb.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jul 2022 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z2rE/K5clI30e5EW/tF5a4NygbC/G5TsJ4CEe6Pja/M=;
        b=WgjHE6AyhwqWB0X+9pREKnP3Iu9JizvbmKd/L2pYyyB1n7CMLfz4P8V0Ia9VW0a4b2
         kPdVExwNeNT0xlpXW5jaJKnihu2Sqm75i9a9eUFGHYJoTYD5p7Zu05w/mVWDscTekueR
         S+ZSvoYq51l4bjI62K1oD21Sf1PRvqK/4JlQ+PrnzwL2lKlcCYwKFQL4K2prjLEMQ6iM
         C9MSigG9YPi6UGfMMbIW7aR7OIzUbx1zuLkNApxptPT4GsAnGwSeBN/I7PRRTNvezvQA
         IWezK/acISY1bn9BCj58LblDKd21nBstOoU05JfFroZnLTEcDcjz4GPiqyUIAzUJXC4l
         waHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2rE/K5clI30e5EW/tF5a4NygbC/G5TsJ4CEe6Pja/M=;
        b=7do2Un+4mQMXojY1QsseTjGbtFhe2H90rTrnjGqinZeas0ZsBaQYG+b9U75DQ7VXVK
         Tx9kq7HnOrd3BOTYJep5j5Y4sHujXUQvhKMAvyirkjmF9n5vRJHDp3D7eN1z8BXeIEXx
         nP7ksHxJHHXVK02Y6yo2Ry9fWsNh1A3L2EjZtqUBRbT13WEUiNYykNHo8ycVqLuq3gBS
         GRDBzht1U0OcSufdleQDjYydqkySGpmOHmIA5Vto2lUZrI0NoJL9mAx7ihT5t9NxDPmS
         3ZllUalvP4/6dbEe+OGXxpAQ8Isaa1c6N1mb5HZcs5wvNdibuEjL6DbJnTtYpcdu6bnF
         7eoA==
X-Gm-Message-State: AJIora8kGD7jKvvMH9XZi43vCPVUKeOiXZAwpt3N2sVY3cInrWaX4OxZ
	E2Ix9qUIpbA1YApbk1hWupMmj7nswfA3PITduHU=
X-Google-Smtp-Source: 
 AGRyM1s/sZ1yKGzGoCjmG+eMtqVNAgBuxUUuoL0C5O/sZ+o3uuF92KYA7BXFNFiGrRFV+uKzxdbOmXkyzQk/ktEVMOQ=
X-Received: by 2002:a05:622a:13ce:b0:31a:b4ce:1679 with SMTP id
 p14-20020a05622a13ce00b0031ab4ce1679mr7362214qtk.330.1657374504096; Sat, 09
 Jul 2022 06:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220708205048.11990-1-alex.kiernan@gmail.com>
 <20220708205048.11990-2-alex.kiernan@gmail.com>
 <CAO5Uq5QnbkKA9q9bk4xoJj2X4GT7+p3z5_QPLp2Zm1kUPRCVkg@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5QnbkKA9q9bk4xoJj2X4GT7+p3z5_QPLp2Zm1kUPRCVkg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Jul 2022 09:47:58 -0400
Message-ID: 
 <CAMKF1srRvTF4cfxo=Mvqrd3pDRVYzz_hQFX5D52GCEfzQa17uw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] nftables: Upgrade 1.0.2 -> 1.0.4
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Jul 2022 13:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97796

On Sat, Jul 9, 2022 at 7:08 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Ignore this, need to send a v2
>

do you want to rework the python packageconfig patch too ?

> On Fri, Jul 8, 2022 at 9:51 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Drop backported patch.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  ...-with-make-check-and-add-AM_CPPFLAGS.patch | 39 -------------------
> >  .../{nftables_1.0.2.bb => nftables_1.0.4.bb}  |  9 +++--
> >  2 files changed, 5 insertions(+), 43 deletions(-)
> >  delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
> >  rename meta-networking/recipes-filter/nftables/{nftables_1.0.2.bb => nftables_1.0.4.bb} (85%)
> >
> > diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch b/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
> > deleted file mode 100644
> > index 65ab2dfd8c49..000000000000
> > --- a/meta-networking/recipes-filter/nftables/nftables/0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From 18a08fb7f0443f8bde83393bd6f69e23a04246b3 Mon Sep 17 00:00:00 2001
> > -From: Pablo Neira Ayuso <pablo@netfilter.org>
> > -Date: Tue, 22 Feb 2022 00:56:36 +0100
> > -Subject: [PATCH] examples: compile with `make check' and add AM_CPPFLAGS
> > -
> > -Compile examples via `make check' like libnftnl does. Use AM_CPPFLAGS to
> > -specify local headers via -I.
> > -
> > -Unfortunately, `make distcheck' did not catch this compile time error in
> > -my system, since it was using the nftables/libnftables.h file of the
> > -previous nftables release.
> > -
> > -Fixes: 5b364657a35f ("build: missing SUBIRS update")
> > -Fixes: caf2a6ad2d22 ("examples: add libnftables example program")
> > -Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
> > -
> > -Upstream-Status: Backport
> > -[http://git.netfilter.org/nftables/commit/?id=18a08fb7f0443f8bde83393bd6f69e23a04246b3]
> > -
> > -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ----
> > - examples/Makefile.am | 4 +++-
> > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/examples/Makefile.am b/examples/Makefile.am
> > -index c972170d..3b8b0b67 100644
> > ---- a/examples/Makefile.am
> > -+++ b/examples/Makefile.am
> > -@@ -1,4 +1,6 @@
> > --noinst_PROGRAMS       = nft-buffer            \
> > -+check_PROGRAMS        = nft-buffer            \
> > -                 nft-json-file
> > -
> > -+AM_CPPFLAGS = -I$(top_srcdir)/include
> > -+
> > - LDADD = $(top_builddir)/src/libnftables.la
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> > similarity index 85%
> > rename from meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> > rename to meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> > index f1cfb4910138..78d71fb4c0fc 100644
> > --- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
> > +++ b/meta-networking/recipes-filter/nftables/nftables_1.0.4.bb
> > @@ -10,20 +10,21 @@ DEPENDS = "libmnl libnftnl bison-native \
> >  UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
> >
> >  SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
> > -           file://0001-examples-compile-with-make-check-and-add-AM_CPPFLAGS.patch \
> >             file://run-ptest \
> >            "
> >
> > -SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
> > +SRC_URI[sha256sum] = "927fb1fea1f685a328c10cf791eb655d7e1ed49d310eea5cb3101dfd8d6cba35"
> >
> >  inherit autotools manpages pkgconfig ptest
> >
> > -PACKAGECONFIG ??= "readline json"
> > +PACKAGECONFIG ?= "readline json"
> > +PACKAGECONFIG[editline] = "--with-cli=editline, --without-cli, libedit, , , linenoise readline"
> >  PACKAGECONFIG[json] = "--with-json, --without-json, jansson"
> > +PACKAGECONFIG[linenoise] = "--with-cli=linenoise, --without-cli, linenoise, , , editline readline"
> >  PACKAGECONFIG[manpages] = "--enable-man-doc, --disable-man-doc, asciidoc-native"
> >  PACKAGECONFIG[mini-gmp] = "--with-mini-gmp, --without-mini-gmp"
> >  PACKAGECONFIG[python] = "--enable-python --with-python-bin=${PYTHON}, --with-python-bin="", python3"
> > -PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline"
> > +PACKAGECONFIG[readline] = "--with-cli=readline, --without-cli, readline, , , editline linenoise"
> >  PACKAGECONFIG[xtables] = "--with-xtables, --without-xtables, iptables"
> >
> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
> > --
> > 2.35.1
> >
>
>
> --
> Alex Kiernan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97795): https://lists.openembedded.org/g/openembedded-devel/message/97795
> Mute This Topic: https://lists.openembedded.org/mt/92260724/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

