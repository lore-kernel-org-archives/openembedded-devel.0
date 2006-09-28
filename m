Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GT5Pv-0007wz-Nv
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Sep 2006 01:35:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 69451AB0AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 09:30:44 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09343-03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 09:30:42 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id A0FDEAB0AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Sep 2006 09:30:42 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 877E31141DF6; Fri, 29 Sep 2006 09:30:42 +1000 (EST)
Date: Fri, 29 Sep 2006 09:30:42 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060928233041.GA23432@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GStq9-0003dN-FU@linuxtogo.org>
	<20060928132713.GA32288@twibble.org>
	<1159458235.6791.27.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<20060928213929.GA6160@twibble.org>
	<1159481209.6791.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
In-Reply-To: <1159481209.6791.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
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
X-List-Received-Date: Thu, 28 Sep 2006 23:35:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2006 at 12:06:49AM +0200, Michael 'Mickey' Lauer wrote:
> Am Freitag, den 29.09.2006, 07:39 +1000 schrieb Jamie Lenehan:
> > Hmm, maybe it's those new linux-libc-headers that I see went in a few
> > days ago - they might now be exporting those *at functions when they
> > weren't before and therefore glibc is now picking them up. I'm still
> > using the 2.6.15.99 headers. I'll test with those newer ones now.
> 
> Right. A couple of days ago, glibc-intermediate stopped building for me
> wanting linux headers >= 2.6.17. I built the new 2.6.18 kernel-based
> headers then
> (which are still DEF_PREF=-1).

I've been building for for MACHINE=wrap (which is i486) with
linux-libc-headers 2.6.15.99 and everything is fine. If I change to
MACHINE=x86 (which is also i486), without changing anything else (ie,
still using linux-libc-headers 2.6.15.99), then it fails with the
"checking for kernel header at least 2.6.17" error.

If I change the OLDEST_KERNEL = "2.6.17" in machine/x86.conf to
OLDEST_KERNEL = "2.6.15" (still using linux-libc-headers 2.6.15.99)
then x86 works fine as well.

So it looks like with linux-libc-headers 2.6.15.99 (or earlier)
things are fine, but with linux-libc-headers 2.6.18 things break
unless you have those *at patches. And this is regardless of what
target you are building for.

Now the question is  how to make all these things play nicely
together...

-- 
 Jamie Lenehan <lenehan@twibble.org>


