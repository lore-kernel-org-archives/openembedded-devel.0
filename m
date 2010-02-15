Received: from smtpauth20.prod.mesa1.secureserver.net ([64.202.165.36])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1Nh5dY-0002hb-SR
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 19:25:40 +0100
Received: (qmail 7706 invoked from network); 15 Feb 2010 18:22:57 -0000
Received: from unknown (209.242.7.187)
	by smtpauth20.prod.mesa1.secureserver.net (64.202.165.36) with ESMTP;
	15 Feb 2010 18:22:57 -0000
Message-ID: <4B799100.7090203@mwester.net>
Date: Mon, 15 Feb 2010 12:22:56 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100214135613.GF5364@jama>
	<4B79673B.50108@balister.org>	<ac9c93b11002150859i4aa5ee7eid6a648d95fa25d6c@mail.gmail.com>	<20100215171952.GA3233@jama>
	<ac9c93b11002150957r4e9bc0e6tbeb56e62c94e89b0@mail.gmail.com>
In-Reply-To: <ac9c93b11002150957r4e9bc0e6tbeb56e62c94e89b0@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.36
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 18:25:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/2/15 Martin Jansa <martin.jansa@gmail.com>:
>>> Seems a good plan to me, please keep us posted.
>>> (actually I've been considering building in a minimalistic VM)
>> Well VM would be much slower..
> 
> Someone else told me the same today.
> What exactly causes this? I would expect I/O to be the differentiating
> factor as memory access and executing instructions should take the
> same time, shouldn't it?

I build in a VM often, and the difference is not very significant.  In
fact, I can't measure the difference in building SlugOS using the wall
clock.

I also tried placing all of my TMPDIR on a tmpfs on my 8GB RAM system,
and building SlugOS -- again, no difference compared to the normal SATA
hard drive for TMPDIR.

So my conclusion is that I/O is not the bottleneck for my OE builds, and
that's the only area where a VM is significantly different in terms of
performance (at least how I use VMs; perhaps other builds may observe
differences).

Before I ended up on my current contract, which locks me away behind
draconian firewalls, I used to take my autobuilder on the road with me
as a VM, building SlugOS and several of the OpenMoko distros -- I
heartily recommend that solution!

-Mike (mwester)


