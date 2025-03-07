Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B716C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 18:55:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.18934.1741373722658019479
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 10:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bsua+8cX;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549963b5551so634209e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741373721; x=1741978521; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3a4ZtoA0pfR3cW1PKaE8g+Uk1yAcb50S6kHHaYVBGr0=;
        b=Bsua+8cXWW1uKLztWWsKteO1tDnnQjf4eRGUuesAheXxD0C9UwVwlztkLGQFCFGp3p
         FO0o8UphbloHsnN5jDEmTHNH/X7MEEYLMGLKAkWwiTCwYaP3lYxWRkDt3siTSc7PlFLv
         DEQIUXeUSkucO6iRhcE0E2fPC8JU12gbRhBo6+qfN7Mr1DeX0r/lRYJUzPQSjxwZ+FV/
         MAmBuQr0AyM3ny9zYQuBLeb3gR32eM4dbUYvQL5nMaYZG+5sYv1yGl6GVDbzq4OdKz78
         n5f1d5nxpM4z1NmCaXVFWgY1tvn/J7cmIKgCiK+U/JGC7Q3tErVQg7+b9GP7kHWLj76h
         +jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741373721; x=1741978521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3a4ZtoA0pfR3cW1PKaE8g+Uk1yAcb50S6kHHaYVBGr0=;
        b=bKk8bYS9cGNImhsW6gUvhexy1aPHZsot6o6fre4HnaM9iCSHOhZvXk2zMSFutcmAgZ
         M3RgZVxROZngyJcC2QI4hkGTQh0qgrT/B4JJvzhY6q81yD8nwWF/YdbYAHLj60Y3r2zr
         Pyy/vReJgt76hffMwB/Oi/SHodXwZr+TdnTnnvVJ0iwmMLk2b61MaEXfDz27OEHx341w
         JGvVKrFyUQmTlufclWwAGanODFNXgqS+WQQrLTyzw9DwMIq81zOlFci+DCiY5fX5jnUt
         s9a2rkytuHYWuieTbLGEeLro76iETG7iM3KinQ9hRz+te61WltDWYtRyAKjiKNWzj95J
         V2gw==
X-Forwarded-Encrypted: i=1; AJvYcCXgYwHcQKfgJBIyw3+G8sj4eh/2jnJKKd1N4ZzOLhga0NP855eT5r0LEs3QVbsdEDOTE//SoCZWV6ejJzvhEpDnlt8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxNjKOnxOAbKVw3JMjsqlEXnARWPVSjZc1lUEslVAmJgq+Jnzq
	jxa7kof7QVCstsQeZ/Z8S6U9lQT22WRJRVdwVPjeAtpeGzhAnKOIyJZ4rufW5p52oBAnU0ny8yR
	+bEYzhw9jX71AyN8Jf0RqhGXvDDA=
X-Gm-Gg: ASbGncvIYTBWqmvAXc9FPFA/n2wpRIsBbJumr9TDOn4xhvq+Ye/CT75ZtFlg7bMSiWU
	wEnkrR+U0LHrQ1emsAe3hQQayLWlEOCFK89Q18BVtF2wyClg7y450a5qK2tA0BYu4uhR62HxAXP
	6HT5OhlzFOE/gbK2Bbf7gUMUNbg7xC
X-Google-Smtp-Source: AGHT+IH6ZbJW/H3TuNTR3oa6KBveF9BAGyCVOZcd84j9gZaXM2Ln89U0pn7CNWioc7rJawpY++mwQXYRIXquSNRbKqk=
X-Received: by 2002:a05:6512:281b:b0:545:2f0d:8836 with SMTP id
 2adb3069b0e04-54990eaae1amr1533348e87.40.1741373720354; Fri, 07 Mar 2025
 10:55:20 -0800 (PST)
MIME-Version: 1.0
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
 <17fde519-38d7-4c44-8592-a0ff6efd56fe@balister.org>
In-Reply-To: <17fde519-38d7-4c44-8592-a0ff6efd56fe@balister.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Mar 2025 19:55:07 +0100
X-Gm-Features: AQ5f1JqcLHmHOiX6XFQdOmgUN8TDhzslOzdlP2mnyOX_nwWMZ8DB2cuFEUaXUKM
Message-ID: <CA+chaQdAgNa4V-c9B48CkLOAxYhGcc2bcmb=mUMqe2U+gFf+Hg@mail.gmail.com>
Subject: Re: [oe] [meta-python] python3-scipy
To: philip@balister.org
Cc: rob.woolleywr@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 18:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115798

On Fri, Mar 7, 2025 at 7:38=E2=80=AFPM Philip Balister via
lists.openembedded.org <philip=3Dbalister.org@lists.openembedded.org>
wrote:
>
> On 3/6/25 1:07 PM, Rob Woolley via lists.openembedded.org wrote:
> > The meta-scipy layer was archived on Nov 30, 2023 (https://github.com/
> > tuxable-ltd/meta-scipy <https://github.com/tuxable-ltd/meta-scipy>)
> >
> > I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so =
I
> > patched it up and got it building again: https://github.com/robwoolley/
> > meta-scipy <https://github.com/robwoolley/meta-scipy>
> >
> > I don't know the history behind why it was in a separate layer.  Would
> > it be worth submitting to meta-python instead of resurrecting the meta-
> > scipy layer?
>
> I want to say because scipy needs fortran and that is not built by
> default. So world builds woul dneed to skip scipy unless fortran was
> enabled.
>
> Does this sound right?

Which is the same as meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
which also depends on libgfortran and only has:
EXCLUDE_FROM_WORLD =3D "1"
and comment about how to enable fortran in gcc.

Just depending on fortran shouldn't eliminate it from meta-python.

Cheers,

