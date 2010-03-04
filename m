Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NnCp8-00078E-6U
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 16:18:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o24FFvkK032382
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Mar 2010 15:15:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32209-02-3 for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Mar 2010 15:15:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o24FAksH032128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Mar 2010 15:10:47 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267633819.4739.343.camel@trini-m4400>
References: <1267633819.4739.343.camel@trini-m4400>
Date: Thu, 04 Mar 2010 10:18:39 +0000
Message-ID: <1267697919.2259.247.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06, RDNS_DYNAMIC, TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Thu, 04 Mar 2010 15:18:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-03 at 09:30 -0700, Tom Rini wrote:
> As many people know, there's a lot of "odd" internal things that OE
> does, that if we had it to do over, we would do differently.  What I
> would like to propose is that in time for the next stable branch we:
> 1: Define a set of DISTROs/MACHINEs/build targets that need to stay
> working

It was commented at OEDEM that it would be nice to have this magic list.
We still don't have one though.

> 2: In a separate branch (per big change), get one of these big, going to
> leave some stuff broken changes
> 3: Define / document what needs to be done before these branches can be
> merged back (something like #1 is working still, and if applicable a
> guide to the common problems/how to fix people are going to run into).

It makes sense.

> What I'm getting at is that this would let us do things like rework the
> "this is where we place things that we build other recipes with" concept
> so that sysroot just works (and otherwise makes more sense again).  Or
> "let us have more consistency in build with compared to what could end
> up on device".  And so on.
> 
> What do people think?  And what would people work on?

This is the problem, it would be you taking this on, you'd be the person
who needed to fix things, then you would get to merge back. I don't
think we have enough people around that people would volunteer to fix
branches like that.

But by all means prove me wrong.

Cheers,

Richard




