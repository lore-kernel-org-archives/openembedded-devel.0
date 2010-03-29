Received: from outrightsolutions.nl ([194.145.201.26]
	helo=mail.outrightsolutions.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sander@3v8.net>) id 1NwCZ9-0000fZ-Vc
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 12:51:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.outrightsolutions.nl (Postfix) with ESMTP id 47D55CA2B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 12:42:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outrightsolutions.nl
Received: from mail.outrightsolutions.nl ([127.0.0.1])
	by localhost (hydrogen.outrightsolutions.nl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Mh+zlgthccOn
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 12:42:22 +0200 (CEST)
Received: from haze.localnet (dhcp-077-248-080-112.chello.nl [77.248.80.112])
	by mail.outrightsolutions.nl (Postfix) with ESMTPSA id B38F2CA216
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 12:42:22 +0200 (CEST)
From: Sander van Grieken <sander@3v8.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 12:42:22 +0200
User-Agent: KMail/1.13.1 (Linux/2.6.31-20-generic; KDE/4.4.1; x86_64; ; )
References: <1269437224.1681.134.camel@rex>
	<ac9c93b11003250045t34d59be1v5f64165f0066c7b7@mail.gmail.com>
	<1269714709.2382.6.camel@gnutoo-desktop>
In-Reply-To: <1269714709.2382.6.camel@gnutoo-desktop>
MIME-Version: 1.0
Message-Id: <201003291242.22230.sander@3v8.net>
X-SA-Exim-Connect-IP: 194.145.201.26
X-SA-Exim-Mail-From: sander@3v8.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reproducible builds (Was Re: Checksums in Bitbake)
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
X-List-Received-Date: Mon, 29 Mar 2010 10:51:32 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Saturday 27 March 2010 19:31:49 GNUtoo wrote:
> On Thu, 2010-03-25 at 08:45 +0100, Frans Meulenbroeks wrote:
> > I've seen too often (also outside OE) that two engineers take the same
> > source yet still get different results, and that bugs at a customer
> > site cannot be reproduced in the lab (and yes, I do know there are
> > other ways to tackle this problem) 
> Also:
> bitbake optionaldep
> bitbake package
> And:
> bitbake package
> 
> could result in different binaries/packages due to configure picking
> optionaldep in the first case and not in the second one.

So, building any of the *-image recipes is non-deterministic, if it pulls in optional deps 
for other recipes? It then comes down to the build-queue ordering, which is probably not 
guaranteed to have a predictable order, especially with a high number of parallel bitbake 
threads.

Sounds like there's a need for something similar to Gentoo's USE flags.

grtz,
Sander


