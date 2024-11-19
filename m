Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA86D44165
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 14:33:10 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.22584.1732026789541035201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 06:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uP67GVdE;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.177, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e38232fc4d8so2491402276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732026788; x=1732631588; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=act7yDE4N3e1lOiDZyeCwOsZUVYVaL/TB8ACCqbicRM=;
        b=uP67GVdEg/3XgUqNH2Fzxht/ckMlowaq7Kw6S++mlixiZSl8Tm4XcB6EH5iZdQ+il6
         2sfRj1aGFqEe0ZUkz6cNJtSA/6Sp7zQrsb1P7fgalp99xyHjrCuE4eOcbdaQZFy9QIA/
         1uZpaQGO3PP3Tr+1XBEwqk1LgaY/F4YI1nDJsKHs11i1k8lSBpmHyygoQWNUv1go5FK9
         A55K+IVkjenvaa5+9pR6tOxIvHF2CIAUlYkAV5s1YRQibHTsGe1A9+bwE8Wt69o/RKZT
         plL2SAYWOxt4S95vsz9aUHJhRVnmsqCo4Pj3kOVbBkjtZX5znstsRw60hUIgfqUd6nl+
         ycUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026788; x=1732631588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=act7yDE4N3e1lOiDZyeCwOsZUVYVaL/TB8ACCqbicRM=;
        b=VJik5tmUDTeQo6B3KEzbYo5vGcxjlAuVKvWYBz03N8RKsStLMu9xqZ8MYc6mTVsvk0
         WuvMdMzoBzL+6s9C+g3wd7hVuXnhyx6YWUX83yU6C0WMrmAliQGnzmw4aN63nGPvCGPe
         BbAN4y2f9+YId+9PllgLEovwDAiph0pWjZblXhNjwenNCC0fg2pDNJxIyixB/JLIR15R
         69gSX3tACBi1m8ar3mfyizac9lPSB+SuVKF39fkbN/7DNNrHxALoXXo13vjMek0AFyuQ
         UjGck6jNFYMXQn2zgporNCWxEp3NJk2pZDNnS3OMXCRVM9uX0dVjx6gcHGvX9XJGN3OX
         vOFw==
X-Forwarded-Encrypted: i=1; AJvYcCXm4uBbmFHSRmM2zXo1EksJ+125YtJn5L4QlbFNlzO9XdeMIUmtKaS3r2cI/4++gXBBjiKiodp7NQiDiHOSr9f1Mrs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYzHbg6batE8ZitPqqPw1YW7V5gsQGIduDcW4lZ9d/p5xSHdS6
	Kj6d5rqZaf8p0wqdKbAcIt5mysuguumPdBt9QAKdXX+XkER6C7sps5mIld4wkltgHAMEnuTyT+e
	CQjpsFeZCo/pL0r7f8GoYL8yQXX8lBQwPKmfeOrNVQvatonAs
X-Google-Smtp-Source: AGHT+IFi88aKAoqgSxRpvjGLbvVad+QMOfgPm1U9ZaCIjlT6Xf/qecDCRgnVuxq5xpkYmrdbXQOICHoqommKuk10heI=
X-Received: by 2002:a05:6902:110b:b0:e2b:d4c8:c5e9 with SMTP id
 3f1490d57ef6-e3825d379e2mr12480510276.11.1732026788671; Tue, 19 Nov 2024
 06:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20241114111829.1182716-1-liyin.zhang.cn@windriver.com>
 <ZzX0di8r1p4zh_PO@bootlin-mathieu> <7a80e2e2-622a-419d-8ea6-7c29e2a2a992@windriver.com>
 <ZzyKvNO8ZLK-UMT4@bootlin-mathieu>
In-Reply-To: <ZzyKvNO8ZLK-UMT4@bootlin-mathieu>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 19 Nov 2024 06:32:57 -0800
Message-ID: <CAOSpxdZVReE8MuoHNz2LhimFCtng9WKFDS8wGruXuouua5f5xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-ust: backport patch to fix
 cmake-multiple-shared-libraries build error
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 14:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113910

On Tue, Nov 19, 2024 at 4:55=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue, Nov 19, 2024 at 09:32:17AM +0800, Zhang, Liyin (CN) wrote:
> >
> > Sorry, I forgot branch name. Please merge it into [scarthgap].
> >
> > Thanks.
>
> Ok, noted it's not for master. Adding Steve, in copy to make sure he
> sees your patch.

Got it, thanks!

Steve

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

