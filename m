Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8C4C25B4F
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 22:00:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.25.1715205614795266798
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 15:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oa8G6EJ3;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f74fa2a82so243456e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715205613; x=1715810413; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYc9hYyuKmEn29mCRokGVPV+LEn3JQQdZDN5RKGKqyE=;
        b=Oa8G6EJ3qIvWok6qFvq5CpL0Dub82dm4I2YhR4qC2dh+X73iitmArhRgyBbeAu+URA
         6YgZzXDHR8pw8Dy6kKdbfDXvBboPjrJIgEkQSW9Xv5Gz+kQ+kydVRb3zbMq5kw2IVcZE
         aKTQ+Ri/s+remMv/vP1QxMdmdBH0OqMZ5/mPZYiavdqlJd7KV05sTTOwy993up6TH7Kg
         RvY1raYlYjVmax4rIdnDWOXwTHAaB8EF2Lr0llRsOow8Jm8TQfN5T32S9T7qn2xdzW/Y
         yWfoGpl/5ILd20cmnM1Bhws2qq55g5HyMgVD/mPa6BMyQv8IOk96f12mqRz8aF455MOH
         ID1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205613; x=1715810413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYc9hYyuKmEn29mCRokGVPV+LEn3JQQdZDN5RKGKqyE=;
        b=TMVvvfVG9sH0nijNBmdf01Qvw24CLG9zTB97CqQ/xqLni6nWLBCTunwAC2yqz8UqAr
         T8P8NYIParu5K0D6Y1pEm3MMaN3/foefQ1A/MVy1HTokYcV5ATfLum2eLwaQuZC52Aaw
         +asDRW1LK0hhhZgokG2UhCZv/pks8aSQB1rDvr8eVfbt596JB4FlUU+ASzEv8oTXSAsR
         OlFeTCd0fUMSpXnVndcJ5c3QVJf07iDPxK23gqvh8QH/XmK7XnM8QLpys1J4HCkwlRXx
         o+Oq8WSF29JVIOiUot6F77DLL6rK4cudaS/Pz4kSB77D8xsQ0gG4dFjqJL771BPNNxtX
         FOYA==
X-Gm-Message-State: AOJu0YwqeIDKDuKy+P0Un6stiaDi0jF0h3J6k7tPmgrzyGZrkYkKwR17
	s18NVa5NeV4jLKIjb20nHaPiwJsIAEOtqABOZE8JqOvdf/8F+SVRrN/GYo4KlpaoRtCpOHXznN1
	Vqgc90VXMSpEWJrXHtXC74CnHsyY=
X-Google-Smtp-Source: AGHT+IEkKxIQ7dCzHQlCWuevN+0LfBu/xJiBuFZq9d3H6DmN+nsdkxCGrMB21FuTM9twsviTSeeoMNsGabpus6IHeZA=
X-Received: by 2002:a05:6512:29b:b0:51d:a541:733 with SMTP id
 2adb3069b0e04-5217cf3bad4mr2909220e87.66.1715205612449; Wed, 08 May 2024
 15:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240508214503193c3316@mail.local>
In-Reply-To: <20240508214503193c3316@mail.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 May 2024 00:00:00 +0200
Message-ID: <CA+chaQfqLEBPSUqrJFLoBLT2eUKd9Cx=FkyPuRgqFW8dCwn2VQ@mail.gmail.com>
Subject: Re: [oe] CVE checks failures for meta-oe
To: alexandre.belloni@bootlin.com, akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 22:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110280

see https://lists.openembedded.org/g/openembedded-devel/message/110191
and https://github.com/openembedded/meta-openembedded/issues/817
and https://lists.openembedded.org/g/openembedded-devel/message/110196

we're just waiting for Armin to merge the fix.

On Wed, May 8, 2024 at 11:45=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/1612/s=
teps/16/logs/stdio
>
> ERROR: Nothing RPROVIDES 'python3-unittest-automake-output' (but /home/po=
kybuild/yocto-worker/metrics/build/meta-openembedded/meta-python/recipes-de=
vtools/python/python3-pyyaml-include_1.4.1.bb RDEPENDS on or otherwise requ=
ires it)
> NOTE: Runtime target 'python3-unittest-automake-output' is unbuildable, r=
emoving...
> Missing or unbuildable dependency chain was: ['python3-unittest-automake-=
output']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable provid=
ers.
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110279): https://lists.openembedded.org/g/openembedde=
d-devel/message/110279
> Mute This Topic: https://lists.openembedded.org/mt/105990476/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

