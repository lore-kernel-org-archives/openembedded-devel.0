Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.1604.1602174417948191018
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=XXYyTn1m;
 spf=pass (domain: burtonini.com, ip: 209.85.167.68, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f68.google.com with SMTP id d24so7185812lfa.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y3lhsYef3NSQpmFMUuahAnkmkr422zpRokAKlhjtVig=;
        b=XXYyTn1mQ4SCXPvLfN+VVxTU6vj95JaJDz7+lRi+tEXbXd6DPwJy/viIspcaClTKMC
         57GqLTUb++WrzntrFSkdjxBD/aJZezOe+2cCQGwFHeXPUuX31AqB/2VEqTu1Qg3wk9PK
         ngOYuZ+zni1KVyqURB/avkB0iU34JdJQsTxhMepjXqZLS4LUlg6vP65cqFrC7y6YQNlM
         7LVVlvJaSGCavtRjRhECRggH8I6GE5XlFD0T+y0bDop5Cn0ySf/VczK3xBqdNgHoMq/V
         bMJP/F6u3KJMKWDp5X9EnTH+KvgkbJnqizwVfuTF9O2Va/IZe5u4UGWdpBqD6LYCz8sz
         hpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y3lhsYef3NSQpmFMUuahAnkmkr422zpRokAKlhjtVig=;
        b=b9S5xv6pDdNQ++yVGXMSmvqhJxJnk/YKGzaBxS9xy4mfppqIevbm337PUpD1RMCfUX
         fyj4vWQGN9d5RzYlHJbQCiCGVdT7e3woU3JjJ9fGuragjZbvAiymbZ33s661aR4qiJRz
         +LqJ1U6czilrHfLliMT8iqV2AbrZvHty/hE3rtmG3rYrukCi5+lud9MjPTmjnU1tBX0x
         3cw6zfWNxpC2EOFkjGH7Qzz8gMyfZi/jIZ5PL1NcUOU4+w/UFkRvDYfAF7YfJx64nkrI
         olAXMotxSbF5Y5/sfXl4ChwOdqN94e8QuF56ZssQygFkvs1trb9KvF10iiqao1C/gp0Z
         wsDg==
X-Gm-Message-State: AOAM533mo8KlYCkLb2LtFwpdLKu3eD/VvcNOp7ITm8AOojkhJ4jHTgfR
	Eg8lblw5wJZDxOcitkv3iLgOeG21fz61yacOPglyug==
X-Google-Smtp-Source: ABdhPJzz+pVM5BVKiH7+EjC3lycA5vYt5CBdxmONcxFwi/F6CgnWYMJgJW6W6iHhN/YVDQ2pRt76ZvJcuQB+aVH5op8=
X-Received: by 2002:ac2:465a:: with SMTP id s26mr2801007lfo.125.1602174415653;
 Thu, 08 Oct 2020 09:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201008161850.3097336-1-ross.burton@arm.com>
In-Reply-To: <20201008161850.3097336-1-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 8 Oct 2020 17:26:44 +0100
Message-ID: <CAAnfSTuaLNpSAdLHLMAa9LEQsHp8AAoN+5ZzeWhjk=HdSoukAg@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] mpv: fetch waf in do_fetch
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Note that this and the related glmark2 patch both depend on a change I
just submitted to oe-core[1].

Ross
[1] https://patchwork.openembedded.org/patch/177061/

On Thu, 8 Oct 2020 at 17:18, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> The mpv git repository doesn't include a copy of waf, instead there is a
> bootstrap script to fetch it.
>
> This recipe calls the bootstrap script in a do_patch postfunc, but
> downloading should be done in do_fetch. Instead of calling
> ./bootstrap.sh simply add waf to the SRC_URI so that Bitbake can use the
> mirrors/proxies/caching/checksum functionality.
>
> This is both better code and also works in buildtools environments
> where urllib2 can't make secure connections without configuration.
>
> [ YOCTO #14073 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> index e5f1096b6..5273fc040 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> @@ -18,7 +18,9 @@ LICENSE_FLAGS = "commercial"
>  SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
>  SRC_URI = " \
>      git://github.com/mpv-player/mpv;name=mpv \
> +    https://waf.io/waf-2.0.20;name=waf;subdir=git \
>  "
> +SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
>
>  S = "${WORKDIR}/git"
>
> @@ -101,14 +103,10 @@ EXTRA_OECONF = " \
>      ${PACKAGECONFIG_CONFARGS} \
>  "
>
> -do_patch[postfuncs] += "get_waf"
> -
> -get_waf() {
> -    cd ${S}
> -    ./bootstrap.py
> -    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/waf
> -    cd -
> +link_waf() {
> +    ln -s waf-2.0.20 ${S}/waf
>  }
> +do_unpack[postfuncs] += "link_waf"
>
>  FILES_${PN} += " \
>      ${datadir}/icons \
> --
> 2.25.1
>
>
> 
>
