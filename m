Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hu8Yt-0008Fo-2S
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2007 16:57:07 +0200
Received: by wa-out-1112.google.com with SMTP id l24so641494waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2007 07:55:14 -0700 (PDT)
Received: by 10.115.107.1 with SMTP id j1mr1881697wam.1180709714179;
	Fri, 01 Jun 2007 07:55:14 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Fri, 1 Jun 2007 07:55:14 -0700 (PDT)
Message-ID: <432beae0706010755m47a91208obc66cc688a6f6f90@mail.gmail.com>
Date: Fri, 1 Jun 2007 07:55:14 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1180705209.6390.39.camel@localhost.localdomain>
MIME-Version: 1.0
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<1180705209.6390.39.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Fri, 01 Jun 2007 14:57:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/1/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2007-05-30 at 19:42 -0300, Rodrigo Vivi wrote:
> > Some days ago I was using the bitbake1.6 to build my packages and it
> > was working fine, but someday without any apparently reason it stopped
> > to work.
> >
> > Then, after a big looser fight I've decided to change to bitbake1.8
> > and the problem was apparently solved... I was seeing the packages
> > being build...
> > But in the end, for my surprise, I've noticed that a lot of depends
> > wasn't build!
> >
> > Since my task file is not under official repository yet I'm sending in
> > this email.
> >
> > Does any body have any idea?
>
> I was puzzled by this when I first read it as I didn't understand the
> problem. If people explain problems clearly, you're more likely to get
> answers...
>
> Based on this in irc:
>
> 13:14:36] <koen> vivijim: it looks like the problem florian had, RP had
> a patch for it iirc
> [13:14:56] <koen> something to force do_package_write to run when
> building tasks
> [13:15:06] <vivijim> when I use bitbake bash it calls every function
> including do_package_write but when I use bitbake task-mamona it call
> do_package but not do_package_write...
>
> I think I realise the problem - wrong expectations of task-mamona.
>
> A task package's sole purpose is to build a set of packages with
> appropriate dependencies.
>
> A meta package causes all its sub package to build. Have a look at some
> of the meta-*.bb files and create a meta-mamona.bb, probably inheriting
> meta.bbclass. You can always have the meta package refer to the task
> package.
>

In the spirit of giving users more info, I've noticed that lately
OE/bitbake will compile all of the packages and only start the
do_package_write once almost everything is built, before the image I'm
targeting gets built.

I've figured out that this is due to dependency handling as what
depends on the packages being written to disk is the creation of the
image, which installs from those packages. The packaging also seems to
happen if I directly bitbake a provider. It seems somewhat strange
that bitbaking something which depends on something else doesn't cause
the dependency to create its package...

-- 
Justin Patrin


