Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A8EC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:22:28 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.789.1652282538890883051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E1uixGMi;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id h3so2232756qtn.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tl/WigqfCEH3/B4OWnR1L+clpHymIly1ctDZfP5yDG8=;
        b=E1uixGMivk1lPvT+Z41ozXhKgmpmG+cTeG3DC0LBdKTnWM7Hx3fJIQ7DR782wppnp8
         2mW+7Wkr+7edGI4QDGpAjFJO6HnwLv59RUgjlpeUs6uZJzPbpolIgCBbOLqPNFvEJ/TD
         7ugqgRRTq4fsjX8rvwSt7M+p9mVlXBPURn5AdgphXV+bhle9J3dPJ5mKUfDcXdus+34G
         L2VjBryqMnc26C8YMFB+CSwZPpsX5sTBoNtBjnEo6m6Wl9WYgZLRdhaDeerVkP0cPsr5
         aD5it9tl23AfzepjCDBuxvMy3B2De7ix0bGA43wzjm4S+eUveiFHBlmGhOzBZahwE0ch
         cm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tl/WigqfCEH3/B4OWnR1L+clpHymIly1ctDZfP5yDG8=;
        b=VpjEVV+2k+iAxqFai8oGtZ17z/XxKp05b8nn4c5/J0aoo7abtqLRX55j1SIpYqzpSB
         fccKZycV1qoqKGQXX/5ezIhlUDwmmxhdPkpzG3/pWIODIZlx2Yt2nb7oVW/BYlv04/iv
         En36FcH5SYxLOznax32gS4L4Fz4VNCVsKQsbwfm1cV4ey4SZw5Zpqd05yZfRNKYDYzQJ
         M4kPRk6Z3491LMuty1WWXMVZpSThUOUUSLNDk2w3V7lpVrVPT5M/r1jjZ6Gnm3vfmtft
         Q2vYJufNpYj+LJnqDGkqDHCUuHk+hAMPe76ZyUAblyIg0aEdfnPxfGXxyqnUWQs7zRaa
         4TBQ==
X-Gm-Message-State: AOAM530bsX7OPVELRZ/SH8Tr8uw8QYWcfJm0Nym/MbCwiYDqaJR+Mtpl
	6vgbj08tC3h63sVIga+wOjyw7ztyrKHEWyq2fV0Gt0k13q8=
X-Google-Smtp-Source: 
 ABdhPJzz+lgXz3gFsq+Rac2EoU3azIMv3iSwtktlHc3Otymzr48n2CFILLfpEbnFz+YvsQONonpWdCGBvgXg6Zz48OI=
X-Received: by 2002:a05:622a:18aa:b0:2f3:badf:beae with SMTP id
 v42-20020a05622a18aa00b002f3badfbeaemr24132569qtc.229.1652282537921; Wed, 11
 May 2022 08:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220511074522.28499-1-kai.kang@windriver.com>
In-Reply-To: <20220511074522.28499-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2022 08:21:52 -0700
Message-ID: 
 <CAMKF1so30+Ec6+vMCCaKaXy8hrJUeT3pDk=sE2Xa=DPY-VxHFQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] wxwidgets: enable to use private fonts
To: kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 15:22:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97039

On Wed, May 11, 2022 at 12:45 AM kai <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Enable option wxUSE_PRIVATE_FONTS of wxwidgets if build with gtk. It
> allows application to use the font from the given file even if it is
> not globally installed on the system.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2:
> * use upper case 'ON' to align with others in oe
>
>  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> index 6b57cb54c..b9b1dcf0d 100644
> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> @@ -39,6 +39,7 @@ EXTRA_OECMAKE += " \
>      -DwxUSE_LIBTIFF=sys \
>      -DwxUSE_REGEX=builtin \
>      -DwxPLATFORM_LIB_DIR=${@d.getVar('baselib').replace('lib', '')} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'gtk', '-DwxUSE_PRIVATE_FONTS=ON', '', d)} \

why not add it to the packageconfig setting itself ?

>  "
>  EXTRA_OECMAKE:append:libc-musl = " \
>      -DHAVE_LOCALE_T=OFF \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97033): https://lists.openembedded.org/g/openembedded-devel/message/97033
> Mute This Topic: https://lists.openembedded.org/mt/91031050/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

