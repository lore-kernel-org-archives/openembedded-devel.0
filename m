Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NiA0Y-00040E-Q2 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 18:17:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni9xx-0000nS-Mo for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 18:15:05 +0100
Received: from 66.55.57.157 ([66.55.57.157])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 18:15:05 +0100
Received: from ben by 66.55.57.157 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 18:15:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Ben Udall <ben@ontargetenterprises.com>
Date: Thu, 18 Feb 2010 17:10:52 +0000 (UTC)
Message-ID: <loom.20100218T175943-125@post.gmane.org>
References: <4B73FC24.9060807@theforce.com.au> <hl12qo$meo$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 66.55.57.157 (Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: omap3-desktop-image fails baking 'news'
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
X-List-Received-Date: Thu, 18 Feb 2010 17:17:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi <k.kooi <at> student.utwente.nl> writes:

> 
> 
> On 11-02-10 13:46, Grahame Jordan wrote:
> > Hi,
> > 
> > After git pull I could not build e17/news on Ubuntu 9.04
> > Found this on:
> > http://old.nabble.com/omap3-desktop-image-fails-baking-'news'-td27323561.html
> > 
> > applied changes and it now compiles OK.
> 
> Since this is caused by skipping out autopoint, wouldn't it be better to
> run autopoint instead of patching stuff?
> 
> regards,
> 
> Koen
> 

I'm having the same issue building omap3-desktop-image and followed the same
instructions that Grahame did, which did allow it to compile.

It looks like you're saying there's a better way to solve this with autopoint,
however, not being very familiar with the tools here I'm not sure what the right
way to implement this is.

Making a guess that the sed commands in the do_configure_prepend portion of the
recipe were trying to work around the lack of autopoint, I pulled them out and
replaced them with autopoint.

do_configure_prepend() {
    autopoint
}

This seems to work as news now builds without error.  However, I'm unsure if
this was the right way to go about it and if there might be some unintended side
effects.

-Ben Udall



