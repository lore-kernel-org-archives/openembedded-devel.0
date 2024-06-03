Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4A5C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 18:10:45 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.1672.1717438241422352917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 11:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5WkbNWL;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d1d65a471aso2805389b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 11:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717438241; x=1718043041; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buoSodsqdqZGFU8SATTXNzYLDVQcQgV9Ck4L6YYrG8U=;
        b=H5WkbNWLM4wucTWiquSUGa5aP3QvBNXVtHkuYb146R0kvljCS7Zy6aaxfoCWmkOGM7
         WPq8vCViyt2fqfLf+E/LkGl5eDrmt4SWv8uFA9S97K27OwCM+wYU/0addK4AeSmzYnoc
         e562GAGBA6jxS/5tpTN4X0vcXg8f597N2QxjWXurrZ+ixizjHmIUJd0G53c3RQPMqaoR
         vKU7BNe7RMvtOzXHkf58Y7d3h8i6+shpuRNI2ydQAYRqNqUYwf5YvRanFz+9SZwb9kep
         OtGV2HZNGQzwt8TyOIKRPPO0zE07k5X7wDKe8k2RrPFywIjI2ldq0JA7r0129jyT7beh
         7BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717438241; x=1718043041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buoSodsqdqZGFU8SATTXNzYLDVQcQgV9Ck4L6YYrG8U=;
        b=jl+L0jDq44TcsGKUuj7rbZKYpOb3D4uTvYbKs+qGzbS5WqObDeKJYF60LhIdUK/izy
         6rGbgIRNSzhxM/IzQCvyiQMHUy+s4suWDpDjdPLDJ16KlT+JCk/Pz+6YrebHXDmnF/Sf
         5PC5JkKIQBmEi7yOqGYJTwYtiFvY5d5yW1s6P4/sP5Ov2ZxA28+tSOpsgGYqvaqEsq7D
         zfCgARO+33d/6LstwWFICpEQlWcw5Ar31233y8YuQAyP7uGunbpFiKbiDnnehOmvxKWS
         aqMNN1F3rC7LKGU3tS9b5G7lcnw2EvPm+skY3OodLvPwZ2e1+PV3YTuac8U54e6Zv4XH
         z/+g==
X-Forwarded-Encrypted: i=1; AJvYcCXkPmxQVHNShiQnkt/lZw5X70OS/mhzPetb9N7hvrgCoxh0rOIzu8fnT83EQdzXmoTuto3purbwXNJegdZ6QhK4Dg+yK2ZP09tDWOZ9wLWiR1uZVVlPmEFskg==
X-Gm-Message-State: AOJu0Yz76PhggPJaQQ9BD75uCuDjK6wMUHYbtJkN9jN0Mxwlks9xsyl7
	WlvLs9c1wJFE3GxYHaq8JnZRMHM1TIx+2VQ2o772CjyIFNuhlT3WcU6iCmLCFKdd0ftRCFjaV1O
	+UoKKy2LMggrBZjAe909ofo6mnaJLiFK8
X-Google-Smtp-Source: AGHT+IHGKlY1SmXH4sVBTFVOphM7echp5/XRg8gV2dnIYt1NJ88+A2LWSy14lw7OqwKAsIWkCkjoJmWtQyh77IChySE=
X-Received: by 2002:a05:6808:1b14:b0:3d1:d472:d75c with SMTP id
 5614622812f47-3d1e349d822mr13832462b6e.28.1717438240438; Mon, 03 Jun 2024
 11:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240528095659.4123056-1-mingli.yu@windriver.com>
 <CANx9H-BYs2hEx0FZorOfjHSq7qFZjCtZUU1Upnyw_BiJyNJmDg@mail.gmail.com> <c7ba73fd-2407-4ade-a629-b346f5e90ca9@windriver.com>
In-Reply-To: <c7ba73fd-2407-4ade-a629-b346f5e90ca9@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jun 2024 11:10:14 -0700
Message-ID: <CAMKF1sqVqiMA6hijp=jXrAcOsTb96t5FzvZwCS2iHkShqcpSNw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add new recipe
To: mingli.yu@eng.windriver.com
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 18:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110674

On Sun, Jun 2, 2024 at 10:35=E2=80=AFPM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
>
>
> On 5/29/24 23:16, Tim Orling wrote:
> > **
> > *CAUTION: This email comes from a non Wind River email account!*
> > Do not click links or open attachments unless you recognize the sender
> > and know the content is safe.
> >
> >
> > On Tue, May 28, 2024 at 2:57=E2=80=AFAM Yu, Mingli via lists.openembedd=
ed.org
> > <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7Gk=
iYG6VXIHkUo__zHc$> <mingli.yu=3Deng.windriver.com@lists.openembedded.org <m=
ailto:eng.windriver.com@lists.openembedded.org>> wrote:
> >
> >     From: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >
> >     Dasbus is a DBus library written in Python 3, based on GLib
> >     and inspired by pydbus.
> >
> >     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>>
> >     ---
> >       .../recipes-devtools/python/python3-dasbus_1.7.bb
> >     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU=
7GkiYG6VXIHk4El2d1U$> | 15 +++++++++++++++
> >       1 file changed, 15 insertions(+)
> >       create mode 100644
> >     meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> >     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU=
7GkiYG6VXIHk4El2d1U$>
> >
> >     diff --git
> >     a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> >     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU=
7GkiYG6VXIHk4El2d1U$> b/meta-python/recipes-devtools/python/python3-dasbus_=
1.7.bb <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveYd=
w8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7=
GkiYG6VXIHk4El2d1U$>
> >     new file mode 100644
> >     index 000000000..c07464210
> >     --- /dev/null
> >     +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> >     <https://urldefense.com/v3/__http://python3-dasbus_1.7.bb__;!!AjveY=
dw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU=
7GkiYG6VXIHk4El2d1U$>
> >     @@ -0,0 +1,15 @@
> >     +SUMMARY =3D "Dasbus is a DBus library written in Python 3, based o=
n
> >     GLib and inspired by pydbus."
> >     +HOMEPAGE =3D "https://dasbus.readthedocs.io
> >     <https://urldefense.com/v3/__https://dasbus.readthedocs.io__;!!Ajve=
Ydw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJf=
U7GkiYG6VXIHkyZ--IS8$>"
> >     +SECTION =3D "devel"
> >     +LICENSE =3D "LGPL-2.1-only"
> >     +LIC_FILES_CHKSUM =3D
> >     "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310742"
> >     +
> >     +SRC_URI =3D
> >     "git://github.com/dasbus-project/dasbus.git;protocol=3Dhttps;branch=
=3Dmaster <https://urldefense.com/v3/__http://github.com/dasbus-project/das=
bus.git;protocol=3Dhttps;branch=3Dmaster__;!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_=
NV-Oa4tXfkyjxJPk4ygBglVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHkMNwIRNw$> \
> >     +"
> >     +SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
> >     +
> >     +S =3D "${WORKDIR}/git"
> >     +
> >     +inherit setuptools3
> >
> >
> > This should inherit python_hatchling since a proper pyproject.toml is
> > provided
> > https://github.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6d=
c97d12f4462f8d4/pyproject.toml#L7 <https://urldefense.com/v3/__https://gith=
ub.com/dasbus-project/dasbus/blob/be51b94b083bad6fa0716ad6dc97d12f4462f8d4/=
pyproject.toml*L7__;Iw!!AjveYdw8EvQ!Y5NUwukPKP_HnepOX_NV-Oa4tXfkyjxJPk4ygBg=
lVwbOyv4Lc_RjWWNA1peUyA7SsJfU7GkiYG6VXIHktJoxsjs$>
>
>
> Seems the above commit which provides pyproject.toml is not included in
> the latest verson dasbus 1.7.

can you send incremental fix.
>
> Thanks,
>
> >
> >
> >     +
> >     +RDEPENDS:${PN} =3D "python3-pygobject"
> >     --
> >     2.25.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110667): https://lists.openembedded.org/g/openembedde=
d-devel/message/110667
> Mute This Topic: https://lists.openembedded.org/mt/106345708/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

