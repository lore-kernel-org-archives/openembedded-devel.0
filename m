Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D0C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:58:58 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.13376.1639065538315752379
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mgdlIe+J;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id a2so5675777qtx.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBTdQnO9UzTJaWe8LOuGrawrTgEc3d07+YSDjkbU8W8=;
        b=mgdlIe+J8xkG1gpbFx0fxaqajKatZVLxjKvjciJivnMseRaqk4t4v3CedODeAt7rzg
         n8ZPCAwgr3OG8r1o/OXd/TDFUekXUPJEAgqRQtLOCqH/suC20FVK7cQipXhBn52/8Av4
         ATPtulRgoPIEMYNlPleAqPwAOaYnPprLf8zHtJp16C662chWfqbT3hx+6WyfDyLoiT+k
         LJNpdpfcGfWtABpGtLCZzSV9EsHnD4m0WBK9g3oRmkqtET7Y7LpTvdDhv59eZVZWFgDc
         K+XWQsEz06zTI34jc6empXD1QGaF9NZtw+OImXdcFnVu3qqqOTqxER/Ox7BN/4edYniV
         Ffzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBTdQnO9UzTJaWe8LOuGrawrTgEc3d07+YSDjkbU8W8=;
        b=PGzqFgzk0Mz5FDTjlArpfzLAVFdvB2reMDM2iOJGpnjWfzH68G5WNRh3KgJnLIIInV
         s1HlSFqS8cL0Li7Evz4D0aK1o5kmYnZipw0qyemLnhwf/x+nREIkoyNuOEX0HxLYkSus
         mYq4Jqf8UBoyyKKJPnVlKcO91QVC7csvHRfa/ByajCmiZJSVLoMJLvEmhiBtBVujbBrZ
         KvqA3kaXy6a090O4WLfhwD4LoUugXzaPuPf4i9AcEGAPodnD6VE5wJfI9T4TiiDf5Lrv
         7dN15LcrkzyJKhoLHTl1p51nZTSIW8YKW+xdvaUl7lB3ejxtKjglGbnx27a4/Znvzcr7
         heqA==
X-Gm-Message-State: AOAM531+HmQWMfrbEKqtRAB7f8wDKycS8fWCJOfF4A7NkWQcy686DaH6
	axefoG3okFYfnfRMbcRec8mPmIgwrsSehucm2RY=
X-Google-Smtp-Source: 
 ABdhPJyJJtyzVMqdv6Q6EQ9MzVi4WWZ4rM+pFta/F+fjl9V9HoMOL5fAb21WeFBALcdJsTOCcUaHoXizW6AS6Pibzx8=
X-Received: by 2002:ac8:7f4d:: with SMTP id
 g13mr18705524qtk.215.1639065537412;
 Thu, 09 Dec 2021 07:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20211209150014.2294075-1-andrei@gherzan.com>
In-Reply-To: <20211209150014.2294075-1-andrei@gherzan.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Dec 2021 07:58:31 -0800
Message-ID: 
 <CAMKF1srkS7nJaG==67-f5o=P4s58xMutoPSSqHHK6TOotKD4hw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pymetno: Introduce recipe on
 0.7.0
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Dec 2021 15:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94263

On Thu, Dec 9, 2021 at 7:00 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../python/python3-pymetno_0.7.0.bb              | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
> new file mode 100644
> index 000000000..453f66afd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Python library to talk to the met.no api"
> +HOMEPAGE = "https://github.com/Danielhiversen/pyMetno"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
> +
> +SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
> +SRCREV = "15f1e887aaaba3bf243cc8f88eb761e0ad85c355"
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "\

This should use the new override separator ':' instead of '_'

> +       ${PYTHON_PN}-aiohttp (>=3.6.1) \
> +       ${PYTHON_PN}-async-timeout (>=3.0.1) \
> +       ${PYTHON_PN}-pytz (>=2019.3) \
> +"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94261): https://lists.openembedded.org/g/openembedded-devel/message/94261
> Mute This Topic: https://lists.openembedded.org/mt/87613192/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

