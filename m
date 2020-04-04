Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.4775.1586029397589019691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 12:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UfqCadWj;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b62so11928512qkf.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 12:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13rpr/okxyKSiyLhf32SEhhZ69oOJD890ZnXl15gMbg=;
        b=UfqCadWjt6UuCkry40YLJubAHi8G9ktUafwD/toMssIc0PGtpKxGmxv3tCML7YXv5h
         2H9p50g6iBhjE3PDbWmumXSf8vpuPRvEO+WwgfNmbohEd0OJ/gw8FL/A5qs1vjC8jImF
         bqxI+rUX9IruDZegBkgGFW24d3gBOLKVpuwzgL5DOG4kcYUKXXRc+rzw14DdM+ub7SlB
         VlXu+Y/Ul2d5q9ADf7sSKl1qa+JYK4D2PXscmqlhSJTyB6yRtL2wFAiEwQJSogVKOEAn
         4askb0it/s7PgZZORWfFaaT0miO27pqb358YZt6dkrXQqHRRw9S9E8roEJc6YhUjFfck
         tJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13rpr/okxyKSiyLhf32SEhhZ69oOJD890ZnXl15gMbg=;
        b=q6wwq/ODpTmVZFJdea+5hoVJbfkoL00qjitvazgnkcHi1jYgKF5+oWhEKTqC9l1S+J
         nAr63ouA4BiWq9AkDN15QbaecyDswMJwnWHZhhox+HNTnAsWQU31J9RcixUTA5ykbLow
         6x/kbLMwLAvOa/GBk1pyyXHZnm6b5obaALnWs7WczKSmzWLRkQVOMyhxqoO705C1EWSm
         kpqD3J5WFvkfpQiCtReCPZ9rrj3jeTFx5uDtaRn06Ys4ZBiJljRi9WqGKyypaivOwGiX
         5nM189Jpj7gUU5AK40qZARVunJHPvZIP90qiRKP3B/w/S6YpmtBs5NTor2zTB1HbNy41
         aHVA==
X-Gm-Message-State: AGi0PuaW2RY+qJfEth/ptOzNJom4utFGVa+fPb9wF8Yt/SIx74g4Jf1x
	/U5uiImBcOeVffODBgWhmvSbEJChIkImOW3nGsY=
X-Google-Smtp-Source: APiQypKBqMGZEklBsORBGNzFlNRHpLNss92rrzRCQbapQKpXEPB4K2HqoTmyppZOEv9/a7KDDg8cXDONLjnLQ0Lf7e8=
X-Received: by 2002:a05:620a:10a8:: with SMTP id h8mr15050151qkk.215.1586029396552;
 Sat, 04 Apr 2020 12:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200404171251.19823-1-derek@asterius.io> <20200404171251.19823-17-derek@asterius.io>
In-Reply-To: <20200404171251.19823-17-derek@asterius.io>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Apr 2020 12:42:50 -0700
Message-ID: <CAMKF1srJ3qarFKdVmN5FOBXwOr4N2=Tst02QGWmZMkO0ny++0A@mail.gmail.com>
Subject: Re: [oe][meta-python][PATCH 17/27] python-smbus2: consolidate inc and bb files into a single bb file
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

we do not have python-smbus2 in meta-python, I wonder if you should
rebase on master-next or master

On Sat, Apr 4, 2020 at 10:13 AM Derek Straka <derek@asterius.io> wrote:
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../recipes-devtools/python/python-smbus2.inc | 19 ------------------
>  .../python/python3-smbus2_0.3.0.bb            | 20 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python-smbus2.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-smbus2.inc b/meta-python/recipes-devtools/python/python-smbus2.inc
> deleted file mode 100644
> index 0bab1a4342..0000000000
> --- a/meta-python/recipes-devtools/python/python-smbus2.inc
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
> -DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
> -HOMEPAGE = "https://github.com/kplindegaard/smbus2"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
> -SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
> -
> -CLEANBROKEN = "1"
> -
> -PYPI_PACKAGE = "smbus2"
> -
> -RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
> -
> -RDEPENDS_${PN} += "\
> -       ${PYTHON_PN}-ctypes \
> -       ${PYTHON_PN}-fcntl \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> index 6149e35c9a..7466b5b6b8 100644
> --- a/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-smbus2_0.3.0.bb
> @@ -1,2 +1,20 @@
> +SUMMARY = "Drop-in replacement for smbus-cffi/smbus-python in pure Python"
> +DESCRIPTION = "smbus2 is a drop-in replacement for smbus-cffi/smbus-python in pure Python"
> +HOMEPAGE = "https://github.com/kplindegaard/smbus2"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "d5ed5acc889b4770a84cc932853ed20a"
> +SRC_URI[sha256sum] = "210e66eebe4d0b1fe836b3ec2751841942e1c4918c0b429b20a0e20a222228b4"
> +
> +CLEANBROKEN = "1"
> +
> +PYPI_PACKAGE = "smbus2"
>  inherit pypi setuptools3
> -require python-smbus2.inc
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-ctypes ${PYTHON_PN}-fcntl"
> +
> +RDEPENDS_${PN} += "\
> +       ${PYTHON_PN}-ctypes \
> +       ${PYTHON_PN}-fcntl \
> +"
> --
> 2.17.1
>
> 
