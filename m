Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MqB92-0003TQ-WF
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 21:35:28 +0200
Received: from tamarin.localnet (unknown [188.46.248.253])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 716431B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Sep 2009 19:41:27 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Sep 2009 08:45:32 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31; KDE/4.3.1; i686; ; )
References: <1253563660.4551.12.camel@conroy-linux>
In-Reply-To: <1253563660.4551.12.camel@conroy-linux>
MIME-Version: 1.0
Message-Id: <200909220845.32985.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Bitbake filterProviders does not respect sorted priorities
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
X-List-Received-Date: Tue, 22 Sep 2009 19:35:30 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 21 September 2009 22:07:40 Chris Conroy wrote:
> Cross-posting to the OE list since I haven't heard anything from the
> bitbake list after posting this last week. The providers code ignores
> package priorities and as a result unexpected packages can get chosen
> when using overlays with different priority settings.
> 
> Original message posted to bitbake mailing list:
> 
> I am using bitbake 1.8.13 within OE, and I ran into a problem today
> where the wrong package was being selected.
> 
> Digging into the problem, I found that the code that sorts packages does
> not respect the priority order.
> 
> By iterating over sortpkg_pn.keys() instead of pkg_pn.keys(), it
> produces the expected order based on the priorities I have set. Patch
> below:

Thanks again, I had hoped Richard would be able to comment. One of the biggest 
problems with bitbake is that the only regression testing possible is trying 
to build things, your description looks sound.

It would be great if someone could test and I'm happy to apply it then.


holger


