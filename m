Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD41C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 03:59:37 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.27161.1679889573794273815
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MuN/WyWN;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso7903328fac.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679889573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgbYk7/f6iluHBZ2BOKJ6iOgMGzaSkp+8BK4yCxgUD0=;
        b=MuN/WyWNvReIJZXy89w/FItAq9qiu0aYEqF7ZF3TirWOIPgrxCjgWig/sfSS+9IaA1
         ERhpZcVBXDZBgpaGlYpM3tF5TivuVFxRqCECRwBHIdZXEVFbAlhikG0fl9kD5gdyMpD/
         3pWW7Gc0WyhMF2mpaSA8MCW2FN5Oltj5i3g9O9W69zLLJeq4kqPRvSPEsajUOb1dMLwS
         IiGjh7qT8cp3PB9ErDgEgFI3V4ZDwWjWsM5WJuEhLJ/dhIOg5IVzspYSVsh8+q2jwKjE
         WD8N/5awMKHwTOZLxw8fsQj19WnNwcGi+BOAlgN6ie1aLijgmhEX7D5SvXZfkpcOOCA1
         c2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679889573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgbYk7/f6iluHBZ2BOKJ6iOgMGzaSkp+8BK4yCxgUD0=;
        b=jPvejgH6sPSsecz3Q4HvHR69Kbkf3LctSh64k5FmVqN1CqSbiTw7gkK+TQmCRU3h+a
         DJqae9TfZNKNozZMedfhlnSQaH/C7WnWjTEwZmQ0Z8C1E+UZo46On9JXtMRBGm/o9AXC
         Y5FgQNuZUP17zgVCPdDAXG1lF6mN1V6VuTm1JRWnesG8LrHSvVsA0sfb9qIf0MpHxw3K
         0O0ZtAq/YH5N0EAlyk+19TVy1TxZhzpLF5qaZDtSaZu6LuVI25S5GKbtXiYk0gCe1I6G
         cF5aPcHPRyb28QH7LuJzXw1gT394frEXp/hLWQT8w5r+0r3qyDscMyxPY6A2h92UADLO
         sCKQ==
X-Gm-Message-State: AAQBX9dbSamuiU65aptlArHd1C9Khx1yxv42vxIqf/F5uxTXjJF2pajx
	PW2Nq4gC5hgzMs00pKwONA+aXDNtDFtH8UAJyso=
X-Google-Smtp-Source: AK7set/oY5HZmDbvZ58JhylszMqRoKNoDf8VFGzJj8bq0ke4XUf5sMbe2hVdD3SndpjmmRjQ+JMGIU0LPmMlYZvBagE=
X-Received: by 2002:a05:6871:e09:b0:17a:b713:63e9 with SMTP id
 vj9-20020a0568710e0900b0017ab71363e9mr3421859oab.4.1679889573004; Sun, 26 Mar
 2023 20:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-21-f_l_k@t-online.de>
In-Reply-To: <20230325080256.923752-21-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 20:59:07 -0700
Message-ID: <CAMKF1sr9-1O5dykVWq_iXdKF0eNZbrXz-ftWMv7+9yejkX7tGw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 21/32] gnome-terminal: update 3.46.7 -> 3.48.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 03:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101769

Fails to build like

| ../git/meson.build:348:0: ERROR: Dependency lookup for vte-2.91 with
method 'pkgconfig' failed: Invalid version, need 'vte-2.91'
['>=3D0.71.92'] found '0.70.3'.

On Sat, Mar 25, 2023 at 1:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-terminal_3.46.7.bb =3D> gnome-terminal_3.48.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.46.7.bb=
 =3D> gnome-terminal_3.48.0.bb} (95%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.=
7.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
> similarity index 95%
> rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7=
.bb
> rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.b=
b
> index d9afeec46..75e609d15 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
> @@ -22,7 +22,7 @@ DEPENDS =3D " \
>
>  SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3D=
https;nobranch=3D1"
>  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
> -SRCREV =3D "816edf80cd7bf7f253366099ea9fcaf361676139"
> +SRCREV =3D "a85ecc959344ee2e0d345f7dd081dc781d95d364"
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ?=3D ""
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101733): https://lists.openembedded.org/g/openembedde=
d-devel/message/101733
> Mute This Topic: https://lists.openembedded.org/mt/97840043/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

