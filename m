Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.9589.1593704711461564103
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 08:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nDr2p8zf;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id r22so26007290qke.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2020 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihPhNbXcJI1jGgP9vU8wC1fuiUaJEPmPLJAdmIjv+c0=;
        b=nDr2p8zfY92g5fU0VPEFEWADZHNgkpHcQI+cYr1qZX8LNWcC5tZrQE9HjMq9H8xJDD
         kZJynx3zSsW4ghsmTo2ExyAGM7Rqp1NW89qoD7fOwmJBOzLWvlI5i9//dApCzASDRY4P
         iVKQ0TQ7A5zAipuoOj4wwyn1+aPBfs2GvSQ0wQk08ePVczcB0HOxCmcUZRYmI0LK8Mxz
         mHKhgFub3tEKrnFKC1j2vIou/XJ1494URfZGmMCkqK5kvEZ/gyNTFCqkRG/NYgRqbVx9
         eAuaUCNGQeQ/pbROzCfyk/jIpbS6s0qRWCKQAgdwu9GX01cm9RLKTHbAJI7N3YbNI5pU
         YBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihPhNbXcJI1jGgP9vU8wC1fuiUaJEPmPLJAdmIjv+c0=;
        b=lChoiOpGXhrNlAcBOt3bB+LNg+pDZ5qUi4dIsuoxI18h9td6Nd2GJRt+TqctAhehNM
         lp6etbIqPhXdobAnvfA7s9mP1Z6D0oMrrsdYsFRgEaU764uCMdC7yaeuBGdqyXAlHBv+
         FjSaK6xx7lmZBaY1nwxWaXnY46lhrQCjwnbspzWaC+nH4HxMHnaWU+jP7LznzfnLOHt+
         zfDXAq8QuTYoiP/TVscNImnoKvI9igkK14Miak1oYg7IVfTMOsXY5R/WUu0DTz7HqoQ7
         KxYKZLs5eMGxu2Jx4fAhDXsqGyDbrOQDkeGTroLXK3vuhPDMXiz1uATgSVYxnsH4hFj+
         fJ5A==
X-Gm-Message-State: AOAM530lcir97O2cPJKsG0OOWy6Q/FE8lfhCXJt8nyqffLywsMDuDRSL
	hOe5oVBLU/aM8XIygxt470c7yvOypo51dap/piomfgtT
X-Google-Smtp-Source: ABdhPJzWwNOb/UqY3r9to9+qTFBdObNvF3TCt1RpHYpqVtlt/JKZIPN1GYOZftNPMrKCtip/AFsDimsQ1GB9Pk5QvWY=
X-Received: by 2002:a37:46d1:: with SMTP id t200mr10208324qka.17.1593704710506;
 Thu, 02 Jul 2020 08:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <1593586888-23124-1-git-send-email-wangmy@cn.fujitsu.com> <1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1593586888-23124-3-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 2 Jul 2020 08:44:44 -0700
Message-ID: <CAMKF1sr6PUVc=zOLe=Sw8em7rNe3BujFQyc4NUbenO5Y3Hy7BQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-cryptography-vectors: upgrade 2.8 -> 2.9.2
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I took the one from Leon, since it had a better commit msg.

On Wed, Jul 1, 2020 at 12:02 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...y-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.8.bb => python3-cryptography-vectors_2.9.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> index 948aab9e0..60316fc74 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.9.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0 | BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>
> -SRC_URI[md5sum] = "a744ed29bb9ef56b3a50317fea3b218e"
> -SRC_URI[sha256sum] = "6cd32174c56a3eca72f64af43c1daacaae758cfa5ff9d280dfcf818fa11ef116"
> +SRC_URI[md5sum] = "657349b8de73959fc49ba15fd7346b58"
> +SRC_URI[sha256sum] = "99ac91c4d89572399b097240809af1b8f67f4bedf43398d290c9b2b3d9f491b4"
>
>  PYPI_PACKAGE = "cryptography_vectors"
>
> --
> 2.17.1
>
>
>
> 
