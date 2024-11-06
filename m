Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17F6D40D13
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 00:26:51 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.35391.1730852809457052644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 16:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KnvyZCvR;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5ec6bdd9923so3051388eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 16:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730852809; x=1731457609; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A2Uxhkg3vgGQIPGq1eEhLlvXQhmDrzJdMMj9E0hHJo=;
        b=KnvyZCvRWUoqYdxmWWObRH02OFlc4ZGArAkzIPwknGqx860m/GycpY6HnL3CrFXR97
         c6P11d2usQwurznRDbBSnsFcZlr8jqp9eVOIDIWM1fKms6Tucyg6nRtojlAUUPoGKkDT
         SNUXMryG5NC65u66aIXStPIES/HWO9NE0BdjjgCgINZQizAy6I/iLTV6FcwprKRZFWjK
         Fn9RW+84flbeobZ36ZBxH022+c/cH6rbjBe8dtkmdqTeYaZOuHoZIguurdkAuvXGnWux
         qGjPccCNS410Q5/0GyJZ3DlA4A3xRC49ktpFz9i/bG3TCxuciih85N1AVoexibQ2/R/J
         rIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730852809; x=1731457609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A2Uxhkg3vgGQIPGq1eEhLlvXQhmDrzJdMMj9E0hHJo=;
        b=l4pRMxzQx5hBPAy3PEntjE6H/Yaeel9FwVGtND/cikw96dCAFGNLdz4Yy2qUb/AQtn
         nBBsQJkkgK1TcDbW6NYpkRkXWgGCUjm+o7YWXTcP4RirBmocbLVXpwLEJ9AzLeA+PNle
         GG710qINRYdYpOmmIb1Ct7QxoWjzVNCbWbgzG1rBIOJEBoEcfEGOb7HGrR2yrOPSHV1k
         03OR4+vwyoxNGHv9fyO5aJ2x8mU/d7XjX2u3lNoia2iMKkEadtWqXX+ObdIjIbF7mAeh
         Qawb8LtFPfohWMjIy64JWC5tN5HICcp5kNU42rM7uJzQgV22guqxBwHuvHN6dM/DVB2K
         TJVg==
X-Forwarded-Encrypted: i=1; AJvYcCW5elCZMmQpCPmtZSQh6GLgCBeh38griO0yntJDB+lyJxAcFXNBpYQuPzhhVKQxykHxOcpQd7eDI6O9EuiEyVMdhhM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwC+XL6iea1qgwa+Lee7amnredi0UGEKgVBGIklaKHV0PDFrv5N
	QtJSfNFObk6UOrK6NDZezcJZeKcWhWiTtDutzHTwd3M9LiYEMxmWxiGZEzKgTlnINeAI9GSOG2U
	rTmZ4LVCN7ZIJLTBLkWDgpgqkGdY=
X-Google-Smtp-Source: AGHT+IF9+nFVjETyyhnfYI2qfAHZN6vw9KnjZ0674P1utB9Rd9nM+3tgImrDD9UCWWr+cizpgq9RvXTwp/mnbXibxLg=
X-Received: by 2002:a05:6820:80b:b0:5e5:c489:6f3c with SMTP id
 006d021491bc7-5ede651022fmr10465325eaf.5.1730852808601; Tue, 05 Nov 2024
 16:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20241105101028.2967192-1-peng.zhang1.cn@windriver.com>
 <877c9ihrc0.fsf@prevas.dk> <950fae77-cccc-4785-a930-a42c86571d5e@windriver.com>
In-Reply-To: <950fae77-cccc-4785-a930-a42c86571d5e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 16:26:22 -0800
Message-ID: <CAMKF1spfPByGjr3CcGVDGbo5LOug901YZYtxgwHQAJUjGc8y1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] parallel: Add recipe for GUN Parallel
To: peng.zhang1.cn@windriver.com
Cc: Rasmus Villemoes <ravi@prevas.dk>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 00:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113682

On Tue, Nov 5, 2024 at 3:15=E2=80=AFPM Zhang, Peng (Paul) (CN) via
lists.openembedded.org
<peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
>
> On 11/5/2024 7:07 PM, Rasmus Villemoes wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Tue, Nov 05 2024, "peng.zhang1.cn via lists.openembedded.org" <peng.=
zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> >> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> >>
> >> This recipe adds the parallel package, a shell tool for executing jobs
> >> in parallel using one or more computers.
> > I often use GNU parallel, and might find some use for it on an embedded
> > target, so makes sense to me. However
> >
> >> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> >> ---
> >>   .../parallel/parallel_20150322.bb             | 22 +++++++++++++++++=
++
> >>   1 file changed, 22 insertions(+)
> >>   create mode 100644
> >> meta-oe/recipes-extended/parallel/parallel_20150322.bb
> > Why such an old version? It's not a dead project, there was a release
> > just a few weeks ago. If it's because of some dependencies that the
> > newer releases have grown and which are hard/impossible to satisfy in
> > oe, that should be mentioned in the commit message.
> The first version I used was 20150322, which was already quite
> user-friendly and straightforward to compile and deploy. Given that this
> is the initial version of OE, I prioritized getting it working first,
> with plans to upgrade as new features or requirements arise in future
> iterations.

It's better to get the latest version to begin with here.

> > Rasmus
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113680): https://lists.openembedded.org/g/openembedde=
d-devel/message/113680
> Mute This Topic: https://lists.openembedded.org/mt/109403275/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

