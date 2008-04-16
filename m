Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1Jm4A9-00077Q-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Apr 2008 11:42:45 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 99772838FA; Wed, 16 Apr 2008 11:42:40 +0200 (CEST)
Date: Wed, 16 Apr 2008 11:42:40 +0200
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080416094240.GA15886@deadlock.dhs.org>
References: <20080415122902.GA13726@deadlock.dhs.org>
	<4804D346.50809@gmail.com>
	<20080415163930.GA14446@deadlock.dhs.org>
	<19c1b8a90804150947y484520a2j726123713ff216fa@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90804150947y484520a2j726123713ff216fa@mail.gmail.com>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: How to properly enforce an ARM OABI build?
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
X-List-Received-Date: Wed, 16 Apr 2008 09:42:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 15, 2008 at 09:47:35AM -0700, Khem Raj wrote:
> you can also try to comment out
> 
> ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in
> ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
> 
> and check

tried this without any luck, but then it struck me - someone was rewriting my
TARGET_OS! 

this someone is angstrom-uclibc.inc:

TARGET_OS_UC = "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
TARGET_OS = "${@['${TARGET_OS_UC}', 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"

So I tried to set TARGET_OS to "linux-uclibc" in my local.conf and I 
commented out the lines in  angstrom-uclibc.inc - and it worked.

The question now is - how could this be solved cleanly in Angstrom?

Would this be an option:
TARGET_OS ?= "${@['${TARGET_OS_UC}', 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"

Kind regards,
Jin

> 
> On Tue, Apr 15, 2008 at 9:39 AM, Sergey 'Jin' Bostandzhyan
> <jin@mediatomb.cc> wrote:
> > On Tue, Apr 15, 2008 at 09:09:42AM -0700, Khem Raj wrote:
> >  > > MACHINE="armv4t"
> >  > > DISTRO="angstrom-2007.1"
> >  > > TARGET_OS :="linux"
> >  > > ARM_ABI := "oabi"
> >  >
> >  > may be use '=' instead of ':='
> >
> >  I did try that before trying := but there was no difference...
> >
> >
> >
> >
> >
> >  _______________________________________________
> >  Openembedded-devel mailing list
> >  Openembedded-devel@lists.openembedded.org
> >  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


