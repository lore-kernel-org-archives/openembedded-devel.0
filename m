Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.10012.1600326562478087965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 00:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l5fUgtYn;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q63so1264274qkf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 00:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Q8S88JdEXhAfoE5a/paM5s2zZSwCfDWg/7bjQOmYqQ=;
        b=l5fUgtYnP96I0dalCUdyvhLGW9cD+L/jyedFjqOVbaI9hVY1W9w0kkLTq58e08TbKl
         DSFt+g+0PZMHmKKdNcKW573dLroiaNSXptMaHxj+k8NtsfDKYMR/dtFRHQlP6eHL/4l/
         bQLWHFZjjBvUddEvgyae2sZG/dkKCIToQcU0oEK1yBZ6uEcw9He982/aLKFQjH9LXaXP
         oWUhDSAKbctw8QcJiDNthyP2WBkPFtwxHWf2n1uI22ld4WRO/ol/pjuu/D74xHy4gYNo
         L1BzKxhSXRoNbEp5y547mgUGDgPLcDMEEUoiKfDOT/YtBQlv4E1MLlXXAPKdU2KUimiB
         0P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Q8S88JdEXhAfoE5a/paM5s2zZSwCfDWg/7bjQOmYqQ=;
        b=l35ev523oiCnjnKW+XBX8+ckhZ11rObbVA4lVDEozU7VySJFH+hvLd0LQXtU6zbndm
         f/xy9yxIa1pMAnuQ0fVxIXjB2m4b0SXQNzMSFxppCE92ryS6h0aWzcSEwJdQ8Jy0uyhI
         ZTHGU0GAVRKge6/4EMcg8H9NCFDK3lw3wyMl8YWOQQuGu1NLZc6A88jQCD+ohV9SVIhA
         ry48fhsTvYh2N5vvuxKLcMcd81Jm5nF2+HghGJj4Tkp1yDNCWJh3/M6Mdqehv9DHD704
         L+DGU4DUgYE3iLBojd2f49olNNwQiQku7+/St0HqX0iCy/EdZ1Ae+QvTDB9ytoX/Xkj5
         C+YA==
X-Gm-Message-State: AOAM531qRRZl2PHbyyBkd1Sb7Bj24PFcdsEUYHV8+eqlOr8EUhGO5XsN
	Eme7udoDyN2BHC0GDLKUGgyuxon0mFG676xqRTE=
X-Google-Smtp-Source: ABdhPJwQYY1xucfI+N1gTxpW6UqNFcgTjyA/YqHRT6K9pdtgeLydh/oVTSkSAjMtb9dXdUGwUvBp1Vn3mOKrFtQk0fI=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr26875112qkk.337.1600326561550;
 Thu, 17 Sep 2020 00:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <1600348715-4366-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1600348715-4366-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Sep 2020 00:08:53 -0700
Message-ID: <CAMKF1spDKjkdwdp3ORONHztyvbG89z6ZcPqdv25Ms-RAV6J8BQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] fio: upgrade 3.22 -> 3.23
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails on mips

https://errors.yoctoproject.org/Errors/Details/498924/

On Wed, Sep 16, 2020 at 6:18 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-benchmark/fio/{fio_3.22.bb => fio_3.23.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-benchmark/fio/{fio_3.22.bb => fio_3.23.bb} (96%)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_3.22.bb b/meta-oe/recipes-benchmark/fio/fio_3.23.bb
> similarity index 96%
> rename from meta-oe/recipes-benchmark/fio/fio_3.22.bb
> rename to meta-oe/recipes-benchmark/fio/fio_3.23.bb
> index b50ed9f279..49bca59550 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_3.22.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_3.23.bb
> @@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
>  PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
>  PACKAGECONFIG[numa] = ",--disable-numa,numactl"
>
> -SRCREV = "477b6753ad068983d49fea0abc91fab82da9bad0"
> +SRCREV = "8650ad75b47d9d9f45a25f4dd46ec0a997332de2"
>  SRC_URI = "git://git.kernel.dk/fio.git \
>  "
>
> --
> 2.25.1
>
>
>
>
> 
>
