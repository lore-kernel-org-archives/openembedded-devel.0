Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 259D06BF88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 03:49:10 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id f8so1610768wiw.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 19:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=0J6/hD7S0lscGrWyAbQXa7NR2GU7L5nP8ytlk9cMvjM=;
	b=uPukl/RKGJQxzJWgyiqtmPwUv6tA+hZ2kctjPYqceUZGhUDatI1nURfRUv0zleAcYd
	bU0gAO75Wq412mAiqrJ9gBZFxHsPBJp8DetfPndu2UA5KZgSM6DFXrQOXVHGflZ09h3H
	gGD53xo05MNpmyKkcg5iP+mg2sogD5h3tLVcf1GW3k0iHnoXmvDc3ScI1+aJSaBUDIi5
	9EhhZ0kaxhOJYYgJKxzuNpYELl8T7iEZCDY8KeqjkpVE1viDFNbUWQBDiTXDePXmbPuN
	3qggekCrSQ9LoNlQPF6ZgzpxSwlEeadbu4n0U72dqWovvXfi/hKWAfcmtdMGoHQMIqbd
	scvw==
MIME-Version: 1.0
X-Received: by 10.180.95.100 with SMTP id dj4mr1916861wib.35.1393386550697;
	Tue, 25 Feb 2014 19:49:10 -0800 (PST)
Received: by 10.194.59.228 with HTTP; Tue, 25 Feb 2014 19:49:10 -0800 (PST)
In-Reply-To: <CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
	<CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
	<CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
Date: Tue, 25 Feb 2014 19:49:10 -0800
Message-ID: <CAOLEWZXkxbWSqWvJwHP4V+iMLOJ9OeHrht_S9eQj1qBc05xH3w@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: GDM alternative?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2014 03:49:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Is there any interest in reviving slim?  I'm using it on gentoo-arm on
several devices; works just like x86.  Since I haven't tried it or
otherwise looked at it in oe yet, I have no idea why it's in a non-working
state.  That said, it was on my todo list until I noticed lxdm, so I'll
probably check it out at some point; never a bad idea to have another
lightweight alternative...

Steve


On Thu, Feb 20, 2014 at 1:36 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Andreas, LXDM from meta-oe works well with minimal configuration on my pa=
rt
> :)
> I didn't have to add another layer to satisfy dependencies. Thanks :)
>
> Adam
>
>
> On Wed, Feb 19, 2014 at 11:36 PM, Andreas M=FCller <
> schnitzeltony@googlemail.com> wrote:
>
> > On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.com> wrote=
:
> > > Thank you Koen and Andreas. That has been really helped in clearing u=
p
> my
> > > confusion and setting the path forward.
> > >
> > > I think I will try LXDM in meta-misc in meta-oe. Is there any special
> > > configuration that I should be aware of (other then setting it as the
> > > graphical init manager)?
> >
> > meta-misc is my personal playground - it might have dependencies to
> > other layers and some things might not work as expected...
> >
> > Andreas
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

