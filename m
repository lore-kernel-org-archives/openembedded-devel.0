Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NxMwo-0007SK-Bu
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:08:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31G5Rf9023088;
	Thu, 1 Apr 2010 17:05:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22632-08; Thu,  1 Apr 2010 17:05:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o31G5Hcn023073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Apr 2010 17:05:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270136509.6277.97.camel@trini-m4400>
References: <1270135981.4993.128.camel@rex>
	<1270136509.6277.97.camel@trini-m4400>
Date: Thu, 01 Apr 2010 17:05:15 +0100
Message-ID: <1270137915.4993.137.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Lock, Joshua" <joshua.lock@intel.com>
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 16:08:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-04-01 at 08:41 -0700, Tom Rini wrote:
> On Thu, 2010-04-01 at 16:33 +0100, Richard Purdie wrote:
> 
> > * Added relocatable binary processing from Poky for -native binaries 
> >   using chrpath. This isn't enabled for -cross packages due to the 
> >   relative path length problems.
> 
> Is there a reason to not use $ORIGIN here instead?

This *is* using $$ORIGIN. We're just postprocessing to do the injection.

>   The patch Chris
> Larson posted ages ago does get this right (the hard part is
> gcc/gdb/binutils due to the multi configure running).

This class automatically handles all that without having all those
horrible escaped strings that are likely to break each time we change
versions or add new packages.

>   And any path
> length issues you hit with -cross you should be able to hit with
> -native, no?

No, since -native binaries just need to go up to the root of the
staging/ directory as a maximum but the cross directory crosses the
cross/ to staging/ boundary which is a level further.

If we move cross/ into staging/ as is planned, this problem goes away at
that point.

Cheers,

Richard





