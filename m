Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB4CC433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 21:11:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.14216.1636924305038724882
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Nov 2021 13:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g0wZC8jo;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so9602272pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Nov 2021 13:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/+1+4dRf03dMXZR+10rg1XoCJjCbESRWOwlsq5zLLs=;
        b=g0wZC8joWb7BPDoTWvCdPw96LBLoi/muT4lFe1NInUSMwGXvcFQKRKYPK6AgpbDSdk
         ANjAiuYVRxQBDwDcLOYndqJ/9DCVLADS6BgQKHSLeE+RA1yz2G6OgHL0lX+VaX8MNtrI
         +9TbyRFowhJTlA8WWxa9HUX1A145ZZsXAJmLO3v1DwZzOFcDw9GYg8LW4hfC2KD9TAiJ
         rRYMapUfNOyW993pHZiIu+p5FOrN5jXP33h4JcOhtOL8GIJUtzJhlQ84D6RHNEtdqLnC
         bU/+FLD3MrwKCskQiSnGQ9XM/q2T24smUrigZNvp+/FbDgHNCr27SnqwfkIYiEAtcwab
         2wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/+1+4dRf03dMXZR+10rg1XoCJjCbESRWOwlsq5zLLs=;
        b=o9mj4MbYajdsioxEYcggP/1s+MK+GSSLupH8PljbwwRD5F4gAygpNNFvuMZZcbFZp1
         U47nYsOAM3MPzxe+8aEJUW1FmaPbyMVBUxHvM0Ss1OX06nERBhHhK5RXY9cg8uqqmb8I
         zhkYDtg/AITALE/477hp9mgiMEsGw9a9vW9/A1Sa+Yy+hJ2uo8gpftuiIaT2Qb3cs7o4
         opeVhIKtOySioqOsrA9/Z9l+SdpIhF3X+dLDNZttr+MBX3pc2Ghtao90MlxGx6dJN75O
         ibZyoowOyI9gUWJHt3Lkw6RcPQ6yTAPVPjemflaZV2LkiYl9mwqarkK5wHvMl4NmRB59
         15aQ==
X-Gm-Message-State: AOAM531biVqbEQ1uf5ytEvmQArMORWneKSvfpIZYi/WOki9z48YjIwZF
	w+q6hnM8BbtIZCkUGSM43yD5msSECTlKYH4RETc=
X-Google-Smtp-Source: 
 ABdhPJwc9xJ5xeB8IDlB/faU7T8IUBwbGqQzC4dMvqPxoW2gJkbYIRj5OBKjD0no36HeMEp4IdbwvaBJOU9GSWPuwx0=
X-Received: by 2002:a17:90b:4b90:: with SMTP id
 lr16mr58396225pjb.57.1636924304592;
 Sun, 14 Nov 2021 13:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20211113174606.2044137-1-raj.khem@gmail.com>
 <20211113174606.2044137-7-raj.khem@gmail.com>
In-Reply-To: <20211113174606.2044137-7-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 14 Nov 2021 22:11:32 +0100
Message-ID: 
 <CALbNGRSGfHWnca34xKkAqkEu9yR=vFR4bCPvcp_pGmOWcF4pUw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 7/9] tracker-miners: introspection is not
 valid meson option
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Nov 2021 21:11:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93943

On Sat, Nov 13, 2021 at 6:46 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> meson 0.60+ errors out on unknown options and -Dintrospection
> is not a valid option
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
> index c2de723ac9..78d4b6203d 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.1.1.bb
> @@ -20,7 +20,7 @@ SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.pat
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> -UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
> +GIR_MESON_OPTION = ""
Makes sense - thanks for taking care

Andreas
>
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "ffmpeg", "", d)} \
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93936): https://lists.openembedded.org/g/openembedded-devel/message/93936
> Mute This Topic: https://lists.openembedded.org/mt/87032487/3617609
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [schnitzeltony@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

