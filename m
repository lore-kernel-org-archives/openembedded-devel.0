Received: from [63.240.77.84] (helo=sccrmhc14.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HCkfl-0003Wj-AS
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Feb 2007 23:44:53 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net?[68.57.212.205])
	by comcast.net (sccrmhc14) with ESMTP
	id <2007020122445201400s172le>; Thu, 1 Feb 2007 22:44:52 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 1F87F3893; Thu,  1 Feb 2007 17:48:27 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1170370106.14763@gatekeeper.stellarwerx.com>
In-Reply-To: <45C2548A.2050801@whitby.id.au>
Date: Thu, 01 Feb 2007 17:48:26 -0500 (EST)
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 01 Feb 2007 22:44:53 -0000
Content-Type: multipart/mixed; boundary="bound1170370106"

--bound1170370106
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote ..
> Mark Gollahon wrote:
> > I am trying to bring up OE on a new IXP4XX-based machine and having a
> > little trouble with the "proper" way to do it.  For example, I
> > created a whole new machine config, inserting what I think should be
> > machine-specific settings, and importing the (now somewhat-defunct)
> > ixp4xx.conf configuration (and later the ixp4xxbe.conf
> > configuration).  My bootstrap-image gets everything compiled, but
> > when it goes to build the rootfs, ipkg fails looking for task-base.
> > 
> > My question is not so much about getting ipkg to work (I have found
> > several ways), but more about the "proper" way so that I don't go
> > "spinning into the grass" in the future.  I noticed that during the
> > rootfs build that the "ixp4xxbe" "arch" was not in the ipkg config
> > file, so all of my "*_ixp4xxbe.ipk" files were completely ignored -
> > stuff like "task-base"!  I ultimately had to append "armv5te" and
> > "ixp4xxbe" to PACKAGE_EXTRA_ARCHS and that worked, but I worked on
> > this on-and-off for over a week to figure it out.  I really don't
> > want to do that again when/if I try to bring up another machine.
> 
> That was a bug in the newly rewritten ixp4xx conf which I believe is now
> fixed.

Great!  When was the diff applied?  I'd like to get it.

> > My question is - should I even be attempting to define a new machine
> > and including ixp4xxbe.conf in it?  Should I define my own machine by
> > copying the contents of ixp4xxbe.conf?  Should I have specified the
> > "ixp4xxbe" machine file in my local.conf along with the extra (what I
> > think should be) machine config?  Or should I define my own distro
> > and put that machine config there?  What is the most appropriate way
> > to do this?
> 
> Is there anything specific which means that you can't just use the
> ixp4xxbe.conf as it is?

Right now its not much more than a bunch of MACHINE_EXTRA_RDEPENDS and
MACHINE_EXTRA_RRECOMMENDS settings thanks to your changes.  However, there
is an embedded four-port eth switch chip in the box.  Since the
manufacturer had to patch a number of areas in the Intel drivers to get it
to work originally, I am expecting to have to do the same with the GPL
ixp4xx eth drivers.  That would mean kernel patches, which would probably
mean its own kernel .bb, etc.  From what I've seen of OE, it seems easier
to support a new machine .conf along with its own kernel .bb than trying
to shim a new kernel config in an old machine .conf (oh, BTW, to build for
*this machine*, you have to use *that machine's* .conf file, but make
PREFERRED_PROVIDER_virtual/kernel be *this*).  Newbies are already 
overwhelmed by OE's sheer configurability, throwing yet another exception
in on this just doesn't seem right to me.

> I'm willing to work with you to get this right.

I know - thank you.  I just wish I had discovered what was the issue with
building the root filesys image before now....

Regards,
-Mark Gollahon

--bound1170370106--
