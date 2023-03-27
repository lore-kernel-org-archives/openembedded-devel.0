Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B8AC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 15:07:40 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.37691.1679929653795337570
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 08:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f0OahrVv;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id bm2so6584251oib.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679929653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZy7CSM+dLsZIWB8oruSOC6xKeYaXgagk8JUZQjy+aE=;
        b=f0OahrVvM6gXJpeUVLWcyjB0tjQ7K3HRzmYmITJQz0RkM8zSx50dSeM1Dr9DH2kC50
         COanWJIk1VfKJmKaAsE3O12h/q6uthk1t5I4QIVyeyn7KQ9hEWm+oN93KgWoqcAmh6PG
         UB821Y8o50ln+Ufyk6C00nSciU944eP/+w5Hl4A9lmFEGwzSRjSQmtJ8O3hs3X9WEPxF
         +p8PBw+FwHS/buDz77X16TQT78w91mJN01faQZdORhEw15fYgeeix2LCDAdqpn0Q42t3
         5sdQavwdRWQiG/xKXYDV1FONP7oCGmiTyL7ucOnvNKkUOUiPqQH7WX7KGQlCVQdgorQ3
         aJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679929653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZy7CSM+dLsZIWB8oruSOC6xKeYaXgagk8JUZQjy+aE=;
        b=O0gTUZ4VNPeDYdpX8SNKqYMy3XhAW75fk+CuWMTJQnv40FYyuqcQgF3ns0EOVJeeOY
         del/H1hvC8Qc7vKcjFpek1SHqdkzOtvYJ03NWCqfId47gtq6qZ8zbZy1iIOxhlgkEe24
         le17kP/ngWsC9ruMP/fd4LeibhlQQWtfvhwsN6HPDD/Ydc8I937SLzHNDy2GPwuKQumu
         y5IElb0UbJDcpsXmZrkYtZ7KnD3+NlpKzOsJy3bYxikqw8n6DnUItmdVifErwifQv2HH
         6IB5So2lakOaMzYlOG/44sF6UrwE8dCSqW/Pow7+wRFCEAe8Wo6Vmx7bw9ZB4eCTk2wi
         OVPg==
X-Gm-Message-State: AO0yUKVCOQjIrQamN0IPCj4zgSTDhv4DxIVSn5e6Pfy3bHB8xWMpctQw
	pC7F+Dox1oxC1rHqm7CU4hXEbIADPP3G/8mrJ3I9GucSlgc=
X-Google-Smtp-Source: AK7set/axGZj32MbrRLaKGdCDBUWd0+UMRXFFk27lmLegQ7QQUfckwYim7/E/4LTbH1C+Pux9nTtScjaKoxLW/eoPOQ=
X-Received: by 2002:a54:4685:0:b0:386:cb70:3828 with SMTP id
 k5-20020a544685000000b00386cb703828mr3308700oic.4.1679929652678; Mon, 27 Mar
 2023 08:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-31-f_l_k@t-online.de>
In-Reply-To: <20230325080256.923752-31-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Mar 2023 08:07:06 -0700
Message-ID: <CAMKF1srVV-rjHTXa3W-a5hmduLrG2viaxp3eYEQz7KSktzBh_g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 31/32] geary: build with webkitgtk-4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 15:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101785

ERROR: Nothing PROVIDES 'webkitgtk-4' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-connectivity/geary/geary_43.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/zenity/zenity_3.44.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/yelp/yelp_42.2.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/rec=
ipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipe=
s-graphics/surf/surf_2.1.bb
DEPENDS on or otherwise requires it). Close matches:
  webkitgtk
  webkitgtk-3
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'geary', 'webkitgtk-4']

On Sat, Mar 25, 2023 at 1:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-connectivity/geary/geary_43.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_43.0.bb
> index 08899fd4a..edbf4032e 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
> @@ -26,7 +26,7 @@ DEPENDS =3D " \
>      libstemmer \
>      libxml2 \
>      sqlite3 \
> -    webkitgtk \
> +    webkitgtk-4 \
>  "
>
>  RDEPENDS:${PN} =3D "gnome-keyring"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101742): https://lists.openembedded.org/g/openembedde=
d-devel/message/101742
> Mute This Topic: https://lists.openembedded.org/mt/97840052/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

