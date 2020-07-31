Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.13106.1596178004356809882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 23:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=elpdND5u;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id x12so13742457qtp.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 23:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZLKsTNF2WMDes/d9Y1xmma+UN4B/SfVBJAgh01Fb0aM=;
        b=elpdND5uiQO0sb0qZtj1BbwqnHxkdZvER+rKJGI1AoT6JUKK9h91tJwWEVF5HLufMK
         tBLeWSEDnp54tU0aYMUTELTysFMprjvGQUDoVX3ahEJx6b8rxeHJy23Sxnfu5fUXolQ5
         kasTngUO4KLRPv05GWL8Gog02SVYEJO1yP99NUZ8f/1P24zoJ9ovVQn+L4pvOO9TPi7Z
         RuRati0rSZiIz96JpDNoEYa5iJ3qVX+Y8sn/e6pocaesG9DSjaDwB/rS211grANnLOCV
         F6Vni4URQM4bVXGPlT2ofGJedHogpqbUEGAYyjJKe2E7rp9TBNt8zituWlylqqusPLcI
         DqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZLKsTNF2WMDes/d9Y1xmma+UN4B/SfVBJAgh01Fb0aM=;
        b=FyMZRhEl4GYoJApKI/J6JKN0ZC3DgkDhnrN0PQhMD69UlC+0ubGk5px95TUAs2Hta+
         tfsNm4LLlW8HD9zJutwhmpGquAS8z+di8eZVt/5IO+jM+mTyLtR8LTsPr9XLJxtlvTRU
         eKj0CTQ4j8aSWmWMUUHdOUqcBNZ0Xy3g4R8dUhkjCWMwcb1Xbdx0WeCG70xMtakoAWSI
         17MRojwrKRMJ4u3cNInK4AXHNTXlYQNYs3SBraPWXqjsvxfuXpI0fZLL/WkiO8HsUBWX
         +J9nRbdVyPAGbmsWMu+QDKh81ErA++f83rn3BZQpe0bHYxg+xa1f9CNvhjX3NH4KsZUc
         luzQ==
X-Gm-Message-State: AOAM531m2ySCNqWSfAliCcwsW72p5h2JEzP56ZHTKmUNwXLCSXCP0hGW
	AvMnci/oEX+yY/Z1PqbnJvIcjDw8F9uQG/060kPwp6ne
X-Google-Smtp-Source: ABdhPJyiZF/3JYlAfjCiqXJKWn2f+FivLQ0drbvKS1UFoAjMIl9eMy9vy0yT2N8iqyryOhCkrKNT//hqWY6dPz4x0oQ=
X-Received: by 2002:ac8:1344:: with SMTP id f4mr2227933qtj.285.1596178003242;
 Thu, 30 Jul 2020 23:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200729085747.2766868-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200729085747.2766868-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 30 Jul 2020 23:46:17 -0700
Message-ID: <CAMKF1so=2KqWa7zk=tCT8N52D2kms+gtnKLcjhaqquLqQ3ubbg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-multimedia] libupnp: update to 1.14.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 29, 2020 at 1:58 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libupnp/{libupnp_git.bb => libupnp_1.14.0.bb}          | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_git.bb => libupnp_1.14.0.bb} (90%)
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
> similarity index 90%
> rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
> rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
> index 339c07cd9..eb6c6cbf3 100644
> --- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
> @@ -6,12 +6,11 @@ supporting the Document Object Model (DOM) Level 2 API and an optional, \
>  integrated mini web server for serving UPnP related documents."
>  HOMEPAGE = "http://pupnp.sourceforge.net/"
>  LICENSE = "BSD-3-Clause"
> -
>  LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
>
> -PV = "1.8.4+git${SRCPV}"
> -# release-1.8.4
> -SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
> +DEPENDS = "pkgconfig"

should this be inherit pkgconfig instead here ?

> +
> +SRCREV = "a6c3616530490ca67db41131572ec18f00d95eb0"
>  SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
>
>  S="${WORKDIR}/git"
> --
> 2.25.1
>
> 
