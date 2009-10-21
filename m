Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N0ZBO-00012A-5K
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 13:16:49 +0200
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N0ZAB-0000t6-UK
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 07:15:32 -0400
Date: Wed, 21 Oct 2009 07:15:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@openembedded.org
In-Reply-To: <200910211303.49278.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0910210713370.4617@localhost>
References: <hbmose$gtv$1@ger.gmane.org>
	<200910211303.49278.holger+oe@freyther.de>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SCM fetched recipes without a SRCREV - e.g. libgee-native
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
X-List-Received-Date: Wed, 21 Oct 2009 11:16:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 21 Oct 2009, Holger Hans Peter Freyther wrote:

> On Wednesday 21 October 2009 12:47:41 Koen Kooi wrote:
> > Hi,
> >
> > Lately some people have started adding recipes that fetch from an SCM
> > without adding a srcrev either to the recipe or to sane-srcrevs.inc.
> > That is bad. Unacceptable even.
>
> I agree, It must be possible to do
>
> 1.) bitbake -cfetchall task
>
> then remove network and
>
> 2.) bitbake task...
>
> if that is not the case we suck.

  *yes*, that's what i'd forgotten.  i'd tried just

  $ bitbake -c fetch ...

but after i started a bitbake, there was still some downloading.  so
how much extra work does "fetchall" do as a command as opposed to
just "fetch"?  thanks.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


