Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838C0C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 10:09:29 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.133183.1712657361005464414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 03:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SSMscsms;
 spf=pass (domain: linaro.org, ip: 209.85.208.49, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e136cbcecso7502298a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712657359; x=1713262159; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td5ehJ4+6jLBEu1gbpQm8vwYOisF4daUYt0+cA8CMbs=;
        b=SSMscsms+HQEK0GjL2XZtFeYFZVH8kCuCSWtaLQOjwstWsuex5/JkG4FpWDqZn7j0c
         YxbFHdyGxbY/SxOZ/0aTOE7MGlLIFt/5f4I0LW+iDN9sZJ/Xd6dyndoW3bJGrlDgusF2
         Zq9DPtUwY9gi9Z7RbXWFSxmJXMt73wYXgADiFRfwG2aoxpHV/3dFpvwz5LWlZ2hd/bpb
         06LL5Bn0hlwItK308oIOGA7/nOtZlk50a9etjI0UEEw6yb3+6GnW391zZ31vS6It61t2
         Xpv+yP8U7KhsYRN0ohNgQVl9l3IOMs+SZK0qkpav7BLJQJHpoFh+iNFarX7sIjsL7S4B
         AlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657359; x=1713262159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=td5ehJ4+6jLBEu1gbpQm8vwYOisF4daUYt0+cA8CMbs=;
        b=qzUw317KjjGc2zHgGb+yicKEul3NwSwH/Bi8r+qEOrVd4p4FMU2Gdgf3kVj4s5HP14
         MLdLu8BybnA48wzSdC7JjHxiPrvn0ozof5h6CeyzYpw7Og56Avnl33gP2JV83Y8CCCHj
         O4003Ut43ONDTlf7lYGskw1MEPdic/XqAMsNC3YksvhOu1JVACxq+NEdpzbYRxPN/vyL
         d/2oY5ub9xJ8M+ISeghVTdQDhh4QSJY+Ooz/EGh7yWpy5UPhB1ALnv/PAbaZqkDLkONn
         a06+SnuYA5J6ZZFv7kHR4AvQZHQOEeeKevJWilrcuMN6ZGhwF4GDsA1AyqErLmmkIXPn
         Yr8w==
X-Gm-Message-State: AOJu0YzJpPbKuyPuoBHEK3Hcm6Xy/pLHrUyMnyGZtp7Ki66sA1SzkyNL
	yKz7eixr5WDFhWNpMhnjLONjSRp1SyTMVuuKHVKKGeFHLYq/MPQnZTUaAAJNL4yDjQRhDVRIxje
	IV+QIEL0y+Wj/F6/JuJa1ZDa0JX8zEyGv7jCdKw==
X-Google-Smtp-Source: AGHT+IHvPRxV9TsPUZzrfzQGihxNVDriWCxU3nBolSYvZdBIKoZy68MgQRdYWQK9fFbFg986JDk8/p4SFTEOZ6ZYNtI=
X-Received: by 2002:a50:c358:0:b0:56e:6d9:7bd6 with SMTP id
 q24-20020a50c358000000b0056e06d97bd6mr10371425edb.34.1712657359413; Tue, 09
 Apr 2024 03:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240409075444.27196-1-fathi.boudra@linaro.org> <CANPvuR==LDTbWyNLAkANhzhmv8CZg3OSbDTxs4De0dKd_m=mjA@mail.gmail.com>
In-Reply-To: <CANPvuR==LDTbWyNLAkANhzhmv8CZg3OSbDTxs4De0dKd_m=mjA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 9 Apr 2024 12:09:08 +0200
Message-ID: <CAGNsrLDn+pyjP9SQA=Pb5ybHtQrkBNphO=mCK5htBV=T1hGs0Q@mail.gmail.com>
Subject: Re: [PATCH] [oe][meta-filesystem][PATCH v2] composefs: add a new recipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 10:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109878

Hi Jos=C3=A9,

On Tue, 9 Apr 2024 at 12:00, Jose Quaresma <quaresma.jose@gmail.com> wrote:
> Hi Fathi,
>
> Maybe just the #include <libgen.h> can do the job.
>
> It includes the posix implementation of the basename
> https://man7.org/linux/man-pages/man0/libgen.h.0p.html
>
> Added the same comment on the github PR.
>
> Jose

 I tried it initially. It looks like we need to use the gnu
implementation in this case, not the posix one (including libgen.h
won't be enough). Hence, I ended to propose the approach used in kmod.

Though, as many projects are affected and we can find several patches
floating around to fix the musl basename function changes, I wonder if
we should go down the road to include a stub in musl. I think that's
what alpine proposed at some point.

