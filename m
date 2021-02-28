Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.281.1614532122084220606
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 09:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B8dKKL/W;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id w19so14279762qki.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 09:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=84xIsBcsgZNKg8zsQkw6AY3PB1cWDddeHpFxlx1Zpwo=;
        b=B8dKKL/WtdwTkGutnB/AkUuBIbVBscEj+IXfAByYRLRHHU1ggb939FB0RpuHYNBtv1
         lkWeDSD4tzqvFkBQvL2l9dRT5ib5f7zcIyodXJoGoaLRI1m/p34thkLuB2fusb7EH3hp
         5otT0lSfCdxKuteq7P2m7bMJ7uDU+IZQAssRJjSbsoopjkOF0Ea4ZEqj9cWDbGanigs3
         2x3Ir0gZN2dK7qQTEkhUarAJ72ripUM14U0VbvMhjcBc0jlbrwo4w3x/GU6OB1Mhrf1Y
         Q/7uLFHDQFI97AgbySEYDEF8sUoaAKjXEhcEzpCjpYk+Uj8NzCMlCw9557voAjyXhhfz
         Z1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84xIsBcsgZNKg8zsQkw6AY3PB1cWDddeHpFxlx1Zpwo=;
        b=AQKo036QHbXgmoxlzMblQ6fml1kjRrREyjd8ekm2HAqQrMZRjnHIuuR3fe60hc2jhp
         4nnqzsgMLlGOnwhDtwmod9SewFSTBwCmTEAmbR/Nl6VkjB7JEbWRbNlGkbXUpX5P9BVU
         /+FRRpOuZIMVrzZQPAq2bBdM1N6E4AU1kRpv9hBG0YQrCHVuTfSLW145HEGaCLRir5B8
         hI/z8R2Jhi1jGokqh4UlWkVSbqq9LtKuysAW748k4b60nxMY1VQHi/L9KjgrGpyzkNsS
         0IsaO17zvjUwbbDf40NDzHm5T0mkohQzdGkyLVJPBVaqguPJW7jHWBio/IcSInTrpZ5s
         h6MQ==
X-Gm-Message-State: AOAM531HqETHFz8OGEF1cuGJCiY79Rhyu61BY4GrWEu1FMHuSWWrPwWb
	83gaT6d44MUwINz2Ll1HMlz/ym+XFTLCyV0Lq37pWQd3MGY=
X-Google-Smtp-Source: ABdhPJxcWPJlk36GMgzSioXQ7a4J7ephjA5M0Rpx/tjMj579XMwO5kRkYTbNy5w3ap0qU93ZfMn38pM8WJqFQHqsYyE=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr4921868qka.119.1614532121122;
 Sun, 28 Feb 2021 09:08:41 -0800 (PST)
MIME-Version: 1.0
References: <1614522637-90476-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1614522637-90476-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Feb 2021 09:08:15 -0800
Message-ID: <CAMKF1soUeLMQ-T5hXcCfvWBpHgSNMezPCUMwJwwTTkUekM0Ghg@mail.gmail.com>
Subject: Re: [PATCH] [oe] [meta-oe] [PATCH] tesseract-lang: upgrade 4.0.0 -> 4.1.0
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 28, 2021 at 6:30 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>
> There is no file COPYING in version 4.1.0, so the file LICENSE is used instead.

that's fine but checksums have changed too. so it seems content of
these files are not same either. Can you make a note of the difference
as well ?
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{tesseract-lang_4.0.0.bb => tesseract-lang_4.1.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/tesseract/{tesseract-lang_4.0.0.bb => tesseract-lang_4.1.0.bb} (84%)
>
> diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> similarity index 84%
> rename from meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
> rename to meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> index 75c2bc00e2..fd2973bc2b 100644
> --- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
> +++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "tesseract-ocr language files"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=9648bd7af63bd3cc4f5ac046d12c49e4"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRCREV = "590567f20dc044f6948a8e2c61afc714c360ad0e"
> +SRCREV = "4767ea922bcc460e70b87b1d303ebdfed0897da8"
>  SRC_URI = "git://github.com/tesseract-ocr/tessdata.git"
>
>  S = "${WORKDIR}/git"
> --
> 2.25.1
>
>
>
>
> 
>
