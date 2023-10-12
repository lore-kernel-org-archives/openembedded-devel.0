Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EA3CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:14:10 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.5341.1697091239871572493
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UxZgUwer;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1e5602c12e5so314718fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 23:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697091239; x=1697696039; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6MjR0Chqn8eYd/b4ntg8SykFWluEwMQefbcCpFW+i4=;
        b=UxZgUwerh30RG5qFn5jDZY+0zQU3g+wi8b+HvUYvm9hMcl/KP/zLsg5mReu0jOPxcq
         Ub4Lg6c4/9nmqZLPpnOVyrKus583ICE56/UJiaBw9o+n+xTBH6PxsrGHrXW2QSVtZJkT
         2Y1J4TzhPeXAVZRZlxffz4Ohj+gkBkNumsQA/pypT69Nogus1lY1nff/oEuvaKD+RWId
         e4iqOgw7yoC7w09jYkK0QLKypotpnVsDK81439Hpat41hUwUoI1fc2Uxw9HfqSlOZ73s
         mBKtrH/JHxs839nCflscCWbYA43NJtLmVitq0X7SHFEdvxKqWBDwI0FFUznjSatNaEF9
         KG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091239; x=1697696039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6MjR0Chqn8eYd/b4ntg8SykFWluEwMQefbcCpFW+i4=;
        b=ghA8m6EmAVjXwEcjG5NXLQgbzhGFZ3gunK78UEEpCeHVrqGYGg+CJLh8yxllPdvK9q
         2sN9Bc08KJsxXRf/gVatx+EV/YAQnrp5LFG906aQMqnhPDGM6c4MRu2FwtgPC4r5wFHK
         4C03UXGnxr0Tznk9i7tK0mlefUe4rGrg0Wh9huAt+6XsQn3kSFgMF0O4CFMZoeZj8K2E
         DJGtoReLBsfAqlXdDtjh9Re6dxf0qKg214s2bTcEc+AQUjxOkxPJ8yYg+KoFbk48rUED
         ibPszd/LIUm9JMy/x6qRKv51t0oDsM36BW3la7lU6malth1ZLZNqHddsA0L5rYJQTO/g
         7bPg==
X-Gm-Message-State: AOJu0YyteiN9RhYtA3b2KaVMuCJ1KTyGVzxtqifIHEAllZzKpqC44hqa
	OkvJhAvNkpr2ZLEWrhTGlyGEF0wFvoKHbAVl9ycExJ5FDVw=
X-Google-Smtp-Source: AGHT+IHX4IJwjWvYc232wU3bhN7cHH0SGQkbssmXKSeuaganrxIkf57jwS+J4CTs50eDjK9nTyRStCvC9iuIStZqUFg=
X-Received: by 2002:a05:6870:1051:b0:1e9:c224:bb91 with SMTP id
 17-20020a056870105100b001e9c224bb91mr268468oaj.38.1697091239045; Wed, 11 Oct
 2023 23:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so7uQnqjOmAb8AV12HXmjBy0zMwndTTv0eakORx4_SWdg@mail.gmail.com>
 <31911.1697090820845026480@lists.openembedded.org>
In-Reply-To: <31911.1697090820845026480@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 23:13:32 -0700
Message-ID: <CAMKF1srtCTjD4DiA+uAJG2ax+O9L=N7BSUu3AMps2tO2MWBD7w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libeigen: Set LICENSE for libeigen-dev
To: akash hadke <akash.hadke27@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105442

On Wed, Oct 11, 2023 at 11:07=E2=80=AFPM akash hadke <akash.hadke27@gmail.c=
om> wrote:
>
> Hi Khem Raj,
>
> Yes, there is GPL-3.0 code present in the main source, right now its not =
getting used but if in future sources start getting used then again we will=
 need to change the license hence I added a special entry for the dev packa=
ge.

Future wont. This package has moved to Apache-2.0 and dropped all GPL
code once we upgrade to the next release.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105441): https://lists.openembedded.org/g/openembedde=
d-devel/message/105441
> Mute This Topic: https://lists.openembedded.org/mt/101893030/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

