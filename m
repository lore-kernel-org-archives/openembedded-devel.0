Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6616F301
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:29:05 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id f8so44310wiw.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6FZixnE5/qv460rMTfVBeXjWO1uCV2w3IUDaNXy5Tfk=;
	b=OOmk22c6lvPB5HZRwCqs+AjC62t6o91//sl5/+cMqN+3Hl4aZXE7ER/HkXi2LyTRxq
	G8yqifp/f24BFi0qvu9wZs+fGvn3MzYOnl6XPgDPZTjW2uNmdF6qNrtvCmegE1B8eqqk
	LOJ3I1jTkzLTbASNg/aA52VoGVTlcQFoD0kRMarAm4cuWwLkRI4wm1ml/O3TdoM3E5zj
	DJ1DiFa6yylakXTmQM9RKzr7e7SpSwm8rE6HrFNiMNBhPIEfpeRIVgX1BR/PAFlgAqB+
	xdQ/we4AXlfKm065SDv3lL22qdjNASaNqKDvKEsS25rOtn+BHzmwtdnMckZJQY2uEyX5
	h2Hg==
MIME-Version: 1.0
X-Received: by 10.180.89.225 with SMTP id br1mr363919wib.38.1393540146489;
	Thu, 27 Feb 2014 14:29:06 -0800 (PST)
Received: by 10.194.59.228 with HTTP; Thu, 27 Feb 2014 14:29:06 -0800 (PST)
In-Reply-To: <CAFeBWL45oks2uq5RLaPrCCbfMaBrA9-yb0DYOLd9jTuey+qC9w@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
	<CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
	<CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
	<CAOLEWZXkxbWSqWvJwHP4V+iMLOJ9OeHrht_S9eQj1qBc05xH3w@mail.gmail.com>
	<CAFeBWL45oks2uq5RLaPrCCbfMaBrA9-yb0DYOLd9jTuey+qC9w@mail.gmail.com>
Date: Thu, 27 Feb 2014 14:29:06 -0800
Message-ID: <CAOLEWZVWNDNTTggnOEinOYtKZDuse5T_v=JOhRvyi-L9z5oUZQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Feb 2014 22:29:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It's a bit more subtle than just "obvious advantage" since the deps are
different, config options are different, etc.  Slim is probably "lighter"
than lxdm, in both features and dependency bloat.  The former pretty
depends only on X11 libs and png (with optional pam and dbus/consolekit
integration).  OTOH, lxdm has about the same pam/consolekit features, but
depends on gtk[2|3].  So, a bit fancier and a little more bloat.  Which one
do you think is easier to theme?  ;)


On Wed, Feb 26, 2014 at 3:28 PM, Adam Lee <adam@gumstix.com> wrote:

> Are there any obvious advantages over one another between LXDM and Slim?
> I love how LXDM doesn't require complicated authentication framework like
> GDM.
>
> Adam
>
>
> On Tue, Feb 25, 2014 at 7:49 PM, Stephen Arnold
> <stephen.arnold42@gmail.com>wrote:
>
> > Is there any interest in reviving slim?  I'm using it on gentoo-arm on
> > several devices; works just like x86.  Since I haven't tried it or
> > otherwise looked at it in oe yet, I have no idea why it's in a
> non-working
> > state.  That said, it was on my todo list until I noticed lxdm, so I'll
> > probably check it out at some point; never a bad idea to have another
> > lightweight alternative...
> >
> > Steve
> >
> >
> > On Thu, Feb 20, 2014 at 1:36 PM, Adam Lee <adam.yh.lee@gmail.com> wrote=
:
> >
> > > Andreas, LXDM from meta-oe works well with minimal configuration on m=
y
> > part
> > > :)
> > > I didn't have to add another layer to satisfy dependencies. Thanks :)
> > >
> > > Adam
> > >
> > >
> > > On Wed, Feb 19, 2014 at 11:36 PM, Andreas M=FCller <
> > > schnitzeltony@googlemail.com> wrote:
> > >
> > > > On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.com>
> > wrote:
> > > > > Thank you Koen and Andreas. That has been really helped in cleari=
ng
> > up
> > > my
> > > > > confusion and setting the path forward.
> > > > >
> > > > > I think I will try LXDM in meta-misc in meta-oe. Is there any
> special
> > > > > configuration that I should be aware of (other then setting it as
> the
> > > > > graphical init manager)?
> > > >
> > > > meta-misc is my personal playground - it might have dependencies to
> > > > other layers and some things might not work as expected...
> > > >
> > > > Andreas
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
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

