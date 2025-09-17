Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99270CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 05:55:40 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.15778.1758088535435026693
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 22:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COaUjH6/;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d60150590so38986307b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 22:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088534; x=1758693334; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs9trghJCCVJTjK1Pn1nX0+KUANby2fkbjr3z2wneGY=;
        b=COaUjH6/H5V5nwb10q5KUDNEL7ZOxkaVZpi7nWdb5xzDuSVPLqykWO+wmwE5yyMJF4
         hylH3IbODam3dVoIYoPzNWC4N+I9cADWZhdhTEt866uYFKr42BV7Lu/npGk/q9LdMJSK
         WyCV+giRPwaoYOiQoDGMQi/wKX5SJwarum6OuE1Yvd8nuZU5lozPKhkOC2ort5NcFyb2
         kIqMgC2tj9q2lCG3INoAMpOZ7OLyXb3lYSFmqQlgYJmOxAXwI4sKi0T7jyJjo6Eyjk4O
         vGjkatVY0KR/hzNt8GV29diISGIWbBe9nguhKMK6Y9kuZnGNyvZUYHS+8KdtSz3pMsxB
         vmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088534; x=1758693334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs9trghJCCVJTjK1Pn1nX0+KUANby2fkbjr3z2wneGY=;
        b=Pkxv7lC8j6W6Mi5NM/8PL6Q1GQ5G1fOvH8lx1zS+OvXeiyhTJOSOuOVfaCUqgWUNVa
         mMQdXFyW4Yl4orHinqnFBaP51w9Z7C+uvP7fDfReHtnSsiaJ/3KIvyc7Uwts3InfKWkz
         VnClsgbEo3ui+SqKs7qW+pmGtiRtHXt4OxVPIYZqL6BQDTrvm2Ms2ApFzt/b32OlWmeI
         JojhbUyBuO500I7IMCSOSL8+xrH6yBdoks9oREax/YxZmC4IXXDJqdigdRZWKyMSxI3N
         YVQV7bF8wXAFx2uEg1T+6kfJ3o2B6Kr1ltNPIyZ15dgeA72YfaTQSvc4lk2Kf4RmDxr+
         7zng==
X-Gm-Message-State: AOJu0YzYMQSjTu+bTvUlIb1DCNftouF5kEKnkPYBhB6KPQJEZphYKzNJ
	BN/Rcp2/VbUctUCXtd+9GCEriGwNI6FXXg9Wn6KSHh1uV1f45KNrsIdUxXJ+Eul+4GONqpY3GHu
	j5usbfc4WgAkb6ll3I/GccvKYatVz8wc=
X-Gm-Gg: ASbGncs5X/tKPM0pex+yxbpUxdyp/EVFx+tpOggqxoBVUzmdIvY8HtFKKldEUztI3VK
	vnWYp27YVxBdUiBEEzB5/SPuZrhITi67yWNvebKSu46vOKS15/P03h3DlXdh+oSafY5Z9j3Q3bt
	BVh4ubCUEO/bpGlCHEJfFKAP+VDUGoeQ4Urt5tfcEcqKGmZmHLenm+MvmGrfIc7zig4WeMMZADO
	JF6wEzE55aTZWe8xMy2+vUE0KvX0TC+YCcPaVzV/6osTeYqwrujPA9mBerzoLPhGkzWZVkhm019
	nETiiia+MZ2FHRlIEGTvU32Z
X-Google-Smtp-Source: AGHT+IHkHuqTxg9jQYF2DDvOtK6yZ1qcAb39H/GA6y/88kZHlowCTf9GyMl2VniRRO9+6raEExKvj7opcEkgmCufknQ=
X-Received: by 2002:a05:690c:380f:b0:727:121e:fa4f with SMTP id
 00721157ae682-73892a4d8e2mr6383347b3.52.1758088534534; Tue, 16 Sep 2025
 22:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <MA5P287MB4602030E79E84AAEF6BD0442E917A@MA5P287MB4602.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA5P287MB4602030E79E84AAEF6BD0442E917A@MA5P287MB4602.INDP287.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Sep 2025 22:55:08 -0700
X-Gm-Features: AS18NWDssOTlyTqXTbK21M-xqdn7UPo_8m70Zxcfn7R1M39Blob2ytHT8GbUoOQ
Message-ID: <CAMKF1spybR8bgq-OC31zYWT5kFxxVcu_qEZpSH83cy5dwhTywQ@mail.gmail.com>
Subject: Re: [oe] Clarification on License Identifier for Cryptsetup 2.4.3
To: Sana.Kazi@bmwtechworks.in
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 05:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119479

On Tue, Sep 16, 2025 at 9:45=E2=80=AFPM Sana Kazi via lists.openembedded.or=
g
<Sana.Kazi=3Dbmwtechworks.in@lists.openembedded.org> wrote:
>
> Hi,
>
> While reviewing the recipe for cryptsetup_2.4.3.bb, I noticed that the li=
cense field is currently set to:
>
> ```
> LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> ```
> I wanted to confirm that this aligns with the upstream licensing. As per =
below reference, OpenSSL linking exception is to be used with GPL 2.0
> Reference: https://github.com/aboutcode-org/scancode-licensedb/blob/569d7=
2e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7
>
> To ensure SPDX compliance and clarity, the more precise License would be:
> ```
> GPL-2.0-only AND OpenSSL-exception
> ```
> Is there any plan to update the license declaration in future releases?

There is LGPL-2.1 code in there as well so perhaps it would be something li=
ke

GPL-2.0-or-later WITH cryptsetup-OpenSSL-exception AND
LGPL-2.1-or-later WITH cryptsetup-OpenSSL-exception

But we do not seem to process WITH keyword in the LICENSE field.



>
> Regards,
> Sana Kazi
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119476): https://lists.openembedded.org/g/openembedde=
d-devel/message/119476
> Mute This Topic: https://lists.openembedded.org/mt/115286548/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

