Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web09.15186.1607237142150826884
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Dec 2020 22:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AMkAnyOf;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id ec16so5022340qvb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Dec 2020 22:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oYsxfMORPmNbYcq5mC+mgInjO3HViKCiiXP6pcEYPZ8=;
        b=AMkAnyOfGG9OFAQhW/sbTyyDF/IESW2sOxJB0RbytfCGvOqOAjJwjr3c8D3wz6sq6s
         fPTOvTIR/gf3fjSf5tusc7/G0TZLLVN/c0XdRaOkh0Wk2SmSHTUBuUE//N4pM7ab+H6j
         g6PeN3vOrpWYFjlsX0mXE6ez+g+Ihw32uZGDQ9HDwHKaRYvoU6L5M18tul/rYXztlODS
         IS36DMDr1rTDOTnS9QbD/ivoeO8/IUolHQABrBuLuK6m96CtCU1n/r0bXcwQBLYgjm57
         rK8OaHEuVw8+CugoP1mZx6OWSlQ/3y8ju2Fotq9mlVUfLTuHKRS2/RreYfkmdW6Na0cH
         azCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oYsxfMORPmNbYcq5mC+mgInjO3HViKCiiXP6pcEYPZ8=;
        b=Mouk75UT5S7em+EVCPSrg9HegLO7+WHfpTO+AAOaZGUj0h0vF/IteDKrcJA9NJmwcp
         R+zylSvp9CKV1RX26VNXur0mjHVK5VN7f152EfxkCttdQ8WGsgoiEmfy0wAKpQevb6ND
         MFe+G6be/MJZOuRDtyuF+8SrmaBZ3n/FqYGekLQdmsYOhWwkF3xNRXaUlPWYh/GHZyyi
         uVqc43epPbTeG8W13WnBwdNj/QGvHQDw8LF65wRQFmSFCiyZKpXa20yfqxst2rnA5Kp+
         W6P2WRgB6iaRyp+MBmqvCaqIWj8W+1DoPa8+D4EMNgQB3dEUYLaLs12knn+pgWmSinoa
         jpXg==
X-Gm-Message-State: AOAM532+jQoelBpgBMdDEXuCCSgZ9K+oJJCfmT4anlaTycqWQYGKRbiF
	4mE7CgsuOiRm8aaT05Szt37ha7YRriphfXE51s8=
X-Google-Smtp-Source: ABdhPJwx4EeUaoMEbpZikpq/NA/adcYX/YIge7dViXybkAc2x6fI9rVSRwpgQxnET12xE8dpqPmdW2cOMTds1AH8REI=
X-Received: by 2002:a05:6214:21e6:: with SMTP id p6mr14864115qvj.8.1607237141211;
 Sat, 05 Dec 2020 22:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20201204040829.38707-1-twoerner@gmail.com> <20201204040829.38707-2-twoerner@gmail.com>
In-Reply-To: <20201204040829.38707-2-twoerner@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 5 Dec 2020 22:45:15 -0800
Message-ID: <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 2/3] glmark2: update to latest
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 8:08 PM Trevor Woerner <twoerner@gmail.com> wrote:
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes from v1 to v2:
> - Added. I had forgotten to submit this the first time.
>
> changes from v2 to v3:
> - Fixed do_compile for wayland.
> ---
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index 320d07dfc..209230572 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -9,13 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
>
>  DEPENDS = "libpng jpeg udev"
> +DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
>
> -PV = "20191226+${SRCPV}"
> +PV = "2020.11+${SRCPV}"

this version change is not upgradable i am seeing

glmark2-2020.11+AUTOINC+784aca755a: Package version for package
glmark2-src went backwards which would break package feeds (from
0:20191226+0+72dabc5d72-r0.0 to 0:2020.11+0+784aca755a-r0.0)
[version-going-backwards]


>
>  COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
>
>  SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
> -SRCREV = "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
> +SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.28.0.497.g54e85e7af1
>
>
> 
>
