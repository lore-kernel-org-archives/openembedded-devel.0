Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.15809.1590163147679500373
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 08:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g/egjW3B;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id f189so11169574qkd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ka98adTQU+nU90FumM8Fpw7B6cjOXUakB+gzAEllor4=;
        b=g/egjW3BV3YN5VU9/MP6iaPV2ajSFSmkak3lYLHDdB9OLjcvx0KunUv/1qBm0yRd1X
         EniBaVX5dvt4glpCyplwYDnuPdN4YAmV08eL8JVyF8lqjC6eNh2hSY8wN9/NwfTl2pfX
         dxjBbsNIqWp7Y5bj9zNtuWFTVQKRJinkpkvJaromiFKpdeAzFnu4l137V+pcpStu/AB9
         oJYnOyKhZKW7G3t5erpdPJMmAKkIfnwIxAeXe0k0TY7V0QIxSDxw7gjmdHRpbYCTgdIP
         cAD9Dlb7cQ5l+kiUgYfb/52s/yIxXyr43pI3T7TosufRehbjjanQxd7mEuzudPGTE6Sm
         +KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ka98adTQU+nU90FumM8Fpw7B6cjOXUakB+gzAEllor4=;
        b=HlVXgJL4Cz7WAMNKbzzdGaDz8H0OcU13QDO5L4ofmpxQgn7hjUTcz10J0K6OEIxQMp
         XMvv7cYjDBx0iY9qu/ld3zXqCHOpZcLETsdQuP2A15/MvJ2w1FgQHdQSZjef6R0IhvsZ
         Q+yFxhh7KxFL8riyGnTHrfpUv2xAuAV9kyq67DJAEF/25UTnaANJgZg0SBOgcdzEdeZL
         0usFwTaba8aUF3a8UFBS8WERlNDFsjhIrza7ctdLKfFpxVzIS4+5hy1LnAccD8D/QCeW
         ur4WNvJO1sC48vlecsWld9KLCEsPi3qZfpuR1p1VKF3I+zgs9ZMzoz8b3J4XWgnYiyF3
         ZCew==
X-Gm-Message-State: AOAM530q/hPymynWc+IyvZtipMzWPABRB91CAIch8yOvJTdRRafxkxYw
	vJ4PwItY5XYzfTjjwuc7AzsiTMsK57WYa8sa4Yg=
X-Google-Smtp-Source: ABdhPJwPsBUWaZnM3oRkYNdeU8KJ1spSXU7aMmdNzMiwVbWCW3UHE+YS1AGKNW8c411ssSX/fYmLx0xRuB6ddIhDtOs=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr14751746qkf.17.1590163146685;
 Fri, 22 May 2020 08:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200522121333.25045-1-domarys.correa@ossystems.com.br> <20200522121333.25045-2-domarys.correa@ossystems.com.br>
In-Reply-To: <20200522121333.25045-2-domarys.correa@ossystems.com.br>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 May 2020 08:58:40 -0700
Message-ID: <CAMKF1sq92HXavsXKHabghWhfMJQoxFfW1ER_-O7G6BtAESQXCg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/3] python3-pyudev: Update 0.21.0 -> 0.22.0
To: Domarys Correa <domarys.correa@ossystems.com.br>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please rebase on top of master or master-next,

Thanks
Khem

On Fri, May 22, 2020 at 5:13 AM Domarys Correa
<domarys.correa@ossystems.com.br> wrote:
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> ---
>  ...hon3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb} | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-pyudev_0.21.0.bb => python3-pyudev_0.22.0.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> index f39847ffa..d5bf058ed 100644
> --- a/meta-python/recipes-devtools/python/python3-pyudev_0.21.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "A libudev binding"
> +
>  LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
>
> -SRC_URI[md5sum] = "cf4d9db7d772622144ca1be6b5d9353b"
> -SRC_URI[sha256sum] = "094b7a100150114748aaa3b70663485dd360457a709bfaaafe5a977371033f2b"
> +SRC_URI[sha256sum] = "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
>
>  inherit pypi setuptools3
>
> @@ -12,10 +12,13 @@ do_configure_prepend() {
>      sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
>  }
>
> -RDEPENDS_${PN} = "\
> +RDEPENDS_${PN} += "\
> +    libudev \
>      ${PYTHON_PN}-ctypes \
> +    ${PYTHON_PN}-fcntl \
>      ${PYTHON_PN}-misc \
>      ${PYTHON_PN}-six \
>      ${PYTHON_PN}-threading \
> -    libudev \
>  "
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> 
