Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23ACC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 12:43:38 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.11639.1714740208455493000
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 May 2024 05:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=duN8LuNv;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2df9af57b5eso92547751fa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714740206; x=1715345006; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt3pGUgZVngKuV1DbS597n5X4i2I692SZ4uYM7cveBY=;
        b=duN8LuNvM3490G5Z2e4k1zoMRfsjA+jrFiaPPz1GSq6IHUJAWlig0gWTY6TTZpo2Yj
         fCjj69I9Q9IbaCkzr1HAqHHSdqSh0zZqYIBciIhA57gfXSBNjZO0pBCcF1WbkjBh7K0G
         jCz7eCJ7G24uF2Ql4hQ78Psm8DdDq8uPdSDGlEscmg/SSrA+G9OfHvqKnf3ihNCOslMs
         7EUNb4/HVPRQ2Shh5PrSusrWvChC+ZQcvmeUPrP57r+6v4suRSBVbkM4A/zC0VnmmWL6
         yUMvwQ6UpmU/fukuVn82Vu0Gow3+i+sA8cy/MKmZSwGMnOYLJJf7i8BrAm2v16YAuvm4
         1Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714740207; x=1715345007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yt3pGUgZVngKuV1DbS597n5X4i2I692SZ4uYM7cveBY=;
        b=oOuAtM0GiLt8KVtwJJ3uawZdPeLWcXp4Evd7itYcSC38ua3V7MGXOMpsde5uZ/UhDH
         b+a//s3XTylErhzPEbQNDRVTiiGYELRqme8Y4/DTgLRQwuvyBwEYUm6zV911fsA/1/bt
         CSmdHDfmwnuK2UnkdY0/bpvxX4XVyKrE0id3rvS2JwwkmiPi48IrjTYhWVeirx6dl4Cm
         KKX9QTMqV5HdHVfOrbHSsylgzd4bIoaQJPal/bCYXiIicRhnw9BwC7uWvUVU7LHw3VSP
         D71EajW0vgLvNA1k8VBD3w88J4FUO17us6ZY+YLdOj35XQZ1m/+SV430YRdLPYmNc6eI
         vLvg==
X-Forwarded-Encrypted: i=1; AJvYcCUvO0DmaUcROWxH4bPZRcsO8Bw/0Sfg1qOKwK3/TUzLJmLSWM+eDRnsFUOG7s92dvyOgOkS8JTP0Y+daRHRPg+FaMDyvm0WrAj12CKrWn+ZHQAA0JxBDfgDOA==
X-Gm-Message-State: AOJu0YwVH4URhU/2fbJPjizHk33WpnXTTpICqg3up7xWfzLFAWUB5dmV
	ZW2wMU/SYOOn2Fsqmg3rRWGcgRggpMi5y30MdCBQghH8s727K+tMPukgPvykP1Y1gT0pARU3LCv
	6X8PFuZ8lSvHRcF0Nx/56BRxkraskvg==
X-Google-Smtp-Source: AGHT+IFYbP5QP6mge7MOs/GMki3MhCYBPf2v9GS6EpS4TqF9w+YZZLC5lsWKefCCZyxcTuogmaQN+c+Vjjde7bG8cPU=
X-Received: by 2002:a05:651c:199f:b0:2e1:dfa2:15f3 with SMTP id
 bx31-20020a05651c199f00b002e1dfa215f3mr2797227ljb.21.1714740206425; Fri, 03
 May 2024 05:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240503094232.2114574-1-martin@geanix.com> <17CBF1C9439E153E.14737@lists.openembedded.org>
In-Reply-To: <17CBF1C9439E153E.14737@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 May 2024 14:43:13 +0200
Message-ID: <CA+chaQdxAdEAe3DXWKmcD5HTv85SRZUHyRhedZHrw6XYedqToQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
To: martin.jansa@gmail.com
Cc: martin@geanix.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 May 2024 12:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110248

On Fri, May 3, 2024 at 11:52=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Thanks, perfect timing, I've just sent e-mail reply to nodejs upgrade
> that npm-10.5.0 upgrade broke this. Will test your change now. Thanks!

And it works for me, thanks again.

Cheers,

