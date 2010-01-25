Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NZKaJ-0000iw-Ij
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:46:14 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWS00IP4O8SR8D0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	25 Jan 2010 02:43:40 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3B8B414AF60; Mon,
	25 Jan 2010 03:43:40 -0500 (EST)
Date: Mon, 25 Jan 2010 03:43:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100125084340.GA18489@denix.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
	<20100125015636.GA9855@denix.org> <hjjk5q$rmc$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <hjjk5q$rmc$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Mon, 25 Jan 2010 08:46:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 25, 2010 at 09:19:07AM +0100, Koen Kooi wrote:
> >> * it has no tools to autogenerate it
> > 
> > Give me few minutes - I'll send something to address this point.

Do you have any feedback on the patch I sent? Does it make things any better?

> >> * has not been agreed on in any way.
> > 
> > Actually, specifying checksums in corresponding recipes was agreed on during 
> > the OEDEM in November. Using additional variable flags in base.bbclass was 
> > added by Phil, since bitbake cannot handle SHA256 sums in SRC_URI. Although, 
> > Richard mentioned he'd like to get it implemented in bitbake at some point:
> > http://thread.gmane.org/gmane.comp.sysutils.bitbake.devel/1089/focus=1115
> 
> Ah yes, stuff agreed at OEDEM, I see. I also remember that nearly
> everything that was 'agreed' there got dis-agreed on the mailinglist here.
> And I also remember that I said that to be consistent sane-srcrevs
> should cease to exist as well :)

This way we won't get anywhere... :) I thought (maybe I'm wrong) everybody 
agrees at least with the fact that central checksums.ini is not the best 
approach. Keeping checksums in the metadata inside SRC_URI seemed like a 
viable solution. Are there any fundamental flaws with this method, besides 
lacking some tools?
BTW, I agree with you on the sane-srcrevs topic, if it's any consolation... :)

-- 
Denys


