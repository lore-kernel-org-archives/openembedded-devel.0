Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.3167.1602702331123316259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 12:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pZsn+LCQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id k9so399711qki.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCnMrsC9WyngNwGFyEyvCKk317rA/gNFxdm+x2/aUyY=;
        b=pZsn+LCQSJCOoWcTXBG1FRNERT/P+v2IRKik1G58R4C2GokxWyxy0eLLOVTlCtpZ5S
         eEgDL1J+fIyEUSIzOXM+jlIbz8GSC+YFoBNw9tMfEHC6wrF59WjXmFYgdZnliz63Lufo
         arFRlSOOZbieb4H0YJV9bGo6nIN5dIHcj8mdMX9eJH6yR1ZY4nm/zpuiucmL1ke3skWC
         dpnnGaL7VD3O8oILjsG1/ez2ZG3MI+h2n2dvunGr/b0cNr89u0W2mpJQTWZ2UnYtRe3Y
         K2lW02Sr8sjGVUxfBGadbiLPGjJ2FERhHXWwz2os7eRS5w/hJALPM8uMTNEWRY6FBWdK
         wefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCnMrsC9WyngNwGFyEyvCKk317rA/gNFxdm+x2/aUyY=;
        b=qwLXDva8NeAZlv8IEwunlzDVlKexc6Q0cnB2CTiL8SjU6eQ5yyfrI4BfpZN47TA5CQ
         Ei4dEDue7CAcdBfJsst6eHvXHC+piXqzp6NZsWzOIpmGCkLNwkHshqa1VWrZRT//VZle
         ONKXFg3jPeKxXgLoB4m26DwgG8Ey/WjJgA5MObL0nArbSlfEX+kV419vJqmOreo9z1er
         uRPylucLLGM2eTpmVn9qi/X9awz1EgO/FSlRQScpiaEnYenq0HCUeGCd1W0C2BVXrzZf
         AE4yExQadR9xIMWmuszx0ouDz9M91blQWF7JcISRpHpUm24FAtSwkGoxdyd1uuAzH25G
         WgsQ==
X-Gm-Message-State: AOAM531ffxpBgpL85hWxTWEJ8cIUG/l9jKqhhDRWoEkJYrfkHeNxCiBh
	s7dXhCv6Jh8+351NgwSbnGPRw8FzJR4rzopxQIo=
X-Google-Smtp-Source: ABdhPJyaxwPoAoRpMJ0IgPWe+8Rb7YnsShvubzrXAScLnRXlqWLbueu0vXKnjVyre9gXMMIBwaySYuY8bsb8VK2fjwY=
X-Received: by 2002:a37:4d42:: with SMTP id a63mr481156qkb.71.1602702330086;
 Wed, 14 Oct 2020 12:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAwVp3u1hs6PLobTqtqkSbGpFyEqYdUa-BZbYeGce+JFO=BDdQ@mail.gmail.com>
In-Reply-To: <CAAwVp3u1hs6PLobTqtqkSbGpFyEqYdUa-BZbYeGce+JFO=BDdQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 12:05:04 -0700
Message-ID: <CAMKF1soaTAu0yuWXP=om=1ZD7PxjBROF5LzRQC-2QgsjmSAbRg@mail.gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] wireguard-tools: Fix systemd service installation
To: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="UTF-8"

this is needed on master as well. So Lets get it into master first and
then send a backport pull.

On Wed, Oct 14, 2020 at 9:14 AM Mario Schuknecht
<mario.schuknecht@dresearch-fe.de> wrote:
>
> Systemd configuration file wg-quick@.service is now installed in the
> usual systemd path.
>
> Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
> ---
>  .../recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> index f698b9a9a..73e049f2e 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
> @@ -9,7 +9,7 @@ DEPENDS += "wireguard-module libmnl"
>
>  do_install () {
>      oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
> -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> +        SYSTEMDUNITDIR="${systemd_unitdir}/system" \
>          WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'yes', '', d)} \
>          WITH_BASHCOMPLETION=yes \
>          WITH_WGQUICK=yes \
> @@ -18,7 +18,7 @@ do_install () {
>
>  FILES_${PN} = " \
>      ${sysconfdir} \
> -    ${systemd_unitdir} \
> +    ${systemd_unitdir}/system \
>      ${bindir} \
>  "
>
> --
> 2.16.4
