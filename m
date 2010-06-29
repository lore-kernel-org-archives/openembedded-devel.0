Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OTjQN-0003zB-8n
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 00:37:04 +0200
Received: from durham.keylevel.com ([109.224.134.115]:27120
	helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OTjLp-0001Xi-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 23:32:22 +0100
Message-Id: <69E07E36-D08B-4CD2-9B79-EF876EE47C52@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim3wnL18BjsIrLiKZC5NRc70UG77N1GtOiISghA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Tue, 29 Jun 2010 23:32:19 +0100
References: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com>
	<AANLkTilmoW3cU9hcM1PbN8-yDTM36uzkNB5CwU8obJf1@mail.gmail.com>
	<92233E3F-2CFC-4F88-A780-1A15D7D94A00@keylevel.com>
	<AANLkTim3wnL18BjsIrLiKZC5NRc70UG77N1GtOiISghA@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hxhsvr03.internetintuitive.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-SA-Exim-Connect-IP: 80.254.228.43
X-SA-Exim-Mail-From: dokuwiki@keylevel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'swapper' process using 100% cpu when system idle
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
X-List-Received-Date: Tue, 29 Jun 2010 22:37:04 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

> on .dev
> well look at the kernel recipe you want
> to go to and add
>
> DEFAULT_PREFERENCE_<yourmachine> = "1"
> you might have to provide defconfig also.


Thanks

I'm getting 2.6.35-rc3 included in the build at the moment (for  
'linux'). I couldn't find a recipe for this and it took me a while to  
work out that it was linux_git.bb that was getting used!

This file has DEFAULT_PREFERENCE = -1. However, it seems as if none of  
the other linux_x.y.z.bb files specify a value for my machine (x86)  
and they all have a DEFAULT_PREFERENCE of -1.

Given this, I now understand why the _git version is being pulled in :-)

Why does the _git version (which I assume gives a 'bleeding edge'  
version) have the same preference value as the recipes for released  
versions? Would setting it to -2  be sensible?

I'll go add a DEFAULT_PREFERENCE_x86 = "1" line to the one I want, as  
per your recommendation and start a rebuild...

Chris



