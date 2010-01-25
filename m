Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NZEEU-0004M9-NW
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 02:59:17 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWS002PN5ECF291@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 19:56:44 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1C83814AF60; Sun,
	24 Jan 2010 20:56:36 -0500 (EST)
Date: Sun, 24 Jan 2010 20:56:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100125015636.GA9855@denix.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100124070602.GA8642@denix.org> <hjh7f3$6v0$2@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <hjh7f3$6v0$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
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
X-List-Received-Date: Mon, 25 Jan 2010 01:59:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jan 24, 2010 at 11:29:56AM +0100, Koen Kooi wrote:
> On 24-01-10 08:06, Denys Dmytriyenko wrote:
> > On Sat, Jan 23, 2010 at 09:06:13PM +0100, Paul Menzel wrote:
> >> does [1] still describe the official policy to add checksums? Or is
> > 
> > No
> > 
> >> putting them into the recipes preferred nowadays?
> > 
> > Yes
> 
> I think not! The new format:
> 
> * is not documented

I think there were plenty of emails describing the new format. Need to put it 
all in a Wiki page, agree.

> * it has no tools to autogenerate it

Give me few minutes - I'll send something to address this point.

> * has not been agreed on in any way.

Actually, specifying checksums in corresponding recipes was agreed on during 
the OEDEM in November. Using additional variable flags in base.bbclass was 
added by Phil, since bitbake cannot handle SHA256 sums in SRC_URI. Although, 
Richard mentioned he'd like to get it implemented in bitbake at some point:
http://thread.gmane.org/gmane.comp.sysutils.bitbake.devel/1089/focus=1115

> As an experiment I tried to use it for a branch at work and I
> *absolutely* hate the workflow needed for the new format.

You should have warned me! :) I thought you completely switched to the new 
method and liked it... :)

-- 
Denys


