Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Nh7Ny-000582-T6
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:17:42 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KXW0006IG8EL1MC@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Feb 2010 14:14:44 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7867C14AF60; Mon,
	15 Feb 2010 15:14:38 -0500 (EST)
Date: Mon, 15 Feb 2010 15:14:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100215201438.GB14442@denix.org>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<20100211090437.GA17089@denix.org> <20100213120820.GH10632@mx.loc>
MIME-version: 1.0
In-reply-to: <20100213120820.GH10632@mx.loc>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.11
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 07/12] Document proxy setup in local.conf.sample
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
X-List-Received-Date: Mon, 15 Feb 2010 20:17:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Feb 13, 2010 at 01:08:20PM +0100, Bernhard Reutner-Fischer wrote:
> On Thu, Feb 11, 2010 at 04:04:37AM -0500, Denys Dmytriyenko wrote:
> >On Mon, Feb 08, 2010 at 10:14:28PM +0100, Bernhard Reutner-Fischer wrote:
> >> diff --git a/conf/local.conf.sample b/conf/local.conf.sample
> >> index 643ae0b..e7c4559 100644
> >> --- a/conf/local.conf.sample
> >> +++ b/conf/local.conf.sample
> >> @@ -30,6 +30,9 @@ BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"
> >>  # This is a regulary expression, so be sure to get your parenthesis balanced.
> >>  BBMASK = ""
> >>  
> >> +# Proxy settings:
> >> +# BB_ENV_EXTRAWHITE="http_proxy ftp_proxy no_proxy"
> >
> >I'm sorry to inform you, but that won't work with the standard bitbake! Which 
> >uses own HTTP_PROXY, FTP_PROXY, HTTP_PROXY_IGNORE and FTP_PROXY_IGNORE vars.
> >
> >I tried to persuade RP to change that back to standard http_proxy, ftp_proxy 
> >and no_proxy to no avail[1].
> >
> >Because of that I had to keep my own version of bitbake[2] with the necessary 
> >patches for my users - check the top 4 patches in that tree. Although, 
> >GIT_PROXY_COMMAND one is already in the bitbake master...
> >
> >And looks like Khem has already pushed the above change though...
> 
> drats, you're right. I was erroneously checking against a patched bitbake.
> 
> khem, i'm very sorry for my sloppiness! Please
> revert 3f602f72f0936ef773aa4767636d41bb82ecf3b0 :

Reverted.

> ---8<---
> Unfortunately bitbake master allegedly uses the non-standard
> {HT,F}TP_PROXY{,_IGNORE} config variables instead of the established
> http_proxy, ftp_proxy, no_proxy environment variables.
> ---8<---
> lynx has a good description for these, and especially a sane rule
> for no_proxy (with domain.tld:port csv entries) which works very well
> for me in practise, FYI.
> http://lynx.isc.org/lynx2.8.5/lynx2-8-5/lynx_help/keystrokes/environments.html#proxy
> 
> Sorry for the wrong patch and thanks, Denys, for mentioning this!
> >
> >[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/19716
> >[2] http://arago-project.org/git/?p=arago-bitbake.git;a=shortlog;h=refs/heads/next

-- 
Denys


