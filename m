Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1P2qL8-0007Yy-Mk
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 21:04:47 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 34519110024C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 21:04:25 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 272C01100212
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 21:04:24 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225004095.adsl.alicedsl.de
	[92.225.4.95]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Oct 2010 21:04:24 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id D2B633C0ED; Mon,  4 Oct 2010 21:04:02 +0200 (CEST)
Date: Mon, 4 Oct 2010 21:04:02 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101004190402.GA22961@rhein.zuhause.netz>
References: <AANLkTikO4fHqYzZJ5PDjmWV9Q3a9tBD_Y+rSs0iO6=5m@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikO4fHqYzZJ5PDjmWV9Q3a9tBD_Y+rSs0iO6=5m@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cups issue
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
X-List-Received-Date: Mon, 04 Oct 2010 19:04:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 04, 2010 at 07:17:05PM +0200, Frans Meulenbroeks wrote:
> No idea who is the maintainer of cups, but I found the following issue:
> 
> /etc/init.d/cups refers to ps ax but if you have busybox installed
> there are no ax options.
> As busybox has configurable columns it does not seem too good to fix
> cups to be able to handle both procps ps and busybox ps.
> Guess the preferred solution is to add a dependency to procps and get
> the real thing.
> 
> However when wanting to make that change I bumped into the following:
> 
> We have 6 cups recipes:
> 
> cups_1.1.23.bb  cups_1.2.12.bb  cups_1.2.7.bb  cups_1.3.8.bb
> cups_1.4.3.bb  cups_1.4.4.bb
> 
> The last three (!) of them have DP = "-1"
> Is there a point in add ing a recipe that has DP = "-1" for a
> prolonged time, then create a new version with DP = -1?
> (btw: and no version is pinned or so).
> 
> Guess this recipe needs some love.
> 
> (btw cups 1.4.4 solves a number of security issues; guess the best way
> forward is to test 1.4.4, then rm the old insecure stuff).
> 
> Frans

Yes, the old ones should go.

Bye Henning


