Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB1AC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:51:27 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.124.1649439414796656754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 10:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LJ+sa462;
 spf=pass (domain: konsulko.com, ip: 209.85.166.49,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-io1-f49.google.com with SMTP id 9so11468885iou.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=fQYEMrmxGTOpkum+EhPP4Bt0PgAmlEkoaY10Fl3UZXo=;
        b=LJ+sa462SPyglPW0xUydIS+qEodRxVB+eYkOm/Fvww9W6zK2v00CiUziL797kZXC6a
         BUUPqJ4P1z1sEajcqTCpdyPHZCrrNKCGscOW4JAXXMG6vx00CzMYtWjlwNSUkMp1Rwt0
         d+hFvheg56ROQH1wkYrkllPEuhvxHH5mphKVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=fQYEMrmxGTOpkum+EhPP4Bt0PgAmlEkoaY10Fl3UZXo=;
        b=vhyi0r+mS6yOK/szYScsF9Ar/e40XtdkTyv14ljKKZxGRD4HTFZpmxeqdbln2ayl9T
         ALLanj7eZfUUFJfOrQ7wTCNgUBj9W7K0WjHgmz965NltWF+QLMJuL0qQDE77v30uYuSq
         3a6HwulDuxlJQWybWd8Kh99+AAaUdwKqvo0BsFpUUacZouROC1DSh27ovlDVyRayEmA+
         SJdGOP33++VMBCh2cg53uNfHgYNVQc0gC2Eoaynp+adVa7zOOC6yuQZCX0TdttxMiVKf
         Aas1gJG80K8QkWsqPiHUZgKvnko6K9y1+QpOXQEz41Qy7hVJC1dM/e0Fa4zR+/tSdetY
         oYqA==
X-Gm-Message-State: AOAM530N/vPxbazG4eeGS8l9LuDgoHlaL4dfrtzaTsspG0bJ4HVYaEKO
	y0dUCZF9VzlCoNfmJSgFfqfKqmhE1vHjXw==
X-Google-Smtp-Source: 
 ABdhPJxrV83BXLq9K8x/Csxvyc5dCVuf4xKTnWGErywb1XTeyy8EqCqbtE9B1uGNjxGae2HPSGG/Nw==
X-Received: by 2002:a02:c995:0:b0:324:2e15:bb7c with SMTP id
 b21-20020a02c995000000b003242e15bb7cmr3459010jap.21.1649439413633;
        Fri, 08 Apr 2022 10:36:53 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 b15-20020a05660214cf00b0064cb75d7e97sm16135930iow.53.2022.04.08.10.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 10:36:53 -0700 (PDT)
Date: Fri, 8 Apr 2022 13:36:51 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
cc: Robert Yang <liezhi.yang@windriver.com>
Subject: Re: [oe] [PATCH] wxwidgets: Fix building without x11
In-Reply-To: <16E3F6217A8A56EC.6461@lists.openembedded.org>
Message-ID: <1ae383-3355-e547-def-e61659ebd42@spiteful.org>
References: <16E3F6217A8A56EC.6461@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:51:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96483

On Fri, 8 Apr 2022, Scott Murray via lists.openembedded.org wrote:

> Building with wayland and opengl in DISTRO_FEATURES without x11 as
> well was giving the error:
>
> wxwidgets: PACKAGECONFIG[no_gui] Conflict package config 'opengl' set in PACKAGECONFIG.
>
> Upon some investigation, it looks like wxwidgets now supports building
> against Gtk's Wayland support, so we can also enable it if wayland is
> in DISTRO_FEATURES.  For OpenGL, however, wxwidgets seems to have a
> dependency on libglu, so the DISTRO_FEATURES check has been changed
> to only enable it by default if both x11 and opengl are configured.
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> ---
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

I hadn't checked the list before sending this, I'd be okay with Robert's
similar fix instead, though enabling building with wayland support seems
like it potentially could be useful to somebody.

> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> index e82143040..e7e89d64a 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> @@ -43,9 +43,9 @@ EXTRA_OECMAKE:append:libc-musl = " \
>      -DHAVE_LOCALE_T=OFF \
>  "
>
> -# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
> -PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
> +# OpenGL support currently seems tied to using libglu, which requires x11
> +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
>  "
>
>  PACKAGECONFIG:remove:class-native = "opengl"
>

