Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A15CD3422
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 19:01:23 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.2391.1725130874807437930
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 12:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=GhYVmmEj;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.51, mailfrom: michael@amarulasolutions.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so316283766b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1725130873; x=1725735673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiAaRCPNoPgbVL3QFmM4vWDwb1RaTE8o9cs/w+OLNIU=;
        b=GhYVmmEjx/w2gcUQXhrTTx+lgehwdCNWgdQt7bOaLu83Su7yto9y3MS9QZSPkrRd7r
         s+o/q4ckB5nXj6oTGVS0srKM5fl5IGgCjo88k1cvrUa6j51VuoziPlsZLSZ1G8RXPIJI
         XvYxoaHLOgB8V+O3ePvMUiHN+1wxdi51mMWXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725130873; x=1725735673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiAaRCPNoPgbVL3QFmM4vWDwb1RaTE8o9cs/w+OLNIU=;
        b=eiB9SDGT19mkJO7M+DtfxAj3wVVBJgntxQIpD9hPt3Yivg/UWYe1iuYsTPVRreyfur
         eiqvYMi3ppSfmwRocD9i8SZ0iu0oil8/vC9pOVXMUsnD8JklOH3/A0vqo/HFsDuO2u7G
         XkUgb3fIZ4nLL/Al88Kcc5jDIcBCQvX16ptPUfm23jn8jQ8iRwny2PiXOmY+Qwr55JbF
         IesHFf41WPv5MUJZdkLhbPa+eA5F38HXL9hXVqJ1CUF2DvHkA4Cy0m1Qo7iw9z1iM7Fo
         mRJ7r7YnDF51agn2nFJ7ktibF0oFssYRxgw7FhCBpK7E9xkV/uJKu9l828u0Q7XrQFIW
         6nxQ==
X-Gm-Message-State: AOJu0YyA4Px9770OvjDWj4P6do+g7sDGn6eGcw9gUYz+Du0riY969mKC
	nuohatBdUw2LKywQqNLt1JnKSiPWJ7tho2wne2ibLysoKEWUjjt+lk6OiAVYsSgQQ0pQ0jBiMiJ
	jTnG5Y+PzGs9GA/GG07NuQebAZUx1PCBujvWjrg==
X-Google-Smtp-Source: AGHT+IF1JedrKT7vfeF54mVl0cfSV8hoxwQLnsygdoH4qy30yHGmAIowt795LEiSJA/Nu9mLah5ei9aJ2d28LBLlzdQ=
X-Received: by 2002:a17:907:6d16:b0:a86:9f56:21e6 with SMTP id
 a640c23a62f3a-a897f930c53mr759428466b.33.1725130872609; Sat, 31 Aug 2024
 12:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240825153102.1055323-1-michael@amarulasolutions.com>
 <CAOf5uwkjXMfRjvdY5T1PPfDKkf-N8oTF3O9=5ZdwQ-H-SrQxOA@mail.gmail.com> <CAOMZO5Dz93jfO5D=rmsTcdoQpj-UrYDYAhz9v2yR3k0GOgDSQQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Dz93jfO5D=rmsTcdoQpj-UrYDYAhz9v2yR3k0GOgDSQQ@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 31 Aug 2024 21:01:01 +0200
Message-ID: <CAOf5uwnZcrD0Szq2+oqU9bCfKdB7Pqd-2c7wLQeJedPGQEDXEw@mail.gmail.com>
Subject: Re: [oe] [PATCH V2] cpuset: Add recipe for cpuset tool 1.6.2
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 19:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112065

Hi Fabio

On Sat, Aug 31, 2024 at 8:59=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Michael,
>
> On Sat, Aug 31, 2024 at 3:41=E2=80=AFPM Michael Nazzareno Trimarchi via
> lists.openembedded.org
> <michael=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
> > Anything more that I need to do. I'm really a newbie here
>
> Your patch has been applied:
>
> https://github.com/openembedded/meta-openembedded/commit/58a923c96877e5d6=
cf434d2d69108c5da1c3f552

We are working on other package to add and I'm taking some experience ;)

Thank you


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

