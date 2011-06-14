Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QWZOA-0007Rm-6j
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 21:35:02 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMS00MSFOW51AJ5@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Jun 2011 14:31:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4395914AF5D; Tue,
	14 Jun 2011 15:31:17 -0400 (EDT)
Date: Tue, 14 Jun 2011 15:31:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110614193117.GD1324@denix.org>
References: <4DF6DBCE.7010404@gmail.com> <it731q$utn$1@dough.gmane.org>
	<20110614153843.GB1324@denix.org> <it7vpr$n45$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <it7vpr$n45$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] ti-dsplink: Fixed location of toolchain
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
X-List-Received-Date: Tue, 14 Jun 2011 19:35:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 14, 2011 at 05:47:07PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 14-06-11 17:38, Denys Dmytriyenko wrote:
> > On Tue, Jun 14, 2011 at 09:36:26AM +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 14-06-11 05:55, Joel A Fernandes wrote:
> >>> ti-dsplink: Fixed location of toolchain to build ti-dsplink.
> >>
> >> It sadly really needs an absolute path to the tools :(
> > 
> > So, what was this patch trying to fix anyway? Is there something broken?
> 
> Using an external toolchain without your import magic and then
> overriding TOOLCHAINPATH in local.conf is broken. You might call it
> broken by design :)

As you know, the design is hindered by requirements, so ease up! :)

As of the "import magic" - there is nothing magical about it, it just sets up 
TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH automatically. Otherwise you'd have to 
set at least TOOLCHAIN_PATH manually and it works. So, I still don't see what 
exactly is broken and needs to be fixed.

BTW, the requirements for absolute toolchain path come from dsplink and not 
the external toolchain, AFAICR...

-- 
Denys


