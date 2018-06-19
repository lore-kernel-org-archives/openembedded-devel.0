Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B97375463
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 14:44:06 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id s187-v6so11798305vke.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p196HUJuc0N7QBZOtN9yGPx4gGrxLp58X9ELaqYfVnQ=;
	b=Iq1fFzk8IWT8veia/uL/M2r8kQKI6XXdjtFf0IbLWzL5Jy6+5PLMD+IjElabApU5cL
	8/AONfaJIiNNMnV2w2qJl5t2y3wV5bU2gU9biFWHDJfkpb+gX8cc5igprc/6mDprO+H4
	sVefKPdD+rNEfCZOjsVcRXtKEXw6qHunY31/5RQ6B+PYCHz80r29snFk6abNJN9mWcmi
	+3VWsHpuwexfRN67VVf7+Hl4Yp2CQg7eSngoCz6XiXKcCQAoA5nR9ukOxiLO/+awT0r2
	k9okWAPEHxMOQxUNwjvlStLayGUHF+lGZQAClJFQe8PXh3EQnMQiUvflYm16X1An6x+4
	w5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p196HUJuc0N7QBZOtN9yGPx4gGrxLp58X9ELaqYfVnQ=;
	b=UoaG03qn2QFSPsKqfqbZYPDgY+JKC5rX59TDlf/cLUjAjMiYsAFDA+zi5Xnabjpy8P
	WRCy0UfS9tdGX2C8coXslcMya61X61vMyc9tJfLWaVzxy6CHxQcDVMoBcbO9ZGEKjlRO
	R26Pm3tMMWYZ6ESD6/E3L/WksrohdBFcYTrzAZmOM1wakR/xEbyvnGWMUNTo93jF/Dpt
	gJnvbzC0bjIIhxHwq6HomA3BAfeWBC/s+bSvfqLH84TEIV11u/ud56jj0w7ckgDldSad
	WS9sjbB5yg9RKxsI4c6GpGqsaaj7v6qObGLVZ8xB3qXcVxfI1+4Tu6VVlcEbjgJQpkjq
	0hcQ==
X-Gm-Message-State: APt69E2r2PkInHRAvmKdJOrpNGdpvLAGSLqeuMhr9dihLUyooc6qyGkx
	E+gIZor9fhZQ58jynPhm/CyodTGr1J+1bR/iiss=
X-Google-Smtp-Source: ADUXVKIOs83UZ4MRfSYWZP920q35DSPXwd2YrLUO1tNLccY9Y5t+1NnsKCLx27gfyViAVts3HB7F9pL5ciq1WfMTqEg=
X-Received: by 2002:a1f:5244:: with SMTP id
	g65-v6mr9873997vkb.28.1529419446763; 
	Tue, 19 Jun 2018 07:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
	<CALbNGRRK=096t=CpWX21Sk8aHTFD7Vtbmt2L1pO-A5CVo-8Rng@mail.gmail.com>
	<CAPuovEL5c3SF6YkRZMiobfAsyV7XLJzJz_E-oYdOzekmfSt1nw@mail.gmail.com>
	<f34caf7c04fd2b2dd33e9c1c14f53a37bb28080b.camel@linuxfoundation.org>
In-Reply-To: <f34caf7c04fd2b2dd33e9c1c14f53a37bb28080b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2018 07:43:55 -0700
Message-ID: <CAMKF1sot2wJqFzPji5uEXAZq5_TdaEavM97_RUyc1_cdgic=zQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: mark.asselstine@windriver.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Tue, 19 Jun 2018 14:44:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 2:53 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2018-06-18 at 19:25 -0400, Mark Asselstine wrote:
> > On Mon, Jun 18, 2018 at 6:27 PM, Andreas M=C3=BCller <schnitzeltony@gma=
il.
> > com> wrote:
> > > On Mon, Jun 18, 2018 at 11:42 PM, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > Off-Topic / FYI for me gmail considered your email spam
> > > >
> > > > Removing the libtool files became the project default a while ago
> > > > (Jan
> > > > 2017):
> > > >
> > > > meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?=3D "debian
> > > > devshell sstate license remove-libtool"
> > > >
> > > > so I suspect you're in the minority not using that now.
> > >
> > > Maybe true. But breaking builds consumes resources on many sides -
> > > this thread is a good example
> > > >
> > > > http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/distro
> > > > /defaultsetup.conf?id=3D3e2a47fdfceccd5f8832235b7a2df83076e84a98
> > > >
> > >
> > > The more I think about this:
> > >
> > > * Why is remove-libtool something a distro can override? If causing
> > > trouble it can be deactivated recipe-wise.
> >
> >
> > That was my feeling as well as we were having this discussion,
> > without digging into the history it felt as if this should have been
> > made core functionality and not optional, especially given the
> > opportunity for recipes to opt out. At any rate I am about to send a
> > commit to get things buildable for when the 'remove-libtool' distro
> > feature is absent and as long as it remains optional I suppose all
> > recipes should function with and without the feature.
>
> There are many different features which "distro maintainers" can turn
> on/off which can break the builds. I was always reluctant to add the
> libtool change but we reached the point where it simply no longer made
> sense to keep those files around, they caused more problems than it was
> worth effort for.
>
> Its not a setting I'd recommend anyone use now because as you're
> finding, the .la handling metadata is bitrotting. As with many things
> in the project, its "at your own risk and maintenance burden". Its not
> a combination I have any plans to add tests for.
>
> The better solution would be to drop all the .la file FILES directives
> and handle .la files in a similar way to the way we handle debug files
> into -dbg packages. If anyone cares at this point.
>

Not worth the effort IMO

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

