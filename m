Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.12706.1611773987918265468
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 10:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kj+HNhNJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id n3so1571574qvf.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dfbjtCRy93hTWTGh51qIA3D7Ae5Xs/Afol1CHZ46grk=;
        b=Kj+HNhNJkWzmtAhR7LzBgPkqCi5bMmv+8XE+mHdV3DPMjrRQMG44pLuZ9XoyMLVIOv
         9cKiGgmaouWwslJzkAKHaRrnPg8RlcGJE/ry5+6q30gtPAV/VqrZHx7kzdKTVny05tje
         dxoCJ+ts1qTYOME+qSfB9/NOTiWb+dU3bRa7SnzVW8gZXqafLkc3VvVIzjctwJnzWS+9
         f5NrnQ5YGIc9bfFS2lMiC9biJA4sBU5LipNiG0VA9I84Gu11h8JSPQ5vooCJyl7LSjIp
         AXf8aps6+0p5jTO5oT51KDR96ZMWFUhrqmW6TLsF/ntqIvsURRHOnXc5EsSRc+G7w/C8
         7Asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dfbjtCRy93hTWTGh51qIA3D7Ae5Xs/Afol1CHZ46grk=;
        b=VmDhrpYLUyx3G819PoR/XnmBL6RLkYfYKsLuz6PkLoOTvFJYqMJh2K5qrD49eE7el/
         reAiiZ3TP5LzK1O724BlvhbXD2yai/8H1dbV9y6c8BkJbM8uX/025vBiuXhsgnNawTPR
         HBjod97Xc+vRZ2Cw5wVOU1vaABgZ8sG3WX5bKZ3gfvfMTIDFbMHHDdguZUOgWXsQWg29
         +ApKs4Lmk99vPYbM9SNutPs5P085jNiyV/SEJlHyOWphOGaG5sGjwEkjwftJ4zDTxQYD
         pZHoch+/O3Z1wAszWBOtop/Trbsavp7r0PYFaOSd8TJj3hUQIekmL+0eZON5nh4bdmEI
         l6rQ==
X-Gm-Message-State: AOAM532bMtxtZhkH8fpH2lugad3N+wlr4javnh4ab91IznN+awjoTYfo
	stkKzGMBQkyb8nx3ogH3Hlq/br8IPJnDLJiWMgE=
X-Google-Smtp-Source: ABdhPJyNi0TLLLFMNo3qPxPV0va81ITcjvqxl5sFAFnkes0niRUgoAeaxAh9ebiRI6KCtVhWwo9l9ymPWuW3xafMvpY=
X-Received: by 2002:a0c:c688:: with SMTP id d8mr12109625qvj.8.1611773986987;
 Wed, 27 Jan 2021 10:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20210127155538.12229-1-leon.anavi@konsulko.com> <20210127155538.12229-2-leon.anavi@konsulko.com>
In-Reply-To: <20210127155538.12229-2-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 Jan 2021 10:59:21 -0800
Message-ID: <CAMKF1sp6oJT88VeGJL69aPe+nUNCjyGQ0m169sje2Q0q+J=40g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-portion: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 7:55 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Portion is a Python library providing data structure and
> operations for intervals. It replaces python-intervals.
> Release 2.1.4 brings:
>
> - Much faster get, copy and | operations for IntervalDict.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../recipes-devtools/python/python3-portion_2.1.4.bb | 12 ++++++++++++

this needs to go into packagegroup-meta-python as well.

>  1 file changed, 12 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
> new file mode 100644
> index 000000000..d08d3e725
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Python data structure and operations for intervals"
> +HOMEPAGE = "https://github.com/AlexandreDecan/portion"
> +SECTION = "devel/python"
> +
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] = "58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.17.1
>
>
> 
>
