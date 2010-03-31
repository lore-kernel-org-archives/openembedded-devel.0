Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nwxab-0004QC-4S
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 15:04:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2VD0r6T013280
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 14:00:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13063-04 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 14:00:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2VD0jCB013274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 14:00:48 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <y2oac9c93b11003310445gb3deec55va9bd2664d0336584@mail.gmail.com>
References: <1270034881.1681.965.camel@rex>
	<y2oac9c93b11003310445gb3deec55va9bd2664d0336584@mail.gmail.com>
Date: Wed, 31 Mar 2010 14:00:44 +0100
Message-ID: <1270040444.1681.976.camel@rex>
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
Subject: Re: gcc Recipes
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
X-List-Received-Date: Wed, 31 Mar 2010 13:04:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-31 at 13:45 +0200, Frans Meulenbroeks wrote:
> I share your feeling of discomfort and depression.
> Personally I feel cleaning up should start with removing obsolete &
> unneeded versions as it is pointless spending time on improving them.
> I've tried to stir up the discussion on cleaning up a few times, and
> gave up due to too much negative feedback and little positive
> feedback.
> But still I wonder what is e.g. the use of recipes like 4.1.1 (which
> btw was released in may 2006).

I don't think removing old versions is going to cut it to be honest as
people are attached to them for various reasons. Having them around
isn't really a problem, I'm more concerned about the general sprawl of
the recipes which makes them hard to understand. Its clear some are more
broken than others.

> Having said that:
> I've looked at your commit. Looks fine to me so a +1 & thumbs up.
>
> PS: not sure about all the variants, but it might be nice to be able
> to use something like BBCLASSEXTEND="cross".
> Don't think my pythonese and knowledge of the gcc build system is good
> enough to cook up something though.

Well, the variants are ugly but before we can thing about doing anything
about them using BBCLASSEXTEND they have to be condensed down to:

require gcc_${PV}.bb
inherit someclass

This is another reason to try and focus the details into one place as
perhaps then we'll be able to achieve something like this. Even if we
don't use BBCLASSEXTEND, making large numbers of the files simple boiler
plate will make it easier to understand.

Cheers,

Richard





