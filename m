Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B9EECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 09:18:51 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web09.47397.1661591928726524618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 02:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdANJEJy;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-324ec5a9e97so88686377b3.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WvTuz4Y8qtoibe0JKvI25pv6oEzh0R2o/doKTyNniWc=;
        b=SdANJEJyLWw/luF4gnzLYSpMDmg6MhyoMbhl0ba8NLRm37ezpif3wlTvvykSkbNvZN
         wC1wwY8vh57NvLHx/dqx1wMNPuVfdX2ESdM+mcwA/xpNN5CpBXVLtNI5MEmvw6qZDCFP
         w+QHBkMJdxUem2MGewWfc/TOFFJW/6rgd+55+fVrTpgOXY4ANTxvvl1dPc1ThbSu4923
         kXPS531OgUzpru+cuKF/I7aaVBUBBaOYWW8XgDWAkKDcFQjJ1Rn1wyD/wcF7FHYs1ZKa
         lljGLcjwY0XDKS/+uq09dTEkuhjE09tREuClY4etyEPDy8iTLCYIXXLGVFgcuraJvEL6
         LVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WvTuz4Y8qtoibe0JKvI25pv6oEzh0R2o/doKTyNniWc=;
        b=5XEKWdMn1fbhpIyZ7T7/mor7UJF5BboPowrCoihnUuzj4EdhfB7HZtjfdDzm6qMrVn
         LQxHWxjo2U/MiWKBtto0yaysS77mQzViqDeTJ6HlPMXAvY3gyrGrN3KJVPt+sXbWrC+Y
         nC8EAKA5DEPHI94Gc6kTE/8CKMM4mCL5xm4O2KvA1nZXtIpc9VaNpv4vWo3EYESR3tuk
         1JjpcGuStaWs0Dji8oErt/Yw58cAOjkR5NNnH54sHB8YIM2Thruz6CJzd3hNb2Ck84gx
         K42S0QwNy3x3Hz+mrTIQnTxiJbQTJqXdSVaq8FM9w5nK+QcjSFskSbnmXCo3XPhPFIxD
         9o9Q==
X-Gm-Message-State: ACgBeo0tCsfYWIVVg/ETo2+i/YWA0xPRkSyQBmexR3Y1OXv6IzXrrAcd
	SiL+l9XT6GSXzibq5Di5NwEDUgutvVEHsIMTjps=
X-Google-Smtp-Source: 
 AA6agR4WhqPvVEhnVV7ET7Ng9Jh8x0AwrigKIdRLzEHX4dGpqjiZwjK8dVlgu9HrmXyoHyc9AwsovrI+6KlJLsiMkBU=
X-Received: by 2002:a5b:98b:0:b0:695:8398:9f1e with SMTP id
 c11-20020a5b098b000000b0069583989f1emr2739464ybq.620.1661591927850; Sat, 27
 Aug 2022 02:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220827075947.3579120-1-uvv.mail@gmail.com>
In-Reply-To: <20220827075947.3579120-1-uvv.mail@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Aug 2022 02:18:21 -0700
Message-ID: 
 <CAMKF1soGYkcUSk+xUR_azDas6CcNRDasyKsOrwcP3br3GWNuQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] protobuf: disable protoc binary for
 target
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 09:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98487

On Sat, Aug 27, 2022 at 1:00 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
>
> When applications want to use protoc during the build, the target binary
> has to be disabled in order to avoid following error:
>
> |   The imported target "protobuf::protoc" references the file
> |
> |      "<application build dir>/recipe-sysroot/usr/bin/protoc-<protobuf version>"
> |
> |   but this file does not exist.  Possible reasons include:
> |
> |   * The file was deleted, renamed, or moved to another location.
> |
> |   * An install or uninstall procedure did not complete successfully.
> |
> |   * The installation package was faulty and contained
> |
> |      "<application build dir>/recipe-sysroot/usr/lib/cmake/protobuf/protobuf-targets.cmake"
> |
> |   but not all the files it references.
>
> Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> index 83dabc9f8..e36179363 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
> @@ -34,6 +34,13 @@ EXTRA_OECMAKE += "\
>      -Dprotobuf_BUILD_EXAMPLES=OFF \
>  "
>
> +# Configuration below allows to cross-compile protobuf applications
> +# and use native protoc binary in your recipes. In order to use protoc
> +# on the target, set protobuf_BUILD_PROTOC_BINARIES to ON in your bbappend
> +EXTRA_OECMAKE:append:class-target = " \
> +     -Dprotobuf_BUILD_PROTOC_BINARIES=OFF \
> +"
> +

can we make it a packageconfig perhaps ?

>  TEST_SRC_DIR = "examples"
>  LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98486): https://lists.openembedded.org/g/openembedded-devel/message/98486
> Mute This Topic: https://lists.openembedded.org/mt/93286129/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

