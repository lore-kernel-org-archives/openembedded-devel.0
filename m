Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4805FC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 22:39:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.58661.1670884758022647297
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 14:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FY0pdZmj;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d82so938559pfd.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 14:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoe0zl8WSHya/0DMWtEVPEABIYiFpbhKRAEkytsAG9g=;
        b=FY0pdZmjIfAhJvdV6K/JZBnQT8GMg+HnErRSpqD4TVvXpAPj0/lErzxzLL8idkE8d9
         kvjWH5qAOGzx1NPk2OEjfIybzzUGpdSSQ2jmnIlhV9OiQdAheiRepv5HF3CiZOZ/vxTY
         neCF40SuANBaZiWpeWmwm86CxRLX1TN6K5ri6/K/7FJ+7P3IQqaNPyG1HVt4nIfWN+bZ
         i8uhi1RoFoOq5iMIj+Mz8L/ZJbfdtnqYQ0vUnpC1NQJHFCYBHiGXAs+j8OzIxALk4Oix
         6G61k6+hTCvR11/vLMXJo+/z2OSgMkGkS5/RMwsY0xeAnK2ri/9d7Vn9AOuvuH4sS32R
         Qs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoe0zl8WSHya/0DMWtEVPEABIYiFpbhKRAEkytsAG9g=;
        b=Cm8v7AU1RBhTyGEmSlwQUNUWgZqC+3DKDcL7eGIPm8r0Ywand/ujbBzB0TaJQ1cCwq
         9vhzEhBzhiYxp+L2BYDSVOjpFm3E+KDowzyA1zdjpiqmwR9hYmUH3HKMGZVkQfL/B/97
         qmejwtbiD9+6ZY3kEB5z1kq+hQ/PvxHosBYBc5t0BMuXJnRvXEEIjpS8y/8EyvTFugOf
         xk9Tgxq1lE/8qFY39/4ZBNitlpsxYBL4bgjxOMXDa1eQ1yo4K+9l/5A1iXcsE8tb6huh
         zT+xtpweUKA8ZbMMmrlM/nubMITEGeB7GvHxWlCcJEaJvniZucDCMBcJF+1ImdGtexIz
         BP1g==
X-Gm-Message-State: ANoB5plSSuQTjeMWlUyxyjyj6Q97CZvmmoX0OabGRM77BM43zH4xWiFb
	JJbgQXFiFEMM67GZi9L/9u4KdS13Q92aJytpudk=
X-Google-Smtp-Source: AA0mqf6PDA9TJbWCh4EgfmaSQjzBjsnjzIZ6+r+c9JhrMlG9J2ivdOL/GKxJyvza9pKOW86bQZ/YdT27n40fHYo1EGs=
X-Received: by 2002:a63:b54:0:b0:434:911a:301 with SMTP id a20-20020a630b54000000b00434911a0301mr71399091pgl.50.1670884757472;
 Mon, 12 Dec 2022 14:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20221212175836.13560-1-roger@norberthealth.com>
In-Reply-To: <20221212175836.13560-1-roger@norberthealth.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Dec 2022 19:38:59 -0300
Message-ID: <CAOMZO5Bgh1EdWQF3PMQ4Twh4KC9C5E+MKRPDKzjHT_fe4Aq_cA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-rapidjson: add recipe
To: Roger Knecht <roger@norberthealth.com>
Cc: openembedded-devel@lists.openembedded.org, Tim Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 22:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100067

On Mon, Dec 12, 2022 at 2:59 PM Roger Knecht <roger@norberthealth.com> wrote:
>
> Add a recipe for the python bindings of the rapidjson library.
>
> Signed-off-by: Roger Knecht <roger@norberthealth.com>
> ---
>  .../python/python3-rapidjson_1.9.bb             | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
> new file mode 100644
> index 000000000..ebf053396
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Python wrapper around rapidjson"
> +HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"

It looks like the license information is not complete, this project
uses rapidjson as a submodule,
which has the following licensing information:

https://github.com/Tencent/rapidjson/blob/232389d4f1012dddec4ef84861face2d2ba85709/license.txt

