Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1O9nzR-0001Q1-Ez
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 01:26:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o45NN5mt013179
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 May 2010 00:23:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12736-08 for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 00:23:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o45NMwCO013173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 May 2010 00:23:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272999334.2533.18.camel@trini-m4400>
References: <1270135981.4993.128.camel@rex>  <hpum4g$18m$1@dough.gmane.org>
	<1271087957.29304.86.camel@trini-m4400>
	<1271090799.14344.19.camel@localhost.localdomain>
	<1272756595.30647.1942.camel@rex> <1272905195.2931.0.camel@trini-m4400>
	<1272996601.1355.5.camel@rex>  <1272999334.2533.18.camel@trini-m4400>
Date: Thu, 06 May 2010 00:22:56 +0100
Message-ID: <1273101776.5743.39.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Wed, 05 May 2010 23:26:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-05-04 at 11:55 -0700, Tom Rini wrote:
> On Tue, 2010-05-04 at 19:10 +0100, Richard Purdie wrote:
> > On Mon, 2010-05-03 at 09:46 -0700, Tom Rini wrote:
> > > On Sun, 2010-05-02 at 00:29 +0100, Richard Purdie wrote:
> > > > On Mon, 2010-04-12 at 17:46 +0100, Joshua Lock wrote:
> > > > > On Mon, 2010-04-12 at 08:59 -0700, Tom Rini wrote:
> > > > > > On Mon, 2010-04-12 at 10:37 +0200, Koen Kooi wrote:
> > > > >  > Joshuas last 3 commits to poky seem to fix Toms issue with binconfig and
> > > > > > > my issue with chrpath, which only leaves the cross staging lamangler
> > > > > > > stuff to get fixed.
> > > > > > 
> > > > > > Actually (and I'm OK with binconfig stuff being broken in the first
> > > > > > merge) the problem with binconfig junk isn't the file contents, but the
> > > > > > file location.  staging-target-pkg will contain
> > > > > > staging/<host>/usr/bin/<target>/foo-config.  Which means using pstaging
> > > > > > for a target pkg built on 32bit Linux fails when used on 64bit Linux.
> > > > > > Not that I wouldn't mind seeing the binconfig stuff die, just saying
> > > > > > it's a problem today :)
> > > > > 
> > > > > Ah, hmm... yes. That is a problem.
> > > > > 
> > > > > FWIW I don't think you'll get any arguments from the Poky team where the
> > > > > binconfig stuff to suffer an untimely demise!
> > > > 
> > > > FWIW, Poky has had some interesting commits recently that address Tom's
> > > > issue above from Josh.
> > > 
> > > Interesting.  When you killed CROSS_*, did you rework stuff so that gcc
> > > & co's sysroot stuff works automatically or no?  Can't tell off-hand.
> > 
> > What do you mean by "works automatically"?
> 
> gcc & co have certain paths that they look in by default, relative to
> their location (see meta-toolchain.bb, that's not a hard-coded search,
> that's a relocatable one).  The current oe.dev layout of things doesn't
> fit here so we have to pass in --sysroot=... at a minimum and often have
> -isystem for "legacy" reasons.

Ah, right. I haven't attempted this, no. It would really depend on what
the "certain paths" that are hardcoded are and whether we can influence
them at all. Would be worth looking at in due course though.

Cheers,

Richard



