Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.8976.1606414028066657537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 10:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u7GumonX;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n132so2274136qke.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2020 10:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o3E4R+jpp/ShL+9zldUhyjoqsenueOQJp0VcZJBcSBE=;
        b=u7GumonX8xHXRW41zJg2pNEnSHqSxH5W/XuI5llPsYYTP8Bs8y9YEJz8RqDCKcfugu
         Jb09VQuzJlO/MqeuXPHdgf1g482J0zr8Bq2eAouA1/+pwpFWRs1o0SPaiOVl8GStBzNg
         PoXz+MHdntdw5bNw8RxzZt1O/flf6reOc3qp9j0NuLv+mOIlWn2+MxXi2y8xUXx3Qjky
         y2PMBsr5D/l47ak2Bt6WDHglTrEjGKLyAnPrkOdGTzcnudxzBHYV4baim9ldrjVdu2ik
         vzxtBT1ao1toWVlbLUbPIrTeNXShsV1/hWfCO1mRAl0urpDnhGaeeiRLb8lcwTtiLJdI
         TKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3E4R+jpp/ShL+9zldUhyjoqsenueOQJp0VcZJBcSBE=;
        b=rSGcyneciTutu7NnQIneMCITIag+m1nbI9TINCtOJoLD8//xKGHSiCRc7rZzGhwaS3
         Ts6YDHrmHRqXITzJ6NSmcDvSLaSRBNWCxfHIW0upMDEz4HhYEqBhDrhUR7ysXeUKAvfs
         SBl/6HbY/xpwXiLlEwJQhUgL6MPbXO4M2H+5fQvRNB9oEg3c0HT0ckvQjrN4MH010sGl
         x8lzN8OEutj7MweFj4+L834xHeUTEUejtsAeedSXE21AKH7lcxv3BjNE+ZqF1AHYVjt/
         dkzYbJoNRqAiS5ZrHHAR+Mr1lfl+HcAMwe9vB2jAraFgN7F2KNfPhZmYZRkNjyD2OO/z
         9c/A==
X-Gm-Message-State: AOAM531ScQo5RgizXjE2/zkP5f/dKF8YEZj60/RJF4qo8Jg6Tx81X+Rj
	equRfH6Zmhu+EheCg67BpFcpHphWNZRY8MUg56Y=
X-Google-Smtp-Source: ABdhPJxAJ1OIsienreuzjuQFKcBBy6uog4/9QIM8O5Kz+yKz8t1E47ui2RKCDnMa0B5ToNRZKrQMru713kTqtuhdAu4=
X-Received: by 2002:a37:6195:: with SMTP id v143mr4267486qkb.71.1606414027020;
 Thu, 26 Nov 2020 10:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126180347.13763-1-leon.anavi@konsulko.com>
In-Reply-To: <20201126180347.13763-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Nov 2020 10:06:40 -0800
Message-ID: <CAMKF1spXbeFA___4rkvy-tpzzBbp3KFkPoKceJn6SSmTcVia_Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pyrad: Upgrade 2.3 -> 2.4
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2020 at 10:04 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 2.4:
>
> - Support poetry for for building this project
> - Use secrets.SysRandom instead of random.SystemRandom if possible
> - .get on Packets has an optional default parameter (to mimic
>   dict.get())
> - Fix: digestmod is not optional in python3.8 anymore
> - Fix: authenticator was refreshed before the packet was generated
> - Fix bug causing Message-Authenticator verification to fail if
>   multiple instances of an attribute do not appear sequentially in
>   the attributes list
> - Fixed VerifyReply broken when multiple instances of same
>   attribute are not adjacent on reply
> - Fixed Missing send_packet for async Client
> - Fixed python3 support for SaltCrypt (was previously broken)
>
> License-Update: Use file PKG-INFO.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 ---------
>  meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
> deleted file mode 100644
> index 3b38fb3a4b..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "RADIUS tools"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f"
> -
> -PYPI_PACKAGE = "pyrad"
> -SRC_URI[sha256sum] = "89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
> new file mode 100644
> index 0000000000..86a95a4aa4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "RADIUS tools"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"

I still see https://github.com/pyradius/pyrad/blob/master/LICENSE.txt
why is this changed here ?

> +
> +PYPI_PACKAGE = "pyrad"
> +SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9"
> +
> +inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>
