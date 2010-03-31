Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nx4Rz-0002Up-6B
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 22:23:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2VKKRBu017460
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 21:20:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17206-05 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 21:20:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2VKKKho017448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 21:20:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <x2z19c1b8a91003311025w5516e09at69ad3d50134f0380@mail.gmail.com>
References: <1270034881.1681.965.camel@rex>
	<x2z19c1b8a91003311025w5516e09at69ad3d50134f0380@mail.gmail.com>
Date: Wed, 31 Mar 2010 21:20:18 +0100
Message-ID: <1270066818.1681.981.camel@rex>
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
X-List-Received-Date: Wed, 31 Mar 2010 20:23:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-31 at 10:25 -0700, Khem Raj wrote:
> On Wed, Mar 31, 2010 at 4:28 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > To illustrate the kind of thing I mean, have a look at this commit:
> >
> > http://git.openembedded.net/cgit.cgi/openembedded/commit/?h=rpurdie/work-in-progress&id=35481122d7e484fb740ad9440fb4c70cb01de48f
> >
> 
> in one place you removed DEPENDS that may not be correct. Because
> DEPENDS get overwritten in gcc-cross-initial.inc

Ah, I messed up the commits. That bit should have been in the previous
commit where it makes more sense:

http://git.openembedded.net/cgit.cgi/openembedded/commit/?h=rpurdie/work-in-progress&id=ec04a8b72958e616da55e30ec1d731424d77ed9d

> > The nice thing about this is all of a sudden we have all the flags in
> > the same place and it becomes obvious if something is wrong. There are a
> > few things that raise an eyebrow there. It also becomes easier to
> > abstract some of the gcc-X.Y.Z.inc data into a common include file
> > (maybe a gcc-4.3.X.inc for example).
> 
> I this this is a good idea. We could even capture some bugs like in
> some recipes we use EXTRA_OECONF_BASE += and in some EXTRA_OECONF_BASE
> =

Exactly the kind of thing I'd like to catch!

> > Does anyone else fancy helping trying to clean this mess up. I'm happy
> > to review some cleanup patches?
> 
> I plan to do some of this restructuring when I am back from my time
> off in end of april.

Great, any help would be welcome with this kind of thing :)

Cheers

Richard



