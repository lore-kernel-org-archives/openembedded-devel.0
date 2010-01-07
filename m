Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NSppf-0003aC-E0 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 11:43:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NSpnf-0006IA-7E
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 11:41:07 +0100
Received: from p5b3b29e4.dip.t-dialin.net ([91.59.41.228])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 11:41:07 +0100
Received: from no2spam by p5b3b29e4.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 11:41:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 07 Jan 2010 11:40:39 +0100
Message-ID: <hi4dn8$vig$1@ger.gmane.org>
References: <201001060507.31754.holger+oe@freyther.de>	<hi31m7$hc3$1@ger.gmane.org>
	<20100107084341.GB1950@xora-vm2.xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b29e4.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <20100107084341.GB1950@xora-vm2.xora.org.uk>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 10:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
>> XorA "solved" this in a hackish way with angsstrom.bbclass.
>>
> No he didnt and no its not a hack.

He didn't?  On August 15th last year somebody in #oe with the nick
XorA|gone claimed he did.

http://www.hentges.net/irclogs/%23oe/2009/August/20090815_oe.log?lines=500#[20090815%2015:29:59]

<XorA|gone>: it is in the end why I wrote the generic blacklist code

and the following sounded rather hackish to me

<XorA|gone>: beware it gives a crazy python dump if you use it in combo
             with bitbake -b
[...]
<Laibsch>: OK, so not yet ready to be turned by default, he?
<XorA|gone>: Laibsch: any call to skippackage with bitbake -b does that
<XorA|gone>: Laibsch: as you rip out the recipe under bitbakes nose

As I said during that IRC chat I am of the opinion that OE needs a way
to specify tuples of for example PN/PV/DISTRO/MACHINE and maybe even the
version of gcc/binutils used that bitbake should not consider in the
task queue.  If the approach taken by angstrom.bbclass provides a proper
solution here it should be turned on by default. Comments welcome.  If
we had something like this in place I see a chance to resurrect "bitbake
world" and that would help a lot with QA (not saying that everybody
needs to build world all the time, but it would provide a good test).



