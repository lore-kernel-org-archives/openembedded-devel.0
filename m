Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.7614.1625811683483081804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cxd26B5Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id n9so6859353qtk.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jul 2021 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V4thevN0FqyzLB1geHZtP787j+oYcY7FHHU8CpYlVo0=;
        b=Cxd26B5YX7eCH35wv5cRKmwLMWRHQSEz+Tk86oGYDysML+CuuLkmEVou8LeYZQqJ4U
         jrTsjW/waJ5FBsRHBebedjX2sAvawF7ybhtfJ0fM63Ki0gzVHVLRisa8dWQO1fRwbJ2L
         pwDz101ucRMDvLH77Z3C6ktyOXeVzRbNSdy9h0dJeTGg4B0X07iZY6onfCp298wItBeW
         lE/l2iZcttDTaYQBzmDq+iXhlWUA4xVEVTqASuB7CpcP1PAs+ZdsW1IPT499hXbOCK6i
         sIDMi1g5WslxqH3UhxaaWGIOYIcPUpZo7NYH/SsBMVK7psk779IztO1kgUogRO90F/cd
         bisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4thevN0FqyzLB1geHZtP787j+oYcY7FHHU8CpYlVo0=;
        b=cV4tFwogHB0uxTHr3xhA3zJA6w/JL9ZSLVcBCcBV24bVClFeB75BLH9TjulGd7qPDt
         CBCEwShQNZdu5M1iO3u4v5iCM3C/CZknTUALlj4GJEiLraoZxcO1aEBXzFnNFWX1FDka
         Lruonk6WxJw2HuS6/Vpl0PV9NaxbVAR+Hf39UKnPCiYiopV6CB8SLk7NtQIK6Pk+dQjS
         a24N6qv0cU2P23iIzsZxH+/f+rJphMdl7dG5ofhT8MIHaYFeRdPmEOuhQ6UrmUa3HYGk
         x/lfiIXtjESkNm6au19XEPrKJcg2rYPbk88TnO/zPufEDLkhH9gskyrYvDykAu9F1t3Z
         fZsA==
X-Gm-Message-State: AOAM532IJu0QtcM2u4VQcllpno0BKhkhdRntDsFsSeLhA3iayqF3L1K7
	4/02qu5tAUcIsv7EhTUWGBtTz5q+GwrWjVEowfg=
X-Google-Smtp-Source: ABdhPJzFVjcyJK4aYQsDCR1MTMknKxl5fdh00sDwVT6gjJSsaq2ymunSEf2XYcdEUUgkDAXkrAC6UhNMSFo9aQbb548=
X-Received: by 2002:ac8:424c:: with SMTP id r12mr25941787qtm.214.1625811682554;
 Thu, 08 Jul 2021 23:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <56a974ab-248a-05a3-c072-487d1ee21de9@gmail.com>
In-Reply-To: <56a974ab-248a-05a3-c072-487d1ee21de9@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Jul 2021 23:20:56 -0700
Message-ID: <CAMKF1srhgDVZMzMs_ZPZDMimxtdQng1OYPErH+t3RC9=eW8Cmw@mail.gmail.com>
Subject: Re: Dunfell merge request - July 8
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 11:02 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit c38d2a74f762a792046f3d3c377827b08aade513:
>
>   dnsmasq: Add fixes for CVEs reported for dnsmasq (2021-05-29 11:41:45
> -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 7bd47ef6c98323c95a9e527129dca98c9a65ee08:
>
>   dovecot: add CVE-2016-4983 to allowlist (2021-07-06 07:50:13 -0700)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>       dovecot: add CVE-2016-4983 to allowlist
>
> Chen Qi (1):
>       python3-django: upgrade to 2.2.20
>
> Marek Vasut (1):
>       nss: Fix build on Centos 7
>
> Sekine Shigeki (1):
>       add CVE-2011-2411 to allowlist
>
> Stefan Ghinea (1):
>       python3-django: fix CVE-2021-28658
>
> Trevor Gamblin (5):
>       python3-django: upgrade 2.2.7 -> 2.2.13
>       python3-django: upgrade 2.2.13 -> 2.2.16
>       python3-django: upgrade 2.2.20 -> 2.2.22
>       python3-django: upgrade 2.2.22 -> 2.2.23
>       python3-django: upgrade 2.2.23 -> 2.2.24
>
> ito-yuichi@fujitsu.com (1):
>       cyrus-sasl: add CVE-2020-8032 to allowlist
>


merged thanks

>  meta-networking/recipes-connectivity/samba/samba_4.10.18.bb     | 4 ++++
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb | 3 +++
>  meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb     | 3 +++
>  meta-oe/recipes-support/nss/nss_3.51.1.bb                       | 2 ++
>  meta-python/recipes-devtools/python/python3-django_2.2.24.bb    | 9
> +++++++++
>  meta-python/recipes-devtools/python/python3-django_2.2.7.bb     | 9
> ---------
>  6 files changed, 21 insertions(+), 9 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django_2.2.24.bb
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-django_2.2.7.bb
>
