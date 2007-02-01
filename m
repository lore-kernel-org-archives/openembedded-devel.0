Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HCj19-0007n1-5k
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Feb 2007 21:58:51 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 292819E127
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2007 15:58:50 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Thu, 01 Feb 2007 15:58:50 -0500
X-Sasl-enc: r2S4fHef6TW+I1uD7NH0vSn0brPduA/LwoAbtejoG3gx 1170363529
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 4047C106C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2007 15:58:48 -0500 (EST)
Message-ID: <45C2548A.2050801@whitby.id.au>
Date: Fri, 02 Feb 2007 07:28:50 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1170281735.26425@gatekeeper.stellarwerx.com>
In-Reply-To: <1170281735.26425@gatekeeper.stellarwerx.com>
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
X-List-Received-Date: Thu, 01 Feb 2007 20:58:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mark Gollahon wrote:
> I am trying to bring up OE on a new IXP4XX-based machine and having a
> little trouble with the "proper" way to do it.  For example, I
> created a whole new machine config, inserting what I think should be
> machine-specific settings, and importing the (now somewhat-defunct)
> ixp4xx.conf configuration (and later the ixp4xxbe.conf
> configuration).  My bootstrap-image gets everything compiled, but
> when it goes to build the rootfs, ipkg fails looking for task-base.
> 
> My question is not so much about getting ipkg to work (I have found
> several ways), but more about the "proper" way so that I don't go
> "spinning into the grass" in the future.  I noticed that during the
> rootfs build that the "ixp4xxbe" "arch" was not in the ipkg config
> file, so all of my "*_ixp4xxbe.ipk" files were completely ignored -
> stuff like "task-base"!  I ultimately had to append "armv5te" and
> "ixp4xxbe" to PACKAGE_EXTRA_ARCHS and that worked, but I worked on
> this on-and-off for over a week to figure it out.  I really don't
> want to do that again when/if I try to bring up another machine.

That was a bug in the newly rewritten ixp4xx conf which I believe is now
fixed.

> My question is - should I even be attempting to define a new machine
> and including ixp4xxbe.conf in it?  Should I define my own machine by
> copying the contents of ixp4xxbe.conf?  Should I have specified the
> "ixp4xxbe" machine file in my local.conf along with the extra (what I
> think should be) machine config?  Or should I define my own distro
> and put that machine config there?  What is the most appropriate way
> to do this?

Is there anything specific which means that you can't just use the
ixp4xxbe.conf as it is?

I'm willing to work with you to get this right.

-- Rod


