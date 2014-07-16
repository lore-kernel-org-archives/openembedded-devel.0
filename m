Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EEEB170200;
	Wed, 16 Jul 2014 20:19:26 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so1433978iec.19
	for <multiple recipients>; Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FiCdEQ83LSlXAzxpPq55V51FD187k9JGXpfqCS8HFWY=;
	b=bKdGvwTlko6i1Qwk5OcYuUrrD7Zj12RK8QGEmMNCS/GfSibr43MduvOyaGD62lANUO
	xyUWJvxjEZJ6yWdefcWTs7sZYLWFrA5djW57KSBg5OmslozWw5jD9D4ArgOB0CF8MBIF
	+WW5299/mjm0vY8AEdcDs8butoSjNSZ+4bauTKQfpUd+7kAhF+JWPzuGY1Ej6jKTiinp
	vy7daxvsBfaUrqOT4Su5G68RrPjgoShEVKbkxSyZQondrZPoh5YvNYohwRu1LFvjslxM
	S7qDeDBVScj4d0+IGWBLtuB/kEt4HmSC8RI77Px/V98Ee3F3xIMPZppbes8tG3RJoRrf
	ieVQ==
MIME-Version: 1.0
X-Received: by 10.43.53.199 with SMTP id vr7mr22098554icb.70.1405541967220;
	Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Wed, 16 Jul 2014 13:19:27 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407120436510.28008@localhost>
References: <alpine.LFD.2.11.1407111821080.6262@localhost>
	<CAP9ODKqwOXV+GxNhoPFXJWcjLipD1P176Qcy0bBNMuzF9=Bhng@mail.gmail.com>
	<CAMKF1spgCphqN7PVskjP_bHd2CfsBRi52y=KJ2fWyjwQxw0cYw@mail.gmail.com>
	<alpine.LFD.2.11.1407120436510.28008@localhost>
Date: Wed, 16 Jul 2014 13:19:27 -0700
Message-ID: <CAMKF1soB6boe8Echqswu64ptz2PBh_VWF_8aK5WooPcwMYeyGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] core-image.bbclass: Reformat definition of CORE_IMAGE_BASE_INSTALL
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
X-List-Received-Date: Wed, 16 Jul 2014 20:19:28 -0000
Content-Type: text/plain; charset=UTF-8

On Jul 12, 2014 1:41 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
> On Fri, 11 Jul 2014, Khem Raj wrote:
>
> > On Fri, Jul 11, 2014 at 4:41 PM, Otavio Salvador
> > <otavio@ossystems.com.br> wrote:
> > > Hello,
> > >
> > > +OE-Core
> > >
> > > On Fri, Jul 11, 2014 at 7:23 PM, Robert P. J. Day <
rpjday@crashcourse.ca> wrote:
> > >>
> > >> Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be more
> > >> intuitively obvious.
> > >>
> > >> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > >>
> > >> ---
> > >>
> > >>   compile and run-time tested, building a core-image-minimal for
> > >> qemuarm.
> > >>
> > >> diff --git a/meta/classes/core-image.bbclass
b/meta/classes/core-image.bbclass
> > >> index 1b36cba..d2b9d69 100644
> > >> --- a/meta/classes/core-image.bbclass
> > >> +++ b/meta/classes/core-image.bbclass
> > >> @@ -59,13 +59,11 @@ MACHINE_HWCODECS ??= ""
> > >>  CORE_IMAGE_BASE_INSTALL = '\
> > >>      packagegroup-core-boot \
> > >>      packagegroup-base-extended \
> > >> -    \
> > >> -    ${CORE_IMAGE_EXTRA_INSTALL} \
> > >>      '
> > >>
> > >>  CORE_IMAGE_EXTRA_INSTALL ?= ""
> > >>
> > >> -IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
> > >> +IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}
${CORE_IMAGE_EXTRA_INSTALL}"
> > >
> > > For me, more intuitively would be:
> > >
> > > CORE_IMAGE_BASE_INSTALL ?= ...
> >
> > weak assignment here would mean overridable base install which is
> > not the intention. we want a working base image when inheriting
> > core-image
>
>   except that that argument doesn't really hold water given how one
> can inherit core-image, then (as i pointed out) immediately wipe out
> that supposedly inviolable definition of CORE_IMAGE_BASE_INSTALL by
> simply reassigning to IMAGE_INSTALL.

these classes are provided as basic working blocks. it would be a bad use
case if one were to override basic constructs inside it completely. some
variables are sort of interfaces some are not. besides your change is ok
its just the preset is not. we should start using the constructs as
intended.
>
>   i *like* the idea of a weak assignment to CORE_IMAGE_BASE INSTALL.
> it's effectively what core-image-minimal is doing anyway, it just
> allows you to do it in a way that's not grotesquely ugly.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================

