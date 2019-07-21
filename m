Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id BD1717EF0A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:37:33 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h18so36160372qtm.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yCTazKpc/AATyMQ4G6pvwkXXjyAMAzyNeZszwDwLn4A=;
	b=JL8ibGIBH1RQUY8PfIJf/EeLgpSN1vzHqy6JAwyF0AYnyhVjxNl4L4FxACv+7xZYCt
	jJb98ZHiYKLZ3f6i9MRYxUTh/+gjbHEMhHQNGVSDIwxNORKCbBnm1d9ZL6+YIyL78FKk
	HLYuKHjnQqVtoBYhdUGXaXOhmrGj9+9TOE/3fYkqwb0ATQgkFKQ05gNoSg7rbvhe++f6
	bAjghFC6gJdJMYKtwIsMlaELS37eFDfdE6RCv7uQcDio4tKi658W5rS0KrZcdk3Bc6ga
	W9cc/F406I/A92RVGLtkJJvcvACv5/dXu0kzl+u3kSCkbdz8mudxqp+AWX9Oxj0sfyVt
	N8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yCTazKpc/AATyMQ4G6pvwkXXjyAMAzyNeZszwDwLn4A=;
	b=ULcK9//CFiIIBSI1NC2lW5h1qv5ZuziEaZwIei/qzQkzNrUkbF1hEKFnDbewjH6Ajq
	9zuuSuIk6hkeonrFucxoZQRSQtBWLebKeLipi1C0C9C4uhpoLbJ2NXz3hyAPB2GVgLjI
	kIQ+yPTv12hQvzEURca7eF2u1+n1EbfQX9xasoxvoMygD6uFeG+Ihlq7GB6I1xyMeLyS
	63e4skTS//TX22T1L3a/gE28ith/gT96z6f8dPXgV6bdztqNvaUgECZfM48ivdBzcDkr
	JLjnQHhZh3UEhBT1OzgYeODApxEptpNQ/HbegRzIt3VSK2++3JR5wCW45AFFh4MN0dY2
	1vMg==
X-Gm-Message-State: APjAAAWhX58ll2P9OhCAVvsMapUVe3TtooP5n41eauNrkPd86at4BSIj
	CEjYhDTKN2Kv2Obyit2D8xdy9gBjORmJRtFhJk/BgODm
X-Google-Smtp-Source: APXvYqwvn1BIPs78p40378FRaVXjG7fURpFCBPWOhmiwn2bq/9VhrOveUDIxdtFSUBH8mZrENo5XDX2Rj2tcUiV5oq8=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr45846653qtj.53.1563730654326; 
	Sun, 21 Jul 2019 10:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190718042123.61092-1-mingli.yu@windriver.com>
	<20190718042123.61092-2-mingli.yu@windriver.com>
	<CAMKF1sqTTzTSgXFHeizk7hgdCJ9=sBjJ56_BtNk1mJWf1FN5Ag@mail.gmail.com>
	<20190721172057.GC8967@localhost>
In-Reply-To: <20190721172057.GC8967@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jul 2019 10:37:23 -0700
Message-ID: <CAMKF1srjusOFUv_gQv0ySx2u=rhPg+_q3r22vScSxPHYKi4YhA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] log4cplus: Upgrade to 2.0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jul 2019 17:37:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2019 at 10:21 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Sun, Jul 21, 2019 at 09:27:33AM -0700, Khem Raj wrote:
> > seeing gold linker crash on arm
> >
> > https://errors.yoctoproject.org/Errors/Details/253440/
> >
> > however, this is a linker problem which is latent until this, I would
> > like to see if we can find a solution
> > before applying this patch
>
> Doesn't look like a linker problem to me, except that it also returns an
> internal error after the diagnosis for the actual problem


Regardless of input linker should not have crashed and a crash would
invalidate any diagnostics that it
Might have given since it could be due to invalid state the tool got into

>
>
> My untested guess for a fix would be a backport of
>
> https://github.com/log4cplus/log4cplus/commit/e0b046fbc90cee67ccff83dac04=
635755d7fa754


That=E2=80=99s a good one and seems will fix the problem worth testing

>
> <https://github.com/log4cplus/log4cplus/commit/e0b046fbc90cee67ccff83dac0=
4635755d7fa754>
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

