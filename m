Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5704C64E7E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.10911.1650476585253723965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 10:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AEadqY1p;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b24so3254281edu.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LJoSu59AH3/HieHaB4l2cPulWEAEe3gu+6XM+5ZhnBo=;
        b=AEadqY1pd2Z55bH9aM2TaYTqal4TwJQ0Wt9Ew1ZyaARmljQYUkLcKIPpf8s8mWz2iq
         z9NQSbK6IL6vbK2cq7v+nCIF+Ah2zVL8N/AzjXuvOvXFdaFICsE0B/n7BY54f5phfcbU
         o1tivFFDn79uJJMa3PQe2nHGFhEeWNDqRTvIgx0iatu6PuOZRpPeaHdfIqK9CSMiRetY
         W3tvOhP1UReomp61Vz1M30e3UDM4CWWwpPdQic3I+S0A9IhQhaG6t29mjA2YbIylrXIz
         Z5AHf4aGnY+wzfbFjS1M3GAiZEXpGVOLZ+u48cUgjXlTMLAIsiD1V8SnMV0GylGQrs02
         Kqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LJoSu59AH3/HieHaB4l2cPulWEAEe3gu+6XM+5ZhnBo=;
        b=rYcNz8ZJ+7xolMC3Vdr+L6KeYFBXmMHgOnOWbOw/RI+WdRBRXwCn5t7PbxGOS1L3D6
         uzh/vMvhy5FcAl81I28rTg0R4Tccc70k074JMfUFeXixDR4kWd3R8iaMpuZq2MqOIZku
         NxF3p7TJovZnd+hA11DxxVOsgJzeV0kM6/ti7Gb6rOdfsGHS6FFIZcqit6/MFnFl/Cua
         pQ0YwU79dgyU4AiqDDcdKNt0bmMNbUpYj2tsUJDOWgoiQeCXtPgkrDSG0sPqCocYEOj+
         YeIl+gmwJjghRu4Twoc2kvkXROvvxB+clefpirg4uzqkHy5LVTw2gTZdCtWWrWlip/66
         /hiA==
X-Gm-Message-State: AOAM533LvC9ycHKQfXvAzavy1MwyVYcxocy6EoVkn4Rs5LrbMvQsTsST
	2PQPr0r5tEgs0hv0oB9WQYrLZOHbptXEdA0kYbE=
X-Google-Smtp-Source: 
 ABdhPJyslQpIA2/cFOOVf3IU0WreQiWWMW4n5i0M1uHUTXlrdml8d+Vg34uYmKgapH/EQhxBAHbQosGcW5ZoRE2hiUg=
X-Received: by 2002:a50:baa8:0:b0:415:b0bc:6353 with SMTP id
 x37-20020a50baa8000000b00415b0bc6353mr25019536ede.220.1650476583745; Wed, 20
 Apr 2022 10:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220420094227.2826875-1-dmitry.baryshkov@linaro.org>
 <97a9dad0-fb8a-3bf0-8ee7-f45494e37cf4@gmail.com>
In-Reply-To: <97a9dad0-fb8a-3bf0-8ee7-f45494e37cf4@gmail.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 20 Apr 2022 20:42:52 +0300
Message-ID: 
 <CALT56yOZ=jr48+-9-Ko2AdqoK73_+KtG53yJRWgx25dSjQhuVw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gpsd: split python utils from gps-utils
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96716

Hi,

=D1=81=D1=80, 20 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 17:53, Khem Raj <r=
aj.khem@gmail.com>:
>
> It does not apply on top of master-next, can you rebase
> and resend please.

I have rechecked, it applies on top of master-next w/o any issues. Did
you push your master-next branch?

>
> On 4/20/22 02:42, Dmitry Baryshkov wrote:
> > Neither gpsd nor significant part of gps-utils depend on python. Howeve=
r
> > installing gps-utils package would require installing python, which add=
s
> > about 17 MB to the image size. Split away gps-utils-python to allow
> > using gpsd/gps-utils in the systems with limited resources (or in the
> > initramfs).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../recipes-navigation/gpsd/gpsd_3.23.1.bb    | 23 +++++++++++-------=
-
> >   1 file changed, 14 insertions(+), 9 deletions(-)

[skipped]

--=20
With best wishes
Dmitry

