Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640D0C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 16:37:51 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.65685.1715618270037366598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 09:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PRbHwI+b;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-24157800275so2255021fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715618269; x=1716223069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aQqJe5tO6kWmJT3PAV/dhRMZJcFROFMgR4esnPt77Y=;
        b=PRbHwI+bsJemXfDepVtB5vfeIqV8HU3BUXJhh6TZdn2vmHXLpjoH7/l9RHBKvp/7S5
         L5MwEKMTF4kd4i9BElmUeg0VvgU+X0M4pXhN/e3cBGgFeaUHHTzbBqwvpyzW81qwQx8S
         fGI8/1u2b1TdlWGCLQ2DZdmg7VPitNppzlJE7ngLfy9O/izBaftyOiV+ypyXVm+D9C6X
         fdsPjVGHfL9jlrB7d2ejGp60fpe1ir8qpU8SvAIjola7hADNznXN4I2MiAE4zfcBkh3o
         ba0N722lQV4o0O8aNpyvVfT8liF4Gnrswy4RIc4M5PV7ElUk/G3TwvWwf009qv8gkHCJ
         VSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715618269; x=1716223069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aQqJe5tO6kWmJT3PAV/dhRMZJcFROFMgR4esnPt77Y=;
        b=Cj3QO7O1wv5zIXGwU5s27ZczQPVqPDaZfViz9Y6f/eFgkg2RbgIcy7XMu3041msFTd
         upVcKdiSapuLZcxp4Cu975RA718F1jgMNXYBcgckySl/VGoQtUo6ad7o1DAA5KeI9WaJ
         z9F+k+Ha0C8168TP+wqCpq8uJ2TgPUI4XIIu1lfVQuHyIO7cJzIJRvpRMbSZKwbUPysg
         ZtaP98W41yru+zeYeEmkfGv2yGpJaxtq7bjj/adwjI9/msUg3ozrugSjI8zIC5ADWRhG
         MnbSM90QtIvEZwgzf794APGXddQF0vZc4UTBy1ZFavYwY+aJtTuBGboOXexxAQXUrJLg
         Q4fw==
X-Forwarded-Encrypted: i=1; AJvYcCVhSV9Dox045dgaow75Z2LvIzbLRnhohmQbVEin64eLQPcxpYO1sAFkfuZd4UdQHK/dbqNVuILhceQ77DznDMsJnJVbqj6aBQchUz1eBBzxIdSo3fNHQHGXsQ==
X-Gm-Message-State: AOJu0YyiJKzzmFOI3Mg126IFdyugHy3ojilCsMxZ/eOmgha8SHUi0Sge
	AZfVHlQ3QczsSdYJXIcgoeyVceuqXnU/ZgQZHk5xv4gjOiCj2BfU5hw3J7M8lUbIqzfcOPri6Rh
	DufGykuq8iA3NbImV/6w+Bre4ADw=
X-Google-Smtp-Source: AGHT+IESbXhPmIp/rnnUJoh1cu+d+219R8o3bNGr9PcPNI9T1G8wqS9AVqaScqYiW1Hf1sJg5FIU2SCg04hcNh4KdFQ=
X-Received: by 2002:a05:6871:520a:b0:23c:58e5:9d7d with SMTP id
 586e51a60fabf-24172c2acdbmr12845294fac.32.1715618269280; Mon, 13 May 2024
 09:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240508111609.4157976-1-peter.marko@siemens.com>
 <DB5PR02MB102130DD69A5E5A8236BE2033EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <AS1PR10MB569796A83B44FB15E1C4DA9FFDE22@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569796A83B44FB15E1C4DA9FFDE22@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2024 09:37:22 -0700
Message-ID: <CAMKF1sp8AKAxiZSFG+zBkbBF-GivsjzrC3Q+nHitQJrG7OVr5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][master][PATCH] re2: remove dev
 dependencies from main package
To: peter.marko@siemens.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 16:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110339

On Mon, May 13, 2024 at 12:07=E2=80=AFAM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> > >  # Don't include so files in dev package -FILES:${PN}-dev =3D
> > > "${includedir} ${libdir}/cmake"
> > > +FILES:${PN}-dev =3D "${includedir} ${libdir}/cmake ${libdir}/pkgconf=
ig"
> >
> > This wouldn't be needed if FILES:${PN} wasn't set using FILES:${PN} =3D=
 "${libdir}" earlier.
> >
> > A better way to achieve that *.so files are packaged in the base packag=
e is to do:
> >
> > SOLIBS =3D ".so*"
> > FILES_SOLIBSDEV =3D ""
> > INSANE_SKIP:${PN} +=3D "dev-so"
> >
>
> The patch is already merged, so I'm not sending a v2 anymore

Please address the feedback in a new patch since it is an improvement,
your patch fixed an issue and was in a merge queue
that has been through a few CI cycles already, so I did not remove it,
however, that does not mean that it can not be improved upon.

but thanks for the hint for my future patches.
> I wanted to do the least intrusive change as I don't understand why the s=
olibsdev are needed in the main package.
> And larger reworks usually trigger those kind of discussions which I was =
not ready to answer.
>
> Peter
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110335): https://lists.openembedded.org/g/openembedde=
d-devel/message/110335
> Mute This Topic: https://lists.openembedded.org/mt/105978716/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

