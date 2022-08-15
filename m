Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB479C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 16:27:01 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web09.4447.1660580817440666503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 09:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ysjl6Kkm;
 spf=pass (domain: gmail.com, ip: 209.85.128.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-32194238c77so85550407b3.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=q5Ck4r4AN7Cry3Vkpqvy4hBnW0XyYt+7l33STstqPtM=;
        b=Ysjl6KkmYz6XnSfcsJXnvYZzKbU9QAB5cbo2jdyo141gETexdCp+422mpqGZhusDkS
         T+ud4vrgbH36BRu6dnW3NaM79amBqP0quBo1zzhaOLV3sOVRJ0JszBQwWJ9Ft/6QeEu9
         DN7e5N2N6BAn86xus3jOv8AiFJzA9WM1z+39q5An26mExgxAYWnPbkpwKUHVu1NaT3II
         vzcOUff+y01GxFLYaoUpWuf6xaAXGP42Hgr9kDQM6sZUPDrLyOfJqiKmJw3Ct5quf8l6
         Mi795zL+tZzrA79hyf7wBSVR+DjoyZkMgoa3HbbhAyKWBHikyZ+0r2Pu2Dn0uukVcus3
         wRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=q5Ck4r4AN7Cry3Vkpqvy4hBnW0XyYt+7l33STstqPtM=;
        b=mFzTeo6DZsxkPQpYV22x0sKjL85J+Jski/oBM4/p4hJOSRr0NFTm3/BLa46n8q7yy8
         bojBgat0lbQGYLFPS6Ym3LC9LMgs7Z2nRguFMYI5Zjno3n7g9Z6VN5HgRvjeVxniV2BT
         33OZAG0P/rlfuqxAYLOVCs9EA2QIjsfaBIdQK4EPsQcTZuPw+pc/H0Mvp+bo6PK8suHN
         AOC/DNRnHTwNGxXKkE/XN3elTDipW2XuO8A7MeUv1uKE1bofSZNj/VJwHlQ0khttem90
         w+okppSr3rjPvx7RYtMRkBj9pdy0tfEc8LtHZZK5TZjkm0H9s8lnXh7dXOB3M0pJLGRz
         v6Sg==
X-Gm-Message-State: ACgBeo1/tyHnQOicvk53MJL96BDlkIlLnDu4NVel6zJM0/sf4xac91EI
	hSNe6ASWEbrt6ERfF/cRSdK7tp+GEI9VwqpSRvc=
X-Google-Smtp-Source: 
 AA6agR5g/Bz/4ynkHKBPYcwss3xwlrlv8Er8S9o98W7jeUHUmcj4QOrJ5xPRHEopSgE1Fj/vYZMJjQwgJ2b3JvciL1M=
X-Received: by 2002:a81:6e87:0:b0:323:828:2175 with SMTP id
 j129-20020a816e87000000b0032308282175mr14032014ywc.71.1660580816472; Mon, 15
 Aug 2022 09:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <1660546148-1668-1-git-send-email-wangmy@fujitsu.com>
 <1660546148-1668-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1660546148-1668-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Aug 2022 09:26:27 -0700
Message-ID: 
 <CAMKF1soZBNB9jU_piH-Vuh7-PHw-QW1MJ1zZpDc4RF_tKFd=3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] toybox: upgrade 0.8.7 -> 0.8.8
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 16:27:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98259

I already have this done earlier and its staged in master-next

On Sun, Aug 14, 2022 at 11:49 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-core/toybox/{toybox_0.8.7.bb => toybox_0.8.8.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-core/toybox/{toybox_0.8.7.bb => toybox_0.8.8.bb} (97%)
>
> diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
> similarity index 97%
> rename from meta-oe/recipes-core/toybox/toybox_0.8.7.bb
> rename to meta-oe/recipes-core/toybox/toybox_0.8.8.bb
> index 3441568005..89411cecc9 100644
> --- a/meta-oe/recipes-core/toybox/toybox_0.8.7.bb
> +++ b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
> @@ -9,7 +9,7 @@ inherit cml1 update-alternatives
>
>  SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
>             "
> -SRC_URI[sha256sum] = "b508bf336f82cb0739b77111f945931d1a143b5a53905cb753cd2607cfdd1494"
> +SRC_URI[sha256sum] = "dafd41978d40f02a61cf1be99a2b4a25812bbfb9c3157e679ee7611202d6ac58"
>
>  SECTION = "base"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98255): https://lists.openembedded.org/g/openembedded-devel/message/98255
> Mute This Topic: https://lists.openembedded.org/mt/93031356/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

