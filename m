Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAEAC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 19:28:03 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.992.1638991682211219597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 11:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=USGIUNJh;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id t83so2942678qke.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Dec 2021 11:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jL0xHH0XHpb0DGKV8aLdFzb+Z7H9SZR+jGv8zejUnVI=;
        b=USGIUNJhVkka4DQDuMGj74ZcsiAByxE9275CGp6uDZx0IrEEOQuwVQDV8fqx5cznH4
         IIqHuafcIdsOHABYTGxpTRhCRQE5P5/mw1/ZHeJ1VnjQiLrsn3ejYmH+mDgZodrYZQl3
         52PnSgfkrsADTmTfCqTM6ku6/bS86Auzv13+dxxs6ujvMqAtOn02/U6DslSsoyCuKepU
         xvbKoM9BIPvT+UCkm3vPXKp9AodIJRMwICQLIEV2z6o4OKzbERXMT3OV8THgMMG4UjxB
         EymD6eYISw2F5nB7J3bAwTfSPOGh4zq5JBgjdMry0YoeQ/88R92dHz2saYynSl60X39i
         uBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jL0xHH0XHpb0DGKV8aLdFzb+Z7H9SZR+jGv8zejUnVI=;
        b=EE20wvXZ7EYR38Vn72IEp28hfD1up4txELOK9G4aaTdqVsCQXfKeHsdXIcPRFrk+m4
         bLcois/Yt0MmqYLOQu1emjPNkNTtN2Kts0WQLiFSuVvz/xvGy4yLM1NnAEt6K89d8SQZ
         vVHTQQVUa/8WjawbfYbVNWbC457H4Lxqi+VCBzBc4pKd7+rBSILwCGVlmV8BT7mpjho9
         mR4s2Q2fFeiKhAToBwIahiuOX/gn5pOtcSJevefBeKihP0O4rsXbZevXu52wcT7iQQ0V
         5c+6Jmf+G+XzTUspOcQayD5NYWDhB+63SfhphmF346Wh/HIm9jV+K+tkVGhcEt+CAZAz
         2FmQ==
X-Gm-Message-State: AOAM5337YJdgFIZbzDL+t5zhzm89azI+1zPbCJWGbvJQxbD0uDsASQEN
	avlq0nYXiBqEl4R1V/13WzxoK1HlbtR/iSZJ3YKTxZ5IkGs=
X-Google-Smtp-Source: 
 ABdhPJwSpOuSZp3XBiMvXBqwZ0g39E2oBU7nEGb760XFCmCPmZGiOd2mMIM8vJ2Si/1jtlqIYjJ8VT4jXollucEMOOI=
X-Received: by 2002:a05:620a:461f:: with SMTP id
 br31mr9093575qkb.72.1638991681185;
 Wed, 08 Dec 2021 11:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20211208171543.1234000-1-patrick@stwcx.xyz>
In-Reply-To: <20211208171543.1234000-1-patrick@stwcx.xyz>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Dec 2021 11:27:35 -0800
Message-ID: 
 <CAMKF1spC7M4AO2eCey1G9MfyfLVELug3RaKjS5bOUKjxHAxXCg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] unifex: add recipe
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 19:28:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94255

On Wed, Dec 8, 2021 at 9:15 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> libunifex is a library for enabling C++ "Unified Executors" in C++20,
> based on current standards work being proposed for C++23 (P2300)[1].
> This library provides C++20 support for async and co-routines.
>
> 1. https://isocpp.org/files/papers/P2300R3.html
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta-oe/recipes-devtools/unifex/unifex_git.bb | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/unifex/unifex_git.bb
>
> diff --git a/meta-oe/recipes-devtools/unifex/unifex_git.bb b/meta-oe/recipes-devtools/unifex/unifex_git.bb
> new file mode 100644
> index 000000000..09b8c2254
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/unifex/unifex_git.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "C++ Unified Executors library"
> +HOMEPAGE = "https://github.com/facebookexperimental/libunifex"
> +SECTION = "libs"
> +LICENSE = "Apache-2.0-with-LLVM-exception"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5b86506074cb3cdc493b4f96b73b2909"
> +
> +SRC_URI = "git://github.com/facebookexperimental/libunifex.git;branch=main"

also set protocol=https explicitly in SRC_URI

> +SRCREV = "9df21c58d34ce8a1cd3b15c3a7347495e29417a0"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS = ""

Do we need to empty out DEPENDS ?

> +
> +BBCLASSEXTEND = "native nativesdk"

move this below EXTRA_OECMAKE

> +
> +PACKAGECONFIG ??= "liburing"
> +PACKAGECONFIG[liburing] = ",,liburing"
> +
> +EXTRA_OECMAKE += " \
> +    -DBUILD_SHARED_LIBS=ON \
> +    -DBUILD_TESTING=OFF \
> +    -DCMAKE_CXX_STANDARD=20 \
> +    -DUNIFEX_BUILD_EXAMPLES=OFF \
> +    "
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94252): https://lists.openembedded.org/g/openembedded-devel/message/94252
> Mute This Topic: https://lists.openembedded.org/mt/87593128/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

