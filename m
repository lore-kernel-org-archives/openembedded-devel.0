Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GT3gJ-0005dJ-Nk
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 23:44:36 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 5572880105;
	Fri, 29 Sep 2006 07:39:32 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04456-03; Fri, 29 Sep 2006 07:39:30 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 72E5C1E26D;
	Fri, 29 Sep 2006 07:39:30 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 5C73A10F2230; Fri, 29 Sep 2006 07:39:30 +1000 (EST)
Date: Fri, 29 Sep 2006 07:39:30 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060928213929.GA6160@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org,
	Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
References: <E1GStq9-0003dN-FU@linuxtogo.org>
	<20060928132713.GA32288@twibble.org>
	<1159458235.6791.27.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
In-Reply-To: <1159458235.6791.27.camel@gandalf.tm.informatik.uni-frankfurt.de>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev glibc 2.4: Apply recently added	patches only fo x86.
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
X-List-Received-Date: Thu, 28 Sep 2006 21:44:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 28, 2006 at 05:43:55PM +0200, Michael 'Mickey' Lauer wrote:
> Am Donnerstag, den 28.09.2006, 23:27 +1000 schrieb Jamie Lenehan:
> > On Thu, Sep 28, 2006 at 01:14:05PM +0200, "pfalcon commit" wrote:
> > > glibc 2.4: Apply recently added patches only fo x86.
> > > * Fixes breakage on ARM.
> > > * Don't bump PR (previous commit neither did), to save long rebuilds.
> > > Few people affected should use "bitbake glibc -c rebuild".
> > > * Fixes #1443.
> > > * Approved by Michael 'Mickey' Lauer <mickey at tm.informatik.uni-frankfurt de>.
> > 
> > I've tested here and those two patches break glibc 2.4 for my main
> > targets which are sh4 (titan), i486 (wrap) and i586 (epia), building
> > on an x86_64 host. The breakage basically exactly the same as in
> > #1443.
> > 
> > I'm not sure what "x86" problem is that they are meant to fix (look
> > like they are just wiring up syscalls to use in place of glibc equivs
> > for the *at calls), but at least for me they actually break things on
> > i486 and i586.
> 
> 1. patch fixes problem:

Right, but why are you seeing this issue when building for i486 and
I'm not? That's important since these patches break my currently
working builds.

Hmm, maybe it's those new linux-libc-headers that I see went in a few
days ago - they might now be exporting those *at functions when they
weren't before and therefore glibc is now picking them up. I'm still
using the 2.6.15.99 headers. I'll test with those newer ones now.

-- 
 Jamie Lenehan <lenehan@twibble.org>


