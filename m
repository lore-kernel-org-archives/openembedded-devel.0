Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1EBC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 17:48:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1847.1713203308577347523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 10:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+OoMxlY;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41864cf2f5aso5354185e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713203307; x=1713808107; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA6k0Zpkl6DKS8/EMytiujXHrkbND0F/JCCnyxSqD1s=;
        b=Z+OoMxlYIphMKQTLBkgdFtYCtq51gFu2Dd1MErt2imVdktQWwq1YDQsqb7Y9dPlAAi
         Cq+ml2DRXAIAKUbhAsQV0W4Ru/brfajYcf4qSS7dqZzHA9r022WmgsMrMW9JtwtH4DBM
         Aj9eku8o+ci2S6xTdJfibDk8RW9r0ga3cKj+NzHZKP7RBnCjp6tulsPfoE3421Fo7vMq
         ihd7fLYbD07PUBHYVAea+hNR25EVCj/VzJeTpHSyVvp2duN6e7l0d4dun6Cfdovb0Wvs
         7CcPxv/I/HMtGcCPrssZmQ1KFkghsb+DMZEYd6JEfDnqjTAut7ojlvh7ZTOMYyekaHsj
         +/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713203307; x=1713808107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA6k0Zpkl6DKS8/EMytiujXHrkbND0F/JCCnyxSqD1s=;
        b=O0ZKRP4G2Jdj4zJf3/WEnLjKu3SmKRqadWgMuyjSTezXhv+tGb12lNyEm48+9f8RPs
         DhfzCpDpk25e1tGf7HXjnMGTz6wIZAs+Dn3l6tD/aFHISG/mGWnXhtyNkqznWBE3Hxv0
         2VLKUbI4cxPQxknRM46V96yaSymYtdhBQA5K/51a+9RQZs2Fv8RTJbTi+J/LyZmiH/ZR
         90U4LEpBTG8EI1PZGs5pz7Kaxf95SnBaWzoIT+bRaamWjWLPbBG9qgbKtZAixjR+Ma0R
         ZeMjNrEJO6U3xgA4h3srIXbwiyScwrNPpTRriVmnnosas2CPfMrQVIuf8qe24q0RWC0q
         dpXw==
X-Gm-Message-State: AOJu0Yz6OEL9nDWEK8Sp2YshpW4Ost9gONE7sE+BsQCIS+yFmWGUIj9S
	vVk7DqtpweobLQCWO6JqYxydA9yipfDDQZoHOgqjkIl/T/5X91rhZ5dWdQGgKAJyQpftP2hve1v
	6wFs9BPe6lJHV9sZSOEZ76KusUbQ=
X-Google-Smtp-Source: AGHT+IER6dSY5/t5AqN9jOMjeEimPYmZESRLDvf/vBQZRUlZJyE0FTkDx9XNkX22i+TOMzHc1vhl+rtr7E85GLN+3os=
X-Received: by 2002:a05:600c:4e55:b0:418:4f7c:2c74 with SMTP id
 e21-20020a05600c4e5500b004184f7c2c74mr3019135wmq.20.1713203306756; Mon, 15
 Apr 2024 10:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de>
In-Reply-To: <20240415131443.7295-1-marex@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Apr 2024 19:48:15 +0200
Message-ID: <CA+chaQcJXRzwTd4Hh=2gYZ7aQQDw3DAFSFq7=KH67-dhgODz1A@mail.gmail.com>
Subject: Re: [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT for scarthgap
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 17:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109966

If you need it just for some experiments than feel free to use:
https://github.com/shr-project/meta-python2/commits/jansa/master/
which I've already updated (for built time benchmark which
historically included qtwebengine as well
https://github.com/shr-project/test-oe-build-time).

But for anything more serious work with your customer to switch to
something more supported, there are still minor upgrades to meta-qt5
(last in https://github.com/meta-qt5/meta-qt5/pull/556), but it's a
dead end and switch to something else should have higher priority than
switch to scarthgap (e.g. switching to meta-qt6).

Cheers,

On Mon, Apr 15, 2024 at 3:15=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> Support both kirkstone and scarthgap as that seems to work well.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 38ef579..0f228ca 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D "1"
>
>  LAYERDEPENDS_meta-python2 =3D "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone"
> +LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone scarthgap"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> --
> 2.43.0
>

