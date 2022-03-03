Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79064C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 20:32:28 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.15971.1646339547658336133
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fKA60uMX;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id t14so5698818pgr.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 12:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wNnSh8E7+9Gh/Y3s28T+718zWL6xjHymlBfIfhDpwPs=;
        b=fKA60uMX8hOSnNVAN5aPSeUqdQK811GoTBXoif9RdjVE0uy+H8G3dUG/Aup99m5M3s
         LPF2yAyN0fSFfKvlNoo6r1naDl5KEmek4VtPONav+abLi2o4jGdz2Hog5bUS3g2zacG8
         LpQrPSQtb1NDZ+azvKtPs4XQAHAN3EBN6n5/AVL+10vUnO/+s349qlG7fXUQWLfn+8Er
         TMitDzrHMm2k4BM/cAMhCx1aHgh0+swVi3eBKrYZHvpxaCnYSZn1wQqxY2JZD1oK0tu9
         WpKbLwp5ocNFfsK4dsCTs8VwB4Yx29r6X/+OVTUHr6c3yu3CbWI8adN3NAb7HUZe/yii
         LSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wNnSh8E7+9Gh/Y3s28T+718zWL6xjHymlBfIfhDpwPs=;
        b=pPG2ZfCOXUB/20B8EjX99Qde+4afib27qy5M2GZgE+/XnHMV+y63iKqgO2xBZQE0BU
         4coMfHglAdWEsKCxA7i4LX5sZ/lvhgH5hPrD8ptcBtI2L5vbgYRCdq+OtfAgD43Unfzz
         MtciUiv9wy0Qie/hSx9JLj/DSnzgkWNtiogUyyum99uHTeLjv50COl0Lbk0fJYbooMg2
         UgFyr+Hkpurq+H50tFCgVl3SOpqnSmD+G1YWaaT+aieoZFHw9f3p84DiMtuVrAYMqOng
         XHrXgho/g/vzXSM1ydFvBHh9tZuGYp14NohUsu9lm7kTkCXvXvHzt+qiHxo+sKlLRddD
         p0uQ==
X-Gm-Message-State: AOAM531yKRz4tIJGNPJUrbF4zB7ASfbFHxNldCs0uoCmL9ajva0o5RML
	M1hYwgcsf8CxQ9KiKckOc5fHbY+mna1GcxNdIuo=
X-Google-Smtp-Source: 
 ABdhPJyVeg69wUBvbaqqX6FIBqAZIwevcYCUV2U1ZYklhHUA7AJDHuFe/BoLQ/EpDRC0G/LlA5QH25I+cm+tl4/W0Kw=
X-Received: by 2002:a63:e54d:0:b0:375:5987:af5d with SMTP id
 z13-20020a63e54d000000b003755987af5dmr32020740pgj.14.1646339547145; Thu, 03
 Mar 2022 12:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20220303073138.1434568-1-f_l_k@t-online.de>
 <CALbNGRTM1_J=rZHXisUj6hJZ1Hamcj8A6NWrAiFxhv47sUrZ7g@mail.gmail.com>
 <21198b64-b539-57e1-d5a9-09c7e762610c@t-online.de>
In-Reply-To: <21198b64-b539-57e1-d5a9-09c7e762610c@t-online.de>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 3 Mar 2022 21:32:15 +0100
Message-ID: 
 <CALbNGRRVxyov7VUzRFd-h3-H+yoUNNeHefO61Z9nnsE-dqJ0_A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gjs: update; customize dependencies
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 20:32:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95756

On Thu, Mar 3, 2022 at 4:12 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> > What about gnome-shell - or why go backwards?
> That is correct. Since I'm not building it, I didn't notice that
> gnome-shell now also uses gtk4. For me, gjs was the only recipe that
> included gtk4.
>
> But since it is only needed for gtk_tests, I sent a v2 to disable it.
>
> However, if you want to keep the gtk dependency, I'll send another patch
> that contains only the recipe and mozjs updates
I checked (ok with gjs-1.70.1 but let's assume similar for 1.71.1):

* skip_gtk_tests sets ENABLE_GTK -> "yes"
* ENABLE_GTK is used in folder installed-tests only
* folder installed_tests is not build / run (unittests) due to recipe
setting '-Dinstalled_tests=false'

=> skipping gtk-tests does not change anything or in other words:
your patch V2 is fine - thanks

Cheers

Andreas

