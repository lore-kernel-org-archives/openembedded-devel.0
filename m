Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94D4C76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 23:52:30 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.1231.1680911541838496071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 16:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CBDnspEp;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso47130877fac.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 16:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680911541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HssCyvRI2md+bq67D0DH1z2Low6rtYfojpMxWrMJw2U=;
        b=CBDnspEp9EDsTiHdR1wltw76pzyootfO/080XDoeNKwUlxDmpaf7blZLXb1K4XeE0H
         CKnO3QYLTPEnNefTBimDofdE+EifsswrkgCMlI39mnMDTj2uXME+TYKMpUQjOh6GNgWd
         skEtPKWryXzlH25yIoLsM+0ez4ETYFgNqQDNRUwuZLa48XsPbkAaImoh631AT6zT65ze
         w070utGN2ixAKoLs9R+xO3861h0FsCweOMUn+n66ccoTwC03E0ZiN1UiUQiuMUKj4T+U
         0Fyb0wBSfFVCH7lAvj49k6jUZ9Bw75KI2CGaicvxojFy2FsOytuYfN8Nmei9dThbEdy/
         i2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680911541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HssCyvRI2md+bq67D0DH1z2Low6rtYfojpMxWrMJw2U=;
        b=6QdAnPFw8uvxPnOMP2EDj2NwOAK1xvwV6KXb6TI2wlyJhHhdui2727p9HupT9aV78Z
         hmmGafdqo5dCOJSF5VxxnbZF7H/DoBiURBwitofbYIlh/W2zGxrrmmdepDBX+4DVDOo9
         1qU+Vsyqv1VEzy1O4PtHWfmBYrLRx94ofcNri6Td/Sq1WCiOcNDEw0LUGriIWMtRfNd3
         FqrUeEZFQQ3CDsBTNB3MykYcPOQpkeR5UkUYoNTzX9Ck8iegoJdPwp97ttHPQ0A8NO6d
         JWdPMpB9RpXpb1VBNC+WCTT/QyzrIF+JwyvNmFnVPNNizCa3yK4PlgiVRKZlbLy5JsCW
         axbA==
X-Gm-Message-State: AAQBX9cbap4MyOsMscBUv3xAV0mc3sQwzKTLCpmN0681kNcJCR7l0NEI
	FGQOHjzkjhVfj9ORhpA24oB5u7kzwv4srKRv3T0=
X-Google-Smtp-Source: AKy350bg31l/1VAg68zmqr4F9nHkuM+hFzz0Pu8DQ5dGv54FvOPd7OlEGaXGPOUF/jfdYCfB7K2HHydEhdRledgjEbY=
X-Received: by 2002:a05:6870:12cf:b0:17a:b713:63e9 with SMTP id
 15-20020a05687012cf00b0017ab71363e9mr320243oam.4.1680911541022; Fri, 07 Apr
 2023 16:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230407220737.889502-1-Martin.Jansa@gmail.com>
 <CAMKF1sofLgFddNZay7MmbPvQELsB8KeQTAXMgR4V0EgcAnZxdA@mail.gmail.com> <CA+chaQdeazrz56nCQ_U3Xn6xfO5g70AmNujQEmQ1JaOwrJGQYw@mail.gmail.com>
In-Reply-To: <CA+chaQdeazrz56nCQ_U3Xn6xfO5g70AmNujQEmQ1JaOwrJGQYw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2023 16:51:55 -0700
Message-ID: <CAMKF1sqG+WOaHYN7pFgLaCKAuNUYStRUj8pOv-Nu9KOzKx3KQA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] pahole: respect libdir
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 23:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101994

On Fri, Apr 7, 2023 at 4:50=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> Yes, we can I think as commit message says, but we should probably use ba=
selib in cmake.bbclass as well for consistency.

thats fine. Just send a patch to cmake bbclass as well. I would not
like to hold a better fix on that condition.

>
> On Sat, Apr 8, 2023 at 1:48=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>>
>> On Fri, Apr 7, 2023 at 3:07=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.=
com> wrote:
>> >
>> > * use the same expression as cmake.bbclass is using:
>> >   CMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar('libdir'), d=
.getVar('prefix') + '/')}
>> >   but ${baselib} should work here as well
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/=
recipes-devtools/pahole/pahole_1.24.bb
>> > index b7f1f8bb28..2bb73c3eb7 100644
>> > --- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>> > +++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
>> > @@ -20,7 +20,7 @@ inherit cmake pkgconfig
>> >
>> >  PACKAGECONFIG[python3] =3D ",,python3-core,python3-core"
>> >
>> > -EXTRA_OECMAKE =3D "-D__LIB=3Dlib -DCMAKE_BUILD_TYPE=3DRelease -DLIBBP=
F_EMBEDDED=3DOFF"
>> > +EXTRA_OECMAKE =3D "-D__LIB=3D${@os.path.relpath(d.getVar('libdir'), d=
.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=3DRelease -DLIBBPF_EMBEDDED=3D=
OFF"
>>
>> Can we use ${baselib} instead ?
>>
>> >
>> >  FILES:${PN} =3D  "${bindir}/pahole \
>> >                 ${libdir}/libdwarves.so* \
>> > --
>> > 2.40.0
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#101990): https://lists.openembedded.org/g/openembe=
dded-devel/message/101990
>> > Mute This Topic: https://lists.openembedded.org/mt/98134284/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

