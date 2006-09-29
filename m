Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GT6pL-0005Dr-Bd
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Sep 2006 03:06:08 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id ADD00BA168
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 11:01:02 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12210-07
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 11:01:00 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id C294FBA12C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 11:01:00 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id A3944116A8BD; Fri, 29 Sep 2006 11:01:00 +1000 (EST)
Date: Fri, 29 Sep 2006 11:01:00 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060929010059.GA24744@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GStq9-0003dN-FU@linuxtogo.org>
	<20060928132713.GA32288@twibble.org>
	<1159458235.6791.27.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<20060928213929.GA6160@twibble.org>
	<1159481209.6791.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<20060928233041.GA23432@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20060928233041.GA23432@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev glibc 2.4: Apply recently	added	patches only fo x86.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2006 01:06:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2006 at 09:30:42AM +1000, Jamie Lenehan wrote:
> On Fri, Sep 29, 2006 at 12:06:49AM +0200, Michael 'Mickey' Lauer wrote:
> > Am Freitag, den 29.09.2006, 07:39 +1000 schrieb Jamie Lenehan:
> > > Hmm, maybe it's those new linux-libc-headers that I see went in a few
> > > days ago - they might now be exporting those *at functions when they
> > > weren't before and therefore glibc is now picking them up. I'm still
> > > using the 2.6.15.99 headers. I'll test with those newer ones now.
> > 
> > Right. A couple of days ago, glibc-intermediate stopped building for me
> > wanting linux headers >= 2.6.17. I built the new 2.6.18 kernel-based
> > headers then
> > (which are still DEF_PREF=-1).
[...]
> Now the question is  how to make all these things play nicely
> together...

The upstream fix was different to what's in the bugzilla entry. Using the
following patch (thanks to lfs) in place of openat-bugzilla-fix-1220.patch
and fix-fchownat-20060808.patch seems to get everything working:

  http://www.linuxfromscratch.org/patches/downloads/glibc/glibc-2.4-openat-3.patch

I've tested this with with linux-libc-headers 2.6.15.99 and
linux-libc-headers 2.6.18 for wrap (i486) so far, and in both cases it
completed building glibc-intermediate-2.4.

-- 
 Jamie Lenehan <lenehan@twibble.org>


