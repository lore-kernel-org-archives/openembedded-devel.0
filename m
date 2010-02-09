Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NewQ2-0001Fl-RD
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 21:10:49 +0100
Received: by fxm25 with SMTP id 25so6274564fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 12:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=VxNUqxNLaP/ms6ZkhGiaCyDixywHFtAyrmNFPwKnJ5g=;
	b=VEH9vSoneFZRZvxv9+OmRuDCI3Sfg2f+emp44eJ3D50C5JtpcMy5aIc8R1/hFYnK5n
	qdt+nhINtrGx/C8jI95m3SMJtVw2Rql8pwSxxYmk1+GT6ePmhjTEEApplxpLT7kXx9f1
	Pe02RnW8oeKe8+VJLkOu22XTzHrH+DYZLMtf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=SUWe/5zI9VrJrOzAQK6PheX1a//fbzcVpgMIwPQrhwFYnDyx2wYwYDiVPoaVa9VuMC
	mLgo99JuQEe+GnFfnYB6gIy/nuPeQ9Lb5J8CTIYxbyy5AVuHr3QtMawM6yxuXWiZYu5n
	Bvyu2HIjNuy2CCjoE0t7fUeP9Y+dDW9YyU7w8=
Received: by 10.86.6.23 with SMTP id 23mr1152367fgf.16.1265746093931;
	Tue, 09 Feb 2010 12:08:13 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 12sm7763339fgg.12.2010.02.09.12.08.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Feb 2010 12:08:12 -0800 (PST)
Date: Tue, 9 Feb 2010 12:08:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209200804.GA3142@gmail.com>
References: <1265247822-20734-1-git-send-email-denis@denix.org>
	<1265302671.25338.57.camel@conroy-linux>
	<20100204172234.GA5641@denix.org>
	<1265306225.26642.3.camel@trini-m4400>
	<1265461459.5019.20.camel@lenovo.internal.reciva.com>
	<1265655603.16517.13.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1265655603.16517.13.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] meta-toolchain: make SDK relocatable by using $SDK_PATH var in env setup script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2010 20:10:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (08/02/10 12:00), Tom Rini wrote:
> On Sat, 2010-02-06 at 13:04 +0000, Phil Blundell wrote:
> > On Thu, 2010-02-04 at 11:57 -0600, Tom Rini wrote:
> > > On Thu, 2010-02-04 at 12:22 -0500, Denys Dmytriyenko wrote:
> > > > On Thu, Feb 04, 2010 at 11:57:51AM -0500, Chris Conroy wrote:
> > > > > Does this really make the SDK relocatable? I thought there were still
> > > > > major issues with relocating GCC.
> > > > 
> > > > GCC built from OE may still have relocation problems - haven't checked lately.
> > > > But it doesn't mean that's the only use case scenario... There is also 
> > > > external toolchain option, as well as building SDK without the toolchain.
> > > > Both of those cases were tested with the above change for several months now.
> > > 
> > > The hard part is that in some distributions you will have libmpfr.so &
> > > co if you have a host gcc, and on some you won't.  That in turn makes
> > > gcc relocatable or not.  Everything else is handleable via --sysroot=.
> > 
> > What exactly is the problem with libmpfr?  I would have thought you
> > could just ship libmpfr.so.6 inside the sysroot and link gcc against
> > that local copy (via -rpath $ORIGIN...), without using the system
> > library at all.
> 
> I hesitate to say this, since I haven't fully poked the other side of
> the equation, but..  With $ORIGIN, you need I think 3 levels of
> checking-back since cc1 (& others) need libmpfr.  That, mixed with just
> how ugly the $ORIGIN stuff gets for gcc, is the problem.  Why you don't
> always see the problem is that Ubuntu uses libmpfr.so for its gcc,
> RHEL4Usomething (half I haven't checked into personally and so hesitate)
> seems to not.
> 
> For gcc-cross-sdk, this isn't so much of an issue.  For gcc-cross and
> $ORIGIN it gets ugly, but solvable.

I think the prerequisites of gcc libmpfr, libgmp and libmpc from 4.5
onwards are probably not used by 
any other tools we stage for host so it would be safer to build them inside
gcc tree and link in statically and only create runtime deps on the
libraries that always exist like libc. This will have better chance of
relocation. We just need to untar these libraries in top of gcc src tree
and it will use cofigure and use it. But this only solves gcc issue 
for other host/cross packages which depend upon libs from staging we still
need a solution. 

-Khem


> 
> -- 
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


