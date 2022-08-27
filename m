Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5D1ECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 15:58:03 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.50095.1661615882479502121
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 08:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hede2ZBG;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-334dc616f86so102794917b3.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yQtkc+KSaYzSUA2blkAXiBp6C1ZZhOyWSPjWKO8Uwec=;
        b=Hede2ZBGBtTuC3tZLaEG8ybQ/+fEb59HTFtVmMqILezVO3zq54oYZChbOtplrQKi0A
         5RWqReimnZ4pnE4OZ+J22wgE62g5U+r3/50u/xYmqB1h5kqsjyjJr9K1kVT6zOtMYGZj
         qA8K6TLDPkcqKLaqoV+vYNTdqrn0+D8BDmqm3WBc/LhltNa8Mpx1BJVINw3OC/hxdFOg
         NezrBQDt6qAh97/pb68pGvr7H4JFu7CrTJXl20alMtpM8rt4g0AMcORg+0arpmLZaCgw
         zuejNNaaIs78ojoZCv4D40TxoD/ecSAqq6HGv5JrQbA7ZxlRcqkrspWM0j+Sh5g+JajK
         iuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yQtkc+KSaYzSUA2blkAXiBp6C1ZZhOyWSPjWKO8Uwec=;
        b=wUpy5IPRzLLI0EFV8IZvxjL7h1zBn/KM7eE1zBiJGAuqKFGie8ef7P/MzOawJCqUZe
         +hO1ojE7M/cZgX1N8SgUKHLH39+sdplWZ7PDW9ne2sSHRJEsdmqQY99P+mLYDI7a5/lY
         IUK/Gp0TAvhputuL/HCFBRvTQYbMGUW8h+I/Cv/3OX6T9PGskpXaUWU5UloBe49Cjq0y
         P43XVAq62k0OWjgXG7U/hGjWOIXsxUuef1M7lwNe24RFrgJ1bLqN+lQPuIlMgiJaOR8Z
         qdklI7/WxFAaqKZHdXC+C1od94tCHSAZSrtY8+24FZrSG999JOuoV9jJ3sRJgLYKjFCt
         il6Q==
X-Gm-Message-State: ACgBeo0mkm7y4Z53zIG/CCS5Hs7Jino45sqeFfgDhXs8nKWOIEC78Gne
	M7pQ81nZdClKjmETeRPR+vNi79h5N+c2qq9DqBg=
X-Google-Smtp-Source: 
 AA6agR55hpbyXaRvqofHVAjn5CiSJVJ8dNRcGZWb2Sh04OIjmH5K9ltkLtxDK4fJZTpYMlb8QQZC5Enr+AZ1BZbGUcI=
X-Received: by 2002:a5b:e91:0:b0:69a:ddb:9f9f with SMTP id
 z17-20020a5b0e91000000b0069a0ddb9f9fmr1974398ybr.295.1661615881675;
 Sat, 27 Aug 2022 08:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220826195403.893639-1-jan.vermaete@gmail.com>
In-Reply-To: <20220826195403.893639-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 27 Aug 2022 08:57:35 -0700
Message-ID: 
 <CAMKF1sr+YqDYPtWhrJqP=rxG4uKs77FMQLJ5jPm4bO7pF-ymnQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] makeself: added makeself as new recipe
To: Jan Vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 15:58:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98493

On Fri, Aug 26, 2022 at 1:03 PM Jan Vermaete <jan.vermaete@gmail.com> wrote:
>
> Based on the older recipe of intel-iot-refkit.
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../makeself/makeself_2.4.5.bb                | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
>
> diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb b/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
> new file mode 100644
> index 000000000..e0dfc3dae
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/makeself/makeself_2.4.5.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "A self-extracting archiving tool for Unix systems, in 100% shell script."
> +DESCRIPTION = "\
> +    makeself.sh is a small shell script that generates a self-extractable \
> +    compressed tar archive from a directory. The resulting file appears as \
> +    a shell script (many of those have a .run suffix), and can be launched as is.\
> +"
> +HOMEPAGE = "https://makeself.io/"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "\
> +    git://git@github.com/megastep/makeself.git;protocol=https;branch=master \

We generally use without user when anonymous access like
git://github.com/megastep/makeself.git;protocol=https;branch=master

> +"
> +
> +SRCREV = "5742be6410bfad2c619fb1e98bf795e8fa0913c7"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/makeself.1 ${D}${bindir}/

what is makeself.1 file containing, I wonder if its a manpage, if so
then it should
go into mandir

> +    install -m 0755 ${S}/makeself.sh ${D}${bindir}/
> +    install -m 0755 ${S}/makeself-header.sh ${D}${bindir}/
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98482): https://lists.openembedded.org/g/openembedded-devel/message/98482
> Mute This Topic: https://lists.openembedded.org/mt/93278219/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

