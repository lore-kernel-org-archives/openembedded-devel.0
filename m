Received: from [216.148.227.152] (helo=rwcrmhc12.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HCoMB-0002re-SH
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Feb 2007 03:41:49 +0100
Received: from rwcrmwc098.ops.asp.att.net
	(rwcrmwc098.asp.att.net[204.127.196.148](misconfigured sender))
	by comcast.net (rwcrmhc12) with SMTP
	id <20070202024051m12001qr0me>; Fri, 2 Feb 2007 02:40:51 +0000
X-BLTSYMAVREINSERT: GrONpCbCKkVb3ToA0nriZmAgV3UA
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (rwcrmhc15) with ESMTP
	id <20070202023608m1500oei90e>; Fri, 2 Feb 2007 02:36:08 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 5025A3893; Thu,  1 Feb 2007 21:40:25 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 192.168.253.203
X-Mailer: Usermin 1.230
Message-Id: <1170384018.15409@gatekeeper.stellarwerx.com>
In-Reply-To: <45C27C89.2040300@whitby.id.au>
Date: Thu, 01 Feb 2007 21:40:20 -0500 (EST)
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: New IXP4XX-based Machine
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Feb 2007 02:41:49 -0000
Content-Type: multipart/mixed; boundary="bound1170384020"

--bound1170384020
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote ..
> Mark Gollahon wrote:
> > Rod Whitby wrote ..
> >> That was a bug in the newly rewritten ixp4xx conf which I
> >> believe is now fixed.
> > 
> > Great!  When was the diff applied?  I'd like to get it.
> 
> Probably on Sunday:
> Commit by rwhitby on org.oe.dev :: r0e933978... / (26 files in 10 dirs):
> ixp4xx-related files: Replaced IXP4XX_MACHINE_ENDIAN with
> SITEINFO_ENDIANESS throughout OE, removing all instances of
> ixp4xx-specific ENDIAN checks in the OE metadata.
> 
> > Right now its not much more than a bunch of MACHINE_EXTRA_RDEPENDS and
> > MACHINE_EXTRA_RRECOMMENDS settings thanks to your changes.  However,
> there
> > is an embedded four-port eth switch chip in the box.  Since the
> > manufacturer had to patch a number of areas in the Intel drivers to get
> it
> > to work originally, I am expecting to have to do the same with the GPL
> > ixp4xx eth drivers.  That would mean kernel patches, which would probably
> > mean its own kernel .bb, etc.
> 
> Actually, it would be good for you to talk to the GPL ethernet driver
> author, and get those patches upstream.

I will once I've determined that patches are necessary.  I'm really hoping they aren't - but I'm not "holding my breath"....

> > From what I've seen of OE, it seems easier
> > to support a new machine .conf along with its own kernel .bb than trying
> > to shim a new kernel config in an old machine .conf (oh, BTW, to build
> for
> > *this machine*, you have to use *that machine's* .conf file, but make
> > PREFERRED_PROVIDER_virtual/kernel be *this*).  Newbies are already 
> > overwhelmed by OE's sheer configurability, throwing yet another exception
> > in on this just doesn't seem right to me.
> 
> Agreed.  What's the machine?  Got any internal photos ;-)

It is an Arlotto SG205.  They also have an SG305, but I don't have access to that machine or know its contents.  However if the mainboard is any indication, its got at least a mini-pci slot more than the SG205.  I'm sending pics along with this message.  Hope you don't mind the megabyte pics.  Figured it would give you a better look that way.

> >> I'm willing to work with you to get this right.
> > 
> > I know - thank you.  I just wish I had discovered what was the issue
> with
> > building the root filesys image before now....
> 
> Let's work together, and make sure that ixp4xx{be,le}.conf are files
> that can be used for (included in) a number of such machine configurations.

Sounds good to me!

Regards,
-Mark Gollahon

--bound1170384020--
