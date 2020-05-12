Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.7217.1589247542822932327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 18:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IzZgFgFk;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id p12so9779359qtn.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2020 18:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D0mr5eOEp6b1G6NtKe9RHO0H4yjP2F35dgFnAk2ZsH8=;
        b=IzZgFgFks3azVU8BPHBPt6m5fUtimk0D8fKSWD60o8bbFsdWIkVstf7Kn+lkDujveM
         IglfMKz+9M1pCnDRC8wVGN6SGMiPSVyvK5EOFsAVXfWfXAbqOQ9dxDRAX0P0Z8rMjouz
         z6J2hldontmEJrMOldy4NSQd0uRv73yLaGIDnYSlUCBZBL8OkLZn73e46UxcPz7G4xyy
         94MUQPL2lfAtJUrBWs7zEoBm1NB2n9YoPhkHeOhLXUCqsdjCbMCLl4t5OYRN2W2FcZ9p
         2CBtaSW2TxAedhemCTmOZ8BHkxRqNMIOPq1GXBT1YS3ToOGd4GQGZKepHkPeUIFA0wD2
         LKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0mr5eOEp6b1G6NtKe9RHO0H4yjP2F35dgFnAk2ZsH8=;
        b=RMaACyk5ofUTRb4LVS441UJoXk8CW2UXwzUFFfOM756nest7mRyDHlEHSFIvSlQGhT
         mYUd5r333IxMVqimuRr9B038r+ji1Mj3A25g2wVkEovgXMw/xDaMkvIIamoQMcnr+KwM
         ZM07BYemCBKgGg/cs/FChcmEDwwakQQO1MORfX0ucmjhyxZWYrN+XE941Guwq57208sN
         kwvEL8nJXPgnGvL66+arcdb0OtIaLMEeu15Zb1OtxcwvZH81LAKdsiz7KPVFoShQrKk+
         w/1FXYrY7J24ShD99KYHEG9Jq8syEc9UzWvG50vbBYP3Em4IsCcRnul9R8vBeNk3y4MY
         vA5w==
X-Gm-Message-State: AGi0PuZFQ6zvhgA8ytNLOx39wwi7v4DqI7xGbfpxQwzyjf7J/AtPwG/x
	WQ/CmiNh+pr5CnWGVXfroa+d7QAQgKXTZ9kZy5w=
X-Google-Smtp-Source: APiQypKYo5sUV4yntx9QDH7TXdkchbiQazUNdbKOudI2p1O62o9r5tKuDwjz9FExfXrZeK57JamKRKA0QDppLZ3eurE=
X-Received: by 2002:ac8:555a:: with SMTP id o26mr6024049qtr.190.1589247541740;
 Mon, 11 May 2020 18:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <1589278403-92900-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1589278403-92900-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 May 2020 18:38:35 -0700
Message-ID: <CAMKF1sp1J2tT8=CBkb4vCed9oE5NKUG-8ZNs6tqPLE3a3DpKSQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mailcap: upgrade 2.1.48 -> 2.1.49
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 11, 2020 at 6:13 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> man page changed from mailcap.4 to mailcap.5
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb}        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb} (81%)
>
> diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
> similarity index 81%
> rename from meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
> rename to meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
> index 114ce4607c..ff3047f325 100644
> --- a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
> +++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
> @@ -14,12 +14,12 @@ by several applications e.g. to determine MIME types for filenames."
>  SECTION = "System Environment/Base"
>
>  LICENSE = "PD & MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
>

what changed in LICENSE, please add few words about that to commit msg.

>  SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
>
> -SRC_URI[md5sum] = "2c26e18e912a5cf00318fcf7f8f2d747"
> -SRC_URI[sha256sum] = "d7b023b237d6053bf05ff6786e0663c55c614efcc99cdf856120be13b5c29157"
> +SRC_URI[md5sum] = "d5701a1a541383c0eda328f4a6518751"
> +SRC_URI[sha256sum] = "f7381516bc1a937348efd1d0e14618e0a2afc5d59fe821dd248632d5601b59b5"
>
>  do_install() {
>      oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
> --
> 2.17.1
>
>
>
> 
