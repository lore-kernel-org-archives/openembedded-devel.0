Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C6DC433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:19:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.1883.1642886356823431290
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iWE70O9t;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d1so11944217plh.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=KLWaaJCvHbgP9Ni01YCWfFK/NjaldmBrsw4SOOLT/7c=;
        b=iWE70O9tqqMg8ohk4n+COgOf22KOziCOQ3L8mzCPRK40uAZq9IaG8MXLynsJDi6kl2
         9JQEgFjEBAukFOexb92NY+lwwLSN+NranDHiNT9WBsmdsUrTCI/qsoLDt8Ae98EiVmUi
         GNYUcqn6HqYolAVqJbp7VBFmyp5+C2TUNpw5FxPLVXSnZsexQnTwp4lS8CLq1RK8ugjZ
         Mwtvm05+yNq6utQxF+4Ws/lpcWiNP1Ej/FSpdQOZe8+gZBj/3+SKjEiPm60MnEHb3KB6
         cPnqlXg5IKLxbcUVJW22iboXPo6Y5LXfiOTtB6wM5QV437346x52niW8AWAUVzSuVaVf
         mI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=KLWaaJCvHbgP9Ni01YCWfFK/NjaldmBrsw4SOOLT/7c=;
        b=uAiDeSEF1eIewKbxodGpPCMTOaIWQhcdWtVbFzl21gF/qX1Bi3zjHlmqlf00xHQS2w
         QGMAH57WjrN8gzKC5aS87dXcOWN3F97JyRqrfeuJcx8rqg+0xbtSpWxSG5s6HuAFFfOn
         PuAp0EMc2QDu9/I/QtCc4L1yaulmj9lux5m/gVxl6J2nj0Kqa4CMRo5Ya5eHXuf26zJy
         rWD1C72HHjZMArMwU4gnxImctpppJDRdOwiI0NaG22EO03OAxDQTOFMNXXdNBFQ+QMfa
         2AofNIuP0ZyhKhW9D3km1PnczheBw+FQI1iuF9YlWPke61raCm9SNX59A7ZlihOR6WlM
         P+eA==
X-Gm-Message-State: AOAM533z6x9q/C87cCyqorzidKLZQhUFKXuxI3dNrYcn+Jq5SzGtesnz
	FrTpNs9cpWil/VF4TWX+fA3sn/CqJMrVejHi+NA=
X-Google-Smtp-Source: 
 ABdhPJziR7/SwfDKRAdqLAwdxAs0lKGIOnZwN5o3avIvpasWPwYt0mDvEMgkZDAn7ZoUmnf92BK0yhCIoCx3RgN3Hfc=
X-Received: by 2002:a17:903:120d:b0:149:ab6c:75d4 with SMTP id
 l13-20020a170903120d00b00149ab6c75d4mr9164536plh.3.1642886356321; Sat, 22 Jan
 2022 13:19:16 -0800 (PST)
MIME-Version: 1.0
References: <20220120202643.3827177-1-f_l_k@t-online.de>
 <16CCB430AE750F17.20408@lists.openembedded.org>
In-Reply-To: <16CCB430AE750F17.20408@lists.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 22 Jan 2022 22:19:04 +0100
Message-ID: 
 <CALbNGRSe-7eYQqyJAZE0HU5VuKG0KLMg6TyOUphbNyg2BVbHzw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
To: Markus Volk <f_l_k@t-online.de>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 21:19:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95007

I forgot: Please add it to packagegroup-gnome-apps in a follow-up

Cheers

Andreas

On Sat, Jan 22, 2022 at 10:14 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sat, Jan 22, 2022 at 8:29 PM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  .../recipes-connectivity/geary/geary_40.0.bb  | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> >
> This is on my TODO for so long - did not find the time. Thanks!
>
> Andreas
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95006): https://lists.openembedded.org/g/openembedded=
-devel/message/95006
> Mute This Topic: https://lists.openembedded.org/mt/88611343/3617609
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [s=
chnitzeltony@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

