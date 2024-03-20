Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34A2C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:15:53 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.49565.1710951347972146364
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FQPnNRNN;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2297d0d6013so58626fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710951347; x=1711556147; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FZOwaEzLyVD/D9JgcEb4hYeYNoqn7Q4mfrTS9zPyhk=;
        b=FQPnNRNN6kFHkRWpqgMS4SIMlZga0264tCI4wWVRE8Po127SAbpvUHRV1eqnQe5sxb
         BQh0zX5ZwdrnaU9H3hcYYj1xNzPHCHE8+goNfABwPTts2IgXcwnQg2GlZQPP7JLpJfFd
         y/TwnF9Tizllm5s0Fvl0MTcSBnHV3GXFUcQSem8RKIbRfO81co8mUAguSGpsbKej06il
         BecPVotr58LQNqcLIJ+M5iJ8EbNXjeuUBqjOLVPZumFDVvNrUx4AtUXOJxVpGNJeC8Zu
         hspgblfIiKynbCjtC8sfycueTskSgpK0KmpwSnZwEl2sJ2yK7RgYjkRQv3BMZDqrGfil
         HFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951347; x=1711556147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FZOwaEzLyVD/D9JgcEb4hYeYNoqn7Q4mfrTS9zPyhk=;
        b=Wcfo6w65/61RXUFRBB1F9U5EFTOpPJLz+7cQbiRzfb1RjLkSAp7HLQabTg5rRHA8Za
         REfIH6PeVaHq3ELJQKhvAnTontPuvHDkKp5s4KYW76fL5CdE7GmrBxACHiPbZs9Lko2Q
         oi7aTeqWyE2gckvxnN3hqDIG+E3b2qOqnIzDdAWb7h6GhITLrnakGnP4I9LtoSkloa+Q
         foRYmxztVmiccJeRkyNJGtug/Bolx/mYInZDJqo2c+GS0Rh3El2SGLH1fd3TKFsXp9nk
         K9cITkQ4mV2SmiPl6TUHG4EU2fFo9vd3zcW5Ib/c3030L+nSOJEEfj897stIc5MjmJmD
         jgRQ==
X-Gm-Message-State: AOJu0YzMxdB8NEJV4xa1MOdZ3e0R93CJcn/steINpBaNyWFLHUiVxaGq
	zyTX4HsyZ63gPwi3Ow/XfRd7u8BYyc9NG4ymRMqwnfL+4ihZ6NSmyHYmMS4bey0a7b3MPmvUyA6
	ZpIBfClNeU51gvflTMNlgNAseee8=
X-Google-Smtp-Source: AGHT+IFZree0oMXTlDYsvfiQuaH5Z3ws+leBByjkCUXuzJokHNKyPyBHlnaKgwBdifDo2f2UfiaJoYiU07tGkGJZCXI=
X-Received: by 2002:a05:6870:e3cb:b0:220:d5cb:1450 with SMTP id
 y11-20020a056870e3cb00b00220d5cb1450mr2727363oad.10.1710951347232; Wed, 20
 Mar 2024 09:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240319065735.33275-1-f_l_k@t-online.de>
In-Reply-To: <20240319065735.33275-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 09:15:20 -0700
Message-ID: <CAMKF1spcj4c4L1OmsnP4ag0NXUWpVT3jujAc74TMcRMZJfxnBg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-calendar: update 45.1 -> 46.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 16:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109490

its failing to find libadwaita

https://errors.yoctoproject.org/Errors/Details/759579/

On Mon, Mar 18, 2024 at 11:57=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> - this update will require libadwaita 1.5.0
>
> Major changes in 46.0:
> * Updated translations
>
> Major changes in 46.rc:
> * Improve AppData information some more
> * Various code cleanups
> * Updated translations
>
> Major changes in 46.beta:
> * Improve AppData information
> * Use the Settings portal for the show-week-dates setting
> * Fix daylight saving time events in the Week view
> * Add accessible labels to a few UI elements
> * Use the new AdwDialog API for responsive dialogs
> * Tweak the visuals of the Month view
> * Properly make Calendar stop the weather service in Flatpak
> * Updated translations
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-calendar_45.1.bb =3D> gnome-calendar_46.0.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_45.1.bb =
=3D> gnome-calendar_46.0.bb} (89%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
> similarity index 89%
> rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.b=
b
> rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
> index 99cb9f67e..707c4b583 100644
> --- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_46.0.bb
> @@ -22,7 +22,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
>
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>
> -SRC_URI[archive.sha256sum] =3D "7fa8507543865aa7432bb5319830c87158b5447c=
a09cca45b607dc6796c71008"
> +SRC_URI[archive.sha256sum] =3D "5e21960c174bd8606d9089bf79c70f31070ab483=
7919878b00db2f14af9fe718"
>
>  do_install:prepend() {
>      sed -i -e 's|${S}/src|${TARGET_DBGSRC_DIR}/src|g' ${B}/src/gcal-enum=
-types.h
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109472): https://lists.openembedded.org/g/openembedde=
d-devel/message/109472
> Mute This Topic: https://lists.openembedded.org/mt/105019701/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

