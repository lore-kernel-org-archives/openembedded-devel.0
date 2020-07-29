Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.1934.1596045596231297060
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 10:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nect6C6d;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id o2so11254599qvk.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YM655Zwj6t8bt4ODqMWerCrgaktaA/noBCvjNRIR5BM=;
        b=nect6C6deGZzAonFvPx3dVWmGgMILCdkQOcbIupUg7j1lWPfw5FAtOJMEyZ1IxmDYK
         cC/8rKlrnqEwFmZunwKYoaKD8YnmYtbZU/CE0DEy/ZicGZmG3evkxVLbSyzBISjt8tOt
         zEefYZsr8jA/+W39WGFC64ZL2xwm3VFbkWZX8uES6Oin8/3C7qbh8DXOfsCbPr5tTIXg
         TtS3rifIjci+HL7VTSY7m/7bfx4O5CsLHjzHpsmcbXXuX/WGOQHcL103rSAlRRgb1Chp
         YkvtKRjpSI1Vl1/H3MwYuOB0Fh5XsqaN5tBLj8EUWCAfiZY1NubBvXh0hL7EXR+t4biI
         h+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YM655Zwj6t8bt4ODqMWerCrgaktaA/noBCvjNRIR5BM=;
        b=X0P1yw97i/nFJ8DK7i1DlkaQIjgMxa1nrxbYlRrM3ZAHHgItFuTXROX6yxYwVUl3Qr
         gZnTzWMA1LD5sWx9YaVVne9Nf9+YWkMjbx8UHWUUNh4qgt4mIlU7T7vFS3qRAdbFLL4p
         KsXTT5X2tyi3qplsS9KHkp+N2eTv3QLV87zCnRdWfT6Dfri3Ymsrk4S82/uxQLf+OyfB
         KJnWAbZCtJRD2gt3BlwLI/y4+/gwyFfl1x0xtdaFt9XvE2f69XfMfsRsbR2O2O0OMUSV
         e/FKbL/Jbn9/iIu4kJww9rVKg+iHvxxW61iIztx5apF6s10sQ6c3rl+FsrMKaBqxciuX
         y8ow==
X-Gm-Message-State: AOAM533CFYegJDrrlE+wSFZEOWpyj65QWR2yMWIElZFS+SHKZsuVi16N
	fYTWW1HuRm7U9H6b2XCUZVEzl6rVd9lyENU+QUI=
X-Google-Smtp-Source: ABdhPJwmNAFamsuxfoXZJNktIJSFIa6oLiG8TBnk3EZMFjgaiFSycVPY3hnlKNGN5TGseiUjwywvuGCjyuzr1btHZBo=
X-Received: by 2002:a0c:b488:: with SMTP id c8mr5529466qve.130.1596045595260;
 Wed, 29 Jul 2020 10:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200729081024.2701842-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200729081024.2701842-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 29 Jul 2020 10:59:29 -0700
Message-ID: <CAMKF1spo2MghoP4CCx8P7dH_qz7sbQOP7bQzXtxfipc2-MWvXA@mail.gmail.com>
Subject: Re: [PATCH v2][meta-oe 1/5] python3-coverage: Upgrade 5.1 -> 5.2
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Leon Anavi <leon.anavi@konsulko.com>, Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"

this is already in master,

On Wed, Jul 29, 2020 at 1:10 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> From: Leon Anavi <leon.anavi@konsulko.com>
>
> Upgrade to release 5.2:
>
> - The HTML report has been redesigned by Vince Salvino. There is
>   now a dark mode, the code text is larger, and system sans serif
>   fonts are used, in addition to other small changes.
> - The coverage report and coverage html commands now accept a
>   --precision option to control the number of decimal points
>   displayed. Thanks, Teake Nutma.
> - The coverage report and coverage html commands now accept a
>   --no-skip-covered option to negate --skip-covered.
>   Thanks, Anthony Sottile.
> - The --skip-empty option is now available for the XML report.
> - The coverage report command now accepts a --sort option to
>   specify how to sort the results. Thanks, Jerin Peter George.
> - If coverage fails due to the coverage total not reaching the
>   --fail-under value, it will now print a message making the
>   condition clear. Thanks, Naveen Yadav.
> - TOML configuration files with non-ASCII characters would cause
>   errors on Windows. This is now fixed.
> - The output of --debug=trace now includes information about how
>   the --source option is being interpreted, and the module names
>   being considered.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{python3-coverage_5.1.bb => python3-coverage_5.2.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-coverage_5.1.bb => python3-coverage_5.2.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> index 7265d2c97..72558e10c 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>
> -SRC_URI[md5sum] = "506e30fb011158abe5ce92f39866b271"
> -SRC_URI[sha256sum] = "f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052"
> +SRC_URI[md5sum] = "bfe80a336636160a3916467f55842bc5"
> +SRC_URI[sha256sum] = "1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404"
>
>  inherit pypi setuptools3
>
> --
> 2.25.1
>
