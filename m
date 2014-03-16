Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id B7CD96F6EB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:19:01 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so3977643wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 16:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/End5WwL/BjANUOoQZrCkVy1DDHPeAIdXwhnIOgjp7o=;
	b=TX5CJEM75EuQrJNs+F2QUwIeYCNM/DfUqXsmhxYNkM4Ccw/+LvIjk7ENYU+r2nIi0X
	p5UQMFH1DH1aPDpP0IoqApKHewNjdhku67BqcoGjeqS6XNDozqq+Rqnglx1BgT+8qWux
	y4riBQHI/Iw6Dtbk6Vq1jR+8RKu/nXfbxZhehwReQGsGhd93HrCyXojUq7/5ccoqY+tQ
	93DNkKTG3V7asKBJLbI1BjMJ6sHfOMxtCpoKwmWDUh4ckzkG/9y6f6943AD/envH98Z4
	jE7gXX8A8ZW6TYcvdvxmXUaxvupcnRwkSx8opbadcTi85nVKCPhFKAFkleEfOXe/j+aJ
	5JMw==
MIME-Version: 1.0
X-Received: by 10.180.20.71 with SMTP id l7mr6800478wie.35.1395011941700; Sun,
	16 Mar 2014 16:19:01 -0700 (PDT)
Received: by 10.194.59.228 with HTTP; Sun, 16 Mar 2014 16:19:01 -0700 (PDT)
In-Reply-To: <CAFeBWL4eJctcjtoDQ=t3JikGJTBdod-_s15g0srzTH-BZo0_WA@mail.gmail.com>
References: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
	<CALbNGRS6kRODsVKPVunWQzVSBwkKn8cXdSWwpmWTXhJ_chfeSA@mail.gmail.com>
	<CAFeBWL78jHPU1XUvo6PC4=Qy2RFKCphNbq4mH6Y_R0bbTyGMyg@mail.gmail.com>
	<CALbNGRTPPhRdLmyJAD2d3-Lmt=K-EQo-dSKwzt0a=Vcaq7rpMA@mail.gmail.com>
	<CAFeBWL7u1yEHLFoe_=TYH17-e+jJ-Jrq-S63h-UsvdniNw6U=g@mail.gmail.com>
	<CAOLEWZXkxbWSqWvJwHP4V+iMLOJ9OeHrht_S9eQj1qBc05xH3w@mail.gmail.com>
	<CAFeBWL45oks2uq5RLaPrCCbfMaBrA9-yb0DYOLd9jTuey+qC9w@mail.gmail.com>
	<CAOLEWZVWNDNTTggnOEinOYtKZDuse5T_v=JOhRvyi-L9z5oUZQ@mail.gmail.com>
	<CAFeBWL4eJctcjtoDQ=t3JikGJTBdod-_s15g0srzTH-BZo0_WA@mail.gmail.com>
Date: Sun, 16 Mar 2014 16:19:01 -0700
Message-ID: <CAOLEWZU+xFDg4a8D2uFwCbj2yoW7Tx9GFvCXZPPKX-=EbRWVqA@mail.gmail.com>
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
X-List-Received-Date: Sun, 16 Mar 2014 23:19:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Haven't gotten to slim yet (other things intervened) but I did add lxdm to
my xorg image.  Got it working with a bbappend for an init script package,
upstream automake broke it, so I had to fix it again (along with some other
stuff).  Anyway, the latter patches are in the ML queue; works fine so far,
although the session menu isn't populated since it only uses the mini_x
session for openbox.


On Fri, Feb 28, 2014 at 9:35 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:

> Thanks Stephen for your response :)
> I think I will give slim a spin this weekend on my desktop. Ultimately a
> lighter DM will be appreciated on my embedded boards.
>
> Adam
>
>
> On Thu, Feb 27, 2014 at 2:29 PM, Stephen Arnold
> <stephen.arnold42@gmail.com>wrote:
>
> > It's a bit more subtle than just "obvious advantage" since the deps are
> > different, config options are different, etc.  Slim is probably "lighte=
r"
> > than lxdm, in both features and dependency bloat.  The former pretty
> > depends only on X11 libs and png (with optional pam and dbus/consolekit
> > integration).  OTOH, lxdm has about the same pam/consolekit features, b=
ut
> > depends on gtk[2|3].  So, a bit fancier and a little more bloat.  Which
> one
> > do you think is easier to theme?  ;)
> >
> >
> > On Wed, Feb 26, 2014 at 3:28 PM, Adam Lee <adam@gumstix.com> wrote:
> >
> > > Are there any obvious advantages over one another between LXDM and
> Slim?
> > > I love how LXDM doesn't require complicated authentication framework
> like
> > > GDM.
> > >
> > > Adam
> > >
> > >
> > > On Tue, Feb 25, 2014 at 7:49 PM, Stephen Arnold
> > > <stephen.arnold42@gmail.com>wrote:
> > >
> > > > Is there any interest in reviving slim?  I'm using it on gentoo-arm
> on
> > > > several devices; works just like x86.  Since I haven't tried it or
> > > > otherwise looked at it in oe yet, I have no idea why it's in a
> > > non-working
> > > > state.  That said, it was on my todo list until I noticed lxdm, so
> I'll
> > > > probably check it out at some point; never a bad idea to have anoth=
er
> > > > lightweight alternative...
> > > >
> > > > Steve
> > > >
> > > >
> > > > On Thu, Feb 20, 2014 at 1:36 PM, Adam Lee <adam.yh.lee@gmail.com>
> > wrote:
> > > >
> > > > > Andreas, LXDM from meta-oe works well with minimal configuration =
on
> > my
> > > > part
> > > > > :)
> > > > > I didn't have to add another layer to satisfy dependencies. Thank=
s
> :)
> > > > >
> > > > > Adam
> > > > >
> > > > >
> > > > > On Wed, Feb 19, 2014 at 11:36 PM, Andreas M=FCller <
> > > > > schnitzeltony@googlemail.com> wrote:
> > > > >
> > > > > > On Wed, Feb 19, 2014 at 5:15 PM, Adam Lee <adam.yh.lee@gmail.co=
m
> >
> > > > wrote:
> > > > > > > Thank you Koen and Andreas. That has been really helped in
> > clearing
> > > > up
> > > > > my
> > > > > > > confusion and setting the path forward.
> > > > > > >
> > > > > > > I think I will try LXDM in meta-misc in meta-oe. Is there any
> > > special
> > > > > > > configuration that I should be aware of (other then setting i=
t
> as
> > > the
> > > > > > > graphical init manager)?
> > > > > >
> > > > > > meta-misc is my personal playground - it might have dependencie=
s
> to
> > > > > > other layers and some things might not work as expected...
> > > > > >
> > > > > > Andreas
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > >
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > > >
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > >
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

