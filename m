Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Me0rO-0004I0-V2
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 08:10:54 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 6F0DA1B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 05:57:33 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 07:52:58 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <20090820032802.GA32010@denix.org>
In-Reply-To: <20090820032802.GA32010@denix.org>
MIME-Version: 1.0
Message-Id: <200908200752.58210.holger+oe@freyther.de>
Subject: Re: Use AUTOREV and have revision/commit number in package name?
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
X-List-Received-Date: Thu, 20 Aug 2009 06:10:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
> All,
>
> I've been playing with AUTOREV for some time now and also asked this
> question before on the IRC, but so far there seems to be no easy solution
> to the problem in subject.
>
> Usually, when a package is built from an SCM repository, SRCREV is set to a
> specific commit#/tag etc. And SRCREV is also usually referenced from PV
> (like PV = "X.Y.Z-scmr${SRCREV}") to have the revision/commit number in the
> package name, to easily track different builds.
>
> Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python
> function, which does the magic of fetching the latest snapshot from a
> repository. But now if PV contains references to SRCREV, it breaks
> (undesrandably), since SRCREV gets resolved in do_fetch and PV needs to be
> resolved early on.
>
> Are there any standard ways to work around this limitation?

Check the mailinglist archives... Openmoko has deployed a solution that has 
fixed that about 1 1/2 years ago.

Short answer:
	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
	- Populate SRCPV with something based on the SRCREV..


z.





