Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B9AC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 17:39:55 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.22660.1715708392905906102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 10:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0ihavKN;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2b4952a1aecso3984869a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715708392; x=1716313192; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk03bK1Fxv0KxDNLQZPYYDIYfkE9Cw+X0EhbZGobcRQ=;
        b=V0ihavKNBzoaLUtKvUTwaBjR0jFgWB8djg5qOMqtxMRJApsxpNz6qXIoCvmWgDSPny
         yVcXQ/4O+tNx8bQOiodLDqQe8e++eA3oAWQgxOT4QVwQpKX3s7cUX9iyYcsPjjLOu6tK
         FFU79BdmGUPumpUb21z8yVMxnrtrDbHgF9bnhUnR0MHoJOVHDxoVP49ahjzFkbZUAEyr
         p0Ln4fnluBfKe7/h5TCg7Xp2DXYrvmUlpi2wi8/C3s3WKi3fu2U8p+D0gOxAbnt56pqE
         LwWWUD6la0Fy4qMUrJei6eda7nl/xcUybtPjLm9hjSyXu54i8VHPWvr4y5HbNSKfMSUC
         jFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715708392; x=1716313192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk03bK1Fxv0KxDNLQZPYYDIYfkE9Cw+X0EhbZGobcRQ=;
        b=F3U/qVYBTDiyW0o9j3DTS0mA6/9bwkCI3mFphRNEMIT8aei4ipYNQrlDZJ4ugitKdU
         0ftMGPTFp1bcbM6tCqEDwcBeyt5rrk1pnHeWn4WHH5Tz1/4KWIHmORi4HcBOM4TL5k3Q
         AuV82SSSy0XQastT0+mJaDJnO5/m/BOJLcQACfPkNtFBhEXCJKLEMTFFk0rjugd5ROu7
         uCdY0OOZcPzY7Upf4E/wYp+Jxhhd4eWsr55aXAac8mY0EthAf8bFlAF7EAL80sI0vpa4
         PCqYmENwLupSwo5xFf/y/AbAhb2Ya+P1wdEEP+MXFyokorCO2DGrZN2tqYs57Kt3bl3E
         Knwg==
X-Gm-Message-State: AOJu0Yw2SEKqVazhJu1zzaEkU9tA5gwAUxRGWEVEwd2tvim116ea5LLP
	Gw7DTBt/flZ2y8iTrEGXaNGLMBBkOvQuS2kolLN8mGfQZRP2kHTjstPejBPLF9j6lswzZplY5R1
	yXRooObA6aK70ArM3nIVgI1ydsSbXKg==
X-Google-Smtp-Source: AGHT+IGdmRC3w/YfyiyEd+xIjdrE6Lh8o6HS5kEbR3vi+zNlAYkdfVbYLGZj03exqA3Ms+cjxh3e3voDPA/PmdZgDN0=
X-Received: by 2002:a17:90b:314a:b0:2a6:f414:4e0b with SMTP id
 98e67ed59e1d1-2b6ccd84692mr11082889a91.41.1715708392166; Tue, 14 May 2024
 10:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so10fduO3FksorrkVw6wUGNLWXqZM5gjf1ucEkZvNbdbg@mail.gmail.com>
 <25272.1715583428346104272@lists.openembedded.org> <CAMKF1sqtpdSbdNKGsvsJOd2q7xRs6UoU1rCfHUYVUbTjK2Bhow@mail.gmail.com>
In-Reply-To: <CAMKF1sqtpdSbdNKGsvsJOd2q7xRs6UoU1rCfHUYVUbTjK2Bhow@mail.gmail.com>
From: Geoff Parker <geoffhp@gmail.com>
Date: Tue, 14 May 2024 10:39:40 -0700
Message-ID: <CAHNuFG+VTPkL3zqaMh8a46atjC21GcgQgJ7GTix9BNsMzm88rA@mail.gmail.com>
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	akuster808 <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 17:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110399

Thanks Khem for the link to openembedded-contrib and information on
how scarthgap updates
are staged. However,  I'm not seeing the nodejs-os-cache commit in the
stable/scarthgap-nut
branch which is needed to fix nodejs builds on scarthgap also. Are
recent fixes in
meta-openembedded master backported also?

cc: Armin

On Mon, May 13, 2024 at 9:48=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, May 12, 2024 at 11:57=E2=80=AFPM Geoff Parker via
> lists.openembedded.org <geoffhp=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > When is the expected next update to the scarthgap branch? I've watched =
the patch move from  master-next  to  master, but there does not seem to be=
 a visible scarthgap-next branch to watch.
>
> Usually there is a monthly release update to stable branches that
> Armin queues up in contrib repo e.g.
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/sc=
arthgap-nut
>
> eventually when this branch is gone through some level of testing, it
> is proposed to upstream
> branch via scarthgap-next in main repo.
>
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#110334): https://lists.openembedded.org/g/openembed=
ded-devel/message/110334
> > Mute This Topic: https://lists.openembedded.org/mt/105884883/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

