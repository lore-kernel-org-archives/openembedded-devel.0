Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.33318.1585215040334732797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 02:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BWARq17/;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id z5so4824644oth.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1YQuBov3Zf6QVHRGLjT/gamBiSQrYxD6G/3I09l3wc=;
        b=BWARq17/EdfoSH8NbDD47yKEOqBuE5Hg0r24NJR6jK6Jhb+by2ZvMPNSaS1TuRHs61
         kOZSxAk756q1ogQ/DM5Spm/1UON+7MHJ+qlvE6QRMI/sHokcP6rX/MPMPkmEbYWHnTfc
         iailxaxkhCKocpuny0mH6MB+QdrYN6u0yYgIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1YQuBov3Zf6QVHRGLjT/gamBiSQrYxD6G/3I09l3wc=;
        b=W7bQz0AJb/6IgpWhX3YA6+AChMDNUBnkGa91VgQF4uryuCzw89ntfxq1NmnGVzZp1T
         Qu8zpCttlbZmAhMMko67zmAaa2CFOK1eDFgVSZYLk86jLdpVKU+KtJv9xvIP6wxUCxjh
         uQCxkJAhJ3sSnUQYl48oQNVGRD7SeCqXKWKsVwJtizvVvGe0ZSieZ97q2RF8vpPHYwCp
         bilmEpJptHqSGk9DvKRF7hG/sxkTy6G9PZxwZOYWNXXBeJhAbPjTQbrrdyIOJcRrUch5
         OlArarUyv8j5rmIHmTp1YCwNkBDjzMJQk0GMPCNwVv/K4tjn3e5OalJhyYpkhKIYKOE6
         7ucQ==
X-Gm-Message-State: ANhLgQ3G0pNkUzyhi09ME4meDjELNN2SWRqzBzzKctW1mzzQ4kkYvoh7
	j87YpNVZNsQXQHTfuqyNG68mMetKM1HAFb0KQYOZZA==
X-Google-Smtp-Source: ADFU+vsW67l7/kYsUqztGdkVQ7MOek4rk8AJSs3fw+k2minp8dOvbgnYs1ulVL4tDAaHAR5sAy2ts3SluLAHCBheoDo=
X-Received: by 2002:a9d:6142:: with SMTP id c2mr5720324otk.92.1585215039614;
 Thu, 26 Mar 2020 02:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <1585210820-107410-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1585210820-107410-1-git-send-email-changqing.li@windriver.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 26 Mar 2020 09:30:29 +0000
Message-ID: <CAM9ZRVvVWvYB77q7WRbpqkvX00_PTGO7g8LjYgsW7juKSQwkUQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] freeradius: don't download LTS content by default
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2020 at 08:20, Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix error:
> Fetcher failure: Repository
> git://github.com/FreeRADIUS/freeradius-server.git has LFS content,
> install git-lfs on host to download (or set lfs=0 to ignore it)
>
> upstream has file .lfsconfig to make it not download lfs files by
> default, so we also don't download it by default
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
> index a9c2fad..005ca47 100644
> --- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
> +++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
> @@ -13,7 +13,7 @@ LICENSE = "GPLv2 & LGPLv2+"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
>  DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
>
> -SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x; \
> +SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0; \
>      file://freeradius \
>      file://volatiles.58_radiusd \
>      file://freeradius-enble-user-in-conf.patch \
> --
> 2.7.4

s/LTS/LFS/ in the subject.
