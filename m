Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4942C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 16:19:20 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.14909.1677169154512474120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 08:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=enF1zByX;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id bg11so13145730oib.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 08:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3sXpHTYQ1xfbPqJFs5aiZq4UYq8wQM/OP/EfGWNQxco=;
        b=enF1zByX3PqxNK0l3hDJtg1ae6aN8mHMGBkHuaLvMxBBzQqaSXm2JMBMAGv5aUXcln
         +gEVq3yPUHDJ+Ixx4NyyJQLbTEocKWyod24GS1+Kr8Z3iHlw8hyUCM0D+SmF7IKcjnvo
         WsaBO1aGAT3lm7rgad4U/NAxh3k3rhV1r5oCFmHDFr7pKp3fukYs8DF4uHsLC9phHEXq
         gqCBD2k/JblxWtY1ZexiipNTMiuj7c8gwgqAphYOrPVXiP4Se4fxmB4Gx3SVeiRHhaVP
         uTpCyw22rzwmko4Eg0jC5EPKeOQJyiE8dA9mKTA5qdZn1GEcAkv3LeNqOPZTVWE3j1DK
         WtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sXpHTYQ1xfbPqJFs5aiZq4UYq8wQM/OP/EfGWNQxco=;
        b=a0eKliBQqCNEV59Z6/bYkSXm0JNXNyoFw6EAZQtXCOEtR0ZA6wyUNEYOXm7dlrAR9L
         M0mMU5cElHw9xJ8Cnueqei3CBAk+fMOhjPJtgUl/mvjVmvkZLNYy+psaaFod2AEDnm4c
         yGriwQ65770V3eWr64+z4ua+gWYu+2ItoYPhA9MaNvzHeaZ4GJ1BsuxUpIqU/CX+Z6lA
         2yKx0RgmxqZIS/fAEy+JvMtg3ZRYKgOqu2YXey4iQDzI0bQ5ZgUTcx2WegBIdmG8t8I0
         SfJyz2uZvK0pqDFGP2A6uxICs6Sn36H9PblrSk/ytvAK3jS0NudnhX9Us11NRJ9ln0Ye
         vtkg==
X-Gm-Message-State: AO0yUKWpExkF1z9LOo/18DR/FDeU5cSERWJ11PqgSBXfR6L+oiLH1oXW
	7PhVvFEzkyGFsSwW8hjw+X7kt3AgiCeYX4NMFEB4MNPu
X-Google-Smtp-Source: AK7set8Q5+6Pu2L6WRFUD0RLYEJzluj734tG2sUw2m8l7XaBwp9yTlmqDVl7VugaykgAKnLf9bdK9J/7GORcmcG/XoE=
X-Received: by 2002:a05:6808:331a:b0:37b:592b:ec39 with SMTP id
 ca26-20020a056808331a00b0037b592bec39mr1724768oib.262.1677169153451; Thu, 23
 Feb 2023 08:19:13 -0800 (PST)
MIME-Version: 1.0
References: <20230223155435.3361790-1-dragos.panait@windriver.com>
In-Reply-To: <20230223155435.3361790-1-dragos.panait@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Feb 2023 08:18:47 -0800
Message-ID: <CAMKF1so5hRT2_fBuHdntJQwQgioB1kWgRXm=hJxD4Ju2jfSa5A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] plocate: add recipe
To: Dragos-Marian Panait <dragos.panait@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 16:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101236

Thanks for your contribution

On Thu, Feb 23, 2023 at 7:55 AM Dragos-Marian Panait
<dragos.panait@windriver.com> wrote:
>
> From: Catalin Enache <catalin.enache@windriver.com>
>
> plocate, a much faster locate
>
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> ---
>  meta-oe/recipes-extended/plocate/plocate.inc       | 9 +++++++++
>  meta-oe/recipes-extended/plocate/plocate_1.1.17.bb | 9 +++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/plocate/plocate.inc
>  create mode 100644 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb

I think .inc is not necessary here, since there is only one recipe.
Please squash it into .bb

>
> diff --git a/meta-oe/recipes-extended/plocate/plocate.inc b/meta-oe/recipes-extended/plocate/plocate.inc
> new file mode 100644
> index 000000000..166fc2d56
> --- /dev/null
> +++ b/meta-oe/recipes-extended/plocate/plocate.inc
> @@ -0,0 +1,9 @@
> +SUMMARY = "plocate, a much faster locate"
> +HOMEPAGE = "https://plocate.sesse.net/"
> +DESCRIPTION = "plocate is a locate(1) based on posting lists, completely replacing mlocate with a much faster (and smaller) index. It is suitable as a default locate on your system."
> +SECTION = "base"
> +LICENSE = "GPL-2.0-only"
> +
> +inherit meson pkgconfig
> +
> +DEPENDS = "zstd liburing"
> diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
> new file mode 100644
> index 000000000..ef36754ba
> --- /dev/null
> +++ b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
> @@ -0,0 +1,9 @@
> +require plocate.inc
> +# GPL-2.0-only
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://git.sesse.net/plocate;protocol=https;branch=master"
> +
> +SRCREV = "7e5defd4e7e075cb9226e7d2d9a80f943c482d11"
> +S = "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101235): https://lists.openembedded.org/g/openembedded-devel/message/101235
> Mute This Topic: https://lists.openembedded.org/mt/97185549/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

