Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4BEC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 12:32:22 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.10125.1634387541813756969
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mdOWH4OO;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id a16so7434131qvm.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Oct 2021 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vhUhJj+v3ALR5ZC332baS8dLMeEmAQTMJIwxzBLd/i8=;
        b=mdOWH4OOA0KE8UHX6fePo/9jS8CHVuQbpOxbWLisEd4xXaCZwnhiZFCSBnqkLrw9UT
         SCtcNn2yUQYBlMZfYVcMnuuEIye/WBFdt+zpegZzBOnyWq9UJkXDb43iBB4s/LtQiUtF
         HDvbd0bvv1lP9U/Xxn+DTtOsJ55ONnl6bhxrDaonUEEZVjWw5YZk5PCiTjy3iuvOtOMt
         lvilFkUw6O9xs+WxgshJbaxo7KBMoHjlGZ0y7WOJVPnktdc7leZ8cW3MOEan+pjaci2n
         pIrXbECnsPuzFS4fv5+Ma0cavPVHy62jmMDJp13nJN90yx7oHHlZEMkcv/tg+i0sQXyh
         jpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vhUhJj+v3ALR5ZC332baS8dLMeEmAQTMJIwxzBLd/i8=;
        b=Q/GQ5nHVQoC4kTcHk/GwHlmhIm6Armpr7r+B4j2D4H3k83acPH+vSMxCiYtqRdwRXw
         F15ytGij94gos65hbRkmn2CfFAl1vviYplScUIiY9YvpQTTF02FHuBXiv+2GjSGC6ZGk
         NcWzH+flo+zD0zXSpsHIUgmmhXtU0kZ2/RefUlP3AXy2xnG/yDE/2kAijmPG2i5u3LiK
         iMNy5DgK1qvGVBRzaLDfGryJFrp1wJBDY4OOZu7UPpYeneI/uELiR3JigkcL36ysLFYG
         uUnVHKOFl6boOVLncGQ2/jw+LEPl+tTHlupcar4GhGY0WseNdpNVoLOZxFekCfSNMXMK
         cORQ==
X-Gm-Message-State: AOAM533inp2ceSeWwNQeupMtSAcFOGzF6isq9TLgVQGDmfMv/THg3siH
	TDd7x4DVD1XaJ50fTsyvlkt2j6fk6SzORsd5OmJQ+hWiUkob7w==
X-Google-Smtp-Source: 
 ABdhPJxSpRy2pbpOZ0lRKkZ/64v+pJ5B1HhH0TLc2w+mn/mM7Ueu0CekRf8fOgGZApCll9B4c6CEHfYIFlCDhcoeKtI=
X-Received: by 2002:a05:6214:188:: with SMTP id
 q8mr16544563qvr.5.1634387540862;
 Sat, 16 Oct 2021 05:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211015230142.4165370-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211015230142.4165370-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Oct 2021 05:31:54 -0700
Message-ID: 
 <CAMKF1sp9g4tz_W523iudrYT4+gCTyjLzTH14paK+MEhM_q2Asw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-flask-user: update to 1.31.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Oct 2021 12:32:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93396

Hi Oleksandr

This fails to compiler see
https://errors.yoctoproject.org/Errors/Details/612599/

On Fri, Oct 15, 2021 at 4:01 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License-Update: license file cleanup.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...n3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_1.0.2.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> rename to meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
> index fbacf2e99..d050d66dc 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-user_1.0.2.2.bb
> @@ -4,10 +4,9 @@ Confirm email, Login, Change username, Change password, Forgot Password \
>  and more."
>  HOMEPAGE = " https://github.com/lingthio/Flask-User"
>  LICENSE = "BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5aabce758ead32427c145173bc555403"
>
> -SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
> -SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
> +SRC_URI[sha256sum] = "c9785febc2fc7ca15c69cfff1c8dabc2788f25043b54a33f73a6c2a9daf7fbe4"
>
>  PYPI_PACKAGE = "Flask-User"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93375): https://lists.openembedded.org/g/openembedded-devel/message/93375
> Mute This Topic: https://lists.openembedded.org/mt/86361801/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

