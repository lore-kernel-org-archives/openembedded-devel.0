Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id B47E97E98A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:27:41 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x1so4033445qkl.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QKKWFlF5ZrFO7uHqpOUQu69FCkquIxVwZhreFfkoIk8=;
	b=C6DrQpS5YrYyCwH1Wb6mdo2Ypk4V6I085Bn0DZlKeJJvpMaknhHpZHzeoUEnKubAN/
	S0NyW2nme683SrEpWOZJkOQqGkeqEj1m5rxHkKJ2TktSe4T4WUBcNYu1g3/gyW3P4VPl
	uwBBgohfD+rpKyMaxM6MK9QJuO+h9C2gasPHjMkQoIuxu8I5xWsdGdOBf0D74F5iDzTJ
	8kIb6e1RrPVZ5wmgL8pp0A3KmHR/qs6o7w82lNMkuaGReUKB2rLNpC0GKVhgJ+FI+eyU
	dOSpZCHcdpAQk15FU4gciDSGygMpdUGlpesJ7UL2O1Fk+QEC07W09Qp/jI61DdndRqSG
	H3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QKKWFlF5ZrFO7uHqpOUQu69FCkquIxVwZhreFfkoIk8=;
	b=hgK1i4NwtmgKZHOVrw14HY4cfPopiVcahbO7t2g+bsED+yMIR8Ti9bgcXUOhvQGgNM
	0wUjuI+7vVAG0B+DvWRuvw8ts+TMQED2CwE1guwiTczFDZfQ3ARW0YERYxv4bEHuZ8yb
	SN7KB4YAzRSmzblxIn/t/6lLe7rrtIUKUpVr1HLrFt0CjtXC8M2z8vP9AXh+uh4QP5i1
	KRYgnFcq3hXGXMMlz2ag1owx6rDnlxHWVWmyTM6woMetncIPFa71hwpKopXyVqUG40mf
	1DrbRKxrUKLQfLMGS9LleSQ0D+kfrjAyjmZJPGgKtxVUDRYxuy4S4q+KtzNj0weHR2DS
	ERog==
X-Gm-Message-State: APjAAAWebHFgYW2UlPW4latcLUEoGUH2T8yFk0Q2NbcRWQyNgLypdtlK
	BwCIfgYdQ1GxnzWLFBCsrUjakLPiDdyaxNa/tf8=
X-Google-Smtp-Source: APXvYqzKJ9bQNORH8aSI55DpFKHvHSlfUS3Gn4zlhj+yg28J6ID51Siz3ZpPbvGqBsqf7vHh2oPtDPxijn1twS5w7Pk=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr12822708qke.212.1576463262367; 
	Sun, 15 Dec 2019 18:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<CAMKF1sq=oFvgEtCbSOtpgLsZZow669uqadeXmf4x3ydrPBVODg@mail.gmail.com>
	<CALbNGRQwTv_GmgwjB_J7vrfQPgTsU+aGE=E8KrzfDYs9-2T-vw@mail.gmail.com>
	<CAMKF1soZmy20ojdv4_zmaThH4dsW8X5qin_A=XHH4VjVoazbJA@mail.gmail.com>
	<CALbNGRRKQrcF5FdtLDc578Ztk+yA41RA9Lnqc6790WJZJviX9Q@mail.gmail.com>
In-Reply-To: <CALbNGRRKQrcF5FdtLDc578Ztk+yA41RA9Lnqc6790WJZJviX9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 18:27:31 -0800
Message-ID: <CAMKF1sq0HrBUHLjexjbj93JHysjwD6o7TZiLCFK8S2KvUr6Jqg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/21] Gnome cleanups & desktop patches
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
X-List-Received-Date: Mon, 16 Dec 2019 02:27:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 1:05 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> >>
> >> Since they include other images from within meta-mortsgna and
> >> lightweight (=3Dmissing important) is not target of mortsgna, transfer
> >> is not straight forward . See if I can put something together. Maybe
> >> something like core-image-minimal-xfce + some wayland bits would do.
> >
> >
> > Right that would be cool
> >>
> Played around with this but don't get it to start gdm.
>
> * Even if I would manage to start gdm I cannot not guarantee that it
> works for others because - as said - I use meta-mortsgna which changes
> defaults.
> * I would never use such image


I think a base reference image would be better in gnome layer then folks
can create fully featured complex images using this as base

It would be fine to see what works and then take it from there

>
>
> So if this is something wanted I ask others to add it - sorry
>
> Andreas
>

