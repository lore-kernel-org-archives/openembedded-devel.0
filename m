Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.392.1616601316623756574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 08:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n7up48eZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id q26so13232819qkm.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3MOGLnvxzC+Zkng0BHcTXntiYXymPj1lrsTdJb6iyM=;
        b=n7up48eZ/Y7ZZI15aeOSdN1MJbb6AnCVjTvGoG4eZMiyWDwJRyQ8rwHFnEGALcyrtq
         ZvIt+xapbd3rW0rjjQTj3IPASLqsYbF8WtX/gxxLNHIn9Apgr/lMQ+1e23+xfZNdpgHY
         23bISB+ROw2vvn/sErZPt+AHQQfq66HQpOgcQMb/DzKXtHBLQQ3BG4riBM9lz50RzJm3
         LN8Sp38PQg7DjIFZHypfUGVihHHQ40G4COJv62ifpMJmo+/EX2qeDPjbQsnQkVFc5vXx
         AhzrHAjGPPHPAkhaLg77SUA9MxX5E+/fbEhsy+7w0OOxFu86GEgsxbHVo8EjioTD9NvY
         VJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3MOGLnvxzC+Zkng0BHcTXntiYXymPj1lrsTdJb6iyM=;
        b=Oe9vf9Juw1KiJuXod0cmccnZGqOlcsjWVPq6AzwrkIHfF00M8c8fzR0b1wc4f31Q5r
         u1L5zZjvEmybhKg6BbCr9859HhswMy3nFMrYyOf00qnDPv4qDJNwNaWI4G5jTsEKSm7a
         1VZxZ5F9Oaw2qzpRMJEqiU8OrUXUbRumikZNf6ABt0glIZhmNbKLFb/P7fryWefJH2jU
         fh6uQVOln/hfPUY1Kzovgsce3dxFEF8ivhCG8WfdOXCr2LUxAnQiGVQtgS5vkG6tAUrq
         79eSiWJIS8deWPL4ES7ETy3eGFmvKjmD8f9tY71bsCSiWW0/35mIMcifrolA5kIr9jbH
         2Fqw==
X-Gm-Message-State: AOAM530pjf5H9RauCIx3Kliw6SNAxfhPifKUJqM3zEiTEVKVvrfFUABU
	Jiei+p6ttMHzBd1qQznlFzZZmi1uvCwJTwoN7EQ=
X-Google-Smtp-Source: ABdhPJwtP+bKD0jnwKqhyhUvoUWXQo6dX8n2I9GBvwh4UYaWJQ3kUAIOiv1cXAWAl7CZn/tTBn0BXPJefQJDzTT7Xo4=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr3792884qki.25.1616601315520;
 Wed, 24 Mar 2021 08:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210324104629.3484418-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 24 Mar 2021 08:54:47 -0700
Message-ID: <CAMKF1sonuwqAgSp-QzLq9eC879q9weuUgr6_NxLNDUiAs+waOQ@mail.gmail.com>
Subject: Re: [dunfell][PATCH] guider: Upgrade to 3.9.7
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Peace Lee <iipeace5@gmail.com>
Content-Type: text/plain; charset="UTF-8"

there is v2 in master-next which I will send once builds are done.

On Wed, Mar 24, 2021 at 3:46 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> From: Peace Lee <iipeace5@gmail.com>
>
> Signed-off-by: Peace Lee <iipeace5@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/guider/guider_3.9.6.bb   | 39 -------------------
>  .../recipes-devtools/guider/guider_3.9.7.bb   | 19 +++++++++
>  2 files changed, 19 insertions(+), 39 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.6.bb
>  create mode 100644 meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> deleted file mode 100644
> index f059002161..0000000000
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY = "runtime performance analyzer"
> -HOMEPAGE = "https://github.com/iipeace/guider"
> -BUGTRACKER = "https://github.com/iipeace/guider/issues"
> -AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> -
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> -
> -PV = "3.9.6+git${SRCPV}"
> -PR = "r0"
> -
> -SRC_URI = "git://github.com/iipeace/${BPN}"
> -#SRCREV = "${AUTOREV}"
> -SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
> -
> -S = "${WORKDIR}/git"
> -R = "${RECIPE_SYSROOT}"
> -
> -inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distutils", "", d)}
> -
> -GUIDER_OBJ = "guider.pyc"
> -GUIDER_SCRIPT = "guider"
> -
> -do_install() {
> -    python ${S}/setup.py install
> -
> -    install -d ${D}${bindir}
> -    install -v -m 0755 ${STAGING_BINDIR_NATIVE}/${GUIDER_SCRIPT} ${D}${bindir}/${GUIDER_SCRIPT}
> -
> -    install -d ${D}${datadir}/${BPN}
> -    install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
> -}
> -
> -RDEPENDS_${PN} = "python-ctypes python-shell \
> -                  python-json python-subprocess"
> -python() {
> -    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
> -        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
> -}
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> new file mode 100644
> index 0000000000..2b799fd5e4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "runtime performance analyzer"
> +HOMEPAGE = "https://github.com/iipeace/guider"
> +BUGTRACKER = "https://github.com/iipeace/guider/issues"
> +AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
> +
> +PV = "3.9.7+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/iipeace/${BPN}"
> +SRCREV = "c87269d6d4669d12c99a2a7b9b07c39a5dd24ac6"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "python3 python3-core \
> +        python3-ctypes python3-shell python3-json"
> --
> 2.30.2
>
