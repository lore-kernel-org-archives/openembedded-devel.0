Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F51BC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:42:21 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.2600.1648694540878091387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FgEHXQZM;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id g8so18737466qke.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCRIVVXklKks/49Xt4np+9D1+s8H3W4ES/U5ChjscJ8=;
        b=FgEHXQZMx4oxB2DsqXvav2CiuSeoL+66WGWFE/K8Gw4w/xGIuhh7BLN9m9YvUMKmzP
         7rQ3uHlPEDjXmLXfPHBj81s/aBkSQfrKkT+fYvW/Ymwwte80DkiyJzBYieTDmk/FJPUp
         +RrzmawX2eVJ4TFFQkHHD3PDILsvQzk2jYeezZQkUB9dKxzfFZ4VSw6ou2XlI5+syGkI
         BFfiokF3s52zoVsxUrYTAXgUr8B8MelGZ84ObD5qFJcd/Sy6UHXOY5IpkPALEcbPST5l
         9Z3ar5SVwensTgFI/oYk6ZevwyKgi1bZuY8HHOnj9Kv9S0V3m48mmxHmx2s8MrK3rDV6
         QJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCRIVVXklKks/49Xt4np+9D1+s8H3W4ES/U5ChjscJ8=;
        b=OtsGsI7eBCYd/GRowaS+l2rIWBKcZqQRo97bNFGK/GgitrlQmW4iUyfgae03nD695A
         Pit7GmEewXqzTSt4QsIqL0qdOmGULEajKqmdYGoY2K1uT5G4awAolgNxGZslUfoT2Wk9
         DDOBq9f9ZvNvVcUCSk0kyXYE2YUrra+abv4AV5foH4GuKhIS7rFgmVEkkT62bw1hJaUv
         PU+bm0549Vh1hmj0jPRSfjrymFw+gxUtwI8SXKdPNf3hissCSSyQ3VVOniICD4W6rGVP
         c5g8uggR0Pq6q8fEc1WSHgyJrAPQPgjYXDBtFjTjy72io54mPtooY1C4nSJAFAonTeeh
         t/bA==
X-Gm-Message-State: AOAM530fZcwU9R67da8RU9vQcbWetuWwpodLUxVPv37OZ36eHczp/4ME
	6JJXwb+iaxVTSNBi6DCu3EKyfYzUKP+m/sBtIf/gt7diG+0=
X-Google-Smtp-Source: 
 ABdhPJy6UIYuEA+XT05/YVF1oihq27guJmrlcr93vFc80Xbvq5hohpNyIR+TRNNr7X9bkfBm/QXmzTrcFIlSX+D84dM=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr1906601qkp.463.1648694539718; Wed, 30
 Mar 2022 19:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220331021648.16582-1-potin.lai@quantatw.com>
 <20220331021648.16582-2-potin.lai@quantatw.com>
In-Reply-To: <20220331021648.16582-2-potin.lai@quantatw.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Mar 2022 19:41:53 -0700
Message-ID: 
 <CAMKF1so_bU3MeLOjmtYBgTGg0Wo-_sRPWi2KsObge-7Tzpj_7g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/4] libimobiledevice-glue: add recipe
To: Potin Lai <potin.lai@quantatw.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 02:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96280

On Wed, Mar 30, 2022 at 7:17 PM Potin Lai <potin.lai@quantatw.com> wrote:
>
> libimobiledevice-glue is the library with common code used by the
> libraries and tools around the libimobiledevice project.
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  .../libimobiledevice-glue_git.bb                  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
> new file mode 100644
> index 000000000..28303d082
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Library with common code used by the libraries and tools around the libimobiledevice project"
> +LICENSE = "LGPL-2.1"

can we use SPDX notation here please this would be LGPL-2.1-or-later

> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=6ab17b41640564434dda85c06b7124f7 \
> +"
> +
> +HOMEPAGE = "http://www.libimobiledevice.org/"
> +
> +DEPENDS = "libplist"
> +
> +SRCREV = "ecb0996fd2a3b0539153dd3ef901d137bf498ffe"
> +SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +inherit autotools pkgconfig

I also set PV to something definitive I see that its using 1.0.0 in AC_INIT see
https://github.com/libimobiledevice/libimobiledevice-glue/blob/master/configure.ac#L5

so perhaps use

PV = "1.0.0+git${SRCPV}"

> --
> 2.17.1
>

