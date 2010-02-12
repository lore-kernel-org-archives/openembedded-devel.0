Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ng05G-00006y-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 19:17:46 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXQ00FMWQOIFCS3@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Feb 2010 12:14:47 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0F04614AF60; Fri,
	12 Feb 2010 13:14:42 -0500 (EST)
Date: Fri, 12 Feb 2010 13:14:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100212181441.GA27392@denix.org>
References: <4B75781F.4000202@cbnco.com> <hl4148$3v3$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <hl4148$3v3$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] package.bbclass and aggressive library stripping
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
X-List-Received-Date: Fri, 12 Feb 2010 18:17:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 12, 2010 at 05:54:34PM +0100, Koen Kooi wrote:
> On 12-02-10 16:47, Josh Mahonin wrote:
> > Hi all,
> > 
> > I was attempting to use GDB on an OE build, but was given various
> > warnings about threads being disabled.  I've traced the problem to
> > package.bbclass stripping out necessary symbols in 'libpthread.so.0',
> > referenced as section 6 in http://sourceware.org/gdb/wiki/FAQ
> > 
> > I'm admittedly using an out of date OE checkout, but the problem still
> > appears to be present in trunk as well.  Is it better to create a
> > special case in package.bbclass just for libpthread, or should a
> > blacklist be created for other potentially affected libraries as well?
> 
> Installed the appropriate -dbg package works for me

In other words - all the debug symbols are in the corresponding -dbg packages. 
The main packages are stripped to save space on the target - so there is no 
real need to do separate release/debug builds.

-- 
Denys


