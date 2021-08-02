Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.15051.1627872378090762737
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r5FnKPAQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id g6so8240233qvj.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Aug 2021 19:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=msglQ93/BZdgFI54lHt4pcAppvJtE1HCV3BGWkthke8=;
        b=r5FnKPAQBnai03TzcHdk/hov/bwDM5SB9/wNOOUyyjNKUaazC4ihjC27SQhy0d9Se+
         o7rz7PYU1fRuzyMT8zmn59nyWSfh9ZqlIZwEtho1iDqGaQOsbDYGHyrDPcdL73elzD/E
         n7nD8kCjkAWbU+FTnAm1EVNQIjWA8rG9vw5aM6/K+Oku5nESx0kR3sZV2xmEl7aG94p2
         thvvfg25pbspJhpzNtcnqUHdmBW/jCfplukmzOzgtjiXH/45bYTf5pToCW0ffeRzUjGl
         xz6eBEjmmjs8nWJXyLL4dVhw26OxLBeL7D6qK49FutHxvLnqk+JqXjAEFEj5O+baO0Nh
         w+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=msglQ93/BZdgFI54lHt4pcAppvJtE1HCV3BGWkthke8=;
        b=pfm1CGjq5l23AscpnM+EPfdJbbxtOMTTJ8qOAp1KH0Am/Mn3/7UFUHvoVYig6L8IVD
         G49ezZGQVZAwFkwMBBGQkPTMURlZ6MVyh/Tl/nJVJSYV0VTynW2VxBW/kmp0z+mw8Gc+
         yU/ZICeM/ZqfNeqDqiSlqFzX0m+CjLZkkS4f1byJfndh9T2RMY5JwQ9t8Zmnd33hRiyx
         rFtU8x2Qw8POCWnzLF/n0NWfdfIocTAErBwEbGr56cxq17ZR7f7J68Lywcowfa4bKghA
         xatJ6qOahxvlVmRgXdH1FzS/OEEbt9B57uRn2eoyHOe6Y8c3FNFiRRob134XChyprQoU
         ozww==
X-Gm-Message-State: AOAM530FIjzolRKIPxL6qBRklGBJEEBs33pU780qsxkZoZLV+FHOcDZT
	ls2HWBep3jkAxFCrmf50nlYehPHNLWF7wWn53ic=
X-Google-Smtp-Source: ABdhPJy1kwvQbMHoTtepim+Qiu6V+26jskUhpigVQkUPf91TuZdC+gcbWIQJVUz8wS9JmgvmBWxOcYemPBDG44c5KUk=
X-Received: by 2002:a05:6214:b33:: with SMTP id w19mr14448316qvj.50.1627872377101;
 Sun, 01 Aug 2021 19:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210802020935.14749-1-changqing.li@windriver.com>
In-Reply-To: <20210802020935.14749-1-changqing.li@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 1 Aug 2021 19:45:51 -0700
Message-ID: <CAMKF1spp+vRTaLikktg4_A5PEqmcmcucJLWUtUoBqj2p8h-2pw@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH 1/2] nginx: upgrade 1.18.0 -> 1.20.1
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

can you check/rebase with latest master ? I think these patches are
already applied.

On Sun, Aug 1, 2021 at 7:12 PM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> License-Update: Copyright Year Updated
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb | 6 ------
>  meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
> deleted file mode 100644
> index ac303e47d..000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.18.0.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require nginx.inc
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> -
> -SRC_URI[md5sum] = "b2d33d24d89b8b1f87ff5d251aa27eb8"
> -SRC_URI[sha256sum] = "4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
> new file mode 100644
> index 000000000..32d375542
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
> +
> +SRC_URI[md5sum] = "8ca6edd5076bdfad30a69c9c9b41cc68"
> +SRC_URI[sha256sum] = "e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49"
> --
> 2.17.1
>
>
> 
>
