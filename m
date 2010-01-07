Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NSq9P-0006uA-Ue
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 12:03:38 +0100
Received: by fg-out-1718.google.com with SMTP id 16so6265836fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 03:01:33 -0800 (PST)
Received: by 10.87.17.20 with SMTP id u20mr8044499fgi.32.1262862092736;
	Thu, 07 Jan 2010 03:01:32 -0800 (PST)
Received: from xora-vm2.xora.org.uk (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 15sm7605815fxm.2.2010.01.07.03.01.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 07 Jan 2010 03:01:31 -0800 (PST)
Received: by xora-vm2.xora.org.uk (Postfix, from userid 500)
	id 42CD321373; Thu,  7 Jan 2010 11:01:17 +0000 (GMT)
Date: Thu, 7 Jan 2010 11:01:01 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100107110101.GD1950@xora-vm2.xora.org.uk>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
	<20100107084341.GB1950@xora-vm2.xora.org.uk>
	<hi4dn8$vig$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hi4dn8$vig$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: dp@xora.org.uk
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
X-List-Received-Date: Thu, 07 Jan 2010 11:03:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2010 at 11:40:39AM +0100, Rolf Leggewie wrote:
> Graeme Gregory wrote:
> > On Wed, Jan 06, 2010 at 11:09:10PM +0100, Rolf Leggewie wrote:
> >> XorA "solved" this in a hackish way with angsstrom.bbclass.
> >>
> > No he didnt and no its not a hack.
> 
> He didn't?  On August 15th last year somebody in #oe with the nick
> XorA|gone claimed he did.
> 
> http://www.hentges.net/irclogs/%23oe/2009/August/20090815_oe.log?lines=500#[20090815%2015:29:59]
> 
> <XorA|gone>: it is in the end why I wrote the generic blacklist code
> 
Any quote out of conext can mean anything :-) But in my conversation and now
the blacklist is to nuke a ${PN} without any consideration of versions or
dependencies. It is not and wasnt meant as a solution to versioned depends.

> and the following sounded rather hackish to me
> 
> <XorA|gone>: beware it gives a crazy python dump if you use it in combo
>              with bitbake -b
> [...]
> <Laibsch>: OK, so not yet ready to be turned by default, he?
> <XorA|gone>: Laibsch: any call to skippackage with bitbake -b does that
> <XorA|gone>: Laibsch: as you rip out the recipe under bitbakes nose
> 
bitbake deals badly when a PN dissapears during its execution as I said
on IRC it occurs also in a number of places where skippackage is called
including using COMPATIBLE_MACHINE. If blackist is hacky so is
COMPATIBLE_MACHINE.

Graeme



