Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF13C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 20:35:37 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.24288.1707856536639470556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 12:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcmdYaxN;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2184133da88so772597fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 12:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707856536; x=1708461336; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il29xOX9b/hp/T2ooXnLTCUl2ddA/n57vP5a20k4pcs=;
        b=gcmdYaxNuX6BaHHzXgRjrNzf5sHVAuZO8hdwCQpUScofcJpTa2f+5ooKjgOhS7zWbg
         eOtvAp9YnTchWaFsJZMaeDW7EPP8UvLgEKnH10qW1DnICffKHkK9kSWjd6JpyGd9MFNh
         q2zmbwwmHGnDh0v65KRZCuXaKzoqwC0T/IOgKPJxi5nf4WijY4yFxevkelplnslCz51N
         z8fIzhlimSzXu1zc0fav1OihxD4qj/lS4k2DYOdW5Fj+MFFxyd1oi3IXVtz58FLstKwt
         m0BRdb+bUcfdSslkFVxcvwLtMKoqGDyoVmWXT+n1TflO1enUhyYIBOsHP7JOYmMaWILv
         YTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707856536; x=1708461336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il29xOX9b/hp/T2ooXnLTCUl2ddA/n57vP5a20k4pcs=;
        b=NSgkf2eeBJaI2ePKREMQhZGjr252R1jTq21+AIKQFWnQJUKIFbmCLkfpcYxi6TsmcR
         mbRfkw2+nh/WTzFWmn4dCUF0jVt9uSmQoNjJCUxnCmvrWb2NENU7frCc+YJ67pnrYgSQ
         pXJ7oI0+xQbOoO69bHR8r02JUJ1fSDUkjqnr4NRNOyOeZLtb9KdRA4Le6d6gwPYdi92n
         E/R46zAS/NhGnNvBvK8RIfk67e+/Xz1M1Vw1tkL0QGxBfSThHvOQwe38VxnPqQtTqjQI
         f+oDvvuxNTZl5kI0YhDZwl5Y2Jg4VzWBdy6Lypz+i9JJoF6arsSLRZ4RdY/rRTeeAhRn
         HebQ==
X-Gm-Message-State: AOJu0YwtY0ZYtQIOP+8XF/DPYf7vc7wj9UGrgEQbxDmT4eKktf9kqjP0
	s/75ehEMFdo0YhzqkLAQqF9vYsqon7VTzSfR2hnr0ELNm8J8V7saCuDD9tRMbSUnPGIXKBjGOCx
	AVW4dY6yBskoVr9wmQl1pvyyNbao=
X-Google-Smtp-Source: AGHT+IEQCEyWRY4R8qC0UTQkQa0PLm3M+Z3OUqWgVYdyxllT/QedUYnUkjy4d1yNNzU53sLy7ZtBWGLlazqF12SjW9w=
X-Received: by 2002:a05:6870:c084:b0:219:6d32:131b with SMTP id
 c4-20020a056870c08400b002196d32131bmr540053oad.22.1707856535154; Tue, 13 Feb
 2024 12:35:35 -0800 (PST)
MIME-Version: 1.0
References: <7fffaa90-0e3c-4f71-a385-e6248df3b27f@kernel.crashing.org>
In-Reply-To: <7fffaa90-0e3c-4f71-a385-e6248df3b27f@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Feb 2024 12:35:08 -0800
Message-ID: <CAMKF1sqRBtJ3RL3WHUqFovwhkRU-1a_JU4OOpR2wcYR0cEahaw@mail.gmail.com>
Subject: Re: [oe] opencv - python3-opencv not building properly
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 20:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108731

On Tue, Feb 13, 2024 at 8:38=E2=80=AFAM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> With master as of yesterday (February 12, 2024), the python3-opencv packa=
ge is
> not building.  There is no error during the build of the opencv recipe, b=
ut the
> package itself never builds.
>
> During the do_configure step there is a non-fatal error generated:
>
> -- Found PythonInterp: .../opencv/4.9.0/recipe-sysroot-native/usr/bin/pyt=
hon3
> (found suitable version "3.12.1", minimum required is "3.2")
> -- Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DI=
RS)
> (Required is at least version "3.12")
>
> I've been unable to figure out what is causing the failure.  Was hoping s=
omeone
> else might be able to figure this out or provide a clue to be able to fig=
ure out
> what Cmake is trying to do that it can't.

Just shooting in dark here, but can you try inheriting
python3targetconfig in the recipe and see if that helps ?

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108729): https://lists.openembedded.org/g/openembedde=
d-devel/message/108729
> Mute This Topic: https://lists.openembedded.org/mt/104335555/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

