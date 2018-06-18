Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15B817522A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 23:40:40 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id c23-v6so11864159uan.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0Xvo6cWRjG8VsAquKQ2/mGM+gyovdEvTJRRyDop5Bpk=;
	b=rlj6en0lEiFzj/xxc/p0C84uNF3CHo45SScG3mBazbH/cN/IeKFMJXVvfeD17taGOK
	s3hTIYcuiHkpr+zKGqVY4qGYA6uNIwoSKbTHV884nO3skOqxvF/Zp9U07YcU2GfDv+kv
	VECoOdv27MxeRQSoMfpE8elz5qq0ClrFkdV4Vw9hwOVek802BPzBLGVqqKZrIra5n6Ai
	wf0ivOIvaQ9jaxG3QMdkdotQtwthf/xucDdYetaUzKLaMUFAIcTc40TvWAWQRl2ooJQ0
	vBepdLzJggk4eBcRj70C8WSdiIt4eY12rFHI9+rURS+VW5WTUX2w0IqF38uJxHlhjzie
	yn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0Xvo6cWRjG8VsAquKQ2/mGM+gyovdEvTJRRyDop5Bpk=;
	b=gBwAJEzCdXDzReQ2bl3nvhHRVtlaf7+et6lD6etSCYUT8E5p5tCW2sL7oEHXth/4Uh
	FKUZVvjYJgGHvfblUp8VPRBWcNqi2l0vb2JDIOIQ3PbX4cbWV9MIfroIPlalw81P180m
	9+ziru/+OXZftNwTaXdTA/Puxh8krAILlK+ZwEX01AUxoMorLfu4w8xaKS64Hgx+/F9Q
	W7puAbKR8T7KVI20Yw6WDE8CG5n+1JQ0zYwNo6YqY4InT8Fzy6l1Fz5AuBOUh3ypQXkU
	gWMHsM55MzAqPRA/BWlhDGooJKv0HiXpGHlLJRI/6NuLMR87HWYfQC6dOt7AfMScztml
	OluA==
X-Gm-Message-State: APt69E23UkTkkUj/+EPOk1NeMay/Jyo09Rg+u8blFeBi6MFtexbG0ktA
	/nRDA7NYyiz4uX7i2NVOWZ7F/RxrKXr2tyxc6jQ=
X-Google-Smtp-Source: ADUXVKKrcAeF+O7J1Lr7IX3MT9W9n1G4grwdY2lEoiwOK+PBrSkMcyyTH0tab9dfkqA+bY66Uhwh/Z9HO9FGrEcgcu8=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr8985186uac.164.1529365241709; 
	Mon, 18 Jun 2018 16:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
	<CALbNGRRK=096t=CpWX21Sk8aHTFD7Vtbmt2L1pO-A5CVo-8Rng@mail.gmail.com>
	<CAPuovEL5c3SF6YkRZMiobfAsyV7XLJzJz_E-oYdOzekmfSt1nw@mail.gmail.com>
In-Reply-To: <CAPuovEL5c3SF6YkRZMiobfAsyV7XLJzJz_E-oYdOzekmfSt1nw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 16:40:15 -0700
Message-ID: <CAMKF1sprgFYFRVXwU66cuBekL=raDsV3fF+9C-q5OREcQO2aMg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 18 Jun 2018 23:40:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 4:26 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Mon, Jun 18, 2018 at 6:27 PM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> > On Mon, Jun 18, 2018 at 11:42 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > Off-Topic / FYI for me gmail considered your email spam
> >>
> >> Removing the libtool files became the project default a while ago (Jan
> >> 2017):
> >>
> >> meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?=3D "debian devshel=
l sstate license remove-libtool"
> >>
> >> so I suspect you're in the minority not using that now.
> > Maybe true. But breaking builds consumes resources on many sides -
> > this thread is a good example
> >>
> >> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/distro/defa=
ultsetup.conf?id=3D3e2a47fdfceccd5f8832235b7a2df83076e84a98
> >>
> > The more I think about this:
> >
> > * Why is remove-libtool something a distro can override? If causing
> > trouble it can be deactivated recipe-wise.
>
>
> That was my feeling as well as we were having this discussion, without
> digging into the history it felt as if this should have been made core
> functionality and not optional, especially given the opportunity for
> recipes to opt out. At any rate I am about to send a commit to get
> things buildable for when the 'remove-libtool' distro feature is
> absent and as long as it remains optional I suppose all recipes should
> function with and without the feature.
>

Richard,

initially its good to have it overridable, so give some soak time so a
weak assignment
was right thing IMO so the distros could have some time to soak it.
but may be its
time to enforce it in oe-core.


Mark

I would also also suggest that you switch to using it in your distro,
as well besides the
patches which is fine.

> MarkA
>
> >   - or
> > * does anybody see a problem with inherit remove-libtool for all xfce
> > recipes in xfce.bbclass?
> >
> > Andreas
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

