Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.382.1600983394214771136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 14:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LnUX4a9y;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id z19so796054pfn.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIXLFYjBW8Rrh6nVmmH12qMuWGKXk1QFeIuqFz1Z268=;
        b=LnUX4a9y0HmrF1gLJ2PiEBNuSnk6nOzh4oykf8V5LjJLTdLy2NgG4ickdxlz+YPDgO
         tq7H0m6tA2I/7maiOlqZSVFvzUx6MPKBtNI8NflVHR9D9uQlsRltG38ROCd6zMFGFhii
         rYD0HQ8qzUGrRVQDiQHHVtqK4rVWfGSyJbm1EyhKAhPWaD/y/VTTVV4BD//hf1K7rJSl
         aU0ehHOKZAuHJAqfDqlszJH1hrIbsZ79j8k9+I3rtVlz2rw5eTZWpXjf6TSaTPaWhSeK
         4qTa9BjhwkiVh1NLx84UKIMoAwckSupKWCsyxMudjHOtzQCXTJDlc8fv17LGXaH4uEbS
         kuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIXLFYjBW8Rrh6nVmmH12qMuWGKXk1QFeIuqFz1Z268=;
        b=Bj1HH8MK2/D2TPymoKd4TkInrOxrwQibjdTTKLRRqmLCW6L3IhwaTtt5JYaap/irfN
         piOZ95EH1LuAOI6FayB4pp73cqqaMhMl/+47F7p2RNUg08ETlH0Rm4JGiLWdvZwM74+V
         PWA+hnwHzwHq7+mWwMOroeRoyGSJf0rQMrbHw4/VtbxOpOXuDtqWUvPtU7Z8kMrAl8QP
         v00LzWuvSv7Afp0JaG99r9NEOYnPryadHByVhz/C7oY2MwEk6+o79tE3a+SYfQBoe6U0
         5rCRrLpDPNxj+oJcFS53W/qzcYGFU3Jyr/AsayjQ1i6mvi5fPYemwX3OUCp+5BbFdlD/
         wLNg==
X-Gm-Message-State: AOAM530FL48YEqiNJIhX5yu+DpLFOwusGkDGpf+gr1MNysTTZdjQd3XG
	wVbIV+MCwyP+y+7kMIm7qFaCwnn66oLag1hnYl0=
X-Google-Smtp-Source: ABdhPJwAc9GKRSNQQcAzissqfL+lkqscd30wZ1FDVjqNVccumvMq4w3xgtLKcEH+qWz/4tBU3Qq/0a1pMf8F4Y6q750=
X-Received: by 2002:a17:902:ac96:b029:d2:6394:3a3f with SMTP id
 h22-20020a170902ac96b02900d263943a3fmr220365plr.60.1600983393592; Thu, 24 Sep
 2020 14:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200924093539.23693-1-kai.kang@windriver.com>
In-Reply-To: <20200924093539.23693-1-kai.kang@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 24 Sep 2020 23:36:21 +0200
Message-ID: <CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] crda: rdepends on wireless-regdb-static
To: kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2020 at 11:36 AM kai <kai.kang@windriver.com> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The wireless-regdb has been moved to oe-core. According the commit
> message:
>
> wireless-regdb-static should be used with kernel >= 4.15.
> wireless-regdb can be used with older kernels and is mostly
> irrelevant here, but keeping it in meta-networking would
> create needless recipe duplication.
>
> it should replace runtime dependency wireless-regdb with
> wireless-regdb-static.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> index b380eaf94..e59d2f437 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> @@ -35,4 +35,4 @@ do_install() {
>      oe_runmake SBINDIR=${sbindir}/ install
>  }
>
> -RDEPENDS_${PN} = "udev wireless-regdb"
> +RDEPENDS_${PN} = "udev wireless-regdb-static"
It was wrong/at least dangerous before this - but the operator '+='
should be used

Andreas
