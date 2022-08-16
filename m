Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC154C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 21:40:10 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.21500.1660686001448232596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 14:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WWl8aXSx;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-32a09b909f6so185924557b3.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+cwF4/NdV1iauXF59abU9UMTT9dB7ZOAzUJIeg9dzLM=;
        b=WWl8aXSxvsIB0AmZHbyY2rpZbX/AJHXLxTCnqvwCEJeX/sYXS7u5v/gDVhpZrTC4CF
         XyzTu8T+SL2R0rnlwTecDBYptUXZKPMuqg4poSijFv0RgJ0ulq2Ph3Cl2U7yH83XREV1
         4i8JY329dLHfMwrrU1Sv+FcyA/BRKXZBrpgzI9DmfzQVtyvWl2HjtBXOWSpco1cEKPin
         miUgLwxSI68IRxu97FU/2NW4Lxndy4fj0985AU9ABv34w0JxCIvLNPgsDQ1B6g/JtDIu
         PwduJTfTpGDtcUW6c/FO4/4FzNnDC7y/9D5XBWp1ZXV9cA8HglliiCP0jvK9qHN6JCey
         2w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+cwF4/NdV1iauXF59abU9UMTT9dB7ZOAzUJIeg9dzLM=;
        b=gO8B79SBbFgHPHLKrYEBuE+G4vmptxpgaKyVtKBBSz8Nmafy3XyFs4X0D24TmBi7OV
         YdYIdoc/UiQ5xsnt5bUjHbYoBQfdWgQARaDV0ezShHEil3JJiglluOR+vI4HNr2Fv67N
         5CnqDESeL1VXHn8wiiOEKuEPEEBaINpeISDZ0ddLjBkwKzNZhXfncmwELQPZ07dSTZNa
         mt9sLI3WGPB8mVH7jsEnuGhUbKjK9GjJxb/s98zsCaZ6OmeR2LbeI9zxAS3DV/iz0nCn
         a1WJYf/rp/rFPlr39sV2V7GI+13T3t81hTuYyLD08YmLAu3zxsyzNNeI0PTpSHToPXWz
         URdQ==
X-Gm-Message-State: ACgBeo1twTr8ATcO0JmWv6i1xkkRBb6UaOFHxpHYTsFofGJydPpspGgt
	vvQvezpjir+jL9BzBaMZ+9W4tNjfM57NVTXNlkM=
X-Google-Smtp-Source: 
 AA6agR7d8j0kFcD1CYZiHcxG8x3QRRFQETZHff52UGTLz3ffYxtj0TzgJozluWDFlx95r8RVL52VqVYPH18yNHbRHOo=
X-Received: by 2002:a81:6c43:0:b0:32f:df6d:f7ef with SMTP id
 h64-20020a816c43000000b0032fdf6df7efmr12050050ywc.422.1660686000383; Tue, 16
 Aug 2022 14:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <f779d83c-98f5-7b24-5ea2-10535f3e450d@gmail.com>
In-Reply-To: <f779d83c-98f5-7b24-5ea2-10535f3e450d@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2022 14:39:33 -0700
Message-ID: 
 <CAMKF1sqkKYyOOnu9-amVuvNs2Sm0_1541iBk0Rq8o+dZaAy6FA@mail.gmail.com>
Subject: Re: kirkstone merge request: Aug 16th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Aug 2022 21:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98264

merged ... thanks Armin

On Tue, Aug 16, 2022 at 11:42 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 8f2dc1023482863e2630d1b94052c41ce748b38f:
>
>    tracker: upgrade 3.3.1 -> 3.3.2 (2022-07-26 07:27:26 -0700)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to acbe74879807fc6f82b62525d32c823899e19036:
>
>    cryptsetup: Add support for building without SSH tokens (2022-08-09
> 09:51:57 -0700)
>
> ----------------------------------------------------------------
> Akash Hadke (1):
>        polkit: Add --shell /bin/nologin to polkitd user
>
> Anuj Mittal (1):
>        yasm: fix buildpaths warning
>
> Khem Raj (1):
>        ibus: Swith to use main branch instead of master
>
> Marta Rybczynska (1):
>        polkit: update patches for musl compilation
>
> Martin Jansa (1):
>        glmark2: fix compatibility with python-3.11
>
> Mingli Yu (6):
>        net-snmp: set ac_cv_path_PSPROG
>        postgresql: Fix the buildpaths issue
>        freeradius: Fix buildpaths issue
>        openipmi: Fix buildpaths issue
>        apache2: Fix the buildpaths issue
>        frr: fix buildpaths issue
>
> Peter Kjellerstedt (2):
>        libwebsockets: Avoid absolute paths in *.cmake files in the sysroot
>        cryptsetup: Add support for building without SSH tokens
>
> Vyacheslav Yurkov (1):
>        polkit: add udisks2 rule
>
> Yi Zhao (1):
>        polkit-group-rule-udisks2: fix override syntax in RDEPENDS
>
>   meta-gnome/recipes-support/ibus/ibus.inc                        | 2 +-
>   .../files/0001-version.c-don-t-print-build-flags.patch          | 41
> +++++++++++
>   .../recipes-connectivity/freeradius/freeradius_3.0.21.bb        | 1 +
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 5 ++
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb    | 1 +
>   meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb     | 4 +
>   .../files/0001-waflib-fix-compatibility-with-python-3.11.patch  | 76
> +++++++++++++++++++
>   meta-oe/recipes-benchmark/glmark2/glmark2_git.bb                | 3 +-
>   .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb   | 3 +
>   meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb           | 11 ++-
>   .../files/0001-config_info.c-not-expose-build-info.patch        | 110
> ++++++++++++++++++++++++++++
>   meta-oe/recipes-dbs/postgresql/postgresql.inc                   | 8 ++
>   meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb               | 1 +
>   meta-oe/recipes-devtools/yasm/yasm_git.bb                       | 5 ++
>   .../polkit/files/50-org.freedesktop.udiskie.rules               | 24
> ++++++
>   meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb    | 17 +++++
>   .../polkit/0003-Added-support-for-duktape-as-JS-engine.patch    | 20 ++---
>   ...optional.patch => 0004-Make-netgroup-support-optional.patch} | 103
> +++++++++++++-------------
>   .../polkit/0005-Make-netgroup-support-optional-duktape.patch    | 34
> +++++++++
>   meta-oe/recipes-extended/polkit/polkit_0.119.bb                 | 4 +-
>   .../apache2/0001-make_exports.awk-not-expose-the-path.patch     | 32
> ++++++++
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb          | 1 +
>   22 files changed, 439 insertions(+), 67 deletions(-)
>   create mode 100644
> meta-networking/recipes-connectivity/freeradius/files/0001-version.c-don-t-print-build-flags.patch
>   create mode 100644
> meta-oe/recipes-benchmark/glmark2/files/0001-waflib-fix-compatibility-with-python-3.11.patch
>   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
>   create mode 100644
> meta-oe/recipes-extended/polkit/files/50-org.freedesktop.udiskie.rules
>   create mode 100644
> meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
>   rename
> meta-oe/recipes-extended/polkit/polkit/{0003-make-netgroup-support-optional.patch
> => 0004-Make-netgroup-support-optional.patch} (74%)
>   create mode 100644
> meta-oe/recipes-extended/polkit/polkit/0005-Make-netgroup-support-optional-duktape.patch
>   create mode 100644
> meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch
>

