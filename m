Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40215C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:07:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.591.1741796341120298028
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 09:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=FAXL5pGL;
 spf=pass (domain: 9elements.com, ip: 209.85.216.54, mailfrom: naresh.solanki@9elements.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-300f92661fcso109489a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1741796340; x=1742401140; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+tCdPEuuikQUx15WRiVh8EMMs15WbzGjvM+O08Isg8=;
        b=FAXL5pGLtMDdQmXrUcqR7qpp6cdHfRSfFFDpYr8IC3kgjgY5CqA86LTg5Y4o1XSq9o
         eSnIqzdumnPawoVhyxMrHhOxg5R+2y0tgx0rhVJ+mFAUK0D+4phlFQl/8j1Mw/LPMrig
         Is1LJhf4Ra308Lzqzgcsg3+HWkQgtLVxbFeicRs93dbhgZPebzwscDjjFqiDq1Hz/NML
         RWxnjKWf0GYA2KppNrnmyoHR1q7QhzTDpVBGbmqkAFLX5NspxqWNBiHp3odinjBFAUGu
         OEO7qHtwJ8eKOyg9NUCGljHRqV87lQ3A5aWBId6Gvpmm52dHKhnixWVG61YM+8VqC/Mk
         Tv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741796340; x=1742401140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+tCdPEuuikQUx15WRiVh8EMMs15WbzGjvM+O08Isg8=;
        b=Smzh1W2Aa+y8NCmCrrne3x8Ll3n1Ji+AfIBBVH1dxCE2ecdStmzpjJvODnNW0zHz6m
         92/rjaCOCISGCPhedRxhAScy/6w8tP1jxIE6Yg/bR2Sv3bq4VzWwnuUSOSpjsaQLWJnD
         s+053hLwN3OOHffMQoa2NzYyOLXX8wQkpdEaSvNTWKvEkmhAXmd+9qZiP8HvegBgZKi3
         09BIsEQ52+Pf2vzPas50wn96cj76Jek3QAETd0ta16p6O4PRpN2QpPquIRbUPm6ZaNSB
         QaK9YpaoAO2UP7PZ4wXR5rLhScuWLcj4dEjgz3yMf//ktVzvsa4LTvA8TPyH/CE17WIL
         Il4w==
X-Gm-Message-State: AOJu0YxbuP5AlhIqnAemFIKOxijKMEU0rCqLQuTeLO30S05flRHwNYxp
	KsSBiqCIdvGfyGAz/LhaosuGQskAAMFxpJUxciNW/QcYmsp9NTVxUFTBv/9Jhsnnx6d+agbRlg9
	iOQCGDmXlm0U+Gpz4iyjAU5ByJT46qe7W4oA42Q==
X-Gm-Gg: ASbGncu/7Yo05iwJ5YZerPHxgFc3dKBJjEwI7vF9iX2VxJMstNPASmwUB+onSdHsrDL
	WIhn+qHcQhKcqgsOu6wef7Ud3SH6gPqDA7czCMkYQELVvk0vXaVJxwnS2S2dQS9WGvVmBp28Apu
	Y7zy80NPXB1FdtiKEWjPucPuw7ZQ==
X-Google-Smtp-Source: AGHT+IEzeuirJ35v06ZpAeCoudNyX1zllB2KPEQvNHaaKY5Pj8xsVgMJdPGEEnKMVpmZE6ZPTvWiNCfmIkBRzSIqmt8=
X-Received: by 2002:a05:6a21:4cc2:b0:1f5:8220:7452 with SMTP id
 adf61e73a8af0-1f582207511mr17977801637.24.1741796340554; Wed, 12 Mar 2025
 09:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250312111915.2970032-1-naresh.solanki@9elements.com>
 <CAOMZO5DaZbRXuv4vgWk9evNcV4iW6gXy2Vjv7oWsnMo_R9ku4Q@mail.gmail.com> <CABqG17gS-kiB73tTC+u-TER2+ABLYPDVM5YyjiqpEzLTb0LbJQ@mail.gmail.com>
In-Reply-To: <CABqG17gS-kiB73tTC+u-TER2+ABLYPDVM5YyjiqpEzLTb0LbJQ@mail.gmail.com>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 12 Mar 2025 21:48:49 +0530
X-Gm-Features: AQ5f1Jo-5_CpGz2sBHoLxcb-8mpPBzuC8RFH01rncuLzB1k6Cv_o42kwes_3CuM
Message-ID: <CABqG17gwNJnn89SwJf4xAMWGjz+tW+7GkQZEj-D7dPT2Ox9=jA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-openembedded: flashrom: Update to v1.4.0
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, linux-kernel@vger.kernel.org, 
	"Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 17:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115934

Hi

On Wed, 12 Mar 2025 at 19:37, Naresh Solanki
<naresh.solanki@9elements.com> wrote:
>
> Hi,
>
> On Wed, 12 Mar 2025 at 19:32, Fabio Estevam <festevam@gmail.com> wrote:
> >
> > On Wed, Mar 12, 2025 at 10:52=E2=80=AFAM Naresh Solanki via
> > lists.openembedded.org
> > <naresh.solanki=3D9elements.com@lists.openembedded.org> wrote:
> > >
> > > From: "Signed-off-by: Patrick Rudolph" <patrick.rudolph@9elements.com=
>
> >
> > This From line is incorrect.
> >
> > It should be:
> >
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> Correct. Not sure why the tool picked it that way. Will check.
Found that I had set the author name with the Signed-off-by string.
Will be fixed in v2.

Thanks
Naresh
> Thanks
> Naresh

