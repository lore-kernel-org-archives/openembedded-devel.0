Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CCDC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:50:38 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.2675.1632765037686140689
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jkRY0JPh;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c20so17441172qtb.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X1iAHHgKiVpC6UTwX+Yt14KOdKzcR+xTnNn/QTkvKW4=;
        b=jkRY0JPhECUSySVOf80HNzdVXJxFLrs0AQ5zMIafZUmv3Jcg29G2eO4OSpHYHyNgvh
         GWikpjyksu2zhQxD+lIqcdjbjN64Fbh5na2HZH6ubr87LBgWueHYT4zFlc8ElC7b3HPM
         5Q/mTIXjcDLCf4PdM43dmjTG4lSchIsMpx7fcsr0zEBCCII6R7y9ordzT6vMWtmR0f/6
         dy1lViLbfacSljKZowa3Vy65FdbjzHZWbxkDRfnH6FHwDHUp4OoZ0OGdMRi9kxdNMBDW
         FVonhyjyGJp+Fr5ScXsac2zvDyD+bR0Ely4zhUwSyl+7GlL+Bluc80+Vc3JyNjW5nkN/
         EjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1iAHHgKiVpC6UTwX+Yt14KOdKzcR+xTnNn/QTkvKW4=;
        b=1edMJaaTxg1ZbIBo7j0cW4SHhbNzmSsrSiLjZhzJnbdJVogxRM9UXHAIpu4eAi9cW7
         raH7LQy7eBBFz93lnlBq65aaCEUc+g2ApZODgNwYIZJ6giCiUnsudp20b0WVryimn60y
         5iS90+ZBYXtpbtQ9Ev8+e5bLOhLQmTkWXt+LkipTSno779c/7/vMnqgFJxDzIoPd+KcF
         mU6U4uoEF7kBioDjjkSx5hPcgpQ9jQMXsJFeYBQ7mqGPJeKmXBBopolIjnCrCIBVBXtQ
         YMU6hGokPlSg0kUp2uo9RuiJ+eoYmNPe92Hd0MakwGqXWIf4P296rj3/XdL7P+GE+gcG
         U7tg==
X-Gm-Message-State: AOAM533RqC+zEcw+TnI+Hl2YiiRHSdxl6zKv2Qc/jRAuXi4Op4NQxdbh
	ZeWU+5yBvlb6LFqvX+AGct9O5pnD7gUzFNi4+0s=
X-Google-Smtp-Source: 
 ABdhPJzZZUDIkMWx7m+hPe2nyoNhprLjVSgDHePZmeGgc9/19gFa8xt+af+nTEl6QQQ7Q/6ZPln9KwLXgxW7Grctar8=
X-Received: by 2002:ac8:1e0b:: with SMTP id n11mr1153694qtl.274.1632765036524;
 Mon, 27 Sep 2021 10:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <1632708185-7854-1-git-send-email-zangrc.fnst@fujitsu.com>
In-Reply-To: <1632708185-7854-1-git-send-email-zangrc.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Sep 2021 10:50:10 -0700
Message-ID: 
 <CAMKF1spoxFR7Z11SPPhzVvo+uetTc_vrJH7Z8nM4Gr0v89C6iQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libjs-jquery-globalize: Add recipe
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 17:50:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93156

fails build QA check

https://errors.yoctoproject.org/Errors/Details/609178/

On Sun, Sep 26, 2021 at 7:03 PM zangrc <zangrc.fnst@fujitsu.com> wrote:
>
> A JavaScript library for internationalization and localization that
> leverages the official Unicode CLDR JSON data.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../libjs/libjs-jquery-globalize_1.7.0.bb     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
>
> diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> new file mode 100644
> index 0000000000..ec218299b2
> --- /dev/null
> +++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "A JavaScript library for internationalization and localization that leverages the official Unicode CLDR JSON data"
> +SECTION = "console/network"
> +HOMEPAGE = "https://github.com/globalizejs/globalize"
> +LICENSE = "MIT"
> +
> +S = "${WORKDIR}/globalize-${PV}"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
> +
> +SRC_URI = "https://github.com/globalizejs/globalize/archive/refs/tags/${PV}.tar.gz"
> +
> +SRC_URI[sha256sum] = "51928dd6dbaceaab8cd89e7b430aa366b3029a8b70e74d4ca4be2d89cc929bab"
> +
> +FILES:${PN} = "${datadir}/javascript/jquery-globalize"
> +FILES:${PN}-doc += "${docdir}/${PN}"
> +
> +do_install() {
> +        install -d ${D}${datadir}/javascript/jquery-globalize/
> +        install -m 0644 ${S}/dist/*.js ${D}${datadir}/javascript/jquery-globalize/
> +        install -m 0644 ${S}/dist/globalize/*.js ${D}${datadir}/javascript/jquery-globalize/
> +
> +        install -d ${D}${docdir}/${PN}/
> +        install -m 0644 ${S}/LICENSE ${D}${docdir}/${PN}/
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93135): https://lists.openembedded.org/g/openembedded-devel/message/93135
> Mute This Topic: https://lists.openembedded.org/mt/85891854/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

