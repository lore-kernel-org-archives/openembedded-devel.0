Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.10438.1629867302446074156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 21:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Em8qqyMI;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id v1so13037705qva.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Aug 2021 21:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BQsUFUumD8kvThZCEDdUYkZzNrC8dIUc2z4lgfOVi60=;
        b=Em8qqyMIWL5cPfLexXVzUzDGWND9zhAuFGRcJUuu39N2L7ZR0q/V4dmOBS7q2YeqMO
         k1korH+aP4Cn8SoPlcL8c1pU/1rYWgJ8Ih0/Hkabr6a+rI9t0Ug70HHxruN7n1n6jvda
         xVSr9WZkO0tBd/11BvQFd1FkDDxiUDWz+GzcAS2JRNq1k/1mBoYWoBu5RPQFMXaimeR7
         Xok0KVnTDbgJy7IlwLQXA8gdnm2FITXTucy8TosiPfwk3VEnm130+dwhsifSmhaH8PFy
         vLQUrODI2Mlma2pjFZ8w+AijejTyZbd50815EowApxETF5CL7FoWDLlbt87aYUnwSREX
         bwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BQsUFUumD8kvThZCEDdUYkZzNrC8dIUc2z4lgfOVi60=;
        b=bQ/D9kIbsTAjHiEilppEBpRuibnuSwld2dGnQitaVWOJX9gPoC2h6YfppZqWhDSigK
         ffWdg8ADhYL1CVKsNCQwEKmB4lYN1pcb+eyFjN4VSmtoJGBIzY7JKZupGh4A1Uef8zoX
         edONPPkUVtHrfdp+FCag45IGH1ot+mNwCSzOma91VyvaTJsLq4fsq42Jb7dogwYYgxIK
         TL+N6e0EkZswE8F/hltYMsThhUzwkx9PnLwb/G7ol7pbwFHxDWADWWIukUTJy+izqX1s
         FljBN4CU58nhBV0KMajbv1Ifl3WX4WrVaJzLLMWCVR3M1nhi6nPfl90Q0DuIIuR4Js8b
         c2Fg==
X-Gm-Message-State: AOAM533nzTemYfKe1Swb+1cqqLpaBdE4ESB9x304ZExNVQ8r2dRSHwmY
	nSImgC13rFk8WXlJuFtGAGfr4UE3R64q5G3pVVo=
X-Google-Smtp-Source: ABdhPJxIuXq+s3P2nIX7SdqLB+ZQpQtn0JLDBsCQvSABmisfSN2eHk529CTJDP1DAY9dnUIBcsgwnwewm/6yv8/izkk=
X-Received: by 2002:ad4:59cf:: with SMTP id el15mr15512860qvb.55.1629867301563;
 Tue, 24 Aug 2021 21:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <a131f078-9c98-5677-6660-484595441866@gmail.com>
In-Reply-To: <a131f078-9c98-5677-6660-484595441866@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Aug 2021 21:54:34 -0700
Message-ID: <CAMKF1sr5cEq57G2gOADDzzOvtcQOfu9WS0FjvoDzBz-JMwmHyw@mail.gmail.com>
Subject: Re: dunfell merge request Aug 24th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

merged thanks Armin

On Tue, Aug 24, 2021 at 9:25 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 85f8047c71047d93cf79a954142157f85079968d:
>
>   php: Upgrade to 7.4.16 (2021-07-26 16:05:08 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 4a0d93d250576177e1237fa559f55c4f9d371809:
>
>   nginx: fix CVE-2021-3618 (2021-08-21 12:16:49 -0700)
>
> ----------------------------------------------------------------
> Anatol Belski (1):
>       backport: xmlsec1: Fix configure QA error caused by host lookup path
>
> Jate Sujjavanich (1):
>       ufw: Fix interpreter for installed ufw and test ufw
>
> Joe Slater (2):
>       php: move to version 7.4.21
>       nginx: fix CVE-2021-3618
>
> Kai Kang (1):
>       libdbi-perl: fix CVE-2014-10402
>
> Khem Raj (2):
>       fvwm: Package extra files and man pages
>       fvwm: Fix build time paths in target perl/python scripts
>
> Michael Opdenacker (1):
>       bigbuckbunny-1080p: fix sample video URL
>
>  .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb     |  2 +-
>  .../Add-code-to-detect-openembedded-python-interpreter.patch    |  8 +--
>  .../ufw/ufw/setup-only-make-one-reference-to-env.patch          | 14 +----
>  meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch  | 56
> ++++++++++++++++++
>  meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb              |  4 +-
>  meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb}   |  3 +-
>  meta-oe/recipes-graphics/fvwm/fvwm_2.6.9.bb                     | 23
> ++++++--
>  .../xmlsec1/xmlsec1/ensure-search-path-non-host.patch           | 22
> +++++++
>  meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb               |  1 +
>  meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch    | 89
> +++++++++++++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc                    |  1 +
>  11 files changed, 199 insertions(+), 24 deletions(-)
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2014-10402.patch
>  rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)
>  create mode 100644
> meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
