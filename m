Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.1615.1611594553591207108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 09:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lSntM6qK;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id h15so5544193pli.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQEPSY5B9DJNI2Pa8M868eObdbE0Oh/HOptl3b9JDrg=;
        b=lSntM6qKJYq/i1ZHaY/2Mnp1GfukOlYLPlXlHz8KzuXG7nuavzlVJzFpwe9jK39Q3D
         4gAYO1tllKoHsn+aSlTJsguRqg6DTyhv0srVuVvAzzQm6vSHJcIlnHzkZw89fhp3vWBB
         QRbwl1swYy7gN2OMjHD+AjsacWsWznO/ugJKd7+RsVZsADXtvR0QPyL+0KAy4tbWlU/E
         BjzcxiFpRedcf1V9BhekYkSo+zfmhWSxZ7ACY/McSX+3lp3r5iWAj4Bpha8M7ixPDKFU
         gCJzxCGNApQSNJEhwXKILEBoYE24NDwaa+/hCejYzMe+dp1axWaUep2dOT8J5LL62SWP
         EqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQEPSY5B9DJNI2Pa8M868eObdbE0Oh/HOptl3b9JDrg=;
        b=gbr21U5m2Qa+5lP0TDlzZQZYuPIJ0zFttvrdUNJOjozjvjDRgSuSBkb4VTY0QZnnUO
         R3IY3UYAKyR5qQJg/uBKCSVUplaES4uSH1sXGAn/9KGACfL0magsgCncOWiGjQwOPZYk
         zeapT1Y2E5CNVbfO+QuPWFv8xZcXxyYYiSAd36UEdht2hYUQ2Bpq50oiWrGdaJ9tRUGn
         oios8Zivyie55eoIFWWO57P816e+7J5WUW76lOHPhLv+z09CjS1SjigP0Iuh1j3SBZtl
         RAOwTC72Y+dmkcjjvfOKkTM3l8aDeMVwzznGXiH4kXcNag3FPWRv5DQVrGXTs0yL3TX+
         iXGw==
X-Gm-Message-State: AOAM531vR2WwWGYLJBhjbLaa3kVHq/E5l4jeuyfbUmKVfZD/XfmrRs2F
	iUZ9nqmPS7OjW4p62VQiHdXkbQZpr0CbEgn5s+c=
X-Google-Smtp-Source: ABdhPJyIazwYWPkvd0cHA95dSAQQinYupjkQ5nIaW3r6QwUi/DHRnpky1Pg35MiM+EVPgVT/jWDYKnRUNk8vC7Z4Exo=
X-Received: by 2002:a17:90b:94c:: with SMTP id dw12mr1157830pjb.77.1611594553198;
 Mon, 25 Jan 2021 09:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20210125163136.2497652-1-adrian.freihofer@siemens.com>
In-Reply-To: <20210125163136.2497652-1-adrian.freihofer@siemens.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 25 Jan 2021 18:09:01 +0100
Message-ID: <CALbNGRR2FXO1MRnfUpfND_N+rBrRZ9AO4fV0cGK1UWfPc=pU8g@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH] networkmanager: add missing readline depends
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 25, 2021 at 5:31 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.28.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> index 1053bdd42..7338290e1 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> @@ -17,6 +17,7 @@ DEPENDS = " \
>      libnewt \
>      jansson \
>      curl \
> +    readline \
>  "
>
>  inherit gnomebase gettext update-rc.d systemd bash-completion vala gobject-introspection gtk-doc update-alternatives upstream-version-is-even
> --
> 2.26.2
>
>
> 
>
