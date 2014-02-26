Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0DA6F3A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:28:17 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id if11so1678443vcb.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=hBtGQ1zfBB4Wf4SPRIYYdczO7yhaMTyc8GHKfFPxzGg=;
	b=J5cCLu5E4i8gQeG/JZdvLN1e3yAMrS1HeL1lvdojanzUSVuiqdcoCkd5xp4qxjM94A
	yNYdbL9dK5D1l0C/BbzAmbBGuRF8hEKdScX+sc5cSjpNbtELz3WCxrBcpYG88ivfHWi4
	d42YHX/G95THHJzD1yrEYMt+TVhllVtHREljvH/UWiMeMR4qG8q8V/I5sfaODQOOOmfg
	eDsBnUspnS7fOHhK29ZvvqRv7igr/PrsgM7k6HYYwC4SHqsk2+aZ3bZ8PG+LxaLWAm9A
	Ib9KWrLJrs8+uG9LMsiUnJuNZfhcVVSGz8J64FL1KG9lOLmtJmL7EI6OoWALV1caV6QJ
	jTTQ==
MIME-Version: 1.0
X-Received: by 10.58.188.78 with SMTP id fy14mr8037024vec.23.1393457297904;
	Wed, 26 Feb 2014 15:28:17 -0800 (PST)
Sender: adam.yh.lee@gmail.com
Received: by 10.52.169.99 with HTTP; Wed, 26 Feb 2014 15:28:17 -0800 (PST)
In-Reply-To: <CAOLEWZXkxbWSqWvJwHP4V+iMLOJ9OeHrht_S9eQj1qBc05xH3w@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
	<CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
	<CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
	<CAOLEWZXkxbWSqWvJwHP4V+iMLOJ9OeHrht_S9eQj1qBc05xH3w@mail.gmail.com>
Date: Wed, 26 Feb 2014 15:28:17 -0800
X-Google-Sender-Auth: ZjGMZ_CQBzlfZ2_gVJnGzIZ5UFw
Message-ID: <CAFeBWL45oks2uq5RLaPrCCbfMaBrA9-yb0DYOLd9jTuey+qC9w@mail.gmail.com>
From: Adam Lee <adam@gumstix.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Feb 2014 23:28:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Are there any obvious advantages over one another between LXDM and Slim?
I love how LXDM doesn't require complicated authentication framework like
GDM.

Adam


On Tue, Feb 25, 2014 at 7:49 PM, Stephen Arnold
<stephen.arnold42@gmail.com>wrote:

> Is there any interest in reviving slim?  I'm using it on gentoo-arm on
> several devices; works just like x86.  Since I haven't tried it or
> otherwise looked at it in oe yet, I have no idea why it's in a non-workin=
g
> state.  That said, it was on my todo list until I noticed lxdm, so I'll
> probably check it out at some point; never a bad idea to have another
> lightweight alternative...
>
> Steve
>
>
> On Thu, Feb 20, 2014 at 1:36 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
> > Andreas, LXDM from meta-oe works well with minimal configuration on my
> part
> > :)
> > I didn't have to add another layer to satisfy dependencies. Thanks :)
> >
> > Adam
> >
> >
> > On Wed, Feb 19, 2014 at 11:36 PM, Andreas M=FCller <
> > schnitzeltony@googlemail.com> wrote:
> >
> > > On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.com>
> wrote:
> > > > Thank you Koen and Andreas. That has been really helped in clearing
> up
> > my
> > > > confusion and setting the path forward.
> > > >
> > > > I think I will try LXDM in meta-misc in meta-oe. Is there any speci=
al
> > > > configuration that I should be aware of (other then setting it as t=
he
> > > > graphical init manager)?
> > >
> > > meta-misc is my personal playground - it might have dependencies to
> > > other layers and some things might not work as expected...
> > >
> > > Andreas
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
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

