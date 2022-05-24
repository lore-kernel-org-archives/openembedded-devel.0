Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F58CC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 14:50:07 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.10316.1653403801220142537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 07:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=II2bsTT3;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.44,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f44.google.com with SMTP id h11so22232523eda.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 May 2022 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=oNtyz1/bqLnM/WavDQw1UOCOKc930cwAUiry4hEbaF4=;
        b=II2bsTT3S1SxHQ0kyVBJ6O695XV51KTtVQXXUqivrvbr+jXc5jpVAxm3BErkPlJu6P
         bLzoF78DPnJZ9TFEtf7hcfCGDg1IHSYIRS0/HVfPp7fZZDgM/KQ+o7S81PSUWxMEHGA9
         SlAq/i0yxVgfbwLq9O8XdPjg0X7wi8oswTWgW4eWJgSOsIJlhDyp8JwH5K1TybXQcGq7
         Jers/eSsheFckS5Jkk1XcM6l4cU/zj5L+ay9vNE2gc5hddRAJxd7kgY395BoiHGi2k07
         NKzd7kTgZIn/XOvTicFdgbT6B4/isbGr8Tl8ZcsyHrX6hWD2x1Koft9PSkmUsG3W7doz
         tdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=oNtyz1/bqLnM/WavDQw1UOCOKc930cwAUiry4hEbaF4=;
        b=QKYwF23xWCmWfSrOoEE4Kz5mhmSFOrd3Dertu+u1yd+PfpiGtJ3nxlWQhi6KKHygHY
         0fHrTNgIfBmGgb6S2WErSZF1OedvZayahL0Je/bpd1Q5pF7i6sSBFCfvGuxkqPU7xFdA
         JHQ+p+iAdLuloz5qCGcnAyY5i8J89dIIQ176zjLRi89LMs/T2cPR3/SUiISUBu/xMTKV
         9DUVqI7wKMB664YWjK4EJoeQoHosOqaIq01dV8JfEOm5iKcgckFmjahJXUiHOmwCsQXs
         BL6rnhrD1M3VcRFYYL+zYPBYvWTU4A5LjKW/Muk6ZcqnIJECJM1oYCttPF2LFZRGhXg2
         DT+A==
X-Gm-Message-State: AOAM533LxmTZcxuaOxgi2QeiYXP5LqiH866dgKgcMF28tbOreQZNq1JN
	RBF+HXf7to3mn2sRR7QAL01DpHFsoa4huWa4DofhWA==
X-Google-Smtp-Source: 
 ABdhPJxBUl0PnCGIJsMsAZNxbrqUSb6P2u30DDY7ip/WdySmC+X6RBUe60nnfHFWrdl8qRkiHmBOWVnthStSo9WZ+M8=
X-Received: by 2002:aa7:c88b:0:b0:42b:aa05:8752 with SMTP id
 p11-20020aa7c88b000000b0042baa058752mr1051388eds.408.1653403799531; Tue, 24
 May 2022 07:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220519131827.166725-1-brgl@bgdev.pl>
In-Reply-To: <20220519131827.166725-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 May 2022 16:49:48 +0200
Message-ID: 
 <CAMRc=MfETFk_dWkd1RpgetXMJWgu=w5UAWgBVefRw51jSaYV0w@mail.gmail.com>
Subject: Re: [meta-python][PATCH 1/2] python3-speedtest-cli: fix RDEPENDS
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 May 2022 14:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97249

On Thu, May 19, 2022 at 3:18 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> There are packages missing in RDEPENDS needed to run speedtest-cli. Add
> them and use += for the assignment as we don't know what inherited
> classes may have added.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  .../recipes-devtools/python/python3-speedtest-cli_2.1.3.bb  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
> index 06d98cbe1..472113b05 100644
> --- a/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-speedtest-cli_2.1.3.bb
> @@ -7,4 +7,8 @@ SRC_URI[sha256sum] = "5e2773233cedb5fa3d8120eb7f97bcc4974b5221b254d33ff16e2f1d41
>
>  inherit pypi setuptools3
>
> -RDEPENDS:${PN} = "${PYTHON_PN}-misc"
> +RDEPENDS:${PN} += " \
> +    python3-misc \
> +    python3-threading \
> +    python3-xml \
> +"
> --
> 2.34.1
>

Hi!

This has been in master-next for days but didn't get into master
proper. Just a gentle ping.

Bart

