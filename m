Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27362C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 19:39:48 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.173.1648237187224983346
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 12:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mcfJvUU1;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id g8so6794410qke.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k31GM7jfSVxk2EjLhobMLmFpwQrJiDyyKuEuVycJYNs=;
        b=mcfJvUU1Y0F1RO6OIC3XV9KA9kf7RlsuULAiSFuHlvhMInwz+Nr8Nja163lWX0Zna9
         86Tcy6T59n8RdgV1NH3ftVIn+/pojHjJcLpUBt9LezgYyLqfjMsXvFDUylfvQeDnZTDT
         1HqpyynHZicTie1EH1YrGA6LKUbp8J7LpgDbuosAilhdjm4yMKVza57PaqCanPSnfSeW
         q3h3LOaAfOuUwjgdp9S54zAF4PyHEH+GPDy0WjBUDCvQxQ0ij99dZXTf3OpiIL1VbHx2
         FXae79Uk9XMQDo2l87R9I/96XCSSUf+tUpSmz87y7aM3BPHnPqTnUoAZCyVETlkJ9CJz
         YMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k31GM7jfSVxk2EjLhobMLmFpwQrJiDyyKuEuVycJYNs=;
        b=37jc2TCmyG75VjckQ6CDF53VLIktbJeqMGDVYO9ZJnsoHVXjIqUtXoxbJLvtbdGPyS
         Q6G7AwvPvOgtM2xjMDf++w10Z1UNV4lD+JI6Lihgq3CQWWiUuA5QGvJVttVdS5H7+6P8
         tvRO6T8CyPwb86UL5+wjXh6K1cD94hEKg7qjL4+arfyGqxNVMLvwK/n6F1JMjuLtZoKp
         N5ZyHJ66k1ssibptIV0DKo+WPV+DLubFVLXaCyTnmFNxjplGDq1ZfFuPEtoY9Gry/l93
         xj0tGJaLNihK4aowlQ9NHlWD3v0QsmGHKNRMN/6b1nZiAP+Ge4wSy9sFFKzt9/rbG9m3
         uOBQ==
X-Gm-Message-State: AOAM532FzeIViLeCvaO7x6jEHvXi7xQvRJ2JkEWqHmgWb1BV+6N9YNnw
	WwhboD992ZvWvi/E8JIoMWYC/Aevm5ubiY/ieysXapaz
X-Google-Smtp-Source: 
 ABdhPJzoMAwbsTIvmfAmttuSBBhHOa7VhG5dr13G4XIAgHvoLjHyKhXrQqeSHXgu5WuEq1ySLwoxreu7D96uZZlgMxw=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr8026003qkp.463.1648237186212; Fri, 25
 Mar 2022 12:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220325190048.192697-1-saul.wold@windriver.com>
 <20220325190048.192697-2-saul.wold@windriver.com>
In-Reply-To: <20220325190048.192697-2-saul.wold@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Mar 2022 12:39:19 -0700
Message-ID: 
 <CAMKF1spO6gfbmUo9of-Cv_iJF1nHT19izQu1B=tc42FS9XRO2A@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] depmodwrapper: Use native staging dir
To: Saul Wold <Saul.Wold@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Mar 2022 19:39:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96212

wrong ML

On Fri, Mar 25, 2022 at 12:01 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> Use the native staging dir so that we can get the correct depmod.d configuration
> files. When depmod runs we want to ensure that the newly supported exclude.conf
> is read so that .debug/<module>.ko files are excluded.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index aa23ba41276..9921b7e8ad7 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -35,9 +35,9 @@ fi
>
>  if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
>      echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
> +    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" "\$4"
>  else
> -    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
> +    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
>  fi
>  EOF
>         chmod +x ${D}${bindir_crossscripts}/depmodwrapper
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96211): https://lists.openembedded.org/g/openembedded-devel/message/96211
> Mute This Topic: https://lists.openembedded.org/mt/90030002/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

