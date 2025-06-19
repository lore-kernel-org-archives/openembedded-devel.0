Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB065C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 16:09:51 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.3737.1750349384137951688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 09:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P35AXPtM;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e78e04e48so7855897b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 09:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750349383; x=1750954183; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=999qFQVwvoBrFSYHYe5RQL0wTtc/OdeiNP54Ardveak=;
        b=P35AXPtMJTACNzBaWBPyjL4GOtcNePFsUC5xnu1l34DTPD0gi/6bu2ELmEzIa1mm+y
         sBHdUQJ/9BalOER4jJnF55JWl90l96vfMYQ4owURLZcc0xCPBoGLyU4oeQh0cFL0i/Jg
         lR3GgrLEDkZO1mrxJb3x/gh2ijxu2cXj7/j0JslJ+DLYMa5uYkluGJ3jUBTXFtGslZ3d
         xeUKM5e44ok2utfLS7OiewrofX0dOtWEz+IpF5EuEMmtiKXLawYbQAPX4nrOewIo5GDC
         +VQSc9poBeShpyKIQ5ei/0gUj1+TXxLWqRyj2NJQJ5THBdu1TnijXzDgrikOLwYbKurq
         IysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750349383; x=1750954183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=999qFQVwvoBrFSYHYe5RQL0wTtc/OdeiNP54Ardveak=;
        b=AGFb/vhOSbxznEEdOk6F67X5vprIPVezVaJKRodSjhHt3C904OdOErpF+ZKz8r3oNp
         lhpKdamvIW1mSI9Q/CYH0vyLT64+mhYcV/ha378AE6TkTz77pRpAUTEeW/d8PFlWrB95
         V0wqWurT46k+QyKmzD9llmxGAX6uXv1OScwJLo6CF3xavgjeett799ewPCLtgmcxX40Q
         TsM4M7G0OeJGhxpO6IYRwxZ/wk5/1oEPm+7+WGAV2d/08FDP+jWHR0x+WD1bk0/qJCDT
         i9NyTRwky0rImQ+P0beUdBq9VNEzesK+xYO9iBuJMMq6FatnGIEpALhRbM//2ON9sGJD
         s3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV47yFe05tvHQQ7qqMCg2070Ay1LhKakpkZmJ3MNbh9gpzzP6iw4JSRaWWvtiDgHRSRWAtf9mXS0UD5VSpL/7A8PaM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdR7b5lFApxknudh3AIN4plWHjDCpMt6pGsz95+ce/HZU/wJfX
	Kv82GODle+0N3NfLZoXMQeGZBYqeOl8AXgOBJH3WZDDKrDCWz7s1ittkP2DUaHueyPW2XCzOwNr
	ZnTIcks90EszH9eSEqMLvdR3T2q/v3R0=
X-Gm-Gg: ASbGncsuaEXwdO1c8YmENrYeOtU3SQa5G3VMEeahytfPgo5sVNkLnOowtT4brJerO8Z
	f4vxA7YrqSMy6YPUVnjhyDvBhJ1a5fWV6BOncNkxZnzJG7tvaMglvKnBwdEVl1lGmS8nOJEN8LM
	Ug0h3heC6EEw/fhZKC5qtAp9rEfhiEdyXkUz25lT1OlQ==
X-Google-Smtp-Source: AGHT+IGwL0ItYIroBpOKpl1/JpNzvP1HxfKht6YWmOx5z+hA3VtZvHaXzSypxouHdLge5knrkqT2JHW4VgjfVP94uhA=
X-Received: by 2002:a05:690c:23c2:b0:70f:6ec6:62b2 with SMTP id
 00721157ae682-711753852a0mr303019927b3.8.1750349383166; Thu, 19 Jun 2025
 09:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250619145738.3562283-1-christli@axis.com> <ab6d6f50-0409-4469-be0b-2b07f5333d6c@gmail.com>
In-Reply-To: <ab6d6f50-0409-4469-be0b-2b07f5333d6c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jun 2025 09:09:16 -0700
X-Gm-Features: AX0GCFtcnDPNpAMgqFCce98Z2UpiNtebGHLld09VDMxUn1gq6MmqQXKGDAdozK4
Message-ID: <CAMKF1sqKnL85LrUv2ResvCS1_X5Ggf4udG9iOyQqyRyM+8JkXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Use go module fetcher
To: skandigraun@gmail.com
Cc: christian.lindeberg@axis.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 16:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117953

On Thu, Jun 19, 2025 at 8:34=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 6/19/25 16:57, Christian Lindeberg via lists.openembedded.org wrote:
> >  CVE_STATUS[CVE-2019-10329] =3D "cpe-incorrect: Version does not match =
and only the Jenkins plugin is affected."
> >  SKIP_RECIPE[influxdb] ?=3D "QA Issue: task do_compile has network enab=
led"
> >
> I believe your patch obsoletes this SKIP_RECIPE variable from the bottom
> of the recipe.
>

Thats right, I have added a patch for removing the skip

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117950): https://lists.openembedded.org/g/openembedde=
d-devel/message/117950
> Mute This Topic: https://lists.openembedded.org/mt/113726820/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

