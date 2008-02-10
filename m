Received: from [209.85.134.186] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JOICr-00069l-4e
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 20:51:17 +0100
Received: by mu-out-0910.google.com with SMTP id w9so3709314mue.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Feb 2008 11:51:31 -0800 (PST)
Received: by 10.78.204.7 with SMTP id b7mr27377639hug.74.1202673090951;
	Sun, 10 Feb 2008 11:51:30 -0800 (PST)
Received: from widy.localdomain ( [78.164.233.103])
	by mx.google.com with ESMTPS id f3sm37684436nfh.15.2008.02.10.11.51.27
	(version=SSLv3 cipher=OTHER); Sun, 10 Feb 2008 11:51:30 -0800 (PST)
Date: Sun, 10 Feb 2008 21:54:34 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080210215434.74ee026a@widy.localdomain>
In-Reply-To: <47AF45CC.3060906@dls.net>
References: <20080129014117.60ed9f77@widy.localdomain>
	<1201565225.4687.98.camel@localhost.localdomain>
	<20080209134850.13fe8d93@widy.localdomain>
	<1202583333.7981.17.camel@dax.rpnet.com>
	<20080210202952.2b510465@widy.localdomain>
	<47AF45CC.3060906@dls.net>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [RFC] Setting default IMAGE_FSTYPES to tar.gz in bitbake.conf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Feb 2008 19:51:17 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 10 Feb 2008 12:43:24 -0600
"Mike (mwester)" <mwester@dls.net> wrote:

> Paul Sokolovsky wrote:
> > Hello,
> >
> > On Sat, 09 Feb 2008 18:55:33 +0000
> > Richard Purdie <rpurdie@rpsys.net> wrote:
> >
> > []
> >
> >   
> >> The DISTRO can override the machine if it wishes now with no
> >> change to OE, that is up to the distros concerned. That doesn't
> >> stop machines from having sane defaults.
> >>
> >>     
> >>> Well, as usual, thoughts aloud. I'm going to add 
> >>> IMAGE_FSTYPES ?= "jffs2" to the machines from your 1st list to get
> >>> matter going.
> >>>       
> >> ok.
> >>
> >>     
> >
> > Done, so are we ready for this patch now?
> >
> >
> > @@ -541,7 +545,7 @@ DL_DIR ?= "${TMPDIR}/downloads" 
> >  ################################################################## 
> >   
> >  DL_DIR ?= "${TMPDIR}/downloads" 
> > -IMAGE_FSTYPES ?= "jffs2" 
> > +IMAGE_FSTYPES ?= "tar.gz" 
> >   
> Why exactly are we simply replacing a jffs2 default with a new
> default? Just to make some other parties happier?  

No, to make sure that probability of someone being unhappy and confused
is minimized. jffs2 is an adhoc, niche format, while tar.gz is
something well known. Getting tar.gz by default could be not exactly
what someone wants, but at least not something completely strange for
some people (consider x86 for example).

> Wouldn't it be
> simply better, if this is such a big deal, to do:
> 
> +IMAGE_FSTYPES ?=
> "you-must-define-an-image-fstype-that-is-suitable-for-you"
> 
> That way we ensure that *nobody* relies on defaults, and everything
> is correctly defined in every case, and if someone fails to define
> it, it should be pretty obvious what they did wrong.

This is exactly the opposite direction to what I'd like to move.
Configuring OE is already beyond capabilities of mere human, so many
people simply can't surpass initial setup curve of it, and other,
trying to help them, invent different adhoc solutions like
meta-makefiles. Our recent discussion exposed the fact that this is
pressing issue understood by many people, yet no good, well-fitting
solution was proposed. In this regard, I'm trying to follow my idea
that OE itself should change, first of all paradigmatically, to let
people use it "out of the box", without "extraordinary" effort required
to setup. For me, that means that OE should be usable immediately
after checkout of bitbake and itself, and adding bitbake to PATH. I've
been having such config for several months, and spooling my changes to
OE now.

So, with this idea, we want to have good, "not insane" defaults for
options, with the idea to offer our users easy learning curve on OE,
starting with it producing something easily visible and recognizable
by default, and then easy steps to tweak setup to get exactly what they
want.

[]
> >>     
> > Mike (mwester)
> >



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


