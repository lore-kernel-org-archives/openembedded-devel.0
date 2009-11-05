Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N5u1p-0007Ug-0j
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 05:33:00 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSM004GMCKVAXIE@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Nov 2009 22:31:43 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 16FD514AF60; Wed,
	04 Nov 2009 23:31:43 -0500 (EST)
Date: Wed, 04 Nov 2009 23:31:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091105043143.GA30116@denix.org>
References: <4AEDB624.3030607@balister.org>
	<1257202693.10804.54.camel@dax.rpnet.com>
	<19c1b8a90911041641w4b7397d3o8a96853600d0cb4e@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <19c1b8a90911041641w4b7397d3o8a96853600d0cb4e@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM next weekend
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
X-List-Received-Date: Thu, 05 Nov 2009 04:33:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 04, 2009 at 04:41:29PM -0800, Khem Raj wrote:
> On Mon, Nov 2, 2009 at 2:58 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Sun, 2009-11-01 at 11:24 -0500, Philip Balister wrote:
> >> This has been mentioned here before, but I want to remind people that
> >> OEDEM (Openembedded Developers European Meeting) is next weekend in
> >> Cambridge, UK. There is a information and an agenda at:
> >>
> >> http://wiki.openembedded.net/index.php/Oedem/2009
> >>
> >> Note that registration is closed, but you can talk to Phil in case there
> >> are last minute dropouts.
> >>
> >> If you can't make it, but have any ideas or comments, please talk to one
> >> of the attendees or send us in email so we can collect everyones ideas.
> >
> > I'd like to second this. If you can't be there but want a viewpoint
> > represented, please do talk to the attendees.
> >
> > I just added "BitBake Future Roadmap" and "OE Core Changes" to the
> > agenda and will happily takes ideas on those topics if anyone has any
> > proposals.
> >
> > Are there any topics anyone feels are missing from the agenda?
> 
> Support for plugging external toolchains

I started a somewhat generic framework for plugging different external 
toolchains - it uses some pieces and ideas from Poky, at this point is 
Angstrom specific and been tested mostly with CodeSourcery and very little 
with MontaVista Pro5. This framework comes from Arago, where the use of 
external toolchain is a default setup. And most of it was merged few weeks 
ago into Angstrom. I would be glad to work on taking it even further...

> Using SDK for building OE instead of internal toolchains.

AFAIK, the generic external-toolchain.bb recipe is specifically for this 
purpose and seems to work fine. What is missing - is a standard official 
pre-built SDK (per distro?) available for download. A la Poky SDK...

-- 
Denys


