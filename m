Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45863C3527D
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.20218.1649613375245427194
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 10:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U9FH0qwx;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id t207so7618180qke.2
        for <Openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F5gRdt2i4UIXFLkNl9iFmpKXeqhVC1jy2yhAV/+lJU0=;
        b=U9FH0qwxo66MIgde+7EX/O9IHpsRBckkHiyNgzZR7lpnT1g9dmlEvlkuslKcPgcofM
         bNqS2WP3WUGFc5UvfNvFpfMxWhOfKyajb+le2prIyM89hnRZNdj8hBem2pDNUOiFi5BL
         uKXsB/TK1aLf8fn4AjV1Wqb80qGm/rvbnzrSmJsWMTIpCZAQDX7SI502Cie+ukhX/RPh
         5zhzk4//4nDnDPkSVHHvMnHL3YTtx1vK8dkXVoHqUd6Cjt5MNVaS+fQgcUdmvDBZrwTN
         5or1fMgj5RjHRQlAa9U/bNBdYGKGHsFgNwwSaALuSEV7fpX7z/iHFuOUbWrAmceM9eMB
         8EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5gRdt2i4UIXFLkNl9iFmpKXeqhVC1jy2yhAV/+lJU0=;
        b=UPCMGBYXNowAf3fwzLbbwwHnFOePg5mqZcJq+p+tgsUBGFot2eHKWw4wLVcviOF200
         rKbBY+73Y/aeg1lexTFRsYw0tWzZcDC0UrxXDm7BpZFgBzS296zvXu1Vj/eY5PaLecDy
         nlfAUzhNOfGYDEH0vFSckBiU2f6rNem1ytCaNVTZvXvuhRSGJua2JdsgA2w/To4eO8i0
         Zx3oTWdufbTYERJ3cJHl7slcXswlk7Y6svmhnu0EoEzxKaHJYVZEJrKS/9lNc4uaH3wj
         SeL1ADZE72+7aN+f5zKYvG4PATslv2BxgO999qFQIMRK9POpiw8SLvlU8GMe7Cly43HD
         Z/BA==
X-Gm-Message-State: AOAM533dDY4yJ7g9Q/oiz1jRpNuM6GDGXXgwCAhpIx9hgg2gOy+uJ4Xz
	BvwdG0v0UqKhOK63ZvLo5OWCzCHL0IzSp0qfwCA=
X-Google-Smtp-Source: 
 ABdhPJwfc5qGdXdTTirDjNuoI4R+8Toh3rDIr2LBM5tlQ2h1MPkJxMQdMfkwpRMMueSOsJz9+9yPdfhLQ/0lxHk8808=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr19447220qkp.180.1649613374277; Sun, 10
 Apr 2022 10:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220410170633.1399502-1-preeti.sachan@intel.com>
In-Reply-To: <20220410170633.1399502-1-preeti.sachan@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Apr 2022 10:55:48 -0700
Message-ID: 
 <CAMKF1srF2+K5GYaWyqWrddcs4bMd3sSJtE_O6oSHRL0Pa+YHpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wxwidgets: fix pkgconfig no_gui conflict
 with opengl
To: preeti.sachan@intel.com
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96506

is this needed on top of latest master ?

On Sun, Apr 10, 2022 at 10:06 AM <preeti.sachan@intel.com> wrote:
>
> From: Preeti Sachan <preeti.sachan@intel.com>
>
> PACKAGECONFIG can not have both 'no_gui' and 'opengl'.
> This fixes parsing error: PACKAGECONFIG[no_gui] Conflict package
> config 'opengl' set in PACKAGECONFIG.
>
> Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
> ---
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> index e82143040..c14179386 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> @@ -48,6 +48,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui'
>      ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
>  "
>
> +PACKAGECONFIG:remove:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'opengl', d)}"
>  PACKAGECONFIG:remove:class-native = "opengl"
>
>  # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96505): https://lists.openembedded.org/g/openembedded-devel/message/96505
> Mute This Topic: https://lists.openembedded.org/mt/90377860/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

